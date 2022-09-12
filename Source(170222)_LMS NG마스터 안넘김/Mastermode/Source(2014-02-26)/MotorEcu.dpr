program MotorEcu;

uses
  Forms,
  Windows,
  FormMain in 'FormMain.pas' {FrmMain},
  FormMainStatus in 'FormMainStatus.pas' {FrmMainStatus},
  Global in 'TraceClient\SOURCE\Global.pas',
  FormMelsecQ in 'MelSec-Q\FormMelsecQ.pas' {FrmMelsecQ},
  FormPLCoption in 'FormPLCoption.pas' {FrmPLCoption},
  FrameMotorEcu in 'Frame\FrameMotorEcu.pas' {FrmeMotorEcu: TFrame},
  FormTerminate in 'TerminateProcess\FormTerminate.pas' {FrmTerminate},
  FormBarcode in 'Barcode\FormBarcode.pas' {FrmBarcode},
  FormEditModel in 'FormEditModel.pas' {FrmEditModel},
  ewMII in 'ITAC\ewMII.pas',
  FormTraceClient in 'TraceClient\SOURCE\FormTraceClient.pas' {FrmTraceClient},
  FormSetup in 'FormSetup.pas' {FrmSetup},
  FormItac in 'ITAC\FormItac.pas' {FrmItac},
  FormHeight in 'HEIGHT\FormHeight.pas' {FrmHeight},
  PassWord in 'PassWord.pas' {FrmPW},
  FormAlret in 'FormAlret.pas' {FrmAlret};

{$R *.res}

var
  Mutex : THandle;
begin
    Mutex := CreateMutex(nil, True, 'EPCUTester');
    if (Mutex <> 0 ) and (GetLastError = 0) then
    begin
        Application.Initialize;
        Application.CreateForm(TFrmSetup, FrmSetup);
  Application.Run;
        
        if Mutex <> 0 then
        CloseHandle(Mutex);
    end
    else begin
        Application.MessageBox('프로그램이 이미 실행중입니다.',
            'INFOMATION', MB_OK or MB_ICONWARNING);
    end;
end.
