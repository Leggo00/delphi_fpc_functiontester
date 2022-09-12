unit uCanKMI;

interface

uses
    Classes, SysUtils, Windows, uCanUnit, Math, Forms, ExtCtrls, ComDrv32;

const
  KMI_FRAME_HEADER = $55;
  MAX_FRAME_COUNT  = 16;
  MAX_BUFF         = 1024;

type
  //----------------------------------------------------------------------------
  // KMI RS232 CAN
  TKmiCAN = class(TCANUnit)
  private
    hwType, hwChannel : Integer;
    m_FilterID : Integer;
    Timer : TTimer;

    
    // RS232용 DATA BUFF.
    Comm : TCommPortDriver;
    nCommMode : Integer;
    bWaitComm : Boolean;
    fStartTime : Double;

    CmdBuff : TStringList;

    // RS232용 Buff..
    TxBuff, RxBuff : array [0..MAX_BUFF] of Byte;
    TxLen, RxLen  : Integer;

    FOnTimer   : procedure (Sender: TObject);

    function    CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
    function    CommRead() : Boolean;
    procedure   OnTimer(Sender: TObject);
    procedure   CommReceiveData(Sender: TObject; DataPtr: Pointer;  DataSize: Cardinal);
  public
    FOnReceive : procedure (Sender : TObject; Idx : Integer);

    constructor Create(HwId, hwChannel : Integer);
    destructor  Destroy;


    function    Open (nChannel : Integer; fBaudrate : Double; Param : String) : Boolean; override;
    procedure   Close(nChannel : Integer);                                               override;
    function    Send (nChannel : Integer; Value : TCanMessage) : Boolean;                override;
    function    Read (nChannel : Integer)  : Integer;                                    override;
    function    Clear(nChannel : Integer) : Boolean;                                     override;

    function    WaitComm(TimeOut : Integer) : Boolean;
  end;

implementation

uses
    GenUtils;

{ TVectorCAN }

//------------------------------------------------------------------------------
constructor TKmiCAN.Create(HwId, hwChannel : Integer);
begin
    inherited Create(hwType, hwId, hwChannel);
    m_FilterID := -1;

    CmdBuff := TStringList.Create;

    // 통신포트를 통적생성한다.
    Comm := TCommPortDriver.Create(Application);
    Comm.ComPortSpeed  := 115200;
    Comm.ComPort       := HWId;
    Comm.OnReceiveData := Self.CommReceiveData;
    Comm.ComPortPollingDelay := 1;
    Comm.Connect;

    Timer := TTimer.Create(Application);
    Timer.OnTimer  := Self.OnTimer;
    Timer.Interval := 10;
    Timer.Enabled  := Comm.Connected;
end;

//------------------------------------------------------------------------------
destructor TKmiCAN.Destroy;
begin
    Timer.Enabled  := False;
    Timer.OnTimer  := nil;
    Timer.Free;

    CmdBuff.Free;

    Comm.Disconnect;
    Comm.Free;
end;

//------------------------------------------------------------------------------
function TKmiCAN.Open(nChannel : Integer; fBaudrate: Double; Param: String): Boolean;
var Buff : array of Byte;
    BTR0, BTR1 : Byte;
    iTemp: Integer;
    nBaudRata: integer;
    i: integer;
begin
    Result := False;
    if not Comm.Connected then exit;

    // Baudrate설정.
    nBaudRata := Round(fBaudRate * 10);
    BTR1 := $7E;
    case nBaudRata of
        5000 : BTR0 := $00;
        2500 : BTR0 := $01;
        1250 : BTR0 := $03;
        1000 : BTR0 := $04;
        833  : BTR0 := $05;
        500  : BTR0 := $09;
        333  : BTR0 := $14;
    else
        Exit;
    end;


    if nChannel = 2 then iTemp := $08
                    else iTemp := $00;

    iTemp := (iTemp or $80);  // Extended Mode;

    SetLength(Buff, 4);
    Buff[0] := nChannel + iTemp + $20;  // Fix Buffer Disable.
    Buff[1] := BTR0;
    Buff[2] := BTR1;
    Buff[3] := 0;       // No Mask.

    CommSend($30, Buff);
end;

//------------------------------------------------------------------------------
procedure TKmiCAN.Close(nChannel : Integer);
var Buff : array of Byte;
begin
    if not (hwChannel in [1,2]) then exit;

    SetLength(Buff, 1 );
    Buff[0] := hwChannel;
    CommSend($31, Buff);
end;

//------------------------------------------------------------------------------
function TKmiCAN.Clear(nChannel : Integer): Boolean;
begin
    //inherited;
    if not( nChannel in [1..2]) then exit;

    CommSend($37, [Byte(nChannel + $04)]); // SEND BUFF CLEAR.
    CommSend($38, [Byte(nChannel + $0C)]); // READ BUFF CLEAR.
