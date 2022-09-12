program SentTest;

uses
  Forms,
  FormSent in 'FormSent.pas' {FrmSent},
  AIDC in 'AIDC.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSent, FrmSent);
  Application.Run;
end.
