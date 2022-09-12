unit FormWSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice;

type
  TFrmCANEmul = class(TFrmDevice)
    Comm: TCommPortDriver;
    INI: ZIniData;
    MemoRX: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    SpeedButton1: TSpeedButton;
    StatusBar: TStatusBar;
    TimerStart: TTimer;
    Edt_Send: ZIniEdit;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
     bWaitComm : Boolean;
     sRecive, RxStr : String;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmCANEmul :  TFrmCANEmul;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := ComboBox_Port.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';

    DevInit('');
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevInit(Param: String): Integer;
begin
    Comm.FlushBuffers(True, True);
//    DevSend('CLS');
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevRead(Param: String): String;
var fValue : Double;
begin
    //
end;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevSend(Param: String): Integer;
begin
    bWaitComm := True;
    if Comm.Connected then
    begin
        MemoRX.Lines.Add('> ' + Param);
        Param := Param + CR;
        Comm.SendData( PChar(Param), Length(Param) );
        Delay(50, True);
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmCANEmul.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmCANEmul.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmCANEmul.SpeedButton1Click(Sender: TObject);
begin
    if not Comm.Connected then DevOpen('')
                          else DevClose('');
end;

procedure TFrmCANEmul.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    sRecive := sRecive + StrPas(DataPtr);
    if Pos(CR, sRecive) > 0 then
    begin
        RxStr := GetTokenTrim(sRecive, CR);
        MemoRX.Lines.Add('< '+ RxStr);
        bWaitComm := False;
        sRecive := '';
    end;
end;

procedure TFrmCANEmul.BitBtn2Click(Sender: TObject);
begin
   DevSend(Edt_Send.Text);
end;

end.


