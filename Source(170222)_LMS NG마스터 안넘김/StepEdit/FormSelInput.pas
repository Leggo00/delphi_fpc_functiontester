unit FormSelInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, Global, DPBLabel,
  chkgrid, FormResEdit, GradFill;

type
  TFrmSelInput = class(TForm)
    BitBtn5: TBitBtn;
    BtnClose: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit_ResName: TEdit;
    Label2: TLabel;
    ComboBox_ResParam: TComboBox;
    BtnStepAdd: TSpeedButton;
    BtnStepDelete: TSpeedButton;
    BtnStepMoveUp: TSpeedButton;
    BtnStepMoveDn: TSpeedButton;
    GridList: TCheckStringGrid;
    TreeViewRes: TTreeView;
    Label3: TLabel;
    Panel2: TPanel;
    Shape15: TShape;
    Shape16: TShape;
    GradientFill6: TGradientFill;
    dpbLabel50: TdpbLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_ResParamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnStepMoveUpClick(Sender: TObject);
    procedure BtnStepMoveDnClick(Sender: TObject);
    procedure BtnStepAddClick(Sender: TObject);
    procedure BtnStepDeleteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeViewResStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure GridListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GridListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeViewResClick(Sender: TObject);
  private
    { Private declarations }
    TempList : TStringList;
  public
    { Public declarations }
    function  Execute(StrList : TStringList; nResType : Integer) : String;
  end;

var
  FrmSelInput: TFrmSelInput;

implementation

uses GenUtils, UnitImage;

{$R *.dfm}

function TFrmSelInput.Execute(StrList : TStringList; nResType : Integer) : String;
var Idx : TResType;
    NewResName, NewResParam : String;
begin
    Result := '';
    if nResType = ITEM_INPUT then
        GridList.ColCount := 2;
    if nResType = ITEM_OUTPUT then
        GridList.ColCount := 5;

    if (StrList <> nil) then TempList.Assign(StrList)
                        else TempList.Clear;

    GridList.Refresh;
    if (ShowModal() = mrOk) then
    begin
        if (StrList <> nil) then
            StrList.Assign(TempList);

        Result := TempList.Text;
    end;
end;


procedure TFrmSelInput.BitBtn5Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmSelInput.BtnCloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmSelInput.FormCreate(Sender: TObject);
begin
    GridList.Cells[0,0] := 'ITEM NAME';
    GridList.Cells[1,0] := 'VALUE';

    TempList := TStringList.Create;
    GridList.DrawList := TempList;
end;

procedure TFrmSelInput.FormDestroy(Sender: TObject);
begin
    TempList.Free;
    TempList := nil;
end;

procedure TFrmSelInput.Edit_ResParamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) and (ComboBox_ResParam.Text <> '') then begin
        Key := 0;
        ModalResult := mrOk;
    end;
end;

procedure TFrmSelInput.BtnStepAddClick(Sender: TObject);
var NewItem, NewParam, OptStr : String;
begin
    NewItem  := Edit_ResName.Text;
    NewParam := ComboBox_ResParam.Text;

    if (NewItem <> '') then begin

        OptStr := NewItem + ';' + NewParam + ';';

        if (GridList.DrawList.Count > 0) and (GridList.DrawList[0] = ';;') then begin
            GridList.DrawList[0] := OptStr;
            GridList.Refresh;
        end else begin
            GridList.DrawList.Insert(GridList.Row, OptStr);
            GridList.Refresh;
            GridList.Row := GridList.Row + 1;
        end;
    end;
end;

procedure TFrmSelInput.BtnStepDeleteClick(Sender: TObject);
var Idx : Integer;
begin
    with GridList do begin
        Idx := Row-1;
        if  Idx < DrawList.Count then begin
            DrawList.Delete(Idx);
            Refresh;
        end;
    end;
end;

procedure TFrmSelInput.BtnStepMoveUpClick(Sender: TObject);
var Idx : integer;
    TempStr : String;
begin
    Idx := GridList.Row-1;
    if (Idx > 0) and (Idx < GridList.DrawList.Count) then begin
        TempStr := GridList.DrawList[Idx-1];
        GridList.DrawList[Idx-1] := GridList.DrawList[Idx];
        GridList.DrawList[Idx]   := TempStr;
        GridList.Refresh;
        GridList.Row := Idx;
    end;
end;

procedure TFrmSelInput.BtnStepMoveDnClick(Sender: TObject);
var Idx : integer;
    TempStr : String;
begin
    Idx := GridList.Row-1;
    if (Idx >= 0) and (Idx < GridList.DrawList.Count-1) then begin
        TempStr := GridList.DrawList[Idx+1];
        GridList.DrawList[Idx+1] := GridList.DrawList[Idx];
        GridList.DrawList[Idx]   := TempStr;
        GridList.Refresh;
        GridList.Row := Idx+2;
    end;
end;

procedure TFrmSelInput.FormShow(Sender: TObject);
begin
    FrmResEdit.MakeResourceTree(TreeViewRes);
end;

procedure TFrmSelInput.TreeViewResStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var RdStr : String;
begin
    Edit_ResName.Text := '';
    if TreeViewRes.Selected = nil then exit;

    RdStr := TreeViewRes.Selected.Text;
    if (TreeViewRes.Selected.ImageIndex = IMAGE_DOC) then
    begin
        Edit_ResName.Text := RdStr;
    end else

    if (TreeViewRes.Selected.ImageIndex = IMAGE_MESSAGE) then
    begin
        Edit_ResName.Text := GetTokenTrim(RdStr, ':');
    end;
end;

procedure TFrmSelInput.GridListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := True;
end;

procedure TFrmSelInput.GridListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    BtnStepAddClick(Sender);
end;

procedure TFrmSelInput.GridListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: BtnStepMoveUp.Click;
        VK_F6	: BtnStepMoveDn.Click;
        //VK_F8	: BtnStepCopy.Click;
    end;
end;

procedure TFrmSelInput.TreeViewResClick(Sender: TObject);
begin
    if (TreeViewRes.Selected <> nil) and (TreeViewRes.Selected.Level = 1) then
        Edit_ResName.Text := TreeViewRes.Selected.Text;
end;

end.
