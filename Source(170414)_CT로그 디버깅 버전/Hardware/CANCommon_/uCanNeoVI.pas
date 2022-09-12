unit uCanNeoVI;

interface

uses
    Classes, SysUtils, Windows, uCanUnit, Math, icsn40, icsSpyData;

type
  //----------------------------------------------------------------------------
  // VECTOR CAN
  TNeoVICAN = class(TCANUnit)
  private
    hwType, hwChannel : Integer;

    m_hObject: ICSNEOHANDLE;
    stMsgBuff: array [0..19999] of icsSpyMessage;
    procedure AddMessageToListBox(lIndex: Integer; StrList: TStrings);
  public
    constructor Create;
    destructor  Destroy;

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

{ TNeoVICAN }

//------------------------------------------------------------------------------
constructor TNeoVICAN.Create;
begin
    inherited Create;
end;

//------------------------------------------------------------------------------
destructor TNeoVICAN.Destroy;
begin
    //
end;

//------------------------------------------------------------------------------
var
    bDeviceOpened : Boolean;
    
function TNeoVICAN.OpenDevice(HwPort, HwId : Integer) : Boolean;
var i : Integer;
    xlStat : XLstatus;
    Str : String;
    g_AppName          : array[0..XL_MAX_LENGTH] of Char; // 'xlCANdemo';            //!< Application name which is displayed in VHWconf
label error;
begin
    inherited OpenDevice(HwPort, HwId);

    Result := False;
    if (bDeviceOpened) then exit;

//
    bDeviceOpened := True;
end;

//------------------------------------------------------------------------------
function TNeoVICAN.CloseDevice : Boolean;
var xlStat : XLstatus;
begin
    m_Critical.Acquire;
    try
        //
        bDeviceOpened := False;
    finally
        m_Critical.Release;
    end;
end;

//------------------------------------------------------------------------------
function TNeoVICAN.Open(nChannel : Integer; fBaudrate: Double; Param: String): Boolean;
var i, ret, Count, m_BaudRate : Integer;
    xlStat : XLstatus;
    xlSetChannelMask : XLaccess;
    BitRate : Integer;
begin
    m_Critical.Acquire;
    try
        inherited Open(nChannel, fBaudrate, Param);
    finally
        FConnected[nChannel] := Result;
        m_Critical.Release;
    end;
end;

//------------------------------------------------------------------------------
function  TNeoVICAN.Close(nChannel : Integer) : Boolean;
var
  iResult: LongBool;
  iNumErrors: Integer; // used to read the number of errors in the driver
begin
    m_Critical.Acquire;
    try
        inherited Close(nChannel);

        // close the neoVI object with a API call to icsneoClosePort
        iResult := icsneoClosePort(m_hObject, iNumErrors);
        // Test the result
        if not iResult then
          // announce a problem
          Application.MessageBox('Problem closing neoVI', 'neoVI', MB_OK or MB_ICONWARNING);
        // reenable the UI
        tmrReadneoVI.Enabled := False;
        cmdOpen.Enabled := True;
        cmdClose.Enabled := False;

        // display a message
        StatusBar.Panels[0].Text := 'neoVI Closed';

        FConnected[nChannel] := False;
        Result := True;

    finally
        m_Critical.Release;
    end;
end;

//------------------------------------------------------------------------------
function TNeoVICAN.Clear(nChannel : Integer; bTxMsg, bRxMsg : Boolean; CANID : Integer = -1) : Boolean;
var i : Integer;
    xlStat : XLstatus;
begin
    m_Critical.Acquire;
    try
        inherited Clear(nChannel, bTxMsg, bRxMsg, CANID);
        {
        if (CANId < 0) then begin
            // Reset the clock
            xlStat := xlResetClock(m_xlPortHandle);
        end;
        }
    finally
        m_Critical.Release;
    end;
end;

//------------------------------------------------------------------------------
function TNeoVICAN.Send(nChannel : Integer; Value : TCanMessage): Boolean;
var i, CanID : Integer;
    Str : String;
    bResult: LongBool;               // API Call result variable
    stMsg: icsSpyMessage;            // CAN message structure
    stJMsg: icsSpyMessageJ1850;      // J1850 Message Structure
    p_stMsg: PicsSpyMessage;         // Message Structure Pointer
    // iNetwork: Integer;            // a variable which holds the current network
