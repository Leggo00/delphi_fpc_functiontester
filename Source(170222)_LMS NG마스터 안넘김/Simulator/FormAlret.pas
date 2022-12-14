unit FormAlret;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  AdvObj, Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls;

type
  TFrmAlret = class(TForm)
    btnClose: TButton;
    btnSave: TButton;
    Button1: TButton;
    btnDel: TButton;
    Grid: TAdvStringGrid;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button1Click(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    procedure MakeGrid;
    { Private declarations }
  public
    procedure AlretCount;
    //procedure SetOptionList(Sender: TObject);
    { Public declarations }
  end;

var
  FrmAlret: TFrmAlret;

implementation

{$R *.dfm}

uses Global, GenUtils;


procedure TFrmAlret.btnCloseClick(Sender: TObject);
begin

    Close;
end;

procedure TFrmAlret.FormCreate(Sender: TObject);
begin
    MakeGrid;
    if FileExists(ExtractFilePath (Application.ExeName) + '\Alret.csv') then
    Grid.LoadFromCSV(ExtractFilePath (Application.ExeName) + '\Alret.csv');
end;

procedure TFrmAlret.btnSaveClick(Sender: TObject);
begin
    Grid.SaveToCSV(ExtractFilePath (Application.ExeName) + '\Alret.csv');
end;

procedure TFrmAlret.MakeGrid;
var
    i, no : integer;
begin
    with Grid do
    begin
        Clear;
        RowCount := 2;
        ColCount := 5;

        no := 0;
        Cells[no,0] := 'No'; ColWidths[no] := 50;  inc(no);
        Cells[no,0] := '카운트항목'; ColWidths[no] := 200;  inc(no);
        Cells[no,0] := '셋팅카운트'; ColWidths[no] := 100;  inc(no);
        Cells[no,0] := '누적카운트'; ColWidths[no] := 100;  inc(no);
        Cells[no,0] := '경고메세지'; ColWidths[no] := 400;  inc(no);

        AutoNumberCol(0);
    end;
end;

procedure TFrmAlret.GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
end;

procedure TFrmAlret.Button1Click(Sender: TObject);
var
    ACol, ARow, i: Integer;
    SetEditor: TEditorType;
begin
    Grid.RowCount := Grid.RowCount + 1;
    Grid.AutoNumberCol(0);
end;

procedure TFrmAlret.btnDelClick(Sender: TObject);
begin
    Grid.RemoveRows(Grid.Row,1);
    Grid.AutoNumberCol(0);
end;

// 누적카운트를 1 증가후 셋팅카운트와 비교하여 이상이면 경고를 띄운다.
procedure TFrmAlret.AlretCount;
var i, Cnt, BaseCount :Integer;
begin
    With Grid do
    begin
        for i:=1 to RowCount-1 do
        begin
            if (Cells[2,i] <> '') and (Cells[4,i] <> '') then
            begin
                BaseCount := StrToIntDef(Cells[2,i],0);
                Cnt := StrToIntDef(Cells[3,i],0) + 1;
                Cells[3,i] := IntToStr(Cnt);
                if BaseCount <= Cnt then
                showMessage(Cells[4,i]);
            end;
        end;
    end;
    Grid.SaveToCSV(ExtractFilePath (Application.ExeName) + '\Alret.csv');
end;




end.