end;

//------------------------------------------------------------------------------
function TKmiCAN.Send(nChannel : Integer; Value : TCanMessage): Boolean;
var DataStr : String;
    i, Idx, nInt : Integer;
    CanMsg  : TCANMessage;
    Buff : array of Byte;
    InfoData : Byte;
begin
    if not (nChannel in [1,2]) then exit;

    // EX) Param := '4B0 87 01:0'
    case nChannel of
        1: InfoData := $02;
        2: InfoData := $0A;
    end;
    // 29 Bit 시에는 InfoData
    if (Value.CanID > $7FF) then InfoData := (InfoData or $04);

    if Value.DLC > 0 then
    begin
        SetLength(Buff, Value.DLC + 8 );

        Buff[0] := InfoData;
        Buff[1] := Byte((Value.CanID and $FF000000) shr 24);
        Buff[2] := Byte((Value.CanID and $00FF0000) shr 16);
        Buff[3] := Byte((Value.CanID and $0000FF00) shr 8 );
        Buff[4] := Byte((Value.CanID and $000000FF));
        Buff[5] := Value.DLC;
        for i:= 0 to Value.DLC-1 do
            Buff[i+6] := Value.Data[i];

        // Cycle Time.
        Buff[Idx  ] := Byte((Value.nCycle and $FF00) shr 8);
        Buff[Idx+1] := Byte((Value.nCycle and $00FF));

        CommSend($35, Buff);
    end;
    
//  inherited Send(nChannel, Value);
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
//    RxCount := 0;

    CommSend($33, Buff);
end;


function TKmiCAN.CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
var i, nCount : Integer;
    Str : String;
    CheckSum : Byte;
    nTimeOut : Integer;
    SendBuff : array[0..300] of Byte;
begin
    Result := False;

    SendBuff[0] := KMI_FRAME_HEADER;    // HEADER.
    SendBuff[1] := 1;                   // Card ID
    SendBuff[2] := Cmd;                 // Command.

    nCount := 4;
    for i:= Low(Buff) to High(Buff) do begin
        SendBuff[nCount] := Buff[i];
        Inc(nCount);
        if nCount > High(SendBuff)-2 then break;
    end;
    SendBuff[3] := nCount - 4;         // DataLen;

    // CHECK SUM을 계산한다.
    CheckSum := 0;
    for i:= 0 to nCount-1 do
        CheckSum := Byte(CheckSum + SendBuff[i]);

    SendBuff[nCount] := CheckSum;
    Inc(nCount);

    if {(True)}(False) then begin
        // 직접보내지 않고. Buff에 넣는다.
        Str := MakeHexaString(@SendBuff[0], nCount);
        CmdBuff.Add(Str);
    end else begin
        Timer.Enabled := False;
        for i := 0 to nCount-1 do
            TxBuff[i] := SendBuff[i];

        RxLen := 0;
        TxLen := nCount;
        fStartTime := GetTickCountEx;
        bWaitComm := True;
        nCommMode := 1;

        Comm.FlushBuffers(True, True);
        Comm.SendData(@SendBuff[0], TxLen);

        // while (GetTickCountEX - fStartTime < 200) do begin

        while (bWaitComm) do begin
            OnTimer(nil);
            Application.ProcessMessages;
        end;
        bWaitComm := False;

        // 통신응답속도가 어느정도인지
        // WriteDebugStr(Format('%f', [GetTickCountEX - fStartTime]));
    end;
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
    if RxBuff[0] <> KMI_FRAME_HEADER then exit;
    if TxBuff[2] + $80 <> RxBuff[2]  then exit;

    case TxBuff[2] of
        //------------------------------
        // CAN CONNECT...
        $30 : begin
            nChannel := (TxBuff[4] and $03);
            if not (nChannel in [1,2]) then exit;

            FConnected[nChannel] := True;
        end;
        //------------------------------
        // CAN DISCONNECT
        $31 : begin
            nChannel := (TxBuff[4] and $03);
            if not (nChannel in [1,2]) then exit;

            FConnected[nChannel] := False;
        end;
        //------------------------------
        // CAN READ
        $33 : begin
            nChannel := (TxBuff[4] and $03);
            if not (nChannel in [1,2]) then exit;

            nCount := RxBuff[5];    // Frame Count;

            RxCount := 0;
            nMsgCount := 0;
            Idx := 6;
            while (Idx < RxLen-1) do
            begin
                RxMessages[nMsgCount].DLC   := (RxBuff[Idx+0] and $0F);
                RxMessages[nMsgCount].CanID := (RxBuff[Idx+1]*$1000000 + RxBuff[Idx+2]*$10000 +
                                                RxBuff[Idx+3]*$100     + RxBuff[Idx+4]        );

                if (RxMessages[nMsgCount].DLC > 8) or (RxMessages[nMsgCount].CanID < 0) then break;
                Idx := Idx + 5;

                for i:= 0 to RxMessages[nMsgCount].DLC-1 do begin
                    RxMessages[nMsgCount].Data[i] := RxBuff[Idx];
                    Inc(Idx);
                end;

                RxMessages[nMsgCount].nCycle := 0;
                RxMessages[nMsgCount].TimeStamp := RxBuff[Idx+0]*256 + RxBuff[Idx+1]; //GetTickCountEx;
                Idx := Idx + 2;

                nMsgCount := nMsgCount + 1;
            end;
            RxCount := nMsgCount;
        end;
        //------------------------------
        // CAN SEND
        $35 : begin

        end;
        //------------------------------
        // SEND BUFF CLEAR
        $37 : begin

        end;
        //------------------------------
        // READ BUFF CLEAR
        $38 : begin

        end;
    end;
    Result := True;
