unit UnitThreadDisplay;

interface

uses
  Classes, Controls, StdCtrls, ExtCtrls, VrMatrix, AdvSmoothGauge,
  Global, FormHwTest, SyncObjs;

type
  TThreadDisplay = class(TThread)
  private
    { Private declarations }
    gCritical : TCriticalSection;
    FValue: string;
    FResourceItem: TResourceItem;

    procedure DisplayValue;
  protected
    procedure Execute; override;
  public
    FComponent: TComponent;
  end;

implementation

uses
    SysUtils;

{ UnitThreadLabel }

procedure TThreadDisplay.DisplayValue;
begin
    FValue := ReadResName(FResourceItem, '');

    if (FComponent is TLabel) then
        (FComponent as TLabel).Caption := FValue
    else if (FComponent is TPanel) then
        (FComponent as TPanel).Caption := FValue
    else if (FComponent is TVrMatrix) then
        (FComponent as TVrMatrix).Text := FValue
    else if (FComponent is TAdvSmoothGauge) then
        (FComponent as TAdvSmoothGauge).Value := StrToFloatDef(FValue, 0)
end;

procedure TThreadDisplay.Execute;
var
    sResourceItems: string;
begin
    sResourceItems := (FComponent as TControl).Hint;

    FResourceItem := CurrProject.GetResource(0, sResourceItems);
    while not Terminated do
    begin
        Synchronize(DisplayValue);
        Sleep(100);
    end;
end;

end.
