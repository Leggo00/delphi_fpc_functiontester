unit FormEditModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, GradFill, ExtCtrls, ComObj, ZINICtrl,
  DPBLabel, shellapi, BaseGrid, AdvGrid, XiButton, XiPanel, ComCtrls,
  IniFiles, AdvPanel;

const
    FIELD_MODEL     = 1;  // 1번 Colume이 Key Value..
    FIELD_MODELTYPE = 2;
    FIELD_SCRIPT    = 3;

type
  TModelInfo = record
    ModelName       : String;
    ModelCode       : String;
    ECUCode         : String;
    PLCJigNum       : STRING;
    ITACUPLOAD      : Boolean;
  end;

  TFrmEditModel = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    INI: ZIniData;
    StatusBar: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid: TAdvStringGrid;
    AdvPanel1: TAdvPanel;
    BtnOpen: TXiButton;
    BtnSave: TXiButton;
    BtnReload: TXiButton;
    ZIniFormPosition1: ZIniFormPosition;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnItemSearch: TSpeedButton;
    Edit_ItemName: TEdit;
    ComboBox_ALC: TComboBox;
    ComboBox_Field: TComboBox;
    edtFileName: ZIniEdit;
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnItemSearchClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnReloadClick(Sender: TObject);
    procedure GridClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
    sBaseDir, DataFile : String;
    procedure ClearGrid();
    function  OpenXLSFile(FileName : String) : Boolean;
    function  OpenCSVFile(FileName : String) : Boolean;
    procedure MakeCodeList;
  public
    { Public declarations }
    function  OpenSPECFile(FileName: String; ReOpen : Boolean): Boolean;
    function  SaveCSVFile(FileName : String) : Boolean;

    function  GetItemByName(sKeyCode, sField : String) : String;
    function  GetItemByIndex(sKeyCode : String; nIdx : Integer) : String;

    function FindModel(sKeyCode: String) : Boolean;

  end;

var
  FrmEditModel: TFrmEditModel;
  function GetModelInfo(sModelName: String; var ModelInfo : TModelInfo): Boolean;
  function GetJIGModel(JigNum : integer): string;
  function GetModelName(aModelCode : string): string;


implementation

{$R *.dfm}

uses
    GenUtils, FormMain;

function GetModelInfo(sModelName: String; var ModelInfo : TModelInfo): Boolean;
var i : Integer;
begin
    with FrmEditModel do
    begin
        Result := False;
        for i:= 1 to Grid.RowCount-1 do begin
            if (sModelName = Grid.Cells[1, i]) then
            begin
                ModelInfo.ModelName    := Grid.Cells[1, i];
                ModelInfo.ModelCode    := Grid.Cells[2, i];
                ModelInfo.ECUCode      := Grid.Cells[3, i];
                ModelInfo.PLCJigNum    := Grid.Cells[4, i];
                ModelInfo.ITACUPLOAD   := (Grid.Cells[5, i] = 'O');;
                Result := True;
            end;
        end;
    end;
end;


function TFrmEditModel.FindModel(sKeyCode: String) : Boolean;
var nRow : Integer;
begin
    Result := False;
    if (sKeyCode = '') then exit;

    // 해당 Field에서 모델명을 가져온다.
    for nRow := 1 to Grid.RowCount-1 do
    begin
        if (Grid.Cells[FIELD_MODEL, nRow] = sKeyCode) then
        begin
            Result := True;
            break;
        end;
    end;
end;

function GetModelName(aModelCode : string): string;
var i, ColNum : Integer;
    sModelName : string;
begin
    Result := 'N/A';
    ColNum := 2;
    with FrmEditModel do
    begin
        for i:=  1 to Grid.RowCount-1 do
        begin
            if (aModelCode = Grid.Cells[ColNum, i]) then
            begin
                sModelName := Grid.Cells[1, i];
                Result := sModelName;
                break;
            end;
        end;
    end;
end;

function GetJIGModel(JigNum : integer): string;
var i, ColNum : Integer;
    sModelName : string;
begin
    Result := 'N/A';


    ColNum := 3;
    with FrmEditModel do
    begin
        for i:=  1 to Grid.RowCount-1 do
        begin
            if JigNum = StrtoIntDef(Grid.Cells[ColNum, i], 0) then
            begin
                sModelName := Grid.Cells[1, i];
                Result := sModelName;
                break;
            end;
        end;
    end;
end;


//------------------------------------------------------------------------------
// 데이터를 읽는다.
procedure TFrmEditModel.BtnOpenClick(Sender: TObject);
var FileName : String;
begin

    //FileName := sBaseDir +  Edit_SpecFile.Text;
    FileName := GetAppDir('MODEL');
    OpenDialog.Filter     := 'Excel Files (*.xls)|*.xls|CSV Files (*.csv)|*.csv';
    OpenDialog.InitialDir := sBaseDir; //ExtractFilePath(FileName);
    //OpenDialog.FileName   := FileName;
    if OpenDialog.Execute then
    begin
        OpenSPECFile(OpenDialog.FileName, True);
        MakeCodeList;
    end;

