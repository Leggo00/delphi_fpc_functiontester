unit FormSorensen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DPBLabel, Buttons, ZINICtrl, ComDrv32, ComCtrls, EdLists;

type
  TFrmSorensen = class(TForm)
    chkConnectOnOff: TCheckBox;
    cmbComPort: ZIniComboBox;
    BtnSend: TBitBtn;
    BtnClear: TBitBtn;
    Label7: TLabel;
    Label6: TLabel;
    ListRx: TListBox;
    INI: ZIniData;
    Comm: TCommPortDriver;
    edtSend: TEdit;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    edtVoltage: ZIniEdit;
    Label2: TLabel;
    edtCurrent: ZIniEdit;
    Label3: TLabel;
    edtCmdList: TListBox;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure chkConnectOnOffClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCmdListDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    IsReceiveCommOk : Boolean;

    procedure CommOpen(nPort : Integer);
    procedure CommClose();
    procedure CommInit();
    procedure CommSend(DataStr : String);
    function  CommRead(Param : String) : String;

    procedure SetPowerOn(fVolt, fCurr: double);
    procedure SetPowerOff();
  end;

//var
//  FrmSorensen: TFrmSorensen;

implementation

uses GenUtils;
{$R *.DFM}

procedure TFrmSorensen.FormCreate(Sender: TObject);
begin
    Ini.LoadData;
end;

procedure TFrmSorensen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Ini.SaveData;
end;

procedure TFrmSorensen.CommOpen(nPort : Integer);
begin
    if nPort = 0 then nPort := cmbComPort.ItemIndex + 1;

    Comm.Disconnect;
    Comm.ComPort := nPort;
    Comm.Connect;
    CommInit;

    CommSend('SYST:REM:STAT REM');

    chkConnectOnOff.Checked := True;
end;

procedure TFrmSorensen.CommClose();
begin
    Comm.Disconnect;
    chkConnectOnOff.Checked := False;
end;

procedure TFrmSorensen.CommInit();
begin
    ListRx.Clear;
    Comm.FlushBuffers(true, true);
end;

procedure TFrmSorensen.CommSend(DataStr : String);
var Buff : array of Byte;
    Str : String;
    BuffLen : Integer;
begin
    DataStr := DataStr + CR;
    Comm.SendString(DataStr);
end;

procedure TFrmSorensen.BtnSendClick(Sender: TObject);
begin
    CommSend(edtSend.Text);
end;

procedure TFrmSorensen.BtnClearClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmSorensen.chkConnectOnOffClick(Sender: TObject);
begin
    if chkConnectOnOff.Checked then
        CommOpen(cmbComPort.ItemIndex + 1)
    else
        CommClose();
end;

procedure TFrmSorensen.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    ListRx.Items.Text := StrPas(DataPtr);
end;

procedure TFrmSorensen.ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        BtnSendClick(Sender);
end;

function TFrmSorensen.CommRead(Param : String) : String;
const TIME_OUT = 1000;
var nTime : Integer;
    rdStr, Str : String;
begin
    // EX) SPEED:00 01 02
    rdStr := GetTokenTrim (Param, ':');

    if Param <> '' then begin
        IsReceiveCommOk := False;
        CommSend(Param);
        nTime := GetTickCount;
        while ( (GetTickCount - nTime) < TIME_OUT ) do begin
            if IsReceiveCommOk then Break;
            Application.ProcessMessages;
        end;
    end;

    Str := ListRx.Items.Values[rdStr];
    Result := GetToken(Str, ' ');
end;

procedure TFrmSorensen.edtCmdListDblClick(Sender: TObject);
begin
    edtSend.Text := edtCmdList.Items[edtCmdList.ItemIndex];
    CommSend(edtSend.Text);
end;

procedure TFrmSorensen.SetPowerOff();
var
    sCommand: string;
begin
    sCommand := Format('SOUR:VOLT %f', [0.0]);
    CommSend(sCommand);
    sCommand := Format('SOUR:CURR %f', [0.0]);
    CommSend(sCommand);
    CommSend('OUTP OFF');
end;

procedure TFrmSorensen.SetPowerOn(fVolt, fCurr: double);
var
    sCommand: string;
begin
    if fVolt = 0 then
    begin
        SetPowerOff();
        exit;
    end;

    CommOpen(cmbComPort.ItemIndex + 1);
    DelayEx(50, True);

    sCommand := Format('SOUR:VOLT %f', [fVolt]);
    CommSend(sCommand);
//    DelayEx(100, True);
    sCommand := Format('SOUR:CURR %f', [fCurr]);
    CommSend(sCommand);
//    DelayEx(100, True);
    CommSend('OUTP ON');
end;

procedure TFrmSorensen.BitBtn1Click(Sender: TObject);
begin
    SetPowerOn(StrToFloatDef(edtVoltage.Text, 0), StrToFloatDef(edtCurrent.Text, 0));
end;

procedure TFrmSorensen.BitBtn2Click(Sender: TObject);
begin
    SetPowerOff();
end;

end.
