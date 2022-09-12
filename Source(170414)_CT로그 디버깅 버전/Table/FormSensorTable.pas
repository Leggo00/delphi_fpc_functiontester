unit FormSensorTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ZINICtrl, Grids, chkgrid, IniFiles, ComCtrls,
  ExtCtrls, FileCtrl, DPBLabel;

const
    MAIN_SECTION   = 'MAIN_MODEL';

type
  TFrmSensorTable = class(TForm)
    Panel1: TPanel;
    cmbModel: TComboBox;
    cmbKos: TComboBox;
    btnSave: TButton;
    btnMAdd: TButton;
    btnClose: TButton;
    btnFind: TButton;
    Panel2: TPanel;
    a: TEdit;
    s: TEdit;
    d: TEdit;
    FlistBox: TFileListBox;
    edtFind: TEdit;
    btnTmpAdd: TButton;
    CheckStringGrid8: TCheckStringGrid;
    CheckStringGrid9: TCheckStringGrid;
    CheckStringGrid10: TCheckStringGrid;
    CheckStringGrid11: TCheckStringGrid;
    CheckStringGrid12: TCheckStringGrid;
    CheckStringGrid13: TCheckStringGrid;
    CheckStringGrid14: TCheckStringGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cmbKosSelect(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMAddClick(Sender: TObject);
    procedure cmbModelSelect(Sender: TObject);
    procedure cmbKosKeyPress(Sender: TObject; var Key: Char);
    procedure cmbModelKeyPress(Sender: TObject; var Key: Char);
    procedure btnTmpAddClick(Sender: TObject);
    procedure dKeyPress(Sender: TObject; var Key: Char);
    procedure SsorgridTB_1KeyPress(Sender: TObject; var Key: Char);
    procedure SsorgridTB_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnFindClick(Sender: TObject);

  private
    { Private declarations }
    procedure GetCurrentList(var slCurList: TStringList; var dLow, dHigh: double);
  public
    gTableFolder : string;
    procedure  SaveToFile (flname: string);
    procedure  LoadFromFile (flname: string);
    { Public declarations }
  end;

  procedure CkListInBlank();
  function FSensValueFind(MdName, SnName, Val: String):Double;
  procedure SelectModel(cmbModel, cmbKos: TComboBox);

var
  FrmSensorTable: TFrmSensorTable;
  IniSensorPT : String;
  loadList, iniMdList : TStringList;
  stmd, stks : String;

implementation

uses
    GenUtils, Math, FormSensorModel, Global;

{$R *.dfm}


function FSensValueFind(MdName, SnName, Val: String) : Double;
var ini: TIniFile;
    i : Integer;
    ItemStr, Valstr : String;
    tmpList: TStringList;

    Temp, Temp1, Temp2 : Double;
    Value1, Value2 : Double;

    j,stri : integer;
    Str,strAdd: string;
    bFind: boolean;

const INVALID_VALUE = -9999;

begin
    Result := 0;

    if (Val = '') then exit;

    IniSensorPT := FrmSensorTable.gTableFolder + MdName + '.TBL';

    if not FileExists(IniSensorPT) then
      exit;

    Temp := StrToFloat(Val);

    tmpList := TStringList.Create;
    Ini     := TIniFile.Create(IniSensorPT);
    try
        bFind := False;
        Str := Ini.ReadString('MAIN_SECTION' , 'LIST', '' );
        stri:= StrToIntDef(GetToken(str, ':'), 0);
        for j:=0 to stri-1 do
        begin
            strAdd := GetToken(str, ',');
            if strAdd = SnName then begin
              bFind := True;
              Break;
            end;
        end;

        if not bFind  then
          exit;

        Ini.ReadSectionValues(SnName, tmpList);

        for i:=0 to tmpList.Count-1 do
        begin
            Valstr  := tmpList[i];
            ItemStr := GetToken(Valstr, '=');

            Temp1  := StrToFloatDef(ItemStr, INVALID_VALUE);
            Value1 := StrToFloatDef(Valstr,  INVALID_VALUE);

            if (Temp1 = INVALID_VALUE) or (Temp2 = INVALID_VALUE) then continue;

            if (Temp = Temp1) then begin
                Result := Value1;
                break;
            end else
            if (Temp < Temp1) then begin
                Result := RescaleData(Temp2, Temp1, Value2, Value1, Temp);
                break;
            end;

            Temp2  := Temp1;
            Value2 := Value1;
        end;
    finally
        Ini.Free;
        tmpList.Free;
    end
end;

procedure TFrmSensorTable.FormCreate(Sender: TObject);
var i: Integer;
    itStm: String;
    comp: TComponent;
begin
    loadList  := TStringList.Create;

    stmd := cmbModel.Text;
    stks := cmbKos.Text;

    with FrmSensorTable do
    begin
        for i := 0 to ComponentCount-1 do
        begin
            comp := Components[i];
            if (comp is TCheckStringGrid) then
            begin
                (comp as TCheckStringGrid).Cells[0, 0] := 'Temp';
                (comp as TCheckStringGrid).Cells[1, 0] := 'Value';
            end;
        end;
    end;

    gTableFolder := gBaseDir + 'TABLE\';
    if not DirectoryExists(gTableFolder) then
        ForceDirectories(gTableFolder);

    FrmSensorTable.FlistBox.Directory := gTableFolder;
    FrmSensorTable.FlistBox.Update;
    for i := 0 to FrmSensorTable.FlistBox.Items.Count-1 do
    begin
        itStm := FrmSensorTable.FlistBox.Items[i];
        itStm := GetToken(itStm, '.');
        cmbModel.Items.Add(itStm);
    end;

    FrmSensorTable.cmbKos.Text:='';
    FrmSensorTable.cmbKos.Items.Clear;
end;

procedure CkListInBlank();
var i, rwCount: Integer;
    comp: TComponent;
begin
    with FrmSensorTable do
    begin
        for i := 0 to ComponentCount-1 do
        begin
            comp := Components[i];
            if (comp is TCheckStringGrid) then
            begin
                for rwCount := 0 to (comp as TCheckStringGrid).RowCount - 2 do
                begin
                    (comp as TCheckStringGrid).Cells[0, rwCount + 1] := '';
                    (comp as TCheckStringGrid).Cells[1, rwCount + 1] := '';
                end;
            end;
        end;
    end;
end;

procedure TFrmSensorTable.LoadFromFile (flname: string);
var
	Ini: TIniFile;
    str, subname, subvalue: string;
    comp   : TComponent;
    i, j, idx, rwCount: integer;
    subList: TStringList;
begin
    IniSensorPT := gTableFolder + cmbModel.Text + '.TBL';

    Ini := TIniFile.Create (flname);
    subList  := TStringList.Create;

    try

        with Ini do begin
            ReadSectionValues(stks, subList);
            for j:=0 to subList.Count-1 do begin
                str := ReadString (stks, subList[j], '');
            end;
        end;

        idx := 0;
        for i := 0 to ComponentCount-1 do
        begin
        comp := Components[i];
            if (comp is TCheckStringGrid) then
            begin
                for rwCount := 0 to (comp as TCheckStringGrid).RowCount - 2 do
                begin
                    if subList.Count = idx then exit;

                    subvalue := subList[idx];
                    subname := GetToken(subvalue, '=');

                    (comp as TCheckStringGrid).Cells[0, rwCount + 1] := subname;
                    (comp as TCheckStringGrid).Cells[1, rwCount + 1] := subvalue;

                    idx := idx + 1;
                end;
            end;
        end;
    finally
        subList.Free;
        Ini.Free;
    end;
end;

procedure TFrmSensorTable.SaveToFile (flname: string);
var
    Ini: TIniFile;
    comp: TComponent;
    i, n, m, rwCount, ListCount: integer;
    s, ss, jj, stname, stnames: string;
    AList, BList: TStringList;
    ALists, BLists: Array of Double;
    jjj: Double;
begin
    AList := TStringList.Create;
    BList := TStringList.Create;

    for i := 0 to ComponentCount-1 do
    begin
    comp := Components[i];
        if (comp is TCheckStringGrid) then
        begin
            for rwCount := 0 to (comp as TCheckStringGrid).RowCount-2 do
            begin
                if ((comp as TCheckStringGrid).Cells[0, rwCount + 1] <> '') and
                   ((comp as TCheckStringGrid).Cells[1, rwCount + 1] <> '') then
                begin
                    s := (comp as TCheckStringGrid).Cells[0, rwCount + 1];
                    ss:= (comp as TCheckStringGrid).Cells[1, rwCount + 1];

                    AList.Add(s); // Ex) "EVA_8;7.62"
                    BList.Add(ss);
                end;
            end;
        end;
    end;

    ListCount:= AList.Count;

    SetLength(ALists, ListCount);
    SetLength(BLists, ListCount);

    for n:=0 to ListCount-1 do
    begin
        ALists[n]:=StrToFloat(AList[n]);
        BLists[n]:=StrToFloat(BList[n]);
    end;

    jj:='';
    for n:=0 to ListCount-2 do
    begin
        for m:=0 to ListCount-2 do
        begin
            if ALists[m] > ALists[m+1] then
            begin
                jjj := ALists[m];
                ALists[m]:=ALists[m+1];
                ALists[m+1]:=jjj;

                jj := AList[m];
                AList[m]:=AList[m+1];
                AList[m+1]:=jj;

                jj := BList[m];
                BList[m]:=BList[m+1];
                BList[m+1]:=jj;

//            end else if BLists[m] = BLists[m+1] then
//            begin
//                ShowMessage(FloatToStr(ALists[m]) + '℃와 ' + FloatToStr(ALists[m+1])
//                            + '℃ 의 온도값이 중복됬습니다.');
//                exit;
            end;
        end;
    end;

    Ini := TIniFile.Create (flname);
    if (Ini = nil) then exit;

    with Ini do
    begin
        EraseSection(cmbKos.Text);

        for i:=0 to AList.Count-1 do
        begin
            stnames := AList[i];
            stname  := BList[i];
            if stname <> '' then
                WriteString (cmbKos.Text, stnames, stname);
        end;
    end;

    CkListInBlank;

    Ini.Free;
    AList.Free;
    BList.Free;
    LoadFromFile(IniSensorPT);
end;

procedure TFrmSensorTable.cmbKosSelect(Sender: TObject);
begin
    CkListInBlank;
    stmd := cmbModel.Text;
    stks := cmbKos.Text;
    if stks = '' then
      exit;
      
    IniSensorPT := gBaseDir + 'TABLE\' + stmd + '.TBL';
    LoadFromFile(IniSensorPT);
end;

procedure SelectModel(cmbModel, cmbKos: TComboBox);
var Ini: TIniFile;
    i, j, stri: Integer;
    str, strAdd: String;
begin
    IniSensorPT := gBaseDir + 'TABLE\' + cmbModel.Text + '.TBL';

  	Ini := TIniFile.Create (IniSensorPT);
    if (Ini = nil) then exit;

    cmbKos.Text:='';
    cmbKos.Items.Clear;

    Str := INI.ReadString('MAIN_SECTION', 'LIST', '');
    stri := StrToIntDef(GetToken(str, ':'), 0);
    for j:=0 to stri-1 do
    begin
        strAdd := GetToken(str, ',');
        cmbKos.Items.Add(strAdd);
    end;
end;

procedure TFrmSensorTable.cmbModelSelect(Sender: TObject);
begin
    SelectModel(cmbModel, cmbKos);
end;

procedure TFrmSensorTable.GetCurrentList(var slCurList: TStringList;
  var dLow, dHigh: double);
var
    comp: TComponent;
    i, n, m, rwCount, ListCount: integer;
    s, ss, jj, sTmp, stname, stnames: string;
    AList, BList: TStringList;
    ALists, BLists: Array of Double;
    jjj: Double;
begin
    AList := TStringList.Create;
    BList := TStringList.Create;

    for i := 0 to ComponentCount-1 do
    begin
    comp := Components[i];
        if (comp is TCheckStringGrid) then
        begin
            for rwCount := 0 to (comp as TCheckStringGrid).RowCount-2 do
            begin
                if ((comp as TCheckStringGrid).Cells[0, rwCount + 1] <> '') and
                   ((comp as TCheckStringGrid).Cells[1, rwCount + 1] <> '') then
                begin
                    s := (comp as TCheckStringGrid).Cells[0, rwCount + 1];
                    ss:= (comp as TCheckStringGrid).Cells[1, rwCount + 1];

                    AList.Add(s); // Ex) "EVA_8;7.62"
                    BList.Add(ss);
                end;
            end;
        end;
    end;

    ListCount:= AList.Count;

    SetLength(ALists, ListCount);
    SetLength(BLists, ListCount);

    for n:=0 to ListCount-1 do
    begin
        ALists[n]:=StrToFloat(AList[n]);
        BLists[n]:=StrToFloat(BList[n]);
    end;

    jj:='';
    for n:=0 to ListCount-2 do
    begin
        for m:=0 to ListCount-2 do
        begin
            if ALists[m] > ALists[m+1] then
            begin
                jjj := ALists[m];
                ALists[m]:=ALists[m+1];
                ALists[m+1]:=jjj;

                jj := AList[m];
                AList[m]:=AList[m+1];
                AList[m+1]:=jj;

                jj := BList[m];
                BList[m]:=BList[m+1];
                BList[m+1]:=jj;
            end;
        end;
    end;

    for i:=0 to AList.Count-1 do
    begin
        stnames := AList[i];
        stname  := BList[i];
        if stname <> '' then
           slCurList.AddObject(stnames, TObject(stname));
    end;

    with slCurList do
    begin
      if Count > 0  then
      begin
        sTmp := Strings[0];
        dLow := StrToFloatDef(GetToKen(sTmp, ','), 0);
        sTmp := Strings[Count -1];
        dHigh := StrToFloatDef(GetToKen(sTmp, ','), 0);

        Sort;
      end;
    end;
end;

procedure TFrmSensorTable.btnTmpAddClick(Sender: TObject);
var
    fst, cnd, incr: Double;
    fst1, cnd1: Double;
    slOldList, tmpList: TStringList;
    i, idx, rwCount: Integer;
    comp: TComponent;
    bools: Bool;
    sNum, sTmp: string;
begin
    if (cmbModel.Text = '') or (cmbKos.Text = '') then
    begin
      MessageDlg('모델명 또는 테이블 종류를 입력하세요.', mtInformation, [mbOk], 0);
      exit;
    end;
      
    if (a.Text = '') or (s.Text = '') or (d.Text = '') then
    begin
       MessageDlg('Low, High Value 또는 Inc값을 입력하세요.', mtInformation, [mbOk], 0);
       exit;
    end;

    bools := True;
    tmpList := TStringList.Create;
    
    fst  := StrToFloatDef(a.Text, 0);
    cnd  := StrToFloatDef(s.Text, 0);
    incr := StrToFloatDef(d.Text, 0);

    slOldList := TStringList.Create;
    GetCurrentList(slOldList, fst1, cnd1);
    with slOldList do
    begin
      if Count > 0 then
      begin
        if fst1 < fst then
           fst := fst1;
        if cnd1 > cnd then
           cnd := cnd1;
      end;
    end;

    while (bools) do
    begin
        sNum := FormatFloat('0.0', fst);
        if slOldList.Count > 0 then
        begin
            if slOldList.Find(sNum, idx) then
            begin
              TObject(sTmp) := slOldList.Objects[idx];
              tmpList.Add(Format('%s,%s', [sNum, sTmp]));
            end
            else
              tmpList.Add(sNum);
        end
        else
            tmpList.Add(sNum);

        fst := fst + incr;
        if fst > cnd then
          bools := False;
    end;

    CkListInBlank;

    idx := 0;
    for i := 0 to ComponentCount-1 do
    begin
        comp := Components[i];
        if (comp is TCheckStringGrid) then
        begin
            for rwCount := 0 to (comp as TCheckStringGrid).RowCount - 2 do
            begin
                if tmpList.Count = idx then
                  exit;

                (comp as TCheckStringGrid).Rows[rwCount +1].CommaText := tmpList[idx];
                idx := idx + 1;
            end;
        end;
    end;
    slOldList.Free;
    tmpList.Free;
end;

procedure TFrmSensorTable.dKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then btnTmpAdd.Click;
end;

procedure TFrmSensorTable.cmbKosKeyPress(Sender: TObject; var Key: Char);
begin
    key := #0;
end;

procedure TFrmSensorTable.cmbModelKeyPress(Sender: TObject; var Key: Char);
begin
    key := #0;
end;

procedure TFrmSensorTable.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_Escape then btnClose.Click;
end;

procedure TFrmSensorTable.btnMAddClick(Sender: TObject);
var i: Integer;
    itStm: String;
begin
    FrmSensorModel.cbkModel.Items.Clear;
    FrmSensorModel.cbkModel.Text := '';

    for i:=0 to FlistBox.Items.Count-1 do
    begin
        itStm := FlistBox.Items[i];
        itStm := GetToken(itStm, '.');
        FrmSensorModel.cbkModel.Items.Add(itStm);
    end;

    FrmSensorModel.ShowModal;
end;

procedure TFrmSensorTable.btnSaveClick(Sender: TObject);
begin
  if (cmbModel.Text <> '') and (cmbKos.Text <> '') then
  begin
    IniSensorPT := gBaseDir + 'TABLE\' + cmbModel.Text + '.TBL';
    SaveToFile(IniSensorPT);
  end
  else
    MessageDlg('모델명 또는 테이블 종류를 입력하세요.', mtInformation, [mbOk], 0);
end;

procedure TFrmSensorTable.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmSensorTable.SsorgridTB_1KeyPress(Sender: TObject;
  var Key: Char);
begin
    case Key of
        'A'..'Z' : Key := #0;
        'a'..'z' : Key := #0;
    end;
end;

procedure TFrmSensorTable.SsorgridTB_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = 13) or (key = 10) then Key := 40;
end;

procedure TFrmSensorTable.FormDestroy(Sender: TObject);
begin
    loadList.Free;
end;

procedure TFrmSensorTable.btnFindClick(Sender: TObject);
var Value : Double;
begin
    Value := FSensValueFind(cmbModel.Text, cmbKos.Text, edtFind.Text);
    ShowMessage(Format( '%s = %f', [edtFind.Text, Value ]));   
end;   

end.
