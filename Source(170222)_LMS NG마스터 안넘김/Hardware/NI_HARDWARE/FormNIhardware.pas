unit FormNIhardware;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Buttons,
  Spin, ZINICtrl, {UnitWaveData, }XiButton, ImgList, WolfImage, Grids,
  ComCtrls, DPBLabel, XiPanel, WPaintBox, CheckLst, FloatList, Math, UnitGraph,
  SyncObjs;

const
    TRIG_SOFT = 0;
    TRIG_RISE = 1;
    TRIG_FALL = 2;
type

  //---------------------------------------------------
  // NI Task Controll Class.
  TDAQmxTask = class
  private
    hTask           : THandle;
    nChannelCount   : Integer;  // 채널수.
    numSampsPerChan : integer;  // 채널당 샘플수.
    fSampling       : Double;
  public
    constructor Create;
    destructor  Destroy; override;
    function    Start : Integer;
    function    Stop : Integer;
    function    CreateAIVoltageChan(sChannels : String) : Integer;
    function    CfgAnlgEdgeStartTrig(nTriggerMode : Integer; sTriggerSrc : String; fTriggerLevel : Double) : Integer;
    function    CfgSampClkTiming(fSampling : Double; numSampsPerChan : Integer; bContSamp : Boolean = False) : Integer;
    function    ReadAnalogF64(var Buff : array of Double; nBuffSize : Integer; fTimeout : Double = 10000) : Integer;
    function    IsTaskDone(var bTaskDone : Boolean) : Integer;
 end;

