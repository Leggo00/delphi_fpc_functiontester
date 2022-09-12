unit FormChangePassword;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExplBtn, Dialogs, ZINICtrl, IniFiles, ExtCtrls;

type
  TFrmChangePassword = class(TForm)
    Label1: TLabel;
    EdNewPass: TEdit;
    Label2: TLabel;
    EdAgain: TEdit;
    BtnOK: TExplorerButton;
    BtnCancel: TExplorerButton;
    Label3: TLabel;
    EdUsePassword: TEdit;
    procedure EdNewPassKeyPress(Sender: TObject; var Key: Char);
    procedure EdAgainKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
   EdUsePassword.SetFocus;
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
var
    sNewPassWord : String;
    IniF : TIniFile;
begin
    Inif := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        PassWord := IniF.ReadString('MAIN', 'PASSWORD', '');
    finally
        IniF.Free;
    end;

    if EdNewPass.Text = EdAgain.Text then
    begin
        if PassWord = EdUsePassword.Text then
        begin
            if EdNewPass.Text = '' then
            begin
                //if (MessageBox('비밀번호를 제거합니다.', '비밀번호확인',
                //    MB_YESNO or MB_ICONQUESTION ) <> IDYES) then exit;

                Inif := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
                try
                    IniF.WriteString('MAIN', 'PASSWORD', '');
                finally
                    IniF.Free;
                end;
            end else
            begin
                sNewPassWord := EdNewPass.Text;
                Inif := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
                try
                    IniF.WriteString('MAIN', 'PASSWORD', sNewPassWord);
                finally
                    IniF.Free;
                end;
            end;

            ModalResult := mrOk;
        end else
        begin
            ShowMessage('비밀번호 불일치!!');
        end;
    end else
    begin
        ShowMessage('새로운 암호가 틀립니다.');
    end;
    EdNewPass.SetFocus;
end;

procedure TFrmChangePassword.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmChangePassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    EdNewPass.Text := '';
    EdAgain.Text := '';
end;

end.

