
program KMITester;

uses
  Forms,
  Windows,
  FormAbout in 'FormAbout.pas' {FrmAbout},
  FormBuff in 'FormBuff.pas' {FrmBuff},
  FormCalcCP in 'DataView\FormCalcCP.pas' {FrmCalcCP},
  FormCANCom in 'Hardware\CANCommon\FormCANCom.pas' {FrmCANCom},
  FormCANMonitor in 'Hardware\CANCommon\CanMonitor\FormCANMonitor.pas' {FrmCANMonitor},
  FormCanMsg in 'Hardware\CANCommon\CanMonitor\FormCanMsg.pas' {FrmCanMsg},
  FormChangePassword in 'Hardware\FormChangePassword.pas' {FrmChangePassword},
  FormChartParam in 'Simulator\FormChartParam.pas' {FrmChartParam},
  FormCpViewer in 'DataView\FormCpViewer.pas' {FrmCpViwer},
  FormData in 'FormData.pas' {FrmData},
  FormDesigner in 'Simulator\FormDesigner.pas' {FrmDesigner},
  FormHwTest in 'FormHwTest.pas' {FrmHwTest},
  FormInput in 'FormInput.pas' {FrmInput},
  FormKMIComm in 'Hardware\KMICOMM\FormKMIComm.pas' {FrmKMIComm},
  FormLog in 'FormLog.pas' {FrmLog},
  FormMain in 'FormMain.pas' {FrmMain},
  FormMeasItem in 'StepEdit\FormMeasItem.pas' {FrmMeasItem},
  FormMessage in 'FormMessage.pas' {FrmMessage},
  FormOption in 'Simulator\FormOption.pas' {FrmOption},
  FormParam in 'StepEdit\FormParam.pas' {FrmParam},
  FormPassword in 'Hardware\FormPassword.pas' {FrmPassword},
  FormReport in 'DataView\FormReport.pas' {FrmReport},
  FormResEdit in 'StepEdit\FormResEdit.pas' {FrmResEdit},
  FormResource in 'Simulator\FormResource.pas' {FrmResouce},
  FormSelInput in 'StepEdit\FormSelInput.pas' {FrmSelInput},
  FormSensorModel in 'Table\FormSensorModel.pas' {FrmSensorModel},
  FormSensorTable in 'Table\FormSensorTable.pas' {FrmSensorTable},
  FormSheet in 'DataView\FormSheet.pas' {FrmSheet},
  FormTestOption in 'FormTestOption.pas' {FrmTestOption},
  FormStepEdit in 'StepEdit\FormStepEdit.pas' {FrmStepEdit},
  FormStepOption in 'StepEdit\FormStepOption.pas' {FrmStepOption},
  FrameCaninfo in 'Hardware\CANCommon\CanMonitor\FrameCaninfo.pas' {FrCanInfo: TFrame},
  Global in 'Global.pas',
  uCanDBC in 'Hardware\CANCommon\uCanDBC.pas' {CanDBCImage: TDataModule},
  uCanKMI in 'Hardware\CANCommon\uCanKMI.pas',
  uCanUnit in 'Hardware\CANCommon\uCanUnit.pas',
  uCanVector in 'Hardware\CANCommon\uCanVector.pas',
  uImage in 'Hardware\CANCommon\CanMonitor\uImage.pas' {uImg: TDataModule},
  UnitImage in 'UnitImage.pas' {ImageModule: TDataModule},
  UnitThreadChart in 'Simulator\UnitThreadChart.pas',
  UnitThreadDisplay in 'Simulator\UnitThreadDisplay.pas',
  vxlapi in 'Hardware\CANCommon\vxlapi.pas',
  Form7555 in 'Hardware\7555\Form7555.pas' {Frm7555},
  FormTDKLambda in 'Hardware\TDK_Lambda\FormTDKLambda.pas' {FrmTDKLamda},
  FormFC100 in 'Hardware\FC100\FormFC100.pas' {FrmFC110},
  FormDevice in 'Hardware\FormDevice.pas' {FrmDevice},
  FormEditModel in 'StepEdit\FormEditModel.pas' {FrmEditModel},
  FormNIhardware in 'Hardware\NI_HARDWARE\FormNIhardware.pas' {FrmNI_Hardware},
  NiDAQmxf in 'Hardware\NI_HARDWARE\NiDAQmxf.pas',
  FormKeyTable in 'FormKeyTable.pas' {FrmKeyTable},
  FormCanDiag in 'Hardware\CANCommon\CanDiag\FormCanDiag.pas' {FrmCanDiag},
  uCanDiag in 'Hardware\CANCommon\CanDiag\uCanDiag.pas',
  FormGraph in 'GRAPH\FormGraph.pas' {FrmGraph},
  FormSetGraph in 'GRAPH\FormSetGraph.pas' {FrmSetGraph},
  UnitGraph in 'GRAPH\UnitGraph.pas',
  FormSelModel in 'FormSelModel.pas' {FrmSelModel},
  FormPatternGen in 'Hardware\PatternGEN\FormPatternGen.pas' {FrmPatternGen},
  FormBarcode in 'FormBarcode.pas' {FrmBarcode},
  FormCANEmul in 'Hardware\CanTxEmul\FormCANEmul.pas' {FrmCANEmul},
  FormWSS in 'Hardware\WSS\FormWSS.pas' {FrmWSS},
  FormUDPComm in 'UDPComm\FormUDPComm.pas' {FrmUDPComm},
  FormTRClient in 'TRACE CLIENT\FormTRClient.pas' {FrmTRClient},
  FormTempSensor in 'Hardware\TempSensor\FormTempSensor.pas' {FrmTempSensor},
  ewMII in 'ITAC\ewMII.pas',
  FormItac in 'ITAC\FormItac.pas' {FrmItac},
  FormXantrex in 'Hardware\XANTREX\FormXantrex.pas' {FrmXantrex},
  FormPWM in 'Hardware\MDPS_PWM\FormPWM.pas' {FrmKMIPWM},
  uKMIComm in 'Hardware\MDPS_PWM\uKMIComm.pas',
  FormAlret in 'Simulator\FormAlret.pas' {FrmAlret},
  FormKMISent in 'FormKMISent.pas' {FrmKMISent},
  FormTable in 'Hardware\FormTable.pas' {FrmTable},
  PassWord in 'PassWord.pas' {FrmPW},
  FormMBCOPWM in 'FormMBCOPWM.pas' {FrmKMIMBCOPWM},
  FormADBuff in 'Hardware\KMI CONTROL V.2.0\FormADBuff.pas' {FrmADBuff},
  FormHWLog in 'Hardware\KMI CONTROL V.2.0\FormHWLog.pas' {FrmHWLog},
  FormHWMain in 'Hardware\KMI CONTROL V.2.0\FormHWMain.pas' {FrmHWMain},
  FormIOScale in 'Hardware\KMI CONTROL V.2.0\FormIOScale.pas' {FrmIOScale},
  FormTest in 'Hardware\KMI CONTROL V.2.0\FormTest.pas' {Form1},
  HWGlobal in 'Hardware\KMI CONTROL V.2.0\HWGlobal.pas',
  uEthernetAD in 'Hardware\KMI CONTROL V.2.0\uEthernetAD.pas',
  uSocketKMI in 'Hardware\KMI CONTROL V.2.0\uSocketKMI.pas',
  uStation in 'Hardware\KMI CONTROL V.2.0\uStation.pas',
  FormMelsecQ in 'Hardware\MelSec-Q\FormMelsecQ.pas' {FrmMelsecQ},
  FormWT330 in 'Hardware\WT330\FormWT330.pas' {FrmWT330},
  FormSorensen in 'Hardware\Sorensen(DCS20-150E)\FormSorensen.pas' {FrmSorensen},
  FormLN300AG6 in 'Hardware\LN-300A-G6_GPIBver\FormLN300AG6.pas' {FrmLN300AG6},
  FormStepToMemo in 'StepEdit\FormStepToMemo.pas' {FrmStepToMemo},
  FormMasterMode in 'Mastermode\FormMasterMode.pas' {FrmMasterMode},
  FormMaterAlret in 'Mastermode\FormMaterAlret.pas' {FrmMasterAlret},
  FrameMView in 'Mastermode\FrameMView.pas' {FrmMView: TFrame},
  FrameMasterMenu in 'Mastermode\FrameMasterMenu.pas' {FrmMMenu: TFrame},
  FormLMSedit in 'LMS\FormLMSedit.pas' {FrmLMSedit};

