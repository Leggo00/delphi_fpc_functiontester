unit FormDcPower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ZGPIBDev, StdCtrls, Buttons, ExtCtrls, DPBLabel, ComDrv32,
  ComCtrls;

type
  TFrmE3634A = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label13: TLabel;
    btnSend: TBitBtn;
    edtCommand: TEdit;
    CmdList: TListBox;
    Button1: TButton;
    Button2: TButton;
    ReceiveList: TListBox;
    SendList: TListBox;
    Panel2: TPanel;
    iniDcPower: ZIniData;
    BitBtn1: TBitBtn;
    edtVoltage: ZIniEdit;
    edtCurrent: ZIniEdit;
    Label7: TLabel;
    Label8: TLabel;
    Comm: TCommPortDriver;
    Label9: TLabel;
    cbPort: ZIniComboBox;
    btnConnect: TSpeedButton;
    StatusBar: TStatusBar;
    btnClose: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure CmdListDblClick(Sender: TObject);
    procedure SendListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
  private
    { Private declarations }

  public
    { Public declarations }
    function CommConnect(bConnect : Boolean) : Boolean;
    procedure CommClear();
    procedure CommSend(str:string);

    procedure SendAll;
    procedure SendVoltage(fVolt, fCurr: double);
  end;

var
  FrmE3634A: TFrmE3634A;

implementation

{$R *.dfm}

uses
    GenUtils;

procedure TFrmE3634A.CommClear();
begin
    Comm.FlushBuffers(True, True);
end;

function TFrmE3634A.CommConnect(bConnect : Boolean) : Boolean;
begin
    Comm.Disconnect;

    if (bConnect) then
    begin
        Comm.ComPort := cbPort.ItemIndex + 1;
        Comm.Connect;
    end;
    Result := Comm.Connected;

    if Comm.Connected then
        StatusBar.Panels.Items[0].Text := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.Panels.Items[0].Text := 'DISCONNECT';

    CommClear;
end;

procedure TFrmE3634A.btnConnectClick(Sender: TObject);
begin
    CommConnect(not Comm.Connected);
end;

procedure TFrmE3634A.CommSend(str:string);
begin
   if Comm.Connected then
   begin
       Str := Str + CRLF;
       Comm.SendData( PChar(Str), Length(Str) );
   end;
end;

procedure TFrmE3634A.btnSendClick(Sender: TObject);
begin
    CommSend(edtCommand.text);
end;

procedure TFrmE3634A.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmE3634A.CmdListDblClick(Sender: TObject);
begin
    edtCommand.Text := Trim(CmdList.Items.Strings[CmdList.ItemIndex]);
end;

procedure TFrmE3634A.SendListDblClick(Sender: TObject);
begin
    edtCommand.Text := SendList.Items.Strings[SendList.ItemIndex] ;
end;

procedure TFrmE3634A.FormCreate(Sender: TObject);
begin
    iniDcPower.LoadData;
    btnConnect.onClick(nil);
end;

procedure TFrmE3634A.FormDestroy(Sender: TObject);
begin
    iniDcPower.SaveData;
end;

procedure TFrmE3634A.Button1Click(Sender: TObject);
begin
  ReceiveList.clear;
end;

procedure TFrmE3634A.Button2Click(Sender: TObject);
begin
  SendList.clear;
end;

procedure TFrmE3634A.SendAll;
begin
    CommSend('OUTP OFF');
    CommSend('VOLT:RANG p20V');
    CommSend('APPL 12,2.0');
end;

procedure TFrmE3634A.SendVoltage(fVolt, fCurr: double);
var
    sCommand: string;
begin
    CommSend('OUTP OFF');
    CommSend('VOLT:RANG p20V');
    sCommand := Format('APPL %f,%f', [fVolt, fCurr]);
    CommSend(sCommand);
    CommSend('OUTP ON');
end;

procedure TFrmE3634A.BitBtn1Click(Sender: TObject);
begin
    SendVoltage(StrToFloatDef(edtVoltage.Text, 0), StrToFloatDef(edtCurrent.Text, 0));
end;

procedure TFrmE3634A.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    sReadData: string;  
begin
    sReadData := StrPas(DataPtr);
  //  ReceiveList.Items.Add(Trim(sReadData));
    sReadData := '';
end;

end.
