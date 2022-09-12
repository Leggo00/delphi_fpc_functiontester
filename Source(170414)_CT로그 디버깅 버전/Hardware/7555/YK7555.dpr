program YK7555;

uses
  Forms,
  Form7555 in 'Form7555.pas' {Frm7555};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm7555, Frm7555);
  Application.Run;
end.
