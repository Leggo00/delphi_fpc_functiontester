unit FormOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, StdCtrls, Spin, DPBLabel, ExtCtrls, Buttons, ComCtrls,
  XiButton;

const
    FORM_WIDTH  = 800;
    FORM_HEIGHT = 600;
    
type
  TFrmOption = class(TForm)
    IniOption: ZIniData;
    PageControl1: TPageControl;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    dpbLabel2: TdpbLabel;
    dpbLabel3: TdpbLabel;
    dpbLabel4: TdpbLabel;
    dpbLabel5: TdpbLabel;
    edtFormWidth: ZIniSpinEdit;
    edtFormHeight: ZIniSpinEdit;
    edtFormLeft: ZIniSpinEdit;
    edtFormTop: ZIniSpinEdit;
    chkChangeFormSize: ZIniCheckBox;
    GroupBox2: TGroupBox;
    dpbLabel1: TdpbLabel;
    edtMovePixel: ZIniSpinEdit;
    GroupBox3: TGroupBox;
    dpbLabel6: TdpbLabel;
    edtSnapWidth: ZIniSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkChangeFormSizeClick(Sender: TObject);
  private
    { Private declarations }
    function SetDirectory: string;
  public
    { Public declarations }
    procedure GetOptionValue;
    procedure SetOptionValue;
  end;

var
  FrmOption: TFrmOption;

implementation

uses FormDesigner, ShellApi, ShlObj;

{$R *.dfm}

procedure TFrmOption.FormCreate(Sender: TObject);
begin
    IniOption.LoadData;

    if edtFormLeft.Value = 0 then
        edtFormLeft.Value := (Screen.Width - FORM_WIDTH) div 2;

    if edtFormTop.Value = 0 then
        edtFormTop.Value := (Screen.Height - FORM_HEIGHT) div 2;

    if edtFormWidth.Value = 0 then
        edtFormWidth.Value := FORM_WIDTH;

    if edtFormHeight.Value = 0 then
        edtFormHeight.Value := FORM_HEIGHT;

end;

procedure TFrmOption.btnOkClick(Sender: TObject);
begin
    IniOption.SaveData;

    Close;
end;   

procedure TFrmOption.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmOption.SetOptionValue;
begin
{
    FrmDesigner.DsnStage.Rubberband.MoveWidth  := edtMovePixel.Value;
    FrmDesigner.DsnStage.Rubberband.MoveHeight := edtMovePixel.Value;

    FrmDesigner.Left   := edtFormLeft.Value;
    FrmDesigner.Top    := edtFormTop.Value;
    FrmDesigner.Width  := edtFormWidth.Value;
    FrmDesigner.Height := edtFormHeight.Value;

    FrmDesigner.DsnStage.Repaint;
}
end;

procedure TFrmOption.GetOptionValue;
begin
{
    edtFormLeft.Value   := FrmDesigner.Left;
    edtFormTop.Value    := FrmDesigner.Top;
    edtFormWidth.Value  := FrmDesigner.Width;
    edtFormHeight.Value := FrmDesigner.Height;
}
end;

procedure TFrmOption.FormDestroy(Sender: TObject);
begin
    GetOptionValue;

    IniOption.SaveData;
end;    

procedure TFrmOption.chkChangeFormSizeClick(Sender: TObject);
begin
    if chkChangeFormSize.Checked then
    begin
        edtFormLeft.Value   := FrmDesigner.Left;
        edtFormTop.Value    := FrmDesigner.Top;
        edtFormWidth.Value  := FrmDesigner.Width;
        edtFormHeight.Value := FrmDesigner.Height;
    end
    else begin
        edtFormLeft.Value   := (Screen.Width - FORM_WIDTH) div 2;
        edtFormTop.Value    := (Screen.Height - FORM_HEIGHT) div 2;
        edtFormWidth.Value  := FORM_WIDTH;
        edtFormHeight.Value := FORM_HEIGHT;
    end;
end;

function TFrmOption.SetDirectory: string;
var
   idl: PITEMIDLIST;
   browseInfo: TBROWSEINFO;
   fn: array[0..255] of char;
begin
    Result := '';
    with browseInfo do
    begin
        hwndOwner := Handle;
        pszDisplayName := fn;
        lpszTitle := PChar('폴더 지정');
        pidlRoot := nil;
        lpfn := nil;
        ulFlags := BIF_RETURNONLYFSDIRS;
    end;

    idl := SHBrowseForFolder(browseInfo);
    if (idl <> nil) then
        SHGetPathFromIDList(idl, PCHAR(@fn[0]));

    if fn <> '' then
        Result := strpas(fn);

end;

end.
