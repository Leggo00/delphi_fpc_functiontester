unit FormStepEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, chkgrid, StdCtrls, Buttons, DPBLabel,
  IniFiles, FileCtrl, GradFill;

type
  TFrmStepEdit = class(TForm)
    Panel1: TPanel;
    BtnOpen: TBitBtn;
    BtnSave: TBitBtn;
    Label_ModelName: TdpbLabel;
    BtnSaveAs: TBitBtn;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    BtnOk: TBitBtn;
    BtnClose: TBitBtn;
    BtnResEdit: TBitBtn;
    BtnCheck: TBitBtn;
    Label_StepName: TdpbLabel;
    dpbLabel1: TdpbLabel;
    dpbLabel2: TdpbLabel;
    dpbLabel3: TdpbLabel;
    BtnInput1Add: TSpeedButton;
    BtnInput1Delete: TSpeedButton;
    BtnOutputAdd: TSpeedButton;
    BtnOutputDelete: TSpeedButton;
    BtnOptionAdd: TSpeedButton;
    BtnCheck2Add: TSpeedButton;
    SpeedButton11: TSpeedButton;
    BtnInput1Dn: TSpeedButton;
    BtnInput1Up: TSpeedButton;
    BtnOutput1Up: TSpeedButton;
    BtnOutput1Dn: TSpeedButton;
    btnConditionUp: TSpeedButton;
    btnConditionDn: TSpeedButton;
    InputGrid1: TCheckStringGrid;
    CheckGrid: TCheckStringGrid;
    OutputGrid: TCheckStringGrid;
    OptionGrid: TCheckStringGrid;
    InputGrid2: TCheckStringGrid;
    dpbLabel4: TdpbLabel;
    BtnInput2Add: TSpeedButton;
    BtnInput2Delete: TSpeedButton;
    BtnInput2Dn: TSpeedButton;
    BtnInput2Up: TSpeedButton;
    BtnCheckAdd: TSpeedButton;
    StatusBar: TStatusBar;
    BtnStepMemo1: TSpeedButton;
    BtnStepMemo2: TSpeedButton;
    BtnStepMemo3: TSpeedButton;
    BtnStepMemo4: TSpeedButton;
    BtnStepMemo5: TSpeedButton;
    dpbLabel6: TdpbLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnStepAdd: TSpeedButton;
    BtnStepDelete: TSpeedButton;
    BtnStepMoveUp: TSpeedButton;
    BtnStepMoveDn: TSpeedButton;
    BtnStepCopy: TSpeedButton;
    dpbLabel5: TdpbLabel;
    StepGrid: TCheckStringGrid;
    Shape15: TShape;
    Shape16: TShape;
    GradientFill6: TGradientFill;
    dpbLabel50: TdpbLabel;
    Panel2: TPanel;
    Memo: TMemo;
    procedure BtnSaveAsClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnStepAddClick(Sender: TObject);
    procedure StepGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnResEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnInputAddClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure InputGrid1DblClick(Sender: TObject);
    procedure BtnOptionAddClick(Sender: TObject);
    procedure BtnOutputAddClick(Sender: TObject);
    procedure BtnInputDeleteClick(Sender: TObject);
    procedure BtnOutputDeleteClick(Sender: TObject);
    procedure BtnCheck2AddClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BtnStepDeleteClick(Sender: TObject);
    procedure BtnStepMoveUpClick(Sender: TObject);
    procedure BtnStepMoveDnClick(Sender: TObject);
    procedure BtnStepCopyClick(Sender: TObject);
    procedure StepGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StepGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure BtnInput1UpClick(Sender: TObject);
    procedure BtnInput1DnClick(Sender: TObject);
    procedure BtnOutput1UpClick(Sender: TObject);
    procedure BtnOutput1DnClick(Sender: TObject);
    procedure btnConditionUpClick(Sender: TObject);
    procedure btnConditionDnClick(Sender: TObject);
    procedure OutputGridDblClick(Sender: TObject);
    procedure CheckGridDblClick(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    function  CheckStep() : Boolean;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure InputGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InputGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OutputGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StepGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BtnStepMemoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoEnter(Sender: TObject);
    procedure MemoExit(Sender: TObject);
  private
    { Private declarations }
    bChanged  : Boolean;
    bReadOnly : Boolean;

    procedure GetStepEnable();
    procedure DisplayStepList();
    procedure DisplayStepInfo(Idx : Integer);
    procedure StrListToGrid(StrList : TStringList; Grid : TStringGrid);
  public
    { Public declarations }

    function MoveUpList(Grid : TCheckStringGrid; Idx : integer) : Boolean;
    function MoveDnList(Grid : TCheckStringGrid; Idx : integer) : Boolean;

    function Execute(StepName : String; bReadOnly : Boolean = False) : Boolean;
  end;

var
  FrmStepEdit: TFrmStepEdit;

implementation

uses FormResEdit, GenUtils, Global, FormSelInput, FormStepOption,
  FormMeasItem, FormStepToMemo;

{$R *.dfm}

function TFrmStepEdit.Execute(StepName : String; bReadOnly : Boolean = False) : Boolean;
var i : Integer;
    FileName : String;
begin
    Self.bReadOnly := bReadOnly;

    FileName := gBaseDir + 'PROJECT\' + gProjectFileName;
    CurrProject.LoadFromFile(FileName);

    // 화면에 초기상태를 표시한다.
    Label_ModelName.Caption := gProjectFileName;
    StatusBar.Panels[1].Text := FileName;
    DisplayStepList();

    for i:= 1 to StepGrid.RowCount-1 do begin
        if (StepGrid.Cells[1, i] = StepName) then
        begin
            StepGrid.Row := i;
            DisplayStepInfo(i-1);
            break;
        end
    end;

    if (ShowModal = mrOk) then begin
        Result := True;
    end else
        Result := False;
end;

procedure TFrmStepEdit.BtnOpenClick(Sender: TObject);
begin
    with OpenDialog do begin
        InitialDir := gBaseDir + 'PROJECT\';
        if Execute then begin
            CurrProject.LoadFromFile(FileName);

            gProjectFileName := ExtractFileName(FileName);
            Label_ModelName.Caption := gProjectFileName;

            StatusBar.Panels[1].Text := FileName;
            DisplayStepList();

            bChanged := False;
        end;
    end;
end;

procedure TFrmStepEdit.GetStepEnable();
var i : Integer;
    TestStep : TTestStep;
begin
    for i:=0 to CurrProject.GetStepCount-1 do begin
        TestStep := CurrProject.GetStep(i);
        if (TestStep <> nil) then begin
            TestStep.StepName := StepGrid.Cells[1, i+1];
            TestStep.Enabled  := (StepGrid.Cells[2, i+1] = 'T');
        end;
    end;
end;

procedure TFrmStepEdit.BtnSaveClick(Sender: TObject);
var
    FileName : String;
begin
    GetStepEnable();
    CheckStep();

    FileName := gBaseDir + 'PROJECT\' + gProjectFileName;

    if CurrProject.SaveToFile(FileName) then
    begin
        MessageBox( gProjectFileName + ' - 파일이 저장되었습니다.',
                '프로젝트 열기', MB_OK or MB_ICONINFORMATION);
        bChanged := False;
    end;
end;


procedure TFrmStepEdit.BtnSaveAsClick(Sender: TObject);
begin
    GetStepEnable();
    CheckStep();

    with SaveDialog do begin
        InitialDir := gBaseDir + 'PROJECT\';
        if Execute then begin
            CurrProject.SaveToFile(FileName);
            StatusBar.Panels[1].Text := FileName;

            gProjectFileName := ExtractFileName(FileName);
            Label_ModelName.Caption := gProjectFileName;

            MessageBox( gProjectFileName + ' - 파일이 저장되었습니다.',
                '프로젝트 열기', MB_OK or MB_ICONINFORMATION);
            bChanged := False;
        end;
    end;
end;

procedure TFrmStepEdit.BtnResEditClick(Sender: TObject);
begin
    FrmResEdit.Execute();
    DisplayStepInfo(StepGrid.Row-1);
    bChanged := True;
end;


procedure TFrmStepEdit.DisplayStepList();
var i, nRow, nStepCount : Integer;
    TestStep : TTestStep;
begin
    nStepCount := CurrProject.GetStepCount();
    if nStepCount = 0 then begin
        StepGrid.RowCount := 2;
        for i:= 0 to 3 do
            StepGrid.Cells[i, 1] := '';
    end else StepGrid.RowCount := nStepCount+1;

                 
    for i:=0 to nStepCount-1 do begin
        nRow := i+1;
        TestStep := CurrProject.GetStep(i);
        if TestStep <> nil then begin
            StepGrid.Cells[0,nRow] := IntToStr(nRow);
            StepGrid.Cells[1,nRow] := TestStep.StepName;

            if TestStep.Enabled then StepGrid.Cells[2,nRow] := 'T'
                                else StepGrid.Cells[2,nRow] := 'F';
        end;
    end;
    DisplayStepInfo(StepGrid.Row-1);
end;

procedure TFrmStepEdit.StrListToGrid(StrList : TStringList; Grid : TStringGrid);
var nCol, nRow, nCount : Integer;
    RdStr : String;
begin
    with Grid do begin
        for nRow :=1 to RowCount-1 do
        for nCol :=0 to ColCount-1 do
            Cells[nCol, nRow] := '';

        if StrList = nil then begin
            RowCount := 2;
            exit;
        end else begin
            nCount := StrList.Count;
            if nCount = 0 then RowCount := 2
                          else RowCount := nCount+1;

            for nRow := 1 to nCount do begin
                RdStr := StrList[nRow-1];
                for nCol :=0 to ColCount-1 do begin
                    Cells[nCol, nRow] := GetToken(RdStr, ';');
                end;
            end;
        end;
    end;
end;

procedure TFrmStepEdit.DisplayStepInfo(Idx : Integer);
var TestStep : TTestStep;
begin
    TestStep := CurrProject.GetStep(Idx);
    if TestStep <> nil then begin
        InputGrid1.DrawList := TestStep.InputList1;
        InputGrid2.DrawList := TestStep.InputList2;
        OutputGrid.DrawList := TestStep.OutputList;
        CheckGrid.DrawList  := TestStep.CheckList;
        OptionGrid.DrawList := TestStep.OptionList;

       // Memo.Lines.Assign(TestStep.MemoList);

        Label_StepName.Caption := TestStep.StepName;
    end else begin
        InputGrid1.DrawList := nil;
        InputGrid2.DrawList := nil;
        OutputGrid.DrawList := nil;
        CheckGrid.DrawList  := nil;
        OptionGrid.DrawList := nil;

        ClearGrid(InputGrid1);
        ClearGrid(InputGrid2);
        ClearGrid(OutputGrid);
        ClearGrid(CheckGrid);
        ClearGrid(OptionGrid);
        Memo.Clear;

        Label_StepName.Caption := '[NO STEP]';
    end;
end;

procedure TFrmStepEdit.BtnStepAddClick(Sender: TObject);
var nStepCount : Integer;
    TestStep : TTestStep;
begin
    GetStepEnable();

    TestStep := TTestStep.Create;

    nStepCount := CurrProject.AddStep(TestStep);
    TestStep.StepName := Format('STEP_%d', [nStepCount+1]);

    DisplayStepList();
end;

procedure TFrmStepEdit.BtnStepDeleteClick(Sender: TObject);
var Idx : Integer;
begin
    GetStepEnable();

    if MessageBox('Delete Step.', 'Confirm', MB_OKCANCEL or MB_ICONINFORMATION) = IDOK then
    begin
        Idx := StepGrid.Row-1;
        CurrProject.DeleteStep(Idx);

        DisplayStepList();
    end;
end;


procedure TFrmStepEdit.BtnStepCopyClick(Sender: TObject);
var Idx : Integer;
    NewStep, SelStep : TTestStep;
begin
    GetStepEnable();

    Idx := StepGrid.Row-1;

    SelStep := CurrProject.GetStep(Idx);
    if SelStep <> nil then begin
        NewStep := TTestStep.Create;
        NewStep.Assign(SelStep);

        NewStep.StepName :=  'Copy-' + NewStep.StepName; 
        CurrProject.InsertStep(Idx, NewStep);
        DisplayStepList();

        BtnStepMoveDnClick(Sender);
    end;
end;


procedure TFrmStepEdit.BtnStepMoveUpClick(Sender: TObject);
var Idx : Integer;
    TempStep, SelStep1, SelStep2 : TTestStep;
begin
    GetStepEnable();

    Idx := StepGrid.Row-1;

    SelStep1 := CurrProject.GetStep(Idx-1);
    SelStep2 := CurrProject.GetStep(Idx  );

    if (SelStep1 <> nil) and (SelStep2 <> nil) then
    begin
        TempStep := TTestStep.Create;
        try
            TempStep.Assign(SelStep1);

            SelStep1.Assign(SelStep2);
            SelStep2.Assign(TempStep);
            StepGrid.Row := Idx;
        finally
            TempStep.Free;
        end;
        DisplayStepList();
    end;
end;

procedure TFrmStepEdit.BtnStepMoveDnClick(Sender: TObject);
var Idx : Integer;
    TempStep, SelStep1, SelStep2 : TTestStep;
begin
    GetStepEnable();

    Idx := StepGrid.Row-1;

    SelStep1 := CurrProject.GetStep(Idx  );
    SelStep2 := CurrProject.GetStep(Idx+1);

    if (SelStep1 <> nil) and (SelStep2 <> nil) then
    begin
        TempStep := TTestStep.Create;
        try
            TempStep.Assign(SelStep1);

            SelStep1.Assign(SelStep2);
            SelStep2.Assign(TempStep);
            StepGrid.Row := Idx+2;
        finally
            TempStep.Free;
        end;
        DisplayStepList();
    end;
end;

procedure TFrmStepEdit.StepGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: BtnStepMoveUp.Click;
        VK_F6	: BtnStepMoveDn.Click;
        VK_F8	: BtnStepCopy.Click;
    end;
end;


procedure TFrmStepEdit.StepGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    DisplayStepInfo(ARow - 1);
//    if ACol = 2 then
//        CanSelect := False;
end;


procedure TFrmStepEdit.FormCreate(Sender: TObject);
begin

    with StepGrid do begin
        Cells[0,0] := 'NO.';
        Cells[1,0] := 'Step Name';
        Cells[2,0] := 'Use';
    end;

    with InputGrid1 do begin
        Cells[0,0] := 'Input Item';
        Cells[1,0] := 'Value';
    end;

    with InputGrid2 do begin
        Cells[0,0] := 'Input Item';
        Cells[1,0] := 'Value';
    end;

    with OutputGrid do begin
        Cells[0,0] := 'Output Item';
        Cells[1,0] := 'Value';
    end;

    with CheckGrid do begin
        Cells[0,0] := 'Measure Item';
        Cells[1,0] := 'Spec';
        Cells[2,0] := 'Unit';
        Cells[3,0] := 'Option';
        Cells[4,0] := 'CP';
    end;

    with OptionGrid do begin
        Cells[0,0] := 'Option Item';
        Cells[1,0] := 'Value';
    end;

end;

procedure TFrmStepEdit.BtnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmStepEdit.BtnCloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;


procedure TFrmStepEdit.BtnInputAddClick(Sender: TObject);
begin
    FrmSelInput.ComboBox_ResParam.Text := 'ON';
    if (Sender = BtnInput1Add) then begin
        if (FrmSelInput.Execute(InputGrid1.DrawList, ITEM_INPUT) <> '') then
            InputGrid1.Refresh;
    end else
    if (Sender = BtnInput2Add) then begin
        if (FrmSelInput.Execute(InputGrid2.DrawList, ITEM_INPUT) <> '') then
            InputGrid2.Refresh;
    end else
    if (Sender = BtnCheck2Add) then begin
        FrmSelInput.ComboBox_ResParam.Text := '~';
        if (FrmSelInput.Execute(CheckGrid.DrawList, ITEM_OUTPUT) <> '') then
            CheckGrid.Refresh;
    end;
end;

procedure TFrmStepEdit.BtnOutputAddClick(Sender: TObject);
begin
    if (FrmSelInput.Execute(OutputGrid.DrawList, ITEM_ALL) <> '') then
        OutputGrid.Refresh;
end;

function TFrmStepEdit.MoveUpList(Grid : TCheckStringGrid; Idx : integer) : Boolean;
var TempStr : String;
begin
    Result := False;
    if (Idx > 0) and (Idx < Grid.DrawList.Count) then begin
        TempStr := Grid.DrawList[Idx-1];
        Grid.DrawList[Idx-1] := Grid.DrawList[Idx];
        Grid.DrawList[Idx]   := TempStr;
        Grid.Refresh;

        Result := True;
    end;
end;

function TFrmStepEdit.MoveDnList(Grid : TCheckStringGrid; Idx : integer) : Boolean;
var TempStr : String;
begin
    Result := False;
    if (Idx >= 0) and (Idx < Grid.DrawList.Count-1) then
    begin
        TempStr := Grid.DrawList[Idx+1];
        Grid.DrawList[Idx+1] := Grid.DrawList[Idx];
        Grid.DrawList[Idx]   := TempStr;
        Grid.Refresh;

        Result := True;
    end;
end;

procedure TFrmStepEdit.BtnInput1UpClick(Sender: TObject);
var Idx : integer;
    Grid : TCheckStringGrid;
begin
    if (Sender = BtnInput1Up) then Grid := InputGrid1 else
    if (Sender = BtnInput2Up) then Grid := InputGrid2 else exit;

    Idx := Grid.Row-1;
    if MoveUpList(Grid, Idx) then
        Grid.Row := Idx;
end;

procedure TFrmStepEdit.BtnInput1DnClick(Sender: TObject);
var  Idx : integer;
     Grid : TCheckStringGrid;
begin
    if (Sender = BtnInput1Dn) then Grid := InputGrid1 else
    if (Sender = BtnInput2Dn) then Grid := InputGrid2 else exit;

    Idx := Grid.Row-1;
    if MoveDnList(Grid, Idx) then
        Grid.Row := Idx+2;
end;

procedure TFrmStepEdit.BtnOutput1UpClick(Sender: TObject);
var Idx : integer;
    Grid : TCheckStringGrid;
begin
    Grid := OutputGrid;

    Idx := Grid.Row-1;
    if MoveUpList(Grid, Idx) then
        Grid.Row := Idx;
end;

procedure TFrmStepEdit.BtnOutput1DnClick(Sender: TObject);
var  Idx : integer;
     Grid : TCheckStringGrid;
begin
    Grid := OutputGrid;

    Idx := Grid.Row-1;
    if MoveDnList(Grid, Idx) then
        Grid.Row := Idx + 2;
end;

procedure TFrmStepEdit.btnConditionUpClick(Sender: TObject);
var Idx : integer;
    Grid : TCheckStringGrid;
begin
    Grid := CheckGrid;

    Idx := Grid.Row-1;
    if MoveUpList(Grid, Idx) then
        Grid.Row := Idx;
end;

procedure TFrmStepEdit.btnConditionDnClick(Sender: TObject);
var  Idx : integer;
     Grid : TCheckStringGrid;
begin
    Grid := CheckGrid;

    Idx := Grid.Row-1;
    if MoveDnList(Grid, Idx) then
        Grid.Row := Idx + 2;
end;


procedure TFrmStepEdit.BtnInputDeleteClick(Sender: TObject);
var Idx : Integer;
    Grid : TCheckStringGrid;
begin
    if (Sender = BtnInput1Delete) then Grid := InputGrid1 else
    if (Sender = BtnInput2Delete) then Grid := InputGrid2 else exit;

    with Grid do begin
        Idx := Row-1;
        if  Idx < DrawList.Count then begin
            DrawList.Delete(Idx);
            Refresh;
        end;
    end;
end;

procedure TFrmStepEdit.BtnOutputDeleteClick(Sender: TObject);
var Idx : Integer;
begin
    with OutputGrid do begin
        Idx := Row-1;
        if  Idx < DrawList.Count then begin
            DrawList.Delete(Idx);
            Refresh;
        end;
    end;
end;

procedure TFrmStepEdit.BtnCheck2AddClick(Sender: TObject);
var
    Idx : Integer;
    CurrStep : TTestStep;
    RdStr, NewItem, NewParam, NewOption, NewCP, NewUnit : String;
begin
    Idx := StepGrid.Row-1;
    CurrStep := CurrProject.GetStep(Idx);
    if CurrStep = nil then exit;

    NewItem   := '';
    NewParam  := '';
    NewUnit   := '';
    NewOption := '';
    NewCP     := 'F';

    if FrmMeasItem.Execute(CurrStep, NewItem, NewParam, NewOption, NewCP, NewUnit) then begin
        RdStr := NewItem + ';' + NewParam + ';' + NewUnit + ';' + NewOption + ';' + NewCP;
        
        if (CurrStep.CheckList.Count > 0) and (CurrStep.CheckList[0] = ';;;;') then
            CurrStep.CheckList[0] := RdStr
        else
            CurrStep.CheckList.Add(RdStr);
    end;
    CheckGrid.Refresh;
end;

procedure TFrmStepEdit.CheckGridDblClick(Sender: TObject);
var Idx : Integer;
    CurrStep : TTestStep;
    RdStr, NewItem, NewParam, NewOption, NewCP, NewUnit : String;
begin
    exit;
    
    Idx := StepGrid.Row-1;
    CurrStep := CurrProject.GetStep(Idx);

    if CurrStep = nil then exit;
    Idx := CheckGrid.Row-1;
    if (Idx <0) or (Idx >= CurrStep.CheckList.Count) then exit;

    RdStr := CurrStep.CheckList[Idx];

    NewItem   := GetToken(RdStr, ';');
    NewParam  := GetToken(RdStr, ';');
    NewUnit   := GetToken(RdStr, ';');
    NewOption := GetToken(RdStr, ';');
    NewCP     := GetToken(RdStr, ';');

    if FrmMeasItem.Execute(CurrStep, NewItem, NewParam, NewOption, NewCP, NewUnit) then begin
        CurrStep.CheckList[Idx] := NewItem + ';' + NewParam + ';' + NewUnit + ';' + NewOption + ';' + NewCP;
    end;
    CheckGrid.Refresh;
end;


procedure TFrmStepEdit.SpeedButton11Click(Sender: TObject);
var Idx : Integer;
begin
    with CheckGrid do begin
        Idx := Row-1;
        if  Idx < DrawList.Count then begin
            DrawList.Delete(Idx);
            Refresh;
        end;
    end;
end;



procedure TFrmStepEdit.InputGrid1DblClick(Sender: TObject);
var NewItem, NewParam : String;
begin
{
    with InputGrid do begin
        if DrawList.Count < 1 then exit;

        NewItem  := Cells[0, Row];
        NewParam := Cells[1, Row];

        if FrmSelInput.Execute(ITEM_INPUT, NewItem, NewParam) then begin
            DrawList[Row-1] := NewItem + ';' + NewParam + ';';
            Refresh;
        end;
    end;
}
end;

procedure TFrmStepEdit.BtnOptionAddClick(Sender: TObject);
begin
    with OptionGrid do begin
        if FrmStepOption.Execute(DrawList) then begin
            Refresh;
        end;
    end;
end;

procedure TFrmStepEdit.StepGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var i : Integer;
    TestStep : TTestStep;
begin
    TestStep := CurrProject.GetStep(ARow-1);
    if (TestStep <> nil) then begin
        TestStep.StepName := Value;
        TestStep.Enabled  := (StepGrid.Cells[2, ARow] = 'T');
    end;
end;


procedure TFrmStepEdit.OutputGridDblClick(Sender: TObject);
var NewItem, NewParam : String;
begin
{
    with OutputGrid do begin
        if DrawList.Count < 1 then exit;

        NewItem  := Cells[0, Row];
        NewParam := Cells[1, Row];

        if FrmSelInput.Execute(ITEM_OUTPUT, NewItem, NewParam) then begin
            DrawList[Row-1] := NewItem + ';' + NewParam + ';';
            Refresh;
        end;
    end;
}
end;

procedure TFrmStepEdit.BtnCheckClick(Sender: TObject);
begin
    if CheckStep() then
        MessageBox('입력검증 완료.', '입력검증', MB_ICONINFORMATION or MB_OK);
end;

function TFrmStepEdit.CheckStep() : Boolean;
var i, j, k : Integer;
    TestStep, TestStep2 : TTestStep;
    Str, RdStr, ResName : String;
    ResourceItem : TResourceItem;

    bOk : Boolean;
begin
    Result := True;


    for i:=0 to CurrProject.GetStepCount-1 do begin
        TestStep := CurrProject.GetStep(i);

        if (TestStep <> nil) then begin
            // StepName Check.
            for j:= i+1 to CurrProject.GetStepCount-1 do begin
                TestStep2 := CurrProject.GetStep(j);
                if (TestStep2 <> nil) and (TestStep.StepName = TestStep2.StepName) then begin
                    MessageBox(Format('STEP-%d 와 STEP-%d 의 [%s] 스텝명이 중복되었습니다.',
                        [i, j, TestStep.StepName]), '스텝이름', MB_ICONERROR or MB_OK);
                    Result := False;
                    exit;
                end;
            end;

            // Input1 Condition.
            bOk := True;
            for j:=0 to TestStep.InputList1.Count-1 do begin
                RdStr := TestStep.InputList1[j];
                ResName := GetToken(RdStr, ';');
                if ResName = '' then continue;
                
                ResourceItem := CurrProject.GetResource(ITEM_INPUT, ResName);
                if (ResourceItem.ResName = '') then begin
                    bOk := False;
                    for k:=Low(CmdList) to High(CmdList) do begin
                        if ResName = CmdList[k] then begin
                            bOk := True;
                        end;
                    end;

                    if (not BOk) then begin
                        MessageBox(Format('STEP-%d 의 입력항목 %s (이)가 잘못된 자원이름 입니다.',
                            [i+1, ResName]), '입력항목', MB_ICONERROR or MB_OK);
                        Result := False;
                        exit;
                    end;
                end;
            end;

            // Input2 Condition.
            for j:=0 to TestStep.InputList2.Count-1 do begin
                RdStr := TestStep.InputList2[j];
                ResName := GetToken(RdStr, ';');
                if ResName = '' then continue;
                
                ResourceItem := CurrProject.GetResource(ITEM_INPUT, ResName);
                if (ResourceItem.ResName = '') then begin
                    bOk := False;
                    for k:=Low(CmdList) to High(CmdList) do begin
                        if ResName = CmdList[k] then begin
                            bOk := True;
                        end;
                    end;

                    if (not BOk) then begin
                        MessageBox(Format('STEP-%d 의 측정후조건 %s (이)가 잘못된 자원이름 입니다.',
                            [i+1, ResName]), '측정후조건', MB_ICONERROR or MB_OK);
                        Result := False;
                        exit;
                    end;
                end;
            end;

            // Output Condition.
            for j:=0 to TestStep.OutputList.Count-1 do begin
                RdStr := TestStep.OutputList[j];
                ResName := GetToken(RdStr, ';');
                if ResName = '' then continue;

                ResourceItem := CurrProject.GetResource(ITEM_ALL, ResName);
                if (ResourceItem.ResName = '') then begin
                    MessageBox(Format('STEP-%d 의 출력항목 %s (이)가 잘못된 자원이름 입니다.',
                        [i+1, ResName]), '출력항목', MB_ICONERROR or MB_OK);
                    Result := False;
                    exit;
                end;
            end;

        end;
    end;
end;

procedure TFrmStepEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if bChanged then
    begin
        if MessageBox('시험설정을 저장합니다.', '저장확인', MB_YESNO or MB_ICONQUESTION) = IDYES then
        begin 
            BtnSaveClick(Sender);
        end;
    end;
    CanClose := True;
end;

procedure TFrmStepEdit.InputGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: BtnInput1Up.Click;
        VK_F6	: BtnInput1Dn.Click;
    end;
end;

procedure TFrmStepEdit.InputGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: BtnInput2Up.Click;
        VK_F6	: BtnInput2Dn.Click;
    end;
end;

procedure TFrmStepEdit.OutputGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: BtnOutput1Up.Click;
        VK_F6	: BtnOutput1Dn.Click;
    end;
end;

procedure TFrmStepEdit.CheckGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_F5	: btnConditionUp.Click;
        VK_F6	: btnConditionDn.Click;
    end;
end;

procedure TFrmStepEdit.StepGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Str : String;
begin
    Str := StepGrid.Cells[ACol, ARow];
    if (Length(Str) > 2) and (Str[1] = '[') and (Str[Length(Str)] = ']') then begin
        with StepGrid.Canvas do begin
            Font.Style  := [fsBold];
            Brush.Color := clMoneyGreen;
            FillRect(Rect);
            DrawText(Handle, PChar(Str), Length(Str), Rect, DT_SINGLELINE or DT_VCENTER);
        end;
    end;
end;

procedure TFrmStepEdit.BtnStepMemoClick(Sender: TObject);
var Strings : TStrings;
    CheckStringGrid : TCheckStringGrid;
    sCaption : String;
begin
    FrmStepToMemo := TFrmStepToMemo.Create(Self);
    try
        if (Sender = BtnStepMemo1) then begin
            CheckStringGrid := InputGrid1;
            sCaption := '입력조건';
        end else
        if (Sender = BtnStepMemo2) then begin
            CheckStringGrid := InputGrid2;
            sCaption := '측정후조조건';
        end else
        if (Sender = BtnStepMemo3) then begin
            CheckStringGrid := OutputGrid;
            sCaption := '출력항목';
        end else
        if (Sender = BtnStepMemo4) then begin
            CheckStringGrid := OptionGrid;
            sCaption := '측정옵션';
        end else
        if (Sender = BtnStepMemo5) then begin
            CheckStringGrid := CheckGrid;
            sCaption := '검사항목';
        end else
            exit;

        FrmStepToMemo.Memo.Lines.Assign(CheckStringGrid.DrawList);
        if (FrmStepToMemo.ShowModal = mrOK) then begin
            CheckStringGrid.DrawList.Assign(FrmStepToMemo.Memo.Lines);
            CheckStringGrid.Refresh;
        end;

    finally
        FrmStepToMemo.Free;
    end;
end;

procedure TFrmStepEdit.FormShow(Sender: TObject);
begin
//    if (Self = Application.MainForm) then begin
   //   Execute('');
   // end;
end;

procedure TFrmStepEdit.MemoEnter(Sender: TObject);
begin
   // Caption := 'ENTER';
end;

procedure TFrmStepEdit.MemoExit(Sender: TObject);
var Idx : Integer;
    SelStep : TTestStep;
begin
  {  Idx := StepGrid.Row-1;

    SelStep := CurrProject.GetStep(Idx);
    if SelStep <> nil then
        SelStep.MemoList.Assign(Memo.Lines);   }
end;

end.
