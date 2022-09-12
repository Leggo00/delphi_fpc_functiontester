program TestTos9201;

uses
  Forms,
  FormTos9201 in 'FormTos9201.pas' {FrmTos9201};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTos9201, FrmTos9201);
  Application.Run;
end.
