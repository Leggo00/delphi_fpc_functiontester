program TraceClient;

uses
  Forms,
  FormTraceClient in 'FormTraceClient.pas' {FrmTraceClient},
  Global in 'Global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTraceClient, FrmTraceClient);
  Application.Run;
end.
