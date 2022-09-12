unit uCanUnit;

interface

uses
    Classes, SysUtils, Windows, SyncObjs;

const
    MAX_CAN_DATA_LEN = 8;
    MAX_TX_BUFF      = 100;   // 동시전송 메세지수.
    MAX_RX_BUFF      = 100;   // 동시전송 메세지수.
    MAX_BUFF         = 2047;  //

    MAX_CAN_CHANNEL  = 2;

const
    CAN_INTEL    = $00;
    CAN_MOTOROLA = $01;

    CAN_UNSIGNED = $00;
    CAN_SIGNED   = $02;


    // CAN CARD TYPE..
    KMI_CAN        = 0;
    VECTOR_CANCASE = 1;
    INVALID_CANID  = -1;

type
  //----------------------------------------------------------------------------
  // CAN Message 구조.
  TCANMessage = record
    CANId      : Integer;
    DLC        : Byte;
    Data       : array[0..MAX_CAN_DATA_LEN-1] of Byte;
    nCycle     : LongWord;  // 전송주기 ms단위.
    TimeStamp  : Double;    // TimeStamp 는 ms단위.
    nChannel   : Integer;   // 채널정보.
  end;
  PTCANMessage = ^TCANMessage;

  //----------------------------------------------------------------------------
  // CAN UNIT의 기초 Class Unit.  CAN관련하여는 다음과 같은 Class를 상속하여 만든다.
  TCANUnit = class
  private
    FLockCount : Integer;
    m_Critical : TCriticalSection;

    FReadThread : TThread;
    FSendThread : TThread;

  protected
    hwPort, hwId : Integer;
    m_ChannelCount : Integer;

    FDeviceOpened : Boolean;
    FConnected  : array[1..MAX_CAN_CHANNEL] of Boolean;
    FTxCount, FRxCount, FBuffCount : Integer;
    FReadPolling : Integer;
    FSendPolling : Integer;
  public
    HWInfo : TStringList;
    fStartTime : Double;

    TxMessages   : array[0..MAX_TX_BUFF] of TCANMessage;
    RxMessages   : array[0..MAX_RX_BUFF] of TCANMessage;
    BuffMessage  : array[0..MAX_BUFF] of TCANMessage;

    OnMessageRead : procedure (Sender : TObject) of object;

    constructor Create;
    destructor  Destroy; override;                                                               

    function    OpenDevice(HwPort, HwId : Integer) : Boolean;                            virtual;
    function    CloseDevice : Boolean;                                                   virtual;
    function    Config(nChannel : Integer; Param  : String) : Boolean;                   virtual;

    function    Open (nChannel : Integer; fBaudrate : Double; Param : String) : Boolean; virtual;
    function    Close(nChannel : Integer) : Boolean;                                     virtual;
    function    Send (nChannel : Integer; Value : TCanMessage) : Boolean;                virtual;
    function    Read (nChannel : Integer) : Integer;                                     virtual;
    function    Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;  virtual;

    // Thread 동작용.
    procedure   Lock;
    procedure   UnLock;
    function    IsLock : Boolean;
    procedure   PauseReadPolling;
    procedure   ContinueReadPolling;
    procedure   PauseSendPolling;
    procedure   ContinueSendPolling;

    // Buff 관리용.
    property    TxCount   : Integer read FTxCount;
    property    RxCount   : Integer read FRxCount;
    property    BuffCount : Integer read FBuffCount;

    property    DeviceOpened : Boolean read FDeviceOpened;
  end;

  //----------------------------------------------------------------------------
  // CAN Message의 송/수신을 담당하는 Class
  TCANSendThread = class(TThread)
  private
    CanUnit : TCanUnit;
  protected
    procedure Execute; override;
    constructor Create(Parent : TObject);
  public
    Enabled : Boolean;
  end;

  TCANReadThread = class(TThread)
  private
    CanUnit : TCanUnit;
    FReadEvent : TEvent;
    procedure OnReadEvent;
  protected
    procedure   Execute; override;
    constructor Create(Parent : TObject);
  public
    Enabled : Boolean;
  end;

  // CAN Message record 를 String으로 변경한다.
  function StrToCanMsg(Param : String) : TCanMessage;
  function CanMsgToStr(Msg : TCanMessage) : String;

  function SetCANValue(var CanMsg : TCANMessage; nStartBit, nBitLen, nValue : Integer; Option : Integer = 0) : Boolean;
  function GetCANValue(var CanMsg : TCANMessage; nStartBit, nBitLen : Integer; Option : Integer = 0) : Integer;

