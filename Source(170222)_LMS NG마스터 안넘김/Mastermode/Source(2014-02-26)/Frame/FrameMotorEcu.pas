unit FrameMotorEcu;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, XiPanel, StdCtrls, DPBLabel, ExtCtrls,
  AMLed, ComCtrls, Spin, ZINICtrl, Buttons, GradientLabel, FormEditModel,
  EllipsLabel, XiButton, ComObj;

Const HEIGHTCOUNT = 4;

type
  TtestResult = record
    sSNBarcode : string;
    sFullBarcode : string;
    sCustomBarcode : string;
    //--------------------
    bCompareResult : Boolean;
    bVisionResult : Boolean;
    bTotalResult : Boolean;
  end;

  TtestMode = (tmReady, tmRunning, tmEnd);
  TFrmeMotorEcu = class(TFrame)
    pnLoading: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    XiPanel19: TXiPanel;
    XiPanel4: TXiPanel;
    lbMessage: TdpbLabel;
    XiPanel2: TXiPanel;
    TimerRun: TTimer;
    INI: ZIniData;
    XiPanel3: TXiPanel;
    XiButton1: TXiButton;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    COUNT: ZIniData;
    Shape3: TShape;
    Edit_MotorSerial: TEdit;
    XiPanel8: TXiPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel12: TPanel;
    XiPanel16: TXiPanel;
    SpeedButton2: TSpeedButton;
    Count_Fail: ZIniSpinEdit;
    Panel7: TPanel;
    XiPanel1: TXiPanel;
    SpeedButton1: TSpeedButton;
    Count_Pass: ZIniSpinEdit;
    Panel6: TPanel;
    pcStatus: TPageControl;
    TabSheet1: TTabSheet;
    LbOptionModelName: TdpbLabel;
    pnLamp: TXiPanel;
    lbStatus: TdpbLabel;
    Panel8: TPanel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    LED_Request: TLed;
    GroupBox6: TGroupBox;
    LED_BCR_M_OK: TLed;
    LED_BCR_M_NG: TLed;
    LED_WORKCOMP: TLed;
    Shape1: TShape;
    XiPanel6: TXiPanel;
    Edit_EcuSerial: TEdit;
    LED_BCR_E_OK: TLed;
    LED_BCR_E_NG: TLed;
    LED_Vision_OK: TLed;
    LED_Vision_NG: TLed;
    cbDebug: TCheckBox;
    LED_Master: TLed;
    lbMaster: TLabel;
    LED_Vision_ST: TLed;
    TabSheet4: TTabSheet;
    GridList: TAdvStringGrid;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    MemoLog: TMemo;
    btnReset: TXiButton;
    LED_Oring_OK: TLed;
    LED_Oring_NG: TLed;
    LED_Gasket_OK: TLed;
    LED_Gasket_NG: TLed;
    LED_Gasket_ST: TLed;
    XiPanel7: TXiPanel;
    Panel1: TPanel;
    pnResult: TPanel;
    Panel9: TPanel;
    pnCable: TPanel;
    XiPanel9: TXiPanel;
    Panel11: TPanel;
    pnOring: TPanel;
    XiPanel10: TXiPanel;
    XiPanel5: TXiPanel;
    XiPanel11: TXiPanel;
    Shape2: TShape;
    pnResult_1: TPanel;
    Label1: TLabel;
    Shape4: TShape;
    pnResult_2: TPanel;
    Label2: TLabel;
    Shape5: TShape;
    pnResult_3: TPanel;
    Label3: TLabel;
    Shape6: TShape;
    pnResult_4: TPanel;
    Label4: TLabel;
    pnSpec: TPanel;
    XiPanel12: TXiPanel;
    LED_ECUreq: TLed;
    LED_Oring_END: TLed;
    LED_Vision_END: TLed;
    LED_Oring_SKIP: TLed;
    LED_Oring_ST: TLed;
    LbOringPass: TLabel;
    LED_Trace: TLed;
    LED_PCMASTER: TLed;
    Led_Stop: TLed;
    LED_Jig: TLed;
    LED_PCOring_SKIP: TLed;
    Led_PCOring_Check: TLed;
    edtDayHis: ZIniEdit;
    edtNightHis: ZIniEdit;
    LED_JIGMODE: TLed;
    lbJigCheck: TLabel;
    Led_TotalEnd: TLed;
    procedure TimerRunTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LED_RequestClick(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
    procedure XiPanel2Click(Sender: TObject);
    procedure BtnPcbScanClick(Sender: TObject);
    procedure XiButton2Click(Sender: TObject);
    procedure XiPanel2DblClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    function MakeDataList(aResult : Boolean): string;
    procedure Init();
    function FindLineMasterBarcode(Serial: string): Boolean;
  public
    { Public declarations }
    nStation : integer;
    gtestMode : TtestMode;
    gPastMessge : String;
    TestIndex, RestartIndex, BarcodeCount : integer;
    gResult : Boolean;
    fBarcodeCheck : double;
    fCheckTimeOut , fMotorEcuTimeOut : double;
    VisionCount : integer;

    gBarcode : array[1..2] of string;  //바코드
    gBarcodeFlag : array[1..2] of Boolean;
    nBarcodeTryCount : array[1..2] of integer;
    bIndexFlag : array[1..2] of Boolean;
    bScanResult : array[1..2] of Boolean;

    bCableResult : Boolean;
    bOringResult : Boolean;
    bGasketResult : Boolean;
    bRetryTest : Boolean;

    gbStartMaster, gbMasterResult : Boolean;
    bMasterBarocde : Boolean;
    DayIndex : integer;
    fStartTime, fStopTime : double;
    OldJigNum : string;
    bJigChanged : Boolean;
    bFirst : Boolean;


    function CheckMaster(): Boolean;
    function FindMasterBarcode(Serial : string; Mode : integer): Boolean;
    function ExistJigMaster() : Boolean;

    procedure DisplayTestStatus(Param : String);
    function Addlog(Param : String; bSetMsg : Boolean = FALSE): Boolean;
    function SetMessage(Param : string; aFontColor : TColor) : Boolean;
    procedure SaveData(DATETIME : TDateTime; aSerial, aResult: string);
    function CheckBarcode(nIndex : integer): Boolean;
    function CheckTRACE(sBarcode : string) : Boolean;
    function UploadTRACE(sMotorBarcode, sECUBarcode : string; nTestTime : TdateTime; aResult : Boolean) : Boolean;
    procedure AddGrid(sMotorSerial, sEcuSerial, sResult : String);
  end;

implementation

uses FormMain, FormTraceClient, FormSetup, FormMelsecQ, FormBarcode, GenUtils, FormPLCoption, FormListOption, Global, FormTerminate,
  FormMainStatus, StrUtils, Math, FormItac, FormHeight, FormAlret;


{$R *.dfm}


function TFrmeMotorEcu.CheckTRACE(sBarcode : string) : Boolean;
var
    nRet1, nRet2, nRet3, nRet4, nLoopCount : integer;
    sGetPartNo, sSetPartNo : String;

    pNo : string;
    aBarcode, sTemp : string;
begin
    Result := False;

    sGetPartNo := '';
    sSetPartNo := FrmMain.gModelInfo.ModelCode;

    pNo := TRACE[nStation].Ed_Station.Text;
    aBarcode := sBarcode;

    nRet1 := TRACE[nStation].CheckSNState(pNo, sBarcode);
    AddLog(Format('CheckSNState : %s',[GetErrorString(nRet2)]));



    if (nRet1 = 0) then
    begin
        AddLog('CheckSNState OK');

        nRet2 := TRACE[nStation].CheckSNInfo(pNo, aBarcode, sGetPartNo, sTemp);
        AddLog(Format('CheckSNInfo : %s',[GetErrorString(nRet2)]));

        if (FrmSetup.cbAutoModel.Checked) then
        begin
            if (FrmMain.gModelInfo.ModelCode <> sGetPartNo) and (sGetPartNo <> '') then
            begin
                GetModelInfo(GetModelName(sGetPartNo), FrmMain.gModelInfo);
                FrmMain.cmbModelList.Text := FrmMain.gModelInfo.ModelName + '/' + FrmMain.gModelInfo.ModelCode;
                sSetPartNo := FrmMain.gModelInfo.ModelCode;
                AddLog(Format('자동모델 변경 : %s',[FrmMain.gModelInfo.ModelName]), True);
            end;
        end;

        if (nRet2 = 0) then
        begin

            AddLog(Format('제품 partNumber : %s',[sGetPartNo])); // 제품 Part Number
            AddLog(Format('현재 설정 partNumber : %s',[sSetPartNo])); // 현재 모델 설정된 Part Number

            if (sGetPartNo = sSetPartNo) then
            begin
                AddLog('Part Number Check OK!!');
                Result := True;
            end else
            begin
                AddLog('Part Number Check NG!!');
                Result := False;
            end;
        end else begin
            AddLog('SerialCheck NG');
            Result := False;
        end;
    end else begin
        AddLog(Format('CheckSNState NG : %s',[GetErrorString(nRet1)]));
    end;

    if Result then
        AddLog('TRACE CHECK OK')
    else
        AddLog('TRACE CHECK NG');
end;




function TFrmeMotorEcu.CheckBarcode(nIndex : integer): Boolean; //MOTOR
var
    nTemp, i : integer;
    TempCB :  ZIniCheckBox;
    TempCB1 :  ZIniCheckBox;
    nVarData : string;
    nRet : Boolean;
begin
    Result := False;

    AddLog(Format('%S BARCODE : [%s]',[IfThen((nIndex = 1), 'MOTOR', 'ECU'), gBarcode[nIndex]]), True);
    //--------------------------------------------------바코드 무결성 체크
    if (gBarcode[nIndex] <> '') and (gBarcode[nIndex] <> 'NOREAD') then begin
        AddLog(Format('%S Barcode Scan OK',[IfThen((nIndex = 1), 'MOTOR', 'ECU')]), True);
        //마스터 시간 모드일때는 마스터가 아닌 제품은 SCAN NG로 뺸다.

        if (nIndex = 1) AND (bMasterBarocde) then
            Addlog('마스터 바코드', True);
            AddLog('Barcode Scan OK', True);
    end else
    begin
        AddLog(Format('%S Barcode Scan NG',[IfThen((nIndex = 1), 'MOTOR', 'ECU')]), True);
        if (nIndex = 1) then
            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_NG', nTemp), 1)
        else begin
            DisplayTestStatus('SCAN NG');
            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_NG', nTemp), 1);
        end;
        Exit;
    end;

    //--------------------------------------------------MES 체크
    TempCB  := ZIniCheckBox(FrmSetup.FindComponent(Format('cbMesUse_%d',[nStation])));
    TempCB1  := ZIniCheckBox(FrmSetup.FindComponent(Format('cbStateNotUse_%d',[nStation])));
    if (TempCB.Checked) and (not lbMaster.Visible) and (not TempCB1.Checked) and (not bMasterBarocde) then
    begin
        if (nIndex = 1) then
        begin
            nRet := CheckTRACE(gBarcode[nIndex])
        end else begin
            FrmMain.WritePCAlive;

            if (FrmSetup.cbItacUse.Checked) then
                nRet := FrmMain.Check_iTac(gBarcode[nIndex], FrmMain.gModelInfo.ECUCode)
            else
                nRet := True;
            FrmMain.WritePCAlive;
        end;

        if (nRet) then
        begin
            AddLog(Format('%S 이전공정 Check OK : [%s]',[IfThen((nIndex = 1), 'MOTOR', 'ECU'), gBarcode[nIndex]]), True);
        end else begin
            DisplayTestStatus(Format('%S 이전공정 Check NG',[IfThen((nIndex = 1), 'MOTOR', 'ECU')]));
            AddLog(Format('%S 이전공정 Check NG : [%s]',[IfThen((nIndex = 1), 'MOTOR', 'ECU'), gBarcode[nIndex]]), True);
            if (nIndex = 1) then
                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_NG', nTemp), 1)
            else
                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_NG', nTemp), 1);
            Exit;
        end;
    end else begin
        AddLog(Format('%S 이전공정 Check PASS : [%s]',[IfThen((nIndex = 1), 'MOTOR', 'ECU'), gBarcode[nIndex]]), True);
    end;

    if (FrmSetup.cbJIGCheck.Checked) and (nIndex = 1) then
    begin
        if ((FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0)) <> FrmMain.gModelInfo.PLCJigNum) then
        begin
            AddLog(Format('JIG 모델 불일치 : [%s]',[gBarcode[nIndex]]), True);
            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_JIGALARM', nTemp), 1);
            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_NG', nTemp), 1);
            Result := False;
            exit;
        end;
    end;

    if (nIndex = 1) then
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_OK', nTemp), 1)
    else
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_OK', nTemp), 1);
    RESULT := True;
