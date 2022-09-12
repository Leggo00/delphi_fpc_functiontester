unit FormRs232Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, ExtCtrls, Buttons, XiButton,
  XiPanel, ComCtrls, DPBLabel;

type
  TFrmRs232Base = class(TForm)
    Label1: TLabel;
    INI: ZIniData;
    CommPortDriver1: TCommPortDriver;
    ListRx: TListBox;
    Button1: TButton;
    XiPanel1: TXiPanel;
    BtnConnect: TXiButton;
    BtnDisconnect: TXiButton;
    Comportbox: ZIniComboBox;
    Label2: TLabel;
    Label3: TLabel;
    BaudRatebox: ZIniComboBox;
    btnSend: TXiButton;
    edtSend: ZIniEdit;
    ZIniPanel1: ZIniPanel;
    XiPanel3: TXiPanel;
    StatusBar1: TStatusBar;
    Lb_Msg: TdpbLabel;
    BtnListClear: TXiButton;
    procedure ZIniCheckBox1Click(Sender: TObject);
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure btnSendClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
    DataSize: Cardinal);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisconnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnListClearClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
    gIndex : Integer;
    RdStr : String;
    procedure CommendOpen (Portnum: integer);
    procedure CommendClose ();
    procedure CommendSend(CmdSTR :string);
    procedure CommendInit();
  end;

var
  FrmRs232Base: TFrmRs232Base;
  const
  STX = #02;
  ENQ = #05;
  ACK = #06;
  ETX = #03;
  EOT = #04;
  LF  = #10;
  CR  = #13;
  CRLF= #13#10;



implementation

{$R *.dfm}

uses GenUtils, FormMain;


procedure TFrmRs232Base.CommendOpen(Portnum: integer);
begin
    if CommPortDriver1.Connected then exit;
    CommPortDriver1.Disconnect;
    CommPortDriver1.ComPortSpeed := StrToIntDef( BaudRatebox.Text, 115200);
    CommPortDriver1.ComPortStopBits:= sb1BITS;
    CommPortDriver1.ComPortParity := ptNONE;

    CommPortDriver1.Comport := Portnum;

    CommPortDriver1.Connect;

    if CommPortDriver1.Connected then
        StatusBar1.Panels[0].Text := Format('COM%d CONNECT',[Comportbox.ItemIndex + 1])
    else
        StatusBar1.Panels[0].Text := Format('COM%d DISCONNECT',[Comportbox.ItemIndex + 1]);

end;

procedure TFrmRs232Base.CommendClose();
begin
    CommPortDriver1.Disconnect;

    if not CommPortDriver1.Connected then
        StatusBar1.Panels[0].Text := Format('COM%d DISCONNECT',[Comportbox.ItemIndex + 1]);
end;

procedure TFrmRs232Base.CommendSend(CmdSTR :string);
begin
    CmdSTR := CmdSTR + CRLF;
    CommPortDriver1.SendData(PChar(CmdSTR),Length(CmdSTR));
end;



procedure TFrmRs232Base.ZIniCheckBox1Click(Sender: TObject);
var
    Text1: string;
begin

end;

procedure TFrmRs232Base.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
    begin
      CommendSend(edtSend.Text);
    end
end;

procedure TFrmRs232Base.btnSendClick(Sender: TObject);
var
Index, Index1, Index2, Index3 : string;

begin
    CommendSend(edtSend.Text);
end;

procedure TFrmRs232Base.CommendInit();
begin
    ListRx.Clear;
    CommPortDriver1.FlushBuffers(true, true); //inbuf, outbuf  rx 버퍼 초기화
end;

procedure TFrmRs232Base.CommReceiveData(Sender: TObject; DataPtr: Pointer; DataSize: Cardinal);
var temp: Pointer;
begin
    RdStr := RdStr + StrPas(DataPtr);
    if Pos(CRLF,RdStr) > 0 then
    begin
        RdStr := GetToKen(RdStr,CRLF);
        if (RdStr <> '') then
        begin
            Lb_Msg.Caption := RdStr;
            ListRx.Items.Add(RdStr);
        end;
        RdStr := '';
    end;
end;


procedure TFrmRs232Base.Button1Click(Sender: TObject);
var
   Text : string;
begin
    Text := '*CLS';
   CommendSend(Text);
end;


procedure TFrmRs232Base.BtnConnectClick(Sender: TObject);
begin
    CommendOpen(Comportbox.ItemIndex + 1);
end;

procedure TFrmRs232Base.BtnDisconnectClick(Sender: TObject);
begin
    CommendClose;
end;

procedure TFrmRs232Base.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmRs232Base.BtnListClearClick(Sender: TObject);
begin
    ListRx.Items.Clear;
end;

end.
