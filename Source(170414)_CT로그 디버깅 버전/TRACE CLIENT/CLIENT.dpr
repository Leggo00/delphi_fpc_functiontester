program CLIENT;

uses
  Forms,
  FormTRClient in 'FormTRClient.pas' {FrmTRClient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTRClient, FrmTRClient);
  Application.Run;
end.
