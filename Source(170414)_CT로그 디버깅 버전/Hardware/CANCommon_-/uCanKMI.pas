unit uCanKMI;

interface

uses
    Classes, SysUtils, Windows, uCanUnit, Math, Forms, ExtCtrls, ComDrv32, SyncObjs;

const
  KMI_FRAME_HEADER = $55;
  MAX_FRAME_COUNT  = 16;
  MAX_BUFF         = 2048;

type
  //----------------------------------------------------------------------------
  // KMI RS232 CAN
  TKmiCAN = class(TCANUnit)
  private
    hwType, hwChannel : Integer;
    m_FilterID : Integer;

    // RS232용 DATA BUFF.
    Comm : TCommPortDriver;
    nCommMode : Integer;
    nBDVersion : Integer;
    FSendLock  : TCriticalSection;

    bExtendedMode : Boolean;
    bEchoMode     : Boolean;      // 485시 EchoMode.
    bPollingMode  : Boolean;

    // RS232용 Buff..
    TxBuff, RxBuff : array [0..MAX_BUFF] of Byte;
    TxLen, RxLen  : Integer;

    function    CommRead() : Boolean;
    procedure   CommReceiveData(Sender: TObject; DataPtr: Pointer; DataSize: Cardinal);
  public
    constructor Create;
    destructor  Destroy; override;
    function    CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;

    function    OpenDevice(HwPort, HwId : Integer) : Boolean;                            override;
    function    CloseDevice : Boolean;                                                   override;
    function    Config(nChannel : Integer; Param  : String) : Boolean;                   override;

    function    Open (nChannel : Integer; fBaudrate : Double; Param : String) : Boolean; override;
    function    Close(nChannel : Integer) : Boolean;                                     override;
    function    Send (nChannel : Integer; Value : TCanMessage) : Boolean;                override;
    function    Read (nChannel : Integer)  : Integer;                                    override;
    function    Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;  override;

    function    ResetTime(nChannel : Integer) : Boolean;
  end;

implementation

uses
    GenUtils;

{ TVectorCAN }

//------------------------------------------------------------------------------
constructor TKmiCAN.Create;
begin
    inherited Create;

    m_FilterID := -1;

    bExtendedMode := True;
    bEchoMode     := False;      // 485시 EchoMode.
    bPollingMode  := False;

    // 통신포트를 통적생성한다.
    Comm := TCommPortDriver.Create(Application.MainForm);    // <- 아래 Free안되는 문제 해결.
    Comm.OnReceiveData := CommReceiveData;

    FSendLock := TCriticalSection.Create;
end;

//------------------------------------------------------------------------------
destructor TKmiCAN.Destroy;
begin
    try
        FSendLock.Free;
        if Assigned(Comm) then begin
            Comm.Disconnect;
            Comm.OnReceiveData := nil;
            Comm.Free;  //<- 이상하게 Error가 발생한다.
        end;
    except on E:Exception do
       WriteDebugStr ('Error on TCANUnit.Destroy :' + E.Message);
    end;

    inherited;
end;

//------------------------------------------------------------------------------
// KMI CAN 설정부분.
function  TKmiCAN.Config(nChannel : Integer; Param  : String) : Boolean;
var TmpList : TStringList;
    Str : String;
begin
    TmpList := TStringList.Create;
    try
        TmpList.Text := ReplaceStr(Param, ';', CRLF);

        // SOFTWARE MASK...
        Str := TmpList.Values['MASKID'];
        m_FilterID := HexToIntDef(Str, -1);

        // POLLING
        Str := TmpList.Values['POLLING'];
        bPollingMode  := (Str = '1') or (Str = 'ON');
        
    finally
        TmpList.Free;
    end;
end;

//------------------------------------------------------------------------------
function TKmiCAN.OpenDevice(HwPort, HwId : Integer) : Boolean;
begin
    Inherited OpenDevice(HwPort, HwId);

//  if bExtendedMode then Comm.ComPortSpeed  := 921600    // 485버젼..
//                   else Comm.ComPortSpeed  := 115200;

    Comm.Disconnect;
    Comm.ComPortSpeed  := 115200;
    Comm.ComPort       := HwPort;
    Comm.Connect;
    Result := Comm.Connected;

    HWInfo.Clear;
    nBDVersion := 0;

    if (Result) then begin
        CommSend($39, [0]);
        HWInfo.Add(Format('KMI CAN Board : Ver %d.%d', [nBDVersion div 16, nBDVersion mod 16] ));
    end;