end;

//------------------------------------------------------------------------------
// 데이터를 저장한다.
procedure TFrmEditModel.BtnSaveClick(Sender: TObject);
var FileName : string;
begin
    FileName := StatusBar.Panels[1].Text;
    if FileExists(FileName) then
        ShellExecute(Application.Handle, 'open', PChar(FileName), nil, nil, SW_NORMAL)
    else
        MessageBox( FileName + ' 파일을 찾을수 없습니다.'
            , '파일에러', MB_OK or MB_ICONWARNING);
end;

procedure TFrmEditModel.BtnReloadClick(Sender: TObject);
begin
    OpenXLSFile(StatusBar.Panels[1].Text);
    MakeCodeList();
end;


//------------------------------------------------------------------------------
// CSV 파일을 읽어 변환한다.
function TFrmEditModel.OpenCSVFile(FileName : String) : Boolean;
var
    i, j, nCol, nColCount, nRowCount, nWidth : Integer;
    Str, RdStr : String;
    f : TextFile;
begin
    Result := False;
    DataFile := '';

    ClearGrid();

    if not FileExists(FileName) then exit;


    AssignFile (f, Filename);
    try
        Screen.Cursor := crHourGlass;
        Reset(f);

        nColCount := 1000;
        nRowCount := 0;
        Grid.ColCount := nColCount;


        while not Eof(f) do
        begin
            ReadLn(f, RdStr );

            Inc(nRowCount);
            Grid.RowCount := nRowCount + 1;

            nCol := 0;
            while (nCol <= nColCount) do
            begin
                Str := GetTokenTrim(RdStr, ',');

                // 첫쨰줄에서 ColCount를 결정한다.
                if (nRowCount = 1) and (nCol > 1) and (Str = '') then
                begin
                    nColCount := nCol;
                    Grid.ColCount := nColCount;
                    break;
                end;
{
                if (nRowCount > 1) and (nCol = 0) and (Str = '') then begin
                    Dec(nRowCount);
                    break;
                end;
}
                // 폭을 자동으로 계한한다.
                Grid.Canvas.Font.Name := '굴림';
                Grid.Canvas.Font.Size := 9;

                nWidth := Grid.Canvas.TextWidth(Str) + 10;
                if nWidth > Grid.ColWidths[nCol] then
                    Grid.ColWidths [nCol] := nWidth;

                Grid.Cells[nCol, nRowCount-1] := Str;

                Inc(nCol);
            end;
        end;
        Result := True;

        DataFile := FileName;
        StatusBar.Panels[1].Text := DataFile;
    finally
        CloseFile (f);
        Screen.Cursor := crDefault;
    end;
end;


//------------------------------------------------------------------------------
// CSV 파일을 읽어 변환한다.
function TFrmEditModel.SaveCSVFile(FileName : String) : Boolean;
var
    i, j, nCol, nColCount, nRowCount, nWidth : Integer;
    Str, RdStr : String;
    f : TextFile;
begin
    Result := False;
    Screen.Cursor := crHourGlass;
    try
        Grid.SaveToCSV(FileName);
    finally
        Screen.Cursor := crDefault;
    end;
              {
    DataFile := '';
    ClearGrid();

    if not FileExists(FileName) then exit;
    AssignFile (f, Filename);
    try
        Screen.Cursor := crHourGlass;
        Reset(f);
            end;
        end;
        Result := True;

        DataFile := FileName;
        Caption  := '모델파일 : ' + DataFile;
    finally
        CloseFile (f);
        Screen.Cursor := crDefault;
    end;       }
end;

//------------------------------------------------------------------------------
// EXCEL 파일을 읽어 변환한다.
function TFrmEditModel.OpenXLSFile(FileName : String) : Boolean;
var i, nRow : Integer;
    nStartCol, nStartRow : Integer;
