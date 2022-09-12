program KMI_EHW;

uses
  Forms,
  Windows,
  FormHWMain in 'FormHWMain.pas' {FrmHWMain},
  uStation in 'uStation.pas',
  FormADBuff in 'FormADBuff.pas' {FrmADBuff},
  FormHWLog in 'FormHWLog.pas' {FrmHWLog},
  HWGlobal in 'HWGlobal.pas',
  uEthernetAD in 'uEthernetAD.pas',
  uSocketKMI in 'uSocketKMI.pas',
  FormIOScale in 'FormIOScale.pas' {FrmIOScale},
  FormIOTest in 'FormIOTest.pas' {FrmIOTest};

{$R *.res}

var
  Mutex : THandle;

    begin
    Mutex := CreateMutex(nil, True, 'KMI_EHW');
    if (Mutex <> 0 ) and (GetLastError = 0) then
    begin
        Application.Initialize;
        Application.Title := 'KMI_EHW';
  Application.Initialize;
  Application.CreateForm(TFrmHWMain, FrmHWMain);
  Application.CreateForm(TFrmIOTest, FrmIOTest);
  Application.CreateForm(TFrmADBuff, FrmADBuff);
  Application.CreateForm(TFrmHWLog, FrmHWLog);
  Application.CreateForm(TFrmIOScale, FrmIOScale);
  Application.Run;
        if Mutex <> 0 then CloseHandle(Mutex);
    end else
        Application.MessageBox('이미 수행중입니다!',
            'INFOMATION', MB_OK or MB_ICONWARNING);

end.
