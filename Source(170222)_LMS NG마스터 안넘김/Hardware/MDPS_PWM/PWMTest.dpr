program PWMTest;

uses
  Forms,
  FormPWM in 'FormPWM.pas' {FrmKMIPWM},
  uKMIComm in 'uKMIComm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmKMIPWM, FrmKMIPWM);
  Application.Run;
end.
