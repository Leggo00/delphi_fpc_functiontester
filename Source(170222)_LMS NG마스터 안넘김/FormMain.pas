unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, FileCtrl, Lcd99,
  DPBLabel, ZINICtrl, Spin, Menus, GradFill, Buttons, INIFiles, Global,
  Tabs, Grids, ValEdit, FloatList, Math, AdvPanel, ScieCalc, UnitGraph, uImage,
  AMLed, PassWord, FormBarcode;

type
  TFrmMain = class(TForm)
    IniMain: ZIniData;
    TimerRun: TTimer;
    MainMenu: TMainMenu;
    memuOpen: TMenuItem;
    MenuClose: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    MenuOpenProject: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    MenuSaveProject: TMenuItem;
    MenuSaveAsProject: TMenuItem;
    MenuHardware: TMenuItem;
    N13: TMenuItem;
    MenuAutoAlign: TMenuItem;
    MenuNewSimul: TMenuItem;
    MenuOpenSimul: TMenuItem;
    N15: TMenuItem;
    N9: TMenuItem;
    MenuGraph: TMenuItem;
    MenuSimulator: TMenuItem;
    MenuStepEdit: TMenuItem;
    PanelProject: TPanel;
    Panel5: TPanel;
    dpbLabel3: TdpbLabel;
    LabelUnit: TdpbLabel;
    Label_Model: TdpbLabel;
    Label_TestFile: TdpbLabel;
    Label_UnitNgCount: TdpbLabel;
    Panel3: TPanel;
    LCD_Time: TLCD99;
    Panel4: TPanel;
    LCD_Cycle: TLCD99;
    M1: TMenuItem;
    MenuAutoStart: TMenuItem;
    MenuManualStart: TMenuItem;
    MenuStop: TMenuItem;
    N20: TMenuItem;
    N1: TMenuItem;
    StatusBar: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TreeViewRes: TTreeView;
    N11: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    A1: TMenuItem;
    MenuAbout: TMenuItem;
    MenuViewProject: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    MenuReport: TMenuItem;
    N12: TMenuItem;
    MenuDesignMode: TMenuItem;
    N10: TMenuItem;
    N14: TMenuItem;
    PopupMenu1: TPopupMenu;
    N17: TMenuItem;
    N18: TMenuItem;
    MenuStepRun: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    TreeView: TTreeView;
    MenuUserMsg: TMenuItem;
    N3: TMenuItem;
    Panel_Back: TPanel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnStrart: TToolButton;
    BtnManual: TToolButton;
    BtnStop: TToolButton;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    dpbLabel1: TdpbLabel;
    dpbLabel4: TdpbLabel;
    lcdGood: TdpbLabel;
    dpbLabel13: TdpbLabel;
    dpbLabel12: TdpbLabel;
    lcdFail: TdpbLabel;
    lcdTotal: TdpbLabel;
    lblTotal: TdpbLabel;
    LableStepName: TdpbLabel;
    btnReset: TToolButton;
    N19: TMenuItem;
    edtDate: ZIniEdit;
    edtTotal: ZIniSpinEdit;
    edtGood: ZIniSpinEdit;
    edtFail: ZIniSpinEdit;
    CAN1: TMenuItem;
    MenuDevice: TMenuItem;
    P1: TMenuItem;
    N22: TMenuItem;
    N26: TMenuItem;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    vl_Variable: TValueListEditor;
    vl_Table: TValueListEditor;
    PageControl1: TPageControl;
    pnlMenu: TAdvPanel;
    tbTitle: TToolBar;
    BtnOpen: TToolButton;
    BtnSave: TToolButton;
    BtnSaveAs: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    BtnStepEdit: TToolButton;
    ToolButton8: TToolButton;
    btnSlidacs: TToolButton;
    ToolButton10: TToolButton;
    BtnSimulator: TToolButton;
    BtnHardware: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    btnSystemError: TToolButton;
    btnPopSave: TToolButton;
    ToolBar2: TToolBar;
    btnClose: TToolButton;
    ScieCalc: TScieCalc;
    SaveDialog: TSaveDialog;
    N27: TMenuItem;
    N28: TMenuItem;
    OpenDialog: TOpenDialog;
    ImgListStep: TImageList;
    CANDIAG1: TMenuItem;
    dpbLabel2: TdpbLabel;
    lb_Barcode: TdpbLabel;
    CAN11: TMenuItem;
    CAN21: TMenuItem;
    PLC1: TMenuItem;
    TimerPLC: TTimer;
    LOG1: TMenuItem;
    TabSheet5: TTabSheet;
    memoMeta: TMemo;
    ImageList: TImageList;
    CLIENT1: TMenuItem;
    UDP1: TMenuItem;
    ITAC1: TMenuItem;
    B1: TMenuItem;
    Button1: TButton;                                             
    CountLIST: TMenuItem;
    dpbLabel6: TdpbLabel;
    IniSetPin: ZIniSpinEdit;
    IniUsePin: ZIniSpinEdit;
    lbPinCount: TdpbLabel;
    ASCII1: TMenuItem;
    Edit1: TEdit;
    Edt_Pass: ZIniEdit;
    LbFailCount: TLabel;
    Led_Ready: TLed;
    Led_PCReady: TLed;
    Led_PCOK: TLed;
    Led_PCNG: TLed;
    Led_PlcReset: TLed;
    Led_PCbarcodeNG: TLed;
    Led_PCbarcodeOK: TLed;
    N25: TMenuItem;
    NIHARDWARE1: TMenuItem;
    Led_Start: TLed;
    Led1: TLed;
    LED_ALIVE: TLed;
    Panel6: TPanel;
    cbTrashBarcode: TCheckBox;
    edtTestBarocde: TEdit;
    pnMES: TPanel;
    BARCODE21: TMenuItem;
    BARCODE31: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure TimerRunTimer(Sender: TObject);
    procedure MenuCloseClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MenuOpenProjectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure MenuAutoAlignClick(Sender: TObject);
    procedure MenuGraphClick(Sender: TObject);
    procedure BtnStrartClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure TreeViewResStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure BtnManualClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MenuViewProjectClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure MenuReportClick(Sender: TObject);
    procedure MenuDesignModeClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure KLine1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure MenuUserMsgClick(Sender: TObject);
    procedure MenuAboutClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure lcdGoodDblClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure TreeViewCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure CANDIAG1Click(Sender: TObject);
    procedure CAN1Click(Sender: TObject);
    procedure CAN11Click(Sender: TObject);
    procedure PLC1Click(Sender: TObject);
    procedure TimerPLCTimer(Sender: TObject);
    procedure LOG1Click(Sender: TObject);
    procedure Label_ModelDblClick(Sender: TObject);
    procedure CLIENT1Click(Sender: TObject);
    procedure UDP1Click(Sender: TObject);
    procedure ITAC1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CountLISTClick(Sender: TObject);
    procedure ASCII1Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure NIHARDWARE1Click(Sender: TObject);
    procedure btnPopSaveClick(Sender: TObject);
    procedure BARCODE21Click(Sender: TObject);
    procedure BARCODE31Click(Sender: TObject);
  private
    { Private declarations }
    sMessage : String;
    TestMode : Integer;
    fCheckTime : Double;
    PrevTime : TDateTime;

    StartTime, StopTime, StepStartTime : TDateTime;
    TestCount : Integer;

    nTimeOut, nSampling, nRetry : Integer;

    giErrorCount: integer;
    giStepIndex: integer;
    gsSaveDir: string;

    ReadyTime : double;
    AutoResetCount : integer;




    //sBarcode : String;
    //gScanResult : Boolean;
    sOldModelCode : String;   
    gTempResult : Boolean; // ???? ???? ????...
    bOKNGMaster : Boolean;

    procedure MakeTestTree;

    function  CheckResult(Param: String): String;
    function  iTacCheck(sBarcode : String): Boolean;
    function  FindCurrTreeStep(nStepNo: Integer): TTreeNode;
    function  RunStep(StepIdx: Integer): Boolean;
    function  TestRun: Boolean;
    procedure TestStart(bInit: Boolean);
    procedure TestStop(bReset: Boolean);
    procedure SetUnitState(State: TTestState);
    procedure LoadTestInfo;
    procedure SaveTestInfo;
    function  SaveTestData: Boolean;
    function  SaveGraph() : Boolean;

    procedure DisplayTestCount;

    procedure ControlMenu(iIndex: integer);

    function  FindWindowByCaption(sCaption : String): TForm;

    procedure DesignerFormEnabled(bEnabled: boolean);

    function ReplaceCalcSpec(Param : String) : String;
    function  ReplaceTblString(Param: String): String;
    function  IsStepEnabled(TestStep : TTestStep) : Boolean;
    procedure SetPCReady(bOnOff : Boolean);
    procedure DispMessage(sMessage : String; Color : TColor = clBlack);

    function  UpLoadItac(bResult: Boolean; bFirst : Boolean = True): Boolean;
    function  ConvertValue(const sValue, sOpion : String) : String;

    procedure StationNoChange();

    Function AttributeCheck(sSerial: String; var sAttribute: String):Boolean;

  public
    { Public declarations }
    gbReset : Boolean;
    gbRunning : Boolean;
    Graph : TGraph;
    sTemperature : String;
    sSWVersion   : string;

    gUsePinCount : String;
    gSetPinCount : String;

    bFail : Boolean;

    bMasterMode : Boolean;
    nReFailCount : integer;
    bFirst : Boolean;
    bAutoTest : Boolean;


    function ChangeProject(aPRJFileName : string) : Boolean;
    function  OpenModal(bLoadMetaFile : Boolean) : Boolean;
//    function GetGraphData(TimeGraph : TTimeGraph; nGraphCh : Integer; sMode : string) : string;
    function  RunInputCondition(StepName : String; InputList : TStringList) : Boolean;
    procedure ViewTestInfo;
    function  LoadFromLayoutFile(FileName: String): Boolean;
    function  SaveToLayoutFile(FileName: String): Boolean;

    procedure InitialDesignerForm();
    procedure PinCount(nUseSum: Integer);
    function ReturnSerial(sSerial :string):string;
    procedure CreateBarcode();
    procedure DestroyBarcode();
  end;

var
  FrmMain: TFrmMain;

  gModel, gModelCode : String;  // ???????? - ????????

  gModelFolder, gDataFolder : String;
  FrmBarcode : array [1..3] of TFrmBarcode;

  gThetaFileName : String; // PWM_Theta file ????...
  nTesterType, nTesterNo : Integer;
  sPLCReady, sPLCReset, sPLCBarcode, sPLCStart, sPLCStop, sPLCStep, sPLCBarcodeSCAN : String;
  sPCReady, sPCBarcodeOK, sPCBarcodeNG, sPCOK, sPCNG, sUploadbarcode, sPCALIVE, sPCBarcodeNOREAD, sPLCModel : String;

  bPlc_Ready, bPlc_barcode, bPlc_Reset, bPlc_Start, bPlc_Stop, bPlc_Step : Boolean;

implementation

uses
  GenUtils, FormResEdit, {FormHardware}FormHWMain, FormGraph, FormHwTest,
  FormStepEdit, FormTestOption, FormData, FormLog, FormCanMsg,
  UnitImage, FormBuff, FormKMIComm, FormMessage, FormReport, FormAbout, FormCalcCP,
  FormCANCom, uCanDBC, ShellAPI, FormDesigner,
  FormCANMonitor, FormDevice, FormCanDiag, FormSensorTable, FormEditModel,
  FormSelModel, Form7555, FormUDPComm,
  FormTRClient, FormTempSensor, FormItac,  FormAlret, FormTable,
  FormPLCControl, FormPWM, FormMelsecQ, FormNIhardware, FormMasterMode,
  FormMaterAlret, FormLMSedit, StrUtils;

{$R *.dfm}

const
    TESTER_TYPE_HOT = 1;
    TESTER_TYPE_EOL = 2;

procedure ReadPLCIOInfo;
var Ini : TIniFile;
    Section : String;
    PCNum : Integer;
begin
    Ini := TIniFile.Create(GetAppDir('') + 'PLCINFO.ini' );
    try
        nTesterType := Ini.ReadInteger('CONFIG', 'TESTER_TYPE',  TESTER_TYPE_EOL);  // 1=HOT TESTER, 2=EOL TESTER.
        nTesterNo   := Ini.ReadInteger('CONFIG', 'TESTER_NO',    1);
        Section := Format('TESTER%d', [nTesterNo]);

        if (Section <> '') then
        begin
            sPLCReady      := Ini.ReadString(Section, 'PLCReady',   '');
            sPLCReset      := Ini.ReadString(Section, 'PLCReset',   '');
            sPLCStart      := Ini.ReadString(Section, 'PLCStart',   '');
            sPLCStop       := Ini.ReadString(Section, 'PLCStop',    '');
            sPLCStep       := Ini.ReadString(Section, 'PLCStep',    '');
            sPLCBarcode    := Ini.ReadString(Section, 'PLCBarcode',   '');
            sPLCModel      := Ini.ReadString(Section, 'PLCModel',    '');

            sPCReady       := Ini.ReadString(Section, 'PCReady',        '');
            sPCOK          := Ini.ReadString(Section, 'PCOK',          '');
            sPCNG          := Ini.ReadString(Section, 'PCNG',          '');

            sPLCBarcodeSCAN := Ini.ReadString(Section, 'PLCBarcodeSCAN',   '');
            sPCBarcodeOK    := Ini.ReadString(Section, 'PCBarcodeOK',   '');
            sPCBarcodeNG    := Ini.ReadString(Section, 'PCBarcodeNG',   '');
            sUploadbarcode  := Ini.ReadString(Section, 'PCUPloadBarcode',   '');
            sPCALIVE        := Ini.ReadString(Section, 'PCALIVE',   '');
            sPCBarcodeNOREAD:= Ini.ReadString(Section, 'PCBarcodeNOREAD',   '');
        end else begin
            sPLCReady      := '';
            sPLCReset      := '';
            sPLCStart      := '';
            sPLCStop       := '';
            sPLCStep       := '';
            sPLCModel      := '';
            sPCReady       := '';
            sPCOK          := '';
            sPCNG          := ''; 
            sPLCBarcode    := '';
            sPCALIVE       := '';
            sPLCBarcodeSCAN := '';

            sPCBarcodeOK   := '';
            sPCBarcodeNG   := '';
            sUploadbarcode := '';
            sPCBarcodeNOREAD := '';
        end;
    finally
        Ini.Free;
    end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var INI : TIniFile;
begin
    bAutoTest := False;
    gbReset := False;
    TestMode := 0;
    AutoResetCount := 0;
    bFirst := True;
    

    Caption := Format('%s [ %s ]', [Caption, GetExeVersion]);

    CurrProject  := TTestProjcet.Create;
    UnitInfo.StepResult := TStringList.Create;
    UnitInfo.TestResult := TStringList.Create;

    PageControl1.ActivePageIndex := 0;

    // ?????????? Loading????.
    INI := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        // ?????? ?????????? ???? ?????????????? ????.
        gModelFolder := INI.ReadString('CONFIG', 'ModelFolder', GetAppDir('MODEL'));
        gDataFolder  := INI.ReadString('CONFIG', 'DataFolder',  GetAppDir('DATA'));

        if not DirectoryExists(gModelFolder) then gModelFolder := GetAppDir('MODEL');
        if not DirectoryExists(gDataFolder)  then gDataFolder  := GetAppDir('DATA');

        gLayoutFile  := INI.ReadString('CONFIG', 'LastLayout',   'LAYOUT.ini');
        gModel       := INI.ReadString('CONFIG', 'LastModel',    '');
        gModelCode   := INI.ReadString('CONFIG', 'LastModelCode','');
    finally
        INI.Free;
    end;

    if gModel = '' then gModel := 'TEST';
    gBaseDir := gModelFolder + gModel + '\';
    Graph := TGraph.Create;

    ReadPLCIOInfo;

    PrevTime := Now;
    AddLog('>>> PROGRAM START');
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
    IniMain.LoadData;
    CreateBarcode();
    DisplayTestCount;

    ResetIO;

    DeviceManager.CreateDeviceMenu(MenuDevice);

    // ?????? Layout ?????? ????????.
    if FileExists(gBaseDir + gLayoutFile) then LoadFromLayoutFile(gBaseDir + gLayoutFile)
                                          else gLayoutFile := '';
    OpenModal(True);

    SetUnitState(ts_None);

    TimerRun.Enabled  := True;
    TimerPLC.Enabled  := True;

    SetPCReady(True);

    //PinCount(0);

    LbFailCount.Caption := '0';
    nReFailCount := 0;

    //???????? ????????.
    //FrmTRClient.CommConnect(True, False);
    FRMiTAC.getCurrentCal();


end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
//    SaveConfig;
    UnitInfo.StepResult.Free;
    UnitInfo.TestResult.Free;
    CurrProject.Free;
    IniMain.SaveData;
    DestroyBarcode();
    //Graph.Free;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var INI : TInifile;
begin
    TestStop(False);
    SetPCReady(False);
    TimerRun.Enabled  := False;
    TimerPLC.Enabled  := False;

    // ?????????? ????????.
    INI := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        INI.WriteString('CONFIG', 'LastModel',     gModel);
        INI.WriteString('CONFIG', 'LastModelCode', gModelCode);
        INI.WriteString('CONFIG', 'LastLayout',    gLayoutFile);
    finally
        INI.Free;
    end;
    AddLog('>>> PROGRAM END');

end;

procedure TFrmMain.BtnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMain.TimerRunTimer(Sender: TObject);
var ElapseTime, ElapseTime1 : TDateTime;
    nHour1, nMin1, nSec1, nmSec1 : Word;
    nHour, nMin, nSec, nmSec : Word;
begin
    // ?????????? ?????????? ?????? ????????.
    TimerRun.Enabled := False;
                         
    if not gbRunning then exit;

    ElapseTime := Now() - StartTime;
    DecodeTime(ElapseTime, nHour, nMin, nSec, nmSec);
    nHour := nHour + Trunc(ElapseTime);
    LCD_Time.Value := Format('%.3d:%.2d:%.2d', [nHour, nMin, nSec]);



//    LCD_Time.Value := MakeElapseTimeStr(StartTime, Now, 2);

    FrmUDPComm.SendUDP(Format('TIME:%d:1:%s', [nTesterNo, LCD_Time.Value ]));


    if LabelUnit.Color = clGreen then
        LabelUnit.Color := clBlack
    else
        LabelUnit.Color := clGreen;

    if (UnitInfo.SetTime > 0) and ( (nHour*60)+nMin >= UnitInfo.SetTime) then exit;

    TimerRun.Enabled := True;
