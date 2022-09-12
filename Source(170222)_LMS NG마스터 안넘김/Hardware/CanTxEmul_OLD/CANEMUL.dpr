program CANEMUL;

uses
  Forms,
  FormTDKLambda in 'FormTDKLambda.pas' {FrmTDKLamda},
  FormDevice in '..\Hardware\FormDevice.pas' {FrmDevice};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTDKLamda, FrmTDKLamda);
  Application.CreateForm(TFrmDevice, FrmDevice);
  Application.Run;
end.
