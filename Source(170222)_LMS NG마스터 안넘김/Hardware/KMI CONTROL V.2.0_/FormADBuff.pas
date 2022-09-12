//------------------------------------------------------------------------------
//
//  GEN2 고속 AD Board테스트및 그래프 연산기능 관련 모듈..
//  초기모듈 정리 By woljung 2012.8.11
//
//------------------------------------------------------------------------------
unit FormADBuff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TeeProcs, TeEngine, Chart, Grids, BaseGrid, AdvGrid,
  StdCtrls, XiButton, ZINICtrl, AMLed, ExtCtrls, Series, HWGlobal, FloatList, Math, uStation,
  ValEdit;

type
  TFrmADBuff = class(TForm)
    Panel10: TPanel;
    Panel11: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    edtRecordCount: TEdit;
    cbBuffADSlot: ZIniComboBox;
    cbAutoRead: TCheckBox;
    btnBuffRead: TXiButton;
    GraphBuf: TChart;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    INI: ZIniData;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    edtSampleRate: TEdit;
    cbInterval: ZIniComboBox;
    Label1: TLabel;
    Label3: TLabel;
    EditChannel: TEdit;
    Ed_YMin: ZIniEdit;
    Label5: TLabel;
    Ed_YMax: ZIniEdit;
    Label6: TLabel;
    BtnSetAxis: TXiButton;
    Panel1: TPanel;
    ValueListEditor: TValueListEditor;
    BtnMeasure: TXiButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuffReadClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbAutoReadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSetAxisClick(Sender: TObject);
    procedure BtnMeasureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayGraph(Chart : TChart; RdBuff : TRdBuff; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
    function GetAllValue(Graph: TChart; nCh: Integer; fLowLevel, fMidLevel,
      fHighLevel, fSampleRate: Double): String;


  public
    { Public declarations }
    // 그래프를 가져온다.
    function GetADBuff(nBdIdx: Integer; sRdChannel : String; nRecordCount : Integer; fSamplingRate : Double) : Boolean;

    // TChart의 CH의 값을 MeasStrList로 옮긴다.
    function MeasValue(Chart : TChart; nCh : Integer; MeasStrList : TStrings): Boolean;
    function GetMeasValue(const sItemName : String) : String;
    function GetData(Graph: TChart; nCh: Integer; sMode: String; fSampleRate: Double): String;
  end;


var
  FrmADBuff: TFrmADBuff;

implementation

uses GenUtils, FormHWMain;

{$R *.dfm}

procedure TFrmADBuff.FormCreate(Sender: TObject);
begin
    INI.LoadData;
end;

procedure TFrmADBuff.btnBuffReadClick(Sender: TObject);
var RdBuff : TRdBuff;
    sTemp : String;
    sRdChannel : String;
    nChannelCount, nRecordCount : Integer;
    fSampleRate : Double;
    nBdIdx : Integer;
begin
    // Get Board Index
    if cbBuffADSlot.ItemIndex < 0 then exit;
    sTemp := cbBuffADSlot.Text;
    GetToKen(sTemp,')');
    nBdIdx := StrToIntDef(sTemp,0);

    nRecordCount  := StrToIntDef(edtRecordCount.text,1000);
    fSampleRate   := StrToFloatDef(edtSampleRate.text,100000);    // 100KHz
    sRdChannel    := EditChannel.text;

    // 데이터를 가져온다.
    GetADBuff(nBdIDx, sRdChannel, nReCordCount, fSampleRate);
end;


// AD Buff를 가져온다.
function TFrmADBuff.GetADBuff(nBdIdx: Integer; sRdChannel : String; nRecordCount : Integer; fSamplingRate : Double) : Boolean;
var
    fWaitTime, fCheckTime : Double;
    bAcqEnd : Boolean;
    RdBuff : TRdBuff;
    nChannelCount : Integer;

    function GetBuffChCount(sCh:String):Integer;
    var Str : String;
    begin
        Result := 0;
        while sCh <> '' do
        begin
            Str := GetToKen(sCh, ',');
            if Str <> '' then Inc(Result);
        end;
    end;

begin
    Result := False;
    nChannelCount := GetBuffChCount(sRdChannel);
    // ---------------------------------------
    // 1) 측정을 시작한다.
    // Data Acquisition Start
    if not FrmHWMain.SetADEBuff(nBdIdx, nRecordCount, fSamplingRate, sRdChannel) then exit;

    // ---------------------------------------
    // 2) 측정이 완료되었는지 확안한다.
    bAcqEnd := False;

    fWaitTime := nRecordCount / (fSamplingRate/1000) + 1000;  //  1000ms는 여분시간.
    fCheckTime := GetTickCountEx;
    while (GetTickCountEX - fCheckTime < fWaitTime) do
    begin
        bAcqEnd := True;
        if Not FrmHWMain.BuffStatus(nBdIdx) then bAcqEnd := False;

        if bAcqEnd then break;
        Application.ProcessMessages;
    end;

    //  -----------------------------------------
    // 3) 데이터를 가져온다.
    if (bAcqEnd) then begin
        RdBuff := FrmHWMain.ReadADEBuff(nBdIdx);
        if RdBuff = nil then exit;

        DisplayGraph(GraphBuf, RdBuff, nChannelCount , nRecordCount, fSamplingRate );

        BtnMeasureClick(nil);
        Result := True;
    end;
end;


procedure TFrmADBuff.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := False;
    btnBuffReadClick(Self);
    Timer1.Enabled := cbAutoRead.Checked;
end;

//------------------------------------------------------------------------------
// 측정데이터를 Chart에 표시한다.
//------------------------------------------------------------------------------
procedure TFrmADBuff.DisplayGraph(Chart : TChart; RdBuff : TRdBuff; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
var i, j, Idx, nTotalCount : Integer;
    Series : TFastLineSeries;
    fXval : Double;
const
    ColorTbl : array[0..3] of TColor = (clRed, clBlue, clGreen, clYellow);
begin
    Screen.Cursor := crHourGlass;
    try
        // Clear Graph.
        for i:= 0 to Chart.SeriesList.Count-1 do
            Chart.Series[i].Clear;

        Chart.Title.Text.Text := Format('Sampling %fK/s, RecordCount %d', [fSampling / 1000, numSampsPerChan]);
        // Series를 모두 지운다.
        Chart.RemoveAllSeries;
        for i:= 1 to nChannelCount do
        begin
            Series := TFastLineSeries.Create(Self);
            Series.ParentChart := Chart;
            Series.Title  := Format('CH%.2d', [i]);
            Series.Active := True;
            Series.Tag    := i;
            Series.XValues.Order := loAscending;
            (Series as TFastLineSeries).LinePen.Color := ColorTbl[ (i-1) mod 4 ];
            Chart.AddSeries(Series);
        end;

        // Display Graph.
        nTotalCount := numSampsPerChan * nChannelCount;

        Chart.BottomAxis.Automatic := False;
        Chart.BottomAxis.SetMinMax(0, (numSampsPerChan-1) / fSampling * 1000);

        for i:=0 to nChannelCount-1 do
        begin
            for j:=0 to numSampsPerChan - 1 do
            begin
                fXval := j / fSampling * 1000; // Sec단위를 ms단위로 표시...
                Chart.Series[i].AddXY(fXval, RdBuff[j, i]);
            end;
        end;
    finally
        Screen.Cursor := crDefault;
    end;
end;

procedure TFrmADBuff.cbAutoReadClick(Sender: TObject);
begin
    Timer1.Enabled := cbAutoRead.Checked;
end;

procedure TFrmADBuff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Timer1.Enabled := False;
    cbAutoRead.Checked := False;
    INI.SaveData;
end;

procedure TFrmADBuff.BtnSetAxisClick(Sender: TObject);
begin
    GraphBuf.LeftAxis.SetMinMax(StrToFloatDef(Ed_YMin.Text, -10), StrToFloatDef(Ed_YMax.Text, 10));
end;

procedure TFrmADBuff.BtnMeasureClick(Sender: TObject);
var i : Integer;

    fFreq1, fFreq2, fFreq3, fFreqAve, fTAve : Double;
    fRiseTime1, fRiseTime2, fRiseTime3 : Double;

    fDiffUV, fDiffVW, fDiffWU : Double;
begin
    for i:= 0 to GraphBuf.SeriesCount-1 do begin
        MeasValue(GraphBuf, i, ValueListEditor.Strings);
    end;

    if GraphBuf.SeriesCount < 3 then exit;
    // 각 U/V/W의 위상차를 계산한다.
    //  1, 2, 3번 채널에 U/V/W를 넣었다고 생각하고 처리..
    fRiseTime1 := StrToFloatDef( ValueListEditor.Strings.Values['RISETIME_1'], 0);
    fRiseTime2 := StrToFloatDef( ValueListEditor.Strings.Values['RISETIME_2'], 0);
    fRiseTime3 := StrToFloatDef( ValueListEditor.Strings.Values['RISETIME_3'], 0);

    // 주기를 구하기 위해서는 평균주파수를 계산한다.
    fFreq1 := StrToFloatDef( ValueListEditor.Strings.Values['FREQ_1'], 0);
    fFreq2 := StrToFloatDef( ValueListEditor.Strings.Values['FREQ_2'], 0);
    fFreq3 := StrToFloatDef( ValueListEditor.Strings.Values['FREQ_3'], 0);

    fFreqAve := (fFreq1 + fFreq2 + fFreq3) / 3;

    if (fFreqAve > 0) then
    begin
        fTAve := 1/ fFreqAve;  // 평균주기..
        fDiffUV := ABS(fRiseTime1 - fRiseTime2) / fTAve * 360;
        fDiffVW := ABS(fRiseTime2 - fRiseTime3) / fTAve * 360;
        fDiffWU := ABS(fRiseTime3 - fRiseTime1) / fTAve * 360;

        if (fDiffUV > 180) then fDiffUV := 360 - fDiffUV;
        if (fDiffVW > 180) then fDiffVW := 360 - fDiffVW;
        if (fDiffWU > 180) then fDiffWU := 360 - fDiffWU;

        ValueListEditor.Strings.Values['DIFF_UV'] := FormatFloat('0.###', fDiffUV);
        ValueListEditor.Strings.Values['DIFF_VW'] := FormatFloat('0.###', fDiffVW);
        ValueListEditor.Strings.Values['DIFF_WU'] := FormatFloat('0.###', fDiffWU);
    end;
end;

procedure TFrmADBuff.FormShow(Sender: TObject);
begin
    BtnSetAxisClick(Sender);
end;

function TFrmADBuff.GetMeasValue(const sItemName : String) : String;
begin
    Result := ValueListEditor.Values[sItemName];
end;

function TFrmADBuff.MeasValue(Chart : TChart; nCh : Integer; MeasStrList : TStrings): Boolean;
var i, Idx1, Idx2, nPulseCount, nHISampleCount, nLOSampleCount : Integer;
    fValue, fOldValue : Double;
    fMax, fMin, fSum, fAve, fHigh, fLow, fDuty, fFreq, fMid, fLowWidth, fHighWidth, fRiseTime : Double;
    fTime, fStartTime, fEndTime : Double;
    DataList, DutyList, FreqList, LoWidthList, HiWidthList : TFloatList;
    bHighFirst : Boolean;

    fHighLimit, fLowLimit, fFirstTime,fLastTime: Double;
    Count : Integer;
const
    INVALID_VALUE = -9999;
    SAMPLE_CNT = 10;
begin
    Result := False;
    if (nCh < 0) or (nCh >= Chart.SeriesCount) then exit;
    if (Chart.Series[nCh].Count < 1) then exit; // 측정데이터가 없는경우.

    // 2) 값을 측정한다.
    fMax  := -1E9;
    fMin  :=  1E9;
    fAve  :=  INVALID_VALUE;
    fHigh :=  INVALID_VALUE;
    fLow  :=  INVALID_VALUE;
    fDuty :=  INVALID_VALUE;
    fFreq :=  INVALID_VALUE;
    fSum  :=  0;
    fRiseTime := INVALID_VALUE;
    
    Count :=  Chart.Series[nCh].Count;

    DataList    := TFloatList.Create;
    DutyList    := TFloatList.Create;
    FreqList    := TFloatList.Create;
    LoWidthList := TFloatList.Create;
    HiWidthList := TFloatList.Create;
    try
        //---------------------------------------

        // MIN, MAX, AVE값 측정.
        for i:=0 to Count-1 do begin
            fValue := Chart.Series[nCh].YValue[i];

            if (fValue > fMax) then fMax := fValue;
            if (fValue < fMin) then fMin := fValue;
            fSum := fSum + fValue;
            DataList.Add(fValue);
        end;
        fAve := fSum / Count;
        //kws변경 기존50%에서 20%로 변경. 2012.5.29
        //fMid := 1;
        fMid := (fMax + fMin) / 5;

        //---------------------------------------
        // HIGH, LOW값 측정.
        // HIGH값은 상위 90% 이상 LEVEL의 평균값.
        // LOW값은 하위 15%이하의 평균값으로 알고리즘 수정.. 2011.12.29 정성일.
        fHigh := 0;
        fLow  := 0;
        nHISampleCount := 0;
        nLOSampleCount := 0;

        fHighLimit := ((fMax - fMin) * 0.80) + fMin;
        fLowLimit  := ((fMax - fMin) * 0.20) + fMin;

        for i:=0 to Count-1 do begin
            fValue := Chart.Series[nCh].YValue[i];
            if fValue >= fHighLimit then begin
                fHigh := fHigh + fValue;
                Inc(nHISampleCount);
            end;
            if fValue <= fLowLimit then begin
                fLow := fLow + fValue;
                Inc(nLOSampleCount);
            end;
        end;
        if nHISampleCount > 0 then
          fHigh := fHigh / nHISampleCount;

        if nLOSampleCount > 0 then
          fLow  := fLow / nLOSampleCount;

        // for duug...
        // WriteDebugStr(Format('Max=%f, HighLimit=%f, LowLimit=%f, Min=%F => High:%f, Low:%f',
        //    [fMax, fHighLimit, fLowLimit, fMin, fHigh, fLow ]));
{
        //---------------------------------------
        // HIGH, LOW값 측정.
        if (Count > 50) then begin
            Idx1 := Round(Count * 0.7);
            Idx2 := Round(Count * 0.2);

            DataList.Sort;
            fHigh := DataList.Data[Idx1];   // 상위 10%위치의 값.
            fLow  := DataList.Data[Idx2];   // 하위 10%위치의 값.
            // fMid  := (fHigh + fLow) / 2;
        end;

        fMid  := (fMax + fMin) / 2;
             }
        //---------------------------------------
        // DUTY, FREQ 측정..
        fStartTime  := -1;
        fEndTime    := -1;
        nPulseCount := 0;

        fOldValue := Chart.Series[nCh].YValue[0];
        for i:=1 to Count-1 do
        begin
            fTime  := Chart.Series[nCh].XValue[i] / 1000;   // ms단위를 Sec로 변경한다.
            fValue := Chart.Series[nCh].YValue[i];

            // 중간지점.
            if ((fOldValue <= fMid) and (  fValue > fMid )) or
               ((fOldValue >= fMid) and (  fValue < fMid )) then
            begin

                // 처음 Rise시간을 측정한다. 각 상의 위상차를 위해서 필요.
                if (fRiseTime = INVALID_VALUE) and (fValue > fMid) then begin
                    fRiseTime := fTime;
                end;

                //------------------------------------
                if (fStartTime < 0) then begin// 시작지점..
                    fStartTime := fTime;

                    // 처음시작시 High 우선인지 확인.
                    if (nPulseCount = 0) then begin
                        bHighFirst := (fValue > fMid);
                        fFirstTime := fTime;
                    end;
                end else
                //------------------------------------
                if (fEndTime < 0) then begin
                    fEndTime := fTime;
                end else
                //------------------------------------
                begin
                    //
                    //    +---------+         +--
                    //    |         |         |
                    //  --+         +---------+
                    //    fStart    fEnd     fTime
                    //

                    // 1) 주파수를 측정한다.
                    fFreq := 1 / (fTime - fStartTime);  // Hz단위로 표시..
                    FreqList.Add(fFreq);


                    // 2) Low / High Width를 측정한다.
                    if bHighFirst then begin
                        fHighWidth := (fEndTime - fStartTime);
                        fLowWidth  := (fTime - fEndTime);
                    end else begin
                        fLowWidth  := (fEndTime - fStartTime);
                        fHighWidth := (fTime - fEndTime);
                    end;
                    LoWidthList.Add(fLowWidth);
                    HiWidthList.Add(fHighWidth);

                    // 3) Duty를 측정한다.
                    fDuty := fHighWidth / (fLowWidth + fHighWidth ) * 100;
                    DutyList.Add(fDuty);

                    fStartTime := fTime;
                    fEndTime   := -1;
                    fLastTime  := fTime;
                    Inc(nPulseCount);
                end;
            end;
            fOldValue := fValue;
        end;

        // 한주기 이상되었을 경우 측정한 값들의 평균값 계산.
        if (nPulseCount > 0) then
        begin
            fDuty      := DutyList.Ave;
            //fFreq      := FreqList.Ave;
            fFreq      := 1/((fLastTime - fFirstTime)/nPulseCount); // 평균주기로 계산`
            fLowWidth  := LoWidthList.Ave;
            fHighWidth := HiWidthList.Ave;
        end;

        if Assigned(MeasStrList) then
        begin
            nCh := nCh + 1; // Chart Channel은 0부터
            MeasStrList.Values[Format('MAX_%d', [nCh])]     := FormatFloat('0.000', fMax);
            MeasStrList.Values[Format('MIN_%d', [nCh])]     := FormatFloat('0.000', fMin);
            MeasStrList.Values[Format('HIGH_%d', [nCh])]    := FormatFloat('0.000', fHigh);
            MeasStrList.Values[Format('LOW_%d', [nCh])]     := FormatFloat('0.000', fLow);
            MeasStrList.Values[Format('AVE_%d', [nCh])]     := FormatFloat('0.000', fAve);
            MeasStrList.Values[Format('FREQ_%d', [nCh])]    := FormatFloat('0.000', fFreq);
            MeasStrList.Values[Format('DUTY_%d', [nCh])]    := FormatFloat('0.000', fDuty);
            MeasStrList.Values[Format('LOWIDTH_%d', [nCh])] := FormatFloat('0.000', fLowWidth);
            MeasStrList.Values[Format('HIWIDTH_%d', [nCh])] := FormatFloat('0.000', fHighWidth);
            MeasStrList.Values[Format('RISETIME_%d', [nCh])] := FormatFloat('0.000', fRiseTime);
        end;
        
        Result := True;
    finally
        DataList.Free;
        DutyList.Free;
        FreqList.Free;
        LoWidthList.Free;
        HiWidthList.Free;
    end;
end;

// GetDatac
function TFrmADBuff.GetData(Graph : TChart; nCh : Integer; sMode : String; fSampleRate:Double) : String;
var i,j,  nCount : integer;
    fValue, fOldValue, fMaxValue, fMinValue : Double;

    fMinLevel, fMaxLevel, fMidLevel, fLowLevel, fHighLevel : Double;
    nStartIdx, nMidIdx, nEndIdx, nCount_H, nCount_L : Integer;
    fStartVal, fEndVal : Double;

    FloatLst : TFloatList;
    fValMin, fValMax : Double;
    fTime : Double;
begin
    Result := 'N/A';

    if not (nCh in [0..31]) or (Graph = nil) then exit;
    if Graph.SeriesCount < nCh then exit;
    if Graph.Series[nCh].Count < 10 then exit;

    fTime := GetTickCountEx();
    sMode := UpperCase(sMode);

    FloatLst := TFloatList.Create;
    try
        // 최대 최소값을 구한다.
        fMaxValue := -9999;
        fMinValue :=  9999;
        for i:= 0 to Graph.Series[nCh].Count-1 do
        begin
            fValue := Graph.Series[nCh].YValue[i];
            FloatLst.Add(fValue);
            fMinValue := MIN( fValue, fMinValue );
            fMaxValue := MAX( fValue, fMaxValue );
        end;
        FloatLst.Sort;

        if (fMinValue = 9999) or (fMaxValue = -9999) or (fMaxValue - fMinValue < 0.5) then
        begin
            Result := 'N/A';
            exit;
        end;

        fHighLevel := 0;
        fLowLevel := 0;

        nCount := 0;
        for i:= 0 to Round(Graph.Series[nCh].Count*0.01) do begin
          fLowLevel := fLowLevel + FloatLst.Data[i];
          Inc(nCount);
        end;
        fLowLevel := fLowLevel / nCount;

        nCount := 0;
        for i:= Round(Graph.Series[nCh].Count*0.99) to Graph.Series[nCh].Count-1 do begin
          fHighLevel := fHighLevel + FloatLst.Data[i];
          Inc(nCount);
        end;
        fHighLevel := fHighLevel / nCount;

        fMidLevel  := (fHighLevel + fLowLevel) / 2;
        fLowLevel  := (fHighLevel - fLowLevel) * 0.1 + fLowLevel;  // 10% Level
        fHighLevel := (fHighLevel - fLowLevel) * 0.9 + fLowLevel;  // 90% Level
    finally
        FloatLst.Free;
    end;

    {
    //--------------------------------------------------------------------------
    if (sMode = 'LEVEL') then
    begin
        Result := FormatFloat('0.##', fMidLevel);
    end else

    if (sMode = 'HIGH') then
    begin
        Result := FormatFloat('0.##', fHighLevel);
    end else

    if (sMode = 'LOW') then
    begin
        Result := FormatFloat('0.##', fLowLevel);
    end else

    if (sMode = 'RISE') then
    begin
        Result := GetRisingTime(Graph, nCh, fLowLevel, fMidLevel, fHighLevel);
    end else

    if (sMode = 'FALL') then
    begin
        Result := GetFallingTime(Graph, nCh, fLowLevel, fMidLevel, fHighLevel);
    end else

    if (sMode = 'FREQ') then
    begin
        Result := GetFrequency(Graph, nCh, fLowLevel, fMidLevel, fHighLevel, fSampleRate);
    end else

    if (sMode = 'DUTY') then
    begin
        Result := GetDuty(Graph, nCh, fLowLevel, fMidLevel, fHighLevel);
    end else

    }

    if (sMode = 'ALL') then   // 위상차  (Phase Difference
    begin
        // Freq,Duty,BandWidth,BandStart,Middle,High,Low
        Result := GetAllValue(Graph, nCh, fLowLevel , fMidLevel ,fHighLevel, fSampleRate) + ',' +
                  Format('%.2f',[fMidLevel])  + ',' +
                  Format('%.2f',[fHighLevel]) + ',' +
                  Format('%.2f',[fLowLevel]);

    end;

    {
    else if (sMode = 'TOOTH') then
    begin
        Result := GetTooth(Graph, nCh, fLowLevel, fMidLevel, fHighLevel,FrameIdx);
    end;
    }

end;
// Duty 를 구한다.
function TFrmADBuff.GetAllValue(Graph : TChart; nCh : Integer; fLowLevel ,fMidLevel ,fHighLevel, fSampleRate:Double):String;
var fOldValue, fValue  : Double;
    i, nCount, nFreqCount, nCount_L, nCount_H,
    nStartIdx, nEndIdx,
    nStartFreqIdx, nEndFreqIdx : Integer;
    fStartBand, fEndBand : Double;
begin
    Result := 'N/A';

    nCount   := 0;  nFreqCount := 0;
    nCount_H := 0;
    nCount_L := 0;

    nStartIdx := -1;
    nEndIdx   := -1;

    nStartFreqIdx := -1;
    nEndFreqIdx   := -1;


    // 주기 변경횟수를 계산한다.
    fOldValue := Graph.Series[nCh].YValue[0];
    for i:= 1 to Graph.Series[nCh].Count-1 do begin
        fValue := Graph.Series[nCh].YValue[i];
        if ((fOldValue <= fMidLevel) and (  fValue > fMidLevel )) or
           ((fOldValue >= fMidLevel) and (  fValue < fMidLevel )) then
        begin
            // Freq
            if nFreqCount = -1 then nStartFreqIdx := i;
            nEndFreqIdx := i;
            Inc(nFreqCount);

            // BandWidth
            if nFreqCount = 2  then fStartBand := Graph.Series[nCh].XValue[i];
            if nFreqCount = 4  then fEndBand := Graph.Series[nCh].XValue[i];

            // Duty
            if nStartIdx < 0 then nStartIdx := i else // 시작지점..
            if nEndIdx   < 0 then nEndIdx   := i else // 중간지점.
            begin
                if (fValue > fMidLevel) then begin // 미지막이 상승이였으면.. H->L 순서.   ( nStartIdx ---- nEndIdx ---- i 순서.. )
                    nCount_H := nCount_H + (nEndIdx - nStartIdx);
                    nCount_L := nCount_L + (i       - nEndIdx  );
                end else
                begin                              // 미지막이 하강이였으면.. L->H 순서.
                    nCount_L := nCount_L + (nEndIdx - nStartIdx);
                    nCount_H := nCount_H + (i       - nEndIdx  );
                end;
                nStartIdx := i;
                nEndIdx   := -1;
                Inc(nCount);
            end;
        end;
        fOldValue := fValue;
    end;

    // 주석해제 후에는 fSampleRate 조절해서 사용하세요!
    // FREQ
    if nFreqCount > 0 then begin  // 평균 반주기를 구한다.
        fValue := (nEndFreqIdx - nStartFreqIdx) / fSampleRate;   // 전체 시간 계산.  fSampleRate = Hz단위.
        fValue := 1 / ((fValue / nFreqCount) * 2);  // Hz = 1/T.

        Result := FormatFloat('0.00', fValue );
    end;

    // DUTY
    if nCount > 0 then      //한주기 이상되었을 경우.
    begin
        // Return Pos 로 한다.
        fValue := nCount_H / ( nCount_L + nCount_H) * 100;
        Result := Result + ',' + FormatFloat('0.00', fValue );
    end;

    // BAND WIDTH
    if nFreqCount > 0 then begin
        fValue := (fEndBand - fStartBand);
        //fValue := (fEndBand - fStartBand) / fSampleRate;   // 한주기의 넓이
        //fValue := fValue * 1000000;
        Result := Result + ',' + FormatFloat('0.00', fValue );
    end;

    // BAND START
    if nFreqCount > 0 then begin
        fValue := fStartBand;
        Result := Result + ',' + FormatFloat('0.00', fValue );
    end;

end;


{
// SampleRate 를 채널카운트와 비교하여 Error 를 표시
function TFrmADBuff.CheckSampleRate(sSampleRate:String):Boolean;
var bError : Boolean;
    ChCnt, MaxCh : Integer;
begin
    MaxCh  := 0;
    bError := False;
    ChCnt := BuffChCount();
    case SampleRateToHex(sSampleRate) of
       $83 : if ChCnt > 20 then begin bError := True; MaxCh :=20;  end;
       $84 : if ChCnt > 10 then begin bError := True; MaxCh :=10;  end;
       $85 : if ChCnt >  4 then begin bError := True; MaxCh := 4;  end;
       $86 : if ChCnt >  3 then begin bError := True; MaxCh := 3;  end;
       $87 : if ChCnt >  1 then begin bError := True; MaxCh := 1;  end;
       $88 : if ChCnt >  1 then begin bError := True; MaxCh := 1;  end;
       $89 : if ChCnt >  1 then begin bError := True; MaxCh := 1;  end;
       $8A : if ChCnt >  1 then begin bError := True; MaxCh := 1;  end;
       else bError := False;
    end;

    if bError then
    begin
        StatusBar1.Color := clRed;
        StatusBar1.Panels[1].Text := Format('채널카운트 오류! SampleRate [%s] 는 최대 채널은 %d 까지만 가능합니다. ',[sSampleRate,MaxCh]);
    end else begin
        StatusBar1.Color := clBtnFace;
        StatusBar1.Panels[1].Text := '';
    end;
    Result := bError;

end;
}

{
function TFrmADBuff.CheckRecordCount(nRecordCount:Integer):Boolean;
begin
    Result := True;
    if nRecordCount > 50000 then
    begin
        if Visible then ShowMessage('RecordCount 는 50000 개 까지만 가능합니다!');
        edtRecordCount.text := '50000';
        Result := False;
    end;
end;
}


end.
