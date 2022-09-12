unit FormDBConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TraceGrobal, ExtCtrls;

type
  TFrmDBConnect = class(TForm)
    Label4: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    btnOK: TButton;
    btnClose: TButton;
    edtHostName: TEdit;
    edtDBName: TEdit;
    edtLoginID: TEdit;
    edtPassWord: TEdit;
    Label6: TLabel;
    edtPort: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDBConnect: TFrmDBConnect;

implementation

{$R *.dfm}

procedure TFrmDBConnect.btnOKClick(Sender: TObject);
begin
    SaveDBINI(edtHostName.Text,
              edtDBName.Text,
              edtPort.Text,
              edtLoginID.Text,
              edtPassWord.Text);
    LoadDBINI;
    Close;
end;

procedure TFrmDBConnect.FormCreate(Sender: TObject);
begin
    LoadDBINI;
    edtHostName.Text := DBconfig.HostName;
    edtDBName.Text   := DBconfig.Database;
    edtPort.Text     := DBconfig.Port;
    edtLoginID.Text  := DBconfig.UserID;
    edtPassWord.Text := DBconfig.password;

end;

procedure TFrmDBConnect.btnCloseClick(Sender: TObject);
begin
    Close;
end;

end.