end;

procedure TFrmeMotorEcu.SaveData(DATETIME : TDateTime; aSerial, aResult: string);
var
    sDirName, sFileName, sTemp, sData, sResult : String;
    aTextFile: TextFile;
    nCount, i, j: integer;
    nNow : TDateTime;
    //sSerial, sResult1 : string;
    sMode : string;
begin
    nNow := DATETIME;
    sDirName := GetAppDir('DATA\MOTOR_ECU\')+ FrmMain.gModelInfo.ModelName + FormatDateTime('\YYYY-MM', nNow) + '\' +
      FormatDateTime('MM-DD', nNow) + '\';
    MakeDir(sDirName);
    sFileName := Format('%s\%s.csv', [ sDirName,FormatDateTime('YYYYMMDD', nNow) ]);

    AssignFile(aTextFile, sFileName);
    try
       {$IOCHECKS OFF}
        if not FileExists(sFileName) then begin
            Rewrite(aTextFile);
            sData := 'Date/Time,MotorSerial,ECUSerial,CableResult, OringResult, GasketSpec, GasketData#1, GasketData#2, GasketData#3, GasketData#4, TotalResult';
            Writeln(aTextFile, sData);

        end;
        Append(aTextFile);

        sData := '';

        if (LED_Master.LedOn) or (LED_JIGMODE.LedOn) then
        begin
            sMode := 'MASTER';
            if (LED_JIGMODE.LedOn) then sMode := 'JIG';

            sData := Format(',%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s',[aSerial
                                                                        ,Edit_EcuSerial.Text
                                                                        , pnCable.Caption
                                                                        , pnOring.Caption
                                                                        , pnSpec.Caption
                                                                        , pnResult_1.Caption
                                                                        , pnResult_2.Caption
                                                                        , pnResult_3.Caption
                                                                        , pnResult_4.Caption
                                                                        , aResult
                                                                        , sMode] );
        end else
            sData := Format(',%s,%s,%s,%s,%s,%s,%s,%s,%s,%s',[     aSerial
                                                                        ,Edit_EcuSerial.Text
                                                                        , pnCable.Caption
                                                                        , pnOring.Caption
                                                                        , pnSpec.Caption
                                                                        , pnResult_1.Caption
                                                                        , pnResult_2.Caption
                                                                        , pnResult_3.Caption
                                                                        , pnResult_4.Caption
                                                                        , aResult] );

        sData := DateTimeToStr(nNow) + sData;
        Writeln(aTextFile, sData);
    finally
        CloseFile(aTextFile);
    end;
end;

procedure TFrmeMotorEcu.TimerRunTimer(Sender: TObject);
var fTime : Double;
    fStartTime : Double;
    sTemp, sSpec : String;
    nTemp : Integer;
    TestTime : TDateTime;
    nPartNum : integer;
    VarStr : string;
    i : integer;
    TempCB : ZIniCheckBox;
    bUploadResult : Boolean;
    bTemp : Boolean;
    sValue : string;
    fValue, fMin, fMax : double;
    sRdStr, sStr : string;
begin
    TimerRun.Enabled := False;


    if FrmMain.bPause then
    begin
        TimerRun.Enabled := True;
        exit;
    end;

    if not (cbDebug.Checked) then
    begin
        LED_Request.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_REQUEST', nTemp)) = 1);
        LED_ECUreq.LedOn  := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_ECU_REQ', nTemp)) = 1);

        LED_Vision_ST.LedOn := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PLC_Vision_Req', nTemp)) = 1);
        LED_Vision_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_VISION_OK', nTemp)) = 1);
        LED_Vision_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_VISION_NG', nTemp)) = 1);
        LED_Vision_END.LedOn  := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_Vision_END', nTemp)) = 1);

        LED_Oring_ST.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_Oring_Req', nTemp)) = 1);
        LED_Oring_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_Oring_OK', nTemp)) = 1);
        LED_Oring_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_Oring_NG', nTemp)) = 1);
        LED_Oring_END.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_Oring_END', nTemp)) = 1);
        LED_Oring_SKIP.LedOn  := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_Oring_SKIP', nTemp)) = 1);

        LED_Gasket_ST.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PLC_Gasket_Req', nTemp)) = 1);
        LED_Gasket_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_Gasket_OK', nTemp)) = 1);
        LED_Gasket_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_Gasket_NG', nTemp)) = 1);

        LED_BCR_M_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_BCR_M_OK', nTemp)) = 1);
        LED_BCR_M_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_BCR_M_NG', nTemp)) = 1);
        //LED_BCR_M_NOREAD.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_M_NOREAD', nTemp)) = 1);

        LED_BCR_E_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_BCR_E_OK', nTemp)) = 1);
        LED_BCR_E_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_BCR_E_NG', nTemp)) = 1);
        //LED_BCR_E_NOREAD.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_E_NOREAD', nTemp)) = 1);

        LED_WORKCOMP.LedOn  := (FrmMelsecQ.ReadCommandEx(FindAddr(nStation,'PC_WORKCOMP', nTemp)) = 1);
        LED_Master.LedOn    := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PLC_MASTER_MODE', nTemp)) = 1);
        LED_PCMASTER.LedOn := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PC_MASTER', nTemp)) = 1);
        Led_Stop.LedOn := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PC_STOP', nTemp)) = 1);
        LED_Jig.LedOn  := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PC_JIGALARM', nTemp)) = 1);
        LED_JIGMODE.LedOn  := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PLC_JIGMODE', nTemp)) = 1);

        LED_PCOring_SKIP.LedOn  := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PC_Oring_SKIP', nTemp)) = 1);
        Led_PCOring_Check.LedOn := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PC_Oring_Check', nTemp)) = 1);
        Led_TotalEnd.LedOn     := (FrmMelsecQ.ReadCommandEX(FindAddr(nStation,'PLC_TOTAL_END', nTemp)) = 1);
        LED_Trace.LedOn := (TRACE[nStation].ClientSocket.Socket.Connected);

    end;

    if (FrmMainStatus.LED_Reset.LedOn) or (not btnReset.Enabled) then
    begin
        Addlog('RESET', True);
        Init();
        //BarcodeCount := 0;
        gtestMode := tmReady;
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_ECU_REQ', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_REQUEST', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Vision_Req', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_VISION_OK', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_VISION_NG', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Vision_END', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_OK', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_NG', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_Req', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_SKIP', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Oring_END', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Gasket_Req', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Gasket_OK', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Gasket_NG', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_OK', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_NG', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_M_NOREAD', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_OK', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_NG', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_E_NOREAD', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_WORKCOMP', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_JIGALARM', nTemp), 0);
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_JIGMODE', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_TOTAL_END', nTemp), 0);

        FrmMelsecQ.SendCommand(FindAddr(0,'PC_RESET', nTemp), 0);

        DisplayTestStatus('RESET');
        btnReset.Enabled := True;
        TimerRun.Enabled := True;
        Exit;
    end;

    if (FrmMain.cmbModelList.Text = '') then
    begin
        Addlog('모델을 확인 해주세요.', True);
        TimerRun.Enabled := True;
        Exit;
    end;

    if (LED_Master.LedOn) or (FrmSetup.cbMaster.Checked) or (bMasterBarocde) then
    begin
        if not (lbMaster.Visible) then
        begin
            lbMaster.Visible := True;
            Addlog('마스터 모드 신호 ON');
        end;
    end else begin
        if (lbMaster.Visible) then
            lbMaster.Visible := False;
    end;


    if (LED_Oring_SKIP.LedOn) or (LED_PCOring_SKIP.LedOn) then begin
        LbOringPass.Visible := True;
    end else begin
        LbOringPass.Visible := False;
    end;

    if (LED_JIGMODE.LedOn) then
        lbJigCheck.Visible := True
    else
        lbJigCheck.Visible := False;

    if (bFirst) then
    begin
        OldJigNum := FrmMain.pnJIG.Caption;
        bFirst := False;
    end;

    FrmMain.pnJIG.Caption := FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0);

    if (OldJigNum <> FrmMain.pnJIG.Caption) and (not bFirst) then
    begin
        bJigChanged := True;
        bFirst := True;
        OldJigNum := FrmMain.pnJIG.Caption;
    end;


    CheckMaster();


    if (bRetryTest) and (Led_TotalEnd.LedOn) then
    begin
        AddLog(Format('RETRY END ON Serial : %s',[Edit_MotorSerial.Text]));

        if (LED_Master.LedOn) and (not LED_Oring_SKIP.LedOn) then begin
            gResult := (bOringResult and bScanResult[1]);
        end else begin
            gResult := (bCableResult and bOringResult and bGasketResult and bScanResult[1] and bScanResult[2]);
        end;

        if (bMasterBarocde) or (LED_JIGMODE.LedOn) then
        begin
            FindMasterBarcode(gBarcode[1],2);
            bUploadResult := True;
            Addlog('마스터 제품, Upload Pass');
        end else begin
            if UploadTRACE(gBarcode[1], gBarcode[2], Now, gResult) then
            begin
                Addlog('TRACE OK');
                bUploadResult :=True;
            end else
            begin
                Addlog('TRACE NG');
                bUploadResult :=False;
            end;
        end;
        Count_Fail.Value := Count_Fail.Value + 1;
        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_TOTAL_END', nTemp), 0);
        gtestMode := tmReady;
        bRetryTest := False;
        
        TimerRun.Enabled := True;
        exit;
    end;

    case gtestMode of
        tmReady : begin
            DisplayTestStatus('READY');
            Addlog('SCAN 요청신호 대기중',True);
            if (LED_Request.LedOn)  then
            begin
                bRetryTest := False;
                if (LED_JIGMODE.LedOn) then
                begin
                    pnSpec.Caption := Format('%s ~ %s',[FrmSetup.edtJigMin.Text, FrmSetup.edtJigMax.Text]);
                end else begin
                    pnSpec.Caption := Format('%s ~ %s',[FrmSetup.edtMin.Text, FrmSetup.edtMax.Text]);
                end;

                Init();
                bMasterBarocde := False;
                if (LED_Request.LedOn)     then Addlog('MOTOR SCAN Request ON', True)
                else if (LED_ECUreq.LedOn) then Addlog('ECU SCAN Request ON', True);
                DisplayTestStatus('RUNNING');
                gtestMode := tmRunning;
                TestIndex := 1;
            end;
        end;

        tmRunning : begin
            Case TestIndex of
                1 : begin
                    //-----------------------------------------------------------바코드 읽기 시퀀스---------------//
                    {BarcodeCount    :  초기값 : 0, 1이면 모터 바코드 스캔, 2면 ECU 바코드 스캔
                     BarcodTryCount  :  바코드 읽기시 데이터가 안들어올때 Trigger를 다시 날리는 횟수 초기값 : 0
                     nIndexFlag      :  바코드 스캐너 모듈에서 온전한 데이터가 들어왔을때 True, 아닐 경우 False
                                        트리거를 날린후에 True가 될때 까지 기다린다. 일정시간 기다린후 BarcodeTryCount Max값 이하면 Flag False시키고 Trigger를 다시날림.
                     bScanResult     :  Index 1 > Motor바코드 결과, Index 2 > Ecu바코드 결과  초기값 : False
                     gBarcode        :  바코드스캐너 모듈에서 온전한데이터가 CommRecevie 함수안에서 들어올경우 다이렉트로 값을 집어 넣어준다. GetBarcode함수는 Trigger만 날리는 용도로 사용,
                                        (GetBarCode함수 ....프레임 구성시에 While문 때문에 멈추는 버그등을 막기위해 수정.   While문 절때 살리시면안돼요. 구조상 Flag로 받게 되어있어서 살려도 무의미해요)
                                        Index 1 > Motor바코드, Index 2> ECU바코드
                    }
                    Addlog(Format(' %s SCAN BARCODE 대기중',[IfThen((BarcodeCount < 2) and (not bScanResult[1]),'MOTOR','ECU')]), True);
                    if (not LED_Request.LedOn) and (not LED_ECUreq.LedOn) then
                    begin
                        TimerRun.Enabled := True;
                        exit;
                    end;

                    case BarcodeCount of
                        0: begin
                            if (nBarcodeTryCount[1] = 0) and (not bIndexFlag[1]) then
                            begin
                                Inc(BarcodeCount);
                                bIndexFlag[1] := True;
                            end;
                        end;
                        1 : begin
                            if (nBarcodeTryCount[2] = 0) and (not bIndexFlag[2]) and (bScanResult[1]) then
                            begin
                                Inc(BarcodeCount);
                                bIndexFlag[2] := True;
                            end;
                        end;
                    end;

                    TempCB  := ZIniCheckBox(FrmSetup.FindComponent(Format('cbNoBarcode_%d',[BarcodeCount])));
                    bTemp := (TempCB.Checked) or (LED_JIGMODE.LedOn);

                    // barcode 무시
                    //(((FrmSetup.cbMasterEcuSkip.Checked )and lbMaster.Visible) AND (BarcodeCount = 2))  마스터제품에 ECU바코드가 없기 때문에
                    //Master테스트시 Ecu바코드 검사는 Pass처리한다.

                    if (bTemp) or ((FrmSetup.cbMasterEcuSkip.Checked ) and (lbMaster.Visible) AND (BarcodeCount = 2)) then
                    begin
                        if ((FrmSetup.cbMasterEcuSkip.Checked ) and (lbMaster.Visible) AND (BarcodeCount = 2)) then
                            Addlog('마스터 검사 Ecu바코드 Check Pass', True);
                            
                        gBarcode[BarcodeCount] := FormatDateTime('@YYYYMMDDHHNNSSZZZ', Now);

                        if (BarcodeCount = 1) then
                            Edit_MotorSerial.Text := gBarcode[BarcodeCount]
                        else
                            Edit_EcuSerial.Text := gBarcode[BarcodeCount];

                        AddLog(Format('%S BARCODE READ SKIP : [%s]',[IfThen((BarcodeCount = 1), 'MOTOR', 'ECU'), gBarcode[BarcodeCount]]), False);

                        bScanResult[BarcodeCount] := True;
                        if (BarcodeCount = 1) then
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_OK', nTemp), 1)
                        else if (BarcodeCount >= 2) then
                        begin
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_OK', nTemp), 1);
                        end;
                        TestIndex := 3;
                    end else begin
                        Inc(nBarcodeTryCount[BarcodeCount]);
                        fBarcodeCheck := GetTickCountEx();
                        FrmBarcode[BarcodeCount].GetBarcode;
                        TestIndex := 2;
                    end;
                end;
                2 : begin
                    if (BarcodeCount = 1) and (FindLineMasterBarcode(gBarcode[1])) then
                    begin
                        DisplayTestStatus('LINE MASTER 바코드 스캔 OK');
                        TestIndex := 1;
                        gResult := True;
                        bMasterBarocde := True;
                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_LINEMASTER_SCAN', nTemp), 1);
                        delayex(100, True);
                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_REQUEST', nTemp), 0);
                        gtestMode := tmReady;
                        TimerRun.Enabled := True;
                        Exit;
                    end;

                    if (GetTickCountEx() - fBarcodeCheck) <= 1500 then
                    begin
                        if (FrmBarcode[BarcodeCount].bFlag) then
                        begin

                            if (BarcodeCount = 1) then
                                bMasterBarocde := FindMasterBarcode(gBarcode[BarcodeCount],1);

                            bScanResult[BarcodeCount] := CheckBarcode(BarcodeCount);

                            if (BarcodeCount = 1) then
                                Edit_MotorSerial.Text := gBarcode[BarcodeCount]
                            else
                                Edit_EcuSerial.Text := gBarcode[BarcodeCount];



                            FrmBarcode[BarcodeCount].bFlag := False;

                            TestIndex := 3;
                        end;
                    end else begin

                        if (nBarcodeTryCount[BarcodeCount] >= 30) then
                        BEGIN
                            if (BarcodeCount = 1) then
                                Edit_MotorSerial.Text := gBarcode[BarcodeCount]
                            else
                                Edit_EcuSerial.Text := gBarcode[BarcodeCount];

                            if (BarcodeCount = 1) then
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_M_NG', nTemp), 1)
                            else
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_BCR_E_NG', nTemp), 1);
                            DisplayTestStatus('SCAN NG');
                            TestIndex := 3;
                        end else begin
                            TestIndex := 1;
                        end;
                    end;
                    //-----------------------------------------------------------바코드 읽기 시퀀스---------------//
                end;

                3 : begin
                    //TestIndex 1,2 에서 받은 결과를 받아 각 TestIndex로 분기한다.
                    if (bScanResult[1] and not bScanResult[2] and (BarcodeCount = 1)) then                             //MOTOR 바코드 Ok
                    begin
                        DisplayTestStatus('MOTOR 바코드 스캔 OK');
                        TestIndex := 4;
                    end else if (bScanResult[1] and bScanResult[2] and (BarcodeCount = 2)) then begin                  //MOTOR 바코드 Ok , ECU 바코드 OK
                        DisplayTestStatus('ECU 바코드 스캔 OK');
                        TestIndex := 7;
                    end else if ((not bScanResult[1]) and (not bScanResult[2]) and (BarcodeCount = 1)) then begin      //MOTOR 바코드 NG
                        DisplayTestStatus('모터 바코드 스캔 NG');
                        AddLog(Format('%S SCAN_NG, 이전 공정 불량 : [%s]',[IfThen((BarcodeCount = 1), 'MOTOR', 'ECU'), gBarcode[BarcodeCount]]), True);
                        gtestMode := tmReady;
                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_REQUEST', nTemp), 0);
                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_ECU_REQ', nTemp), 0);
                        TimerRun.Enabled := True;
                        exit;
                    end else if ((bScanResult[1]) and (not bScanResult[2]) and (BarcodeCount = 2)) then begin           //MOTOR 바코드 Ok , ECU 바코드 NG
                        //DisplayTestStatus('ECU 바코드 스캔 NG');
                        bRetryTest := False;
                        TestIndex := 7;
                    end;
                    FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_REQUEST', nTemp), 0);
                    FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_ECU_REQ', nTemp), 0);
                end;

                4 : begin