end;

//------------------------------------------------------------------------------
function TKmiCAN.CloseDevice : Boolean;
begin
    inherited CloseDevice;

    Comm.Disconnect;
end;

//------------------------------------------------------------------------------
function TKmiCAN.Open(nChannel : Integer; fBaudrate: Double; Param: String): Boolean;
var Buff : array of Byte;
    BTR0, BTR1 : Byte;
    iTemp: Integer;
    nBaudRata: integer;
    i, j, Idx: integer;
    StrList : TStringList;
    Str, sMask : String;
    CanID, nMaskCount: integer;
begin
    Result := False;
    if not Comm.Connected then exit;
    if not (nChannel in [1,2]) then exit;

    StrList := TStringList.Create;

    // Baudrate설정.
    nBaudRata := Round(fBaudRate * 10);
    try
        // 옵션처리하기 위해...
        StrList.Text := ReplaceStr(Param, ',', CRLF);

        if nBaudRata > 5000 then
        begin
            BTR1 := $54;
            BTR0 := $00;
        end else
        begin
            BTR1 := $7E;
            case nBaudRata of
                5000 : BTR0 := $00;
                2500 : BTR0 := $01;
                1250 : BTR0 := $03;
                1000 : BTR0 := $04;
                833  : BTR0 := $05;
                500  : BTR0 := $09;
                333  : BTR0 := $14;
            end;
        end;

        

        // Param 옵션처리..
        Str := StrList.Values['BTR0']; if (Str <> '') then BTR0 := HexToIntDef(Str, 0);
        Str := StrList.Values['BTR1']; if (Str <> '') then BTR1 := HexToIntDef(Str, 0);

        // 트랜시버 제어.
        if fBaudrate <= 125 then iTemp := $08  // LowSpeed
                            else iTemp := $00; // HighSpeed

        // if bExtendedMode then iTemp := (iTemp or $80);  // Extended Mode 나중에삭제..

        Str := StrList.Values['MASK'];
        if Str = '' then
        begin
            SetLength(Buff, 4);
            Buff[0] := nChannel + iTemp + $20;  // Fix Buffer Disable.
            Buff[1] := BTR0;
            Buff[2] := BTR1;
            Buff[3] := 0;     // No Mask.
        end
        else begin
            sMask := '';
            nMaskCount := 0;
            while (Str <> '') do begin
                CanID   := HexToIntDef(GetToken(Str, ':'), -1);
                if CanID >= 0 then begin
                    sMask := sMask + Format('%x,', [CanID]);
                    Inc(nMaskCount);
                end;
            end;

            SetLength(Buff, 4 + (4 * nMaskCount) );
            Buff[0] := nChannel + iTemp + $20;  // Fix Buffer Disable.
            Buff[1] := BTR0;
            Buff[2] := BTR1;

            Buff[3] := nMaskCount; // Mask Count.
            Idx := 4;
            for j := 1 to nMaskCount do begin
                CanID   := HexToIntDef(GetToken(sMask, ','), 0);
                Buff[Idx+0] := Byte((CanID and $FF000000) shr 24);
                Buff[Idx+1] := Byte((CanID and $00FF0000) shr 16);
                Buff[Idx+2] := Byte((CanID and $0000FF00) shr 8 );
                Buff[Idx+3] := Byte((CanID and $000000FF));
                Idx := Idx + 4;
            end;
        end;
        Result := CommSend($30, Buff);

        FConnected[nChannel] := Result;
        fStartTime := GetTickCountEX;
    finally
        StrList.Free;
    end;
end;

//------------------------------------------------------------------------------
function TKmiCAN.Close(nChannel : Integer) : Boolean;
var Buff : array of Byte;
begin
    inherited Close(nChannel);

    Result := False;
    if not ( nChannel in [1,2]) then exit;

    SetLength(Buff, 1 );
    Buff[0] := hwChannel;
    Result := CommSend($31, Buff);

    FConnected[nChannel] := False;
end;

//------------------------------------------------------------------------------
function TKmiCAN.Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;
var Buff : array[0..4] of Byte;
    Param : Byte;