end;

procedure TFrmMain.MenuCloseClick(Sender: TObject);
var
    i: integer;
    Form : TForm;
begin
    // Client???? ???? ????????.
    for i:= MDIChildCount-1 downto 0 do
    begin
        Form := MDIChildren[i];
        Form.Close;
    end;
   Application.ProcessMessages; // ?????? ????????.
    btnReset.Click;
    Close;
   Application.Terminate;
end;

procedure TFrmMain.N7Click(Sender: TObject);
begin
    FrmResEdit.ShowModal;

    CurrProject.LoadFromFile(gBaseDir + 'PROJECT\' + gProjectFileName);
    ViewTestInfo;
end;

procedure TFrmMain.InitialDesignerForm();
var
    i : Integer;
    Form : TForm;
begin
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        Form := Application.MainForm.MDIChildren[i];
        with Form do
        begin
            if (ClassName = 'TFrmDesigner') then
                TFrmDesigner(Form).InitialControl;
        end;
    end;
end;   

procedure TFrmMain.DesignerFormEnabled(bEnabled: boolean);
var
    i : Integer;
    Form : TForm;
begin
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        Form := Application.MainForm.MDIChildren[i];
        with Form do
        begin
            if (ClassName = 'TFrmDesigner') then
            begin
                if bEnabled then
                    TFrmDesigner(Form).actStart.OnExecute(nil)
                else
                    TFrmDesigner(Form).actStop.OnExecute(nil);
            end;
        end;
    end;
end;


procedure TFrmMain.ControlMenu(iIndex: integer);
var
    Str : string;
    FileName : String;
    aFrmDesigner: TFrmDesigner;
label
    GOTO_SAVEAS;

begin
    if gbRunning then exit;

    {
    if iIndex in [4, 6..11] then
    begin
        FrmPassword := TFrmPassword.Create(self);
        FrmPassword.Password := gNormPassword;
        if not FrmPassword.Execute then
            exit;
        FrmPassword.Free;
    end;

    }

    if iIndex in [4..5, 8..10] then
        DesignerFormEnabled(False);

    case iIndex of
        0: begin  // ???????? ???? ????
            if FrmSelModel.Execute(gModelFolder, gModel, gModelCode) then begin
                if not OpenModal(True) then begin
                    MessageBox('???????? ????', '????', MB_OK or MB_ICONERROR);
                    SetUnitState(ts_Fail);
                end;
            end;
        end;

        1: begin // ????
            if FileExists(gBaseDir + gLayoutFile) then
                SaveToLayoutFile(gBaseDir + gLayoutFile)
            else
                goto GOTO_SAVEAS;
        end;

        2: begin // ????????????
GOTO_SAVEAS :
            SaveDialog.InitialDir := gBaseDir;
            if SaveDialog.Execute then
            begin
                FileName := SaveDialog.FileName;
                if FileName = '' then exit;

                //FileName := gModelFolder + FileName;
                SaveToLayoutFile(FileName);
            end;
        end;

        3: begin // ????
            FrmBuff.Show;
        end;

        4: begin // ????????
            if FrmStepEdit.Execute('') then
            begin
                CurrProject.LoadFromFile(gBaseDir + 'PROJECT\' + gProjectFileName);
                ViewTestInfo;
            end;
        end;

        5: begin // ?????? ????
            FrmReport.Run(gsSaveDir);
        end;

        6: begin // ?????? ??????????
            FrmHwTest.ShowModal;
        end;

        7: begin // ?????? ?? ????
            aFrmDesigner := TFrmDesigner.Create(Self);
            aFrmDesigner.Show;
{
            Form := TFrmDesigner.Create(Self);
            sCaption := gBaseDir + 'SIMULATOR\' + sCaption;
            TFrmDesigner(Form).OpenFile(sCaption);
            TFrmDesigner(Form).actStart.OnExecute(nil);
}
        end;

        8: begin
            FrmPLCControl.show();
        end;
        9: begin // ????????????
            FrmTestOption.Execute();
        end;

        10: begin // ????????
            FrmHWMain.ShowModal;
        end;

        11: begin // QA????
            FrmMasterMode.ShowModal;
        end;
    end;

    if iIndex in [4..5, 8..10] then
        DesignerFormEnabled(True);
end;

procedure TFrmMain.MenuOpenProjectClick(Sender: TObject);
var
    iIndex : integer;
    FrmPW  : TFrmPW;
begin
   // SetPCReady(False);



    if (Sender is TMenuItem) then
        iIndex := (Sender as TMenuItem).Tag
    else if (Sender is TToolButton) then
        iIndex := (Sender as TToolButton).Tag;

    if (iIndex = 4) or (iIndex =9) or (iIndex =10 )or (iIndex =11 ) then
    begin
        FrmPW := TFrmPW.Create(self);
        try
            FrmPW.Password := Edt_Pass.Text;
            if FrmPW.Execute then begin
                ControlMenu(iIndex);
            end;
        finally
            FrmPW.Free;
            Show;
        end;
    end else
        ControlMenu(iIndex);

    SetPCReady(True);
end;

procedure TFrmMain.MenuAutoAlignClick(Sender: TObject);
var i, nGrid : Integer;
    Form : TForm;
begin
    nGrid := 8;
    for i:= 0 to MDIChildCount-1 do
    begin
        Form := MDIChildren[i];
        Form.Left   := Round(Form.Left   / nGrid) * nGrid;
        Form.Top    := Round(Form.Top    / nGrid) * nGrid;
        Form.Width  := Round(Form.Width  / nGrid) * nGrid;
        Form.Height := Round(Form.Height / nGrid) * nGrid;

        if Form.Left < 0 then Form.Left := 0;
        if Form.Top  < 0 then Form.Top  := 0;
{
        if Form.Left + Form.Width  > ClientWidth  then Form.Width  := ClientWidth  - Form.Left;
        if Form.Top  + Form.Height > ClientHeight then Form.Height := ClientHeight - Form.Top;
}
    end;
end;

procedure TFrmMain.MenuGraphClick(Sender: TObject);
var i : Integer;
begin
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if (Application.MainForm.MDIChildren[i].ClassName = 'TFrmGraph') then
        begin
            Application.MainForm.MDIChildren[i].BringToFront;
            exit;
        end;
    end;

    //  ???????? ????????.
    FrmGraph := TFrmGraph.Create(Self, Graph);
    FrmGraph.Show;
end;

procedure TFrmMain.ViewTestInfo();
begin
    MakeTestTree();
    Label_TestFile.Caption := gProjectFileName;
end;

procedure TFrmMain.MakeTestTree();
var
    i, j : Integer;
    TestStep : TTestStep;
    ParentNode, ChildNode  : TTreeNode;
    RdStr, ItemStr, ParamStr : String;

    function AddChildTree(PNode : TTreeNode; TitleStr : String; nImageIdx : Integer) : TTreeNode;
    begin
        Result := TreeView.Items.AddChild(PNode, '');
        Result.Text := TitleStr;
        Result.ImageIndex    := nImageIdx;
        Result.SelectedIndex := nImageIdx;
    end;

begin
    try
        TreeView.Items.BeginUpdate;
        TreeView.Items.Clear;

        for i:=0 to CurrProject.GetStepCount()-1 do
        begin
            TestStep := CurrProject.GetStep(i);
            if (TestStep = nil) then break;

//            if not IsStepEnabled(TestStep) then continue;

            ParentNode := TreeView.Items.Add (nil, '');
            ParentNode.Text := TestStep.StepName;
            if IsStepEnabled(TestStep) then begin
                ParentNode.ImageIndex    := 0;
                ParentNode.SelectedIndex := 0;
            end else begin
                ParentNode.ImageIndex    := 1;
                ParentNode.SelectedIndex := 1;
            end;

            ChildNode := AddChildTree(ParentNode, '????????', IMAGE_FOLDER);
            for j:=0 to TestStep.InputList1.Count-1 do begin
                RdStr := TestStep.InputList1[j];
                ItemStr  := GetToken(RdStr, ';');
                ParamStr := GetToken(RdStr, ';');
                if ItemStr <> '' then
                    AddChildTree(ChildNode, ItemStr + ';' + ParamStr, IMAGE_DOC);
            end;

            ChildNode := AddChildTree(ParentNode, '??????????', IMAGE_FOLDER);
            for j:=0 to TestStep.InputList2.Count-1 do begin
                RdStr := TestStep.InputList2[j];
                ItemStr  := GetToken(RdStr, ';');
                ParamStr := GetToken(RdStr, ';');
                if ItemStr <> '' then
                    AddChildTree(ChildNode, ItemStr + ';' + ParamStr, IMAGE_DOC);
            end;
            
            ChildNode := AddChildTree(ParentNode, '????????', IMAGE_FOLDER);
            for j:=0 to TestStep.OutputList.Count-1 do begin
                RdStr := TestStep.OutputList[j];
                ItemStr  := GetToken(RdStr, ';');
                ParamStr := GetToken(RdStr, ';');
                if ItemStr <> '' then
                    AddChildTree(ChildNode, ItemStr + ';' + ParamStr, IMAGE_DOC);
            end;

            ChildNode := AddChildTree(ParentNode, '????????', IMAGE_FOLDER);
            for j:=0 to TestStep.CheckList.Count-1 do begin
                RdStr := TestStep.CheckList[j];
                ItemStr  := GetToken(RdStr, ';');
                ParamStr := GetToken(RdStr, ';');
                if ItemStr <> '' then
                    AddChildTree(ChildNode, ItemStr + ';' + ParamStr, IMAGE_DOC);
            end;

            ChildNode := AddChildTree(ParentNode, '????????', IMAGE_FOLDER);
            for j:=0 to TestStep.OptionList.Count-1 do begin
                RdStr := TestStep.OptionList[j];
                ItemStr  := GetToken(RdStr, ';');
                ParamStr := GetToken(RdStr, ';');
                if ItemStr <> '' then
                    AddChildTree(ChildNode, ItemStr + ';' + ParamStr, IMAGE_DOC);
            end;
        end;

    except on E:Exception do
        WriteDebugStr ('Error on ZTestList.StepListToTree() :' + E.Message);
    end;

    TreeView.Items.EndUpdate;

    // ?????????? ????????.
    FrmResEdit.MakeResourceTree(TreeViewRes);
    Label_TestFile.Caption := gProjectFileName;
end;

function TFrmMain.ReturnSerial(sSerial :string):string;
var
    i : integer;
    sStr, sCode : string;
    sTemp : char;
begin
    sStr := '';
    for i := 1 to length(sSerial) do
    begin
//        sTemp := Copy( sSerial , i, 1);
        sTemp := sSerial[i];

        //Ord(sTemp);
//         sCode := IntToHex(StrToInt('$'+ sTemp),2);
         sCode := IntToHex(Ord(sTemp),2);

        sStr := sStr + sCode;
        if (i <> length(sSerial)) then
            sStr := sStr + ' ';
    end;
    Result := sStr;
end;

procedure TFrmMain.TestStart(bInit : Boolean);
var nYear, nMon, nDay : Word;
    Str : String;

    nRet : integer;
    sAttribute : string;
    
begin
    SetUnitState(ts_Running);
    FrmUDPComm.SendUDP(Format('START:%d:1', [nTesterNo ]));
    FrmUDPComm.SendUDP(Format('PROGRESS:%d:1:%d', [nTesterNo, 0]));


    // Sent Init
   // FrmSent.DevInit('');

    UnitInfo.TestResult.Clear;
    if FrmData <> nil then FrmData.ClearData;


    // ???????? ?????? ???????????????? ??????????
    if (lb_Barcode.Caption = '') or
       (( Length(lb_Barcode.Caption) > 1) and (lb_Barcode.Caption[1] ='@')) then
    begin
        lb_Barcode.Caption := FormatDateTime('@YYMMDDHHNNSS', Now);
    end;

    FrmUDPComm.SendUDP(Format('MODEL:%d:1:%s:%s', [nTesterNo, Label_Model.Caption, Label_TestFile.Caption ]));
    FrmUDPComm.SendUDP(Format('BARCODE:%d:1:%s', [nTesterNo, lb_Barcode.Caption ]));

    if (bInit) then begin
        //FrmLog.BtnClearClick(nil);

        UnitInfo.FailCount := 0;
        UnitInfo.bCycleResult := True;
        //Label_UnitNgCount.Caption := '0';

        TestCount := 0;
        StartTime := Now();
        {
        with FrmStart do begin
            if (CheckBox_AutoDirName.Checked) or (Edit_SaveDir.Text = '') then begin
                Edit_SaveDir.Text := FormatDateTime('YYMMDD_HHNNSS', Now());
            end;
        end;}
    end
    else begin
        if (StartTime <> 0) then
            StartTime := Now() - (StopTime - StartTime)
        else
            StartTime := Now();
    end;

    // ???????? ????.
    Str := '';
    if FrmTestOption.CheckBox_TestTime.Checked then begin
        UnitInfo.SetTime := (FrmTestOption.Edit_TestHour.Value * 60) +
                             FrmTestOption.Edit_TestMin.Value;

        Str := Format('?????????? : %d???? %d??  ', [FrmTestOption.Edit_TestHour.Value, FrmTestOption.Edit_TestMin.Value]);
    end
    else
        UnitInfo.SetTime := 0;

    // ???????? ????.
    if FrmTestOption.CheckBox_TestCount.Checked then begin
        UnitInfo.SetCount := FrmTestOption.Edit_TestCount.Value;
        Str := Str + Format('?????????? : %d??', [FrmTestOption.Edit_TestCount.Value]);
    end
    else
        UnitInfo.SetCount := 0;

//    StatusBar.Panels[2].Text := Str;

    LCD_Time.OnColor  := clYellow;
    LCD_Cycle.OnColor := clYellow;
    LCD_Cycle.Value := IntToStr(TestCount);

//    vl_Variable.Strings.Clear;

    // ????
    DecodeDate(Now,  nYear, nMon, nDay);
    vl_Variable.Strings.Values['Year']  := Format('%.2x', [nYear mod 100]);
    vl_Variable.Strings.Values['Month'] := Format('%.2x', [nMon]);
    vl_Variable.Strings.Values['Day']   := Format('%.2x', [nDay]);
    vl_Variable.Strings.Values['Counthi'] := Format('%.2x', [edtGood.value div 256]);
    vl_Variable.Strings.Values['Countlo'] := Format('%.2x', [edtGood.value mod 256]);

    vl_Variable.Strings.Values['SerialNum'] := lb_Barcode.Caption;
    vl_Variable.Strings.Values['SerialNum_ASCII'] := ReturnSerial(lb_Barcode.Caption);

    if FrmTestOption.Cb_UseITAC.Checked and FrmTestOption.cb_PCBcheck.Checked then
    begin
        //??????
        nRet := FrmItac.GetAttributeforSerial(lb_Barcode.Caption, 'serialNrPCB', sAttribute);
        AddLog(Format('%S GetAttribute serialNrPCB  : Ret : %d, %S',[lb_Barcode.Caption, nRet, sAttribute]));
        if (nRet = 0) AND (sAttribute <> '') then
        begin
            vl_Variable.Strings.Values['PCBSerialNum'] := sAttribute;
            vl_Variable.Strings.Values['PCBSerialNum_ASCII'] := ReturnSerial(sAttribute);
        end;
    end;
    
    StopTime  := Now();
    gbRunning := True;
    AddLog('>>> TEST START');

   // FrmMain.PinCount(1); //pincount ????...

    TimerRun.Enabled := True;
end;

procedure TFrmMain.TestStop(bReset: Boolean);
var nRetry : Integer;
    sResult, sCommand, sTemp: string;
    sBarcode: string;
    sErrorMessage : String;
begin
    TimerPLC.Enabled := False;
    TimerRun.Enabled := False;

    // ?????????????????? ?????? ????.
    if (gbRunning) then begin
 {       if (UnitInfo.bTotalResult) then
        begin
            //FrmPLCControl.JigUnloading;
            //FrmPLCControl.BtnUnLoadingClick(nil);
            SetUnitState(ts_Good);
            edtGood.Value := edtGood.Value + 1;
            nReFailCount := 0;
            FrmMelsecQ.SendCommand(sPCOK, 1);
        end
        else begin
            SetUnitState(ts_Fail);
            edtFail.Value := edtFail.Value + 1;

            nReFailCount := StrToIntDef(LbFailCount.Caption, 0);
            nReFailCount := nReFailCount + 1;
            LbFailCount.Caption := IntToStr(nReFailCount);

            if (FrmTestOption.Cb_AutoNGStop.Checked) and
               (nReFailCount >= FrmTestOption.Ed_NgStopCount.Value) then begin
                SetPCReady(False);
                DispMessage('???? ???? ????!!' + FrmItac.LastMessage, clRed);
                AddLog('???? ???? NG - ???? ?? RESET ????!!!');
                sErrorMessage := '???? 3?? ???? ???? RESET ???? ?? ??????';
                //AddPnMessage(sErrorMessage, True);
                FrmMessage := TFrmMessage.Create(Self);
                FrmMessage.ShowTestMessaage(sErrorMessage,0);

                //FrmPLCControl.TimerStart.Enabled := False;
            end;
            FrmMelsecQ.SendCommand(sPCNG, 1);
        end;

 }

        if (UnitInfo.bTotalResult) then
        begin
            SetUnitState(ts_Good);
            edtGood.Value := edtGood.Value + 1;
            FrmMelsecQ.SendCommand(sPCOK, 1);
        end
        else begin
            SetUnitState(ts_Fail);
            edtFail.Value := edtFail.Value + 1;
            FrmMelsecQ.SendCommand(sPCNG, 1);
        end;
        DisplayTestCount;
        IniMain.SaveData; // ???????? ?????????? ?????? ?????????? ???? 2010-01-08.
    end;

    LCD_Time.OnColor  := clGray;
    LCD_Cycle.OnColor := clGray;

    StopTime := Now();
    AddLog('<<< TEST STOP');
    AddLog('');

    // PLC Interface.
    AddLog('>>> PLC END END');

{
    //---------------------------------------------
    // PLC?? TEST END SIGNAL ????... ON?????????? PLC???? ?????? OFF??.
    FrmMelsecQ.SendCommand(sPCEnd, 1);
    AddLog(Format('PC END ON (%s)', [sPCEnd] ));
    //---------------------------------------------
}
    SetPCReady(True);

    gbRunning := False;
    bAutoTest := False;
    AutoResetCount := 0;
    ReadyTime := GetTickCountEx;
    TestMode := 0;

    TimerPLC.Enabled := True;
    FrmUDPComm.SendUDP(Format('END%d:1:', [nTesterNo ]));

    IF not FrmTestOption.Cb_UseITAC.Checked then
        if FrmMessage <> nil then
            FrmMessage.Close;
    bFirst := False;
end;

procedure TFrmMain.SetUnitState(State : TTestState);
begin
    UnitInfo.State := State;

    case State of
        ts_None : begin
            LabelUnit.Caption := 'NONE';
            LabelUnit.Color := clBlack;
            {FrmHWMain.WriteDO(4, 08, False);//RED
            FrmHWMain.WriteDO(4, 10, False);//ORANGE
            FrmHWMain.WriteDO(4, 11, True);//GREEN
            FrmHWMain.WriteDO(4, 12, False);//BEEP }
        end;

        ts_Ready : begin
            LabelUnit.Caption := 'READY';
            LabelUnit.Color := clGray;
            lb_Barcode.Caption := '';
            {FrmHWMain.WriteDO(4, 08, False);//RED
            FrmHWMain.WriteDO(4, 10, False);//ORANGE
            FrmHWMain.WriteDO(4, 11, True);//GREEN
            FrmHWMain.WriteDO(4, 12, False);//BEEP    }
        end;

        ts_Running : begin
            LabelUnit.Caption := 'TEST';
            LabelUnit.Color := clGreen;             
            {FrmHWMain.WriteDO(4, 08, False);//RED
            FrmHWMain.WriteDO(4, 10, True);//ORANGE
            FrmHWMain.WriteDO(4, 11, False);//GREEN
            FrmHWMain.WriteDO(4, 12, False);//BEEP    }
        end;

        ts_Good : begin
            LabelUnit.Caption := 'GOOD';
            LabelUnit.Color := clLime;
            {FrmHWMain.WriteDO(4, 08, False);//RED
            FrmHWMain.WriteDO(4, 10, False);//ORANGE
            FrmHWMain.WriteDO(4, 11, True);//GREEN
            FrmHWMain.WriteDO(4, 12, False);//BEEP   }
        end;

        ts_Fail : begin
            LabelUnit.Caption := 'FAIL';
            LabelUnit.Color := clRed;      
            {FrmHWMain.WriteDO(4, 08, True);//RED
            FrmHWMain.WriteDO(4, 10, False);//ORANGE
            FrmHWMain.WriteDO(4, 11, False);//GREEN
            FrmHWMain.WriteDO(4, 12, True);//BEEP    }

            bFail := False;

        end;
    end;

    // REPORT?????? ????????.
    if (FrmData <> nil) then begin
        FrmData.Lb_Result.Caption := LabelUnit.Caption;
        FrmData.Lb_Result.Color   := LabelUnit.Color;
    end;

    FrmUDPComm.SendUDP(Format('STATUS:%d:1:%d', [nTesterNo, Ord(State)]));
end;

procedure TFrmMain.DisplayTestCount;
begin
    edtTotal.Value   := edtGood.Value + edtFail.Value;

    lcdTotal.Caption := Format('%.4d', [ edtTotal.Value ]);
    lcdGood.Caption  := Format('%.4d', [ edtGood.Value  ]);
    lcdFail.Caption  := Format('%.4d', [ edtFail.Value  ]);

    FrmUDPComm.SendUDP(Format('COUNTER:%d:1:%d,%d', [nTesterNo, edtGood.Value, edtFail.Value ]));
end;

procedure TFrmMain.lcdGoodDblClick(Sender: TObject);
var  sModelComment : String;
begin
    sModelComment := FrmEditModel.GetItemByName(gModelCode, 'MODEL');


    case (Sender as Tdpblabel).Tag of
        0:begin
            edtGood.Value := 0;//ShowMessage('Count ???????? ???????? ??????. ?????????? ????.');
        end;
        1: edtFail.Value := 0;
    end;
    DisplayTestCount;
end;

function TFrmMain.FindCurrTreeStep(nStepNo : Integer) : TTreeNode;
var
    Node : TTreeNode;
    TestStep : TTestStep;
begin
    Result := nil;

    TestStep := CurrProject.GetStep(nStepNo);
    if (TestStep = nil) or (not TestStep.Enabled) then exit;

    try
        Node := TreeView.Items[0];

        if Node = nil then exit;
        while (Node <> nil) do begin
            if (TestStep.StepName = Node.Text) then begin
                Result := Node;
                break;
            end;
            Node := Node.GetNextSibling;
        end;
    except on E:Exception do
        WriteDebugStr ('Error on FindCurrTreeStep() :' + E.Message);
    end;
end;

function TFrmMain.SaveGraph() : Boolean;
var bSaveGraph : Boolean;
    SaveDir, SaveFile : String;
begin
    Result := False;
    if (FrmGraph = nil) then exit;

    bSaveGraph := False;
    case FrmTestOption.Radio_GraghSave.ItemIndex of
        0: bSaveGraph := True;                                    // All
        1: if (UnitInfo.bStepResult)     then bSaveGraph := True; // Good
        2: if (not UnitInfo.bStepResult) then bSaveGraph := True; // Fail
    end;

    if (bSaveGraph) then
    begin  {
        SaveDir := gsSaveDir + FrmTestOption.Edit_SaveDir.Text + '\';

        MakeDir(SaveDir);
        SaveFile := Format('[%.3d]%s_%.4d', [giStepIndex, FrmGraph.TimeGraph.Title, edtTotal.Value + 1]);
        if UnitInfo.bStepResult then SaveFile := SaveFile + '-O.GDT'
                                else SaveFile := SaveFile + '-X.GDT';

        SaveFile := SaveDir + MakeValidFilenameStr(SaveFile);
        FrmGraph.SaveToFile(SaveFile);
        }
        Result := True;
    end;
end;

procedure TFrmMain.SaveTestInfo();
var INI : TINIFile;
begin
    INI := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        INI.WriteFloat('TESTINFO', 'STARTTIME', StartTime);
        INI.WriteFloat('TESTINFO', 'STOPTIME',  StopTime);
        INI.WriteInteger('TESTINFO', 'TestCount', TestCount);
    finally
        INI.Free;
    end;
end;

// ???????? ????????.
function TFrmMain.SaveTestData : Boolean;
var i, CH : Integer;
    SaveDir, FileName : String;
    WtStr, RdStr : String;
    f: TextFile;
    sProjectNo, sBarcode: string;
    nTestCount : Integer;
    sLMSINI : string;
begin
    Result := False;
    with UnitInfo do
    begin

        SaveDir := gsSaveDir; // + FrmTestOption.Edit_SaveDir.Text;
        if SaveDir = '' then begin
            SaveDir := GetAppDir('DATA');
        end;
        IF FrmMasterMode.gbMasterBCR then
        begin
            SaveDir := GetAppDir('DATA') + 'MASTER\' +
                         FormatDateTime('YYYY-MM', Now) + '\' +
                         FormatDateTime('MM-DD',   Now) + '\' + gModelCode + '\';  // 2010-09-06 jsi.
        end;
        MakeDir(SaveDir);

        // ???????????? ????.
        if lb_Barcode.Caption = '' then begin
            lb_Barcode.Caption := FormatDateTime('@YYMMDDHHNNSS', Now);
        end;

        // ?????? ???????? ???? ????????....
        nTestCount := 1;
        while True do begin
            if (bCycleResult) then
                FileName := SaveDir + Format('%s_%d-O.csv', [lb_Barcode.Caption, nTestCount])
            else
                FileName := SaveDir + Format('%s_%d-X.csv', [lb_Barcode.Caption, nTestCount]);

            if not FileExists(FileName) then break;
            Inc(nTestCount);
        end;
{
        // CSV ?????? ????????.
        if FrmData <> nil then begin
           // FrmData.Grid.SaveToHTML(SaveDir + FileName + '.htm');
            FrmData.Grid.SaveToCSV(FileName);
        end;
}

        // CSV ?????? ????..
        AssignFile (f, filename);
        ReWrite(f);

        try
            WriteLn (f, '[HEADER]');
            WriteLn (f, Format('MODEL,%s',    [Label_Model.Caption]));
            WriteLn (f, Format('TESTFILE,%s', [Label_TestFile.Caption]));

            WriteLn (f, Format('StartTime,%s',  [ DateTimeToStr(StartTime) ]));
            WriteLn (f, Format('TestTime,%s',   [ LCD_Time.Value ]));
            WriteLn (f, '');

            WriteLn (f, '[DATA]');
            WriteLn (f, 'NO,STEP,ITEM,SPEC,VALUE,UNIT,RESULT');

            for i:= 0 to TestResult.Count-1 do begin
                RdStr := TestResult[i];

                WtStr := Format('%d,', [i+1]);
                while (RdStr <> '') do begin
                    WtStr := WtStr + '"' + GetToken(RdStr, ';') + '",';
                end;
                WriteLn (f, WtStr);
            end;
            Flush (f);
            Result := True;
        finally
            CloseFile (f);
        end;
    end;

    if FrmLMSedit.chkLMSUse.Checked then
    begin
        if bAutoTest and (Copy(lb_Barcode.Caption,1,1) <> '@') then
        begin
            with FrmLMSedit do
            begin
                GetTESTresult(FileName);
                sLMSINI := GetAppDir('LMS_INI') + FrmEditModel.GetItemByName(gModelCode, 'LMS_INI');
                if not ReturnLMSList(sLMSINI) then
                begin
                    AddLog('LMS INI LIST ERROR');
                    exit;
                end;
                ReturnLMSResult();
            end;
        end;
    end;
end;

function TFrmMain.RunInputCondition(StepName : String; InputList : TStringList) : Boolean;
var InputIdx, nDelay : Integer;
    RdStr, ItemStr, ParamStr : String;
    fTime : Double;
    ResourceItem : TResourceItem;
    Msg: TMsg;
begin
    if (StepName = 'TEST') then gbRunning := True;

    Result := True;
    InputIdx := 0;
    while (gbRunning) and (InputIdx < InputList.Count) do
    begin
        RdStr    := InputList[InputIdx];
        ItemStr  := ReplaceTblString( GetToken(RdStr, ';') );
        ParamStr := ReplaceTblString( GetToken(RdStr, ';') );

        StatusBar.Panels[0].Text :=  ItemStr + ' = ' + ParamStr;

        if (ItemStr = 'DELAY') then begin
            FrmBuff.Add(ItemStr, ParamStr);

            nDelay := Round(StrToFloatDef( ParamStr, 0) * 1000);
            fTime := GetTickCountEX();
            while ( GetTickCountEX - fTime < nDelay) do begin
                if (not gbRunning) then break;
                Application.ProcessMessages;
                Sleep(1);
                StatusBar.Panels[0].Text := format('DELAY = %3.1f / %3.1f Sec', [(GetTickCountEX - fTime)/1000, nDelay/1000]);
            end;
            StatusBar.Panels[0].Text := '';
        end else

        if (ItemStr = 'GRAPH') then
        begin
            FrmBuff.Add(ItemStr, ParamStr);
            {
            if FrmGraph <> nil then
            begin
                FrmGraph.SetXAxis(StepName, 0, StrToFloatdef(ParamStr, 10));
                FrmGraph.BtnStartClick(nil);
                FrmGraph.CheckBox_Continue.Checked := False;
            end;
            }
        end else

        if (ItemStr = 'PAUSE') then begin
{            if FrmMessage.Visible then FrmMessage.Close;
            if sMessage <> '' then
                FrmMessage.ShowTestMessaage(sMessage, 0)
            else
                FrmMessage.ShowTestMessaage('?????? ???????? ????????', 0);
}
        end else

        if (ItemStr = 'MESSAGE') then begin
            if (ParamStr = 'ON') and (sMessage <> '') then
                if FrmMessage <> nil then FrmMessage.Label_Msg.Caption := sMessage;
        end else
        begin
            StatusBar.Panels[0].Text :=  ItemStr + ' = ' + ParamStr + 'INPUT';
            ResourceItem := CurrProject.GetResource(0, ItemStr);
            WriteResName(ResourceItem, ParamStr);
            StatusBar.Panels[0].Text :=  ItemStr + ' = ' + ParamStr + 'RETURN';
        end;
        Inc(InputIdx);
    end;

    if (StepName = 'TEST') then gbRunning := False;
end;

function GetModelSpec(sSection, sItem: string): string;
var
   aIniFile: TIniFile;
begin
   aIniFile := TIniFile.Create (GetAppDir('') + 'Spec.ini');
   Result := aIniFile.ReadString(sSection, sItem, '');
   aIniFile.Free;
end;


// ?????? ???????? ???? ????????. '?', '*' ?? ????.
function CompareMaskStr( SrcStr, MaskStr : String) : Boolean;
var i, MaskLen : Integer;
begin
    if (MaskStr = '') or (SrcStr = MaskStr) then begin
        Result := True;
        exit;
    end;

    if (Length(MaskStr) > Length(SrcStr)) then begin
        Result := False;
        exit;
    end;

    if (MaskStr[1] = '*') then
    begin
        Result := True;

        MaskLen := Length(MaskStr);
        if (MaskLen > 3) and (MaskStr[MaskLen] = '*') then begin
            MaskStr := Copy(MaskStr, 2, MaskLen-2);
            Result := Pos(MaskStr, SrcStr) > 0;
            exit;
        end;

        for i := Length(SrcStr) downto 1 do
        begin
            if MaskStr[i] = '*' then break;
            if ( SrcStr[i] <> MaskStr[i] ) and (not (MaskStr[i] in ['?', 'x'])) then begin
                Result := False;
                exit;
            end;
        end;
    end else
    begin
        Result := True;
        for i := 1 to Length(SrcStr) do
        begin
            if MaskStr[i] = '*' then break;
            if ( SrcStr[i] <> MaskStr[i] ) and (not (MaskStr[i] in ['?', 'x'])) then begin
                Result := False;
                exit;
            end;
        end;
    end;
end;

var
    nTime : Integer;


function CheckBoolStr(sParam : String) : Boolean;

    // ?????????????? ???? ??????.
    Function GetTokenTbl(var Str: String; DelimTbl : array of String; var DelimStr : String): String;
    var Len, Pnt: Integer;
        Buf: String;
        i, Idx, nPos, nFirstPos, IdxPos : Integer;
    begin
        nFirstPos := 99999;
        DelimStr  := '';

        for i:= Low(DelimTbl) to High(DelimTbl) do begin
            nPos := Pos(DelimTbl[i], Str);
            if (nPos > 0) and ( nPos < nFirstPos) then begin
                nFirstPos := nPos;
                DelimStr  := DelimTbl[i];
             end;
        end;

        if (nFirstPos < 99999) then begin
            Result := Copy(Str, 1, nFirstPos-1);
            Str := Copy (Str, nFirstPos + Length(DelimStr), Length(Str));
        end else begin
            Result := Str;
            Str := '';
       end;
    end;

var Str : String;
    sFieldName, sFieldValue, sDelim : String;
    i, Pos1, Pos2 : Integer;
    StrList : TStringList;
    LogicMode : String;
    bFieldReult : Boolean;
begin
    sParam := UpperCase(sParam);
    
    // ???? ?????? or ????????.
    StrList := TStringList.Create;
    try
        StrList.Clear;
        while (sParam <> '') do
        begin
            Str := GetTokenTbl(sParam, ['AND', 'OR', ','], sDelim);

            Str    := Trim(Str);
            sDelim := Trim(sDelim);

            if Str <> ''    then StrList.Add(Str);
            if sDelim <> '' then StrList.Add(sDelim);
        end;

        LogicMode := '';
        for i:= 0 to StrList.Count-1 do
        begin
            Str := StrList[i];
            sFieldName  := GetTokenTbl(Str, ['=', '<>'], sDelim);
            sFieldValue := Str;

            if (sFieldName = 'AND') or (sFieldName = 'OR') or (sFieldName = ',') then
            begin
                LogicMode := sFieldName;
                continue;
            end;

            if (sFieldValue = '') then begin
                bFieldReult := (sFieldName = 'O');
            end else
            begin
                if (sDelim = '=') then
                    bFieldReult := (sFieldName = sFieldValue)
                else
                if (sDelim = '<>') then
                    bFieldReult := (sFieldName <> sFieldValue)
                else
                    bFieldReult := False;
            end;


            if (LogicMode = 'AND') then
                Result := (Result and bFieldReult) else
            if (LogicMode = 'OR') or (LogicMode = ',') then
                Result := (Result or  bFieldReult) else
            if (LogicMode = '')    then
                Result := bFieldReult;

            LogicMode := '';
        end;
    finally
        StrList.Free;
    end;
end;

function TFrmMain.IsStepEnabled(TestStep : TTestStep) : Boolean;
var i : Integer;
    Str, RdStr, sItems, sParam, sFieldName : String;
begin
    if (TestStep = nil) or (not TestStep.Enabled) then exit;

    Result := True;

    sParam := '';
    for i:= 0 to TestStep.OptionList.Count-1 do begin
        RdStr := TestStep.OptionList[i];
        sItems := GetToken(RdStr, ';');
        if (sItems = 'RUNMODE') then begin
            sParam := GetToken(RdStr, ';');
            break;
        end;
    end;
    if sParam = '' then exit;

    // SKIP??????. ????????????.
    if (sParam = 'SKIP') then Result := False;

    if gbRunning then
    begin
        if (sParam = 'PASS') then begin
            if (not UnitInfo.bCycleResult) then Result := False; // ?????????? ????. bCycleResult = False ?? ??????.
            exit;
        end;

        if (sParam = 'FAIL') then begin
            if (UnitInfo.bCycleResult) then Result := False;    // ?????????? ????. bCycleResult = True?? ??????.
            exit;
        end;
    end;
    // ???? ?????? or ????????.
    // <OPTION1>,<OPTION2>
    Result := False;
    while (sParam <> '') do begin
        Str := GetTokenTrim(sParam, ',');
        Str := ReplaceTblString(Str);
        if ( Str = 'O' ) then begin
            Result := True;
            exit;
        end;
    end;
end;


//------------------------------------------------------------------------------
// String?? Value?????? ????????.
function StrToValueDef(RdStr : string; defValue : Double) : Double;
begin
    RdStr := UpperCase(Trim(RdStr));

    // HEX Value??????.
    if Copy(RdStr, 1, 2) = '0X' then begin
        RdStr := Copy(RdStr, 3, Length(RdStr)-2);
        Result := HexToIntdef(RdStr, Trunc(defValue));
    end else
    if Copy(RdStr, 1, 1) = '$' then begin
        RdStr := Copy(RdStr, 2, Length(RdStr)-1);
        Result := HexToIntdef(RdStr, Trunc(defValue));
    end else
    // FLOAT????????.
    begin
        Result := StrToFloatDef(RdStr, defValue);
    end;
end;

// '   "SPEC1", "SEPC2"?????? ?????? ??????.
function GetSplitCommaString(var RdStr : String) : String;
var i, Len: Integer;
begin
    Len := Length(RdStr);
    if Len < 1 then begin
        Result := RdStr;
        exit;
    end;

    // '"' ???????? ??????....
    if (RdStr[1] = '"') then
    begin
                  GetToken(RdStr, '"');
        Result := GetToken(RdStr, '"');
        GetToken(RdStr, ',')
    end else begin
        Result := RdStr;
        RdStr := '';
    end;
end;

//------------------------------------------------------------------------------
//???? ????????.
function CheckMeasItem(sSpec, sOpion: String; var sValue : String) : Boolean;
var Str, RdStr : String;
    OptionBuff : TStringList;
    fScale, fOffset, fValue, fMin, fMax, fMin2, fMax2, fMid, fRange : Double;
    i, nValue : Integer;
    bHexValue : Boolean;
    sSpec1 : String;
begin
    Result := False;
    bHexValue := False;
    // Spec?? ?????? ?????? ????????.
    if (sSpec = '') then begin
        Result := True;
        exit;
    end;

    // ???? 'N/A'?????? ?????? ?????? ????????.
    if (sValue = 'N/A') or (sValue = '') then exit;

    try
        //----------------------------------------------------------------------
        // 1) ???????? ???????? ????????
        if (StrToValueDef(sValue, INVALID_VALUE) <> INVALID_VALUE) and
           ((Pos('~', sSpec) > 0) or (Pos('??', sSpec) > 0)) then
        begin

            fValue  := StrToValueDef(sValue, INVALID_VALUE);
            Str := sSpec;
            // ?????? ????????.
            if (sSpec <> '') then
            begin
                if Pos('??', sSpec) > 0 then
                begin
                    fMid   := StrToValueDef(GetTokenTrim(Str, '??'), 0);
                    fRange := StrToValueDef(Trim(Str), 0);
                    fMin := fMid - fRange;
                    fMax := fMid + fRange;

                    Result := (fValue >= fMin) and (fValue <= fMax);

                end else begin
                    fMin := StrToValueDef( GetTokenTrim(Str, '~'), -1E9);
                    fMax := StrToValueDef( GetTokenTrim(Str, ','),  1E9);

                    // 10~20, 30~40
                    // ???????????? ?? ???? ????.  or????..
                    if Pos('~', Str) > 0 then begin
                        fMin2 := StrToValueDef( GetTokenTrim(Str, '~'), -1E9);
                        fMax2 := StrToValueDef( GetTokenTrim(Str, ' '),  1E9);

                        Result := ((fValue >= fMin)  and (fValue <= fMax)) or
                                  ((fValue >= fMin2) and (fValue <= fMax2));
                    end else begin
                        Result := (fValue >= fMin) and (fValue <= fMax);
                    end;
                end;
            end else
                // ?????? ????????.
                Result := True;

        end else
        //----------------------------------------------------------------------
        // 2) ???????????? ?????? ????.
        begin
            // ?????? ???????? ???????????? ','???? ?????? or????????.
            // ???????? ???????????? "Sepc1","Spec2"... ?????????? ????..
            // ????????????????. 2012-01-16  EX) sSpec="00 00 00","FF FF FF"
            Result := False;
            Str := sSpec;
            while (Str <> '') do begin
                sSpec1 := GetSplitCommaString(Str);
                Result := Result or CompareMaskStr(sValue, sSpec1);
            end;
        end;
    finally
    end;
end;

function TFrmMain.ConvertValue(const sValue, sOpion : String) : String;
var fScale, fOffset, fABS, fValue, fTemp : Double;
    nValue : Integer;
    OptionBuff : TStringList;
    sVar : string;
begin
    if (IsFloat(sValue)) and (sOpion <> '') then
    begin
        OptionBuff := TStringList.Create;
        try
            OptionBuff.Text := ReplaceStr(sOpion, ',', CRLF);

            // Scale???? ???????? ??????..
            fScale  := StrToValueDef(OptionBuff.Values['SCALE'],  1);
            fOffset := StrToValueDef(OptionBuff.Values['OFFSET'], 0);
            fABS    := StrToValueDef(OptionBuff.Values['ABS'], 0);

            fTemp :=  StrToValueDef(sValue, INVALID_VALUE);

            if fABS = 1 then
            begin
                if fTemp < 0 then
                    fValue := -(fTemp)
                else
                    fValue := (fTemp);
            end else
            begin
                fValue := (fTemp);
            end;

            fValue  := fValue * fScale + fOffset;

            // ?????? ?????????? ???? ?????? ????.
            nValue := StrToIntDef(OptionBuff.Values['ROUND'], -1);
            if (nValue >= 0) then begin
                fValue := Round2(fValue, nValue);
            end;

            // HEX?? ?????????? ?????? ????..
            nValue := StrToIntDef(OptionBuff.Values['HEX'], 0);
            if (fValue >= 0) and (nValue > 0) then begin
                Result := '$' + IntToHex( Trunc(fValue), nValue);
            end else
                Result := FloatToStr(fValue);

{
            OptionBuff.Text := ReplaceStr(OptStr, ',', CRLF);
            fScale  := StrToFloatDef(OptionBuff.Values['SCALE'],  1);
            fOffset := StrToFloatDef(OptionBuff.Values['OFFSET'], 0);

            fValue := StrToFloatDef(ValStr, INVALID_VALUE) * fScale + fOffset;

            //??????????..
            if OptionBuff.Values['ROUND'] = '1' then
                fValue := Round(fValue);

            ValStr := FloatToStr(fValue);   }
        finally
            OptionBuff.Free;
        end;
    end else
        Result := sValue;
end;

function TFrmMain.RunStep(StepIdx : Integer) : Boolean;
var
    TestStep : TTestStep;
    i, j, MeasCount : Integer;
    fMin, fMax, fMid, fRange: Double;
    fMin1, fMax1, fMin2, fMax2, fValue, fScale, fOffset, fABS : Double;
    IsValue : Boolean;


    nTestCount, TestCount : Integer;
    Str, RdStr, ItemStr, ParamStr, OptStr, CpStr, ValStr, UnitStr, sValue, sResultStr,
    sMin, sMax, RangeStr : String;

    ResourceItem : TResourceItem;
    ItemResult : Boolean;

    sCpDataFile, sResult: string;
    sBarcode, sVersion: string;
    sTempTag, sMode: string;
    fTime, fStartTime, fSamplingTime : Double;

    nStartRow : Integer;
    bSpecOk: boolean;
    OptionBuff : TStringList;

    bContinueMode, bReTestMode : Boolean;
    nReTest, nReTestCount : Integer;
    sTemp : String;
    bNgSTEPCHECK : boolean;

    fGCheckTime : double;
    fdebugfilename : string;
begin
    Result := False;
    fStartTime := GetTickCountEX;
    TestStep := CurrProject.GetStep(StepIdx);

    // ??????
    if not IsStepEnabled(TestStep) then begin
        UnitInfo.TestResult.Add(TestStep.StepName + ';;;;;SKIP;');
        Result := True;
        exit;
    end;

    DispMessage(TestStep.StepName);

    if (FrmData <> nil) then
        FrmData.Lb_StepName.Caption := TestStep.StepName;

    //--------------------------------------------------------------------------
    // ?????? ?????? ????????.
    nTimeOut  := 0;
    nSampling := 10;
    nRetry    := 0;
    sMessage  := TestStep.StepName;
    bContinueMode := False;
    bReTestMode := False;


    // Option. ----------------------------------------------------------
    // ?????????? ????????.
    for i := 0 to TestStep.OptionList.Count-1 do
    begin
        RdStr    := TestStep.OptionList[i];
        ItemStr  := GetTokenTrim(RdStr, ';');
        ParamStr := GetTokenTrim(RdStr, ';');

        if (ItemStr = 'TIMEOUT' ) then
            nTimeOut  := (Round(StrToFloatDef( ParamStr, 0)) * 1000)
        else
        if (ItemStr = 'SAMPLING') then
            nSampling := Round(StrToFloatDef( ParamStr, 0) * 1000)
        else
        if (ItemStr = 'RETRY')    then
            nRetry    := StrToIntDef( ParamStr, 0)
        else
        if (ItemStr = 'MESSAGE')  then
            sMessage  := ParamStr
        else
        if (ItemStr = 'CONTINUE') then begin
            bContinueMode := True;
        end else
        if (ItemStr = 'RETEST') then begin
            bReTestMode := True;
            nReTestCount := StrToIntDef( ParamStr, 0);
        end;
    end;

    //if FrmMessage <> nil then
        //FrmMessage.Label_Msg.Caption := sMessage;


    // Display Check List  -----------------------------------------------------
    // ?????????? ????????????.
    bSpecOk := False;
    nStartRow := UnitInfo.TestResult.Count + 1;

    MeasCount := 0;
    for i := 0 to TestStep.CheckList.Count - 1 do
    begin
        // 'F08_B_ALARM_RLY(V);11~14;V;;F;'
        RdStr      := TestStep.CheckList[i];
        ItemStr    := ReplaceTblString(GetToken(RdStr, ';'));

        if (ItemStr <> '') then
        begin
            ParamStr   := ReplaceTblString(GetToken(RdStr, ';'));
            UnitStr    := GetToken(RdStr, ';');
            OptStr     := GetToken(RdStr, ';');
            CpStr      := GetToken(RdStr, ';');
            if i = 0 then RdStr := TestStep.StepName
                     else RdStr := '';
            RdStr := Format('%s;%s;%s;;', [RdStr, ItemStr, ParamStr]);

            bSpecOk := True;
            UnitInfo.TestResult.Add(RdStr);
            Inc(MeasCount);
        end;
    end;

    if MeasCount = 0 then
        UnitInfo.TestResult.Add(TestStep.StepName + ';;;;;OK;');

    if FrmData <> nil then
    begin
        FrmData.DisplayData();

        if (TestStep.CheckList.Count > 0) and (bSpecOk) then
        begin
            FrmData.Grid.SelectRange(0, FrmData.Grid.ColCount-1, nStartRow, nStartRow + TestStep.CheckList.Count-1 );
        end;
    end;

    // Output Option. ----------------------------------------------------------
    // ?????????? ???????? ????????.
{    if (FrmGraph <> nil) then
    begin
        FrmGraph.ClearGraph;
        for i:=0 to TestStep.OutputList.Count-1 do
        begin
            RdStr    := TestStep.OutputList[i];
            ItemStr  := GetToken(RdStr, ';');
            ParamStr := GetToken(RdStr, ';');

            ResourceItem := CurrProject.GetResource(ITEM_ALL, ItemStr);
            if (ResourceItem.ResName <> '') then
            begin
                Str  := ParamStr;
                fMin := StrToFloatDef(GetToken(Str, '~'), 0);
                fMax := StrToFloatDef(GetToken(Str, ' '), 20);
                FrmGraph.AddChannel(ResourceItem, fMin, fMax, fMin, fMax);
            end;
        end;
    end;
}

    // Running Test. -----------------------------------------------------------
    // ???????? ?????? ?????? ????????.
    for nTestCount := 0 to nRetry do
    begin
{
        if FrmStart.Check_ResetStart.Checked then
            ResetIO();

        // Wait Step Delay
        if (not gbManualMode) then
        begin
            nTime := getTickCount();
            while (getTickCount()-  nTime < FrmStart.Edit_StepDelay.Value * 1000) do
            begin
                if not gbRunning then exit;
                Application.ProcessMessages;
            end;
        end;
}
        // 1. ???????? ????.
        giStepIndex := StepIdx;
        FrmBuff.Clear;

        RunInputCondition(TestStep.StepName, TestStep.InputList1);

        //  2. ?????? ?????????? ?????????? ????????.
        fGCheckTime := GetTickCountEx;
        while (FrmGraph <> nil) do
        begin
            if ((GetTickCountEx - fGCheckTime) < (3 *1000)) then
            begin
                if ((not FrmGraph.bRunning) or (not gbRunning)) then
                begin
                    FrmGraph.BtnStopClick(nil);
                    break;
                end;
                Application.ProcessMessages;
                Sleep(1);
            end else begin
                AddLog(Format('[GRAPH ERROR] (Time : %f) (graphrunning : %s) (gbrunning : %s)',[((GetTickCountEx - fGCheckTime)/1000)
                                                                                                 , IfThen((FrmGraph.bRunning),'TRUE','FALSE')
                                                                                                 , IfThen((gbRunning),'TRUE','FALSE') ]));
                FrmGraph.BtnStopClick(nil);
                break;
            end;
        end;
//2016-04-15

        if not gbRunning then
            exit;

        //-------------------------------------------------
        // 3. ?????????? ????????. nTimeOut ???????? Loop?? ????. ?????????? ????.  gbRunning := False;
        fTime := GetTickCountEX;
        repeat
            Led_PlcReset.LedOn := (FrmMelsecQ.ReadCommand(sPLCReset) = 1);
            if (Led_PlcReset.LedOn) then
            begin
                gbReset := True;
                AddLog(Format('PLC RESET ON : (%s)', [sPLCReset]));
                BtnStopClick(nil);
                btnResetClick(nil);
                FrmMelsecQ.SendCommand(sPLCReset, 0);
                gbReset := False;
            end;

            if not gbRunning then break;

            StatusBar.Panels[0].Text := Format('* TIMEOUT : %3.1f / %3.1f', [(GetTickCountEX() - fTime)/1000, nTimeOut/1000]);

            UnitInfo.StepResult.Clear;
            Result := True;
            for i := 0 to TestStep.CheckList.Count - 1 do
            begin
                ItemResult := False;
                // F08_B_ALARM_RLY(V);11~14;V;;F;
                RdStr      := TestStep.CheckList[i];
                ItemStr    := ReplaceTblString(GetToken(RdStr, ';'));
                ParamStr   := ReplaceTblString(GetToken(RdStr, ';'));
                UnitStr    := GetToken(RdStr, ';');
                OptStr     := ReplaceTblString(GetToken(RdStr, ';'));
                CpStr      := GetToken(RdStr, ';');

                if ItemStr = '' then continue;

                // 1) ???? ????????.
                // ?????? ???????? ???? ????????.
                ResourceItem := CurrProject.GetResource(0, ItemStr);
                if (ResourceItem.ResName <> '') then // (OptStr = '');
                begin
                    ResourceItem.tagStr := ReplaceTblString(ResourceItem.tagStr);
                    ValStr := ReadResName(ResourceItem, '');
                    ValStr := ConvertValue(ValStr, OptStr);
                end
                // Res?????? ????????. Option?????? ???? ???? ????????.
                else begin
                    ValStr := CheckResult(OptStr);
                end;

                // 2. ???? ????????.
                ItemResult := CheckMeasItem(ParamStr, OptStr, ValStr);
                vl_Variable.Values[ItemStr] := ValStr;   // ???????? ???? ???? ??????.

                // ???????? ????.
                if i = 0 then RdStr := TestStep.StepName
                         else RdStr := '';
                RdStr := Format('%s;%s;%s;%s;%s;%s;', [CpStr, RdStr, ItemStr, ParamStr, ValStr, UnitStr]);

                if ItemResult then
                    sResultStr := 'OK'
                else begin
                    sResultStr := 'NG';
                    Result := False;
                end;
                RdStr := RdStr + sResultStr + ';';

                if (FrmData <> nil) then
                    FrmData.Grid.Cells[5, nStartRow + i] := sResultStr;
                 UnitInfo.StepResult.Add(RdStr);

                // Grid?? ?????? ???????? ????????.
                CpStr := GetToKen(RdStr, ';');
                UnitInfo.TestResult[(nStartRow-1) + i] := RdStr;
                if (FrmData <> nil) then
                begin
                    if (nStartRow + i) < FrmData.Grid.RowCount then
                    begin
                        FrmData.Grid.Cells[4, nStartRow + i] := Trim(ValStr + ' ' + UnitStr);
                    end;
                end;
            end;

            // 1. ?????????? ???? ???????? ??????. (Continue Mode?? ????????).
            // 2. Continue Mode?????????? ???????? ??????.
            if ((not bContinueMode) and (Result)) or
               ((not Result) and (bContinueMode)) then break;

            // SAMPLING TIME ????..
            fSamplingTime := GetTickCountEX;
            while (GetTickCountEX - fSamplingTime < nSampling) do begin
                if not gbRunning then
                    exit;
                Application.ProcessMessages;
                Sleep(1);
            end;
            // nSampling
        until ( (GetTickCountEx - fTime) >= nTimeOut); // nTimeOut ???????? Loop?? ????.

        // 4. ?????? ????????.
        RunInputCondition(TestStep.StepName, TestStep.InputList2);

        // ReTest??????
        if ((    Result) and (not bReTestMode)) or
           ((not Result) and (    bReTestMode))  then break;

        if (TestStep.OptionList.Count-1) <> i then
            Application.ProcessMessages;
    end;


    // 5. ???????? ???????? ????????.
    for j := 0 to UnitInfo.StepResult.Count-1 do
    begin
        // T;STEPNAME;ITEMNAME;SPEC;VALUE;UNIT;RESULT;  <- ???? ????..
        RdStr := UnitInfo.StepResult[j];
        //=================================================
        CpStr      := GetToKen(RdStr, ';');
                      GetToKen(RdStr, ';');  // StepName Skip..

        ItemStr    := ReplaceTblString(GetToken(RdStr, ';'));
        // Item ?????? ?????? SKIP.
        if (ItemStr <> '') then
        begin
            ParamStr   := ReplaceTblString(GetToken(RdStr, ';'));
            sValue     := GetToken(RdStr, ';');
            UnitStr    := GetToken(RdStr, ';');
            sResult    := GetToken(RdStr, ';');
        end else
            continue;

        if (sResult = 'OK') and (CpStr = 'T') and FrmTestOption.cbCPuse.Checked then // CP checked and Result is good
        begin
            Str     := ParamStr;
            sMin    := GetToken(Str, '~');
            sMax    := Str;
            //
            fMin    := StrToFloatDef(sMin, -9999);
            fMax    := StrToFloatDef(GetToken(sMax, ' '), 9999);
            //
            Str     := sValue;
            fValue  := StrToFloatDef(GetToken(Str, ' '),  9999);
            sResult := GetToKen(RdStr, ';');

            sCpDataFile := Format('%sCP_DATA\%s\[%s][%s].CP', [GetAppDir('DATA'),
                                                               gModelCode,
                                                               ItemStr,
                                                               TestStep.StepName ]);
            FrmCalcCP.WriteDataCP(sCpDataFile,
                                  Format('%s %f %f', [ItemStr, fMin, fMax]),
                                  Format('%f', [fValue]));
        end else

        // NG ???? ????
        if (sResult = 'NG') then begin
            AddLog(Format('[%s] %s %s (%s) %s', [TestStep.StepName, ItemStr, ParamStr, sValue, sResult ]));
            FrmUDPComm.SendUDP(Format('FAILDATA:%d:1:%s;%s;%s;%s;%s', [nTesterNo, TestStep.StepName, ItemStr, ParamStr, sValue, sResult]));
        end;
        if (FrmMasterMode.gbMasterBCR) and FrmMasterMode.cbStepCheck.Checked then
        begin
            if (sResult = 'NG') then
            begin
                for i := 0 to FrmMasterMode.StepList.Count-1 do
                begin
                    if FrmMasterMode.StepList.Strings[i] = TestStep.StepName then
                    begin
                       FrmMasterMode.StepList.Strings[i] := FrmMasterMode.StepList.Strings[i] + Format('[%s]',[sResult]);
                    end;
                end;
                bNgSTEPCHECK := False;
                for i := 0 to FrmMasterMode.NGList.Count-1 do
                begin
                    sTemp := FrmMasterMode.NGList.Strings[i];
                    if Pos(Format('[%s]',[sResult]), sTemp) > 0 then
                    begin
                        sTemp := ReplaceStr(sTemp,Format('[%s]',[sResult]),'');
                    end;
                    if sTemp = TestStep.StepName then
                    begin
                       FrmMasterMode.NGList.Strings[i] := FrmMasterMode.NGList.Strings[i] + Format('[%s]',[sResult]);
                       bNgSTEPCHECK := True;
                    end;
                end;

                if (not bNgSTEPCHECK) then
                begin

                    FrmMasterMode.NGList.Add(TestStep.StepName + Format('[%s]',[sResult]));
                end;
            end;
        end;

    end;
    StatusBar.Panels[0].Text := '';



    //if (FrmMessage <> nil) then
        //FrmMessage.Label_Msg.Caption := '';

end;

// ?????? ????????. ?????? ???????? ????????.
function TFrmMain.TestRun() : Boolean;
var
    StepIdx : Integer;
    TestStep : TTestStep;
    sTemp, sPalletNo, sProductNo, Str, sResult, sOption : string;
    nCommand: integer;
    nCount, nRetryCount: integer;
    aResourceItem: TResourceItem;

    nHour, nMin, nSec, nmSec : Word;

    nTestStepCount : Integer;
    bTemp, bAResult : Boolean;

begin
    Result := False;
    nTestStepCount := 0;

    // ?????????? ???? ??????....
    gsSaveDir := GetAppDir('DATA') +
                 FormatDateTime('YYYY-MM', Now) + '\' +
                 FormatDateTime('MM-DD',   Now) + '\' + gModelCode + '\';  // 2010-09-06 jsi.

    if gbRunning then
        UnitInfo.bTotalResult := False;

    while gbRunning do
    begin
        // ???? ???????? Reset.
        ResetIO;
        SetUnitState(ts_Running);
        vl_Variable.Strings.Values['SWEEP_VOLTAGE'] := '';
        UnitInfo.bCycleResult := True;

        // ???? ???????? ????????.
        if FrmData <> nil then FrmData.ClearData();

        for StepIdx := 0 to CurrProject.GetStepCount - 1 do
        begin
            Led_PlcReset.LedOn := (FrmMelsecQ.ReadCommand(sPLCReset) = 1);
            if (Led_PlcReset.LedOn) or gbReset then
            begin
                gbReset := True;
                AddLog(Format('PLC RESET ON : (%s)', [sPLCReset]));
                BtnStopClick(nil);
                btnResetClick(nil);
                FrmMelsecQ.SendCommand(sPLCReset, 0);
                gbReset := False;
                break;
            end;

            TestStep := CurrProject.GetStep(StepIdx);
            // STEP SKIP??????

            if (not TestStep.Enabled) then continue;

            // Test Step.
            TreeView.Selected := FindCurrTreeStep(StepIdx);

            try
                // ??????????.
                if (FrmData <> nil) then begin
                    FrmData.Gauge.Progress := Round((StepIdx / CurrProject.GetStepCount ) * 100);
                    FrmUDPComm.SendUDP(Format('PROGRESS:%d:1:%d', [nTesterNo, FrmData.Gauge.Progress ]));
                end;

                UnitInfo.bStepResult := False;
                UnitInfo.bStepResult := RunStep(StepIdx);

                if (nTestStepCount = 0) and (UnitInfo.bStepResult) then
                    UnitInfo.bTotalResult := True;

                inc(nTestStepCount);
            except
                AddLog(Format('TFrmMain.TestRun() RunStep:%s', [TestStep.StepName]));
            end;

            // ?????? ????.
            if not gbRunning then break;

            if not UnitInfo.bStepResult then
            begin
                UnitInfo.bTotalResult := False;
                UnitInfo.bCycleResult := False;
            end;

            {
            // ???????? ????????.
            if (FrmTestOption.Radio_DataSave.ItemIndex <> SAVE_NONE) then
            begin
                SaveGraph;
            end;
            }
            if (FrmTestOption.chkNgStop.Checked) and (not UnitInfo.bStepResult) then
            begin
                Break;
            end;
        end;

        IF (FrmData.Gauge.Progress > 94) THEN FrmData.Gauge.Progress := 100;
        FrmUDPComm.SendUDP(Format('PROGRESS:%d:1:%d', [nTesterNo, FrmData.Gauge.Progress ]));


        // ?????????? ???????? ????????.
        StopTime := Now();
        SaveTestInfo();

        // ?????????? ????.
        case FrmTestOption.Radio_DataSave.ItemIndex of
            SAVE_ALL  : SaveTestData;
            SAVE_GOOD : if (UnitInfo.bCycleResult)     then SaveTestData;
            SAVE_FAIL : if (not UnitInfo.bCycleResult) then SaveTestData;
            SAVE_NONE : break;
        end;

        // ???????? ?????? ????.
        Inc(TestCount);
        LCD_Cycle.Value := IntToStr(TestCount);
        if (FrmTestOption.CheckBox_TestCount.Checked) and
           (TestCount >= FrmTestOption.Edit_TestCount.Value) then
        begin
            Result := True;
            break;
        end;

       if (UnitInfo.bTotalResult) then
        begin
            sResult := 'PASS';
            nReFailCount := 0;
            FrmMasterMode.spnNGcounter.Value  := nReFailCount;
        end
        else begin
            sResult := 'FAIL';
            nReFailCount := StrToIntDef(LbFailCount.Caption, 0);
            nReFailCount := nReFailCount + 1;
            FrmMasterMode.spnNGcounter.Value := nReFailCount;
        end;

    end;



    //===========================================================
    // ?????????? ???????? ????????.
    if gbRunning then
    begin
        Str := FormatDateTime('YYYYMMDDHHNNSS', Now);
        if UnitInfo.bTotalResult then sResult := 'PASS' else sResult := 'FAIL';

        bAResult := UnitInfo.bTotalResult;
        if FrmMasterAlret.Showing and (FrmMasterAlret <> nil) then
            FrmMasterMode.FindMasterBarcode(lb_Barcode.Caption,2, bAResult,sTemp,sTemp,bTemp);
        //----------------------
        if FrmTestOption.Cb_UseITAC.Checked and (not BMASTERMODE) then
        begin

            if UpLoadItac(UnitInfo.bTotalResult) then
            begin
                if UnitInfo.bTotalResult then AddLog( Lb_Barcode.Caption + ' iTac PASS info Upload OK' )
                                         else AddLog( Lb_Barcode.Caption + ' iTac FAIL info Upload OK' );
            end else
            begin
                AddLog( Lb_Barcode.Caption + ' iTac info not Uploading' );
            end;
        end;
    end;
end;


function FindBlockStr(Param : String; FirstChar, SecondChar : Char; var Pos1, Pos2 : Integer) : String;
var i : Integer;
begin
    Result := '';

    Pos1 := 0;
    Pos2 := 0;
    for i:= 1 to Length(Param) do begin
        if (Pos1 = 0) and (Param[i] = FirstChar) then begin
            Pos1 := i;
        end else

        if (Pos1 > 0) and (Param[i] = SecondChar) then begin
            Pos2 := i;
            Result := Copy(Param, Pos1+1, Pos2-Pos1-1);
            break;
        end;
    end;
end;

// SPEC ?????? CALC ?????? ???????? ????
function TFrmMain.ReplaceCalcSpec(Param : String) : String;
begin
    // CALC: ?? ???????? ????
    if Pos('CALC:', Param) > 0 then
    begin
        Result := '';
        while Param <> '' do
        begin
            if Result = '' then
            Result   := CheckResult(GetToKen(Param,'~'))
            else
            Result   := Result +'~'+CheckResult(GetToKen(Param,'~'))
        end;
    end
    else
    begin
        Result   := ReplaceTblString(Param);
    end;

end;

// ???????? ?????? ?????? ???? ?????? ????.
function TFrmMain.ReplaceTblString(Param : String) : String;
var fValue : Double;
    VarStr, ValStr : String;
    Pos1, Pos2 : Integer;
    Inif : TIniFile;
begin
    Result := Param;
    if (Param = '') then exit;

    try
        // ???????? ?????? ????????.
        while (True) do begin
            VarStr := FindBlockStr(Param, '%', '%', Pos1, Pos2);
            if VarStr = '' then break;

            ValStr := vl_Variable.Values[VarStr];
            if ValStr = '' then  ValStr := 'N/A';
            Param := ReplaceStr(Param, '%' + VarStr + '%', ValStr);
        end;

        // Field???? ?????? ????????.
        while (True) do begin
            VarStr := FindBlockStr(Param, '<', '>', Pos1, Pos2);
            if VarStr = '' then break;

            ValStr := vl_Table.Values[VarStr];
            if ValStr = '' then ValStr := 'N/A';
            Param := ReplaceStr(Param, '<' + VarStr + '>', ValStr);
        end;

        // ???????????? ???? ?????? ????????.
        while (True) do begin
            VarStr := FindBlockStr(Param, '&', '&', Pos1, Pos2);
            if VarStr = '' then break;

            ValStr := memoMeta.Lines.Values[VarStr];
            if ValStr = '' then ValStr := 'N/A';
            Param := ReplaceStr(Param, '&' + VarStr + '&', ValStr);
        end;

        // LOCAL ???????? ?????? CONFIG.INI???? ???? ????????.  2011.12.29
        while (True) do begin
            VarStr := FindBlockStr(Param, '@', '@', Pos1, Pos2);
            if VarStr = '' then break;

            Inif := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
            try
                ValStr := IniF.ReadString('LOCAL_CONST', VarStr, 'N/A');
                if ValStr = '' then ValStr := 'N/A';
                Param := ReplaceStr(Param, '@' + VarStr + '@', ValStr);
            finally
                IniF.Free;
            end;
        end;
        
        Result := Param;
    except
    end;
end;

function TFrmMain.CheckResult(Param : String) : String;
var sCmd, sTemp : String;
    fValue : Double;
begin
    Result := 'N/A';
    sCmd := GetToken(Param, ':');

    // ????????..
    if (sCmd = 'CALC') then
    begin
        sTemp := Param;
        Param := ReplaceTblString(Param);
        try
            fValue := ScieCalc.CalcExpression(Trim(Param));
            Result := FormatFloat('0.##', fValue);
        except
        end;
    end;
    if (sCmd = 'VAR') then begin
        Result := ReplaceTblString(Param);
    end;


    if (sCmd = 'SKIP') then begin
        Result := 'SKIP';
    end;
    
end;

procedure TFrmMain.LoadTestInfo();
var INI : TINIFile;
begin
    INI := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        StartTime := INI.ReadFloat('TESTINFO', 'STARTTIME', Now());
        StopTime  := INI.ReadFloat('TESTINFO', 'STOPTIME', Now());
        TestCount := INI.ReadInteger('TESTINFO', 'TestCount', 0);
    finally
        INI.Free;
    end;
end;

procedure TFrmMain.TreeViewResStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var Order, nPort : Integer;
    Str, ResName, RdStr : String;
    aCAN_Signal : TCAN_Signal;
begin
    // ???????????? Drag????????.
    gDragResourceItem.ResName := '';
    if TreeViewRes.Selected = nil then exit;

    // ???? ??????????.
    if (TreeViewRes.Selected.ImageIndex = IMAGE_DOC) then
    begin
        ResName := TreeViewRes.Selected.Text;
        gDragResourceItem := CurrProject.GetResource(ITEM_ALL, ResName);
    end else

    // LEVEL?? 3?????????? CAN DB???? ??????.
    if (TreeViewRes.Selected.ImageIndex = IMAGE_MESSAGE) then
    begin
        RdStr   := TreeViewRes.Selected.Text;
        ResName := GetTokenTrim(RdStr, ':');

        // CAN1;
        Str := TreeViewRes.Selected.Parent.Parent.Text;
        GetToken(Str, 'CAN');
        nPort := StrToIntDef(Str, 1);

        // CANMSG : [0xID];
        aCAN_Signal := CurrProject.CanDB[nPort].FindCanSignal(ResName);
        if aCAN_Signal <> nil then
        begin
            gDragResourceItem.ResName   := aCAN_Signal.SignalName;
            gDragResourceItem.ResType   := res_CAN;
            gDragResourceItem.IOName    := Format('CAN_%2d', [nPort]);
            gDragResourceItem.tagStr    := Format('SET:%X=%d,%d:%s,%s',
                [ aCAN_Signal.CanID, aCAN_Signal.StartBit, aCAN_Signal.BitLen,
                  FormatFloat('0.###', aCAN_Signal.fScale), FormatFloat('0.###', aCAN_Signal.fOffset) ]);
            gDragResourceItem.GroupName := aCAN_Signal.SignalName;
        end;
    end;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    CanClose := not gbRunning;
end;

procedure TFrmMain.MenuViewProjectClick(Sender: TObject);
begin
    PanelProject.Visible := not PanelProject.Visible;
end;

//------------------------------------------------------------------------------
// Layout?????? ????????.
function TFrmMain.LoadFromLayoutFile(FileName : String) : Boolean;
type
    TReadMode = ( rmNone, rmInfo, rmWindow );

var i, Idx, nPort : Integer;
    Form : TForm;
    sItemName, sParam, sClassName, sCaption, Str, RdStr : String;
    StrList : TStringList;
    ReadMode : TReadMode;
    aCAN_Message : TCAN_Message;
begin
    Result := False;
    if (not FileExists(FileName)) then exit;

    // ?????????? ???????? ?????? ?????? Panel?? ??????.
    Panel_Back.Align   := alClient;
    Panel_Back.Visible := True;

    // Client???? ???? ????????.
    for i:= MDIChildCount-1 downto 0 do
    begin
        Form := MDIChildren[i];
        Form.Close;
    end;
    //Application.ProcessMessages; // ?????? ????????.

    // ???? ???????? ????????.
    StrList := TStringList.Create;
    try
        StrList.LoadFromFile(FileName);

        ReadMode := rmNone;
        for i:= 0 to StrList.Count-1 do begin
            RdStr := Trim(StrList[i]);
            if RdStr = '' then continue;

            if (RdStr[1] = '#') then begin
                if (RdStr  = '#TestInfo')   then ReadMode := rmInfo;
                if (RdStr  = '#WindowList') then ReadMode := rmWindow;
                continue;
            end;

            // ???????? ????.
            case ReadMode of
                //--------------------------------------------------------------
                rmInfo : begin
                    sItemName := GetTokenTrim(RdStr, '=');
                    sParam    := GetTokenTrim(RdStr, ';');

                    if (sItemName = 'ProjectFile') then begin
                        gProjectFileName := sParam;
                        sParam := gBaseDir + 'PROJECT\' + gProjectFileName;
                        if FileExists(sParam) then begin
                            CurrProject.LoadFromFile(sParam)
                        end else
                            gProjectFileName := '';
                    end else

                    if (sItemName = 'ProjectView') then begin
                        PanelProject.Visible := (sParam = '1');
                    end else

                    if (sItemName = 'CanDBFile1') then begin
                        gCanDBFile[1] := sParam;
                        CurrProject.CanDB[1].LoadFromFile(gBaseDir + 'DBC\' + gCanDBFile[1]);
                    end;

                    if (sItemName = 'CanDBFile2') then begin
                        gCanDBFile[2] := sParam;
                        CurrProject.CanDB[2].LoadFromFile(gBaseDir + 'DBC\' + gCanDBFile[2]);
                    end;
                end;

                //--------------------------------------------------------------
                // Form ??????????.
                rmWindow : begin
                    sClassName := GetToken(RdStr, ';');    // Class Name;
                    sCaption   := GetToken(RdStr, ';');    // Window Caption.

                    Form := nil;
                    // CAN FORM ????.
                    if (sClassName = 'TFrmCANMonitor') then
                    begin
                        // sCaption = 'CAN1:dbfile.dbc'
                        Str := GetToken(sCaption, ':');
                        if Str = 'CAN1' then nPort := 1 else
                        if Str = 'CAN2' then nPort := 2 else exit;

                        Idx := StrToIntDef(  Str[Length(Str)], 1);
                        Str := gBaseDir + 'DBC' + '\' + sCaption;

                        Form := TFrmCANMonitor.Create(Self, Idx, nil, gFrmCANCom[Idx]);
                        TFrmCANMonitor(Form).OpenDBCFile( gBaseDir + 'DBC\' + gCanDBFile[Idx] );
                        Form.Caption := Form.Caption + ':' + gCanDBFile[Idx];
                    end;

                    // ?????????? ????.
                    if (sClassName = 'TFrmDesigner') then
                    begin
                        Form := TFrmDesigner.Create(Self);
                        sCaption := gBaseDir + 'SIMULATOR\' + sCaption;
                        TFrmDesigner(Form).OpenFile(sCaption);
                        TFrmDesigner(Form).actStart.OnExecute(nil);
                    end;

                    if (sClassName = 'TFrmGraph') then begin
                        MenuGraphClick(nil);
                        Form := FrmGraph;

                        sCaption := gBaseDir + 'GRAPH\' + sCaption;
                        {
                        TFrmGraph(Form).LoadFromFile(sCaption);
                        TFrmGraph(Form).BtnClearClick(nil);
                        }
                    end;

                    if (sClassName = 'TFrmLog') then begin
                        if FrmLog = nil then begin
                            FrmLog := TFrmLog.Create(Self);
                            Form := FrmLog;
                        end;
                    end;


                    if (sClassName = 'TFrmData') then begin
                        MenuReportClick(nil);
                        Form := FrmData;
                    end;

                    if (sClassName = 'TFrmCanMsg') then
                    begin
{
                        GetToken(sCaption, '[0x');
                        sCaption := GetToken(sCaption, ']');

                        CanFrame := CurrProject.CanDB[nPort].FindCanFrame(HexToIntDef(sCaption, -1));
                        Form := CreateCanFrameWindow(CanFrame);
}
                    end;

                    if (sClassName = 'TFrmMessage') then
                    begin
                        MenuUserMsgClick(nil);
                        Form := FrmMessage;
                    end;

                    if (Form <> nil) then begin
                        Form.Left    := StrToIntDef( GetToken(RdStr, ','), 0);
                        Form.Top     := StrToIntDef( GetToken(RdStr, ','), 0);
                        Form.Width   := StrToIntDef( GetToken(RdStr, ','), 640);
                        Form.Height  := StrToIntDef( GetToken(RdStr, ','), 480);
                    end;
                end;
                //--------------------------------------------------------------
            end;
        end;
    finally
        StrList.Free;
    end;

    // ???????? ?????? Open????.
    gLayoutFile := ExtractFileName(FileName);

    Panel_Back.Visible := False;

    ViewTestInfo;
    StatusBar.Panels[4].Text := ExtractFileName(gLayoutFile);
end;

//------------------------------------------------------------------------------
// ???????? ?????? ????????.
function TFrmMain.SaveToLayoutFile(FileName : String) : Boolean;
var i : Integer;
    Form : TForm;
    WtStr : String;
    StrList : TStringList;
const
    TAB_CHAR = '  ';
begin
    StrList := TStringList.Create;
    // ?????? ???????? ???? ??????.
    if FileExists(FileName) then
        try  DeleteFile(FileName); except end;

    // ???? OPEN?? Window?????? ????????.
    try
        // ???????? ???? ????.
        StrList.Add('#TestInfo');
        StrList.Add(TAB_CHAR + Format('ProjectFile=%s', [gProjectFileName]));
        StrList.Add(TAB_CHAR + Format('CanDBFile1=%s',  [gCanDBFile[1]]));
        StrList.Add(TAB_CHAR + Format('CanDBFile2=%s',  [gCanDBFile[2]]));
        StrList.Add(TAB_CHAR + Format('ProjectView=%d', [Ord(PanelProject.Visible)]));
        StrList.Add('');

        StrList.Add('#WindowList');
        for i:= 0 to MDIChildCount-1 do
        begin
            Form := MDIChildren[i];
            WtStr := Format(TAB_CHAR + '%s;%s;%d,%d,%d,%d',
                [ Form.ClassName, Form.Caption, Form.Left, Form.Top, Form.Width, Form.Height]);
            StrList.Add(WtStr);
        end;
        StrList.SaveToFile(FileName);
    finally
        StrList.Free;
    end;

    // ???????? ?????? ????????.
    gBaseDir    := ExtractFilePath(FileName);
    gLayoutFile := ExtractFileName(FileName);
    StatusBar.Panels[4].Text := ExtractFileName(gLayoutFile);

    MessageBox(ExtractFileName(FileName) + ' ?????? ??????????????.', '????????', MB_OK or MB_ICONINFORMATION);
end;

procedure TFrmMain.N5Click(Sender: TObject);
begin
    Cascade;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
    TileMode := tbHorizontal;
    Tile;
end;

procedure TFrmMain.N8Click(Sender: TObject);
begin
    TileMode := tbVertical;
    Tile;
end;

function TFrmMain.FindWindowByCaption(sCaption : String): TForm;
var i : Integer;
begin
    Result := nil;
    for i:= 0 to MDIChildCount-1 do
    begin
        if (MDIChildren[i].Caption = sCaption) then
        begin
            Result := MDIChildren[i];
            break;
        end;
    end;
end;

procedure TFrmMain.MenuReportClick(Sender: TObject);
var i : Integer;
begin
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if (Application.MainForm.MDIChildren[i].ClassName = 'TFrmData') then
        begin
            Application.MainForm.MDIChildren[i].BringToFront;
            exit;
        end;
    end;

    FrmData := TFrmData.Create(self);
    FrmData.Show;
end;

procedure TFrmMain.MenuDesignModeClick(Sender: TObject);
var FileName : String;
begin
    // ?????????? ?? Load????.
    FileName := gBaseDir + gLayoutFile;
    if FileExists(FileName) then
        LoadFromLayoutFile(FileName);
end;

procedure TFrmMain.N14Click(Sender: TObject);
begin
    ResetIO;
end;

procedure TFrmMain.KLine1Click(Sender: TObject);
begin
    FrmKMIComm.Show;
end;

procedure TFrmMain.N17Click(Sender: TObject);
begin
    if gbRunning then exit;
    if (TreeView.Selected = nil) or (TreeView.Selected.Level <> 0) then exit;

    if FrmStepEdit.Execute(TreeView.Selected.Text) then
    begin
        CurrProject.LoadFromFile(gBaseDir + 'PROJECT\' + gProjectFileName);
        ViewTestInfo;
    end;
end;

procedure TFrmMain.N18Click(Sender: TObject);
var i : Integer;
    TestStep : TTestStep;
    Node : TTreeNode;
begin
    if gbRunning then exit;

    Node := TreeView.Selected;
    if (Node = nil) then exit;

    if (IDOK <> MessageBox(Node.Text + ' ?????? ??????????.',
        '????????', MB_OKCANCEL or MB_ICONQUESTION)) then exit;

    for i := 0 to CurrProject.GetStepCount-1 do
    begin
        TestStep := CurrProject.GetStep(i);
        if (TestStep <> nil)  and
           (TestStep.StepName = Node.Text) then
        begin
            CurrProject.DeleteStep(i);
            FrmMain.ViewTestInfo;
            break;
        end;
    end;
end;

procedure TFrmMain.MenuUserMsgClick(Sender: TObject);
var
    i : Integer;
begin
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
        if (Application.MainForm.MDIChildren[i].ClassName = 'TFrmMessage') then
        begin
            Application.MainForm.MDIChildren[i].BringToFront;
            exit;
        end;
    end;

    FrmMessage := TFrmMessage.Create(Self);
    FrmMessage.Show;
end;

procedure TFrmMain.MenuAboutClick(Sender: TObject);
begin
    FrmAbout.Show;
end;

procedure TFrmMain.BtnStrartClick(Sender: TObject);
var
    bInit : Boolean;
    sDate : string;
    nTempCount : integer;
    fTempLowSpec, fTempMaxSpec, fTemperature : Double;
    i : integer;
    sTempSpec, sTempLowSpec, sTempMaxSpec : string;
    aResourceItem : TResourceItem;
    sBarcode : String;
    bBarcode : Boolean;
    str : string;
    bAttribute : Boolean;
    sAttribute : String;
    biTacRet, bTempCheck : boolean;
    bMsterModelChangeResult : Boolean;
    sPartNum : String;
    sSetfile : string;
    sTemp    : string;

    Ini : TIniFile;
    nBarcodeIdx : integer;
    sPLCModel, sSetPLCModel2, sSetPLCModel3 : string;
begin
    //BARCODE2_PLCMODEL=4,5,6
    Ini          := TIniFile.Create(GetAppDir('') + 'CONFIG.ini' );
    sSetPLCModel2 := Ini.ReadString('CONFIG', 'BARCODE2_PLCMODEL',   '');
    sSetPLCModel3 := Ini.ReadString('CONFIG', 'BARCODE3_PLCMODEL',   '');
    sPLCModel    := FrmMasterMode.EditJIGMODEL.Text;

    // ?????? ???? Barcode 1~3 ???? ?????? ???? ???? ???? ????.
    nBarcodeIdx := 1;
    while sSetPLCModel2 <> '' do
    begin
        sTemp := GetToKen(sSetPLCModel2, ',');
        if sPLCModel = sTemp then nBarcodeIdx := 2;
    end;

    while sSetPLCModel3 <> '' do
    begin
        sTemp := GetToKen(sSetPLCModel3, ',');
        if sPLCModel = sTemp then nBarcodeIdx := 3;
    end;

    { 170103 by shs. ???? pos???? ?????? 2, 12?? ????. ?????? '2'..
    //if (Pos(sPLCModel, sSetPLCModel2) > 0 ) then nBarcodeIdx := 2;
    //if (Pos(sPLCModel, sSetPLCModel3) > 0 ) then nBarcodeIdx := 3; // OS ???????? ???? (2016.12.30 koh)
    }
    FrmMelsecQ.SendCommand(sPLCStart, 0);
    bTempCheck := False;
    if not gbRunning then
    begin
        vl_Variable.Strings.Clear;
        LCD_Time.Value := '00:00:00';
        FrmData.Gauge.Progress := 0;

        bBarcode := True;
        biTacRet := True;

        bInit := True;
        // ?????? ?????????? ???????? COUNTER??????.
        sDate:= FormatDateTime('YYYY-MM-DD', now);
        if sDate <> edtDate.Text then
        begin
           edtDate.Text  := sDate;
           edtGood.Value := 0;
           edtFail.Value := 0;
           DisplayTestCount;
           IniMain.SaveData;

        end;
        with FrmMasterMode do
        begin
            StepList.Clear;
            NGList.Clear;
        end;

        bMasterMode := False;
        // ?????? ????.
        lb_Barcode.Caption := '';
        FRMiTAC.getCurrentCal();
        if FrmTestOption.Cb_UseBarcode.Checked then
        begin
            for i := 0 to 3 do
            begin
                str := FrmBarcode[nBarcodeIdx].GetBarcode ;
                if pos(' ', str) > 0 then
                    str := GetToken(str, ' ');
                 lb_Barcode.Caption := str;

                if not (lb_Barcode.Caption = '') then
                    Break;
            end;
            sBarcode := lb_Barcode.Caption;

            if Length(lb_Barcode.Caption) < 8 then
            begin
                bBarcode := False;
                AddLog('BARCODE READ FAIL');
                SetUnitState(ts_Fail);
            end else
            begin
                AddLog(Format('BARCODE READ OK! - [%s]',[sBarcode]));

                //-----------------------------------------------------------
                {// 2011.12.29 ?????? ???????? ????????.
                gModelCode := FrmTestOption.FindMasterSerial(sBarcode);
                if (gModelCode <> '') then begin
                    AddLog('* Master barcode Read : ' + gModelCode);
                    FrmTestOption.BtnLoadMasterClick(nil);
                    bMasterMode := True;
                end else begin
                    FrmTestOption.BtnLoadDefaultClick(nil);
                    bMasterMode := False;
                    gModelCode := sOldModelCode;
                end;
                }

                FrmMasterMode.gbMasterBCR := FrmMasterMode.FindMasterBarcode(lb_Barcode.Caption, 1, bOKNGMaster, sPartNum, sSetfile, bMsterModelChangeResult);
                if not FrmMasterMode.gbMasterBCR then
                    FrmTestOption.BtnLoadDefaultClick(nil);

                if not bMsterModelChangeResult then
                    bBarcode := False;

                if FrmMasterMode.BMASTERMODE then
                begin
                    if (FrmMasterMode.gbMasterBCR) then
                    begin
                       FrmMasterAlret.SetTESTData(1, lb_Barcode.Caption, 'TEST');
                       FrmMasterAlret.SetStatusBar('MASTER SAMPLE ?????? ??????!!!' , $00804000);
                    end else begin
                        bBarcode :=False;
                        AddLog('This Barcode is not Maser Barcode');
                        FrmMelsecQ.SendCommand(sPCBarcodeNG, 1);
                        exit;
                    end;
                end;


                bMasterMode := FrmMasterMode.gbMasterBCR;

                if (FrmTestOption.Cb_UseITAC.Checked) then
                begin
                    pnMES.Caption := 'MES ON';
                    pnMES.Color   := clGreen;
                end else begin
                    pnMES.Caption := 'MES OFF';
                    pnMES.Color   := clRed;
                end;

                if (FrmTestOption.Cb_UseITAC.Checked) and (not bMasterMode) and (bBarcode) then
                begin
                    //bBarcodeGood := False;
                    if FrmTestOption.Cb_PrevCheck.Checked then
                    begin
                        if iTacCheck(lb_Barcode.Caption) then
                        begin
                            AddLog('iTac Check OK');
                            bBarcode := True;
                            biTacRet := True;
                        end else begin
                           AddLog('iTac Check NG');
                            bBarcode := False;
                            biTacRet := False;
                        end;
                    end else
                    begin
                        AddLog('???????? SKIP');
                        bBarcode := True;
                        biTacRet := True;
                    end;
                end else begin
                     biTacRet := True;
                end;

                // ????????????
                if (FrmTestOption.Cb_AutoModelChange.Checked) and (not bMasterMode) and (bBarcode) then
                begin
                    if FrmEditModel.FindModel(gModelCode) then
                    begin
                        //gModelCode := sModelCode;
                        OpenModal(True);
                    end else begin
                        MessageBox(Format('?????? ???????? : (%s)' , [gModelCode]), '????', MB_OK or MB_ICONERROR);
                        bBarcode := False;
                    end;
                end;
                //-----------------------------------------------------------
            end;
        end else
        begin
            lb_Barcode.Caption := FormatDateTime('@YYMMDDHHNNSS', Now);
            biTacRet := True;
        end;
        //-----------------------------------------------------------------------------------------AGING???? Attribute ???? ?? ????

        if FrmTestOption.Cb_UseITAC.Checked and (not bMasterMode) and (bBarcode) then
        begin
            bAttribute := AttributeCheck(lb_Barcode.Caption, sAttribute);

            if (bAttribute) then AddLog(Format('AttributeCheck Result OK : Attribute(%s)', [sAttribute]))
                            else AddLog(Format('AttributeCheck Result NG : Attribute(%s)', [sAttribute]));

            if (not bAttribute) then biTacRet := False;
        end else begin
            if bMasterMode then
            begin
                bAttribute := True;
                sAttribute := 'Pass';
                AddLog('MASTER MODE - ???? ????');
                //?????? ???????? ???? ????
            end else begin
                bAttribute := True;
                sAttribute := '';
                AddLog('ITAC CHECK SKIP - AttributeCheck Skip');
            end;
        end;

        if  FrmTestOption.cb_TempConn.Checked then begin
            if not (TFrmTempSensor(DeviceManager.DevFormList[TempDevNo]).Comm.Connected) then
            begin
                AddLog(Format('Dev2 ???? ?????? ???? ???? NG', []));
                bTempCheck := False;
            end else
                bTempCheck := True;
        end else
            bTempCheck := True;

        if not bTempCheck then
        begin
            FrmMelsecQ.SendCommand(sPCBarcodeNG, 1);
            Led_PCbarcodeOK.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeOK) = 1);
            Led_PCbarcodeNG.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeNG) = 1);

            SetUnitState(ts_Fail);
            exit;
        end;

        if FrmTestOption.cb_TempSpec.Checked or FrmTestOption.cb_TempSpec2.Checked then
        begin
            for nTempCount := 0 to 2 do
            begin
                sTemperature := TFrmTempSensor(DeviceManager.DevFormList[2]).DevRead('?T');

                if sTemperature = '' then DelayEx(500, True)
                                     else break;
            end;
        end;
        // ???? ???? ???? ?? ???? ???? start ????. ???? : itac fail data ?????? ??????.
        if (bAttribute) and (sAttribute = '') then                  // HOT ???? ????
        begin
            if FrmTestOption.cb_TempSpec.Checked then
            begin
                fTemperature := StrTofloatDef(sTemperature,9999);
                fTempLowSpec := StrToFloatDef(FrmTestOption.edt_TempLowSpec.Text,0);
                fTempMaxSpec := StrToFloatDef(FrmTestOption.edt_TempMaxSpec.Text,0);
                vl_Variable.Strings.Values['TEMP_SPEC']  := Format('%.2f~%.2f', [fTempLowSpec, fTempMaxSpec]);

                AddLog(Format('> Temp Spec(%f ~ %f)', [fTempLowSpec, fTempMaxSpec]));

                if sTemperature <> '' then
                begin
                    if (fTemperature >= fTempLowSpec) and (fTemperature <= fTempMaxSpec) then
                    begin
                        gTempResult := True;
                        AddLog(Format('%s> ???? ???? ???? (%f) OK', [lb_Barcode.Caption ,fTemperature]));
                    end else
                    begin
                        gTempResult := False;
                        AddLog(Format('%s> ???? ???? ???? (%f) Fail', [lb_Barcode.Caption,fTemperature]));
                        if nTesterType = TESTER_TYPE_HOT then
                            AddLog('???? HOT Chamber?? ?????? ????.');
                        SetUnitState(ts_Fail);
                    end;
                end else
                begin
                    gTempResult := False;
                    AddLog(lb_Barcode.Caption + ' > HOT ???? ???? Value (N/A)');
                    SetUnitState(ts_Fail);
                end;
            end else
            begin
                gTempResult := True;
                AddLog(lb_Barcode.Caption + ' > HOT ???? ???? SKIP');
                vl_Variable.Strings.Values['TEMP_SPEC']  := '~';
            end;
        end else if (bAttribute) and (sAttribute = 'Pass') then                 // ???? ???? ????
        begin
            if FrmTestOption.cb_TempSpec2.Checked then
            begin
                fTemperature := StrTofloatDef(sTemperature,9999);
                fTempLowSpec := StrToFloatDef(FrmTestOption.edt_TempLowSpec2.Text,0);
                fTempMaxSpec := StrToFloatDef(FrmTestOption.edt_TempMaxSpec2.Text,0);
                vl_Variable.Strings.Values['TEMP_SPEC']  := Format('%.2f~%.2f', [fTempLowSpec, fTempMaxSpec]);

                if sTemperature <> '' then
                begin
                    if (fTemperature >= fTempLowSpec) and (fTemperature <= fTempMaxSpec) then
                    begin
                        gTempResult := True;
                        AddLog(Format('%s> ???? ???? ???? (%f) OK', [lb_Barcode.Caption ,fTemperature]));
                    end else
                    begin
                        gTempResult := False;
                        AddLog(Format('%s> ???? ???? ???? (%f) Fail', [lb_Barcode.Caption,fTemperature]));
                        SetUnitState(ts_Fail);
                    end;
                end else
                begin
                    gTempResult := False;
                    AddLog(lb_Barcode.Caption + ' > ???? ???? ???? Value (N/A)');
                    SetUnitState(ts_Fail);
                end;
            end else
            begin
                gTempResult := True;
                AddLog(lb_Barcode.Caption + ' > ???? ???? ???? SKIP');
                vl_Variable.Strings.Values['TEMP_SPEC']  := '~';
            end;
        end else begin
            AddLog('> Itac Attribute NG!!');
            gTempResult := False;
        end;

        // ?????? read ???????? ???? ?????? spec ???? ???????? Run!!!
        if (bBarcode) and (gTempResult) then
        begin
            FrmMelsecQ.SendCommand(sPCBarcodeOK, 1);
            Led_PCbarcodeOK.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeOK) = 1);
            Led_PCbarcodeNG.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeNG) = 1);

            //if FrmPLCControl.JigLoading() then
            //begin
                //merPLC.Enabled := False;
                //WT330 ????????????
                {aResourceItem.ResName := 'WT330_CAL';
                aResourceItem.IOName := 'DEV_04';
                DeviceManager.WriteDevice(aResourceItem, '*CAL?');
                }
                TestStart(bInit);
                TestRun();
                TestStop(True);
                TimerPLC.Enabled := True;
            //end;

        end else
        if (not bBarcode) or (not gTempResult) then
        begin
            FrmMelsecQ.SendCommand(sPCBarcodeNG, 1);
            Led_PCbarcodeOK.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeOK) = 1);
            Led_PCbarcodeNG.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeNG) = 1);
            if (not biTacRet) then AddLog('> ???? ???? ???? ?? attribute ???? ????')
                              else AddLog('> ?????? ????');


            SetUnitState(ts_Fail);
        end;
    end;
