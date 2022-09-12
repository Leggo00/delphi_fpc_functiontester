unit uCanVector;

interface

uses
    Classes, SysUtils, Windows, uCanUnit, Math, vxlapi;

type
  //----------------------------------------------------------------------------
  // VECTOR CAN
  TVectorCAN = class(TCANUnit)
  private
    hwType, hwChannel : Integer;
    m_xlPortHandle     : XLportHandle; { = XL_INVALID_PORTHANDLE; } //!< Global porthandle (we use only one!)
    m_xlDrvConfig      : XLdriverConfig;
    m_xlChannelMask    : XLaccess;     //!< Global channelmask (includes all founded channels)
    m_xlPermissionMask : XLaccess;     //!< Global permissionmask (includes all founded channels)
  public
    constructor Create;
    destructor  Destroy; override;

    function    OpenDevice(HwPort, HwId : Integer) : Boolean;                            override;
    function    CloseDevice : Boolean;                                                   override;

    function    Open (nChannel : Integer; fBaudrate : Double; Param : String) : Boolean; override;
    function    Close(nChannel : Integer) : Boolean;                                     override;
    function    Send (nChannel : Integer; Value : TCanMessage) : Boolean;                override;
    function    Read (nChannel : Integer) : Integer;                                     override;
    function    Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;  override;
  end;

var
  threadHandle    : THandle     = 0;
  gEventHandle    : LongInt     = 0;
  threadRunning   : Integer     = 0;

const
  RX_QUEUE_SIZE = 4096;             // internal driver queue size in CAN events

implementation

uses
    GenUtils;

{ TVectorCAN }

//------------------------------------------------------------------------------
constructor TVectorCAN.Create;
begin
    inherited Create;
end;

//------------------------------------------------------------------------------
destructor TVectorCAN.Destroy;
begin
    inherited Destroy;
end;

//------------------------------------------------------------------------------
var
    bDeviceOpened : Boolean;
    
function TVectorCAN.OpenDevice(HwPort, HwId : Integer) : Boolean;
var i : Integer;
    xlStat : XLstatus;
    Str : String;
    g_AppName          : array[0..XL_MAX_LENGTH] of Char; // 'xlCANdemo';            //!< Application name which is displayed in VHWconf
label error;
begin
    inherited OpenDevice(HwPort, HwId);

    Result := False;
    if (bDeviceOpened) then exit;

    m_xlPortHandle     := XL_INVALID_PORTHANDLE;  //!< Global porthandle (we use only one!)
    m_xlChannelMask    := 0;  //!< Global channelmask (includes all founded channels)
    m_xlPermissionMask := 0;  //!< Global permissionmask (includes all founded channels)

    // open the driver
    xlStat := xlOpenDriver();

    // get the hardware configuration
    xlStat := xlGetDriverConfig(m_xlDrvConfig);
    if (xlStat <> XL_SUCCESS) then exit;

    // 시용가능 CAN 채널을 모두 얻는다.
    HWInfo.Clear;
    m_xlChannelMask := 0;
    for i :=0 to m_xlDrvConfig.channelCount-1 do
    begin
        // we take all hardware we found and check that we have only CAN cabs/piggy's
        if (m_xlDrvConfig.channel[i].channelBusCapabilities and XL_BUS_ACTIVE_CAP_CAN <> 0) then
        begin
            Str := Format('%d,0x%.4x,%s', [
                m_xlDrvConfig.channel[i].channelIndex,
                m_xlDrvConfig.channel[i].channelMask,
                m_xlDrvConfig.channel[i].transceiverName]);
            HWInfo.Add(Str);
            m_xlChannelMask := (m_xlChannelMask or m_xlDrvConfig.channel[i].channelMask);
        end;
    end;
    if (m_xlChannelMask = 0) then begin
        CloseDevice;
        exit;
    end;
    // ------------------------------------
    // open ONE port including all channels
    // ------------------------------------
    m_xlPermissionMask := m_xlChannelMask;

    g_AppName := 'xlCANcontrol';
    xlStat := xlOpenPort(m_xlPortHandle, g_AppName, m_xlChannelMask,
                         m_xlPermissionMask, RX_QUEUE_SIZE, XL_INTERFACE_VERSION, XL_BUS_TYPE_CAN);

    Result := (xlStat = XL_SUCCESS) and (m_xlPortHandle <> XL_INVALID_PORTHANDLE);

    bDeviceOpened := True;