implementation

uses
    GenUtils;

//    CAN BIT는 다음과 같이 순서로 정의.   StartBit는 항상 LSB를 가르킨다.
//    +---+---+---+---+---+---+---+---+
//  0 |  7|  6|  5|  4|  3|  2|  1|  0|
//  1 | 15| 14| 13| 12| 11| 10|  9|  8|
//  2 | 23| 22| 21| 20| 19| 18| 17| 16|
//  3 | 31| 30| 29| 28| 27| 26| 25| 24|
//  4 | 39| 38| 37| 36| 35| 34| 33| 32|
//  5 | 47| 46| 45| 44| 43| 42| 41| 40|
//  6 | 55| 54| 53| 52| 51| 50| 49| 48|
//  7 | 63| 62| 61| 60| 59| 58| 57| 56|
//    +---+---+---+---+---+---+---+---+

//------------------------------------------------------------------------------
// CAN Message를 Bit로 계산한다.
function SetCANValue(var CanMsg : TCANMessage; nStartBit, nBitLen, nValue : Integer; Option : Integer = 0) : Boolean;
var i : Integer;
    nByte, nBit, nInc : Integer;
    bSigned, bInvert : Boolean;    
begin
    Result := False;
    if CanMsg.CanID < 0 then exit;

    bSigned := (Option and CAN_SIGNED  ) <> 0;
    bInvert := (Option and CAN_MOTOROLA) <> 0;

    // 시작비트로 Byte 위치와 Bit위치 판단.
    nByte := (nStartBit div 8);
    nBit  := (nStartBit mod 8);
    
    if (bInvert) then nInc := -1 else nInc := 1;

    for i:= 0 to nBitLen-1 do
    begin
        if not (nByte in [0..7]) then break;

        if ((nValue and (1 shl i)) <> 0) then
            CanMsg.Data[nByte] := CanMsg.Data[nByte] or (1 shl nBit)              // 비트를 1로 Set
        else
            CanMsg.Data[nByte] := CanMsg.Data[nByte] and (not Byte(1 shl nBit));  // 비트를 0으로 Set.

        nBit := nBit + 1;
        if (nBit > 7) then begin
            nByte := nByte + nInc;
            nBit := 0;
        end;
    end;
    Result := True;
end;

//------------------------------------------------------------------------
// CAN Message를 Bit로 계산한다.
function GetCANValue(var CanMsg : TCANMessage; nStartBit, nBitLen : Integer; Option : Integer = 0) : Integer;
var i : Integer;
    nByte, nBit, nInc : Integer;
    bSigned, bInvert : Boolean;
begin
    bSigned := (Option and CAN_SIGNED  ) <> 0;
    bInvert := (Option and CAN_MOTOROLA) <> 0;

    // 시작비트로 Byte 위치와 Bit위치 판단.
    nByte := (nStartBit div 8);
    nBit  := (nStartBit mod 8);
    if (bInvert) then nInc := -1 else nInc := 1;

    Result := 0;
    for i:= 0 to nBitLen-1 do
    begin
        if not (nByte in [0..7]) then break;

        if ((CanMsg.Data[nByte] and (1 shl nBit)) <> 0) then
            Result := Result or (1 shl i);

        nBit := nBit + 1;
        if (nBit > 7) then begin
            nByte := nByte + nInc;
            nBit := 0;
        end;
    end;

    // 부호가 있는경우 (-)값 계산. 
    if (bSigned) and (nBitLen > 1) then
    begin
        if Result > (1 shl (nBitLen-1)) then
            Result := Result - (1 shl nBitLen);
    end;
end;

//------------------------------------------------------------------------
function StrToCanMsg(Param : String) : TCanMessage;
var i : Integer;
    Str, DataStr : String;
