unit FormModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls, chkgrid, ComCtrls, StdCtrls,
  FileCtrl, Buttons;

type
  TModelInfo = record
    ModelCode       : String;
    sSNBarcode      : String;
    nStartBit       : Integer;
    nLegnth         : Integer;
  end;

  TFrmModel = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Grid: TAdvStringGrid;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure MakeGrid;
    procedure ModelLoad(FileName:String);
    procedure ModelSave(FileName:String);
    { Private declarations }
  public
    { Public declarations }
    sStationName : string;

    function GetModelInfo(sModelCode: String; var ModelInfo : TModelInfo): Boolean;
    function SetSerialSetModel(sBarcode : String; var AModelInfo : TModelInfo): Boolean;
    function FindParamExist(PartName, Param : string) : Boolean;
  end;

var
  FrmModel: TFrmModel;
  function CompareString(Idx:Integer; PartName, Param : string) : Boolean;
  function FindParam(Idx:Integer; PartName, Param : string) : String;
  function FindSpec(Idx:integer; PartName : string) : String;

implementation

{$R *.dfm}

uses
    GenUtils, formMain;


{
Idx
0 : Serial Info
1 : Model Info
2 : Motor Cover
3 : M4 Screw
4 : CoverLoading
5 : M3 Screw

}


function FindParam(Idx:integer; PartName, Param : string) : String;
var i, RowNum, nStart, nLength : Integer;
begin
    Result := 'N/A';

    RowNum := -999;
    with FrmModel do
    begin
        for i:= 2 to Grid.RowCount-1 do
        begin
            if Grid.Cells[1,i] = PartName then   // ¸ðµ¨ºñ±³
            begin
                RowNum := i;
                break;
            end;
        end;

        if RowNum = -999 then exit;

        nStart   := StrToIntDef(Grid.Cells[3+(Idx*3),RowNum],0);
        nLength  := StrToIntDef(Grid.Cells[4+(Idx*3),RowNum],0);

        Result := Copy(Param, nStart, nLength);
    end;
end;

function FindSpec(Idx:integer; PartName : string) : String;
var i, RowNum, nStart, nLength : Integer;
begin
    Result := 'N/A';

    RowNum := -999;
    with FrmModel do
    begin
        for i:= 2 to Grid.RowCount-1 do
        begin
            if Grid.Cells[1,i] = PartName then   // ¸ðµ¨ºñ±³
            begin
                RowNum := i;
                break;
            end;
        end;

        if RowNum = -999 then exit;

        Result := Grid.Cells[2+(Idx*3),RowNum];
    end;
end;


function CompareString(Idx:integer; PartName, Param : string) : Boolean;
var i, ColNum, RowNum, nStart, nLength : Integer;
    sModelName, sCompare : string;
begin
    Result := False;

    RowNum := -999;
    with FrmModel do
    begin
        for i:= 2 to Grid.RowCount-1 do
        begin
            if Grid.Cells[1,i] = PartName then   // ¸ðµ¨ºñ±³
            begin
                RowNum := i;
                break;
            end;
        end;

        if RowNum = -999 then exit;

        sCompare := Grid.Cells[2+(Idx*3),RowNum];
        nStart   := StrToIntDef(Grid.Cells[3+(Idx*3),RowNum],0);
        nLength  := StrToIntDef(Grid.Cells[4+(Idx*3),RowNum],0);

        if sCompare = Copy(Param, nStart, nLength) then Result := True;
    end;
end;




function TFrmModel.FindParamExist(PartName, Param : string) : Boolean;
var i, ColNum, RowNum : Integer;
    sModelName : string;
begin
    Result := False;

    for i:=  0 to Grid.ColCount-1 do
    begin
        if Grid.Cells[i,0] = PartName then
        begin
            ColNum := i;
            break;
        end;
    end;

    for i:=  1 to Grid.RowCount-1 do
    begin
        if Param = Grid.Cells[ColNum, i] then
        begin
            Result := True;
            break;
        end;
    end;
end;

procedure TFrmModel.MakeGrid;
var no : Integer;
begin
    with Grid do
    begin
        Clear;
        RowCount := 3;
        FixedRows := 2;
        ColCount := 100;
        no := 0;

        Cells[no, 0] := 'No.';             ColWidths[No] := 50;   Inc(No);
        MergeCells(0, 0, 1, 2);
        Cells[no, 0] := 'Model';           ColWidths[No] := 150;  Inc(No);
        MergeCells(1, 0, 1, 2);

        Cells[no, 0] := 'Serial Info';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);


        Cells[no, 0] := 'Model Info';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);

        Cells[no, 0] := 'Motor Cover';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);

        Cells[no, 0] := 'M4 Screw';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);

        Cells[no, 0] := 'Cover Loadinig';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);

        Cells[no, 0] := 'M3 Screw';
        MergeCells(no, 0, 3, 1);
        Cells[no, 1] := 'String';          ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Start';           ColWidths[No] := 50;   Inc(No);
        Cells[no, 1] := 'Length';          ColWidths[No] := 50;   Inc(No);

        ColCount := no;
    end;

