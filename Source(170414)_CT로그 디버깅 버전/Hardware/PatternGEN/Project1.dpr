program Project1;

uses
  Forms,
  FormPatternGen in 'FormPatternGen.pas' {FrmPatternGen};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPatternGen, FrmPatternGen);
  Application.Run;
end.
