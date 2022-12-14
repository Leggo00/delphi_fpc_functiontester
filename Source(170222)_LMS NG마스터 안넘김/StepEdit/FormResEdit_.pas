unit FormResEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, chkgrid, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList,
  XiButton, XiPanel;

type
  TFrmResEdit = class(TForm)
    TabControlRes: TTabControl;
    GridRes: TCheckStringGrid;
    ListBoxRes: TListBox;
    btnAdd: TSpeedButton;
    btnAddAll: TSpeedButton;
    btnDelete: TSpeedButton;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    btnDeleteAll: TSpeedButton;
    btnCopy: TSpeedButton;
    XiPanel1: TXiPanel;
    BitBtn1: TXiButton;
    BtnOpenDBC: TXiButton;
    XiButton1: TXiButton;
    procedure FormCreate(Sender: TObject);
    procedure TabControlResChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnAddAllClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure TabControlResChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnOpenDBCClick(Sender: TObject);
    procedure GridResDblClick(Sender: TObject);
    procedure GridResDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GridResDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnDeleteAllClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure GridResKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CurTabList : TStringList;
    { Private declarations }
  public
    { Public declarations }
    function  Execute() : Boolean;
    procedure MakeResourceTree(TreeView : TTreeView);
  end;

var
  FrmResEdit: TFrmResEdit;

implementation

uses Global, GenUtils, {FormHardware,} UnitImage, FormHWMain;

{$R *.dfm}

function TFrmResEdit.Execute() : Boolean;
begin
    if (ShowModal() = mrOk) then begin
        Result := True;
    end else
        Result := False;
end;

procedure TFrmResEdit.FormCreate(Sender: TObject);
var i : Integer;
    Idx : TResType;
begin
    with GridRes do begin
        Cells[0,0] := '????????';
        Cells[1,0] := 'IONAME';
        Cells[2,0] := 'OPTION';
        Cells[3,0] := 'GROUP';
    end;

    TabControlRes.Tabs.Clear;
    for i := Ord(Low(ResNameTbl)) to Ord(High(ResNameTbl))-2 do
    begin
        Idx := TResType(i);
        TabControlRes.Tabs.Add(ResNameTbl[Idx]);
    end;
end;

procedure TFrmResEdit.FormDestroy(Sender: TObject);
begin
//
end;

procedure TFrmResEdit.FormShow(Sender: TObject);
begin
    TabControlRes.TabIndex := 0;
    TabControlResChange(Sender);
end;

procedure TFrmResEdit.TabControlResChange(Sender: TObject);
var ResType : TResType;
begin
    ListBoxRes.SetFocus;
    ResType := TResType(TabControlRes.TabIndex);
    FrmHWMain.GetIOcontrolList (ListBoxRes.Items, ResType);

    GridRes.DrawList := CurrProject.ResList[ResType];
//    GridRes.Options := GridRes.Options + [goEditing];
end;

procedure TFrmResEdit.TabControlResChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
//    AllowChange := False;
//    AllowChange := (GridRes.Options in [goEditing]);
//    GridRes.Options := GridRes.Options - [goEditing];
end;

procedure TFrmResEdit.btnAddClick(Sender: TObject);
var
	  rcname: string;
begin
      if ListBoxRes.ItemIndex >= 0 then
      begin
           rcname := ListBoxRes.Items[ListBoxRes.itemindex];
           if GridRes.DrawList.Count > 0 then
               GridRes.DrawList.Insert(GridRes.Row, Rcname + ';' + rcname + ';;;')
           else
               GridRes.DrawList.Add( Rcname + ';' + rcname + ';;;');

           GridRes.Refresh;
      end;//
end;

procedure TFrmResEdit.btnCopyClick(Sender: TObject);
var
     sItems: string;
begin
    if ListBoxRes.Items.Count > 0 then
    begin
        sItems := GridRes.DrawList[GridRes.Row - 1];
        sItems := '@' + sItems;
        GridRes.DrawList.Insert(GridRes.Row - 1, sItems);
        GridRes.Refresh;
   end;
end;

procedure TFrmResEdit.btnAddAllClick(Sender: TObject);
var
	  rcname: string;
    i: integer;
