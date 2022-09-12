program StepEdit;

uses
  Forms,
  FormMeasItem in 'FormMeasItem.pas' {FrmMeasItem},
  FormResEdit in 'FormResEdit.pas' {FrmResEdit},
  FormSelInput in 'FormSelInput.pas' {FrmSelInput},
  FormStepEdit in 'FormStepEdit.pas' {FrmStepEdit},
  FormStepOption in 'FormStepOption.pas' {FrmStepOption},
  FormStepToMemo in 'FormStepToMemo.pas' {FrmStepToMemo},
  Global in '..\Global.pas',
  uCanDBC in '..\Hardware\CANCommon\uCanDBC.pas' {CanDBCImage: TDataModule},
  uCanUnit in '..\Hardware\CANCommon\uCanUnit.pas',
  UnitImage in '..\UnitImage.pas' {ImageModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmStepEdit, FrmStepEdit);
  Application.CreateForm(TFrmMeasItem, FrmMeasItem);
  Application.CreateForm(TFrmResEdit, FrmResEdit);
  Application.CreateForm(TFrmSelInput, FrmSelInput);
  Application.CreateForm(TFrmStepOption, FrmStepOption);
  Application.CreateForm(TCanDBCImage, CanDBCImage);
  Application.CreateForm(TImageModule, ImageModule);
  Application.Run;
end.
