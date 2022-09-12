program KMICOMMTEST;

uses
  Forms,
  FormKMIComm in 'FormKMIComm.pas' {FrmKMIComm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmKMIComm, FrmKMIComm);
  Application.Run;
end.
