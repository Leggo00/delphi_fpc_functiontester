program CAN_TEST;

uses
  Forms,
  FormCANCom in 'FormCANCom.pas' {FrmCANCom},
  uCanUnit in 'uCanUnit.pas',
  uCanVector in 'uCanVector.pas',
  vxlapi in 'vxlapi.pas',
  uCanKMI in 'uCanKMI.pas',
  uCanDBC in 'uCanDBC.pas' {CanDBCImage: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCANCom, FrmCANCom);
  Application.CreateForm(TCanDBCImage, CanDBCImage);
  Application.Run;
end.
