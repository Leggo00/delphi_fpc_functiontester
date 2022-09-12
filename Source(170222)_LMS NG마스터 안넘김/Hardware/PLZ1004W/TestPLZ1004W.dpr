program TestPLZ1004W;

uses
  Forms,
  FormPLZ1004W in 'FormPLZ1004W.pas' {FrmPLZ1004W};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPLZ1004W, FrmPLZ1004W);
  Application.Run;
end.