end;

procedure TFrmMain.BtnManualClick(Sender: TObject);
var StepIdx : Integer;
    TestStep : TTestStep;
    StepState : TTestState;
    Node : TTreeNode;
begin
    if gbRunning then exit;

    Node := TreeView.Selected;
    if (Node = nil) then exit;

    for StepIdx := 0 to CurrProject.GetStepCount - 1 do
    begin
        TestStep := CurrProject.GetStep(StepIdx);
        if (TestStep <> nil)  and
           (TestStep.Enabled) and
           (TestStep.StepName = Node.Text) then
        begin
            TestStart(True);
            UnitInfo.bTotalResult := RunStep(StepIdx);
            TestStop(False);
            break;
        end;
    end;
end;

procedure TFrmMain.BtnStopClick(Sender: TObject);
begin
    bAutoTest := False;
    if gbRunning then
    begin
        gbRunning := False;
        UnitInfo.bTotalResult := False;
        AddLog('TEST STOP');
    end;
    SetUnitState(ts_Stop);
end;

procedure TFrmMain.btnResetClick(Sender: TObject);
    procedure ResetPLCIO();
    begin
        FrmMelsecQ.SendCommand(sPLCStart, 0);
        FrmMelsecQ.SendCommand(sPCBarcodeOK, 0);
        FrmMelsecQ.SendCommand(sPCBarcodeNG, 0);
        FrmMelsecQ.SendCommand(sPCOK, 0);
        FrmMelsecQ.SendCommand(sPCNG, 0);
        FrmMelsecQ.SendCommand(sPCBarcodeNOREAD, 0);
        FrmMelsecQ.SendCommand(sPLCReset, 0);
    end;
