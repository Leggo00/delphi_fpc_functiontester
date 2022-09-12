unit FormWSSSim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice;

type
  TFrmWSS = class(TFrmDevice)
    Comm: TCommPortDriver;
    INI: ZIniData;
    MemoRX: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    SpeedButton1: TSpeedButton;
    StatusBar: TStatusBar;
    Edt_Send: ZIniEdit;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
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
  FrmWSS :  TFrmWSS;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmWSS.DevOpen(Param: String): Integer;
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
function TFrmWSS.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmWSS.DevInit(Param: String): Integer;
begin
    Comm.FlushBuffers(True, True);
//    DevSend('CLS');
end;
//------------------------------------------------------------------------------
function TFrmWSS.DevRead(Param: String): String;
var fValue : Double;
begin
    //
end;

//------------------------------------------------------------------------------
function TFrmWSS.DevSend(Param: String): Integer;
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

procedure TFrmWSS.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmWSS.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmWSS.SpeedButton1Click(Sender: TObject);
begin
    if not Comm.Connected then DevOpen('')
                          else DevClose('');
end;

procedure TFrmWSS.CommReceiveData(Sender: TObject; DataPtr: Pointer;
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

procedure TFrmWSS.BitBtn2Click(Sender: TObject);
begin
   DevSend(Edt_Send.Text);
end;



end.


