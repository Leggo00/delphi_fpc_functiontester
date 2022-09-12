unit PassWord;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExplBtn;

type
  TFrmPW = class(TForm)
    Label1: TLabel;
    EdPassword: TEdit;
    BtnOK: TExplorerButton;
    BtnCancel: TExplorerButton;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EdPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    PassWord: string;
    function Execute: Boolean;
  end;

var
  FrmPW: TFrmPW;

implementation

{$R *.DFM}

function TFrmPW.Execute: Boolean;
begin
   EdPassword.Text := '';
   if ShowModal = mrOk then Result := TRUE
   else Result := FALSE;
end;


procedure TFrmPW.FormShow(Sender: TObject);
begin
   EdPassword.SetFocus;
end;

procedure TFrmPW.BtnOKClick(Sender: TObject);
begin
   if PassWord = EdPassWord.Text then ModalResult := mrOk
   else ModalResult := mrCancel;

end;

procedure TFrmPW.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmPW.EdPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        BtnOKClick(Sender);
end;

end.

