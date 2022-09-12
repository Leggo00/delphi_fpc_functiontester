program Project1;

uses
  Forms,
  FormWT330 in 'FormWT330.pas' {FrmWT330};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmWT330, FrmWT330);
  Application.Run;
end.
