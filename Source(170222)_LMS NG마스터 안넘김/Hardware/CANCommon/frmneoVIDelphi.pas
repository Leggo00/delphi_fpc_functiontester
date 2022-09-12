unit frmneoVIDelphi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms,
  Graphics, Controls, Dialogs, StdCtrls, ExtCtrls,
  icsn40, icsSpyData, ComCtrls, Buttons, Spin, ZINICtrl;

type

  TCanMessage = record
    ID, Len : Integer;
    Data    : array[0..7] of Byte;
    nCycle  : Word;
  end;

  TFrmNeoVI = class(TForm)
    lstMessages: TListBox;
    Label1: TLabel;
    tmrReadneoVI: TTimer;
    lstErrors: TListBox;
    Label2: TLabel;
    cmdReadErrors: TButton;
    lstTxNetwork: TComboBox;
    Label3: TLabel;
    ListBoxBuff: TListBox;
    Edit_Tx: TEdit;
    StatusBar: TStatusBar;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    txtTxB1: TEdit;
    txtTxB2: TEdit;
    txtTxB3: TEdit;
    txtTxB4: TEdit;
    txtTxB5: TEdit;
    txtTxB6: TEdit;
    txtTxB7: TEdit;
    txtTxB8: TEdit;
    txtArbID: TEdit;
    chkXtdID: TCheckBox;
    chkRtm: TCheckBox;
    lstDataBytesCount: TComboBox;
    txtTxH1: TEdit;
    txtTxH2: TEdit;
    txtTxH3: TEdit;
    lstHeaderByteCount: TComboBox;
    cmdTransmit: TButton;
    INI: ZIniData;
    lstPortType: TComboBox;
    Label20: TLabel;
    Panel2: TPanel;
    Label21: TLabel;
    Edit_Comport: ZIniSpinEdit;
    cmdOpen: TButton;
    cmdClose: TButton;
    Label12: TLabel;
    Button1: TButton;
    cmdClear: TButton;
    procedure cmdOpenClick(Sender: TObject);
    procedure cmdCloseClick(Sender: TObject);
    procedure tmrReadneoVITimer(Sender: TObject);
    procedure cmdClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdTransmitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdReadErrorsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    bConnected : Boolean;
    m_hObject: ICSNEOHANDLE;
    stMsgBuff: array [0..19999] of icsSpyMessage;
    m_lMessageCount: Integer;

    procedure AddMessageToListBox(lIndex: Integer;  StrList : TStrings);
  public
    function  OpenPort(nPort : Integer; nType : Integer = 0) : Boolean;
    procedure ClosePort;
    function  SendMsg(iNetwork : Integer; Param : String) : Boolean;
    function  ReadMsg(iNetwork : Integer; StrList : TStrings) : Boolean;
  end;

var
  FrmNeoVI: TFrmNeoVI;

implementation


{$R *.dfm}

uses
    GenUtils;

function ToByte(sString: string): Byte;
begin
  // this function changes a string to a byte value
  Result := Byte(StrToIntDef(sString, 0));
end;

    
procedure TFrmNeoVI.cmdOpenClick(Sender: TObject);
begin
    OpenPort(Edit_Comport.Value);
end;

procedure TFrmNeoVI.cmdCloseClick(Sender: TObject);
begin
    ClosePort;
end;




function TFrmNeoVI.OpenPort(nPort : Integer; nType : Integer = 0) : Boolean;
var
  iResult: LongBool;
  bNetIDs: array [0..15] of Byte;
  bSCPIDs: array [0..254] of Byte;
  iCount: Integer;
