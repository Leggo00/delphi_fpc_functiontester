program KMICANTEST;

uses
  Forms,
  uCanUnit in '..\CANCommon\uCanUnit.pas',
  FormCANComm in '..\CANCommon\FormCANComm.pas' {FrmCANComm},
  uCanKMI in '..\CANCommon\uCanKMI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCANComm, FrmCANComm);
  Application.Run;
end.
