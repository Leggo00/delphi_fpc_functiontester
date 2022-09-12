program Rs232Base;

uses
  Forms,
  FormRs232Base in 'FormRs232Base.pas' {FrmRs232Base};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmRs232Base, FrmRs232Base);
  Application.Run;
end.
