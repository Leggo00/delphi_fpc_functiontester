program Project1;

uses
  Forms,
  FormWT210 in 'FormWT210.pas' {FrmWT210};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmWT210, FrmWT210);
  Application.Run;
end.