end;

procedure TFrmModel.ModelLoad(FileName:String);
var
    StrList  : TStringList;
    i, nRow, nCol : Integer;
    Str : String;
begin
    nRow     := 1;
    StrList  := TStringList.Create;
    try
        StrList.LoadFromFile(FileName);
        for i := 0 to StrList.Count-1 do
        begin
            Str := StrList.Strings[i];
            Inc(nRow);
            for nCol := 1 to Grid.ColCount-1 do
            begin
                Grid.Cells[nCol,nRow] := GetToKen(Str,';');
            end;
            Grid.Cells[0, nRow] := IntToStr(nRow-1);
        end;
        Grid.RowCount := nRow+1;


    finally
        StrList.Free;
    end;

end;

procedure TFrmModel.ModelSave(FileName:String);
var
    StrList  : TStringList;
    i, nRow, nCol : Integer;
    Str : String;
begin
    StrList  := TStringList.Create;
    try
        for i := 2 to Grid.RowCount-1 do
        begin
            Str := '';
            for nCol := 1 to Grid.ColCount-1 do
            begin
                Str := Str + Grid.Cells[nCol,i] + ';';
            end;
            StrList.Add(Str);
        end;
        StrList.SaveToFile(FileName);
    finally
        StrList.Free;
    end;

end;

procedure TFrmModel.FormCreate(Sender: TObject);
begin
    MakeGrid;
    ModelLoad(GetAppDir('')+ 'MODEL.TXT');
end;

procedure TFrmModel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ModelSave(GetAppDir('')+ 'MODEL.TXT');
end;

function TFrmModel.SetSerialSetModel(sBarcode : String; var AModelInfo : TModelInfo): Boolean;
var i, ColNum, RowNum : Integer;
    sModelName : string;
begin
    Result := False;

    Showmessage(sBarcode);
     for i:=  0 to Grid.ColCount-1 do
    begin
        if (Grid.Cells[i,0] = 'S/N BARCODE') then
        begin
            ColNum := i;
            break;
        end;
    end;

    for i:=  1 to Grid.RowCount-1 do
    begin
        if sBarcode = Grid.Cells[ColNum, i] then
        begin
            sModelName := Grid.Cells[ColNum, i];
            RowNum := i;
            break;
        end;
    end;
//    Showmessage(Grid.Cells[ColNum, RowNum]);
//    Showmessage(Grid.Cells[ColNum, 1]);
     for i:= 1 to Grid.RowCount-1 do begin
     Showmessage(Grid.Cells[ColNum, i]);

        if (Trim(sBarcode) = Trim(Grid.Cells[ColNum, i])) then
        begin
            Showmessage(Grid.Cells[ColNum, i]);
            RowNum := i;
            AModelInfo.ModelCode    := Grid.Cells[1, i];
            AModelInfo.sSNBarcode   := Grid.Cells[2, i];
            AModelInfo.nStartBit    := StrToIntDef( Grid.Cells[3, i] , 0);
            AModelInfo.nLegnth      := StrToIntDef( Grid.Cells[4, i] , 0);
            Result := True;
            ShowMessage(AModelInfo.ModelCode);
            Break;
        end;
    end;
 end;


function TFrmModel.GetModelInfo(sModelCode: String; var ModelInfo : TModelInfo): Boolean;
var i : Integer;
begin
    Result := False;
    for i:= 1 to Grid.RowCount-1 do begin
        if (sModelCode = Grid.Cells[1, i]) then
        begin
            ModelInfo.ModelCode    := Grid.Cells[1, i];
            ModelInfo.sSNBarcode   := Grid.Cells[2, i];
            ModelInfo.nStartBit    := StrToIntDef( Grid.Cells[3, i] , 0);
            ModelInfo.nLegnth      := StrToIntDef( Grid.Cells[4, i] , 0);
            Result := True;
        end;
    end;
end;

procedure TFrmModel.FormShow(Sender: TObject);
var FileName : String;
begin
    //FileName := GetAppDir('') + 'MODEL.TXT';
    //if FileExists(FileName) then begin
    //    Grid.DrawList.LoadFromFile(FileName);
    //    Grid.Refresh;
    //end;
end;

procedure TFrmModel.SpeedButton1Click(Sender: TObject);
begin
    Grid.RowCount := Grid.RowCount + 1;
end;

procedure TFrmModel.Button1Click(Sender: TObject);
begin
    //ShowMessage(IntToStr(Ord(FindParam(StrToIntDef(Edit1.text,0), Edit2.text, Edit3.text))));
end;

end.
