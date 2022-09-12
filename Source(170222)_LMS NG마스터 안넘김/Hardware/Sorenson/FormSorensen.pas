unit FormSorensen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice;

type
  TFrmSorensen = class(TFrmDevice)
    Comm: TCommPortDriver;
    INI: ZIniData;
    Bitinitsend: TBitBtn;
    MemoRX: TMemo;
    BtnReset: TBitBtn;
    BtnLocal: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    BtnOn: TBitBtn;
    inputedit: ZIniEdit;
    inputCURR: ZIniEdit;
    BitBtn3: TBitBtn;
    StatusBar: TStatusBar;
    BtnOff: TBitBtn;
    Label_Current: TdpbLabel;
    TimerStart: TTimer;
    Edt_Send: ZIniEdit;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOnClick(Sender: TObject);
    procedure BtnOffClick(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure BtnLocalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitinitsendClick(Sender: TObject);
  private
    { Private declarations }
     bWaitComm : Boolean;
     sRecive, RxStr : String;

     function  Getcurrent : Double;
     function  GetVoltage(sValue : String) : Double;
     function  SetPower( fVolt, fCurr : double; bONOFF : Boolean) : Boolean;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmSorensen :  TFrmSorensen;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmSorensen.DevOpen(Param: String): Integer;
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
function TFrmSorensen.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmSorensen.DevInit(Param: String): Integer;
begin
    Comm.FlushBuffers(True, True);
    DevSend('CLS');
end;
//------------------------------------------------------------------------------
function TFrmSorensen.DevRead(Param: String): String;
var fValue : Double;
begin
    if Param <> '' then
    begin
        fValue := GetVoltage(Param);
    end else
    begin
        fValue := Getcurrent;

    end;

    Result := FormatFloat('0.####', fValue);
end;

//------------------------------------------------------------------------------
function TFrmSorensen.DevSend(Param: String): Integer;
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

procedure TFrmSorensen.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmSorensen.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmSorensen.BtnOnClick(Sender: TObject);
begin
    SetPower( StrToFloatDef(inputedit.Text, 0), StrToFloatDef(inputCURR.Text, 0), True);
end;

function TFrmSorensen.SetPower( fVolt, fCurr : double; bONOFF : Boolean) : Boolean;
begin
    MemoRX.Clear;

    if bONOFF then
    begin
        DevSend(Format('VSET %f;ISET %f', [fVolt, fCurr]));
        DevSend('OUT ON');
    end else
    begin
        DevSend('OUT OFF');
    end;
    result := True;
end;

procedure TFrmSorensen.SpeedButton1Click(Sender: TObject);
begin
    if not Comm.Connected then DevOpen('')
                          else DevClose('');
end;

procedure TFrmSorensen.CommReceiveData(Sender: TObject; DataPtr: Pointer;
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

procedure TFrmSorensen.BtnOffClick(Sender: TObject);
begin
    SetPower( StrToFloatDef(inputedit.Text, 0), StrToFloatDef(inputCURR.Text, 0), False);
end;

function TFrmSorensen.Getcurrent : Double;
var fTime : Double;
    sValue : string;
    i : Integer;
begin
    Result := -9999;

    if not Comm.Connected then
        Exit;

    DevSend('IOUT?');

    fTime := GetTickCountEX();
    while GetTickCountEX - fTime < 1000 do
    begin
        if not bWaitComm then break;
        Application.ProcessMessages;
    end;

    // EX) 13.003,13.00,000.00,50.00,36.0,00.0
    // 측정전압,설정전압,측정전류,설정전류,... 순서임....
//    for i:= 1 to 3 do
    sValue := GetToken(RxStr, ',');

    Result := StrToFloatDef(sValue, 0);
    Label_Current.Caption := FormatFloat('0.####', Result);
end;

procedure TFrmSorensen.BtnLocalClick(Sender: TObject);
begin
  //  DevSend('RMT 1');
end;

procedure TFrmSorensen.BitBtn3Click(Sender: TObject);
var fValue : Double;
begin
    fValue := Getcurrent();
    Label_Current.Caption := FormatFloat('0.000', fValue * 1000) + ' mA ';
end;

procedure TFrmSorensen.BitBtn2Click(Sender: TObject);
begin
    DevSend(Edt_Send.Text);
end;

procedure TFrmSorensen.BitinitsendClick(Sender: TObject);
begin
   // DevSend(Format('ADR %.2d', [Cb_Addr.ItemIndex]));
end;

function TFrmSorensen.GetVoltage(sValue : String): Double;
var fTime : Double;
    i : Integer;
    sGetValue : String;
begin
    Result := -9999;

    if not Comm.Connected then
        Exit;

    DevSend(sValue);

    fTime := GetTickCountEX();
    while GetTickCountEX - fTime < 500 do
    begin
        if not bWaitComm then break;
        Application.ProcessMessages;
    end;

    sGetValue := GetToken(RxStr, ' ');

    Result := StrToFloatDef(RxStr, 0);
end;

end.