begin
    inherited Clear(nChannel, bTxMsg, bRxMsg, CANId);

    if not( nChannel in [1,2]) then exit;

    if (CanID >= 0) then begin
        Buff[0] := Byte(nChannel);
        Buff[1] := Byte((CanID and $FF000000) shr 24);
        Buff[2] := Byte((CanID and $00FF0000) shr 16);
        Buff[3] := Byte((CanID and $0000FF00) shr 8 );
        Buff[4] := Byte((CanID and $000000FF));

        // 특정ID를 제거한다.
        Result := CommSend($37, Buff);
    end else
    begin
        // 전체버퍼를 All Clear.
        Param := $01;
        if bRxMsg then Param := Param + $02;
        if bTxMsg then Param := Param + $04;
        Result := CommSend($36, [Param]); // ($01=Timer Reset, $02=RX Reset, $04=Tx Reset);
    end;
    // CommSend($38, [Byte(nChannel + $0C)]); // READ BUFF CLEAR.
end;

//------------------------------------------------------------------------------
function TKmiCAN.Send(nChannel : Integer; Value : TCanMessage): Boolean;
var DataStr : String;
    i, Idx : Integer;
    Buff : array of Byte;
    InfoData : Byte;
begin
    Result := False;
    if not (nChannel in [1,2]) then exit;
    if (Value.CanID < 0) then exit;

    // EX) Param := '4B0 87 01:0'
    case nChannel of
        1: InfoData := $02;   // 0000 0010
        2: InfoData := $0A;   // 1010 0000
    end;
    // 29 Bit 시에는 InfoData
    if (Value.CanID > $7FF) then InfoData := (InfoData or $04);  // xxxx 1xxx

    if (Value.DLC in [0..8]) then
    begin
        SetLength(Buff, Value.DLC + 8 );

        try
            Buff[0] := InfoData;
            Buff[1] := Byte((Value.CanID and $FF000000) shr 24);
            Buff[2] := Byte((Value.CanID and $00FF0000) shr 16);
            Buff[3] := Byte((Value.CanID and $0000FF00) shr 8 );
            Buff[4] := Byte((Value.CanID and $000000FF));
            Buff[5] := Value.DLC;

            Idx := 6;
            for i:= 0 to Value.DLC-1 do begin
                Buff[Idx] := Value.Data[i];
                Inc(Idx);
            end;

            // Cycle Time.
            Buff[Idx  ] := Byte((Value.nCycle and $FF00) shr 8);
            Buff[Idx+1] := Byte((Value.nCycle and $00FF));
        except
        end;

        Result := CommSend($35, Buff);
        SetLength(Buff, 0);
    end;

    inherited Send(nChannel, Value);
end;

//------------------------------------------------------------------------------
function TKmiCAN.Read(nChannel : Integer) : Integer;
var Buff : array[0..5] of Byte;
begin
    Result := 0;
    Buff[0] := nChannel + $08;   // Queue buffer.
    Buff[1] := MAX_FRAME_COUNT;  // 최대 Buff Count개 단위로 읽음. 최대크기.

    if m_FilterID >= 0 then begin
        Buff[0] := Buff[0] + $10;
        Buff[2] := Byte((m_FilterID and $FF000000) shr 24);
        Buff[3] := Byte((m_FilterID and $00FF0000) shr 16);
        Buff[4] := Byte((m_FilterID and $0000FF00) shr 8 );
        Buff[5] := Byte((m_FilterID and $000000FF));
    end else
    begin
        Buff[2] := 0;                // No ID Mask.
        Buff[3] := 0;
        Buff[4] := 0;
        Buff[5] := 0;
    end;

    FBuffCount := 0;
    try

        if not CommSend($33, Buff) then exit;
    except
    end;

    Result := BuffCount;

    inherited Read(nChannel);
end;

var nOnOff : Byte;
//------------------------------------------------------------------------------
function TKmiCAN.ResetTime(nChannel : Integer) : Boolean;
var Buff : array[0..5] of Byte;
begin
//    Result := CommSend($36, [ Byte(nChannel)] );


    if nOnOff = 1 then nOnOff := 0 else nOnOff:= 1;
    Result := CommSend($34, [nOnOff] );
    fStartTime := GetTickCountEX;
end;

//------------------------------------------------------------------------------
function TKmiCAN.CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
var i, nCount, nReadCount : Integer;
    CheckSum : Byte;
    DataPtr : pchar;
    fTime, fFrameTime : Double;
