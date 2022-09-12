program TestMelsecQ;

uses
  Forms,
  FormMelsecQ in 'FormMelsecQ.pas' {FrmMelsecQ};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMelsecQ, FrmMelsecQ);
  Application.Run;
end.