begin
    BtnStop.Click;
    ResetPLCIO();

    TestMode := 0;
    ResetIO;
    if (not gbRunning) then begin
        SetUnitState(ts_Ready);
        if FrmData <> nil then FrmData.ClearData;
    end;
    AddLog('RESET');
    SetPCReady(True);


    //FrmPLCControl.BtnUnLoadingClick(nil);
    AddLog('RESET');


    LbFailCount.Caption := '0';
    nReFailCount := 0;
    
    //if FrmPLCControl.TimerStart.Enabled = False then
    //    FrmPLCControl.TimerStart.Enabled := True;

    if FrmMessage <> nil then
        FrmMessage.Close;
end;

procedure TFrmMain.N26Click(Sender: TObject);
begin
    FrmEditModel.ShowModal;
end;
function TFrmMain.ChangeProject(aPRJFileName : string) : Boolean;
var StrList : TStringList;
    sProjectFile, sLayoutFile, sModelFile, sMetaFile : String;
begin
    Result := False;
    //-------------------------------------------
    // 1) ?????????? ????????.
    gBaseDir    := gModelFolder + gModel + '\';
    Label_Model.Caption := Format('%s - %s', [gModel, gModelCode]);

    //-------------------------------------------
    // 2) ?????????? ??????. ???????? ????????.
    sModelFile := gModelFolder + gModel + '\MODEL.xls';
    if FileExists(sModelFile) then
        FrmEditModel.OpenSPECFile(sModelFile, True)
    else
        exit;
    //-------------------------------------------
    // 4) ???????? ?????? ????????.