//                    if (not LED_Oring_SKIP.LedOn) then begin
                    if (not LbOringPass.Visible) and (not LED_JIGMODE.LedOn) then begin
                        Addlog('Oring Check 신호 대기중', True);
                        if (LED_Oring_ST.LedOn) then
                        begin
                            if (LED_Oring_OK.LedOn) or (LED_Oring_NG.LedOn) then
                            begin
                                if (LED_Oring_OK.LedOn) then
                                begin
                                    bOringResult := True;
                                    pnOring.Caption := 'OK';
                                    pnOring.Font.Color := clGreen;
                                    Addlog('PLC Oring Check Result OK', True);
                                    bRetryTest := False;
                                end else
                                begin
                                    pnOring.Caption := 'NG';
                                    pnOring.Font.Color := clRed;
                                    Addlog('PLC Oring Check Result NG', True);
                                    RestartIndex := TestIndex;
                                end;

                                if (bOringResult) then begin
                                    if (not LED_Master.LedOn) then begin
                                        TestIndex := 5;
                                    end else begin
                                        TestIndex := 7;
                                    end;
                                end else begin
                                    TestIndex := 7;
                                end;

                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_OK', nTemp), 0);
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_NG', nTemp), 0);
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Oring_END', nTemp), 1);
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Oring_Req', nTemp), 0);
                            end;
                        end;
                    end else begin
                        bOringResult := True;
                        pnOring.Caption := 'SKIP';
                        pnOring.Font.Color := clGreen;
                        Addlog('PLC Oring Check SKIP', True);
                        TestIndex := 5;
                    end;
                end;
