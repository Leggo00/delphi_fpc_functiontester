unit FormListOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ZINICtrl, AdvGlowButton, ExtCtrls, XiPanel;

type
  TFrmListOption = class(TForm)
    gbListOption: TGroupBox;
    edtListRowCount: ZIniSpinEdit;
    Label1: TLabel;
    INI: ZIniData;
    PNToolBAR: TXiPanel;
    btnModelSelect: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    gbLineSet: TGroupBox;
    Label2: TLabel;
    EditStation: ZIniEdit;
    gbBox: TGroupBox;
    Label3: TLabel;
    edtPartsCountMax: ZIniSpinEdit;
    Label4: TLabel;
    edtPartsCount: ZIniSpinEdit;
    gbStation: TGroupBox;
    Label5: TLabel;
    edtStation: ZIniSpinEdit;
    procedure btnModelSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListOption: TFrmListOption;

implementation

{$R *.dfm}

procedure TFrmListOption.btnModelSelectClick(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmListOption.FormCreate(Sender: TObject);
begin
    INI.LoadData;
end;

procedure TFrmListOption.FormShow(Sender: TObject);
begin
    INI.LoadData;
end;

procedure TFrmListOption.AdvGlowButton1Click(Sender: TObject);
begin
    Close;
end;

end.
