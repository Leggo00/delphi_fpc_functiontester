//------------------------------------------------------------------------------
//
//  CAN Frame 의 상세정보 Frame 
//
//------------------------------------------------------------------------------
unit FrameCaninfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, uCanDBC;

type
  TFrCanInfo = class(TFrame)
    Bevel1: TBevel;
    Label_MsgName: TLabel;
    btn_down: TSpeedButton;
    btn_up: TSpeedButton;
    Edit_Value: TEdit;
    Label_Info: TLabel;
    procedure btn_downClick(Sender: TObject);
    procedure btn_upClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fMin, fMax, fScale, fOffset : Double;
    procedure UpdateValue(fValue : Double);
  end;

implementation

uses GenUtils;

{$R *.dfm}

procedure TFrCanInfo.UpdateValue(fValue : Double);
begin
    Edit_Value.Text := FormatFloat('0.###', fValue);
    if (Edit_Value.Text <> '0') then Edit_Value.Font.Color := clBlue
                                else Edit_Value.Font.Color := clBlack;
end;

procedure TFrCanInfo.btn_downClick(Sender: TObject);
var fValue : Double;
begin
    fValue := StrToFloatDef(Edit_Value.Text, fMin) - fScale;
    if (fValue < fMin) then fValue := fMin;

    UpdateValue(fValue);
end;

procedure TFrCanInfo.btn_upClick(Sender: TObject);
var fValue : Double;
begin
    fValue := StrToFloatDef(Edit_Value.Text, fMin) + fScale;
    if (fValue > fMax) then fValue := fMax;

    UpdateValue(fValue);
end;

end.
