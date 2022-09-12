program TestSorensen;

uses
  Forms,
  FormSorensen in 'FormSorensen.pas' {FrmSorensen};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSorensen, FrmSorensen);
  Application.Run;
end.
