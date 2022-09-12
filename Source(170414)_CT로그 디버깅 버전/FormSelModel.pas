unit FormSelModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, DPBLabel, GradFill, ExtCtrls, FileCtrl, Math,
  XiButton, BaseGrid, AdvGrid, AdvPanel;

const
    MODEL_FILE_DIR = 'MODEL';
    
type
  TFrmSelModel = class(TForm)
    AdvPanel2: TAdvPanel;
    Shape15: TShape;
    Shape16: TShape;
    GradientFill6: TGradientFill;
    dpbLabel50: TdpbLabel;
    Shape1: TShape;
    Shape2: TShape;
    GradientFill1: TGradientFill;
    dpbLabel1: TdpbLabel;
    ComboBox_Model: TComboBox;
    FileListBox: TFileListBox;
    BtnOK: TXiButton;
    BtnCancel: TXiButton;
    Grid: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure ComboBox_ModelChange(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayALCList(sSelALC : String);
  public
    { Public declarations }
    function Execute(DirName : String; var sModel, sCode : String) : Boolean;
  end;

var
  FrmSelModel: TFrmSelModel;

implementation

{$R *.dfm}

uses GenUtils, FormEditModel;

function TFrmSelModel.Execute(DirName : String; var sModel, sCode : String) : Boolean;
var i : Integer;
    Str : String;
begin
{
    DirName := GetAppDir(MODEL_FILE_DIR);
    MakeDir(DirName);
}
    if not DirectoryExists(DirName) then begin
        MessageBox(DirName + '폴더를 찾을수 없습니다.', '에러', MB_OK or MB_ICONERROR);
        exit;
    end;
    // 측정모델 정보를 읽는다.
    FileListBox.Directory := DirName;
    FileListBox.Update;

    ComboBox_Model.Clear;
    for i := 0 to FileListBox.Count-1 do
    begin
        Str := UpperCase(FileListBox.Items[i]);
        GetToken(Str, '[');
        Str := GetToken(Str, ']');
        if (Str = '.') or (Str = '..') then continue;
        ComboBox_Model.Items.Add(Str);
    end;

    if (sModel <> '') then
        ComboBox_Model.ItemIndex := ComboBox_Model.Items.IndexOf(sModel)
    else
        ComboBox_Model.ItemIndex := 0;

    // 모델테이블을 다시 읽는다.
    ComboBox_ModelChange(nil);

    DisplayALCList(sCode);
    Update;

    if ShowModal() = mrOk then
    begin
        sModel  := ComboBox_Model.Text;
        sCode   := Grid.Cells[1, Grid.Row];
        Result := True;
    end else
        Result := False;
end;

procedure TFrmSelModel.FormCreate(Sender: TObject);
begin
    with Grid do begin
        Cells[0,0] := 'NO';
        Cells[1,0] := 'CODE';
        Cells[2,0] := 'DESCRIPTION';
    end;
end;

procedure TFrmSelModel.DisplayALCList(sSelALC : String);
var nCol, nRow, nRow2, nCount : Integer;
    sALC, sPartNo : String;
begin
    // 그리드를 초기화한다.
    Grid.ClearRect(0, 1, Grid.ColCount-1, Grid.RowCount-1);
    Grid.RowCount := 2;

    nCount := 0;
    nRow2  := 1;
    for nRow := 1 to FrmEditModel.Grid.RowCount-1 do
    begin
        sALC    := FrmEditModel.Grid.Cells[1,nRow];
        sPartNo := FrmEditModel.Grid.Cells[2,nRow];

        if (sALC <> '') then
        begin
            Inc(nCount);
            if nRow2 >= Grid.RowCount then
                Grid.RowCount := nRow2 + 1;

            Grid.Cells[0, nRow2] := IntToStr(nCount);
            Grid.Cells[1, nRow2] := sALC;
            Grid.Cells[2, nRow2] := sPartNo;
            Inc(nRow2);

            if (sALC = sSelALC) then
                Grid.Row := nCount;
        end;
    end;
end;

procedure TFrmSelModel.ComboBox_ModelChange(Sender: TObject);
var FileName : String;
begin
//    if not Visible then exit;
    FileName := FileListBox.Directory + '\' + ComboBox_Model.Text + '\MODEL.xls';
    if FileExists(FileName) then begin
        FrmEditModel.OpenSPECFile(FileName, True);
        DisplayALCList('');
    end else begin

        Grid.ClearRect(0, 1, Grid.ColCount-1, Grid.RowCount-1);
        Grid.RowCount := 2;

        MessageBox( FileName + ' 파일이 없습니다.', '', MB_OK or MB_ICONWARNING);
    end;
end;

procedure TFrmSelModel.BtnOKClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmSelModel.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;



end.
