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
  TFrmEditModel = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    INI: ZIniData;
    StatusBar: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid: TAdvStringGrid;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnItemSearch: TSpeedButton;
    BtnOpen: TXiButton;
    BtnSave: TXiButton;
    Edit_ItemName: TEdit;
    ComboBox_ALC: TComboBox;
    ComboBox_Field: TComboBox;
    BtnReload: TXiButton;
    GridTemp: TAdvStringGrid;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnItemSearchClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnReloadClick(Sender: TObject);
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

    procedure GetSeqList(StrList : TStrings);
    procedure GetSeqListValue(sKeyCode: String; StrList : TStrings);

    function FindModel(sKeyCode: String) : Boolean;
  end;

var
  FrmEditModel: TFrmEditModel;


implementation

{$R *.dfm}

uses
    GenUtils;

procedure TFrmEditModel.BtnCloseClick(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// 현재 선택된 모델의 필드리스트를 가져온다.
// 필드명을 구분하기 위해서 필드명 앞뒤에는 '<', '>'가 붙는다.
procedure TFrmEditModel.GetSeqList(StrList : TStrings);
var i : Integer;
    Str : String;
begin
    StrList.Clear;
    for i:= 1 to Grid.ColCount-1 do begin
        Str := Trim(Grid.Cells[i, 0]);
        if Str <> '' then
//            StrList.Add('<' + Str + '>');
            StrList.Add( Str );
    end;
end;

function TFrmEditModel.FindModel(sKeyCode: String) : Boolean;
var nRow : Integer;
begin
    Result := False;
    if (sKeyCode = '') then exit;
    
    // 해당 Field에서 데이터를 가져온다.
    for nRow := 1 to Grid.RowCount-1 do
    begin
        if (Grid.Cells[FIELD_MODEL, nRow] = sKeyCode) then
        begin
            Result := True;
            break;
        end;
    end;
end;

procedure TFrmEditModel.GetSeqListValue(sKeyCode: String; StrList : TStrings);
var nCol, nRow : Integer;
    Str : String;
begin
    // 해당 Field에서 데이터를 가져온다.
    StrList.Clear;
    for nRow := 1 to Grid.RowCount-1 do
    begin
        if (Grid.Cells[FIELD_MODEL, nRow] = sKeyCode) then
        begin
            for nCol := 1 to Grid.ColCount-1 do
            begin
                Str := Grid.Cells[nCol, 0];
                if Str <> '' then begin
                    Str := Str + '=' + Trim(Grid.Cells[nCol, nRow]);
                    StrList.Add( Str);
                end;
            end;
            break;
        end;
    end;
end;

//------------------------------------------------------------------------------
// 데이터를 읽는다.
procedure TFrmEditModel.BtnOpenClick(Sender: TObject);
var FileName : String;
begin
{
    FileName := sBaseDir +  Edit_SpecFile.Text;

    OpenDialog.Filter     := 'Excel Files (*.xls)|*.xls|CSV Files (*.csv)|*.csv';
    OpenDialog.InitialDir := ExtractFilePath(FileName);
    OpenDialog.FileName   := FileName;
    if OpenDialog.Execute then
    begin
        OpenSPECFile(OpenDialog.FileName, True);
        MakeCodeList;
    end;
}
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
        Grid.RemoveCols(1, 4);
        
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
    Width  := 1024;
    Height := 768;
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

{
    // 각 모델별 설정파일을 개별로 관리한다.
    INI.IniFileDir  := IniDirectory(dirAbsolute);
    INI.IniFileName := sBaseDir + 'SPEC\CONFIG.INI';
    INI.LoadData;
    // FileName := Edit_SpecFile.Text;
}


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


procedure TFrmEditModel.FormShow(Sender: TObject);
begin
    MakeCodeList;
end;

procedure TFrmEditModel.MakeCodeList;
var i : Integer;
    Str : String;
begin
    ComboBox_ALC.Items.Clear;
    for i:= 1 to Grid.RowCount-1 do begin
        Str := Trim(Grid.Cells[1, i]);
        if Str <> '' then
            ComboBox_ALC.Items.Add(Str);
    end;

    ComboBox_Field.Items.Clear;
    for i:= 1 to Grid.ColCount-1 do begin
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


end.