begin
    // EX) Param = '123=11 22 33 44:Cycle:TimeStamp';
    Str  := GetToken(Param, '=');
    Result.CanID := HexToIntDef(Str, -1);

    if (Result.CanID < $0) then
    begin
        // Result.CanID := 0;
        Result.DLC   := 0;
        for i:= 0 to MAX_CAN_DATA_LEN-1 do Result.Data[i] := 0;
        Result.nCycle    := 0;
        Result.TimeStamp := 0;
        Exit;
    end;

    DataStr := GetTokenTrim(Param, ':');

    Result.DLC := 0;
    while ((DataStr <> '' ) and (Result.DLC < MAX_CAN_DATA_LEN)) do
    begin
        Str := GetToken(DataStr, ' ');
        if (Length(Str) = 2) then begin
            Result.Data[Result.DLC] := Byte(HexToIntDef(Str, 0));
            Inc(Result.DLC);
        end;
    end;
    Param := Trim(Param);
    Result.nCycle    := StrToIntDef( GetTokenChar(Param, [':', ' ']), 0 );
    Result.TimeStamp := StrToFloatDef( GetTokenChar(Param, [':', ' ']), 0 );
end;

//------------------------------------------------------------------------
function CanMsgToStr(Msg : TCanMessage) : String;
begin
    Result := '';
    if (Msg.CanID < $0) or ( not (Msg.DLC in [0..8])) then exit;

    Result := Format('%x=%s:%d:%f',
        [Msg.CANId, MakeHexaString(@Msg.Data[0], Msg.DLC), Msg.nCycle, Msg.TimeStamp]);
end;

//==============================================================================
{ TCANUnit }
constructor TCANUnit.Create;
var nChannel : Integer;
begin
    inherited;

    m_ChannelCount := 1;

    for nChannel := 1 to MAX_CAN_CHANNEL do
        FConnected[nChannel]  := False;

    HWInfo := TStringList.Create;

    m_Critical := TCriticalSection.Create;
    FLockCount := 0;

    // 송/수신 쓰레드를 생성한다.
    FSendThread := TCANSendThread.Create(Self);
    FReadThread := TCANReadThread.Create(Self);

    FReadPolling := 0;
    FSendPolling := 0;
end;

//------------------------------------------------------------------------------
destructor TCANUnit.Destroy;
begin
    if Assigned(FReadThread) then begin
        FReadThread.Terminate;
        FReadThread.WaitFor;
        FReadThread.Free;
    end;

    if Assigned(FSendThread) then begin
        FSendThread.Terminate;
        FSendThread.WaitFor;
        FSendThread.Free;
    end;

    OnMessageRead := nil;

    HWInfo.Free;
    m_Critical.Free;

    inherited;
end;

// CAN Port를 Open한다;
//------------------------------------------------------------------------------
function TCANUnit.OpenDevice(HwPort, HwId : Integer) : Boolean;
begin
    Self.HwPort    := HwPort;
    Self.HWId      := HWId;
end;

//------------------------------------------------------------------------------
function TCANUnit.CloseDevice : Boolean;
begin

end;
//------------------------------------------------------------------------------
function TCANUnit.Open(nChannel : Integer; fBaudrate: Double; Param : String): Boolean;
begin
    Clear(nChannel, True, True);
end;
//------------------------------------------------------------------------------
function TCANUnit.Config(nChannel : Integer; Param  : String) : Boolean;
begin
end;

//------------------------------------------------------------------------------
function TCANUnit.Close(nChannel : Integer) : Boolean;
begin
    Clear(nChannel, True, True);
end;

//------------------------------------------------------------------------------
// CAN Message를 전송한다.
function TCANUnit.Send(nChannel : Integer; Value :  TCanMessage ) : Boolean;
var i : Integer;
begin
    Result := False;
    if (nChannel <= 0) and (nChannel > MAX_CAN_CHANNEL) then exit;

    Lock;
    try
        if TXCount >= High(TxMessages) then exit;

        // 전송버퍼에 해당Id가 있는지 확인한다.
        for i := 0 to TxCount-1 do begin
            if (TxMessages[i].CANId = Value.CANId) then
            begin
                Result := True;
                break;
            end;
        end;

        if (Result) then begin
            TxMessages[i] := Value;
            TxMessages[i].TimeStamp := GetTickCountEx;
            TxMessages[i].nChannel  := nChannel;
        end else
        begin
            TxMessages[TxCount] := Value;
            TxMessages[TxCount].TimeStamp := GetTickCountEx;
            TxMessages[TxCount].nChannel  := nChannel;
            Inc(FTxCount);
        end;
    finally
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function TCANUnit.Read(nChannel : Integer) : Integer;
var i, j, k, RxIdx, nCycle : Integer;
    bMsgExist : Boolean;