end;

//------------------------------------------------------------------------------
function TVectorCAN.CloseDevice : Boolean;
var xlStat : XLstatus;
begin
    Lock;
    try
        xlStat := xlClosePort(m_xlPortHandle);
        m_xlPortHandle := XL_INVALID_PORTHANDLE;

        xlStat := xlCloseDriver();
        Result := (xlStat = XL_SUCCESS);

        bDeviceOpened := False;
    finally
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function TVectorCAN.Open(nChannel : Integer; fBaudrate: Double; Param: String): Boolean;
var i, ret, Count, m_BaudRate : Integer;
    xlStat : XLstatus;
    xlSetChannelMask : XLaccess;
    BitRate : Integer;
    firstID, LastID : Integer;
    Str, RdStr : String;
    StrList : TStringList;
begin
    inherited Open(nChannel, fBaudrate, Param);

    Lock;
    StrList := TStringList.Create;
    try
        Result := False;
        if (nChannel < 0) then exit;

        StrList.Text := ReplaceStr(Param, ',', CRLF);

        repeat
            xlSetChannelMask := (1 shl (nChannel-1));
            if ( xlSetChannelMask and m_xlChannelMask ) <> xlSetChannelMask then break;

            // ------------------------------------
            // if we have permission we set the bus parameters (baudrate)
            // ------------------------------------
            //    if (m_xlChannelMask = m_xlPermissionMask) then begin

            // Set Baudrate.
            m_BaudRate := Trunc( fBaudrate * 1000);
            xlStat := xlCanSetChannelBitrate(m_xlPortHandle, xlSetChannelMask, m_BaudRate);
            if (xlStat <> XL_SUCCESS) then break;

            // Activate Channel
            xlStat := xlActivateChannel(m_xlPortHandle, xlSetChannelMask, XL_BUS_TYPE_CAN, XL_ACTIVATE_RESET_CLOCK);
            if (xlStat <> XL_SUCCESS) then break;

            // Reset the clock
            xlStat := xlResetClock(m_xlPortHandle);
            if (xlStat <> XL_SUCCESS) then break;

            //------------------------------------------------------------------
            // Mask가 있는경우.
            RdStr := StrList.Values['MASK'];   // Ex) RdStr = 100~200,300~400  범위를 여려개 설정한다.
            if (RdStr <> '') then
            begin
                // 전체 영억을 제거한후 선택한 영역만 허용한다.
                xlStat := xlCanRemoveAcceptanceRange(m_xlPortHandle, xlSetChannelMask, $000, $7FF);

                while (RdStr <> '') do
                begin
                    Str := GetToken(RdStr, ',');

                    // Add AcceptanceRange;
                    firstID := HexToIntDef( GetToken(Str, '~'), 0);
                    LastID  := HexToIntDef( Str, firstID);

                    xlStat := xlCanAddAcceptanceRange(m_xlPortHandle, xlSetChannelMask, firstID, LastID);
                    if (xlStat <> XL_SUCCESS) then break;
                end;
            end else begin
                // Reset Acceptacnce.
                xlStat := xlCanResetAcceptance(m_xlPortHandle, xlSetChannelMask, XL_CAN_STD);
                if (xlStat <> XL_SUCCESS) then break;
            end;
            //------------------------------------------------------------------

            Result := (xlStat = XL_SUCCESS);
        until (True);
        
    finally
        StrList.Free;
        if Result then
            FConnected[nChannel] := True;
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function  TVectorCAN.Close(nChannel : Integer) : Boolean;
var xlStat : XLstatus;
begin
    inherited Close(nChannel);

    Result := False;
    Lock;
    try
        if (FConnected[nChannel]) and (m_xlPortHandle <> XL_INVALID_PORTHANDLE) then
        begin
            xlStat := xlDeactivateChannel(m_xlPortHandle, m_xlChannelMask);
            Result := (xlStat = XL_SUCCESS);
            if Result then
                FConnected[nChannel] := False;
        end;
    finally
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function TVectorCAN.Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;
var i : Integer;
    xlStat : XLstatus;