//

                5 : begin
                    if (LED_JIGMODE.LedOn) then
                    begin
                        bCableResult := True;
                        pnCable.Caption := 'SKIP';
                        pnCable.Font.Color := clGreen;
                        Addlog('PLC Cable Check SKIP', True);
                        TestIndex := 6;
                        TimerRun.Enabled := True;
                        exit;
                    end;

                    Addlog(Format('모터와 %s ECU를 결합하여 주세요. Cable Check 신호 대기중',[FrmMain.gModelInfo.ModelName]), True);
                    if (LED_Vision_ST.LedOn) then
                    begin
                        if (LED_Vision_OK.LedOn) or (LED_Vision_NG.LedOn) then
                        begin
                            if (LED_Vision_OK.LedOn) then
                            begin
                                bCableResult := True;
                                pnCable.Caption := 'OK';
                                pnCable.Font.Color := clGreen;
                                Addlog('PLC Cable Check Result OK', True);
                                bRetryTest := False;
                                TestIndex := 6;
                            end else
                            begin
                                pnCable.Caption := 'NG';
                                pnCable.Font.Color := clRed;
                                RestartIndex := TestIndex;
                                Addlog('PLC Cable Check Result NG', True);

                                if (lbMaster.Visible) then
                                    TestIndex := 6
                                else
                                    TestIndex := 7;
                            end;

                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_VISION_OK', nTemp), 0);
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_VISION_NG', nTemp), 0);
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Vision_END', nTemp), 1);
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Vision_Req', nTemp), 0);
                        end;
                    end;
                end;
                6 : begin
                    Addlog('Gasket Check 신호 대기중', True);
                    if (LED_Gasket_ST.LedOn)  then
                    begin
                        FrmHeight.GetHeight();

                        if (LED_JIGMODE.LedOn) then
                        begin
                            sValue := FrmHeight.SetJIGResultValue();
                            fMin := StrToFloatDef( FrmSetup.edtJigMin.Text, 99999);
                            fMax := StrToFloatDef( FrmSetup.edtJigMax.Text, -99999);
                        end else begin
                            sValue := FrmHeight.SetResultValue(StrToIntDef(FrmMain.gModelInfo.PLCJigNum,0));
                            fMin := StrToFloatDef( FrmSetup.edtMin.Text, 99999);
                            fMax := StrToFloatDef( FrmSetup.edtMax.Text, -99999);
                        end;
                        Addlog(Format('HEIGHT DATA : [%s]',[sValue]), False);
                        sRdstr := sValue;
                        if (sValue <> '') then
                        begin
                            bGasketResult := True;

                            for i := 1 to 4 do
                            begin
                                fValue := 0;
                                sStr := '';
                                sStr := GetToken(sRdstr, ',');

                                fValue := StrtoFloatDef(sStr,-99999);
                                if (fMin <= fValue) and (fValue <= fMax) then
                                begin
                                    TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).Font.Color := clGreen;

                                end else begin
                                    TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).Font.Color := clRed;
                                    bGasketResult := False;
                                end;

                                TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).caption := sStr;
                            end;
                            //gResult := bGasketResult;
                            if (bGasketResult) then bRetryTest := False;
                        end else begin
                            Addlog('HEIGHT DATA  NO READ',True);
                        end;

                        if (bGasketResult) then
                        begin
                            Addlog('HEIGHT DATA OK',True);
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Gasket_OK', nTemp), 1);
                            TestIndex := 1; //ECU BARCODE READ

                            if (LED_JIGMODE.LedOn) then
                            begin
                                TestIndex := 7;
                                gBarcode[2] := 'SKIP';
                                Edit_EcuSerial.Text := gBarcode[2];
                                bScanResult[2] := True;
                            end;
                            
                        end else
                        begin
                            Addlog('HEIGHT DATA NG',True);
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Gasket_NG', nTemp), 1);
                            RestartIndex := TestIndex;
                            if (lbMaster.Visible) then
                                TestIndex := 1  //ECU BARCODE READ
                            else
                                TestIndex := 7; //END SAVE DATA AND UPLOAD AND RETEST

                            if (LED_JIGMODE.LedOn) then
                            begin
                                TestIndex := 7;
                                gBarcode[2] := 'SKIP';
                                Edit_EcuSerial.Text := gBarcode[2];
                                bScanResult[2] := True;
                            end;
                        end;

                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_Gasket_Req', nTemp), 0);
                        LED_Gasket_ST.LedOn := False;
                    end;
                end;

                7 : begin
                    //gResult := (bCableResult and bOringResult and bGasketResult and bScanResult[1] and bScanResult[2]);

                    if (LED_Master.LedOn) and (not LED_Oring_SKIP.LedOn) then begin
                        gResult := (bOringResult and bScanResult[1]);
                    end else begin
                        gResult := (bCableResult and bOringResult and bGasketResult and bScanResult[1] and bScanResult[2]);
                    end;

                    if ((not bCableResult) or (not bOringResult) or (not bGasketResult))then
                        bRetryTest := True;
                        
                    if (bMasterBarocde) or (LED_JIGMODE.LedOn) or (LED_Master.LedOn) then
                    begin
                        FindMasterBarcode(gBarcode[1],2);
                        bUploadResult := True;
                        Addlog('마스터 제품, Upload Pass');
                    end else begin
                        if (not bRetryTest) and (not LED_Master.LedOn)then
                        begin                    // 양품일때만 바로올리고 NG시 Retry로 간주하여
                            if UploadTRACE(gBarcode[1], gBarcode[2], Now, gResult) then
                            begin
                                Addlog('TRACE OK');
                                bUploadResult :=True;
                            end else
                            begin
                                Addlog('TRACE NG');
                                bUploadResult :=False;
                            end;
                        end;
                    end;


                    if (gResult) and (bUploadResult) then begin
                        pnResult.Font.Color := clGreen;
                        pnResult.Caption := 'OK';
                        DisplayTestStatus('OK');
                        Count_Pass.Value := Count_Pass.Value + 1;
                    end else begin
                        DisplayTestStatus('NG');
                        pnResult.Font.Color := clRed;
                        pnResult.Caption := 'NG';
                        //Count_Fail.Value := Count_Fail.Value + 1;
                    end;

                    Addlog(Format('Serial : [%s], CABLE : [%S], ORING : [%S], HEIGHT : [%S]',[gBarcode[1], pnCable.Caption, pnOring.Caption, IfThen(bGasketResult, 'OK', 'NG') ]));
                    AddGrid(gBarcode[1], gBarcode[2], pnResult.Caption);
                    SaveData(Now, gBarcode[1], pnResult.Caption);

                    //검사 항목중에NG가 날경우 제품을 빼내서Reset할때까지 재태스트를 시행한다.
                    if ((gResult) and bCableResult and bOringResult and bGasketResult) or (LED_Master.LedOn) or (LED_JIGMODE.LedOn) then
                        gtestMode := tmReady
                    else begin
                        TestIndex  := RestartIndex;
                        bRetryTest := True;
                    end;

                    //bMasterBarocde := False;
                    FrmMelsecQ.SendCommand(FindAddr(nStation,'PLC_REQUEST', nTemp), 0);
                    FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_WORKCOMP', nTemp), 1);
                end;
            end;
        end;// end of case TestIndex of
    end; // end of case gtestMode of
    TimerRun.Enabled := not gClose;