//    sProjectFile := aPRJFileName;//FrmEditModel.GetItemByName(gModelCode, 'PROJECT_FILE' + IntToStr(nTesterType));
//    sProjectFile := gBaseDir + 'PROJECT\MasterProject\' + sProjectFile;

    sProjectFile := FrmEditModel.GetItemByName(gModelCode, 'PROJECT_FILE' + IntToStr(nTesterType));
    sProjectFile := gBaseDir + 'PROJECT\' + sProjectFile;

    if FileExists(sProjectFile) then
    begin
        CurrProject.LoadFromFile(sProjectFile);
        gProjectFileName := ExtractFileName(sProjectFile);
        ViewTestInfo;
        AddLog('Project Loading : ' + ExtractFileName(sProjectFile));
        Result := True;
    end else begin
        AddLog('Project File not Found : ' + ExtractFileName(sProjectFile));
        exit;
    end;
end;

// ?????????? OPEN????.
function TFrmMain.OpenModal(bLoadMetaFile : Boolean) : Boolean;
var StrList : TStringList;
    sProjectFile, sLayoutFile, sModelFile, sMetaFile : String;
    sThetaFileName, sThetaDirName : String;
begin
    //-------------------------------------------
    // 1) ?????????? ????????.
    gBaseDir    := gModelFolder + gModel + '\';
    Label_Model.Caption := Format('%s - %s', [gModel, gModelCode]);

    sOldModelCode := gModelCode;
    //-------------------------------------------
    // 2) ?????????? ??????. ???????? ????????.
    sModelFile := gModelFolder + gModel + '\MODEL.xls';
    if FileExists(sModelFile) then
        FrmEditModel.OpenSPECFile(sModelFile, True)
    else
        exit;

    StrList := TStringList.Create;
    FrmEditModel.GetSeqListValue(gModelCode, StrList );
    vl_Table.Strings.Text := StrList.Text;
    StrList.Free;

    //-------------------------------------------
    // 3) LAYOUT ?????? ????????.
    sLayoutFile := FrmEditModel.GetItemByName(gModelCode, 'LAYOUT_FILE');
    sLayoutFile := gBaseDir + sLayoutFile;
    if FileExists(sLayoutFile) then
    begin
        LoadFromLayoutFile(sLayoutFile);
    end;

    //-------------------------------------------
    // 4) ???????? ?????? ????????.
    sProjectFile := FrmEditModel.GetItemByName(gModelCode, 'PROJECT_FILE' + IntToStr(nTesterType));
    sProjectFile := gBaseDir + 'PROJECT\' + sProjectFile;
    if FileExists(sProjectFile) then
    begin
        CurrProject.LoadFromFile(sProjectFile);
        gProjectFileName := ExtractFileName(sProjectFile);
        ViewTestInfo;

        if CurrProject.GetStepCount > 1 then
            AddLog('Project Loading : ' + ExtractFileName(sProjectFile))
        else
            AddLog('Project Loading Fail : ' + ExtractFileName(sProjectFile));
    end else begin
        AddLog('Project File not Found : ' + ExtractFileName(sProjectFile));
        exit;
    end;

    //----------------------------------------------
    // ???? ????...
    // Meta File?? ????????.
    if bLoadMetaFile then
    begin
        sMetaFile := FrmEditModel.GetItemByName(gModelCode, 'META_FILE');
        sMetaFile := gBaseDir + 'META\' + sMetaFile;
        if FileExists(sMetaFile) then
        begin
            memoMeta.Lines.LoadFromFile(sMetaFile);
            AddLog('Metafile Loading : ' + ExtractFileName(sMetaFile));
        end else begin
            memoMeta.Lines.Clear;
            AddLog('Metafile not Found : ' + ExtractFileName(sMetaFile));
            exit;
        end;
    end;
    //-----------------------------------------------

   { sThetaDirName := gBaseDir + 'PROJECT\THETA\';
    sThetaFileName := vl_Table.Values['PWM_THETA_FILE'];

    if sThetaFileName <> '' then
    begin
        sThetaFileName := sThetaDirName + sThetaFileName;

        // Theta file ?????? ??????. result := false;
        if not FileExists(sThetaFileName) then exit;

        {if TFrmKMIPWM(DeviceManager.DevFormList[6]).DevFileOpen(sThetaFileName) then
        begin
            AddLog('Theta File Load OK : ' + ExtractFileName(sThetaFileName));
        end else begin
            AddLog('Theta File not Found : ' + ExtractFileName(sThetaFileName));
            Exit;
        end;
        if TFrmKMIPWM(DeviceManager.DevFormList[8]).DevFileOpen(sThetaFileName) then
        begin
            AddLog('Theta File Load OK : ' + ExtractFileName(sThetaFileName));
        end else begin
            AddLog('Theta File not Found : ' + ExtractFileName(sThetaFileName));
            Exit;
        end; 
    end else begin
        AddLog('Theta File not Found');
    end;

    }
    //StationNoChange();

    //-----------------------------------------------
    Result := True;
end;

procedure TFrmMain.StationNoChange();
var Ini : TIniFile;
    STATION1, STATION2 : String;
    sModelChange : string;
    PCNum : Integer;
begin
    Ini := TIniFile.Create(GetAppDir('') + 'PLCINFO.ini' );
    try
        nTesterType := Ini.ReadInteger('CONFIG', 'TESTER_TYPE',  TESTER_TYPE_EOL);  // 1=HOT TESTER, 2=EOL TESTER.
        nTesterNo   := Ini.ReadInteger('CONFIG', 'TESTER_NO',    1);

        IF (nTesterType = 2) AND (nTesterNo = 1) THEN
        BEGIN
            STATION1 := Ini.ReadString('CONFIG', 'STATION1',  '39036010');  // 1=HOT TESTER, 2=EOL TESTER.
            STATION2 := Ini.ReadString('CONFIG', 'STATION2',  '39036010');
            sModelChange := UpperCase(FrmEditModel.GetItemByName(gModelCode, 'ITAC STATION CHANGE'));

            if sModelChange = 'O' then
            begin
                FrmItac.Edit_StationNo.Text := STATION2;
                FrmItac.BtnLogin.Click;
            end else
            begin
                FrmItac.Edit_StationNo.Text := STATION1;
                FrmItac.BtnLogin.Click;
            end;
        end;
    finally
        Ini.Free;
    end;
end;

procedure TFrmMain.N28Click(Sender: TObject);
begin
    OpenDialog.InitialDir := gBaseDir;
    OpenDialog.DefaultExt := 'lay';
    OpenDialog.Filter     := 'Layout Files(*.lay)|*.lay';

    if OpenDialog.Execute then
    begin
        gLayoutFile := ExtractFileName(OpenDialog.FileName);
        LoadFromLayoutFile(gBaseDir + gLayoutFile);
    end;
end;

procedure TFrmMain.TreeViewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var Str : STring;
begin
    if (Node.Level = 0) then
    begin
        Str := Node.Text;
        if (Length(Str) > 2) and (Str[1] = '[') and (Str[Length(Str)] = ']') then begin
           TreeView.Canvas.Font.Style := [fsBold];
           TreeView.Canvas.Font.Color := clnavy;
        end else
        begin
            if (Node.ImageIndex <> 0) then
                TreeView.Canvas.Font.Color := clGray;
        end;
    end;
    DefaultDraw := True;
end;

procedure TFrmMain.CANDIAG1Click(Sender: TObject);
begin
    FrmCanDiag.Show;
end;

procedure TFrmMain.CAN1Click(Sender: TObject);
var Idx : Integer;
begin
//    Idx := (Sender as TMenuItem).Tag;
    gFrmCANCom[1].Show;
end;

procedure TFrmMain.CAN11Click(Sender: TObject);
var
    Idx : Integer;
begin
    Idx := (Sender as TComponent).Tag;
    if (Idx < 1) or (Idx > FrmHwTest.nCANCount) then exit;

    // ?????????? ????????.
    FrmCANMonitor := TFrmCANMonitor( FindWindowByCaption( Format('CAN%d:%S', [Idx, gCanDBFile[Idx]]) ));
    if (FrmCANMonitor = nil) then
    begin
        FrmCANMonitor := TFrmCANMonitor.Create(Application, Idx, nil, gFrmCANCom[Idx]);
        with FrmCANMonitor do
        begin
            FormStyle := fsMDIChild;
            sBaseDir  := gBaseDir + 'DBC\';
            OpenDBCFile(sBaseDir + gCanDBFile[Idx]);
        end;
    end else
        FrmCANMonitor.Show;
end;

procedure TFrmMain.PLC1Click(Sender: TObject);
begin
    FrmMelsecQ.Show;
end;

procedure TFrmMain.SetPCReady(bOnOff : Boolean);
begin
    if bOnOff then begin
        AddLog(Format('PC READY ON : (%s)', [sPCReady]));
        TimerPLC.Tag := 1;
    end else
    begin
        AddLog(Format('PC READY OFF : (%s)', [sPCReady]));
        TimerPLC.Tag := 0;
    end;

    if bOnOff then begin
        FrmMelsecQ.SendCommand(sPCReady, 1);
        AddLog(Format('PC READY ON : (%s)', [sPCReady]));
        TimerPLC.Tag := 1;
    end else begin
        FrmMelsecQ.SendCommand(sPCReady, 0);
        AddLog(Format('PC READY OFF : (%s)', [sPCReady]));
        TimerPLC.Tag := 0;
    end;

end;

procedure TFrmMain.TimerPLCTimer(Sender: TObject);
var bBarcodeGood : Boolean;
    nLoopCount, Ret : Integer;
    Str : String;
    SnrInfoData : TSnrInfoData;
    sWorkOrder, sStation : String;
    sValue : String;
    sHMFFile, sAttribiteValue : String;

    nHour, nMin, nSec, nmSec : Word;
    CurrTime, OldTime : TDateTime;
    nModelIdx : Integer;
    sBarcode : String;
    i : integer;

    fSpec : double;
begin
    TimerPLC.Enabled := False;
    if (FrmTestOption.Cb_UseITAC.Checked) then
    begin
        pnMES.Caption := 'MES ON';
        pnMES.Color   := clGreen;
    end else begin
        pnMES.Caption := 'MES OFF';
        pnMES.Color   := clRed;
    end;

    if FrmTestOption.cbAutoReset.Checked then
    begin //??????
        fSpec := StrToFloatDef(FrmTestOption.edtAutoReset.Text, 10) * 60 * 1000;
        if (not gbRunning) and (AutoResetCount = 0) and (not bFirst) then
        begin
            if (GetTickCountEx - ReadyTime) > fSpec then begin
                Inc(AutoResetCount);
                btnResetClick(nil);
            end;
        end;
    end;

    try
        bPlc_Ready        := (FrmMelsecQ.ReadCommandEX(sPLCReady)   = 1);
        bPlc_Start        := (FrmMelsecQ.ReadCommandEX(sPLCStart)   = 1);
        Led_Ready.LedOn   := bPlc_Ready;
        Led_Start.LedOn   := bPlc_Start;

        Led_PlcReset.LedOn := (FrmMelsecQ.ReadCommandEX(sPLCReset) = 1);
        Led_PCReady.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCReady) = 1);
        LED_ALIVE.LedOn    := (FrmMelsecQ.ReadCommandEX(sPCALIVE) = 1);
        Led_PCOK.LedOn     := (FrmMelsecQ.ReadCommandEX(sPCOK) = 1);
        Led_PCNG.LedOn     := (FrmMelsecQ.ReadCommandEX(sPCNG) = 1);
        Led_PCbarcodeOK.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeOK) = 1);
        Led_PCbarcodeNG.LedOn  := (FrmMelsecQ.ReadCommandEX(sPCBarcodeNG) = 1);


        // ???? 8:30???? ???????? ???? Reset????.
        CurrTime := Now - Trunc(Now);
        OldTime  := PrevTime - Trunc(PrevTime);
        PrevTime := Now;

        if FrmTestOption.Cb_CounterAutoReset.Checked then
        begin
            DecodeTime(FrmTestOption.DateTimePicker.Time, nHour, nMin, nSec, nmSec);
            if (CurrTime >= EncodeTime(nHour, nMin, nSec, 0)) and
               (OldTime  <  EncodeTime(nHour, nMin, nSec, 0)) then
            begin
                edtTotal.Value := 0;
                edtGood.Value := 0;
                edtFail.Value := 0;
                DisplayTestCount;

                AddLog('Counter Reset');
            end;
        end;

        if (Led_Start.LedOn) and (not gbRunning) then
        begin
            bAutoTest := True;
            BtnStrartClick(Self);
            FrmMelsecQ.SendCommand(sPLCStart, 0);
            Led_Start.LedOn := False;
        end;

        if (Led_PlcReset.LedOn) or gbReset then
        begin
            AddLog(Format('PLC RESET ON : (%s)', [sPLCReset]));
            BtnStopClick(nil);
            btnResetClick(nil);
            FrmMelsecQ.SendCommand(sPLCReset, 0);
            gbReset := False;
            //FrmMelsecQ.SendCommand(sPCEnd, 1);
        end;

        IF NOT LED_ALIVE.LedOn THEN
            FrmMelsecQ.SendCommand(sPCALIVE, 1)
        ELSE
            FrmMelsecQ.SendCommand(sPCALIVE, 0);


    finally
        TimerPLC.Enabled := True;
    end;