begin
    inherited Clear(nChannel, bTxMsg, bRxMsg, CANID);
    Result := False;
    Lock;
    try
        if (CANId < 0) then begin
            // Reset the clock
            xlStat := xlResetClock(m_xlPortHandle);
            Result := (xlStat = XL_SUCCESS);
        end;
    finally
        UnLock;
    end;
end;

//------------------------------------------------------------------------------
function TVectorCAN.Send(nChannel : Integer; Value : TCanMessage): Boolean;
var i : Integer;
    xlStat : XLstatus;
    xlEvt  : XLevent;
    messageCount : Longword;
    nChannelMask : XLaccess;
begin
    Result := False;

    nChannelMask := ( 1 shl (nChannel-1));
    if (nChannelMask and m_xlChannelMask) = nChannelMask then
    begin
        Lock;
        try
            FillMemory(@xlEvt, Sizeof(xlEvt), 0);

            xlEvt.tag                 := XL_TRANSMIT_MSG;
            xlEvt.tagData.msg.id      := Value.CANId;
            xlEvt.tagData.msg.dlc     := MIN(Value.DLC, 8);
            xlEvt.tagData.msg.flags   := 0; // MSGFLAG_WAKEUP;
            for i:= 0 to xlEvt.tagData.msg.dlc-1 do
                xlEvt.tagData.msg.data[i] := Value.Data[i];

            if (xlEvt.tagData.msg.id > $7ff) then
                xlEvt.tagData.msg.id := (xlEvt.tagData.msg.id or $80000000);   // 29bit인경우 상위Bit를 Set한다.

            messageCount := 1;
            xlStat := xlCanTransmit(m_xlPortHandle, nChannelMask, messageCount, @xlEvt);
            Result := (xlStat = XL_SUCCESS);
        finally
            UnLock;
        end;

        inherited Send(nChannel, Value);
    end;
end;

//------------------------------------------------------------------------------
function TVectorCAN.Read(nChannel : Integer) : Integer;
var
    xlStat : XLstatus;
    xlEvt  : XLevent;
    i, nReadCount : Integer;
    msgsrx : LongWord;
begin
    Lock;
    try
        msgsrx     := 1; // RECEIVE_EVENT_SIZE;
        FBuffCount := 0;
        nReadCount := 0;
        while (nReadCount <= 100) do // 한번에 최대 100개까지만 읽는다.
        begin
            Inc(nReadCount);

            xlStat := xlReceive(m_xlPortHandle, msgsrx, xlEvt);

            if ( xlStat <> XL_ERR_QUEUE_IS_EMPTY ) and (BuffCount < High(BuffMessage))  then
            begin
                if ( xlEvt.tag = XL_RECEIVE_MSG) then
                   //( xlEvt.tagData.msg.flags <> XL_CAN_MSG_FLAG_ERROR_FRAME) then
                begin
                    // if (xlEvt.tagData.msg.id = 0) and (xlEvt.tagData.msg.dlc = 0) then continue; // error Frame을 거르기 위해.

                    // 데이터를 버퍼로 옮긴다.
                    BuffMessage[BuffCount].CANId := ( xlEvt.tagData.msg.id  and $1FFFFFFF);
                    BuffMessage[BuffCount].DLC   :=  xlEvt.tagData.msg.dlc;
                    for i:= 0 to 7 do
                        BuffMessage[BuffCount].Data[i] := xlEvt.tagData.msg.data[i];
                    BuffMessage[BuffCount].TimeStamp   := (xlEvt.timeStamp / 1000000);
                    BuffMessage[BuffCount].nChannel    := (xlEvt.chanIndex + 1);
                    Inc(FBuffCount);
                end;
            end else
              break;
        end;
        Result := BuffCount;
    finally
        Unlock;
    end;

    inherited Read(nChannel);
end;
end.