begin
    Result := False;
    if not Comm.Connected then exit;

    FSendLock.Enter;
    try
        DataPtr := @RxBuff[0];
    
        TxBuff[0] := KMI_FRAME_HEADER;    // HEADER.
        TxBuff[1] := 1;                   // Card ID
        TxBuff[2] := Cmd;                 // Command.

        //    if (bExtendedMode) then TxBuff[1] := (TxBuff[1] or $08);

        nCount := 4;
        for i:= Low(Buff) to High(Buff) do begin
            TxBuff[nCount] := Buff[i];
            Inc(nCount);
            if nCount > High(TxBuff)-2 then break;
        end;
        TxBuff[3] := nCount - 4;         // DataLen;

        // CHECK SUM을 계산한다.
        CheckSum := 0;
        for i:= 0 to nCount-1 do
            CheckSum := Byte(CheckSum + TxBuff[i]);

        TxBuff[nCount] := CheckSum;
        Inc(nCount);
        TxLen := nCount;

        Comm.FlushBuffers(True, True);
        if (not bPollingMode) then Comm.PausePolling;

        //================================
        // 전송부분 RTS Control/
        fFrameTime := TxLen * (10000 / Comm.ComPortSpeed);   // 전송시간을 계산한다.
        fTime := GetTickCountEX;  // <- 전송시작시간.
        
        //    Comm.ToggleRTS(True);
        Comm.SendData(@TxBuff[0], TxLen);
        //    while (GetTickCountEx - fTime <= fSendTime) do;
        //    Comm.ToggleRTS(False);
        //================================

        RxLen := 0;
        if (bPollingMode) then begin
            if (bEchoMode) then RxLen := -TxLen;  // Echo 를 없애기 위해..
            Result := True;
            exit;   // 폴링모드일경우 응답기다리지 않고 나간다.
        end;

        // 전송시간동안은 대기해서 CPU부하를 줄인다.  2010.03.06. 정성일
        while (GetTickCountEx - fTime <= (fFrameTime * 2)) do Sleep(1);

        // Echo Mode인경우 Feedback data 제거.
        bEchoMode := False;
        if (bEchoMode) then begin
            nCount := Comm.ReadData(DataPtr, TxLen);
            if (nCount <> TxLen) then exit;
        end;

        //  헤더부분문 읽는다.
        if (bExtendedMode) then nReadCount := 5  // Heder(1) + ID(1) + Cmd(1) + Len(2)
                           else nReadCount := 4; // Heder(1) + ID(1) + Cmd(1) + Len(1);

        Comm.InputTimeout := 100;  // Input Timeout 100ms..
        nCount := Comm.ReadData(DataPtr, nReadCount);

        // 헤더가 틀린경우
        if (nCount    <> nReadCount      ) or
           (RxBuff[0] <> KMI_FRAME_HEADER) or
           (RxBuff[1] <> TxBuff[1]       ) then
        begin
           // WriteDebugStr('KMI CAN FRAME Error : ' + MakeHexaString(@RxBuff[0], RxCount));
            exit;
        end;

        RxLen   := RxLen + nCount;
        DataPtr := DataPtr + nCount;

        //  CAN READ인경우 DataLength가 2Byte 나머지 데이터를 읽는다.
        if (bExtendedMode) then nReadCount := RxBuff[3]*256 + RxBuff[4] + 1
                           else nReadCount := RxBuff[3] + 1;

        Comm.InputTimeout := 300;  // Input Timeout 300ms..

        nCount := Comm.ReadData(DataPtr, nReadCount);
        RxLen := RxLen + nCount;

        if (not bPollingMode) then Comm.ContinuePolling;

        // 데이터  Size정상.
        if (nCount >= nReadCount) then
        begin
            // CheckSum을 확인한다. 2010.12.20.
            CheckSum := 0;
            for i:= 0 to RxLen-2 do
                CheckSum := Byte(CheckSum + RxBuff[i]);

            if CheckSum <> RxBuff[RxLen-1] then begin
                WriteDebugStr('KMICAN 232 CheckSum Error : ' + MakeHexaString(@RxBuff[0], RxLen));
                exit;
            end;

            Result := CommRead();
        end;

    finally
        FSendLock.Leave;
    end;
