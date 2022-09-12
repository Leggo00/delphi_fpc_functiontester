unit FormTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, CheckLst, Global, Series,
  Grids, BaseGrid, AdvGrid, ComCtrls, HWGlobal;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    CheckListBox1: TCheckListBox;
    Button3: TButton;
    Chart1: TChart;
    edtRecordCount: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtSampleRate: TEdit;
    CheckBox1: TCheckBox;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    Chart3: TChart;
    FastLineSeries4: TFastLineSeries;
    FastLineSeries5: TFastLineSeries;
    FastLineSeries6: TFastLineSeries;
    Chart4: TChart;
    FastLineSeries7: TFastLineSeries;
    FastLineSeries8: TFastLineSeries;
    FastLineSeries9: TFastLineSeries;
    Chart5: TChart;
    FastLineSeries10: TFastLineSeries;
    FastLineSeries11: TFastLineSeries;
    FastLineSeries12: TFastLineSeries;
    Chart6: TChart;
    FastLineSeries13: TFastLineSeries;
    FastLineSeries14: TFastLineSeries;
    FastLineSeries15: TFastLineSeries;
    Chart7: TChart;
    FastLineSeries16: TFastLineSeries;
    FastLineSeries17: TFastLineSeries;
    FastLineSeries18: TFastLineSeries;
    Chart8: TChart;
    FastLineSeries19: TFastLineSeries;
    FastLineSeries20: TFastLineSeries;
    FastLineSeries21: TFastLineSeries;
    Chart9: TChart;
    FastLineSeries22: TFastLineSeries;
    FastLineSeries23: TFastLineSeries;
    FastLineSeries24: TFastLineSeries;
    Chart10: TChart;
    FastLineSeries25: TFastLineSeries;
    FastLineSeries26: TFastLineSeries;
    FastLineSeries27: TFastLineSeries;
    Memo1: TMemo;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit2: TEdit;
    Label4: TLabel;
    CheckBox4: TCheckBox;
    Chart2: TChart;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    FastLineSeries3: TFastLineSeries;
    Grid: TAdvStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure DisplayBuff(Graph: TChart; BdIdx, nChCnt, nRecordCount: Integer; fSampleRate:Double;
      RdBuff: TRdBuff);
    procedure MakeGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses FormHWMain, GenUtils, FormADBuff, uEthernetAD;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    FrmHWMain.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var Ch : Integer;
begin
    for Ch:= 1 to 16 do
        FrmHWMain.WriteDO(1, Ch, True);
    for Ch:= 1 to 16 do
        FrmHWMain.WriteDO(1, Ch, False);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var fValue : Double;
begin
    Timer1.Enabled := False;
    fValue := FrmHWMain.ReadAD(2, 2);
    Edit1.Text := FloatToStr(fValue);
    if CheckBox1.Checked then Button3Click(Self);
    Timer1.Enabled := True;    
end;

procedure TForm1.Button3Click(Sender: TObject);
var  RdBuff : TRdBuff;
     sCh : String;
     nBdIdx, i, j, nChCnt, nReCordCount, nADEBdIdx : Integer;
     Graph : array  [0..9] of TChart;
     fWaitTime : Double;
     fSampleRate : Double;

     fTime, fCheckTime, fOldTime : Double;
     bAcqEnd : Boolean;
     nOk : Integer;
     sResult : String;
     fLevel, fHigh, fLow, fFreq, fDuty, fBandCenter : Double;
const
    CH_START=0;
    CH_COUNT=9;
