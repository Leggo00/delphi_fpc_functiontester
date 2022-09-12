unit FormCP323;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DPBLabel, Buttons, ZINICtrl, ComDrv32, ComCtrls, EdLists,
  ExtCtrls, RealSpinEdit;

type
  TFrmCP323 = class(TForm)
    cmbComPort: ZIniComboBox;
    BtnSend: TBitBtn;
    BtnClear: TBitBtn;
    Label7: TLabel;
    Label6: TLabel;
    listRxTxList: TListBox;
    INI: ZIniData;
    Comm: TCommPortDriver;
    edtSend: TEdit;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    listCommand: TListBox;
    BitBtn2: TBitBtn;
    chkConnectOnOff: ZIniCheckBox;
    rdoControlMode: ZIniRadioGroup;
    rdoOutputMode: ZIniRadioGroup;
    GroupBox1: TGroupBox;
    edtMaxOutputVoltage: ZIniRealSpinEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtVoltage: ZIniRealSpinEdit;
    edtCurrent: ZIniRealSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure chkConnectOnOffClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure listCommandDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rdoControlModeClick(Sender: TObject);
    procedure rdoOutputModeClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddMessage(sParam : string);
  public
    IsReceiveCommOk : Boolean;

    procedure CommOpen(nPort : Integer);
    procedure CommClose();
    procedure CommInit();
    procedure CommSend(sData : string);

    procedure SetPowerOn(fVolt, fCurr: double);
    procedure SetPowerOff();
  end;

var
  FrmCP323: TFrmCP323;

implementation

uses GenUtils;
{$R *.DFM}

procedure TFrmCP323.FormCreate(Sender: TObject);
begin
    Ini.LoadData;
end;

procedure TFrmCP323.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Ini.SaveData;
end;

procedure TFrmCP323.AddMessage(sParam : string);
begin
    with listRxTxList do
    begin
        Items.BeginUpdate;
        if  Count > 100 then Items.Delete(0);
        ItemIndex := Items.Add(sParam);
        Items.EndUpdate;
    end;
end;

procedure TFrmCP323.CommOpen(nPort : Integer);
begin
    if nPort = 0 then
        nPort := cmbComPort.ItemIndex + 1;

    Comm.Disconnect;
    Comm.ComPort := nPort;
    Comm.Connect;
    CommInit;

    chkConnectOnOff.Checked := True;
end;

procedure TFrmCP323.CommClose();
begin
    Comm.Disconnect;
    chkConnectOnOff.Checked := False;
end;

procedure TFrmCP323.CommInit();
begin
    listRxTxList.Clear;
    Comm.FlushBuffers(true, true);
end;  

procedure TFrmCP323.BtnClearClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmCP323.chkConnectOnOffClick(Sender: TObject);
begin
    if chkConnectOnOff.Checked then
        CommOpen(cmbComPort.ItemIndex + 1)
    else
        CommClose();
end;

procedure TFrmCP323.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    sRxData: string;
begin
    sRxData := sRxData + MakeHexaString(DataPtr, DataSize);
    AddMessage('READ : < ' + sRxData);
end;

function SetHexValue(fValue: double): string;
var
    sValue: string;
    i: integer;
begin
    Result := '';

    sValue := Format('%.8x', [Round(fValue) ]);
    for i := Length(sValue) downto 1 do
    begin
        if Odd(i) then
           Result := Result + ' ' + Copy(sValue, i, 2);
    end;
end;

procedure TFrmCP323.listCommandDblClick(Sender: TObject);
var
    sTemp, sValue: string;
begin
    sTemp := listCommand.Items[listCommand.ItemIndex];

    sValue := '';
    case listCommand.ItemIndex of
        2: sValue := SetHexValue( StrToFloatDef(edtMaxOutputVoltage.Text, 0) * 1000 ); // Maximum Ouuput Voltage
        3: sValue := SetHexValue( StrToFloatDef(edtVoltage.Text, 0) * 1000 ); // Output Voltage
        4: sValue := SetHexValue( StrToFloatDef(edtCurrent.Text, 0) * 1000 ); // Output Current
    end;

    edtSend.Text := Trim(GetToken(sTemp, ';'));
    CommSend(edtSend.Text + ' ' + sValue);
end;


procedure TFrmCP323.CommSend(sData : string);
var
    nTxBuffer : array[0..25] of Byte;
    i, nChecksum, nData: Integer;
    sTemp, sTxData: string;
begin
    FillChar(nTxBuffer, SizeOf(nTxBuffer), 0);

    nTxBuffer[0] := $AA; // Start Bit
    nTxBuffer[1] := $01; // Address

    nData := 2;
    while (sData <> '' ) do
    begin
        sTemp := GetTokenTrim(sData, ' ');
        nTxBuffer[nData] := HexToIntDef(sTemp, 0);
        Inc(nData);
    end;

    nChecksum := 0;
    for i := Low(nTxBuffer) to High(nTxBuffer) do
        nChecksum := nChecksum + nTxBuffer[i];

    nTxBuffer[25] := nChecksum;

    Comm.SendData(@nTxBuffer, High(nTxBuffer) + 1);

    //for i := Low(nTxBuffer) to High(nTxBuffer) do
    //    Comm.SendByte( nTxBuffer[i] );

    sTxData := MakeHexaString(@nTxBuffer, High(nTxBuffer) + 1);
    AddMessage('SEND : > ' + sTxData);
    DelayEx(50, True);
end;

procedure TFrmCP323.BtnSendClick(Sender: TObject);
begin
    CommSend(edtSend.Text);
end;


procedure TFrmCP323.SetPowerOff();
begin
    CommSend('21 00');
    CommSend('20 00');
end;

procedure TFrmCP323.SetPowerOn(fVolt, fCurr: double);
var
    sValue: string;
begin
    if fVolt = 0 then
    begin
        SetPowerOff();
        exit;
    end;

    CommOpen(cmbComPort.ItemIndex + 1);
    DelayEx(50, True);

    CommSend('20 01');

    sValue := '' + SetHexValue( fVolt * 1000 ); // Output Voltage
    CommSend('23 ' + sValue);

    sValue := SetHexValue( fCurr * 1000 ); // Output Current
    CommSend('24 ' + sValue);

    CommSend('21 01');
end;

procedure TFrmCP323.BitBtn1Click(Sender: TObject);
begin
    SetPowerOn(StrToFloatDef(edtVoltage.Text, 0), StrToFloatDef(edtCurrent.Text, 0));
end;

procedure TFrmCP323.BitBtn2Click(Sender: TObject);
begin
    SetPowerOff();
end;

procedure TFrmCP323.rdoControlModeClick(Sender: TObject);
var
    sCommand: string;
begin
    case rdoControlMode.ItemIndex of
        0: sCommand := '20 00';
        1: sCommand := '20 01';
    end;
    edtSend.Text := sCommand;
    CommSend(edtSend.Text);
end;

procedure TFrmCP323.rdoOutputModeClick(Sender: TObject);
var
    sCommand: string;
begin
    case rdoOutputMode.ItemIndex of
        0: sCommand := '21 00';
        1: sCommand := '21 01';
    end;
    edtSend.Text := sCommand;
    CommSend(edtSend.Text);
end;

end.