{$R *.res}

var
  Mutex : THandle;

    begin
    Mutex := CreateMutex(nil, True, 'KMISIMULATOR');
    if (Mutex <> 0 ) and (GetLastError = 0) then
    begin
        Application.Initialize;
        Application.Title := '시뮬레이터';
        Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmHwTest, FrmHwTest);
  Application.CreateForm(TFrmItac, FrmItac);
  Application.CreateForm(TFrmKeyTable, FrmKeyTable);
  Application.CreateForm(TFrmNI_Hardware, FrmNI_Hardware);
  Application.CreateForm(TFrmInput, FrmInput);
  Application.CreateForm(TFrmStepEdit, FrmStepEdit);
  Application.CreateForm(TFrmStepOption, FrmStepOption);
  Application.CreateForm(TFrmSelInput, FrmSelInput);
  Application.CreateForm(TFrmMeasItem, FrmMeasItem);
  Application.CreateForm(TFrmResEdit, FrmResEdit);
  Application.CreateForm(TFrmTestOption, FrmTestOption);
  Application.CreateForm(TImageModule, ImageModule);
  Application.CreateForm(TFrmBuff, FrmBuff);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmKMIComm, FrmKMIComm);
  Application.CreateForm(TFrmCalcCP, FrmCalcCP);
  Application.CreateForm(TFrmCpViwer, FrmCpViwer);
  Application.CreateForm(TFrmReport, FrmReport);
  Application.CreateForm(TFrmSheet, FrmSheet);
  Application.CreateForm(TFrmChangePassword, FrmChangePassword);
  Application.CreateForm(TFrmPassword, FrmPassword);
  Application.CreateForm(TFrmOption, FrmOption);
  Application.CreateForm(TFrmResouce, FrmResouce);
  Application.CreateForm(TFrmChartParam, FrmChartParam);
  Application.CreateForm(TCanDBCImage, CanDBCImage);
  Application.CreateForm(TuImg, uImg);
  Application.CreateForm(TFrmHWMain, FrmHWMain);
  Application.CreateForm(TFrmSensorTable, FrmSensorTable);
  Application.CreateForm(TFrmDevice, FrmDevice);
  Application.CreateForm(TFrmEditModel, FrmEditModel);
  Application.CreateForm(TFrmSetGraph, FrmSetGraph);
  Application.CreateForm(TFrmSelModel, FrmSelModel);
  Application.CreateForm(TFrmCANEmul, FrmCANEmul);
  Application.CreateForm(TFrmUDPComm, FrmUDPComm);
  Application.CreateForm(TFrmAlret, FrmAlret);
  Application.CreateForm(TFrmTable, FrmTable);
  Application.CreateForm(TFrmADBuff, FrmADBuff);
  Application.CreateForm(TFrmHWLog, FrmHWLog);
  Application.CreateForm(TFrmIOScale, FrmIOScale);
  Application.CreateForm(TFrmMelsecQ, FrmMelsecQ);
  Application.CreateForm(TFrmStepToMemo, FrmStepToMemo);
  Application.CreateForm(TFrmMasterMode, FrmMasterMode);
  Application.CreateForm(TFrmMasterAlret, FrmMasterAlret);
  Application.CreateForm(TFrmLMSedit, FrmLMSedit);
  Application.Run;
        if Mutex <> 0 then CloseHandle(Mutex);
    end else
        Application.MessageBox('프로그램이 이미 실행중입니다.',
            'INFOMATION', MB_OK or MB_ICONWARNING);
end.
