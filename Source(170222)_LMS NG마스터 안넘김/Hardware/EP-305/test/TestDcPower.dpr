program TestDcPower;

uses
  Forms,
  FormEP305 in 'FormEP305.pas' {FrmEP305};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmEP305, FrmEP305);
  Application.Run;
end.
