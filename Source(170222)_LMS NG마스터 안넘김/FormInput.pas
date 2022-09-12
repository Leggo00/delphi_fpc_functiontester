unit FormInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmInput = class(TForm)
    GroupBox1: TGroupBox;
    BtnOk: TBitBtn;
    BtnClose: TBitBtn;
    Edit_Value: TEdit;
    procedure Edit_ValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(var Param : String) : Boolean;

  end;

var
  FrmInput: TFrmInput;

implementation

{$R *.dfm}

function TFrmInput.Execute(var Param : String) : Boolean;
begin
    Result := False;
    Edit_Value.Text := Param;
   
    if (ShowModal() = mrOK) then
    begin
        Param := UpperCase(Edit_Value.Text);
        Result := True;
    end;
end;

procedure TFrmInput.Edit_ValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        ModalResult := mrOK;
        Key := 0;
    end;
end;

procedure TFrmInput.FormShow(Sender: TObject);
begin
    Edit_Value.SetFocus();
    Edit_Value.SelectAll;

end;

end.