begin
    if Value.Can < 0 then exit;
    Result := False;
    try
        m_Critical.Acquire;



        // Determine if this is a CAN type message
        if iNetwork <= NETID_LSFTCAN then
        begin
            stMsg.ArbIDOrHeader   := CanID * $100; // Set CAN Arb ID
            stMsg.StatusBitField  := 0;            // Reset the statusbitfields
            stMsg.StatusBitField2 := 0;
    {
            if chkXtdID.Checked then // Is Extended Identifier?
            // set the status bit field bit for xtd frame
                stMsg.StatusBitField :=  stMsg.StatusBitField or SPY_STATUS_XTD_FRAME;

            // Is Remote Frame?
            if chkRtm.Checked then
                // set the status bit field for remote frame
                stMsg.StatusBitField := stMsg.StatusBitField or SPY_STATUS_REMOTE_FRAME;
    }
            // Set the pointer
            p_stMsg := @stMsg;
        end
        else
        begin
            // all other networks use this type of message
            // structure

            // Reset the statusbitfields
            stJMsg.StatusBitField := 0;
            stJMsg.StatusBitField2 := 0;
            // Build the J1850 header
            stJMsg.NumberBytesHeader := lstHeaderByteCount.ItemIndex+1;
            stJMsg.Header[0] := ToByte(txtTxH1.Text);
            stJMsg.Header[1] := ToByte(txtTxH2.Text);
            stJMsg.Header[2] := ToByte(txtTxH3.Text);

            // Set the pointer
            p_stMsg := PicsSpyMessage(@stJMsg);
        end;

        // Data Bytes are common to both structures
        i := 0;
        while (Param <> '') and (i < 8) do begin
            Str := GetTokenTrim(Param, ' ');
            if Str = '' then continue;
            p_stMsg^.Data[i] := HexToIntDef(Str, 0);
            Inc(i);
        end;
        p_stMsg^.NumberBytesData := i;

        // Transmit the message via the  icsneoTxMessages API call
        Result := icsneoTxMessages(m_hObject, p_stMsg, iNetwork, 1);

        // Test the result
        if not Result then
            // report the problem with icsneoTxMessages
            //StatusBar.Panels[0].Text := 'Problem Transmitting Message';
        inherited Send(nChannel, Value);
    finally
        m_Critical.Release;
    end;
end;

//------------------------------------------------------------------------------
function TNeoVICAN.Read(nChannel : Integer) : Integer;
var fTime : Double;
    bResult: LongBool;
    iNumMessages: Integer;
    iNumErrors: Integer;       // number of errors in the DLL
    sMsg: string;              // message to user
    sErrMsg: string;           // message to user
    lCount: Integer;           // counter variable
begin
    try
        m_Critical.Acquire;

        iNumMessages := 0;
        iNumErrors   := 0;

        // Read the received messages from the DLL //////////////////////////////////
        bResult := icsneoGetMessages(m_hObject, @stMsgBuff[0], iNumMessages, iNumErrors);

        // check the returned result
        if bResult then
        begin
            // create a message for our label

            //ResMsg    := Format('Messages Read: %d', [iNumMessages]);
            // sErrMsg := Format('Errors : %d:', [iNumErrors]);
            // for each message
            for lCount := 0 to iNumMessages-1 do begin
                // AddMessageToListBox(lCount, StrList); // add the message to the list box
            end;
        end
        else
        begin
            // the icsneoGetMessages function failed
            // sMsg    := 'Problems reading messages from neoVI';
            // sErrMsg := '';
        end;

        inherited Read(nChannel);
    finally
        m_Critical.Release;
    end;
end;


procedure TNeoVICAN.AddMessageToListBox(lIndex: Integer;  StrList : TStrings);
var
   sMsg, sBytes, sHeader: string;
   sNetDescriptionMsg: string;
   stMsg: icsSpyMessage;
   p_stJMsg: PicsSpyMessageJ1850;
   bCANType: Boolean;          // flag which determines if this is CAN message or not
   iByteCount: Integer;        // general purpose counter variable
   dTimeStamp: Double;         // stores the message timestamp
