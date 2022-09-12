unit FormTDKLambda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice;

type
  TFrmTDKLamda = class(TFrmDevice)
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
    Label4: TLabel;
    Cb_Addr: ZIniComboBox;
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

     function  Getcurrent(nCh : Integer) : Double;
     function  SetPower( nAddr : Integer; fVolt, fCurr : double; bONOFF : Boolean) : Boolean;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmTDKLamda :  TFrmTDKLamda;

implementation

{$R *.dfm}
uses GenUtils, FormMain, FormHwTest;

//------------------------------------------------------------------------------
function TFrmTDKLamda.DevOpen(Param: String): Integer;
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
function TFrmTDKLamda.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmTDKLamda.DevInit(Param: String): Integer;
begin
    Comm.FlushBuffers(True, True);
    DevSend('CLS');
end;
//------------------------------------------------------------------------------
function TFrmTDKLamda.DevRead(Param: String): String;
var fValue : Double;
begin
    fValue := Getcurrent(StrToIntDef(Param, 1));
    Result := FormatFloat('0.####', fValue);
end;

//------------------------------------------------------------------------------
function TFrmTDKLamda.DevSend(Param: String): Integer;
VAR
    sRdStr, sStr : string;
    fMIN,fMax,fNow,fInc : double;
    sCmd, sValue : string;
begin
    sRdStr := Param;
    IF Pos('SWEEP:', sRdStr)> 0 THEN
    BEGIN

        sStr := '';
        GetToken(sRdStr,'SWEEP:');
        //fMIN,fMax,fInc
        sStr := GetToken(sRdStr,',');
        fMIN := StrToFloatDef(sStr, 0);
        sStr := GetToken(sRdStr,',');
        fMax := StrToFloatDef(sStr, 20); //임시20v
        sStr := GetToken(sRdStr,',');
        fInc := StrToFloatDef(sStr, 0.05);
        sCmd := sRdStr;

        sStr := FrmMain.vl_Variable.Strings.Values['SWEEP_VOLTAGE'];
        if (sStr = '') or (sStr = 'N/A') then
        begin
            fNow := fMIN;
        end else
            fNow := StrToFloatDef(sStr, 0);


        if ((fNow + fInc) > fMIN) and
           ((fNow + fInc) < fMax) then
        begin
           sValue := FloatToStr(fNow + fInc);
           Param := sCmd + ' ' +  sValue;
           FrmMain.vl_Variable.Strings.Values['SWEEP_VOLTAGE']  := sValue;
        end;
    END;

    IF NOT Comm.Connected THEN
    begin
        Comm.Connect;
        if Comm.Connected then
            StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
        else
            StatusBar.SimpleText := 'DISCONNECT';
    end;

    bWaitComm := True;
    if Comm.Connected then
    begin
        MemoRX.Lines.Add('> ' + Param);
        Param := Param + CR;
        Comm.SendData( PChar(Param), Length(Param) );
        Delayex(50, True);
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmTDKLamda.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmTDKLamda.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmTDKLamda.BtnOnClick(Sender: TObject);
begin
    SetPower( Cb_Addr.ItemIndex, StrToFloatDef(inputedit.Text, 0), StrToFloatDef(inputCURR.Text, 0), True);
end;

function TFrmTDKLamda.SetPower( nAddr : Integer; fVolt, fCurr : double; bONOFF : Boolean) : Boolean;
begin
    MemoRX.Clear;


    DevSend(Format('ADR %.2d', [nAddr]));
    if bONOFF then
    begin
        DevSend(Format('PV %f', [fVolt]));
        DevSend(Format('PC %f', [fCurr]));
        DevSend('OUT 1');
    end else
    begin
        DevSend('OUT 0');
    end;
    result := True;
end;

procedure TFrmTDKLamda.SpeedButton1Click(Sender: TObject);
begin
    if not Comm.Connected then DevOpen('')
                          else DevClose('');
end;

procedure TFrmTDKLamda.CommReceiveData(Sender: TObject; DataPtr: Pointer;
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

procedure TFrmTDKLamda.BtnOffClick(Sender: TObject);
begin
    SetPower( Cb_Addr.ItemIndex, StrToFloatDef(inputedit.Text, 0), StrToFloatDef(inputCURR.Text, 0), False);
end;

function TFrmTDKLamda.Getcurrent(nCh : Integer) : Double;
var fTime : Double;
    sValue : string;
    i : Integer;
begin
    Result := -9999;

    if not Comm.Connected then
        Exit;

    DevSend(Format('ADR %.2d', [nCh]));
    Delayex(50, True);
    DevSend('DVC?');

    fTime := GetTickCountEX();
    while GetTickCountEX - fTime < 1000 do
    begin
        if not bWaitComm then break;
        Application.ProcessMessages;
    end;

    // EX) 13.003,13.00,000.00,50.00,36.0,00.0
    // 측정전압,설정전압,측정전류,설정전류,... 순서임....
    for i:= 1 to 3 do
        sValue := GetToken(RxStr, ',');

    Result := StrToFloatDef(sValue, 0);
    Label_Current.Caption := FormatFloat('0.####', Result);
end;

procedure TFrmTDKLamda.BtnLocalClick(Sender: TObject);
begin
    DevSend('RMT 1');
end;

procedure TFrmTDKLamda.BitBtn3Click(Sender: TObject);
var fValue : Double;
begin
    fValue := Getcurrent(Cb_Addr.ItemIndex);
    Label_Current.Caption := FormatFloat('0.000', fValue * 1000) + ' mA ';
end;

procedure TFrmTDKLamda.BitBtn2Click(Sender: TObject);
begin
    DevSend(Edt_Send.Text);
end;

procedure TFrmTDKLamda.BitinitsendClick(Sender: TObject);
begin
    DevSend(Format('ADR %.2d', [Cb_Addr.ItemIndex]));
end;

end.