end;


procedure TFrmeMotorEcu.AddGrid(sMotorSerial, sEcuSerial, sResult : String);
var
    aColor : TColor;
    nRowCount, i : integer;
begin
    if (GridList.RowCount > 101) then
        GridList.RemoveRows(1, 1);

    if (sResult = 'GOOD') or (sResult = 'SKIP') or (sResult = 'PASS') or (sResult = 'OK') then
        aColor := clGreen
    else
        aColor := clRed;

    with GridList do
    begin
        if cells[1, RowCount -1] <> '' then
            RowCount := RowCount + 1;

        nRowCount := RowCount;

        AutoNumberCol(0);

        cells[1, nRowCount -1] := sMotorSerial;
        cells[2, nRowCount -1] := sEcuSerial;
        cells[3, nRowCount -1] := pnOring.Caption;
        FontColors[3, nRowCount -1] := pnOring.Font.Color;
        cells[4, nRowCount -1] := pnCable.Caption;
        FontColors[4, nRowCount -1] := pnCable.Font.Color;

        for i := 1 to (HEIGHTCOUNT) do
        begin
            FontColors[5 + i -1, nRowCount -1] := TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).Font.Color;
            cells[5 + i -1, nRowCount -1]  := TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).caption;
        end;

        cells[9, nRowCount -1] := FormatDateTime('HH:NN:SS', Now);
        cells[10, nRowCount -1] := pnResult.Caption;

        FontColors[10, nRowCount -1] := aColor;
        FontStyles[10, nRowCount -1] := [fsBold];
        GridList.FocusCell(1,nRowCount-1);
    end;