begin
    // this function adds a string describing the message at lIndex to the list box
    bCANType := False;

    // copy the current message
    stMsg := stMsgBuff[lIndex];

    // get a pointer to it
    p_stJMsg := PicsSpyMessageJ1850(@stMsgBuff[lIndex]);

    // calculate the time stamp
    dTimeStamp := stMsg.TimeHardware2 * NEOVI_TIMESTAMP_2 + stMsg.TimeHardware * NEOVI_TIMESTAMP_1;

    // increment the message counter
    Inc(m_lMessageCount);

    // Get the network description based on the Network id
    bCANType := (stMsg.NetworkID in [NETID_HSCAN, NETID_MSCAN, NETID_SWCAN, NETID_LSFTCAN]);
    case stMsg.NetworkID of
        NETID_HSCAN:    sNetDescriptionMsg := 'HS CAN';
        NETID_MSCAN:    sNetDescriptionMsg := 'MS CAN';
        NETID_SWCAN:    sNetDescriptionMsg := 'SW CAN';
        NETID_LSFTCAN:  sNetDescriptionMsg := 'LSFT CAN';
        NETID_FORDSCP:  sNetDescriptionMsg := 'Ford SCP';
        NETID_J1708:    sNetDescriptionMsg := 'J1708';
        NETID_AUX:      sNetDescriptionMsg := 'Aux';
        NETID_ISO:      sNetDescriptionMsg := 'ISO/KW2k';
        NETID_JVPW:     sNetDescriptionMsg := 'J1850 VPW';
    else
        sNetDescriptionMsg := '';
    end;

    // Did we transmit this message? Test the transmit status flag.
    if (stMsg.StatusBitField and SPY_STATUS_TX_MSG) <> 0 then
        sMsg := 'TX> '
    else
        sMsg := 'RX> ';

    // start the display string
    sMsg := sMsg + Format('%5d %12.4f %10s', [m_lMessageCount, dTimeStamp, sNetDescriptionMsg]);


    // Build the Message Header
    if bCANType then
    begin
        // Build the CAN header
        // Arb ID
        sHeader := 'Arb ID : $' + IntToHex(stMsg.ArbIDOrHeader, 2) + ' ';
        // Does this frame have an extended indentifier
        if (stMsg.StatusBitField and SPY_STATUS_XTD_FRAME) <> 0 then
        begin
            sHeader := sHeader + ' Xtd';
        end
        else
        begin
            // Add the DLC field
            sHeader := sHeader + ' DLC: ' + IntToStr(stMsg.NumberBytesData);
        end;
    end
    else
        // Build the non-CAN header
        // Message header bytes
        // for each header byte
        for iByteCount := 0 to p_stJMsg^.NumberBytesHeader-1 do
            sHeader := sHeader + ' ' + IntToHex(p_stJMsg^.Header[iByteCount], 2);

    // Is the a CAN Remote Frame?
    if (bCANType) and ((stMsg.StatusBitField and SPY_STATUS_REMOTE_FRAME) <> 0) then
        // Yes, do not display the data bytes
        sBytes := 'Remote Frame'
    else begin
        // No, display the data bytes
        // Message data bytes
        for iByteCount:=0 to stMsg.NumberBytesData-1 do
            sBytes := sBytes + ' ' + IntToHex(stMsg.Data[iByteCount], 2);
    end;

    // Build the final display string
    sMsg := sMsg + ' ' + sHeader + ' ' + sBytes;

    StrList.Add(Format('%.3x %s', [stMsg.ArbIDOrHeader div $100,
                MakeHexaString(@stMsg.Data[0], stMsg.NumberBytesData)]));

    // place the message string at the beginning of the list

    if Visible then begin
        if lstMessages.Items.Count >= 200 then
            lstMessages.Clear;
        lstMessages.Items.Insert(0, sMsg);
        lstMessages.ItemIndex := 0;
    end;
end;

end.