begin
    Result := False;

    // initialize the net ids
    for iCount := 0 to 15 do
        bNetIDs[iCount] := iCount;

    // open the port
    iResult := icsneoOpenPort(nPort, nType,
        INTREPIDCS_DRIVER_STANDARD, @bNetIDs[0], @bSCPIDs[0], m_hObject);

    // Test the result
    if iResult then
    begin
        StatusBar.Panels[0].Text := 'neoVI Opened!';
        tmrReadneoVI.Enabled := True;
        cmdOpen.Enabled      := False;
        cmdClose.Enabled     := True;
        Result := True;
    end
    else
        Application.MessageBox('Problem opening neoVI', 'neoVI', MB_OK or MB_ICONWARNING);

    bConnected := Result;
end;


procedure TFrmNeoVI.ClosePort;
var
  iResult: LongBool;
  iNumErrors: Integer; // used to read the number of errors in the driver
begin
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

  bConnected := False;
end;


function TFrmNeoVI.ReadMsg(iNetwork : Integer; StrList : TStrings) : Boolean;
var fTime : Double;
    bResult: LongBool;
    iNumMessages: Integer;
    iNumErrors: Integer;       // number of errors in the DLL
    sMsg: string;              // message to user
    sErrMsg: string;           // message to user
    lCount: Integer;           // counter variable
begin
    // 메세지를 읽고 StrList 메세지에 담는다.
    StrList.BeginUpdate;
    StrList.Clear;

    ListBoxBuff.Clear;

    iNumMessages := 0;
    iNumErrors   := 0;

    // Read the received messages from the DLL //////////////////////////////////
    bResult := icsneoGetMessages(m_hObject, @stMsgBuff[0], iNumMessages, iNumErrors);

    // check the returned result
    if bResult then
    begin
        // create a message for our label
        sMsg    := Format('Messages Read: %d', [iNumMessages]);
        sErrMsg := Format('Errors : %d:', [iNumErrors]);
        // for each message
        for lCount := 0 to iNumMessages-1 do
            AddMessageToListBox(lCount, StrList); // add the message to the list box
    end
    else
    begin
        // the icsneoGetMessages function failed
        sMsg    := 'Problems reading messages from neoVI';
        sErrMsg := '';
    end;

    // set the message
    StatusBar.Panels[0].Text := sMsg;
    StatusBar.Panels[1].Text := sErrMsg;
    StrList.EndUpdate;
end;


function TFrmNeoVI.SendMsg(iNetwork : Integer; Param : String) : Boolean;
var i, CanID : Integer;
    Str : String;
    bResult: LongBool;               // API Call result variable
    stMsg: icsSpyMessage;            // CAN message structure
    stJMsg: icsSpyMessageJ1850;      // J1850 Message Structure
    p_stMsg: PicsSpyMessage;         // Message Structure Pointer
    // iNetwork: Integer;            // a variable which holds the current network
begin
    Result := False;

    CanID := HexToIntDef(GetTokenTrim(Param, ' '), -1);
    if CanID < 0 then exit;

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
        StatusBar.Panels[0].Text := 'Problem Transmitting Message';
end;

procedure TFrmNeoVI.AddMessageToListBox(lIndex: Integer;  StrList : TStrings);
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

procedure TFrmNeoVI.tmrReadneoVITimer(Sender: TObject);
begin
    tmrReadneoVI.Enabled := False;

    ReadMsg(0, ListBoxBuff.Items);

    tmrReadneoVI.Enabled := True;
end;

procedure TFrmNeoVI.cmdClearClick(Sender: TObject);
begin
  lstMessages.Clear;
end;

procedure TFrmNeoVI.FormDestroy(Sender: TObject);
begin
    if bConnected then
        ClosePort;

    // free the neoVI driver object
    if m_hObject <> 0 then
        icsneoFreeObject(m_hObject);
end;


procedure TFrmNeoVI.cmdTransmitClick(Sender: TObject);
var
    bResult: LongBool;               // API Call result variable
    stMsg: icsSpyMessage;            // CAN message structure
    stJMsg: icsSpyMessageJ1850;      // J1850 Message Structure
    p_stMsg: PicsSpyMessage;         // Message Structure Pointer
    iNetwork: Integer;               // a variable which holds the current network