{

    Idx := 0;
    for i:= 0 to NIScopeThread.ChCount-1 do begin
        for j:= 0 to NIScopeThread.SampleCount-1 do begin
            if Idx > High(NIScopeThread.Buff) then break;

            ChIdx := i;  // <- 이걸 어디서 가져오지?

            XValue := Idx / NIScopeThread.Sampling;             // Time.
            YValue := NIScopeThread.Buff[Idx];     // Value;
            ViewGraph.Channel[ChIdx].AddXY( XValue, YValue );
            Inc(Idx);
        end;
}

  //---------------------------------------------------
  // 읽기용 Thread..
  TNIReadThread = class(TThread)
  private
    ChStr, TriggerSrc : String;
    ChList : TStringlist;
    FLockCount : Integer;
    m_Critical : TCriticalSection;
    function IsLock: Boolean;
  public
    Buff : array of Double;

    Sampling, TriggerLevel : Double;
    ChCount, SampleCount, TriggerMode : Integer;

    OnReadEnd : procedure (Sender : TObject) of object;
    constructor Create(ChStr : String; ChCount, SampleCount : Integer; fSampling : Double; nTriggerMode : Integer; sTriggerSrc : String; fTriggerLevel : Double);
    destructor  Destroy; override;
    procedure   Execute; override;
    function    GetChString(Idx : Integer) : String;
    procedure   Lock;
    procedure   UnLock;
  end;

  //---------------------------------------------------
  TFrmNI_Hardware = class(TForm)
    INI: ZIniData;
    OpenDialog: TOpenDialog;
    ImageList_Led: TImageList;
    XiPanel18: TXiPanel;
    dpbLabel1: TdpbLabel;
    Bevel2: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Edit_Dev2: ZIniEdit;
    Edit_AI_Sampling: ZIniEdit;
    Edit_AI_Channel: ZIniSpinEdit;
    Edit_AI_DataCount: ZIniSpinEdit;
    Edit_Dev2Trigger: ZIniEdit;
    Rg_Trigger2: ZIniRadioGroup;
    Edit_TriggerLevel2: ZIniEdit;
    BtnReadAd: TXiButton;
    XiButton1: TXiButton;
    CheckListBoxAD: TCheckListBox;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Led1: TWolfImage;
    Label17: TLabel;
    Label3: TLabel;
    Edit_Dev1: ZIniEdit;
    Edit_Timing: ZIniEdit;
    Edit_AOChCount: ZIniSpinEdit;
    Edit_AODataCount: ZIniSpinEdit;
    RadioGroup1: TRadioGroup;
    Edit_Dev1Trgger: ZIniEdit;
    Rg_Trigger1: ZIniRadioGroup;
    Edit_TriggerLevel1: ZIniEdit;
    ZIniEdit1: ZIniEdit;
    Label20: TLabel;
    TabSheet3: TTabSheet;
    MemoVal: TMemo;
    Label13: TLabel;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label18: TLabel;
    ListBoxBuff: TListBox;
    Button1: TButton;
    Button2: TButton;
    BtnFindHardware: TXiButton;
    PaintBoxGraph: TWolfPaintBox;
    MemoDebug: TMemo;
    ChartAD: TChart;
    Series1: TFastLineSeries;
    BtnAdChReset: TBitBtn;
    Panel1: TPanel;
    edtFactor: ZIniEdit;
    CheckBox1: TCheckBox;
    edtMin: ZIniEdit;
    edtMax: ZIniEdit;
    Button3: TButton;
    Label19: TLabel;
    cbData: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnReadAdClick(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
    procedure CheckListBoxADClick(Sender: TObject);
    procedure BtnAdChResetClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnFindHardwareClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBoxGraphPaint(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    fCheckTime : Double;
    Status : Integer;
    aoTask, aiTask : THandle;
    bAORunning, bAIRunning: Boolean;
    Graph : TGraph;

    procedure AddDebug(Param: String);
    procedure FindHardware;
    function  CheckError(Status : Integer; MsgStr : String; var TotalResult : Boolean) : Boolean;
    procedure CalcPulse(FloatList : TFloatList;
            fTrigLevel, fSampling : Double; var fPeak, fTime1, fTime2 : Double);

    { Private declarations }
  public
    { Public declarations }
    // Squib 측정결과.
    procedure ResetIO;
    function  ReadWave(Graph : TGraph; ChStr : String; nChannelCount, numSampsPerChan : Integer; fSampling : Double; nFilterMode: integer; sTrigger : String = '') : Boolean;
    function  WriteWave( nDataCount, nChannelCount : Integer; fSampling : Double; AO_Data : array of Double) : Boolean;

    function  ReadAD(sChannels : String) : Double;
    function  ReadADBuff(sChannels : String;  nChannelCount, numSampsPerChan : integer;  fSampling : Double;
        nTriggerMode : Integer; sTriggerSrc : String;  fTriggerLevel : Double; var Buff : array of Double) : Boolean;
    procedure DisplayGraph(Chart : TChart; var Buff : array of Double; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
    procedure DisplayGraph2(Graph : TGraph; var Buff : array of Double; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
    procedure DisplayValue(ChStr : String; var Buff : array of Double; nChannelCount : Integer);
  end;

var
  FrmNI_Hardware: TFrmNI_Hardware;
  function GetErrorString(Status : Integer) : String;

implementation

uses NiDAQmxf, GenUtils, FormGraph;

{$R *.dfm}

function GO_Filter( var Buff : array of Double;  nCount : Integer) : Boolean;
var i : Integer;

    nFACTOR : integer;
begin
    nFACTOR := StrToIntDef(FrmNI_Hardware.edtFactor.text,4);
    for i := 1 to nCount-1 do begin
         Buff[i] := ((nFACTOR * Buff[i-1]) + Buff[i]) / ( nFACTOR + 1);
    end;

{
    for i := 1 to nCount-2 do begin
        fPrev := Buff[i-1];
        fMid  := Buff[i];
        fNext := Buff[i+1];

        fDiff :=  ABS(fPrev - fNext);
        if (ABS(fPrev - fMid) > fDiff * 5) and
           (ABS(fNext - fMid) > fDiff * 5) then
        begin
            Buff[i] := (fPrev + fNext) / 2;
        end;
    end; }
end;


procedure TFrmNI_Hardware.FormCreate(Sender: TObject);
var i : Integer;
    ChStr : String;
    bRet : Boolean;
begin
    INI.LoadData;

    CheckListBoxAD.Items.Clear;
    for i:= 0 to 63 do begin
        CheckListBoxAD.Items.Add(Format('ai%d', [i]));
    end;

    PaintBoxGraph.Align := alClient;

    Graph := TGraph.Create;
    Graph.FrontColor := clWhite;
    Graph.BackColor  := clWhite;
    Graph.LineColor  := clGray;
    Graph.bViewSplit := True;

    // 축을설정한다.
    Graph.BottomAxis.SetAxisRange(0, 5, 0);
    Graph.BottomAxis.AxisName := 'TIME (Sec)';

    Graph.LeftAxis.SetAxisRange(0, 10, 0);
    Graph.LeftAxis.AxisName := 'LEVEL (V)';
end;

procedure TFrmNI_Hardware.FormDestroy(Sender: TObject);
begin
    try
        Graph.Free;
        Graph := nil;
    except
    end;
end;

procedure TFrmNI_Hardware.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmNI_Hardware.AddDebug(Param : String);
VAR fileName : STRING;
begin
    if MemoDebug.Lines.Count > 100 then
        MemoDebug.Lines.Delete(0);
    if MemoDebug.Lines.Count > 150 then
        MemoDebug.Lines.Clear;


    MemoDebug.Lines.Add(Param);
end;


procedure TFrmNI_Hardware.FindHardware;
var DevStr : String;
    i,j,bd,ch: integer;
    chStrDi,chStrDo: string;
    DevSerial : ui32;
    dev, DevName, ChStr : string;
    sampsPerChanWritten,sampsPerChanRead: i32;

    // 파형을 저장할 데이터 폴더.
    m_vWfm1: OleVariant;
    bTaskDone : LongBool;
    nTime : Integer;
begin     {
    // dev1의 장착유무를 찾는다.
    bd := 0;
    DevStr := 'dev2';
    status := DAQmxGetDevSerialNum(PChar(DevStr), DevSerial);
    if Status = 0 then
        Memo1.Lines.Add( Format('DAQmxGetDevSerial: %.X', [ DevSerial ]) )
    else
        Memo1.Lines.Add( 'Dev0 not found');
//    DAQmxGetErrStr(Status);

    // Board Type을 찾는다.
    if DevSerial <> 0 then begin
        FillChar(DevStr, 255, #0);
        Status := DAQmxGetDevProductType(PChar(dev), DevStr, 255);
        if Status = 0 then begin
            DevName   := StrPas(DevStr);
            Memo1.Lines.Add( Format('Device(%d): %s',[ bd, DevName ]) );
        end;
    end; }
end;


// WAVE FORM를 생성한다.
function  TFrmNI_Hardware.WriteWave( nDataCount, nChannelCount : Integer; fSampling : Double; AO_Data : array of Double) : Boolean;
var numSampsPerChan : Integer;
    ChStr : String;
    nTime, Status, nTimeOut, nTriggerSlope: i32;
    sampsPerChanWritten,sampsPerChanRead: i32;
    bTaskDone : LongBool;
    TrgSrc : String;
    sampleMode : i32;
    fTriggerLevel : Double;
    bStepResult : Boolean;
begin
{
    if nChannelCount < 1 then exit;

    Led1.OnOff := True;

    numSampsPerChan :=  nDataCount;

    TrgSrc := Edit_Dev1Trgger.Text;
    fTriggerLevel := StrToFloatDef(Edit_TriggerLevel1.Text, 0);

    bAORunning := True;
    fCheckTime := GetTickCountEx;
    MemoDebug.Lines.Clear;
    AddDebug(Format('* Channel Count : %d, numSampsPerChan : %d, Data Count : %d', [nChannelCount, numSampsPerChan, nDataCount]));

    //1) Task를 생성한다.
    Status := DAQmxCreateTask('', aoTask);
    CheckError(Status, 'Create AO Task', Result);

    // 2) AO 채널을 생성한다.
    // 다채널을 하는경우에는 'Dev2/ao0:7 의형태로 입력하고 버퍼를 나누어 쓴다.'
    ChStr := Edit_Dev1.Text;
    Status := DAQmxCreateAOVoltageChan(aoTask,  // task Handle
        PChar(ChStr), '',                       // physicalChannel, nameToAssignToChannel
        -10.0, 10.0, DAQmx_Val_Volts, '');      // minVal, maxVal, units, customScaleName.
    CheckError(Status, 'DAQmxCreateAOVoltageChan', Result);


    case RadioGroup1.ItemIndex of
        0 : sampleMode := DAQmx_Val_FiniteSamps;
        1 : sampleMode := DAQmx_Val_ContSamps;
    end;

    // 3) 수집하거나 생성할 샘플 클럭의 소스, 샘플 클럭의 속도, 샘플의 개수를 설정합니다.
    Status := DAQmxCfgSampClkTiming(aoTask, '',     // task Handle, source,
        fSampling, DAQmx_Val_Rising,                // rate, activeEdge
        sampleMode,                                 // sampleMode, -> 한번만 출력.
        numSampsPerChan);                           // sampsPerChanToAcquire
    CheckError(Status, Format('DAQmxCfgSampClkTiming: %d',[ Status ]), Result );

    // 4) 트리거를 설정한다.
    if (Rg_Trigger1.ItemIndex > 0) then
    begin
        case Rg_Trigger2.ItemIndex of
            1: nTriggerSlope := DAQmx_Val_RisingSlope;
            2: nTriggerSlope := DAQmx_Val_FallingSlope;
        end;
        Status := DAQmxCfgAnlgEdgeStartTrig(aoTask,
                PChar(TrgSrc),      // Trigger Source.
                nTriggerSlope,      // DAQmx_Val_FallingSlope or  DAQmx_Val_RisingSlope
                fTriggerLevel);
        CheckError(Status, Format('DAQmxCfgAnlgEdgeStartTrig: %d',[ Status ]), Result );
    end;


    // 5) 파형을 출력한다.
    Status := DAQmxWriteAnalogF64(aoTask,                  // taskHandle
                  numSampsPerChan, false,                 //  numSampsPerChan,  autoStart
                  10, bool32(DAQmx_Val_GroupByScanNumber), { bool32(DAQmx_Val_GroupByChannel)   //  timeout, dataLayout,
                  AO_Data, sampsPerChanWritten, nil);     //  writeArray,  sampsPerChanWritten, reserved
    CheckError(Status, Format('DAQmxWriteAnalogF64 : Writen Data %d',[ sampsPerChanWritten ]), Result );

    // 6) Task 시작.
    Status := DAQmxStartTask(aoTask);
    CheckError(Status, Format('Start Task: %d',[ Status ]), Result );

    // 7) Task가 중지될때까지 대기.
    nTime := GetTickCount;
    while GetTickCount - nTime < 10000 do begin
        DAQmxIsTaskDone(aoTask, bTaskDone);
        if (bTaskDone) or (not bAORunning) then break;
        Application.ProcessMessages;
    end;

    // 8) Task 중지
    Status := DAQmxStopTask (aoTask);
    CheckError(Status, Format('Stop Task: %d',[ Status ]), Result );
    bAORunning := False;

    // 9) Task 초기화.
    Status := DAQmxClearTask(aoTask);
    AddDebug(Format('Clear Task: %d',[ Status ]) );

    Led1.OnOff := False; }
end;


function TFrmNI_Hardware.CheckError(Status : Integer; MsgStr : String; var TotalResult : Boolean) : Boolean;
var StrChar : array[0..256] of Char;
begin
    if MsgStr <> '' then
        AddDebug('> ' + MsgStr);

    if Status <> 0 then
    begin
        DAQmxGetErrorString(Status, StrChar, 255);
        AddDebug(Format('    *> ERROR : %d (%s)', [Status, String(StrChar)]));
        TotalResult := False;
        Result := False;
    end else
        Result := True;
end;

{    //
    int32 DAQmxCreateTask (const char taskName[], TaskHandle *taskHandle);
    Status := DAQmxCreateTask('', viTask[bd][ch]);
    Memo1.Lines.Insert( 0, Format('Status(CreateTask vi): %d: %.X(bd:%d)',[ Status, viTask[bd][ch], bd ]) );
    Status := DAQmxCreateAIVoltageChan(viTask[bd][0], PChar(chStr_ai[bd][0]), '', DAQmx_Val_RSEal_Cfg_Default, -10.0, 10.0, DAQmx_Val_Volts, '');

    {
        if (DevHeader[bd] = 'PCI-6') then begin
          Status := DAQmxCreateTask('', voTask[bd]);
          Memo1.Lines.Insert( 0, Format('Status(CreateTask vo: %d: %.X(bd:%d)',[ Status, voTask[bd], bd ]) );
          Status := DAQmxCreateAOVoltageChan(voTask[bd], PChar(chStr_ao[bd]), '', minVal, maxVal, DAQmx_Val_Volts, '');
          Memo1.Lines.Insert( 0, Format('Status(Create VOChan): %d(bd:%d)',[ Status, bd ]) );

          if (DevHeader[bd] <> 'PCI-6711') then begin
            for ch := 0 to 2 do begin
              Status := DAQmxCreateTask('', viTask[bd][ch]);
              Memo1.Lines.Insert( 0, Format('Status(CreateTask vi): %d: %.X(bd:%d)',[ Status, viTask[bd][ch], bd ]) );
	            //Status := DAQmxCreateAIVoltageChan(viTask[bd][0], PChar(chStr_ai[bd][0]), '', DAQmx_Val_RSE{DAQmx_Val_Cfg_Default, -10.0, 10.0, DAQmx_Val_Volts, '');
              Status := DAQmxCreateAIVoltageChan(viTask[bd][ch], PChar(chStr_ai[bd][ch]), '', {DAQmx_Val_RSEDAQmx_Val_Cfg_Default, -10.0, 10.0, DAQmx_Val_Volts, '');
              Memo1.Lines.Insert( 0, Format('Status(Create VIChan): %d(bd:%d)',[ Status, bd ]) );
            end;
          end;
    }
{

    if coTask[b][k] <> 0 then begin
      Status := DAQmxStopTask (coTask[b][k]);
      //Memo1.Lines.Insert( 0, Format('Stop: %d',[ Status ]) );
      Status := DAQmxClearTask(coTask[b][k]);
      //Memo1.Lines.Insert( 0, Format('Clear: %d',[ Status ]) );
      coTask[b][k] := 0;
    end;
    Status := DAQmxCreateTask('', coTask[b][k]);
    //Memo1.Lines.Insert( 0, Format('CreateTask: %d: %d(bd:%d)',[ Status, coTask[b][k], b ]) );
    if (Frequency = 0) or (Duty = 0) or (Duty = 100) then begin
      if (Duty = 100) or (Frequency = 0) then
        Polarity := DAQmx_Val_High
      else
        Polarity := DAQmx_Val_Low;
      dName := copy(DevName[b], 1, 6);
      if dName = 'PCI-62' then
        maxFreq := 20000000
      else
        maxFreq := 5000000;
      Status := DAQmxCreateCOPulseChanFreq(coTask[b][k], PChar(chStr_co[b][k]), '',
                          DAQmx_Val_Hz, Polarity, 0.0, maxFreq, 0.50);
      //Memo1.Lines.Insert( 0, Format('Create co_ch: %d(ch:%d)',[ Status, b ]) );
      Status := DAQmxCfgImplicitTiming(coTask[b][k], DAQmx_Val_FiniteSamps, 1);
      //Memo1.Lines.Insert( 0, Format('Implicit(FiniteSamps): %d',[ Status ]) );
    end else begin
      Status := DAQmxCreateCOPulseChanFreq(coTask[b][k], PChar(chStr_co[b][k]), '',
                          DAQmx_Val_Hz, DAQmx_Val_Low, 0.0, Frequency, Duty/100);
      //Memo1.Lines.Insert( 0, Format('Create co_ch: %d(ch:%d)',[ Status, b ]) );
      Status := DAQmxCfgImplicitTiming(coTask[b][k], DAQmx_Val_ContSamps, 1);
      //Memo1.Lines.Insert( 0, Format('Implicit(ContSamps): %d',[ Status ]) );
      {
      //Status := DAQmxStartTask(coTask[b][k]);
      //Memo1.Lines.Insert( 0, Format('Start: %d',[ Status ]) );
      //Status := DAQmxWriteCtrFreqScalar(coTask[b][k], false, 10, Frequency, Duty/100, nil);
      //Memo1.Lines.Insert( 0, Format('WriteCtrFreq: %d(ch:%d)',[ Status, b ]) );

    end;
    Status := DAQmxStartTask(coTask[b][k]);
}

procedure TFrmNI_Hardware.CheckListBoxADClick(Sender: TObject);
var Str : String;
  i, nCount : Integer;
begin
    Str := '';
    nCount := 0;
    for i:= 0 to CheckListBoxAD.Items.Count-1 do begin
        if CheckListBoxAD.Checked[i] then
        begin
            Str := Str + Format('Dev1/ai%d,', [i]);
            Inc(nCount);
        end;
    end;

    if nCount > 0 then begin
        Edit_Dev2.Text := Copy(Str, 0, Length(Str)-1);
        Edit_AI_Channel.Value := nCount;
    end else begin
        Edit_Dev2.Text := '';
    end;
end;

//=======================================================================================================================
function TFrmNI_Hardware.ReadWave(Graph : TGraph; ChStr : String; nChannelCount, numSampsPerChan : Integer; fSampling : Double; nFilterMode: integer; sTrigger : String = '') : Boolean;
var Ret : Boolean;
    nTriggerMode    : Integer;  // 트리거 모드
    sTriggerSrc     : String;   // 트리거 소스
    fTriggerLevel   : Double;   // 트리거 레벨.
    AI_DATA : array of Double;
begin
    if (ChStr = '') or (nChannelCount < 1) or (numSampsPerChan < 1) then exit;

    nTriggerMode  := TRIG_SOFT;
    sTriggerSrc   := '';
    fTriggerLevel := 0;

    SetLength(AI_DATA, nChannelCount * numSampsPerChan);
    try
        Ret := ReadADBuff(ChStr, nChannelCount, numSampsPerChan, fSampling, nTriggerMode, sTriggerSrc, fTriggerLevel, AI_Data);
        if (nFilterMode = 1) then
        begin
            GO_Filter(AI_Data, nChannelCount * numSampsPerChan);
        end;
        if (Ret) then begin
            DisplayGraph2(Graph, AI_Data, nChannelCount, numSampsPerChan, fSampling);

            Result := True;
        end;
    finally
        SetLength(AI_DATA, 0);
    end;
end;
//=======================================================================================================================



//------------------------------------------------------------------------------
// AD측정시작.
procedure TFrmNI_Hardware.BtnReadAdClick(Sender: TObject);
var i, j, Idx, nTotalCount : Integer;
    Ret : Boolean;
    ChStr : String;
    nChannelCount   : Integer;  // 채널수.
    numSampsPerChan : integer;  // 채널당 햄플수.
    fSampling       : Double;   // Sampling Time (초단위)
    nTriggerMode    : Integer;  // 트리거 모드
    sTriggerSrc     : String;   // 트리거 소스
    fTriggerLevel   : Double;   // 트리거 레벨.

    bReadOK, bRunning : Boolean;
    AI_DATA : array of Double;
begin
    MemoDebug.Lines.Clear;

    // 기본정보를 입력한다.
    ChStr           := Edit_Dev2.Text;      // 'Dev1/ai0';
    nChannelCount   := Edit_AI_Channel.Value;
    numSampsPerChan := Edit_AI_DataCount.Value;
    fSampling       := StrToFloatDef(Edit_AI_Sampling.Text, 1000) * 1000;
    nTriggerMode    := Rg_Trigger2.ItemIndex;  // 트리거 모드
    sTriggerSrc     := Edit_Dev2Trigger.Text;   // 트리거 소스
    fTriggerLevel   := StrToFloatDef(Edit_TriggerLevel2.Text, 1);   // 트리거 레벨.

    if (ChStr = '') then exit;

    SetLength(AI_DATA, nChannelCount * numSampsPerChan);

    Ret := ReadADBuff(ChStr, nChannelCount, numSampsPerChan, fSampling, nTriggerMode, sTriggerSrc, fTriggerLevel, AI_Data);


    if (Ret) and (Self.Visible) then begin

        if CheckBox1.Checked then
            GO_Filter(AI_Data, nChannelCount * numSampsPerChan);

        DisplayValue(ChStr, AI_Data, nChannelCount);
        DisplayGraph(ChartAD, AI_Data, nChannelCount, numSampsPerChan, fSampling);

        DisplayGraph2(Graph, AI_Data, nChannelCount, numSampsPerChan, fSampling);

       //ChartAD.LeftAxis.SetMinMax(1.4, 2.4);
       ChartAD.LeftAxis.SetMinMax(StrToFloatDef(edtMin.Text , 0), StrToFloatDef(edtMax.Text, 10));

       //Graph.LeftAxis.SetAxisRange(1.4, 2.4);

        Graph.bViewSplit := True;
        PaintBoxGraph.Invalidate;


        // Calibraion
        for i:= 1 to nChannelCount do begin
        AddDebug(Format('CH%d LOW=%s, AVE=%s, HIGH=%s, FREQ=%s, DUTY=%s MIN=%s, MAX=%s, PULSEWIDTH=%s, PERIOD=%s ',
         [  i,
            MeasGraphValue(Graph, Format('LOW=CH%d', [i])),
            MeasGraphValue(Graph, Format('AVE=CH%d', [i])),
            MeasGraphValue(Graph, Format('HIGH=CH%d', [i])),
            MeasGraphValue(Graph, Format('FREQ=CH%d,1000,0', [i])),
            MeasGraphValue(Graph, Format('DUTY=CH%d', [i])),
            MeasGraphValue(Graph, Format('MIN=CH%d', [i])),
            MeasGraphValue(Graph, Format('MAX=CH%d', [i])),

            MeasGraphValue(Graph, Format('PULSEWIDTH=CH%d,,,,1,', [i])),
            MeasGraphValue(Graph, Format('PERIOD=CH%d,,,,1,', [i]))

        ]));
        end;
    end;

    SetLength(AI_DATA, 0);
end;

procedure TFrmNI_Hardware.DisplayValue(ChStr : String; var Buff : array of Double; nChannelCount : Integer);
var i, j, Idx, nTotalCount, St, Ed : Integer;
    Str, RdStr, WtStr : String;
    StrList : TStringList;

    sDevName, sChName, sChNum : String;
begin
    StrList := TStringList.Create;
    try
        // 데이터를 파싱한다.
        while (ChStr <> '') do begin
            RdStr := GetToken(ChStr, ',');  // Dev1/ai0,  Dev1/ai0:2

            sDevName := GetToken(RdStr, '/');
            for i:= 1 to Length(RdStr) do begin
                if not (RdStr[i] in ['0'..'9']) then continue;

                sChName := Copy(RdStr, 1, i-1);
                sChNum  := Copy(RdStr, i, Length(RdStr)-i+1);
                break;
            end;

            if Pos(':', sChNum) > 0 then begin
                St := StrToIntdef(GetToken(sChNum, ':'), 0);
                Ed := StrToIntdef(sChNum, 0);
            end else begin
                St := StrToIntDef(sChNum, 0);
                Ed := St;
            end;

            for i := St to Ed do begin
                WtStr := Format('%s/%s%d', [sDevName, sChName, i]);
                StrList.Add(WtStr);
            end;
        end;

        // 채널수가 틀리면 확인.
        if StrList.Count <> nChannelCount then exit;

        ListBoxBuff.Canvas.Lock;
        ListBoxBuff.Items.BeginUpdate;
        ListBoxBuff.Clear;
        for i:= 0 to nChannelCount-1 do begin
            sChName := StrList[i];
            ListBoxBuff.Items.Values[sChName] := FormatFloat('0.####', Buff[i]);
        end;
        ListBoxBuff.Items.EndUpdate;
        ListBoxBuff.Canvas.Unlock;
    finally
        StrList.Free;
    end;
end;

procedure TFrmNI_Hardware.DisplayGraph(Chart : TChart; var Buff : array of Double; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
var i, j, Idx, nTotalCount : Integer;
    Series : TFastLineSeries;
    fXval : Double;
begin
    Screen.Cursor := crHourGlass;
    try
        // Clear Graph.
        for i:= 0 to Chart.SeriesList.Count-1 do
            Chart.Series[i].Clear;

        // Series를 모두 지운다.
        //Chart.SeriesList.Clear;
        Chart.RemoveAllSeries;
        for i:= 1 to nChannelCount do
        begin
            Series := TFastLineSeries.Create(Self);
            Series.ParentChart := Chart;
            Series.Title  := Format('CH%.2d', [i]);
            Series.Active := True;
            Series.Tag    := i;
            Series.XValues.Order := loAscending;
            (Series as TFastLineSeries).LinePen.Color := RGB( Random(255), Random(255), Random(255) );
            Chart.AddSeries(Series);
        end;

        // Display Graph.
        nTotalCount := numSampsPerChan * nChannelCount;

        Chart.BottomAxis.Automatic := False;
        Chart.BottomAxis.SetMinMax(0, (numSampsPerChan-1) / fSampling * 1000);

        MemoVal.Lines.BeginUpdate;
        MemoVal.Lines.Clear;
        Idx := 0;
        for j := 0 to numSampsPerChan-1 do
        begin
            fXval := j / fSampling * 1000;
            for i:= 0 to nChannelCount-1 do
            begin
                Chart.Series[i].AddXY(fXval, Buff[Idx]);
                MemoVal.Lines.Add( Format('%2d,%d:%8f', [i, j, Buff[Idx]]));
                Inc(Idx);
            end;
        end;
        MemoVal.Lines.EndUpdate;
    finally
        Screen.Cursor := crDefault;
    end;
end;

const
  Colors: array[0..4] of TColor =
    ( clMaroon, clGreen, clNavy, clPurple, clRed );
{
  TIdentMapEntry = (
    (Value: clBlack; Name: 'clBlack'),
    (Value: clMaroon; Name: 'clMaroon'),
    (Value: clGreen; Name: 'clGreen'),
    (Value: clOlive; Name: 'clOlive'),
    (Value: clNavy; Name: 'clNavy'),
    (Value: clPurple; Name: 'clPurple'),
    (Value: clTeal; Name: 'clTeal'),
    (Value: clGray; Name: 'clGray'),
    (Value: clSilver; Name: 'clSilver'),
    (Value: clRed; Name: 'clRed'),
    (Value: clLime; Name: 'clLime'),
    (Value: clYellow; Name: 'clYellow'),
    (Value: clBlue; Name: 'clBlue'),
    (Value: clFuchsia; Name: 'clFuchsia'),
    (Value: clAqua; Name: 'clAqua'),
    (Value: clWhite; Name: 'clWhite'),
}
procedure TFrmNI_Hardware.DisplayGraph2(Graph : TGraph; var Buff : array of Double; nChannelCount, numSampsPerChan : Integer; fSampling : Double);
var i, j, Idx, nTotalCount : Integer;

    Axis : TAxis;
    ChData : TChData;

    fXval : Double;
begin
    Screen.Cursor := crHourGlass;
    try
        // Clear Graph.
        Graph.DeleteAllChannel;
        Graph.ClearAxis;
        Graph.bViewSplit := False;

        Graph.LeftAxis   := Graph.AddAxis;
        Graph.LeftAxis.SetAxisRange(-10, 10, 1);
        Graph.LeftAxis.AxisName := 'Volt [V]';

        Graph.BottomAxis := Graph.AddAxis;
        Graph.BottomAxis.AxisName := 'Time [ms]';

        for i:= 1 to nChannelCount do
        begin
            ChData := Graph.AddChannel;
            ChData.ChName := Format('CH%d', [i]);
            ChData.Color  := Colors[i mod High(Colors)];
        end;

        // Display Graph.
        nTotalCount := numSampsPerChan * nChannelCount;
        Graph.BottomAxis.SetAxisRange(0, (numSampsPerChan-1) / fSampling * 1000);

        MemoVal.Lines.BeginUpdate;
        MemoVal.Lines.Clear;
        Idx := 0;
        for j := 0 to numSampsPerChan-1 do
        begin
            fXval := j / fSampling * 1000;
            for i:= 0 to nChannelCount-1 do
            begin
                Graph.GetChannel(i).AddXY(fXval, Buff[Idx]);
                //MemoVal.Lines.Add( Format('%2d,%d:%8f', [i, j, Buff[Idx]]));
                Inc(Idx);
            end;
        end;
        MemoVal.Lines.EndUpdate;
    finally
        PaintBoxGraph.Invalidate;
        Screen.Cursor := crDefault;
    end;
end;


procedure TFrmNI_Hardware.XiButton1Click(Sender: TObject);
var aiTask : TDAQmxTask;
    Buff : array of Double;
    fSampling, fTime : Double;
    nChCount, nSampleCount : Integer;
    ChStr : String;
begin
    nChCount     := 60;
    nSampleCount := 1;
    fSampling    := 10000;
    ChStr  := Format('Dev1/ai0:%d', [nChCount-1]);

    SetLength(Buff, nChCount * nSampleCount);

    aiTask := TDAQmxTask.Create;
    aiTask.CreateAIVoltageChan(ChStr);
    aiTask.CfgSampClkTiming(fSampling, nSampleCount, True);
    aiTask.Start;

    fTime := GetTickCountEx;

    aiTask.ReadAnalogF64(Buff, nChCount * nSampleCount);

    Caption := Format('%f', [GetTickCountEx - fTime]);

    aiTask.Stop;
    aiTask.Free;

    DisplayValue(ChStr, Buff, nChCount);
    SetLength(Buff, 0);
end;


//------------------------------------------------------------------------------
{ TADThread }

function TFrmNI_Hardware.ReadAD(sChannels : String) : Double;
begin
    //
end;

{---------------------------------------------------------------
    sChannels       : String;
    nChannelCount   : Integer;  // 채널수.
    numSampsPerChan : integer;  // 채널당 샘플수.
    fSampling       : Double;   // Sampling Time (초단위)
    nTriggerMode    : Integer;  // 트리거 모드
    sTriggerSrc     : String;   // 트리거 소스
    fTriggerLevel   : Double    // 트리거 레벨.
---------------------------------------------------------------}
function TFrmNI_Hardware.ReadADBuff(sChannels : String;  nChannelCount, numSampsPerChan : integer;  fSampling : Double;
    nTriggerMode : Integer; sTriggerSrc : String;  fTriggerLevel : Double; var Buff : array of Double) : Boolean;
var fTime : Double;
    i, nTime, nTotalCount, Status, nTriggerSlope : i32;
    sampsPerChanWritten, sampsPerChanRead : i32;
    AITask : TDAQmxTask;
begin
    Result := True;
    fTime := GetTickCountEX;

    //----------------------------------------------------------------------
    //1) Task를 생성한다.
    AITask := TDAQmxTask.Create;
    try
        //----------------------------------------------------------------------
        // 2) AO 채널을 생성한다.
        // 다채널을 하는경우에는 'Dev2/ai0:7 의형태로 입력하고 버퍼를 나누어 쓴다.
        Status := AITask.CreateAIVoltageChan(sChannels);
//        if not CheckError(Status, Format('DAQmxCreateAIVoltageChan: %d',[ Status ]), Result ) then exit;
        CheckError(Status, Format('DAQmxCreateAIVoltageChan: %d',[ Status ]), Result );
        //----------------------------------------------------------------------
        // 3) 수집하거나 생성할 샘플 클럭의 소스, 샘플 클럭의 속도, 샘플의 개수를 설정합니다.
        Status := AITask.CfgSampClkTiming(fSampling, numSampsPerChan);
//        if not CheckError(Status, Format('DAQmxCfgSampClkTiming: %d',[ Status ]), Result ) then exit;
        CheckError(Status, Format('DAQmxCfgSampClkTiming: %d',[ Status ]), Result );

        //----------------------------------------------------------------------
        // 4) 트리거를 설정한다.
        Status := AITask.CfgAnlgEdgeStartTrig(nTriggerMode, sTriggerSrc, fTriggerLevel);
//        if not CheckError(Status, Format('DAQmxCfgAnlgEdgeStartTrig: %d',[ Status ]), Result ) then exit;
        CheckError(Status, Format('DAQmxCfgAnlgEdgeStartTrig: %d',[ Status ]), Result );

        while (True) do begin
            //------------------------------------------------------------------
            // 5) Task 시작.
            Status := AITask.Start;
            CheckError(Status, Format('DAQmxStartTask: %d',[ Status ]), Result );
            if (not Result) then break;

            //------------------------------------------------------------------
            // 6) 파형읽는다.
            nTotalCount := (nChannelCount * numSampsPerChan);  // 채널수 * 채널당 샘플수.
            Status :=  AITask.ReadAnalogF64(Buff, nTotalCount);
            CheckError(Status, Format('DAQmxReadAnalogF64: %d',[ Status ]), Result );
            if (not Result) then break;

            //-----------------------------------------------------------------
            // 8) Task 중지
            Status := AITask.Stop;
            CheckError(Status, Format('DAQmxStopTask: %d',[ Status ]), Result );
            break;
        end;
    finally
        //------------------------------------------------------------------
        // 9) Task 초기화.
        AITask.Free;
    end;
    // 측정시간을 계산한다.
    fTime := GetTickCountEX - fTime;
    AddDebug( Format('Elapse Time : (%f ms)', [fTime]));

end;


procedure TFrmNI_Hardware.CalcPulse(FloatList : TFloatList;
    fTrigLevel, fSampling : Double; var fPeak, fTime1, fTime2 : Double);
var i, Pos1, Pos2 : Integer;
    fValue, fOldValue : Double;
begin
    if FloatList.Count < 10 then exit;

    fPeak  := 0;
    fTime1 := 0;
    fTime2 := 0;

    Pos1 := -1;
    Pos2 := -1;
    fOldValue := FloatList.Data[0];
    for i:= 1 to FloatList.Count-1 do
    begin
        fValue := FloatList.Data[i];
        fPeak  := MAX(fPeak, fValue);

        if (Pos1 < 0) and (fOldValue < fTrigLevel) and (fValue >= fTrigLevel) then
        begin
            Pos1 := i;
        end else
        if (Pos1 > 0) and (Pos2 < 0) and
           (fOldValue >= fTrigLevel) and (fValue < fTrigLevel) then
        begin
            Pos2 := i;
            break;
        end;
        fOldValue := fValue;
    end;

    if (Pos1 > 0) and (Pos2 > 0) then begin
        fTime1 := Pos1 / fSampling * 1000;
        fTime2 := (Pos2 - Pos1) / fSampling * 1000;
    end;
end;

procedure TFrmNI_Hardware.BtnAdChResetClick(Sender: TObject);
var i : Integer;
begin
    for i:= 0 to CheckListBoxAD.Items.Count-1 do begin
        CheckListBoxAD.Checked[i] := False;
    end;
    Edit_Dev2.Text := '';
end;


//==============================================================================
{ TDAQmxTask }

function GetErrorString(Status : Integer) : String;
var StrChar : array[0..256] of Char;
begin
    DAQmxGetErrorString(Status, StrChar, 255);
    Result := String(StrChar);
end;
//------------------------------------------------------------------------------
constructor TDAQmxTask.Create;
begin
    inherited;
    DAQmxCreateTask(PChar(''), hTask);
end;
//------------------------------------------------------------------------------
destructor TDAQmxTask.Destroy;
begin
    DAQmxClearTask(hTask);
    inherited;
end;
//------------------------------------------------------------------------------
function TDAQmxTask.Start: Integer;
begin
    Result:= DAQmxStartTask(hTask);
end;
//------------------------------------------------------------------------------
function TDAQmxTask.Stop: Integer;
begin
    Result := DAQmxStopTask (hTask);
end;
//------------------------------------------------------------------------------
function TDAQmxTask.CreateAIVoltageChan(sChannels : String) : Integer;
begin
    Result := DAQmxCreateAIVoltageChan(hTask,
        PChar(sChannels), '',
        DAQmx_Val_RSE, // DAQmx_Val_Cfg_Default,
        -10.0, 10.0, DAQmx_Val_Volts, '');
    //RaiseException();
end;
//------------------------------------------------------------------------------
function TDAQmxTask.CfgSampClkTiming(fSampling : Double; numSampsPerChan : Integer; bContSamp : Boolean = False) : Integer;
var nSampleMode : Integer;
begin
    if bContSamp then
        nSampleMode := DAQmx_Val_ContSamps
    else
        nSampleMode := DAQmx_Val_FiniteSamps;   // Acquire or generate a finite number of samples.

    Result := DAQmxCfgSampClkTiming(hTask, '',      // task Handle, source,
        fSampling ,                                 // rate
        DAQmx_Val_Rising,                           // activeEdge 동작할 클럭작동.
        nSampleMode,                                // sampleMode,
        numSampsPerChan);                           // sampsPerChanToAcquire

    Self.fSampling       := fSampling;
    Self.numSampsPerChan := numSampsPerChan;
end;
//------------------------------------------------------------------------------
function TDAQmxTask.CfgAnlgEdgeStartTrig(nTriggerMode : Integer; sTriggerSrc : String; fTriggerLevel : Double) : Integer;
var nTriggerSlope : Integer;
begin
    if (nTriggerMode > 0) then
    begin
        case nTriggerMode of
            1: nTriggerSlope := DAQmx_Val_RisingSlope;
            2: nTriggerSlope := DAQmx_Val_FallingSlope;
        end;
        Result := DAQmxCfgAnlgEdgeStartTrig(hTask,
                PChar(sTriggerSrc),      // Trigger Source.
                nTriggerSlope,           // DAQmx_Val_FallingSlope or  DAQmx_Val_RisingSlope
                fTriggerLevel );
    end else
        Result := 0;
end;
//------------------------------------------------------------------------------
function TDAQmxTask.ReadAnalogF64(var Buff : array of Double; nBuffSize : Integer; fTimeout : Double = 10000) : Integer;
var sampsPerChanRead : Integer;
begin
    Result := DAQmxReadAnalogF64(hTask,                 // taskHandle
                  numSampsPerChan,                      // numSampsPerChan,
                  fTimeOut,                             // timeout
                  bool32(DAQmx_Val_GroupByScanNumber),  // fillMode      or DAQmx_Val_GroupByChannel
                  Buff,                                 // readArray
                  nBuffSize,                            // arraySizeInSamps
                  sampsPerChanRead,                     // The actual number of samples read from each channel
                  nil);                                 // reserved
   // ShowMessage(IntToStr(sampsPerChanRead));
end;
//------------------------------------------------------------------------------
function TDAQmxTask.IsTaskDone(var bTaskDone : Boolean) : Integer;
var TaskDone : LongBool;
begin
    Result := DAQmxIsTaskDone(hTask, TaskDone);
end;


constructor TNIReadThread.Create(ChStr : String; ChCount, SampleCount : Integer; fSampling : Double;
    nTriggerMode : Integer; sTriggerSrc : String; fTriggerLevel : Double);

var i, j, Idx, nTotalCount, St, Ed : Integer;
    Str, RdStr, WtStr : String;
    StrList : TStringList;

    sDevName, sChName, sChNum : String;
begin
    inherited Create(False);

    FLockCount := 0;
    m_Critical := TCriticalSection.Create;

    Self.ChStr        := ChStr;
    Self.ChCount      := ChCount;
    Self.SampleCount  := SampleCount;
    Self.Sampling     := fSampling;  // 10000;  // 10KHz


    Self.TriggerMode  := nTriggerMode;
    Self.TriggerSrc   := sTriggerSrc;
    Self.TriggerLevel := fTriggerLevel;

    ChList := TStringList.Create;
    try
        // 데이터를 파싱한다.
        while (ChStr <> '') do begin
            RdStr := GetToken(ChStr, ',');  // Dev1/ai0,  Dev1/ai0:2

            sDevName := GetToken(RdStr, '/');
            for i:= 1 to Length(RdStr) do begin
                if not (RdStr[i] in ['0'..'9']) then continue;

                sChName := Copy(RdStr, 1, i-1);
                sChNum  := Copy(RdStr, i, Length(RdStr)-i+1);
                break;
            end;

            if Pos(':', sChNum) > 0 then begin
                St := StrToIntdef(GetToken(sChNum, ':'), 0);
                Ed := StrToIntdef(sChNum, 0);
            end else begin
                St := StrToIntDef(sChNum, 0);
                Ed := St;
            end;

            for i := St to Ed do begin
                WtStr := Format('%s/%s%d', [sDevName, sChName, i]);
                ChList.Add(WtStr);
            end;
        end;
        //ShowMessage(ChList.Text);
    finally
    end;
end;

destructor TNIReadThread.Destroy;
begin
    m_Critical.Free;
    ChList.Free;

    inherited Destroy;
end;

procedure TNIReadThread.Execute;
var aiTask : TDAQmxTask;
    i, nBuffSize : Integer;
    bContinueMode : Boolean;
begin
    bContinueMode := (SampleCount = 1);  // Sample Count가 0일경우는 ContinueMode.
    nBuffSize := ChCount * SampleCount;

    // AD 를 측정한다.
    Lock;
    SetLength(Buff, nBuffSize);
    UnLock;
    
    aiTask := TDAQmxTask.Create;
    try
        aiTask.CreateAIVoltageChan(ChStr);
        aiTask.CfgSampClkTiming(Sampling, SampleCount, bContinueMode);
        aiTask.CfgAnlgEdgeStartTrig(TriggerMode, TriggerSrc, TriggerLevel);
        aiTask.Start;

        while (not Terminated) do
        begin
            Lock;
            try
                aiTask.ReadAnalogF64(Buff, nBuffSize);
            finally
                UnLock;
            end;

            if not bContinueMode then break;
            Sleep(1);  // CPU 점유율Down.
        end;
        aiTask.Stop;
    finally
        aiTask.Free;
    end;
{
    Lock;
    SetLength(Buff, 0);
    UnLock;
}
end;

function TNIReadThread.GetChString(Idx: Integer): String;
begin
    if (Idx >= 0) and (Idx < ChList.Count) then
        Result := ChList[Idx]
    else
        Result := '';
end;

procedure TNIReadThread.Lock;
begin
    // 다른쓰레드에서 접근을 못하도록 막는다.
    m_Critical.Acquire;
    Inc(FLockCount);
end;

procedure TNIReadThread.UnLock;
begin
    // 다른쓰레드접근을 해제한다.
    m_Critical.Release;
    Dec(FLockCount);
end;

function TNIReadThread.IsLock : Boolean;
begin
    Result := (FLockCount > 0);
end;


var NIReadThread : TNIReadThread;

procedure TFrmNI_Hardware.Button1Click(Sender: TObject);
begin
    NIReadThread := TNIReadThread.Create('Dev1/0:63', 64, 1, 10000, TRIG_SOFT, '', 0);
    NIReadThread.Resume;
end;

procedure TFrmNI_Hardware.Button2Click(Sender: TObject);
begin
    NIReadThread.Terminate;
end;

procedure TFrmNI_Hardware.BtnFindHardwareClick(Sender: TObject);
begin
    FindHardware;
end;

procedure TFrmNI_Hardware.ResetIO;
begin
//
end;


procedure TFrmNI_Hardware.PaintBoxGraphPaint(Sender: TObject);
var Bm : TBitmap;
    DRect : TRect;
begin
    // Use Double Buffering.

    Bm := TBitmap.Create;
    try
        Bm.Width  := PaintBoxGraph.Width;
        Bm.Height := PaintBoxGraph.Height;
        Bm.Canvas.Font.Assign(PaintBoxGraph.Canvas.Font);
        DRect := PaintBoxGraph.ClientRect;

        Graph.DrawGraph(Bm.Canvas, DRect);

        PaintBoxGraph.Canvas.CopyRect(DRect, Bm.Canvas, DRect);
    finally
        Bm.Free;
    end;
end;

procedure TFrmNI_Hardware.Button3Click(Sender: TObject);
begin
    ChartAD.LeftAxis.SetMinMax(StrToFloatDef(edtMin.Text , 0), StrToFloatDef(edtMax.Text, 10));
end;

end.