end;

//------------------------------------------------------------------------------
procedure TKmiCAN.CommReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Cardinal);
var i, nReadCount : Integer;
begin
    for i:=0 to DataSize-1 do begin
        if (RxLen >= 0) and (RxLen < High(RxBuff)) then
            RxBuff[RxLen] := Byte((PChar(DataPtr) + i)^);
        Inc(RxLen);
    end;

    //  CAN READ인경우 DataLength가 2Byte 나머지 데이터를 읽는다.
    if (bExtendedMode) then nReadCount := 5 + (RxBuff[3]*256 + RxBuff[4] + 1) // Heder(1) + ID(1) + Cmd(1) + Len(2) + DataLen(N)
                       else nReadCount := 4 + RxBuff[3] + 1;                  // Heder(1) + ID(1) + Cmd(1) + Len(1) + DataLen(N)

    if (RxLen >= nReadCount) then
        CommRead();
end;

//------------------------------------------------------------------------------
// 읽은데이터를 분석한다.
function TKmiCAN.CommRead() : Boolean;
var Cmd : Byte;
    i, Idx, nChannel, nCount, nMsgCount : Integer;
    StrList : TStrings;
    Str : String;
    ReceiveStr : String;
begin
    Result := False;
    if (TxBuff[2] + $80 <> RxBuff[2]) then begin

        if TxBuff[2] = $33 then FBuffCount := 0;
        exit;  //  Positive 응답인지 확인.
    end;

    case TxBuff[2] of
        //------------------------------
        // CAN CONNECT...
        $30 : begin
            nChannel := (TxBuff[4] and $03);
            if not (nChannel in [1,2]) then exit;
            Result := True;
        end;
        //------------------------------
        // CAN DISCONNECT
        $31 : begin
            nChannel := (TxBuff[4] and $03);
            if not (nChannel in [1,2]) then exit;
            Result := True;
        end;
        //------------------------------
        // CAN READ
        $33 : begin
            FBuffCount := 0;
            nChannel := (TxBuff[4] and $03);

            if not (nChannel in [1,2]) then exit;

            nCount := RxBuff[5]; // Message Count;
            if nCount < 1 then exit;

            if not bExtendedMode then Idx := 5
                                 else Idx := 6;

            Lock;
            try
                while (Idx < RxLen-1) do
                begin
                    BuffMessage[BuffCount].DLC   := (RxBuff[Idx+0] and $0F);
                    BuffMessage[BuffCount].CanID := (RxBuff[Idx+1]*$1000000 + RxBuff[Idx+2]*$10000 +
                                                    RxBuff[Idx+3]*$100     + RxBuff[Idx+4]        );

                    if (BuffMessage[BuffCount].DLC > 8) or (BuffMessage[BuffCount].CanID < 0) then break;
                    Idx := Idx + 5;

                    for i:= 0 to BuffMessage[BuffCount].DLC-1 do begin
                        BuffMessage[BuffCount].Data[i] := RxBuff[Idx];
                        Inc(Idx);
                    end;

                    BuffMessage[BuffCount].nCycle := 0;
                    if bExtendedMode then begin
                        BuffMessage[BuffCount].TimeStamp := RxBuff[Idx+0]*256 + RxBuff[Idx+1];
                         // + (Trunc(GetTickCountEx - fStartTime) div $10000) * $10000;

                        Idx := Idx + 2;
                    end else
                        BuffMessage[BuffCount].TimeStamp := GetTickCountEx - fStartTime;


                    BuffMessage[BuffCount].nChannel := 1;
                    FBuffCount := FBuffCount + 1;
                end;
            finally
                UnLock;
            end;

            Result := True;
            // Base Class의 Read를 호출한다.
            // inherited Read(nChannel);
        end;
        //------------------------------
        // CAN SEND
        $35 : begin
            Result := True;
        end;
        //------------------------------
        // RESET TIMER
        $36 : begin
            Result := True;
        end;
        //------------------------------
        // SEND BUFF CLEAR
        $37 : begin
            Result := True;
        end;
        //------------------------------
        // READ BUFF CLEAR
        $38 : begin
            Result := True;
        end;
        //------------------------------
        // VERSION.
        $39 : begin
            nBDVersion := RxBuff[5];
            Result := True;
        end;
    end;
end;

end.

