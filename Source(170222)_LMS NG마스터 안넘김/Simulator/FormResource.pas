unit FormResource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ImgList;

type
  TFrmResouce = class(TForm)
    treeResource: TTreeView;
    ImageList: TImageList;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    function FindResource(nLevel: integer; sResourceName: string) : TTreeNode;
  public
    { Public declarations }
    function Execute(sParam: string; nLeft, nTop: integer): string;
  end;

var
  FrmResouce: TFrmResouce;

implementation

uses
    GenUtils, FormResEdit, StrUtils, Global;

{$R *.dfm}

function TFrmResouce.FindResource(nLevel: integer; sResourceName: string) : TTreeNode;
var
    i: integer;
    TempNode : TTreeNode;
begin
    Result := nil;
    for i := 0 to treeResource.Items.Count - 1 do
    begin
        if treeResource.Items.Item[i].Level = nLevel then
        begin
            TempNode := treeResource.Items.Item[i];
        
            if Pos(sResourceName, TempNode.Text) > 0  then
            begin
                Result := TempNode;
                Break;
            end;
        end;
    end;
end;

function TFrmResouce.Execute(sParam: string; nLeft, nTop: integer): string;
var
    aFindNode : TTreeNode;
    sTempName, sCanResName: string;
    aResourceItem: TResourceItem;
    i: integer;
begin
    Result := sParam;

    Left := nLeft;
    Top  := nTop;
    FrmResEdit.MakeResourceTree(treeResource);

    for i := 0 to 4 do
    begin
        aFindNode := FindResource(i, sParam);
        if aFindNode <> nil then
        begin
            aFindNode.Selected := True;
            Break;
        end;
    end;

    if ShowModal = mrOK then
    begin  
        if treeResource.Selected = nil then
            exit;

        sTempName     := treeResource.Selected.Text;
        sCanResName   := Trim(GetToken(sTempName, ':'));
        aResourceItem := CurrProject.GetResource(0, sCanResName);
        if aResourceItem.ResName <> '' then
            Result := aResourceItem.ResName;

    end; // if ShowModal = mrOK then
end;

procedure TFrmResouce.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TFrmResouce.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;


end.
