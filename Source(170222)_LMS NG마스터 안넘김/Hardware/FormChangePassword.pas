unit FormChangePassword;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExplBtn;

type
  TFrmChangePassword = class(TForm)
    Label1: TLabel;
    EdNewPass: TEdit;
    Label2: TLabel;
    EdAgain: TEdit;
    BtnOK: TExplorerButton;
    BtnCancel: TExplorerButton;
    procedure EdNewPassKeyPress(Sender: TObject; var Key: Char);
    procedure EdAgainKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    PassWord: string;
    function Execute: Boolean;
  end;

var
  FrmChangePassword: TFrmChangePassword;

implementation

uses GenUtils;

{$R *.DFM}


function TFrmChangePassword.Execute: Boolean;
begin
   Result := FALSE;
   EdNewPass.Text := '';
   EdAgain.Text := '';
   if mrOk = ShowModal then begin
      PassWord := EdNewPass.Text;
      Result := TRUE;
   end;
end;


procedure TFrmChangePassword.FormShow(Sender: TObject);
begin
   EdNewPass.SetFocus;
end;

procedure TFrmChangePassword.EdNewPassKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      if EdNewPass.Text <> '' then
         EdAgain.SetFocus;
      Key := #0;
   end;
end;

procedure TFrmChangePassword.EdAgainKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      if EdAgain.Text <> '' then
         BtnOKClick(self);
      Key := #0;
   end;
end;

procedure TFrmChangePassword.BtnOKClick(Sender: TObject);
begin
    if EdNewPass.Text = EdAgain.Text then
    begin
        if EdNewPass.Text = '' then
            if (MessageBox('비밀번호를 제거합니다.', '비밀번호확인',
                MB_YESNO or MB_ICONQUESTION ) <> IDYES) then exit;

        ModalResult := mrOk;
    end;
    EdNewPass.SetFocus;
end;

procedure TFrmChangePassword.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.

