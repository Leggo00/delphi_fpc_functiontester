program Project1;

uses
  Forms,
  FormTempSensor in 'FormTempSensor.pas' {FrmTempSensor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTempSensor, FrmTempSensor);
  Application.Run;
end.
