program FC100Test;

uses
  Forms,
  FormFC100 in 'FormFC100.pas' {FrmFC110};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmFC110, FrmFC110);
  Application.Run;
end.
