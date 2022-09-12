program ITAC_Test;

uses
  Forms,
  FormItac in 'FormItac.pas' {FrmItac},
  ewMII in 'ewMII.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmItac, FrmItac);
  Application.Run;
end.                                     
