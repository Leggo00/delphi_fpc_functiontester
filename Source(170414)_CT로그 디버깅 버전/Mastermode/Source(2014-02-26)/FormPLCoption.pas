
unit FormPLCoption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls, chkGrid, ComCtrls, StdCtrls,
  FileCtrl;

type
  TPLCoptionInfo = record
    sLedName     : String;
    sAddress     : String;
    sLength      : Integer;
    sInfo        : String;
  end;

  TFrmPLCoption = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    lbMain: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    GridA: TAdvStringGrid;
    GridMain: TAdvStringGrid;
    GridB: TAdvStringGrid;
    GridC: TAdvStringGrid;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure LoadPLCInfo;
    procedure SavePLCInfo;
    { Private declarations }
  public
    { Public declarations }
    sStationName : string;

    function GetModelInfo(Station : integer; sModelCode: String; var ModelInfo : TPLCoptionInfo): Boolean;
    function FindParamExist(PartName, Param : string) : Boolean;

  end;
    function FindAddr(Station : integer; sCompareStr : String; var nLength : integer): String;
var
  FrmPLCoption: TFrmPLCoption;

implementation

{$R *.dfm}

uses
    GenUtils, Math;

function FindAddr(Station : integer; sCompareStr : String;  var nLength : integer): String;
var i, ColNum, RowNum : Integer;
    sStandardOption, sFindOption : string;
    Grid : TAdvStringGrid;
begin
//sStandardOption , sCompareStr, sFindOption
//기준Option, 비교할 Str, 찾을Option
    Result := 'NOREAD';
{

    with GridMain do begin
        Cells[0,0] := 'LED NAME';
        Cells[1,0] := 'Address';
        Cells[2,0] := 'Length';
        Cells[3,0] := 'Info';
    end;
}
    case Station of
        0 : begin
            Grid := FrmPLCoption.GridMain;
        end;
        1 : begin
            Grid := FrmPLCoption.GridA;
        end;
        2 : begin
            Grid := FrmPLCoption.GridB;
        end;
        3 : begin
            Grid := FrmPLCoption.GridC;
        end;
        end;

    sStandardOption := 'LED NAME';
    sFindOption     := 'Address';

    for i:=  0 to Grid.ColCount-1 do
    begin
        if (Grid.Cells[i,0] = sStandardOption) then
        begin
            ColNum := i;
            break;
        end;
    end;

    for i:=  1 to Grid.RowCount-1 do
    begin
        if sCompareStr = Grid.Cells[ColNum, i] then
        begin
            RowNum := i;
            break;
        end;
    end;
    ColNum := 99999;
    for i:=  0 to Grid.ColCount-1 do
    begin
        if (Grid.Cells[i,0] = sFindOption) then
        begin
            ColNum := i;
            break;
        end
    end;

    if (ColNum = 99999) then Exit;

    if (Trim(sCompareStr) = Trim(Grid.Cells[ColNum - 1, RowNum])) then
    begin
        Result := Grid.Cells[ColNum, RowNum];
        nLength := StrToIntDef(Grid.Cells[ColNum + 1, RowNum], 1);
    end;
end;

function TFrmPLCoption.FindParamExist(PartName, Param : string) : Boolean;
var i, ColNum, RowNum : Integer;
    sModelName : string;
begin
{
    Result := False;
//Option에 니가 찾을라고하는 옵션이 있는지 없는지 검사하여 True, False로 

    for i:=  0 to GridMain.ColCount-1 do
    begin
        if GridMain.Cells[i,0] = PartName then
        begin
            ColNum := i;
            break;
        end;
    end;

    for i:=  1 to GridMain.RowCount-1 do
    begin
        if Param = GridMain.Cells[ColNum, i] then
        begin
            Result := True;
            break;
        end;
    end;
    }
end;

procedure TFrmPLCoption.FormCreate(Sender: TObject);
var
    FileName : string;
begin
    with GridMain do begin
        Cells[0,0] := 'LED NAME';
        Cells[1,0] := 'Address';
        Cells[2,0] := 'Length';
        Cells[3,0] := 'Info';
    end;
    with GridA do begin
        Cells[0,0] := 'LED NAME';
        Cells[1,0] := 'Address';
        Cells[2,0] := 'Length';
        Cells[3,0] := 'Info';
    end;
    with GridB do begin
        Cells[0,0] := 'LED NAME';
        Cells[1,0] := 'Address';
        Cells[2,0] := 'Length';
        Cells[3,0] := 'Info';
    end;
    with GridC do begin
        Cells[0,0] := 'LED NAME';
        Cells[1,0] := 'Address';
        Cells[2,0] := 'Length';
        Cells[3,0] := 'Info';
    end;

    LoadPLCInfo();
