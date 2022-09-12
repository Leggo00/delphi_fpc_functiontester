unit FormEP305;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DPBLabel, Buttons, ZINICtrl, ComDrv32, ComCtrls, EdLists;

type
  TFrmEP305 = class(TForm)
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

var
  FrmEP305: TFrmEP305;

implementation

uses GenUtils;
{$R *.DFM}

procedure TFrmEP305.FormCreate(Sender: TObject);
begin
    Ini.LoadData;
end;

procedure TFrmEP305.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Ini.SaveData;
end;

procedure TFrmEP305.CommOpen(nPort : Integer);
begin
    if nPort = 0 then nPort := cmbComPort.ItemIndex + 1;

    Comm.Disconnect;
    Comm.ComPort := nPort;
    Comm.Connect;
    CommInit;

    chkConnectOnOff.Checked := True;
end;

procedure TFrmEP305.CommClose();
begin
    Comm.Disconnect;
    chkConnectOnOff.Checked := False;
end;

procedure TFrmEP305.CommInit();
begin
    ListRx.Clear;
    Comm.FlushBuffers(true, true);
end;

procedure TFrmEP305.BtnSendClick(Sender: TObject);
begin
    CommSend(edtSend.Text);
end;

procedure TFrmEP305.BtnClearClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmEP305.chkConnectOnOffClick(Sender: TObject);
begin
    if chkConnectOnOff.Checked then
        CommOpen(cmbComPort.ItemIndex + 1)
    else
        CommClose();
end;

procedure TFrmEP305.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    ListRx.Items.Text := StrPas(DataPtr);
end;

procedure TFrmEP305.CommSend(DataStr : String);
begin
    DataStr := DataStr + LF;
    Comm.SendString(DataStr);
end;


procedure TFrmEP305.ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        BtnSendClick(Sender);
end;

function TFrmEP305.CommRead(Param : String) : String;
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

procedure TFrmEP305.edtCmdListDblClick(Sender: TObject);
begin
    edtSend.Text := edtCmdList.Items[edtCmdList.ItemIndex];
    CommSend(edtSend.Text);
end;

procedure TFrmEP305.SetPowerOff();
begin
    CommSend('APPLY 0');
    CommSend('OUTP OFF');
end;

procedure TFrmEP305.SetPowerOn(fVolt, fCurr: double);
var
    sCommand: string;
begin
    if fVolt = 0 then
    begin
        SetPowerOff();
        exit;
    end;

    CommOpen(cmbComPort.ItemIndex + 1);

    CommSend('OUTP ON');
    DelayEx(50, True);

    sCommand := Format('APPLY %f,%f', [fVolt, fCurr]);
    CommSend(sCommand);
    DelayEx(50, True);
    CommSend(sCommand);
end;

procedure TFrmEP305.BitBtn1Click(Sender: TObject);
begin
    SetPowerOn(StrToFloatDef(edtVoltage.Text, 0), StrToFloatDef(edtCurrent.Text, 0));
end;

procedure TFrmEP305.BitBtn2Click(Sender: TObject);
begin
    SetPowerOff();
end;

end.