begin
    Lock;
    try
        // 버퍼의 내용을 RX Message로 옮긴다.  Rx Message에는 중복메세지가 제거되고 마지막 데이터만 존재.
        for i := 0 to BuffCount-1 do
        begin
            bMsgExist := False;
            for j := 0 to FRxCount-1 do begin
                if (BuffMessage[i].CANId    = RxMessages[j].CANId   ) and
                   (BuffMessage[i].nChannel = RxMessages[j].nChannel) then
                begin
                    RxIdx     := j;
                    bMsgExist := True;
                    break;
                end;
            end;

            if (bMsgExist) then // 메세지가 존재하는경우.
            begin
                nCycle := Trunc(BuffMessage[i].TimeStamp - RxMessages[RxIdx].TimeStamp);

                RxMessages[RxIdx].DLC         := BuffMessage[i].DLC;
                for k := 0 to 7 do
                    RxMessages[RxIdx].Data[k] := BuffMessage[i].Data[k];
                if nCycle >= 0 then
                    RxMessages[RxIdx].nCycle      := nCycle;
                RxMessages[RxIdx].TimeStamp   := BuffMessage[i].TimeStamp;
                RxMessages[RxIdx].nChannel    := BuffMessage[i].nChannel;
            end else
            begin
                RxIdx := FRxCount;
                if (RxIdx < 0) or (RxCount >= High(RxMessages)) then break;

                RxMessages[RxIdx].CANId       := BuffMessage[i].CANId;
                RxMessages[RxIdx].DLC         := BuffMessage[i].DLC;
                for k := 0 to 7 do
                    RxMessages[RxCount].Data[k] := BuffMessage[i].Data[k];
                RxMessages[RxIdx].nCycle      := 0;
                RxMessages[RxIdx].TimeStamp   := BuffMessage[i].TimeStamp;
                RxMessages[RxIdx].nChannel    := BuffMessage[i].nChannel;

                Inc(FRxCount);
            end;
        end;
    finally
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function TCANUnit.Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;
var i, j, Idx : Integer;
begin
    Result := False;
    if (nChannel <= 0) and (nChannel > MAX_CAN_CHANNEL) then exit;

    Lock;
    try
        // TXMessage에서 제거.
        i := TxCount-1;
        while (i >= 0) do begin
            if (TxMessages[i].nChannel = nChannel) then
            begin
                if ((CANId >=0) and (TxMessages[i].CanID = CanID )) or
                   ((CANId < 0) and (bTxMsg)) then
                begin
                    for j := i to TxCount-1 do TxMessages[j] := TxMessages[j+1];
                    Dec(FTxCount);
                end;
            end;
            Dec(i);
        end;

        // RXMessage에서 제거.
        i := RxCount-1;
        while (i >= 0) do begin
            if (RxMessages[i].nChannel = nChannel) then
            begin
                if ((CANId >=0) and (RxMessages[i].CanID = CanID )) or
                   ((CANId < 0) and (bRxMsg)) then
                begin
                    for j := i to RxCount-1 do RxMessages[j] := RxMessages[j+1];
                    Dec(FRxCount);
                end;                                                                                    
            end;
            Dec(i);
        end;

        // BuffMessage 제거.
        FBuffCount := 0;
    finally
        UnLock;
    end
end;

//------------------------------------------------------------------------------
procedure TCANUnit.Lock;
begin
    // 다른쓰레드에서 접근을 못하도록 막는다.
    m_Critical.Acquire;
    Inc(FLockCount);
end;

procedure TCANUnit.UnLock;
begin
    // 다른쓰레드접근을 해제한다.
    m_Critical.Release;
    Dec(FLockCount);
end;