end;



function TFrmeMotorEcu.SetMessage(Param : string; aFontColor : TColor) : Boolean;
begin
    Result := False;
    lbMessage.Caption := Param;
    lbMessage.Font.Color := aFontColor;
    Result := True;
end;

function TFrmeMotorEcu.Addlog(Param : String; bSetMsg : Boolean): Boolean;

var
    sTemp, sTemp1, fileName : string;
begin
    fileName := GetAppDir('LOG') + 'MOTOR_ECU\' + FormatDateTime('YY-MM', Now) + '\Debug' +
                FormatDateTime('YYMMDD', Now) + '.txt';

    Result := False;

    sTemp := Param;
    if sTemp = gPastMessge then exit;

    gPastMessge := sTemp;

    sTemp1 := ReplaceStr(stemp,CRLF,' ');
    if bSetMsg then
        SetMessage(sTemp1,clRed);

    if MemoLog.Lines.Count > 1000 then
        MemoLog.Lines.Delete(0);

    ReplaceStr(sTemp,CRLF,'');

    sTemp := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + ' >> ' + sTemp;
    MemoLog.Lines.Add(sTemp);

    WriteDebugStr(Param, fileName);

    Result := True;
end;

procedure TFrmeMotorEcu.DisplayTestStatus(Param : String);
var
    Str, RdStr : string;
begin
    if (lbStatus.Caption = PARAM) then exit;

    Param := UpperCase(Param);

    RdStr := '';
    Str := '';
    with pnLamp do
    begin
        if Pos('NONE',Param) > 0 then
        begin
            ColorFace := clBlack;
            ColorGrad := clGray;
        end else if Pos('READY',Param) > 0 then begin
            ColorFace := clGreen;
            ColorGrad := $0000DD00;
        end else if (Pos('RESET',Param) > 0) then begin
            ColorFace := clGray;
            ColorGrad := clSilver;
        end else if Pos('RUNNING',Param) > 0 then begin
            ColorFace := clBlue;
            ColorGrad := $00FF6666;
        end else if (Pos('PACK',Param) > 0) or (Pos('OK', Param) > 0) or (Pos('PASS', Param) > 0) then begin
            ColorFace := clLime;
            ColorGrad := $0059FF59;
        end else if (Pos('FAIL',Param) > 0) or (Pos('STOP',Param) > 0) or (Pos('NG',Param) > 0) or (Pos('MASTER 검사 요청',Param) > 0)  then begin 
            ColorFace := clRed;
            ColorGrad :=$004646FF;
        end;

        lbStatus.Caption := Param ;
    end;
end;


procedure TFrmeMotorEcu.SpeedButton1Click(Sender: TObject);
begin
    Count_Pass.Value := 0;
end;

procedure TFrmeMotorEcu.SpeedButton2Click(Sender: TObject);
begin
    Count_Fail.Value := 0;
end;


procedure TFrmeMotorEcu.LED_RequestClick(Sender: TObject);
begin

    (Sender as TLed).LedOn := not (Sender as TLed).LedOn;
end;

procedure TFrmeMotorEcu.XiButton1Click(Sender: TObject);
begin
    FrmMain.bPause := True;
    ListOption[nStation].ShowModal;
    FrmMain.bPause := False;
