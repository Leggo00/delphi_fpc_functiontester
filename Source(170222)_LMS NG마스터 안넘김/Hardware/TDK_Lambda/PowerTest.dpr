program PowerTest;

uses
  Forms,
  FormTDKLambda in 'FormTDKLambda.pas' {FrmTDKLamda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTDKLamda, FrmTDKLamda);
  Application.Run;
end.
