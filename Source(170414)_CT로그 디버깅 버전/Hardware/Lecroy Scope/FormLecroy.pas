unit FormLecroy;

{

//  Peak..값측정.

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ZINICtrl, Buttons, ComObj,
  TeEngine, Series, TeeProcs, Chart, DPBLabel;

type
  TFrmLecroy = class(TForm)
    MemoLog: TMemo;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit_IPAddr: ZIniEdit;
    BtnConnect: TSpeedButton;
    BtnDisConnect: TSpeedButton;
    Edit_Send: TEdit;
    BtnSend: TSpeedButton;
    INI: ZIniData;
    BtnAbout: TSpeedButton;
    Rg_TrigMode: TRadioGroup;
    BtnSetup: TSpeedButton;
    MemoInit: TMemo;
    Label2: TLabel;
    btnInitial: TSpeedButton;
    Label3: TLabel;
    Edit_TriggerLevel: TEdit;
    btnReadValue: TSpeedButton;
    Chart: TChart;
    Series1: TFastLineSeries;
    BtnReadScope: TSpeedButton;
    Lb_Value: TdpbLabel;
    cmbMode: ZIniComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisConnectClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
    procedure BtnSetupClick(Sender: TObject);
    procedure btnReadValueClick(Sender: TObject);
    procedure btnInitialClick(Sender: TObject);
    procedure BtnReadScopeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FScope : Variant;
    sInitFileName : String;
    gbConnectedOk: boolean;

    procedure WriteCommand(Param: String);
    function ReadCommand(Param: String): String;
  public
    { Public declarations }
    procedure AddLog(Param : String);
  end;

var
  FrmLecroy: TFrmLecroy;

implementation

{$R *.dfm}

uses
    GenUtils;

procedure TFrmLecroy.AddLog(Param : String);
begin
    with MemoLog.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param)
    end;
end;

procedure TFrmLecroy.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    
    FScope := CreateOleObject('LeCroy.ActiveDSOCtrl.1');

    sInitFileName := GetAppDir('') + 'LeCroy_Init.txt';
    try
        if FileExists(sInitFileName) then
            MemoInit.Lines.LoadFromFile(sInitFileName);
    except
    end;
end;

procedure TFrmLecroy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    try
        INI.SaveData;
        MemoInit.Lines.SaveToFile(sInitFileName);
    except
    end;
end;

procedure TFrmLecroy.BtnConnectClick(Sender: TObject);
var Str : String;
    Ret : Variant;
begin
    Str := 'IP:' + Edit_IPAddr.Text;
    Ret := FScope.MakeConnection( Str );
    if (Ret) then begin
        gbConnectedOk := True;
        AddLog('Lecroy Scope 연결완료.');
    end
    else begin
        gbConnectedOk := False;
        AddLog('Lecroy Scope 연결상태를 확인하세요');
    end;
end;

procedure TFrmLecroy.BtnDisConnectClick(Sender: TObject);
begin
//
end;

procedure TFrmLecroy.BtnSendClick(Sender: TObject);
var Param : String;
begin
    Param := Trim(Edit_Send.Text);
    if Param = '' then exit;

    if Param[Length(Param)] = '?' then
    begin
        ReadCommand(Param);
    end else
        WriteCommand(Param);

end;

procedure TFrmLecroy.BtnAboutClick(Sender: TObject);
begin
    FScope.AboutBox;
end;

procedure TFrmLecroy.BtnSetupClick(Sender: TObject);
var WtStr : String;
begin
    if not gbConnectedOk then exit;

    case Rg_TrigMode.ItemIndex of
        0: WriteCommand('TRIG_MODE STOP');
        1: WriteCommand('TRIG_MODE SINGLE');
        2: WriteCommand('TRIG_MODE NORM');
        3: WriteCommand('TRIG_MODE AUTO');
    end;

    // Trigger Level.
    WriteCommand('TRIG_LEVEL ' + Edit_TriggerLevel.Text);

    // Trigger Delay 50%
    WriteCommand('TRIG_DELAY 50.00 PCT');

end;

procedure TFrmLecroy.btnReadValueClick(Sender: TObject);
var RdStr : String;
    fValue : Double;
begin
    if not gbConnectedOk then
        BtnConnect.OnClick(self);

    RdStr := ReadCommand('PAVA? CUST' + IntToStr( cmbMode.ItemIndex+ 1) );

    if Pos('OK', RdStr) > 0 then begin
        GetToken(RdStr, ',');
        fValue := StrToFloatDef( GetToken(RdStr, ','), 0) *1000;
        Lb_Value.Caption := FloatToStr(fValue);
    end;
end;

procedure TFrmLecroy.WriteCommand(Param : String);
var Ret : Variant;
begin
    if not gbConnectedOk then
        BtnConnect.Click;
        
    if Param <> '' then begin
        AddLog('TX> ' + Param);
        FScope.WriteString(Param, True);
    end;
end;

function TFrmLecroy.ReadCommand(Param : String) : String;
var Ret : Variant;
begin
    if Param <> '' then begin
        AddLog('TX> ' + Param);
        FScope.WriteString(Param, True);
    end;

    Ret := FScope.ReadString(50);
    Result := Ret;
    AddLog('RX> ' + Ret);
end;

procedure TFrmLecroy.btnInitialClick(Sender: TObject);
var i : Integer;
    WtStr : String;
begin
    if not gbConnectedOk then exit;

    for i:= 0 to MemoInit.Lines.Count-1 do
    begin
        WtStr := Trim(MemoInit.Lines[i]);
        if (WtStr <> '') then begin
            WriteCommand(WtStr);
        end;
    end;
end;

procedure TFrmLecroy.BtnReadScopeClick(Sender: TObject);
var i, ReadCount, NumSamples : Integer;
    Waveform : Variant;
begin
    Screen.Cursor := crHourGlass;
    try
        ReadCount := 500000;

        Waveform := FScope.GetScaledWaveForm('C1', ReadCount, 0);
        NumSamples := VarArrayHighBound(Waveform, 1);

        Chart.Series[0].Clear();
        Chart.BottomAxis.SetMinMax(0, NumSamples);
        Chart.BottomAxis.Increment := Round(NumSamples / 10);
        for i := 0 to NumSamples-1 do begin
            Chart.Series[0].Add( Waveform[i] );
        end;
    finally
        Screen.Cursor := crDefault;
    end;
end;

procedure TFrmLecroy.FormDestroy(Sender: TObject);
begin
    FScope := Unassigned;
end;

end.
