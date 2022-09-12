unit PassWord;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExplBtn, Dialogs, ZINICtrl, IniFiles, ExtCtrls;

type
  TFrmPW = class(TForm)
    Label1: TLabel;
    EdPassword: TEdit;
    BtnOK: TExplorerButton;
    BtnCancel: TExplorerButton;
    ExplorerButton1: TExplorerButton;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EdPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExplorerButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    PassWord: string;
    function Execute: Boolean;
  end;

var
  FrmPW: TFrmPW;

implementation

uses FormChangePassword, GenUtils;

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
var
    Inif : TIniFile;
    sbasedir : String;
begin
    sbasedir := GetAppDir('');
    Inif := TIniFile.Create(sbasedir + 'CONFIG.INI');
    try
        PassWord := IniF.ReadString('MAIN', 'PASSWORD', '');
    finally
        IniF.Free;
    end;
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

procedure TFrmPW.ExplorerButton1Click(Sender: TObject);
begin
    FrmChangePassword.ShowModal;
end;

end.