begin
    // get the network id for this transmission
    iNetwork := lstTxNetwork.ItemIndex+1;

    // Determine if this is a CAN type message
    if iNetwork <= NETID_LSFTCAN then
    begin

        stMsg.ArbIDOrHeader   := HexToIntDef(txtArbID.Text, 0) * $100; // Set CAN Arb ID
        stMsg.StatusBitField  := 0; // Reset the statusbitfields
        stMsg.StatusBitField2 := 0;

        if chkXtdID.Checked then // Is Extended Identifier?
        // set the status bit field bit for xtd frame
            stMsg.StatusBitField :=  stMsg.StatusBitField or SPY_STATUS_XTD_FRAME;

        // Is Remote Frame?
        if chkRtm.Checked then
            // set the status bit field for remote frame
            stMsg.StatusBitField := stMsg.StatusBitField or SPY_STATUS_REMOTE_FRAME;

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
    p_stMsg^.NumberBytesData := lstDataBytesCount.ItemIndex;
    p_stMsg^.Data[0] := ToByte(txtTxB1.Text);
    p_stMsg^.Data[1] := ToByte(txtTxB2.Text);
    p_stMsg^.Data[2] := ToByte(txtTxB3.Text);
    p_stMsg^.Data[3] := ToByte(txtTxB4.Text);
    p_stMsg^.Data[4] := ToByte(txtTxB5.Text);
    p_stMsg^.Data[5] := ToByte(txtTxB6.Text);
    p_stMsg^.Data[6] := ToByte(txtTxB7.Text);
    p_stMsg^.Data[7] := ToByte(txtTxB8.Text);

    // Transmit the message via the  icsneoTxMessages API call
    bResult := icsneoTxMessages(m_hObject, p_stMsg, iNetwork, 1);

    // Test the result
    if not bResult then
        // report the problem with icsneoTxMessages
        StatusBar.Panels[0].Text := 'Problem Transmitting Message';
end;

procedure TFrmNeoVI.FormCreate(Sender: TObject);
begin
    // initialize the member variables
    m_hObject := 0;
    m_lMessageCount := 0;

    lstTxNetwork.ItemIndex := 0;             // reset the network list
    lstHeaderByteCount.ItemIndex := 0;       // reset the header byte list
    lstDataBytesCount.ItemIndex := 0;        // reset the data byte list
    
//    lstPortType.ItemIndex := 0;              // reset port type to RS232
//    lstPort.ItemIndex := 0;                  // reset port to 1 ie COM1

    INI.LoadData;
end;

procedure TFrmNeoVI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    INI.SaveData;
end;


procedure TFrmNeoVI.cmdReadErrorsClick(Sender: TObject);
var
  iResult: LongBool;                       // return result variable
  iErrMessages: array [0..599] of Integer; // buffer for error messages
  iNumErrors: Integer;                     // number of errors
  iCount: Integer;                         // general purpose counter variable
  sMsg: string;                            // used to add error the the list box
begin
  iNumErrors := 0;

  // Clear the list
  lstErrors.Clear;
  // get the error messages via the icsneoGetErrorMessages API call
  iResult := icsneoGetErrorMessages(m_hObject, @iErrMessages[0], iNumErrors);
  // Test the result
  if iResult then
  begin
    // for each error
    for iCount := 0 to iNumErrors-1 do
    begin
      // create a string
      sMsg := IntToStr(iErrMessages[iCount]);
      // add to the error list
      lstErrors.Items.Add(sMsg);
    end;
  end
  else
    // report a problem reading the error messages
    StatusBar.Panels[0].Text := 'Problem Reading Error Messages';
end;


procedure TFrmNeoVI.SpeedButton1Click(Sender: TObject);
begin
    SendMsg(lstTxNetwork.ItemIndex+1, Edit_Tx.Text);
end;


procedure TFrmNeoVI.Button1Click(Sender: TObject);
begin
    Close;
end;

end.