end;


procedure TFrmMain.LOG1Click(Sender: TObject);
begin
    if FrmLog = nil then begin
        FrmLog := TFrmLog.Create(Self);
    end;
end;

procedure TFrmMain.Label_ModelDblClick(Sender: TObject);
var Value : String;
begin
    Value := gModelCode;
    if InputQuery('????????', 'Input Model Code...', Value) then
    begin
        if FrmEditModel.FindModel(Value) then
        begin
            gModelCode := Value;
            if not OpenModal(True) then begin
                MessageBox(Format('???????????? : (%s)' , [Value]), '????', MB_OK or MB_ICONERROR);;
            end;
        end else
            MessageBox(Format('?????? ???????? : (%s)' , [Value]), '????', MB_OK or MB_ICONERROR);;
    end;
end;

procedure TFrmMain.DispMessage(sMessage : String; Color : TColor = clBlack);
begin
    LableStepName.Caption := sMessage;
    LableStepName.Color   := Color;
    FrmUDPComm.SendUDP(Format('MESSAGE:%d:1:%s', [nTesterNo, sMessage]));
end;

procedure TFrmMain.CLIENT1Click(Sender: TObject);
begin
   //FrmTRClient.Show;
end;

procedure TFrmMain.UDP1Click(Sender: TObject);
begin
    FrmUDPComm.Show;