function TCANUnit.IsLock : Boolean;
begin
    Result := (FLockCount > 0);
end;

procedure TCANUnit.PauseReadPolling;
begin
    Dec(FReadPolling);
    if Assigned(FReadThread) then
        TCANReadThread(FReadThread).Enabled := (FReadPolling > 0);
end;


procedure TCANUnit.ContinueReadPolling;
begin
    Inc(FReadPolling);
    if Assigned(FReadThread) then
        TCANReadThread(FReadThread).Enabled := (FReadPolling > 0);
end;

procedure TCANUnit.PauseSendPolling;
begin
    Dec(FSendPolling);
    if Assigned(FSendThread) then
        TCANSendThread(FSendThread).Enabled := (FSendPolling > 0);

    if FSendPolling = 0 then FSendThread.Suspend;
end;

procedure TCANUnit.ContinueSendPolling;
begin
    Inc(FSendPolling);
    if Assigned(FSendThread) then
        TCANSendThread(FSendThread).Enabled := (FSendPolling > 0);

    if FSendPolling = 1 then FSendThread.Resume;
end;

{ TCANReadThread }

constructor TCANReadThread.Create(Parent : TObject);
begin
    inherited Create(False);

    CanUnit := TCANUnit(Parent);
    Enabled := False;
end;

procedure TCANReadThread.Execute;
var
    nChannel : Integer;
begin
    inherited;

    try
        FReadEvent := TEvent.Create(nil, False, False, 'CanReadEvent');
        
        // 통신이 연결된 동안 계속 Thread를 유지한다.
        FReadEvent.ResetEvent;
        while (not Terminated) and (CanUnit <> nil) do
        begin
            //------------------------------------------------------------------
            // 주기적으로 CAN Message를 읽는다. (100ms간격)
            if (Enabled) then begin
                // 메세지가 발생하면 이벤트를 발생한다.
                nChannel := 1;
                if (CanUnit <> nil) then
                    if CanUnit.Read(nChannel) > 0 then Synchronize(OnReadEvent);
            end;

            FReadEvent.WaitFor(200);  // 200ms 각격으로 데이터를 처리한다.
        end;
    finally
        FReadEvent.Free;
    end;
end;

procedure TCANReadThread.OnReadEvent;
begin
    try
        if Assigned(CanUnit.OnMessageRead) then
            CanUnit.OnMessageRead(CanUnit);
    except
    end;
end;

{ TCANSendThread }

constructor TCANSendThread.Create(Parent : TObject);
begin
    inherited Create(False);

    CanUnit := TCANUnit(Parent);
    Enabled := False;
end;

procedure TCANSendThread.Execute;
var i, nChannel : Integer;
    ElapseTime, fReadTime : Double;
    TxCount : Integer;
    TxMessages   : array[0..MAX_TX_BUFF] of TCANMessage;
begin
    inherited;

    fReadTime := GetTickCountEX;
    try
        // 통신이 연결된 동안 계속 Thread를 유지한다.
        while (not Terminated) and (CanUnit <> nil) do
        begin
          //--------------------------------------------------------------------
          // 전송메세지 처리.
          if (Enabled) then
          begin
              // 전송버퍼를 가져온다.
              //-------------------------
              CanUnit.Lock;
              try
                  TxCount := CanUnit.TxCount;
                  for i := 0 to TxCount-1 do begin
                     TxMessages[i] := CanUnit.TxMessages[i];
                  end;
              finally
                  CanUnit.UnLock;
              end;
              //-------------------------

              try
                  for i := 0 to TxCount-1 do
                  begin
                      if TxMessages[i].nCycle = 0 then continue;

                      // 마지막 전송시간이 CycleTime보다 길면 전송.
                      ElapseTime := GetTickCountEX - TxMessages[i].TimeStamp;
                      if (ElapseTime >= TxMessages[i].nCycle ) then
                      begin
                          TxMessages[i].TimeStamp := GetTickCountEx;
                          CanUnit.Send(TxMessages[i].nChannel, TxMessages[i]);
                      end;
                  end;
              except;
              end;
          end;
          Sleep(1); // -> CPU 부하를 줄이기 위해 Sleep처리.
      end;
    except
    end;
end;

end.
