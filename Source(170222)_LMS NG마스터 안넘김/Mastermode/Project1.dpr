program Project1;

uses
  Forms,
  FormMasterMode in 'FormMasterMode.pas' {FrmMasterMode},
  FormMaterAlret in 'FormMaterAlret.pas' {FrmMasterAlret};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMasterMode, FrmMasterMode);
  Application.CreateForm(TFrmMasterAlret, FrmMasterAlret);
  Application.Run;
end.
