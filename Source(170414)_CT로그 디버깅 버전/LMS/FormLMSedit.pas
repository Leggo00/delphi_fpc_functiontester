unit FormLMSedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, CheckLst, ShlObj, ZINICtrl,
  XiPanel, XiButton, FileCtrl, Grids, BaseGrid, AdvGrid, ComCtrls, UnitImage,
  ImgList, AMLed;

const
  LMSMAXDATACOUNT = 10;

type
  //조치중 State: 설비상태(0=수동, 1=자동, 2=정지)(Integer),
  TMachineState = (tsManu, tsAuto, tsStop);

  TFrmLMSedit = class(TForm)
    INI: ZIniData;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    TreeViewNG: TTreeView;
    Splitter1: TSplitter;
    listNgMaster: TFileListBox;
    chkLMSUse: ZIniCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TreeView: TTreeView;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton20: TSpeedButton;
    edtMasterFileName: TEdit;
    Button1: TXiButton;
    edtSelProjectFile: ZIniEdit;
    XiButton1: TXiButton;
    ImageList_Led: TImageList;
    ImageList_Led2: TImageList;
    ImageList: TImageList;
    ImageList_SW: TImageList;
    TabSheet5: TTabSheet;
    label222: TLabel;
    SpeedButton1: TSpeedButton;
    TimerState: TTimer;
    Button9: TButton;
    edtStatevlt: ZIniEdit;
    LMSOPTION: ZIniData;
    TabSheet6: TTabSheet;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Button3: TButton;
    edtMeasureCsv: ZIniEdit;
    Label3: TLabel;
    edtSampleLoad: TEdit;
    SpeedButton3: TSpeedButton;
    Grid: TAdvStringGrid;
    Memo1: TMemo;
    TabSheet4: TTabSheet;
    PageControl4: TPageControl;
    TabSheet8: TTabSheet;
    gridModel: TAdvStringGrid;
    listNGMasterFile: ZIniListBox;
    listModelDir: TFileListBox;
    listMasterFile: TFileListBox;
    listLayoutFile: TFileListBox;
    XiPanel1: TXiPanel;
    btnSave: TXiButton;
    BtnAdd: TXiButton;
    BtnDelete: TXiButton;
    BtnCopy: TXiButton;
    BtnMoveUp: TXiButton;
    BtnMoveDn: TXiButton;
    MemoLmsList: TMemo;
    Label4: TLabel;
    edtLMStestfile: TEdit;
    SpeedButton4: TSpeedButton;
    Button10: TButton;
    MemoLMSResult: TMemo;
    Button11: TButton;
    edtTotalResult: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtSerial: TEdit;
    Label7: TLabel;
    edtModel: TEdit;
    Label8: TLabel;
    edtModelInfo: TEdit;
    edtDateTime: TEdit;
    Label9: TLabel;
    Button12: TButton;
    Button13: TButton;
    FileListBox: TFileListBox;
    Label10: TLabel;
    SpeedButton5: TSpeedButton;
    edtMeasuretarget: ZIniEdit;
    Button14: TButton;
    Button15: TButton;
    cbLabelOption: TCheckBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    edtToolName_1: ZIniEdit;
    Label12: TLabel;
    edtToolLife_1: ZIniEdit;
    Label13: TLabel;
    edtToolMileage_1: ZIniEdit;
    edtToolLifeAddr_1: ZIniEdit;
    Label14: TLabel;
    edtToolMileageAddr_1: ZIniEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtToolUnit_1: ZIniEdit;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtToolName_2: ZIniEdit;
    edtToolLife_2: ZIniEdit;
    edtToolMileage_2: ZIniEdit;
    edtToolLifeAddr_2: ZIniEdit;
    edtToolMileageAddr_2: ZIniEdit;
    edtToolUnit_2: ZIniEdit;
    cbTestMode: ZIniCheckBox;
    GroupBox4: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Led_Auto: TLed;
    Led_Stop: TLed;
    edtPlcAuto_Addr: ZIniEdit;
    edtPlcStop_Addr: ZIniEdit;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    cbStateTest: TCheckBox;
    procedure SpeedButton20Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure gridModelGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure gridModelHasComboBox(Sender: TObject; ACol, ARow: Integer;
      var HasComboBox: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnMoveUpClick(Sender: TObject);
    procedure BtnMoveDnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewDblClick(Sender: TObject);
    procedure listNgMasterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XiButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TimerStateTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure FileListBoxDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function SetDirectory(): string;
    procedure SaveNGMasterFile(sFileName: string);
    procedure ClearCanGrid;
    procedure LoadFromFile;

    procedure MakeMasterTree(sFileName: string);
    procedure MakeNGMasterTree(sFileName: string);
  public
    { Public declarations }

    gState : TMachineState;       //설비상태
    CauseString : string;  //고장내역

    function MakeNgMasterFileDir(sModelName: string): string;

    function GetMasterLayFile(sModelName: string): string;
    function GetNgListFile(sModelName: string): string;


    function makeStatevlt(): Boolean;
    function GetTESTresult(sFileName : string):string;
    function ReturnLMSList(sINIFile : string):Boolean;
    function ReturnLMSResult(): string;
    function ReturnLMSResult_LABEL(sSerial, sCustomer : string): string;
  end;

var
  FrmLMSedit: TFrmLMSedit;

implementation

uses
    Global, GenUtils, Math, FormEditModel, FormMasterMode, FormMelsecQ;

{$R *.dfm}

function TFrmLMSedit.SetDirectory():String;
var
   idl: PITEMIDLIST;
   browseInfo: TBROWSEINFO;
   fn: array[0..255] of char;
begin
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
    if (idl <> nil) then SHGetPathFromIDList(idl, PCHAR(@fn[0]));

    if fn <> '' then
    begin
        Result := strpas(fn);
    end;
end;

procedure TFrmLMSedit.MakeMasterTree(sFileName: string);

    function AddChildTree(PNode : TTreeNode; TitleStr : String; nImageIdx : Integer) : TTreeNode;
    begin
        Result := TreeView.Items.AddChild(PNode, '');
        Result.Text := TitleStr;
        Result.ImageIndex    := nImageIdx;
        Result.SelectedIndex := nImageIdx;
    end;

    function GetItemState(sStepName, sItemName: string): integer;
    var
        i, nNode: integer;
        sTmp, sItem: string;
        bFindParent: boolean;
    begin
        Result := 1;
        bFindParent := False;
        for i := 0 to TreeViewNG.Items.Count - 1 do
        begin
            nNode  := TreeViewNG.Items.Item[i].ImageIndex;
            sTmp   := TreeViewNG.Items.Item[i].Text;
            sItem  := GetToken(sTmp, ';');
            if (nNode = 0) and (sItem = sStepName) then
                bFindParent := True;

            if bFindParent then
            begin
                if sItem = sItemName then
                begin
                    Result := nNode;
                    Break;
                end;
            end;
        end;
    end;

var
    i, j: integer;
    TestStep: TTestStep;
    ParentNode: TTreeNode;
    RdStr, ItemStr, ParamStr: string;
    MasterProject: TTestProjcet;
    sTmp, sModel, sNgListFile: string;
    nNode: integer;
begin
    try
        edtMasterFileName.Text := ExtractFileName(edtSelProjectFile.Text);    
        if not FileExists(sFileName) then exit;

        MasterProject := TTestProjcet.Create;
        MasterProject.LoadFromFile(sFileName);

        sTmp :=  UpperCase(sFileName);
        GetToken(sTmp, 'MODEL\');
        sModel := GetToken(sTmp, '\PROJECT');
        sNgListFile := GetNgListFile(sModel);
        if sNgListFile <> '' then
        begin
            sNgListFile := GetAppDir('LMS_INI') + sNgListFile;
            if FileExists(sNgListFile) then
                MakeNGMasterTree(sNgListFile);
        end else begin
            listNgMaster.ItemIndex := -1;
            TreeViewNG.Items.Clear;
        end;

        TreeView.Items.BeginUpdate;
        TreeView.Items.Clear;

        with MasterProject do
        begin
            for i := 0 to GetStepCount()-1 do
            begin
                TestStep := GetStep(i);
                
                if (TestStep = nil) or (not TestStep.Enabled) then continue;
                if (TestStep.CheckList.Count = 1) then
                begin
                    sTmp := TestStep.CheckList[0];
                    RdStr := GetToken(sTmp, ';');
                    if RdStr = '' then
                        Continue;
                end;

                ParentNode := TreeView.Items.Add (nil, '');
                ParentNode.Text := TestStep.StepName;
                ParentNode.ImageIndex    := 0;
                ParentNode.SelectedIndex := 0;

                for j := 0 to TestStep.CheckList.Count-1 do
                begin
                    RdStr    := TestStep.CheckList[j];
                    ItemStr  := GetToken(RdStr, ';');
                    ParamStr := GetToken(RdStr, ';');
                    if ItemStr <> '' then
                    begin
                        // NG파일을 참조하여, NG상태 표시
                        nNode := GetItemState(ParentNode.Text, ItemStr);
                        AddChildTree(ParentNode, ItemStr + ';' + ParamStr, nNode);
                    end;
                end;   
            end;
        end;

    except on E:Exception do
        WriteDebugStr ('Error on ZTestList.StepListToTree() :' + E.Message);
    end;

    TreeView.FullExpand;
    TreeView.Items.EndUpdate;
    SetScrollPos( TreeView.Handle, SB_VERT, 0, True );

    MasterProject.Free;
end;

procedure TFrmLMSedit.TreeViewDblClick(Sender: TObject);
var
    i: integer;
begin
    with TreeView do
    begin
        for i := 0 to Items.Count - 1 do
        begin
            if Items.Item[i].Selected then
            begin
                if Items.Item[i].ImageIndex = 0 then
                    continue;

                if Items.Item[i].ImageIndex = 2 then
                begin
                    Items.Item[i].ImageIndex := 1;
                    Items.Item[i].SelectedIndex := 1;
                end
                else begin
                    Items.Item[i].ImageIndex := 2;
                    Items.Item[i].SelectedIndex := 2;
                end;
                Break;
            end;

        end;
    end;
end;

procedure TFrmLMSedit.SpeedButton20Click(Sender: TObject);
var
    OpenDialog : TOpenDialog;
    sFileName, sDir: string;
begin
    OpenDialog := TOpenDialog.Create(Self);
    try
        sFileName := edtSelProjectFile.Text;
        if sFileName = '' then
            sDir := GetAppDir('MODEL')
        else
            sDir := ExtractFilePath(sFileName);

        OpenDialog.InitialDir := sDir;
        if OpenDialog.Execute then
        begin
            edtSelProjectFile.Text := OpenDialog.FileName;
        end;
    finally
        OpenDialog.Free;
    end;

    MakeMasterTree(edtSelProjectFile.Text);
end;


procedure TFrmLMSedit.SaveNGMasterFile(sFileName: String);
var
    i : Integer;
    sValue : String;
    listString : TStringList;
begin
    listString := TStringList.Create;
    try
        for i := 0 to TreeView.Items.Count - 1 do
        begin
            sValue := Format('%d:%s', [TreeView.Items.Item[i].ImageIndex, TreeView.Items.Item[i].Text] );
            listString.Add(sValue);
        end;
        listString.SaveToFile(sFileName);

    finally
        listString.Free;
    end;

    listNgMaster.Update;
end;

procedure TFrmLMSedit.Button1Click(Sender: TObject);
var
    SaveDialog : TSaveDialog;
    sSaveDir : String;
    i: integer;
    sTmp, sFileName: string;
begin
    SaveDialog := TSaveDialog.Create(Self);
    try
        sSaveDir := GetAppDir('') + 'LMS_INI\';
        MakeDir(sSaveDir);

        SaveDialog.InitialDir := sSaveDir;
        SaveDialog.Filter     := 'ini Files (*.ini)|*.ini';
        if SaveDialog.Execute then
        begin
            SaveNGMasterFile(SaveDialog.FileName);

            sFileName := Uppercase(ExtractFileName(SaveDialog.FileName));
            for i := 0 to listNgMaster.Count - 1 do
            begin
                sTmp := Uppercase( listNgMaster.Items.Strings[i] );
                if sFileName = sTmp then        
                begin
                    listNgMaster.Selected[i] := True;
                    listNgMaster.OnClick(nil);
                    Break;
                end;
            end;

        end;
    finally
        SaveDialog.Free;
    end;
end;

procedure TFrmLMSedit.gridModelGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
var
    i: integer;
    sTemp, sDir: string;
begin
    with gridModel do
    begin
        case ACol of
            1: begin
                aEditor := edComboList;
                ClearComboString;

                with listModelDir do
                begin
                    Directory := GetAppDir('MODEL');
                    Update;

                    for i := 0 to Count - 1 do
                    begin
                        sTemp := UpperCase( Items[i] );
                        GetToken(sTemp, '[');
                        sTemp := GetToken(sTemp, ']');
                        if (sTemp = '.') or (sTemp = '..') then
                            Continue;
                        ComboBox.Items.Add(sTemp);
                    end;
                end;
            end;

            2: begin
                aEditor := edComboList;
                ClearComboString;

                with listLayoutFile do
                begin
                    if Cells[1, ARow] = '' then exit;

                    Directory := GetAppDir('MODEL') + Cells[1, ARow];
                    Update;

                    ComboBox.Items := Items;
                end;
            end;

            3: begin
                aEditor := edComboList;
                ClearComboString;

                with listMasterFile do
                begin
                    sDir := Format('%s', [ GetAppDir('LMS_INI')]);
                    if DirectoryExists(sDir) then
                        Directory := sDir;
                    Update;

                    ComboBox.Items := Items;
                end;
            end;
        end;
    end;
end;

procedure TFrmLMSedit.gridModelHasComboBox(Sender: TObject; ACol,
  ARow: Integer; var HasComboBox: Boolean);
begin
    with gridModel do
    begin
        HasComboBox := (ACol = 3) or ( (ACol = 4) and
                       ((Cells[1, ARow] <> '') or
                         (EditMode and (Row = ARow) and (Col = 1))) );
    end;
end;

procedure TFrmLMSedit.btnSaveClick(Sender: TObject);
var
    nRow, nCol: integer;
    sData: string;
begin
    with gridModel do
    begin
        with listNGMasterFile do
        begin
            Items.Clear;
            for nRow := 1 to RowCount - 1 do
            begin
                sData := '';
                for nCol := 1 to ColCount - 1 do
                    sData := sData + ',' + Cells[nCol, nRow];
                Items.Add(sData);
            end;
        end;
    end;

    INI.SaveData;

    MessageDlg('저장되었습니다.', mtInformation, [mbOk], 0);
end;

procedure TFrmLMSedit.BtnAddClick(Sender: TObject);
begin
    with gridModel do
    begin
        if Cells[1, 1] <> '' then
        begin
            AddRow;
            AutoNumberCol(0);
        end;
    end;
end;

procedure TFrmLMSedit.BtnDeleteClick(Sender: TObject);
begin
    with gridModel do
    begin
        if RowCount > 2 then
        begin
            RemoveRows(Row, 1);
        end
        else if RowCount = 2 then
            ClearCanGrid();

        AutoNumberCol(0);
    end;
end;

procedure TFrmLMSedit.BtnCopyClick(Sender: TObject);
var
    nCol: integer;
    bCheck: boolean;
begin
    with gridModel do
    begin
        InsertRows(Row + 1, 1);

        for nCol := 0 to ColCount - 1 do
        begin
            if (nCol = 1) or (nCol = (ColCount - 1)) then
            begin
                GetCheckBoxState(nCol, Row, bCheck);
            end
            else begin
                Cells[nCol, Row + 1] := Cells[nCol, Row];
            end;
        end;

        AutoNumberCol(0);
    end;
end;

procedure TFrmLMSedit.BtnMoveUpClick(Sender: TObject);
begin
    with gridModel do
    begin
        if Row > 1 then
        begin
            MoveRow(Row, Row - 1);
            Row := Row - 1;
        end;

        AutoNumberCol(0);
    end;
end;

procedure TFrmLMSedit.BtnMoveDnClick(Sender: TObject);
begin
    with gridModel do
    begin
        if Row < RowCount - 1 then
        begin
            MoveRow(Row, Row + 1);
            Row := Row + 1;
        end;

        AutoNumberCol(0);
    end;
end;

procedure TFrmLMSedit.ClearCanGrid();
var
    nRow, nCol: integer;
begin
    with gridModel do
    begin
        for nRow := 1 to RowCount - 1 do
        begin
            for nCol := 1 to ColCount - 1 do
                Cells[nCol, nRow] := '';
        end;
        RowCount := 2;

        Cells[0, 0] := 'NO.';
        Cells[1, 0] := '모델명';
        Cells[2, 0] := '마스터 파일명';

        AutoNumberCol(0);
    end;
end;

procedure TFrmLMSedit.LoadFromFile();
var
    nRow, nCol: integer;
    sData: string;
begin
    ClearCanGrid();
    INI.LoadData;

    with listNGMasterFile do
    begin
        with gridModel do
        begin
            if Items.Count = 0 then
                RowCount := 2
            else
                RowCount := Items.Count + 1;

            for nRow := 0 to Items.Count - 1 do
            begin
                sData := Items[nRow];
                nCol := 0;
                while sData <> '' do
                begin
                    Cells[nCol, nRow + 1] := GetToken(sData, ',');
                    inc(nCol);
                end;
            end;

            AutoNumberCol(0);
        end;
    end;
end;

procedure TFrmLMSedit.FormShow(Sender: TObject);
begin
    PageControl2.ActivePageIndex := 0;
    LoadFromFile();
    MakeMasterTree(edtSelProjectFile.Text);    
end;

procedure TFrmLMSedit.FormCreate(Sender: TObject);
var
    sMasterDir: string;
begin
    LMSOPTION.LoadData;
    gState       := tsAuto;
    CauseString  := '';

    sMasterDir := GetAppDir('LMS_INI');
    if not DirectoryExists(sMasterDir) then
        ForceDirectories(sMasterDir);

    listNgMaster.Directory := sMasterDir;
    LoadFromFile();

    MakeMasterTree(edtSelProjectFile.Text);
    TimerState.Enabled := True;
end;

function TFrmLMSedit.MakeNgMasterFileDir(sModelName:String) : String;
var   i : integer;
begin
    Result := 'N/A';
    with gridModel do
    begin
        for i := 1 to RowCount -1 do
        begin
            if (Cells[1, i] = sModelName) then
            begin
                Result := Cells[2, i];
            end;
        end;
    end;
end;

procedure TFrmLMSedit.MakeNGMasterTree(sFileName: string);
var
    i: Integer;
    RdStr: string;
    listNgMaster : TStringList;
    nMode: integer;
    ParentNode: TTreeNode;

    function AddChildTree(PNode : TTreeNode; TitleStr : String; nImageIdx : Integer) : TTreeNode;
    begin
        Result := TreeViewNG.Items.AddChild(PNode, '');
        Result.Text := TitleStr;
        Result.ImageIndex    := nImageIdx;
        Result.SelectedIndex := nImageIdx;
    end;

begin
    try
        if not FileExists(sFileName) then exit;

        listNgMaster := TStringList.Create;
        listNgMaster.LoadFromFile(sFileName);

        TreeViewNG.Items.BeginUpdate;
        TreeViewNG.Items.Clear;

        with listNgMaster do
        begin
            for i := 0 to Count - 1 do
            begin
                RdStr := listNgMaster.Strings[i];

                nMode := StrToIntDef(GetToken(RdStr, ':'), 0);
                if nMode = 0 then
                begin
                    ParentNode := TreeViewNG.Items.Add (nil, '');
                    ParentNode.Text := RdStr;
                    ParentNode.ImageIndex    := nMode;
                    ParentNode.SelectedIndex := nMode;
                end
                else begin
                    AddChildTree(ParentNode, RdStr, nMode);
                end;
            end;

        end;

    except on E:Exception do
        WriteDebugStr ('Error on ZTestList.StepListToTree() :' + E.Message);
    end;

    TreeViewNG.FullExpand;
    TreeViewNG.Items.EndUpdate;
    SetScrollPos( TreeViewNG.Handle, SB_VERT, 0, True );  
end;

procedure TFrmLMSedit.listNgMasterClick(Sender: TObject);
var
    sFileName: string;
begin
    sFileName := Format('%s%s', [GetAppDir('LMS_INI'), listNgMaster.Items[listNgMaster.ItemIndex] ]);
    MakeNGMasterTree(sFileName);
end;

procedure TFrmLMSedit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    LMSOPTION.SaveData;
{    if MessageDlg( '저장하고 종료하시겠습니까?' , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        btnSave.OnClick(nil);
    end;   }
end;

function TFrmLMSedit.GetMasterLayFile(sModelName: string): string;
var
    nRow: integer;
begin
    Result := '';
    with gridModel do
    begin
        for nRow := 1 to RowCount -1 do
        begin
            if sModelName = Cells[1, nRow] then
            begin
                Result := Cells[2, nRow];
                Break;
            end;
        end;
    end;
end;

function TFrmLMSedit.GetNgListFile(sModelName: string): string;
var
    nRow: integer;
begin
    Result := '';
    with gridModel do
    begin
        for nRow := 1 to RowCount -1 do
        begin
            if sModelName = Cells[1, nRow] then
            begin
                Result := Cells[3, nRow];
                Break;
            end;
        end;
    end;
end;

procedure TFrmLMSedit.XiButton1Click(Sender: TObject);
var
    i: integer;
begin
    with TreeView do
    begin
        for i := 0 to Items.Count - 1 do
        begin
            if Items.Item[i].ImageIndex = 0 then
                continue;

            if Items.Item[i].ImageIndex = 2 then
            begin
                Items.Item[i].ImageIndex := 1;
                Items.Item[i].SelectedIndex := 1;
            end;
        end;
    end;
end;

procedure TFrmLMSedit.SpeedButton1Click(Sender: TObject);
begin
    edtStatevlt.Text := SetDirectory;
end;

procedure TFrmLMSedit.SpeedButton2Click(Sender: TObject);
begin
    edtMeasureCsv.Text := SetDirectory;
end;

procedure TFrmLMSedit.TimerStateTimer(Sender: TObject);
begin
    TimerState.Enabled := False;

    if not chkLMSUse.Checked then
    begin
        TimerState.Enabled := True;
        exit;
    end;

    Led_Auto.LedOn    := (FrmMelsecQ.ReadCommandEx(edtPlcAuto_Addr.Text) = 1);
    Led_Stop.LedOn    := (FrmMelsecQ.ReadCommandEx(edtPlcStop_Addr.Text) = 1);


    if not cbStateTest.Checked then
    begin
        if (Led_Auto.LedOn) then
        begin
            gState := tsAuto;
        end else begin
            gState := tsManu;
        end;

        if (Led_Stop.LedOn) then
            gState := tsStop;
    end;


    makeStatevlt();
    TimerState.Enabled := True;
end;


{
Alive(String): YYYYMMDD-hhmmss(날짜, 시간),
State: 설비상태(0=조치중, 1=정상, 2=정지, 3=계획 정지)(Integer),
Cause: 고장내역(String),
ToolCount: 해당 설비에서 관리하는 공구 수(Integer),
ToolName_n: 공구 이름(String),
ToolLife_n: 공구수명(Integer),
ToolMileage_n: 공구 사용량(Integer),
ToolUnit_n: 공구에서 사용하는 단위(String)

ex

Alive=YYYYMMDD-hhmmss
State=1
Cause=로터용접 스테핑 회전에러
ToolCount=2
ToolName_1=드라이버 팁 교환주기
ToolLife_1=7000
ToolMileage_1=4125
ToolUnit_1=회
ToolName_2=라우터 비트
ToolLife_2=20500
ToolMileage_2=20450
ToolUnit_2=mm


}


procedure TFrmLMSedit.Button2Click(Sender: TObject);
begin
    //조치중 State: 설비상태(0=조치중, 1=정상, 2=정지, 3=계획 정지)(Integer),
    gState := tsManu;
end;

procedure TFrmLMSedit.Button4Click(Sender: TObject);
begin
    //조치중 State: 설비상태(0=조치중, 1=정상, 2=정지, 3=계획 정지)(Integer),
    gState := tsAuto;
end;

procedure TFrmLMSedit.Button5Click(Sender: TObject);
begin
    //조치중 State: 설비상태(0=조치중, 1=정상, 2=정지, 3=계획 정지)(Integer),
    gState := tsStop;

end;

procedure TFrmLMSedit.Button7Click(Sender: TObject);
begin
    TimerState.Enabled := False;
end;

procedure TFrmLMSedit.Button8Click(Sender: TObject);
begin
    TimerState.Enabled := True;
end;


procedure TFrmLMSedit.Button9Click(Sender: TObject);
begin
    LMSOPTION.SaveData;
    INI.SaveData;
end;

procedure TFrmLMSedit.SpeedButton3Click(Sender: TObject);
var
    OpenDialog : TOpenDialog;
    sDir : string;
begin
    OpenDialog            := TOpenDialog.Create(Self);
    OpenDialog.Filter     := 'CSV Files (*.csv)|*.csv';
    try
        if OpenDialog.Execute then
        begin
            edtSampleLoad.Text := OpenDialog.FileName;
            sDir := edtSampleLoad.Text;
            FileListBox.Directory := ExtractFileDir(sDir);
            FileListBox.Refresh;
        end;
    finally
        OpenDialog.Free;
    end;
end;

function TFrmLMSedit.GetTESTresult(sFileName : string): string;
var
    stringList, FilterList : TstringList;
    sStr, sStr1, sFillStepName : string;
    i,c,r : integer;
    sRdstr,Str,sSerial : string;
    dTime: Tdatetime;
begin
    edtSampleLoad.Text := sFileName;
    
    if not FileExists(sFileName) then exit;
    stringList := TStringList.Create;
    FilterList := TStringList.Create;
    stringList.LoadFromFile(sFileName);
    FilterList := stringList;

    sRdstr := sFileName;
    sRdstr := ExtractFileName(sRdstr);

    if Pos('O.csv',sRdstr) > 0 then
    begin
        edtTotalResult.Text := 'OK';
    end else begin
        edtTotalResult.Text := 'NG';
    end;

    Str := GetToken(sRdstr, '_');
    EdtSerial.Text := Str;


    Memo1.Clear;
    i := 0;
    while True do
    begin
        if (stringList.Count = 0) then
           break;
        sStr := stringList.Strings[0];
        stringList.Delete(0);
        if Pos('[DATA]', sStr) > 0 then
        begin
            break;
        end;
        Memo1.Lines.Add(sStr);

        if (Pos('MODEL,', sStr) > 0) then
        begin
            GetToken(sStr, ',');
            GetToken(sStr, '- ');
            edtModel.Text := sStr;
            edtModelInfo.Text := frmEditModel.GetItemByName(edtModel.Text, 'MODEL_DESC');
        end;

                                          if (Pos('StartTime,', sStr) > 0) then
        begin
            GetToken(sStr, ',');
            dTime := StrToDateTime(sStr);
            edtDateTime.Text := FormatDateTime('YYYYMMDD-hhmmss', dTime);
        end;


    end;
    Grid.RowCount := stringList.Count;

    sFillStepName := '';
    for r := 0 to stringList.Count-1 do
    begin
        sStr := stringList.Strings[r];
        c := 0;
        while True do
        begin
            if (Pos(',', sStr)>0) then
            begin
                sStr1 := GetToken(sStr,',');
                sStr1 := ReplaceStr(sStr1, '"', '');
                if (sStr1 = '') and (c = 1) then
                begin
                   sStr1 := sFillStepName;
                end;
                Grid.Cells[c, r] := sStr1;
                if (c = 1) then
                begin
                    sFillStepName := sStr1;
                end;

                Inc(c);


            end else begin
                sStr := ReplaceStr(sStr, '"', '');
                Grid.Cells[c, r] :=  sStr;
                break;
            end;
        end;
    end;
    Grid.AutoFitColumns;
    stringList.Free;
end;

procedure TFrmLMSedit.Button3Click(Sender: TObject);
begin
    GetTESTresult(edtSampleLoad.Text);
end;

function TFrmLMSedit.ReturnLMSList(sINIFile : string): Boolean;
var
    sLMSFile : string;

    ATextFile: TextFile;

    sData, sItem, sStepItem, sRange : string;
    sStepName, sLMSItem : string;
    nLMScount, nNode : integer;
begin
    Result := False;

    edtLMStestfile.Text := sINIFile;
    sLMSFile := sINIFile;
    if not FileExists(sLMSFile) then exit;

    // LMS File에서 LMS List만 추출한다.

    //10개이내 LMSMAXDATACOUNT = 10;

    MemoLmsList.Lines.Clear;
    AssignFile(ATextFile, sLMSFile);
    Reset(ATextFile);
    try
        sStepName := '';
        nLMScount := 0;
        while not Eof(ATextFile) do
        begin
            Readln(ATextFile, sData);

            sItem     := sData;
            nNode     := StrToIntDef(GetToken(sItem, ':'), 0);
            sStepItem := GetToken(sItem, ';');
            sRange    := GetToken(sItem, ';');

            if nNode = 0 then
            begin
                sStepName := Format('%s', [sStepItem]);
                //nNgCount := 0;
                continue;
            end;

            if nNode = 2 then
            begin
                //if nNgCount = 0 then
                //    MemoLmsList.Lines.Add( sNgStepName );

                sLMSItem := Format('%s:%s', [sStepName, sStepItem]);
                MemoLmsList.Lines.Add( sLMSItem );
                Inc(nLMScount);
            end;
        end;
    finally
        CloseFile(ATextFile);
    end;
    Result := True;
end;

procedure TFrmLMSedit.SpeedButton4Click(Sender: TObject);
var
    OpenDialog : TOpenDialog;
begin
    OpenDialog            := TOpenDialog.Create(Self);
    OpenDialog.Filter     := 'ini Files (*.ini)|*.ini';
    OpenDialog.InitialDir := GetAppDir('LMS_INI') + '\';
    try
        if OpenDialog.Execute then
        begin
            edtLMStestfile.Text := OpenDialog.FileName;

        end;
    finally
        OpenDialog.Free;
    end;
end;

procedure TFrmLMSedit.Button10Click(Sender: TObject);
begin
    ReturnLMSList(edtLMStestfile.text);
end;

procedure TFrmLMSedit.Button11Click(Sender: TObject);
begin
    ReturnLMSResult();
end;


function TFrmLMSedit.ReturnLMSResult(): string;
var
    i, r, nLMSCount : integer;
    ReulstList : TstringList;
    Reulstvlt : TstringList;
    FailList  : TstringList;
    sRdstr, sStr : string;
    sStpemCount, sStepName,  sitemName, sSpec, sMin,sMax, sValue, sUnit, sResult : string;
    sLMSStep,  sLMSsitem, sLineResult, sFailResult : string;
    sMeasure : string;
    sLMStargetFilename : string;
    sSerial : string;
    bMaster : Boolean;
    stestDate : string;
    bCheck : Boolean;

    bMasterType : Boolean;
begin


    ReulstList := TStringList.Create;
    Reulstvlt  := TstringList.Create;
    FailList   := TStringList.Create;

    sSerial  := EdtSerial.Text;
    bMaster  := FrmMasterMode.MasterBcdCheck(sSerial, bMasterType);

    if (bMaster) and (not bMasterType) then //NG마스터일 경우엔 LMS에 데이터를 넘기지 않는다 20170221 소지영과장 요청
    begin
        ReulstList.Free;
        Reulstvlt.Free;
        FailList.Free;
        exit;
    end;

    stestDate  := ReplaceStr( edtDateTime.Text, '-', '');


    ReulstList.Add(Format('SerialNo;%s'   ,[EdtSerial.Text]));
    ReulstList.Add(Format('ProductNo;%s'  ,[edtModel.Text]));
    ReulstList.Add(Format('ProductInfo;%s',[edtModelInfo.Text]));
    ReulstList.Add(Format('Datetime;%s'   ,[edtDateTime.Text]));
    ReulstList.Add(Format('Result;%s'     ,[edtTotalResult.Text]));

    if bMaster then
    begin
        sLMStargetFilename := edtMeasuretarget.Text + '\' + Format('%s_MasterSample_%s.target'   ,[sSerial, stestDate]);
    end else begin
        sLMStargetFilename := edtMeasuretarget.Text + '\' + Format('%s_Measure_%s.target'   ,[EdtSerial.Text, stestDate]);
    end;

    MakeDir(edtMeasuretarget.Text);
    MakeDir(edtMeasureCsv.Text);

    if not DirectoryExists(edtMeasuretarget.Text) then exit;


{
SerialNo,150311R0434
ProductNo,M00.003-00
ProductInfo,TL GEN
Datetime,20150723-164126
Result,OK
}

    nLMSCount  := 0;
    for r := 0 to  Grid.RowCount-1 do
    begin
        sStpemCount := Grid.Cells[0,r];
        sStepName   := Grid.Cells[1,r];
        sitemName   := Grid.Cells[2,r];
        sSpec       := Grid.Cells[3,r];
        if (Pos('~' , sSpec) > 0) then
        begin
            sMin := GetToken(sSpec, '~');
            sMax := sSpec;
        end else begin
            sMin := sSpec;
            sMax := '';
        end;
        sValue      := Grid.Cells[4,r];
        sUnit       := Grid.Cells[5,r];
        sResult     := Grid.Cells[6,r];

        bCheck := False;
        for i := 0 to MemoLmsList.Lines.Count -1 do
        begin
            sRdstr    := MemoLmsList.Lines[i];
            sLMSStep  := GetToken(sRdstr, ':');
            sLMSsitem := sRdstr;

            if (sLMSStep  = Grid.Cells[1,r]) and
               (sLMSsitem = Grid.Cells[2,r]) then
            begin
                bCheck := True;
                //ex     TestStep,2,8.3.1.4 Measure current consuption,30,14,43,mA,mA,OK
                Inc(nLMSCount);
                //TestStep,측정번호,측정항목,측정값,하한,상한,측정값 단위,판정결과(OK 또는 NG
                sLineResult := Format('TestStep;%s;%s_%s;%s;%s;%s;%s;%s',[
                                                        sStpemCount
                                                        ,sStepName
                                                        ,sitemName
                                                        ,sValue
                                                        ,sMin
                                                        ,sMax
                                                        ,sUnit
                                                        ,sResult]);

                if nLMSCount > LMSMAXDATACOUNT then
                begin
                    break;
                end;
                ReulstList.Add(sLineResult);
                break;
            end else begin
                //
            end;
        end;
        if (sResult = 'NG') and (not bCheck) then
        begin
            sFailResult := Format('NGStep;%s;%s_%s;%s;%s;%s;%s;%s',[
                                                    sStpemCount
                                                    ,sStepName
                                                    ,sitemName
                                                    ,sMin
                                                    ,sMax
                                                    ,sValue
                                                    ,sUnit
                                                    ,sResult]);
            FailList.Add(sFailResult);
        end;

    end;

    for i := 0 to FailList.Count-1 do
    begin
        ReulstList.Add(FailList.Strings[i]);
    end;






    MemoLMSResult.Lines := ReulstList;
    if bMaster then
    begin
        sMeasure := edtMeasureCsv.Text + '\' + Format('%s_MasterSample_%s.csv'   ,[EdtSerial.Text, stestDate]); //EdtSerial.Text + '_MasterSample_' + stestDate +'.csv';
    end else begin
        sMeasure := edtMeasureCsv.Text + '\' + Format('%s_Measure_%s.csv'   ,[EdtSerial.Text, stestDate]); //+ EdtSerial.Text + '_Measure.csv';
    end;
    
    ReulstList.SaveToFile(sMeasure);
    Reulstvlt.SaveToFile(sLMStargetFilename);    //DATA파일보다 나중에 생성
    ReulstList.Free;
    FailList.Free;
{
⑥	TestStep,측정번호,측정항목,측정값,하한,상한,측정값 단위,허용범위 단위,판정결과(OK 또는 NG
//2,"Temperature Check","Temperature","50.00~95.00","74.10","","OK",
SerialNo,150311R0434
ProductNo,M00.003-00
ProductInfo,TL GEN
Datetime,20150723-164126
Result,OK
TestStep,1,Temperature Check,24.3,,,,,OK
TestStep,2,8.3.1.4 Measure current consuption,30,14,43,mA,mA,OK
TestStep,3,8.3.1.6 Enable TX CAN DID to read boot S/W ID,62 F1 80 43 33 30 31 54,62 F1 80 43 33 30 31 54,62 F1 80 43 33 30 31 54,,,OK
TestStep,4,8.3.1.6 WRITE EEPROM,150311R0434,,,,,OK
TestStep,5,8.3.1.7 Default Condition,,,,,,OK
TestStep,6,8.3.1.7 Write I-Gain value,6E FD 11,6E FD 11,,,,OK
TestStep,7,8.3.1.7 Write minimum duty cycle,6E FD 15,6E FD 15,,,,OK
TestStep,8,8.3.1.7 Fuel pump load connected,,,,,,OK
TestStep,9,8.3.1.7 Write current sensor gain 0A (Calibrate 0A offset),6E FD 16,6E FD 16,6E FD 16,,,OK
TestStep,10,8.3.1.7 Read current sensor gain 0A,62 FD 16 00 2A,62 FD 16 00 2A,62 FD 16 00 2A,,,OK

}
end;


{
var
    i, r, nLMSCount : integer;
    ReulstList : TstringList;
    Reulstvlt : TstringList;
    FailList  : TstringList;
    sRdstr, sStr : string;
    sStpemCount, sStepName,  sitemName, sSpec, sMin,sMax, sValue, sUnit, sResult : string;
    sLMSStep,  sLMSsitem, sLineResult, sFailResult : string;
    sMeasure : string;
    sLMStargetFilename : string;
begin


    ReulstList := TStringList.Create;
    Reulstvlt  := TstringList.Create;
    FailList   := TStringList.Create;

    ReulstList.Add(Format('SerialNo,%s'   ,[EdtSerial.Text]));
    ReulstList.Add(Format('ProductNo,%s'  ,[edtModel.Text]));
    ReulstList.Add(Format('ProductInfo,%s',[edtModelInfo.Text]));
    ReulstList.Add(Format('Datetime,%s'   ,[edtDateTime.Text]));
    ReulstList.Add(Format('Result,%s'     ,[edtTotalResult.Text]));
    sLMStargetFilename := edtMeasuretarget.Text + '\' + Format('%s_Result.target'   ,[EdtSerial.Text]);
    MakeDir(edtMeasuretarget.Text);
    MakeDir(edtMeasureCsv.Text);

    if not DirectoryExists(edtMeasuretarget.Text) then exit;

    nLMSCount  := 0;
    for i := 0 to MemoLmsList.Lines.Count -1 do
    begin
        sRdstr    := MemoLmsList.Lines[i];
        sLMSStep  := GetToken(sRdstr, ':');
        sLMSsitem := sRdstr;

        for r := 0 to  Grid.RowCount-1 do
        begin
            if (sLMSStep  = Grid.Cells[1,r]) and
               (sLMSsitem = Grid.Cells[2,r]) then
            begin
                //ex     TestStep,2,8.3.1.4 Measure current consuption,30,14,43,mA,mA,OK
                Inc(nLMSCount);
                sStpemCount := Grid.Cells[0,r];
                sStepName   := Grid.Cells[1,r];
                sitemName   := Grid.Cells[2,r];
                sSpec       := Grid.Cells[3,r];
                if (Pos('~' , sSpec) > 0) then
                begin
                    sMin := GetToken(sSpec, '~');
                    sMax := sSpec;
                end else begin
                    sMin := sSpec;
                    sMax := '';
                end;
                sValue      := Grid.Cells[4,r];
                sUnit       := Grid.Cells[5,r];
                sResult     := Grid.Cells[6,r];



                //TestStep,측정번호,측정항목,측정값,하한,상한,측정값 단위,허용범위 단위,판정결과(OK 또는 NG
                sLineResult := Format('TestStep,%s,%s_%s,%s,%s,%s,%s,%s',[
                                                        sStpemCount
                                                        ,sStepName
                                                        ,sitemName
                                                        ,sMin
                                                        ,sMax
                                                        ,sValue
                                                        ,sUnit
                                                        ,sResult]);

                if nLMSCount > LMSMAXDATACOUNT then
                begin
                    break;
                end;

                ReulstList.Add(sLineResult);
                break;
            end else begin
                //측정항목이 아닌 다른곳에서 ng 날경우
                if Grid.Cells[6,r] = 'NG' then
                begin
                    sStpemCount := Grid.Cells[0,r];
                    sStepName   := Grid.Cells[1,r];
                    sitemName   := Grid.Cells[2,r];
                    sSpec       := Grid.Cells[3,r];
                    if (Pos('~' , sSpec) > 0) then
                    begin
                        sMin := GetToken(sSpec, '~');
                        sMax := sSpec;
                    end else begin
                        sMin := sSpec;
                        sMax := '';
                    end;
                    sValue      := Grid.Cells[4,r];
                    sUnit       := Grid.Cells[5,r];
                    sResult     := Grid.Cells[6,r];



                    //TestStep,측정번호,측정항목,측정값,하한,상한,측정값 단위,허용범위 단위,판정결과(OK 또는 NG
                    sFailResult := Format('NGStep,%s,%s_%s,%s,%s,%s,%s,%s',[
                                                            sStpemCount
                                                            ,sStepName
                                                            ,sitemName
                                                            ,sMin
                                                            ,sMax
                                                            ,sValue
                                                            ,sUnit
                                                            ,sResult]);


                end;
            end;

        end;
    end;
    MemoLMSResult.Lines := ReulstList;
    sMeasure := edtMeasureCsv.Text + '\' + EdtSerial.Text + '_Measure.csv';
    ReulstList.SaveToFile(sMeasure);
    Reulstvlt.SaveToFile(sLMStargetFilename);    //DATA파일보다 나중에 생성
    ReulstList.Free;
}

procedure TFrmLMSedit.Button13Click(Sender: TObject);
var i : integer;
    sFileName : string;
begin
    if (edtLMStestfile.Text = '') or
       (not FileExists(edtLMStestfile.Text)) then
       begin
            ShowMessage('필터할 lms list 파일을 로드해주세요.');
            exit;
       end;

    if not ReturnLMSList(edtLMStestfile.text) then
    begin
        ShowMessage('LMS INI 를 확인하세요');
    end;

    for i := 0 to FileListBox.Count-1 do
    begin

       GetTESTresult(FileListBox.Directory +'\' + FileListBox.Items[i]);
       ReturnLMSResult()
    end;
end;

procedure TFrmLMSedit.SpeedButton5Click(Sender: TObject);
begin
    edtMeasuretarget.Text := SetDirectory;
end;

procedure TFrmLMSedit.Button16Click(Sender: TObject);
begin
//TLHDSL  D3155M011200071101-C32570M00.004-007
end;

function TFrmLMSedit.ReturnLMSResult_LABEL(sSerial,
  sCustomer: string): string;
var
    i, r, nLMSCount : integer;
    ReulstList : TstringList;
    Reulstvlt : TstringList;
    sRdstr, sStr : string;
    sStpemCount, sStepName,  sitemName, sSpec, sMin,sMax, sValue, sUnit, sResult : string;
    sLMSStep,  sLMSsitem, sLineResult : string;
    sMeasure : string;
    sLMStargetFilename, stestDate : string;
begin
    ReulstList := TStringList.Create;
    Reulstvlt  := TstringList.Create;
    ReulstList.Add(Format('SerialNo,%s'   ,[EdtSerial.Text]));
    ReulstList.Add(Format('ProductNo,%s'  ,[edtModel.Text]));
    ReulstList.Add(Format('ProductInfo,%s',[edtModelInfo.Text]));
    ReulstList.Add(Format('Datetime,%s'   ,[edtDateTime.Text]));
    ReulstList.Add(Format('Result,%s'     ,[edtTotalResult.Text]));

    stestDate := ReplaceStr( edtDateTime.Text, '-', '');
    sLMStargetFilename := edtMeasuretarget.Text + '\' + Format('%s_Measure_%s.target'   ,[EdtSerial.Text, stestDate]);

    MakeDir(edtMeasuretarget.Text);
    MakeDir(edtMeasureCsv.Text);

    if not DirectoryExists(edtMeasuretarget.Text) then exit;


    MemoLMSResult.Lines := ReulstList;

    sMeasure := edtMeasureCsv.Text + '\' + Format('%s_Measure_%s.csv'   ,[EdtSerial.Text, stestDate]);
    ReulstList.SaveToFile(sMeasure);
    Reulstvlt.SaveToFile(sLMStargetFilename);    //DATA파일보다 나중에 생성
    ReulstList.Free;

{
SerialNo,150311R0434
ProductNo,M00.003-00
ProductInfo,TL GEN
Datetime,20150723-164126
Result,OK
}

end;

procedure TFrmLMSedit.Button14Click(Sender: TObject);
begin
    ReturnLMSResult_LABEL('','',);
end;

procedure TFrmLMSedit.Button15Click(Sender: TObject);
var i : integer;
    sFileName : string;
begin

    for i := 0 to FileListBox.Count-1 do
    begin
       GetTESTresult(FileListBox.Directory +'\' + FileListBox.Items[i]);
       ReturnLMSResult_LABEL('','');
    end;
end;

procedure TFrmLMSedit.FileListBoxDblClick(Sender: TObject);
begin
    FileListBox.Refresh;
end;

function TFrmLMSedit.makeStatevlt(): Boolean;
var i, CH : Integer;
    SaveDir, FileName : String;
    f: TextFile;


    nToolCount : integer;

    sToolName : string;
    sToolLife : string;
    sToolMileage : string;
    sToolUnit : string;
begin
    TimerState.Enabled := False;

    nToolCount := 2;
    if not (DirectoryExists(edtStatevlt.Text)) then
    begin
        TimerState.Enabled := True;
        exit;
    end;

    SaveDir := edtStatevlt.Text;
    MakeDir(SaveDir);

    FileName := SaveDir + '\' + Format('State.vlt', []);

    AssignFile (f, filename);
    ReWrite(f);

    try
        WriteLn (f, Format('Alive=%s',  [ FormatDateTime('YYYYMMDD-hhmmss',Now)]));
        WriteLn (f, Format('State=%d',  [ Ord(TMachineState(gState))]));
        WriteLn (f, Format('Cause=',    [ CauseString ]));
        if cbLabelOption.Checked then
        begin
            nToolCount:= 0;
            WriteLn (f, Format('ToolCount=%d'    ,   [ nToolCount ]));
        end else begin
            WriteLn (f, Format('ToolCount=%d'    ,   [ nToolCount ]));
            for i := 1 to nToolCount do
            begin
                if cbTestMode.Checked then
                begin
                    ZIniEdit(Self.FindComponent(Format('edtToolLife_%d',[i]))).Text
                    := '7000';

                    ZIniEdit(Self.FindComponent(Format('edtToolMileage_%d',[i]))).Text
                    := IntToStr(RandomRange(0,7000));
                end else begin
//                    ZIniEdit(Self.FindComponent(Format('edtToolLife_%d',[i]))).Text
//                    := FrmMelsecQ.ReadBlockCommand(ZIniEdit(Self.FindComponent(Format('edtToolLifeAddr_%d',[i]))).Text, 1,0);
//추후 연동
                    ZIniEdit(Self.FindComponent(Format('edtToolMileage_%d',[i]))).Text
                    := FrmMelsecQ.ReadBlockCommand(ZIniEdit(Self.FindComponent(Format('edtToolMileageAddr_%d',[i]))).Text, 1,0);
                end;

                sToolName    := ZIniEdit(Self.FindComponent(Format('edtToolName_%d',[i]))).Text;
                sToolLife    := ZIniEdit(Self.FindComponent(Format('edtToolLife_%d',[i]))).Text;
                sToolMileage := ZIniEdit(Self.FindComponent(Format('edtToolMileage_%d',[i]))).Text;
                sToolUnit    := ZIniEdit(Self.FindComponent(Format('edtToolUnit_%d',[i]))).Text;

                WriteLn (f, Format('ToolName_%d=%s'   ,   [ i , sToolName    ])); //Test Probe
                WriteLn (f, Format('ToolLife_%d=%s'   ,   [ i , sToolLife    ]));
                WriteLn (f, Format('ToolMileage_%d=%s',   [ i , sToolMileage ]));
                WriteLn (f, Format('ToolUnit_%d=%s'   ,   [ i , sToolUnit]));
                //WriteLn (f, Format('ToolName=%s'     ,   [ sToolName    ])); //Test Probe
                //WriteLn (f, Format('ToolLife_1=%s'   ,   [ sToolLife    ]));
                //WriteLn (f, Format('ToolMileage_1=%s',   [ sToolMileage ]));
            end;
        end;
            Flush (f);
    finally
        CloseFile (f);
    end;
end;

procedure TFrmLMSedit.FormDestroy(Sender: TObject);
begin
    TimerState.Enabled := False;
end;

end.