end;


procedure TFrmeMotorEcu.XiPanel2Click(Sender: TObject);
begin
//    ShowMessage(Format('H : %d  W : %d', [Height, Width]));
end;

procedure TFrmeMotorEcu.BtnPcbScanClick(Sender: TObject);
begin
    Edit_MotorSerial.Text := FrmBarcode[1].GetBarcode();
end;

procedure TFrmeMotorEcu.XiButton2Click(Sender: TObject);
begin
    Edit_EcuSerial.Text := FrmBarcode[2].GetBarcode();
end;

procedure TFrmeMotorEcu.XiPanel2DblClick(Sender: TObject);
begin
    cbDebug.Visible := NOT cbDebug.Visible;
end;

function TFrmeMotorEcu.UploadTRACE(sMotorBarcode, sECUBarcode : string; nTestTime : TdateTime; aResult : Boolean) : Boolean;
var
    TempCB : ZIniCheckBox;
    pNo, aBarcode : string;
    nRet, nRet1, nRet2, nRet3, nITEMCOUNT : integer;
begin
    Result := False;

    pNo        := TRACE[nStation].Ed_Station.Text;
    aBarcode   := sMotorBarcode;
    nITEMCOUNT := 6;

    //--------------------------------------------------MES 체크
    TempCB  := ZIniCheckBox(FrmSetup.FindComponent(Format('cbMesUse_%d',[nStation])));
    if (TempCB.Checked) and (not lbMaster.Visible) then
    begin
        if (bScanResult[2]) then
        begin
            nRet1 := TRACE[nStation].SetAttributeForSN(pNo, aBarcode, 'ECU_BARCODE', sECUBarcode);
            AddLog(Format('SetAttributeForSN : %s',[GetErrorString(nRet1)]));
            FrmMain.WritePCAlive();
        end;

        if (nRet1 = 0) then
        begin

            nRet := TRACE[nStation].UploadStateAndResult(pNo
                                                         , aBarcode
                                                         , IfThen(aResult,'1','0')
                                                         , MakeDataList(aResult)
                                                         , nTestTime
                                                         , 0
                                                         , nITEMCOUNT);
            AddLog(Format('UploadStateAndResult : %s',[GetErrorString(nRet)]));
            FrmMain.WritePCAlive();

            if (nRet = 0) then
            begin
                 if (FrmSetup.cbItacUse.Checked) AND (FrmMain.gModelInfo.ITACUPLOAD) then
                 begin
                     FrmMain.WritePCAlive();
                     nRet3 := FrmItac.UploadState(sEcuBarcode, aResult);
                     AddLog(Format('ITAC UploadState : %s',[GetErrorString(nRet3)]));
                     FrmMain.WritePCAlive();
                     if (nRet3 = 0) then Result := True;
                 end else begin
                    AddLog(Format('[%s] : UPLOAD OK',[sMotorBarcode]));
                    FrmMain.WritePCAlive();
                    Result := True;
                 end;
            end;
        end;
    end else
        Result := True;

end;

function TFrmeMotorEcu.MakeDataList(aResult : Boolean): string;
var
    sTemp : string;
    i : integer;
begin
    sTemp := '';

    sTemp := Format('MOTOR_ECU;Oring CHECK;3;OK;;;%s;;%s|',[IfThen(bOringResult,'OK','NG'), IfThen(bOringResult,'1','0')]);
    sTemp := sTEMP + Format('MOTOR_ECU;Cable CHECK;3;OK;;;%s;;%s|',[IfThen(bCableResult,'OK','NG'), IfThen(bCableResult,'1','0')]);
    for i := 1 to 4 do
    begin
        sTEMP := sTEMP + Format('MOTOR_ECU;Gasket#%d;0;%s;%s;%s;%s;;%s|',[i
                                                                        , pnSpec.Caption
                                                                        , FrmSetup.edtMin.Text
                                                                        , FrmSetup.edtMax.Text
                                                                        , TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).Caption
                                                                        , IfThen((TPanel(Self.FindComponent(Format('pnResult_%d',[i]))).Font.Color = clGreen),'1','0')]);

    end;
    Result := sTemp;
end;

procedure TFrmeMotorEcu.btnResetClick(Sender: TObject);
begin
    btnReset.Enabled := False;
end;

procedure TFrmeMotorEcu.Init();
var
    i : integer;
begin
    fMotorEcuTimeOut := 0;
    pnResult.Font.Color := clWhite;
    pnResult.Caption := '---';
    pnCable.Font.Color := clWhite;
    pnCable.Caption := '---';
    pnOring.Font.Color := clWhite;
    pnOring.Caption := '---';
    pnResult_1.Font.Color := clBlack;
    pnResult_1.Caption := '---';
    pnResult_2.Font.Color := clBlack;
    pnResult_2.Caption := '---';
    pnResult_3.Font.Color := clBlack;
    pnResult_3.Caption := '---';
    pnResult_4.Font.Color := clBlack;
    pnResult_4.Caption := '---';
    Edit_MotorSerial.Text := '';
    Edit_EcuSerial.Text := '';
    for i := 1 to 2 do
    begin
        gBarcode[i] := 'NOREAD';
        nBarcodeTryCount[i] := 0;
        gBarcodeFlag[i] := False;
        bScanResult[i] := False;
        bIndexFlag[i] := False;
    end;
    bCableResult := False;
    bOringResult := False;
    bGasketResult := False;
    gResult := False;

    fBarcodeCheck := 0;
    BarcodeCount := 0;
    VisionCount := 0;
    RestartIndex := 0;
end;

function TFrmeMotorEcu.CheckMaster(): Boolean;
var
    MasterTime : TdateTime;
    nTemp, c, r : integer;
    aTime1, aTime2, aTime3, aTime4, aTime5, aTime6 : TDateTime;
    sTemP : string;
    sRdStr, Str : String;
    tempTime : Ttime;
    Mode : integer;
    sTemp1 : string;

    function CheckTryBarcode() : Boolean;
    var
        c,r : integer;
        bUse, bState : Boolean;
    begin
        Result := True;
        with FrmSetup.GridMaster do
        begin
            for r := 1 to RowCount-1 do
            begin
                GetCheckBoxState(0,r, bUse);
                if (bUse) then
                begin
                    GetCheckBoxState(4,r, bState);
                    if (not bState) then Result := False;
                end;
            end;
        end;
    end;