begin

    nChCnt := 0;
    for i:=CH_START to CheckListBox1.Items.Count-1 do
    begin
        if CheckListBox1.Checked[i] then
        begin
            sCh := sCh + IntToStr(i+1) + ',';
            Inc(nChCnt);
        end;
    end;

    Graph[0] := Chart1;
    Graph[1] := Chart2;
    Graph[2] := Chart3;
    Graph[3] := Chart4;
    Graph[4] := Chart5;
    Graph[5] := Chart6;
    Graph[6] := Chart7;
    Graph[7] := Chart8;
    Graph[8] := Chart9;
    Graph[9] := Chart10;


    //--------------------------------------------------------------------------
    nReCordCount := StrToIntDef(edtRecordCount.text,0);
    fSampleRate  := StrToFloatDef(edtSampleRate.text, 1000000);

    fTime :=GetTickCountEX;

    for i:=CH_START to CH_COUNT do
    begin
        nBdIdx := i;
        FrmHWMain.SetADEBuff(nBdIdx, nReCordCount, fSampleRate, sCh);
    end;
    if CheckBox4.Checked then    Memo1.Lines.Add(Format('1: %f', [  GetTickCountEX - fTime ]));
    fOldTime := GetTickCountEX;

    fWaitTime := nRecordCount / (fSampleRate/1000) + 500;
    //fWaitTime := 5000;

    //--------------------------------------------------------------------------
    // 모두 측정했는지 확인
    fCheckTime := GetTickCountEx;
    while (GetTickCountEX - fCheckTime < fWaitTime) do
    begin
        bAcqEnd := True;
        for i:=CH_START to CH_COUNT do
            if not FrmHWMain.BuffStatus(i) then bAcqEnd := False;

        if bAcqEnd then break;

        //application.ProcessMessages;
        //Sleep(1);
    end;
    if not bAcqEnd then exit;

    //--------------------------------------------------------------------------
    //DelayEx(fWaitTime+10,True);
    if CheckBox4.Checked then Memo1.Lines.Add(Format('2:%f---------->(2-1) %f', [  GetTickCountEX - fTime, GetTickCountEX- fOldTime ]));
    fOldTime := GetTickCountEX;

    //fTime :=GetTickCountEX;
    for i:=CH_START to CH_COUNT do
    begin
        nBdIdx := i;
        RdBuff := FrmHWMain.ReadADEBuff(nBdIdx);
        if RdBuff = nil then Continue;

        DisplayBuff(Graph[i], nBdIdx, nChCnt, nReCordCount, fSampleRate, RdBuff);

        if Not CheckBox2.Checked then continue;
        for j:=0 to nChCnt-1 do
        begin
            sResult := FrmADBuff.GetData(Graph[i], j, 'ALL', fSampleRate);
            if CheckBox4.Checked then    Memo1.Lines.Add(sResult);
            Grid.Cells[(j*7)+1 ,i+1] := GetToKen(sResult,',');  // FREQ
            Grid.Cells[(j*7)+2 ,i+1] := GetToKen(sResult,',');  // DUTY
            Grid.Cells[(j*7)+3 ,i+1] := GetToKen(sResult,',');  // BAND WIDTH
            Grid.Cells[(j*7)+4 ,i+1] := GetToKen(sResult,',');  // BAND START
            Grid.Cells[(j*7)+5 ,i+1] := GetToKen(sResult,',');  // MID LEVEL
            Grid.Cells[(j*7)+6 ,i+1] := GetToKen(sResult,',');  // HIGH LEVEL
            Grid.Cells[(j*7)+7 ,i+1] := GetToKen(sResult,',');  // LOW LEVEL
        end;

    end;
    if CheckBox4.Checked then    Memo1.Lines.Add(Format('3:%f---------->(3-2) %f', [  GetTickCountEX - fTime, GetTickCountEX- fOldTime ]));

end;


// TRdBuff 로 그래프를 그린다.
procedure TForm1.DisplayBuff(Graph:TChart; BdIdx, nChCnt, nRecordCount:Integer; fSampleRate:Double; RdBuff:TRdBuff);
var i, j, nInterval, nIdx, nMaxRecord : Integer;
    nXValue : Double;
begin
    if nChCnt = 0 then exit;

    nInterval := StrToIntDef(Edit2.text,1);
    nMaxRecord := Round(nRecordCount/nInterval);

    Graph.BottomAxis.Minimum := 0;
    Graph.BottomAxis.Maximum := (nRecordCount/fSampleRate)*1000;

    try
        for i:=0 to nChCnt-1 do
        begin
            Graph.Series[i].Clear;

            for j:=0 to nMaxRecord-1 do
            begin
                nIdx := j*nInterval;
                nXValue := (nIdx / fSampleRate)*1000;
                Graph.Series[i].AddXY(nXValue, RdBuff[nIdx,i]);
            end;
        end;
    finally
        Graph.Update;
    end;
end;


procedure TForm1.MakeGrid;
var i : Integer;
begin
    with Grid do
    begin
        Clear;

        RowCount := 11;
        ColCount := 19;

        Cells[0,0]   := 'BOARD NO';

        Cells[1,0]   := 'FREQ1';
        Cells[2,0]   := 'DUTY1';
        Cells[3,0]   := 'BANDWIDTH';
        Cells[4,0]   := 'BANDSTART';
        Cells[5,0]   := 'LEVEL';
        Cells[6,0]   := 'HIGH';
        Cells[7,0]   := 'LOW';

        Cells[8,0]   := 'FREQ2';
        Cells[9,0]   := 'DUTY2';
        Cells[10,0]  := 'BANDWIDTH';
        Cells[11,0]  := 'BANDSTART';
        Cells[12,0]  := 'LEVEL';
        Cells[13,0]  := 'HIGH';
        Cells[14,0]  := 'LOW';

        Cells[15,0]  := 'FREQ3';
        Cells[16,0]  := 'DUTY3';
        Cells[17,0]  := 'BANDWIDTH';
        Cells[18,0]  := 'BANDSTART';
        Cells[19,0]  := 'LEVEL';
        Cells[20,0]  := 'HIGH';
        Cells[21,0]  := 'LOW';
        for i:=1 to 10 do
            Cells[0,i] := Format('BD%d',[i]);

    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    MakeGrid;
    CheckListBox1.Checked[0]  := True;
    CheckListBox1.Checked[1]  := True;
    CheckListBox1.Checked[17] := True;
    Timer1.Enabled := True;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
    bSaveLog := Checkbox3.Checked;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    Timer1.Enabled := False;
end;

end.