begin
    if ListBoxRes.Items.Count > 0 then
        for i := 0 to ListBoxRes.Items.Count - 1 do
        begin
            rcname := ListBoxRes.Items[i];
            GridRes.DrawList.Add( Rcname + ';' + rcname + ';;;');
        end;
        GridRes.Refresh;
end;

procedure TFrmResEdit.btnDeleteClick(Sender: TObject);
begin
    if ListBoxRes.Items.Count > 0 then
    begin
        GridRes.DrawList.Delete(GridRes.Row - 1);
        GridRes.Refresh;
   end;
end;

procedure TFrmResEdit.BitBtn2Click(Sender: TObject);
begin
    ModalResult := MrOk;
end;

procedure TFrmResEdit.BtnCloseClick(Sender: TObject);
begin
    ModalResult := MrCancel;
end;

procedure TFrmResEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GridRes.DrawList := nil;
end;

procedure TFrmResEdit.btnUpClick(Sender: TObject);
var Idx : Integer;
    TempStr : String;
begin
    Idx := GridRes.Row-1;

    if (Idx > 0) and (Idx < GridRes.DrawList.Count) then
    begin
        TempStr                 := GridRes.DrawList[Idx-1];
        GridRes.DrawList[Idx-1] := GridRes.DrawList[Idx];
        GridRes.DrawList[Idx]   := TempStr;

        GridRes.Refresh;

        GridRes.Row := Idx;
    end;
end;

procedure TFrmResEdit.btnDownClick(Sender: TObject);
var Idx : Integer;
    TempStr : String;
begin
    Idx := GridRes.Row-1;

    if (Idx >= 0) and (Idx < GridRes.DrawList.Count-1) then
    begin
        TempStr                 := GridRes.DrawList[Idx+1];
        GridRes.DrawList[Idx+1] := GridRes.DrawList[Idx];
        GridRes.DrawList[Idx]   := TempStr;

        GridRes.Refresh;

        GridRes.Row := Idx+2;
    end;
end;

procedure TFrmResEdit.BitBtn1Click(Sender: TObject);
var i, j : Integer;
    TestStep : TTestStep;
    RdStr : String;
    OldName, NewName : String;
begin
    OldName := GridRes.Cells[0, GridRes.Row];
    if OldName = '' then exit;

    NewName := InputBox('????????????', '?????? ?????????? ??????????', OldName);
    if (OldName = NewName) then exit;

    GridRes.Cells[0, GridRes.Row] := NewName;

    for i:=0 to CurrProject.GetStepCount-1 do begin
        TestStep := CurrProject.GetStep(i);
        if (TestStep <> nil) then
        begin
            // Input Condition1.
            for j:=0 to TestStep.InputList1.Count-1 do begin
                RdStr := TestStep.InputList1[j];
                TestStep.InputList1[j] := ReplaceStr(RdStr, OldName, NewName);
            end;

            // Input Condition2.
            for j:=0 to TestStep.InputList2.Count-1 do begin
                RdStr := TestStep.InputList2[j];
                TestStep.InputList2[j] := ReplaceStr(RdStr, OldName, NewName);
            end;

            // Output Condition.
            for j:=0 to TestStep.OutputList.Count-1 do begin
                RdStr := TestStep.OutputList[j];
                TestStep.OutputList[j] := ReplaceStr(RdStr, OldName, NewName);
            end;

            // Output Condition.
            for j:=0 to TestStep.CheckList.Count-1 do begin
                RdStr := TestStep.CheckList[j];
                TestStep.CheckList[j] := ReplaceStr(RdStr, OldName, NewName);
            end;
        end;
    end;
end;

procedure TFrmResEdit.BtnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmResEdit.BtnOpenDBCClick(Sender: TObject);
var OpenDialog : TOpenDialog;
    Idx : Integer;
