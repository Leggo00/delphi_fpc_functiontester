program TestDL9040;

uses
  Forms,
  FormDL9040 in 'FormDL9040.pas' {FrmDL9040},
  UnitTmControl in 'UnitTmControl.pas',
  TMCTL in 'TMCTL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmDL9040, FrmDL9040);
  Application.Run;
end.