end;

procedure TFrmMain.ITAC1Click(Sender: TObject);
begin
    FrmItac.Show;
end;

//------------------------------------------------------------------------------
// ITAC?? ?????? UPLOAD????.
//------------------------------------------------------------------------------
function TFrmMain.UpLoadItac(bResult: Boolean; bFirst : Boolean = True) : Boolean;
var i, Ret, nCount : Integer;
    sSerial, RdStr, WtStr, Str, sStepName, sPrevStepName, sItemName, sMin, sMax, sUnit, sValue, sSpec, sResult: String;
    bStepResult : Boolean;
    sDataList, sFailList : TStringList;
    SnrInfoData : TSnrInfoData;
    fMid, fRange : Double;
    sGMYmd, sModelComment, sAttributeCode, sAtributeValue : String;
    nRet, nAppRet : integer;
    sAttribute : string;
begin
    Result    := False;
    // ?????????? ????????.
    sSerial := lb_Barcode.Caption;

    if sSerial = '' then exit;

    if sSerial[1] = '@' then begin
        AddLog(Format('?????? ?????? %s', [sSerial]));
        exit;
    end;

    sDataList := TStringList.Create;
    sFailList := TStringList.Create;

    sPrevStepName := '';
    try
        for i := 0 to UnitInfo.TestResult.Count-1 do
        begin
            // idx:name:value,min,max,unit
            RdStr := UnitInfo.TestResult[i];
            // STEP,ITEM,SPEC,VALUE,UNIT,RESULT');

            sStepName   := GetToken(RdStr, ';');

            // ?????????? ???????????? ???????? ????..
            if sStepName = '' then sStepName := sPrevStepName
                              else sPrevStepName := sStepName;

            sItemName   := GetTokenTrim(RdStr, ';');
            sSpec       := GetTokenTrim(RdStr, ';');
            sValue      := GetTokenTrim(RdStr, ';');
            sUnit       := GetTokenTrim(RdStr, ';');
            sResult     := GetTokenTrim(RdStr, ';');

            if (Pos('#', sStepName) > 0) then
            begin
                sStepName := ReplaceStr(sStepName,'#','');
                sSpec := 'DONTCARE';
            end;

            if (sSpec = '') then continue;
            if (sResult = 'SKIP') then continue;
            if (sValue = '') then sValue := 'N/A'; // Spec?? ?????? ???? ???????????? N/A?? ????..2011.12.7

            if (Pos('??', sSpec) > 0) then begin
                Str := sSpec;
                fMid   := StrToFloatDef(GetTokenTrim(Str, '??'), 0);
                fRange := StrToFloatDef(Trim(Str), 0);
                sMin   := FloatToStr(fMid - fRange);
                sMax   := FloatToStr(fMid + fRange);
            end else
            if (Pos('~', sSpec) > 0) then begin
                Str := sSpec;
                sMin := GetTokenTrim(Str, '~');
                sMax := Trim(Str);
            end else begin
                sMin := sSpec;
                sMax := '';
            end;

            // ???????????? ??????.
            bStepResult := (sResult = 'OK');
            if (not bStepResult) then begin
                WtStr := Format('%s;%s;%s;', [sStepName, sItemName, sValue ]);
                sFailList.Add(WtStr);
            end;

            nCount := sDataList.Count+1;
            WtStr :=Format('%d:%.3d_%s_%s:%s:%s:%s:%s:%d',
                [nCount, nCount, sStepName, sItemName, sValue, sMin, sMax, sUnit, Ord(not bStepResult) ]);
            sDataList.Add(WtStr);

            // ?????????? ???? ?????? Itac?? Skip????... 2011.03.20 ??????
            if not bStepResult then break;
        end;
        sModelComment := FrmEditModel.GetItemByName(gModelCode, 'MODEL');

        //---------------------------------------------------------------------- ATTIBUTE CODE -----------------//
        // AGING Attribute ????(FPC_2_HFT)  2015-01-17 KJM
        for i :=  1 to 3 do
        begin
            sAttributeCode := '';
            sAtributeValue := '';


            case  i  of
                1 : begin
                    sAttributeCode := 'HMF';
                    sAtributeValue := FrmEditModel.GetItemByName(gModelCode, 'META_FILE');;
                end;
                2 : begin
                    sAttributeCode := 'SW_HOT';
                    sAtributeValue := vl_Variable.Values['SW_Version'];
                end;
                3: begin
                    // hot ???? ?????? ?????? ???????? FPC_2_HFT?? ?????? ??????.
                    nRet := FrmItac.GetAttributeforSerial(sSerial, 'FPC_AGING', sAttribute);
                    AddLog(Format('Before Upload GetAttributeforSerial - FPC_AGING : Ret : %d, %S',[nRet, sAttribute]));

                    if (nRet = -72) then continue;

                    sAttributeCode := 'FPC_2_HFT';
                    if (bResult) then sAtributeValue := 'Pass'
                                 else sAtributeValue := 'Fail';
                end;
            end;

            if (sAtributeValue <> '')then
            begin
                nAppRet  := FrmItac.AppendAttribute(sSerial, sAttributeCode, sAtributeValue);

                AddLog(format('AppendAttribute Return : %d, code-%s, value-%s',[nAppRet, sAttributeCode, sAtributeValue]));

                if nAppRet = -96 then
                begin
                    nAppRet := FrmItac.RemoveAttribute(sSerial, sAttributeCode);
                    if nAppRet = 0 then
                    begin
                        AddLog(format('RemoveAttribute Return : %d, code-%s',[nAppRet, sAttributeCode]));
                        nAppRet := FrmItac.AppendAttribute(sSerial, sAttributeCode, sAtributeValue);
                        AddLog(format('AppendAttribute Return : %d, code-%s, value-%s',[nAppRet, sAttributeCode, sAtributeValue]));
                        if (nAppRet <> 0) then begin
                            exit;
                        end;
                    end else
                        continue;
                end else
                    continue;
                DelayEx(100,True);
            end;
        end;

        while True do begin
            if (bFirst) then begin
                if FrmItac.GetSerialInfoData(sSerial, SnrInfoData) = 0 then
                begin
                    fCheckTime := GetTickCountEX;

                    Ret := FrmItac.UploadResultDataAndRecipe(sSerial, SnrInfoData.partNr,
                        IntToStr(SnrInfoData.bomVersion), sDataList, bResult);

                    AddLog(Format('UploadResultDataAndRecipe OK : %f ms', [GetTickCountEX - fCheckTime]));

                    if Ret <> 0 then begin
                        AddLog(Format('UploadResultDataAndRecipe Fail (%d) %s : %s', [Ret, sSerial, FrmItac.LastMessage]));
                        exit;
                    end else  break;
                end else
                begin
                    AddLog(Format('GetSerialInfoData Fail (%d) %s : %s', [Ret, sSerial, FrmItac.LastMessage]));
                    exit;
                end;
            end
            else begin
                Ret := FrmItac.UploadStateAndResultData(sSerial, sDataList, bResult);
                if (Ret = -7) or (Ret = -8) then begin
                    bFirst := True;
                    continue;
                end;

                if Ret <> 0 then begin
                    AddLog(Format('UploadStateAndResultData Fail (%d) %s : %s', [Ret, sSerial, FrmItac.LastMessage]));
                    exit;
                end else
                    break;
            end;
        end;

        // ?????????? ????????.
        if ( not bResult) then begin
            Ret := FrmItac.UploadFailureSlip(sSerial, sFailList);

            //--------------------------------------------
            // ?????????? ???????????? ???? ????????. 2011.11.15??..
            AddLog(Format('# SN : %s Fail', [sSerial]));
            for i:= 0 to sFailList.Count-1 do begin
                AddLog(sFailList[i]);    //, LOG_FAIL
            end;
            AddLog('');
            //--------------------------------------------
        end;
        Result    := True;
    finally
    end;
