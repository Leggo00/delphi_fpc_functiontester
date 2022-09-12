program Project1;

uses
  Forms,
  FormCLV421 in 'FormCLV421.pas' {FrmCLV421};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCLV421, FrmCLV421);
  Application.Run;
end.
