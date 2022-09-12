program TerminateApplication;

uses
  Forms,
  FormTerminate in 'FormTerminate.pas' {FrmTerminate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTerminate, FrmTerminate);
  Application.Run;
end.