end;

procedure TKmiCAN.OnTimer(Sender: TObject);
var Str, RdStr, SendStr, ReceiveStr : String;
    i, nPort, nLength : Integer;
    fTime : double;
begin
    Timer.Enabled := False;

    while True do begin
    case nCommMode of
        //----------------------------------------------------------------------
        0: begin // Cmd Buff에 처리할 내용이 있으면 데이터 전송.
            if CmdBuff.Count > 0 then begin
                SendStr := CmdBuff[0];
                CmdBuff.Delete(0);

                TxLen := 0;
                RdStr := SendStr;
                while (RdStr <> '') do begin
                    Str := GetTokenTrim(RdStr, ' ');
                    if Str <> '' then begin
                        TxBuff[TxLen] := HexToIntDef(Str, 0);
                        Inc(TxLen);
                    end;
                end;

                if (TxLen > 0) then begin
                    Comm.FlushBuffers(True, True);

                    RxLen := 0;
                    bWaitComm := True;
                    fStartTime := GetTickCountEx;

                    Comm.SendData(@TxBuff[0], TxLen);
                    Inc(nCommMode);
                end;
            end;
            break;
        end;
        //----------------------------------------------------------------------
        1: begin  // 데이터 응답 대기
            // 데이터가 전체 FRAME이 전부 들어왔는지 확인.
            if (RxLen > 4) then begin

                if (RxBuff[2] = ($33 + $80)) then
                   nLength := RxBuff[3]*256 + RxBuff[4] + 5
                else
                   nLength := RxBuff[3] + 5;

                if (RxBuff[0] = KMI_FRAME_HEADER) and (RxLen >= nLength) then
                begin
                    bWaitComm := False;
                    Inc(nCommMode);
                    break;
                end;
            end;

            // TIME OUT 200 ms로 처리. 200ms면 충분하다..
            if (GetTickCountEx - fStartTime > 200) then begin
                Inc(nCommMode);
            end;
            break;         
        end;
        //----------------------------------------------------------------------
        2: begin    // 응답완료 데이터 Encoding
            // 응답데이타가 들어옴.
            if (not bWaitComm) then
            begin
                // 정상적인 응답인 경우.
                if (RxBuff[2] =  TxBuff[2] + $80) then begin
                    Timer.Tag := 1;
                    //ReceiveStr := 'RECEIVE OK!';
                end else
                  Timer.Tag := 0;
                  // ReceiveStr := 'RECEIVE ERROR!';

                CommRead;
            end else begin
                Timer.Tag := -1;
              // ReceiveStr := '* TIME-OUT *';
            end;

            if Assigned(FOnReceive) then
              FOnReceive(Sender, Timer.Tag);

            bWaitComm := False;
            nCommMode := 0;
            RxLen := 0;
            break;
        end;
        //----------------------------------------------------------------------
    end;
    end;

    Timer.Enabled := True;
end;


procedure TKmiCAN.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var i : Integer;
begin
    for i:=0 to DataSize-1 do
    begin
        RxBuff[RxLen] := Byte( (PChar(DataPtr) + i)^ );
        Inc(RxLen);
        if RxLen >= MAX_BUFF then RxLen := 0;
    end;

    // 데이터가 들어오면 바로 Timer이벤트를 실행한다.
    OnTimer(Sender);
end;

function TKmiCAN.WaitComm(TimeOut : Integer) : Boolean;
var i, nTime : Integer;
begin
    Result := False;
    nTime := GetTickCount;
    while (GetTickCount - nTime < TimeOut) do begin
        if not bWaitComm then begin
            Result := True;
            break;
        end;
        Application.ProcessMessages;
    end;
end;



end.

