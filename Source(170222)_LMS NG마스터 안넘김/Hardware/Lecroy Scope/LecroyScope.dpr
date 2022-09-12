program LecroyScope;

uses
  Forms,
  FormLecroy in 'FormLecroy.pas' {FrmLecroy};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLecroy, FrmLecroy);
  Application.Run;
end.
