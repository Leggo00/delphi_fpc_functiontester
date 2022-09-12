unit FormIOTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TFrmIOTest = class(TForm)
    DOTimer: TTimer;
    MemoLog: TMemo;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Panel1: TPanel;
    Button1: TButton;
    Cb_Running: TCheckBox;
    Button2: TButton;
    Series2: TFastLineSeries;
    Button3: TButton;
    Ed_DA: TEdit;
    ADTimer: TTimer;
    Edit_AD: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure DOTimerTimer(Sender: TObject);
    procedure Cb_RunningClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADTimerTimer(Sender: TObject);
  private
    { Private declarations }
    Index : Integer;
    bFlag : Boolean;
    fStartTime : Double;
  public
    { Public declarations }
    procedure DOTest(Idx : Integer);
    procedure AddLog(Param : String);

  end;

var
  FrmIOTest: TFrmIOTest;

implementation

uses FormHWMain, GenUtils;

{$R *.dfm}

procedure TFrmIOTest.Button1Click(Sender: TObject);
begin
    FrmHWMain.Show;
end;

procedure TFrmIOTest.DOTest(Idx : Integer);
var i, nCount : Integer;
    fTime, fElapseTime : Double;
    WtStr : String;
begin
    fTime := GetTickCountEX;
    for i:= 1 to 16 do begin
        if not FrmHWMain.WriteDO(Idx, i, bFlag) then
        begin
            WtStr := Format('DO%.2d = %d : FAIL',
                [Idx, Ord(bFlag), fElapseTime]);

            //showMessage(WtStr);

            AddLog(WtStr);
            WriteDebugStr(WtStr);
        end;
    end;
    fElapseTime := GetTickCountEX - fTime;

    AddLog(Format('DO%.2d = %d : (%6.2f ms)',
        [Idx, Ord(bFlag), fElapseTime]));


    //-------------------------------------------------
    fTime := (GetTickCount - fStartTime) / 1000;

    // 그래프로 표시함.
    Chart1.Series[0].AddXY(fTime, fElapseTime);
    nCount := Chart1.Series[0].Count;
    if nCount > 5000 then Chart1.Series[0].Clear;
end;

procedure TFrmIOTest.ADTimerTimer(Sender: TObject);
var fTime, fValue : Double;
    nCount : Integer;
begin
    ADTimer.Enabled := False;

    fValue := FrmHWMain.ReadAD(1, 1);

    Edit_AD.Text := Format('%1.4f', [fValue]);

    fTime := (GetTickCountEx - fStartTime) / 1000;
    // 그래프로 표시함.
    Chart1.Series[1].AddXY(fTime, fValue);
    nCount := Chart1.Series[1].Count;
    Chart1.BottomAxis.SetMinMax(fTime-60, fTime);
    if nCount > 5000 then Chart1.Series[1].Clear;

    ADTimer.Enabled := Cb_Running.Checked;
end;


procedure TFrmIOTest.DOTimerTimer(Sender: TObject);
begin
  DOTimer.Enabled := False;

  Index := (Index + 1) mod 10;
  if Index = 0 then bFlag := not bFlag;
  
  DOTest(Index + 1);

   FrmHWMain.WriteDA(1, 1, Index);


  DOTimer.Enabled := Cb_Running.Checked;
end;

procedure TFrmIOTest.Cb_RunningClick(Sender: TObject);
begin
  DOTimer.Enabled := Cb_Running.Checked;
  ADTimer.Enabled := Cb_Running.Checked;

  if DOTimer.Enabled then
      fStartTime := GetTickCountEX;
end;

procedure TFrmIOTest.FormCreate(Sender: TObject);
begin
  Index := -1;
  bFlag := True;
end;

procedure TFrmIOTest.AddLog(Param : String);
begin
    if MemoLog.Lines.Count > 50 then
        MemoLog.Lines.Delete(0);
    MemoLog.Lines.Add(FormatDateTime('HH:NN:SS.ZZZ', Now) + ' ' + Param);
end;

procedure TFrmIOTest.Button3Click(Sender: TObject);
var fValue : Double;
begin
    fValue := StrToFloatDef(Ed_DA.Text, 0);
    FrmHWMain.WriteDA(1, 1, fValue);

    AddLog(Format('WriteDA : CH%d = %f', [1, fValue]));
end;


end.
