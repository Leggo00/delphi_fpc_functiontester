program NIHardwareTest;

uses
  Forms,
  NiDAQmxf in 'NiDAQmxf.pas',
  FormNIhardware in 'FormNIhardware.pas' {FrmNI_Hardware};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmNI_Hardware, FrmNI_Hardware);
  Application.Run;
end.
