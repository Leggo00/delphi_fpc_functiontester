program TClient;

uses
  Forms,
  FormClient in 'FormClient.pas' {FrmClient},
  FormDBConnect in 'FormDBConnect.pas' {FrmDBConnect},
  TraceGrobal in 'TraceGrobal.pas',
  UnitFunction in 'UnitFunction.pas',
  IbDataModule in 'IbDataModule.pas' {IbDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIbDM, IbDM);
  Application.CreateForm(TFrmClient, FrmClient);
  Application.CreateForm(TFrmDBConnect, FrmDBConnect);
  Application.Run;
end.
