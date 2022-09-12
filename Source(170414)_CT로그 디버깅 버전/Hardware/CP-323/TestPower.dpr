program TestPower;

uses
  Forms,
  FormCP323 in 'FormCP323.pas' {FrmCP323};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCP323, FrmCP323);
  Application.Run;
end.