begin
    if (not FrmSetup.cbMasteralarm.Checked) then
    begin
        Result := True;
        exit;
    end;
    
    if (gtestMode = tmReady) then
    begin
        if (FrmSetup.cbDayUse.Checked) OR (FrmSetup.cbNightUse.Checked) then
        begin
            FrmSetup.DateTimePicker1.Date := Now;
            FrmSetup.DateTimePicker2.Date := Now;
            FrmSetup.DateTimePicker3.Date := Now;
            FrmSetup.DateTimePicker4.Date := Now;

            aTime1 :=  FrmSetup.DateTimePicker1.Time;
            aTime2 :=  FrmSetup.DateTimePicker2.Time;
            aTime4 :=  FrmSetup.DateTimePicker3.Time;
            aTime5 :=  FrmSetup.DateTimePicker4.Time;

            aTime3 :=  Now;
            if ((aTime1 <= aTime3) and (aTime3 <= aTime2)  and (FrmSetup.cbDayUse.Checked)  ) or
               ((aTime4 <= aTime3) and (aTime3 <= aTime5) and (FrmSetup.cbNightUse.Checked)) then
            begin
                if ((aTime1 <= aTime3) and (aTime3 <= aTime2)  and (FrmSetup.cbDayUse.Checked)) then
                begin  //주간 모드
                    Mode := 1;
                    if (edtDayHis.Text = Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')])) then
                    begin
                        if (FrmSetup.cbReMasterMode.Checked) and (bJigChanged) then
                        begin
                            //주간 시간에 마스터 검사를 했더라도, PLC모델이 바뀌면 재검사 할 지 안할지.
                            edtDayHis.Text := '';
                            bJigChanged := False;
                            exit;
                        end;
                        Inc(DayIndex);
                        gbMasterResult := True;
                    end else begin
                        if (not gbStartMaster) then
                        begin
                            DayIndex := 0;
                            gbMasterResult := False;
                        end;
                    end;
                end else

                if ((aTime4 <= aTime3) and (aTime3 <= aTime5) and (FrmSetup.cbNightUse.Checked)) then //야간 모드
                begin
                    Mode := 2;
                    if (edtNightHis.Text =  Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')])) then
                    begin
                        if (FrmSetup.cbReMasterMode.Checked) and (bJigChanged) then
                        begin
                            //주간 시간에 마스터 검사를 했더라도, PLC모델이 바뀌면 재검사 할 지 안할지.
                            edtNightHis.Text := '';
                            bJigChanged := False;
                            exit;
                        end;
                        Inc(DayIndex);
                        gbMasterResult := True;
                    end else begin
                        if (not gbStartMaster) then
                        begin
                            DayIndex := 0;
                            gbMasterResult := False;
                        end;
                    end;
                end;

                Inc(DayIndex);
                case DayIndex of
                    1 : begin
                        if (not ExistJigMaster()) then
                        begin
                            Addlog('현재 설정 되어있는 JIG모델로 설정되어있는 마스터 제품이 없어 마스터 검사를 Pass합니다.',True);
                            DelayEx(1000, True);
                            gbMasterResult := True;
                            Inc(DayIndex);
                            if (Mode = 1) then
                            begin
                                edtDayHis.Text   :=  Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')]);
                                Addlog(edtDayHis.Text);
                            end;
                            if (Mode = 2) then
                            begin
                                edtNightHis.Text :=  Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')]);
                                Addlog(edtNightHis.Text);
                            end;
                            exit;
                        end;
                        
                        gbStartMaster := True;
                        for r:= 0 to FrmSetup.GridMaster.RowCount-1 do
                            FrmSetup.GridMaster.SetCheckBoxState(4, r, False);
                        //FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_MASTER_ALARM', nTemp), 1);
                        Addlog('마스터 검사 시간 : 등록되어있는 마스터제품을 검사하세요', True);
                        DisplayTestStatus('MASTER 검사 요청');
                        DelayEx(1000,True);
                        Result := False;
                        XiPanel2.ColorGrad := clYellow;
                        FrmAlret.plMessage.Caption := IfThen((Mode = 1), '마스터 주간 검사시간', '마스터 야간 검사시간');
                        FrmAlret.Show;
                        fStartTime := GetTickCountEx();
                    end;
                    else begin
                        if (gbMasterResult) then
                        begin
                            DayIndex := 0;
                        end else begin
                            fStopTime := StrToIntDef( FrmSetup.edtStopTime.Text, 60);
                            
                            if ((GetTickCountEx() - fStartTime) > fStopTime * 60000) then
                            begin
                                if (FrmSetup.cbStopTimeUse.Checked) then
                                    FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_STOP', nTemp), 1);
                            end;
                        end;
                    end;
                end;

                if CheckTryBarcode() then
                begin
                    if (Mode = 1) then
                    begin
                        sTemp1 := Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')]);

                        if (sTemP1 <> edtDayHis.Text) then
                        begin
                            edtDayHis.text := sTemP1;
                            Addlog(edtDayHis.Text);
                        end;
                    end;
                    if (Mode = 2) then
                    begin
                        sTemp1 := Format('%s %s Master OK', [FormatDateTime('YYYY-MM-DD', Now) ,IfThen((Mode = 1),'주간','야간')]);
                        if (sTemP1 <> edtNightHis.Text) then
                        begin
                            edtNightHis.text := sTemP1;
                            Addlog(edtNightHis.Text);
                        end;
                    end;
                    if (FrmSetup.cbStopTimeUse.Checked) then
                        FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_STOP', nTemp), 0);

                    gbMasterResult := True;
                    XiPanel2.ColorGrad := $00974B00;
                    gbStartMaster := False;
                    FrmAlret.Close;
                end;
            end else begin
                if (gbMasterResult) then
                    DayIndex := 0;
            end;
        end;

        if CheckTryBarcode() then
        begin
            gbMasterResult := True;
            XiPanel2.ColorGrad := $00974B00;
            gbStartMaster := False;
            FrmAlret.Close;
        end;
    end;
    Result := (not gbStartMaster);
end;

function TFrmeMotorEcu.FindMasterBarcode(Serial: string; Mode : integer): Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    nTemp : integer;
begin
    Result := False;
    with FrmSetup.GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
            if (bUse) then
            begin
                if (Serial = Cells[1, r]) AND ((FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0)) = Cells[3, r]) then
                begin
                    Case Mode of
                        1 : begin //바코드 읽은 직후
                            //PLC지그번호가 맡는지 확인, 맞으면 PartNumber를 받아 모델변경 아니면 테스트 정지
                            GetModelInfo(GetModelName( Cells[2, r]), FrmMain.gModelInfo);
                            Addlog(Format('Master Model Change : [%s]',[FrmMain.gModelInfo.ModelCode]), True);
                            Addlog(Format('MasterBarocde Check OK : [%s]',[Serial]), True);
                            FrmMain.cmbModelList.Text := FrmMain.gModelInfo.ModelName + '/' + FrmMain.gModelInfo.ModelCode;
                            FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_MASTER', nTemp), 1);
                            LED_Master.LedOn := True;
                            lbMaster.Visible := True;

                            if (Trim(Cells[5, r]) = 'O') then
                            begin
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Oring_SKIP', nTemp), 1);
                                LED_PCOring_SKIP.LedOn := True;
                                LbOringPass.Visible := True;
                            end else begin //PC_Oring_Check
                                FrmMelsecQ.SendCommand(FindAddr(nStation,'PC_Oring_Check', nTemp), 1);
                            end;
                        end;
                        2 : begin //마스터 바코드 체크 확인.
                            SetCheckBoxState(4,r, True);
                            Addlog(Format('Serial : [%s], Model : [%s], JIG : [%s] Master Check OK',[Serial, FrmMain.gModelInfo.ModelName, FrmMain.gModelInfo.PLCJigNum ]))
                        end;
                    end;
                    Result := True;
                end;
            end;
        end;
    end;
end;

function TFrmeMotorEcu.ExistJigMaster(): Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    nTemp : integer;
begin
    Result := False;
    with FrmSetup.GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
            if (bUse) and ((FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0)) = Cells[3, r]) then
            begin
                if ('' <> Cells[1, r])then
                begin
                    Result := True;
                end;
            end;
        end;
    end;
end;

function TFrmeMotorEcu.FindLineMasterBarcode(Serial: string): Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    nTemp : integer;
begin
    Result := False;
    with FrmSetup.GridLoad do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
            if (bUse) then
            begin
                if (Serial = Cells[1, r]) then
                begin
                    Addlog(Format('MasterBarocde Check OK : [%s]',[Serial]), True);
                    Result := True;
                end;
            end;
        end;
    end;
end;




end.