end;


procedure TFrmMain.B1Click(Sender: TObject);
begin
    FrmBarCode[1].Show;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
var sTemp : String;
begin
   //  FrmTempSensor.DevOpen('');
     Button1.Caption :=  FrmTable.FindASCII(Edit1.Text);
     Edit1.Text := FrmHwTest.TEST(sTemp);
end;

procedure TFrmMain.CountLISTClick(Sender: TObject);
var i: Integer;
begin
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if (Application.MainForm.MDIChildren[i].ClassName = 'TFrmAlret') then
        begin
            Application.MainForm.MDIChildren[i].BringToFront;
            exit;
        end;
    end;

    FrmAlret := TFrmAlret.Create(self);
    FrmAlret.Show;
end;

procedure TFrmMain.PinCount(nUseSum: Integer);
var i: integer;
begin
    With FrmAlret do
    begin
        for i:=1 to Grid.RowCount-1 do
        begin
            if pos(Grid.Cells[0,1],'1') <> 0 then
            begin
                if nUseSum = 1 then begin
                    AlretCount;
                    gUsePinCount := Grid.Cells[3,i];
                    gSetPinCount := Grid.Cells[2,i];
                    IniUsePin.Value := StrtoInt(gUsePinCount);
                    IniSetPin.Value := StrtoInt(gSetPinCount);
                    lbPinCount.Caption := Format('%.6d', [ IniUsePin.Value ]) + ' / ' +
                                          Format('%.6d', [ IniSetPin.Value ]);
                end
                else if nUseSum = 0 then
                begin
                    gUsePinCount := Grid.Cells[3,i];
                    gSetPinCount := Grid.Cells[2,i];
                    IniUsePin.Value := StrtoInt(gUsePinCount);
                    IniSetPin.Value := StrtoInt(gSetPinCount);
                    lbPinCount.Caption := Format('%.6d', [ IniUsePin.Value ]) + ' / ' +
                                          Format('%.6d', [ IniSetPin.Value ]);
                end;
            end
            else exit;
        end;
    end;
end;

procedure TFrmMain.ASCII1Click(Sender: TObject);
begin
    FrmTable.show;
end;


Function TFrmMain.iTacCheck(sBarcode : String): Boolean;
var
    SnrInfo : TSnrInfoData;
    sProductPartNo : String;
    sProductbomVer : Integer;
    sTesterPartNo : String;
    nLoopCount, Ret, nRet1 : Integer;
    sitacHMF, sModelHMF, sOtherStationHMF : string;
begin
    Result    := False;
    sitacHMF  := '';
    sModelHMF := '';
    if FrmItac.GetSerialInfoData(sBarcode, SnrInfo) = 0 then
    begin
        //SnrInfo := SnrInfoData;
        sProductPartNo := SnrInfo.partNr;
        sProductbomVer := SnrInfo.bomVersion;
        sTesterPartNo := gModelCode;

        if sProductPartNo <> sTesterPartNo then
        begin
            if FrmTestOption.Cb_AutoModelChange.Checked then begin
                gModelCode := sProductPartNo;
                if FrmEditModel.FindModel(gModelCode) then begin
                    OpenModal(True);
                    AddLog('???? ???? ????..');
                end else begin
                    MessageBox(Format('?????? ???????? : (%s)' , [gModelCode]), '????', MB_OK or MB_ICONERROR);
                    exit;
                end;
            end else begin
                AddLog('Unit do not match -> PartNo');
                Exit;
            end;
        end;
        Ret := FrmItac.QueryRecipeData('43020015', SnrInfo.workOrder, 'HMF_File.nom', sitacHMF);   //??????  43020015
        if Ret = 0 then
        begin
            sModelHMF := FrmEditModel.GetItemByName(gModelCode, 'META_FILE');
            nRet1 := FrmItac.GetAttributeforSerial(sBarcode, 'HMF', sOtherStationHMF);
            AddLog(Format('GetAttributeforSerial : Ret : %d, %S',[nRet1, sOtherStationHMF]));
            if (nRet1 <> 0) then exit;

            if (sitacHMF  <> sModelHMF)        or
               (sitacHMF  <> sOtherStationHMF) or
               (sModelHMF <> sOtherStationHMF) then
            begin
                AddLog(Format('HMF UNMATECD>> LOCAL : %S, qurey : %S, Attr :%S',[sModelHMF, sitacHMF, sOtherStationHMF]));
                exit;
            end;

            Ret := FrmItac.CheckSNState(sBarcode, nLoopcount);
            if Ret = 0 then
            begin
                Result := True;
                AddLog('iTac Check OK!!');
            end
            else if (Ret = 5) or (Ret = 6) then
            begin
                AddLog('NextStation Diagnostic');
            end else
            begin
                AddLog('CheckSerialNumberState <> 0,5,6');
            end;
        end;
    end else
    begin
        AddLog('GetSerialInfoData <> 0');
    end;
end;


procedure TFrmMain.N25Click(Sender: TObject);
var StepIdx : Integer;
    TestStep : TTestStep;
    StepState : TTestState;
    Node : TTreeNode;
begin
    if gbRunning then exit;

    Node := TreeView.Selected;
    if (Node = nil) then exit;

    TestStart(True);

    UnitInfo.bTotalResult := True;
    UnitInfo.bCycleResult := True;


    for StepIdx := 0 to CurrProject.GetStepCount - 1 do
    begin
        TestStep := CurrProject.GetStep(StepIdx);

        // STEP SKIP??????
        if (TestStep.Enabled) then
        begin
            try
                UnitInfo.bStepResult := RunStep(StepIdx);
            except
                AddLog(Format('TFrmMain.TestRun() RunStep:%s', [TestStep.StepName]));
            end;
        end;

        // ?????? ????.
        if not gbRunning then break;

        if not UnitInfo.bStepResult then
        begin
            UnitInfo.bTotalResult := False;
            UnitInfo.bCycleResult := False;
        end;

        if (TestStep.StepName = Node.Text) then begin
            break;
        end;
    end;

    TestStop(False);
end;

procedure TFrmMain.NIHARDWARE1Click(Sender: TObject);
begin
    FrmNI_Hardware.SHOW;
end;

// AGING TESTER ?????? ???? ?? ???? ????
Function TFrmMain.AttributeCheck(sSerial: String; var sAttribute: String):Boolean;
var
    nRet : integer;
begin
    Result := False;
    sAttribute := '';
    nRet := FrmItac.GetAttributeforSerial(sSerial, 'FPC_AGING', sAttribute);
    AddLog(Format('GetAttributeforSerial ''FPC_AGING'' : Ret : %d, %S',[nRet, sAttribute]));

    if (nRet = -72) then begin             //-------------------------------------------------------------- First test
        AddLog(Format('Ret : %d, HOT ???? SPEC ????',[nRet]));
        Result := True;
    end else if (nRet = 0) then begin
        if (sAttribute = 'Pass') then      //-------------------------------------------------------------- RE TEST
        begin
            AddLog(Format('FPC_AGING Attribute PASS : %S, ???? ???? SPEC ????',[sAttribute]));
            Result := True;
        end else begin                    //-------------------------------------------------------------- ?????? ????
            AddLog('FPC_AGING Attribute FAIL');
            exit;
        end;
    end else begin                       //-------------------------------------------------------------- ?????? ????
        AddLog('GetAttributeforSerial(FPC_AGING) <> 0, -72');
        exit;
    end;

    Result := True;
end;

procedure TFrmMain.btnPopSaveClick(Sender: TObject);
begin
    FrmLMSedit.Show;
end;

procedure TFrmMain.CreateBarcode;
var i : integer;
begin
    for  i := Low(FrmBarcode) to High(FrmBarcode) do
    begin
        FrmBarcode[i] := TFrmBarcode.Create(self);
        FrmBarcode[i].Caption := 'Barcode ' + IntToStr(i);
        FrmBarcode[i].INI.IniSection := 'Barcode ' + IntToStr(i);
        FrmBarcode[i].INI.LoadData;
        FrmBarcode[i].BtnConnectClick(nil);
    end;
end;

procedure TFrmMain.DestroyBarcode;
var i : integer;
begin
    for  i := High(FrmBarcode) downto Low(FrmBarcode) do
    begin
        FrmBarcode[i].BtnDisConnectClick(nil);
        FrmBarcode[i].INI.SaveData;
        FrmBarcode[i].Free;
    end;
end;


procedure TFrmMain.BARCODE21Click(Sender: TObject);
begin
    FrmBarcode[2].Show;
end;

procedure TFrmMain.BARCODE31Click(Sender: TObject);
begin
    FrmBarcode[3].Show;
end;

end.









        if nTesterType = TESTER_TYPE_EOL then
        begin
            if (Pos('GM',sModelComment) > 0)   then
            begin
                sGMYmd := FrmHwTest.GMYMD;
                //break;
                Ret := FrmItac.AppendAttribute(sSerial, FrmItac.Edt_YMD.text, sGMYmd);
                if Ret = -96 then
                begin
                    if FrmItac.RemoveAttribute(sSerial, FrmItac.Edt_YMD.text) = 0 then
                    begin
                        FrmItac.AppendAttribute(sSerial, FrmItac.Edt_YMD.text, sGMYmd );
                        AddLog(Format('AppendAttribute ok (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                    end else begin
                        bResult := False;
                        AddLog(Format('AppendAttribute Fail (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                    end;
                end else
                if Ret = 0 then
                begin
                    AddLog(Format('AppendAttribute ok (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                end else
                begin
                    bResult := False;
                    AddLog(Format('AppendAttribute Fail (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                end;
            end;
            if  (Pos('85',sModelComment) > 0) then
            begin
                sGMYmd := FrmHwTest.GMYMD;
                IF sGMYmd = '' THEN
                    sGMYmd := 'NOTEST';
                //break;
                Ret := FrmItac.AppendAttribute(sSerial, 'SOFTWARE_VER_MAS3EOL', sGMYmd);
                if Ret = -96 then
                begin
                    if FrmItac.RemoveAttribute(sSerial, 'SOFTWARE_VER_MAS3EOL') = 0 then
                    begin
                        FrmItac.AppendAttribute(sSerial, 'SOFTWARE_VER_MAS3EOL', sGMYmd );
                        AddLog(Format('AppendAttribute ok (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                    end else begin
                        bResult := False;
                        AddLog(Format('AppendAttribute Fail (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                    end;
                end else
                if Ret = 0 then
                begin
                    AddLog(Format('AppendAttribute ok (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                end else
                begin
                    bResult := False;
                    AddLog(Format('AppendAttribute Fail (%d) %s : %s', [Ret, sSerial, sGMYmd]));
                end;
            end;
        end;