begin
    Result := False;
    if not FileExists(Filename) then begin
        MessageBox(FileName + '파일이 없습니다.', '파일확인', MB_OK or MB_ICONERROR);
        Exit;
    end;
    StatusBar.Panels[1].Text := Filename;

    nStartCol := 2;
    nStartRow := 2;
    
    try
        Screen.Cursor := crHourGlass;
{
        GridTemp.Clear;
        GridTemp.LoadFromXLS(Filename);

        GridTemp

{
        for nRow := 0 to GridTemp.RowCount-1 do begin
            if GridTemp.Cells[nStartCol, n
        end;

}
        Grid.Clear; // 추가 2007.10.26.
        Grid.LoadFromXLS(Filename);
//        Grid.RemoveRows(0, 0);
        //Grid.RemoveCols(1, 4);
        
        for i:= 0 to Grid.ColCount-1 do
            Grid.AutoSizeCol(i);
    finally
        Screen.Cursor := crDefault;
    end;
end;



//------------------------------------------------------------------------------
// 테이블에서 Field명을 찾기 테스트...
procedure TFrmEditModel.BtnItemSearchClick(Sender: TObject);
var Str : String;
begin
    Str := GetItemByName(ComboBox_ALC.Text, ComboBox_Field.Text );
    if Str <> '' then begin
        Edit_ItemName.Font.Color := clBlue;
        Edit_ItemName.Text := Str;
    end
    else begin
        Edit_ItemName.Font.Color := clRed;
        Edit_ItemName.Text := 'N/A';
    end;
end;

//------------------------------------------------------------------------------
// 테이블에서 Field명을 찾는다.
procedure TFrmEditModel.ClearGrid();
var nCol, nRow : Integer;
begin
    for nRow := 0 to Grid.RowCount-1 do
    for nCol := 0 to Grid.ColCount-1 do
        Grid.Cells[nCol, nRow] := '';

    Grid.ColCount := 2;
    Grid.RowCount := 2;
end;

//------------------------------------------------------------------------------
// 테이블에서 Field명을 찾는다.
function TFrmEditModel.GetItemByName(sKeyCode, sField : String) : String;
var nCol, nRow : Integer;
    FieldIdx : Integer;
    CellData : String;
begin
    Result := 'N/A';

    sField := UpperCase(sField);

    FieldIdx := -1;
    for nCol := 1 to Grid.ColCount-1 do
    begin
        CellData := UpperCase( Trim( Grid.Cells[nCol, 0]) );
        if (CellData = sField ) then FieldIdx := nCol;
        if (FieldIdx > 0)       then break;
    end;
    if (FieldIdx < 0) then exit;

    // 해당 Field에서 데이터를 가져온다.
    for nRow := 1 to Grid.RowCount-1 do
    begin
        if (Grid.Cells[FIELD_MODEL, nRow] = sKeyCode) then begin
            Result := Grid.Cells[FieldIdx, nRow];
            break;
        end;
    end;
end;
//------------------------------------------------------------------------------
// 테이블에서 Field명을 찾는다.
function TFrmEditModel.GetItemByIndex(sKeyCode : String; nIdx : Integer) : String;
var nRow : Integer;
begin
    Result := 'N/A';
    if (nIdx < 0) or (nIdx >= Grid.ColCount) then exit;

    // 해당 Field에서 데이터를 가져온다.
    for nRow := 1 to Grid.RowCount-1 do
    begin
        if (Grid.Cells[FIELD_MODEL, nRow] = sKeyCode) then begin
            Result := Grid.Cells[nIdx, nRow];
            break;
        end;
    end;
end;
//------------------------------------------------------------------------------
// 폼이 생성될때.
procedure TFrmEditModel.FormCreate(Sender: TObject);
begin
    sBaseDir := GetAppDir('MODEL');
    INI.LoadData;
    OpenXLSFile( sBaseDir +  edtFileName.Text);
    MakeCodeList();
end;

//------------------------------------------------------------------------------
// 폼이 CLOSE시..
procedure TFrmEditModel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    INI.SaveData;
end;

var LastSpecFile : String;

function TFrmEditModel.OpenSPECFile(FileName: String; ReOpen : Boolean): Boolean;
var sExt : String;
begin
    Result := False;
    if (LastSpecFile = FileName) and (not ReOpen) then exit;
    edtFileName.Text := ExtractFileName(FileName);

    //FrmMessage.RunMessage('모델파일을 읽는 중 입니다. 잠시만 기다려 주세요.');
    try
        sExt := Uppercase(ExtractFileExt(FileName));
        if (sExt = '.XLS') then
            Result := OpenXLSFile(FileName);

        if (sExt = '.CSV') then
            Result := OpenCSVFile(FileName);

        if Result then
            LastSpecFile := FileName;

        StatusBar.Panels[1].Text := FileName;
    finally
    //    FrmMessage.Close;
    end;
end;


procedure TFrmEditModel.MakeCodeList;
var i : Integer;
    Str : String;
begin
    ComboBox_ALC.Items.Clear;
    for i:= 1 to Grid.RowCount-1 do begin
        Str := Trim(Grid.Cells[1, i]);
        if Str <> '' then
        begin
            Str := Str + '/' + Trim(Grid.Cells[2, i]);
            ComboBox_ALC.Items.Add(Str);
        end;
    end;

    FrmMain.cmbModelList.Items := ComboBox_ALC.Items;


    ComboBox_Field.Items.Clear;
    for i:= 2 to Grid.ColCount-1 do begin
        Str := Trim(Grid.Cells[i, 0]);
        if Str <> '' then
            ComboBox_Field.Items.Add(Str);
    end;

end;
{
// INI파일에서 정보를 가져온다...
function GetItemByNameFromINI(IniFileName, Section, ItemName : String ) : String;
var INI : TIniFile;
begin
    Result := '';
    if (Section = '') or (ItemName = '') then exit;

    INI := TIniFile.Create(IniFileName);
    try
        Result := INI.ReadString(Section, ItemName, '');
    finally
        INI.Free;
    end;
end;

}


procedure TFrmEditModel.GridClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
    if ACol = 1 then
    begin

    end;
end;

end.