begin
    Idx := (Sender as TXiButton).Tag;

    OpenDialog := TOpenDialog.Create(Self);
    try
        OpenDialog.DefaultExt := 'dbc';
        OpenDialog.Filter     := 'CAN DB Files(*.dbc)|*.dbc';
        OpenDialog.InitialDir := gBaseDir + 'DBC\';
        if OpenDialog.Execute then
        begin
            CurrProject.CanDB[Idx].LoadFromFile(OpenDialog.FileName);
            gCanDBFile[Idx] := ExtractFileName(OpenDialog.FileName);
        end;
    finally
        OpenDialog.Free;
    end;
end;


procedure TFrmResEdit.MakeResourceTree(TreeView : TTreeView);
var
    i, j : Integer;
    ParentNode, GroupNode, ChildNode, CanNode1, CanNode2 : TTreeNode;
    Str, RdStr : String;
    Idx : TResType;

    ResName, IOName, tagStr, GroupName : String;
begin
    try
        //--------------------------------------------------------------------------
        // ?????????? Tree?? ????????.
        TreeView.Items.BeginUpdate;
        TreeView.Items.Clear;

        for i := Ord(Low(TResType)) to Ord(High(TResType))-1 do
        begin
            Idx := TResType(i);
            ParentNode := TreeView.Items.Add(nil, ResNameTbl[Idx] );
            ParentNode.ImageIndex    := IMAGE_FOLDER;
            ParentNode.SelectedIndex := IMAGE_FOLDER;

            if (Idx = res_CAN) then begin
                CanNode1 := TreeView.Items.AddChild(ParentNode, 'CanDB1');
                CanNode1.ImageIndex    := IMAGE_FOLDER;
                CanNode1.SelectedIndex := IMAGE_FOLDER;

                CanNode2 := TreeView.Items.AddChild(ParentNode, 'CanDB2');
                CanNode2.ImageIndex    := IMAGE_FOLDER;
                CanNode2.SelectedIndex := IMAGE_FOLDER;
            end;

            for j:= 0 to CurrProject.ResList[Idx].Count-1 do
            begin
                RdStr := CurrProject.ResList[Idx].Strings[j];

                ResName   := GetTokenTrim(RdStr, ';');
                IOName    := GetTokenTrim(RdStr, ';');
                tagStr    := GetTokenTrim(RdStr, ';');
                GroupName := GetTokenTrim(RdStr, ';');

                if (GroupName <> '') then
                begin
                    // ???? ?????????? ??????.
                    GroupNode := ParentNode.getFirstChild;
                    while (GroupNode <> nil) do begin
                        if (GroupNode.Text = GroupName) then break;
                        GroupNode := GroupNode.getNextSibling;
                    end;

                    if (GroupNode = nil) then
                        GroupNode := TreeView.Items.AddChild(ParentNode, GroupName);
                end else
                    GroupNode := ParentNode;

                if (ResName <> '') then begin
                    //Str := Format('%-15s =%s', [ResName, IOName]);
                    Str := Format('%s', [ResName]);
                    ChildNode := TreeView.Items.AddChild(GroupNode, Str);
                    ChildNode.ImageIndex    := IMAGE_DOC;
                    ChildNode.SelectedIndex := IMAGE_DOC;
                end;
            end;
        end;

        // CAN DB?? ???????? NODE?? ????????.
        CurrProject.CanDB[1].DisplayCanDB(TreeView, CanNode1);
        CurrProject.CanDB[2].DisplayCanDB(TreeView, CanNode2);

        TreeView.Items.EndUpdate;
    except
    end;
end;     

procedure TFrmResEdit.GridResDblClick(Sender: TObject);
var
    sResName, sParam: string;
begin
{
    with GridRes do
    begin
        sResName := Cells[0, Row];
        sParam   := Cells[2, Row];

        sParam   := FrmParam.Execute(sResName, Cells[1, Row], sParam);

        Cells[0, Row] := sResName;
        Cells[2, Row] := sParam;
    end;
}
end;

procedure TFrmResEdit.GridResDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    btnAddClick(Self);
end;

procedure TFrmResEdit.GridResDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := True;
end;

procedure TFrmResEdit.btnDeleteAllClick(Sender: TObject);
begin
    GridRes.DrawList.Clear;
    GridRes.Refresh;
end;

procedure TFrmResEdit.GridResKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: btnUp.Click;
        VK_F6	: btnDown.Click;
    end;
end;

end.