end;


procedure TFrmPLCoption.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SavePLCInfo;
end;


function TFrmPLCoption.GetModelInfo(Station : integer; sModelCode: String; var ModelInfo : TPLCoptionInfo): Boolean;
var
    i : Integer;
    Grid : TAdvStringGrid;
begin
    case Station of
        0 : begin
            Grid := GridMain;
        end; 
        1 : begin
            Grid := GridA;
        end;
        2 : begin
            Grid := GridB;
        end;
    end;

    Result := False;
    for i:= 1 to Grid.RowCount-1 do begin
        if (sModelCode = Grid.Cells[1, i]) then
        begin
            ModelInfo.sLedName := Grid.Cells[0, i];
            ModelInfo.sAddress := Grid.Cells[1, i];
            ModelInfo.sLength  := StrToIntDef( Grid.Cells[2, i], 0);
            ModelInfo.sInfo    := Grid.Cells[3, i];
            Result := True;
        end;
    end;
end;

procedure TFrmPLCoption.FormShow(Sender: TObject);
var FileName : String;
begin
    
end;



procedure TFrmPLCoption.LoadPLCInfo;
var StrList : TStringList;
    i, nRow : Integer;
    Grid : TAdvStringGrid;
    Str : String;
    FileName : STRING;
begin

    StrList := TStringList.Create;
    try
        if Not FileExists(GetAppDir('')+'PLC.ini') then exit;
        StrList.LoadFromFile(GetAppDir('')+'PLC.ini');
        for i:=0 to StrList.Count-1 do
        begin
            Str := StrList.Strings[i];
            if Str = '' then Continue;
            if Str = '[MAIN]' then
            begin
                Grid := GridMain;
                nRow := 1;
            end else
            if Str = '[STATION A]' then
            begin
                Grid := GridA;
                nRow := 1;
            end else
            if Str = '[STATION B]' then
            begin
                Grid := GridB;
                nRow := 1;
            end else
            if Str = '[STATION C]' then
            begin
                Grid := GridC;
                nRow := 1;
            end else
            begin
                Grid.Cells[0,nRow] := GetToKen(Str,'=');
                Grid.Cells[1,nRow] := GetToKen(Str,',');
                Grid.Cells[2,nRow] := GetToKen(Str,',');
                Grid.Cells[3,nRow] := Str;
                Inc(nRow);
                Grid.RowCount := nRow + 1;
            end;

        end;
    finally
        StrList.Free;
    end;
end;

procedure TFrmPLCoption.SavePLCInfo;
var StrList : TStringList;
    i : Integer;
begin
    StrList := TStringList.Create;
    try
        StrList.Add('[MAIN]');
        for i := 1 to GridMain.RowCount-1 do
        begin
            StrList.Add( Format('%s=%s,%s,%s', [GridMain.Cells[0,i], GridMain.Cells[1,i], GridMain.Cells[2,i], GridMain.Cells[3,i]]));
        end;
        StrList.Add('[STATION A]');
        for i := 1 to GridA.RowCount-1 do
        begin
            StrList.Add( Format('%s=%s,%s,%s', [GridA.Cells[0,i], GridA.Cells[1,i], GridA.Cells[2,i], GridA.Cells[3,i]]));
        end;
        StrList.Add('[STATION B]');
        for i := 1 to GridB.RowCount-1 do
        begin
            StrList.Add( Format('%s=%s,%s,%s', [GridB.Cells[0,i], GridB.Cells[1,i], GridB.Cells[2,i], GridB.Cells[3,i]]));
        end;
        StrList.Add('[STATION C]');
        for i := 1 to GridC.RowCount-1 do
        begin
            StrList.Add( Format('%s=%s,%s,%s', [GridC.Cells[0,i], GridC.Cells[1,i], GridC.Cells[2,i], GridC.Cells[3,i]]));
        end;

        StrList.SaveToFile(GetAppDir('')+'PLC.ini');

    finally
        StrList.Free;
    end;

end;

procedure TFrmPLCoption.GridAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = VK_INSERT) then
        (Sender as TAdvStringGrid).InsertRows((Sender as TAdvStringGrid).Row, 1);

    if (key = VK_DELETE) then
        (Sender as TAdvStringGrid).RemoveRows((Sender as TAdvStringGrid).Row, 1);

end;

end.
