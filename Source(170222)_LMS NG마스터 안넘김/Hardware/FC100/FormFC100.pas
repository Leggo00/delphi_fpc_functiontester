unit FormFC100;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ExtCtrls, StdCtrls, ComCtrls, Buttons, RealSpinEdit,
  ZGPIBDev, Spin, FormDevice;

type
  TFrmFC110 = class(TFrmDevice)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    INI: ZIniData;
    BtnConnect: TSpeedButton;
    BtnDisconnect: TSpeedButton;
    MemoLog: TMemo;
    StatusBar: TStatusBar;
    Edit_Send: TEdit;
    BtnSend: TSpeedButton;
    BtnRead: TSpeedButton;
    GPIBdev: ZGPIBdevice;
    Label1: TLabel;
    Ed_Addr: ZIniSpinEdit;
    BtnOutputON: TSpeedButton;
    BtnOutputOFF: TSpeedButton;
    Ed_Freq: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Ed_Duty: TEdit;
    procedure BtnSendClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisconnectClick(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOutputONClick(Sender: TObject);
    procedure BtnOutputOFFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
  end;

var
  FrmFC110: TFrmFC110;

implementation

uses GenUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
function TFrmFC110.DevOpen(Param: String): Integer;
begin
    GPIBdev.GPIBaddr  := Ed_Addr.Value;
    GPIBdev.Connected := True;
    StatusBar.Panels[0].Text := Format('GPIB-%d Connected', [GPIBdev.GPIBaddr])
end;
//------------------------------------------------------------------------------
function TFrmFC110.DevClose(Param: String): Integer;
begin
    GPIBdev.Connected := False;
    StatusBar.Panels[0].Text := 'Disconnected';
end;
//------------------------------------------------------------------------------
function TFrmFC110.DevInit(Param: String): Integer;
begin
//
end;
//------------------------------------------------------------------------------
function TFrmFC110.DevRead(Param: String): String;
const
    GPIB_MAX_BUFFER_SIZE = 1024;

var Buff : array[0..GPIB_MAX_BUFFER_SIZE] of Char;
begin
    if Param <> '' then
        DevSend(Param);

    GPIBdev.ibrd(@Buff, GPIB_MAX_BUFFER_SIZE);
    Result := StrPas(@Buff[0]);

    MemoLog.Lines.Add('< ' + Result);
end;

//------------------------------------------------------------------------------
function TFrmFC110.DevSend(Param: String): Integer;
begin
    GPIBdev.ibwrt(Param);
    MemoLog.Lines.Add('> ' + Param);

    Result := 1;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmFC110.BtnSendClick(Sender: TObject);
begin
    DevSend( Edit_Send.Text );
end;

procedure TFrmFC110.BtnConnectClick(Sender: TObject);
begin
    DevOpen('');;
end;

procedure TFrmFC110.BtnDisconnectClick(Sender: TObject);
begin
    DevClose('');;
end;

procedure TFrmFC110.BtnReadClick(Sender: TObject);
var RdStr : String;
begin
    RdStr := DevRead(Edit_Send.Text);
end;

procedure TFrmFC110.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmFC110.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmFC110.FormDestroy(Sender: TObject);
begin
    DevClose('');;
end;

procedure TFrmFC110.BtnOutputONClick(Sender: TObject);
begin
    DevSend('FREQ ' + Ed_Freq.Text);
    DevSend('OUTP ON');
end;

procedure TFrmFC110.BtnOutputOFFClick(Sender: TObject);
begin
    DevSend('OUTP OFF');
end;


end.
