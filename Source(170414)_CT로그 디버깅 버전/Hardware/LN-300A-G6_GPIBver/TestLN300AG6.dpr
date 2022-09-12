program TestLN300AG6;

uses
  Forms,
  FormLN300AG6 in 'FormLN300AG6.pas' {FrmLN300AG6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLN300AG6, FrmLN300AG6);
  Application.Run;
end.
