unit FormData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  AdvObj, Dialogs, Grids, ComCtrls, ZINICtrl, chkgrid, Global, ExtCtrls, BaseGrid,
  Buttons, StdCtrls, Menus, Math, DPBLabel, Gauges, AdvGrid;

type
  TFrmData = class(TForm)
    PopupMenu1: TPopupMenu;
    HTML1: TMenuItem;
    EXCEL1: TMenuItem;
    SaveDialog: TSaveDialog;
    CSV1: TMenuItem;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grid: TAdvStringGrid;
    dpbLabel1: TdpbLabel;
    Lb_StepName: TdpbLabel;
    dpbLabel3: TdpbLabel;
    Gauge: TGauge;
    dpbLabel2: TdpbLabel;
    Lb_Result: TdpbLabel;
    INI: ZIniData;
    rdoDataMode: ZIniRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure HTML1Click(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure TabSheet1Resize(Sender: TObject);
    procedure rdoDataModeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearData();
    procedure DisplayData();
  end;

var
  FrmData: TFrmData;

implementation

{$R *.dfm}

uses GenUtils;

procedure TFrmData.FormCreate(Sender: TObject);
begin
    with Grid do begin
        RowCount := 2;
        Cells[0,0] := 'NO';
        Cells[1,0] := '측정스텝';
        Cells[2,0] := '측정항목';
        Cells[3,0] := '측정스펙';
        Cells[4,0] := '측정값';
        Cells[5,0] := '판정';
    end;

    INI.LoadData;
    DisplayData();
end;

procedure TFrmData.ClearData();
begin
    Grid.ClearRect(0, 1, Grid.ColCount-1, Grid.RowCount-1);
    Grid.RowCount := 2;

    UnitInfo.TestResult.Clear;
end;

procedure TFrmData.DisplayData();
var i, nStartIdx, nEndIdx, Count : Integer;
    nCol, nRow, nStartMerge : Integer;
    RdStr, StepName, sValue, sUnit, sResult : String;

    procedure MergeCell();
    begin
        if (nStartMerge >= 0) and (nStartMerge+1 < nRow) then
        begin
            Grid.MergeCells(0, nStartMerge, 1, nRow-nStartMerge);
            Grid.MergeCells(1, nStartMerge, 1, nRow-nStartMerge);
        end;
    end;

begin
    Grid.BeginUpdate;
    try
    with UnitInfo do begin
        nStartIdx := MAX(0, Grid.RowCount - 2);
        nEndIdx   := TestResult.Count-1;

        nRow := nStartIdx + 1;

        // 데이터를 입력할 Row를 확보한다.
        Count := TestResult.Count;
        if (Count > 0) then
            Grid.RowCount := Count + 1
        else begin
            Grid.RowCount := 2;
            for i:=0 to Grid.ColCount-1 do
                Grid.Cells[i, 1] := '';
            exit;
        end;

        nStartMerge := -1;
        for i:= nStartIdx to nEndIdx do begin
            nCol := 1;
            RdStr := TestResult[i];
            StepName := GetToken(RdStr, ';');
            if StepName <> '' then begin
                MergeCell;
                nStartMerge := nRow;
                Grid.Cells[0, nRow] := IntToStr(nRow);
                Grid.Cells[1, nRow] := StepName;
            end;
            Grid.Cells[2, nRow] := GetToken(RdStr, ';');
            Grid.Cells[3, nRow] := GetToken(RdStr, ';');
            Grid.Cells[4, nRow] := Trim(GetToken(RdStr, ';') + ' ' + GetToken(RdStr, ';')); // Value + UnitStr
            Grid.Cells[5, nRow] := GetToken(RdStr, ';'); // Result;
            //Grid.AutoSizeRow(nRow);
            Inc(nRow);
        end;
        MergeCell;
    end;
    //Grid.AutoSizeRows(True);  // -> 이부분을 집어넣으면 속도저하 생김.

    finally
      Grid.EndUpdate;
      //Grid.Row := Grid.RowCount-1;
    end;
end;


{
procedure TFrmData.DisplayData();
var i, Count : Integer;
    nCol, nRow, nStartMerge : Integer;
    RdStr, StepName : String;

    procedure MergeCell();
    begin
        if (nStartMerge >= 0) and (nStartMerge+1 < nRow) then
        begin
            Grid.MergeCells(0, nStartMerge, 1, nRow-nStartMerge);
            Grid.MergeCells(1, nStartMerge, 1, nRow-nStartMerge);
        end;
    end;

begin
    with UnitInfo do begin
        Count := TestResult.Count;

        if (Count > 0) then
            Grid.RowCount := Count + 1
        else begin
            Grid.RowCount := 2;
            for i:=0 to Grid.ColCount-1 do
                Grid.Cells[i, 1] := '';
        end;

        Count := 1;
        nRow := 1;

        nStartMerge := -1;
        for i:=0 to TestResult.Count-1 do begin
            nCol := 1;
            RdStr := TestResult[i];
            StepName := GetToken(RdStr, ';');
            if StepName <> '' then begin
                MergeCell;
                nStartMerge := nRow;
                Grid.Cells[0, nRow] := IntToStr(Count);
                Grid.Cells[1, nRow] := StepName;
                Inc(Count);
            end;
            Grid.Cells[2, nRow] := GetToken(RdStr, ';');
            Grid.Cells[3, nRow] := GetToken(RdStr, ';');
            Grid.Cells[4, nRow] := GetToken(RdStr, ';');
            Grid.Cells[5, nRow] := GetToken(RdStr, ';');

            Grid.AutoSizeRow(nRow);

            Inc(nRow);
        end;
        MergeCell;
    end;
    Grid.Row := Grid.RowCount-1;
    Grid.Refresh;
end;
}

procedure TFrmData.FormResize(Sender: TObject);
var nRow, TotalW : Integer;
begin
    TotalW := Grid.Width - 102; // Scroll Bar 부분제외.

    // 자동으로 비율을 조정한다.
    Grid.ColWidths[0] := 30;   // NO.
    Grid.ColWidths[1] := Round(TotalW * 0.30); // 측정스텝
    Grid.ColWidths[2] := Round(TotalW * 0.20); // 측정항목
    Grid.ColWidths[3] := Round(TotalW * 0.25); // 측정스펙
    Grid.ColWidths[4] := Round(TotalW * 0.25); // 측정값
    Grid.ColWidths[5] := 50; // 판정.

    Grid.AutoSizeRows(True);
end;

procedure TFrmData.FormShow(Sender: TObject);
begin
    FormResize(Sender);
end;

procedure TFrmData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  := caFree;
    FrmData := nil;
end;

procedure TFrmData.GridGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Str : String;
begin
    Str := Grid.Cells[1, ARow];
    if (Length(Str) > 2) and (Str[1] = '[') and (Str[Length(Str)] = ']') then begin
       AFont.Color := clNavy;
       AFont.Style := [fsBold];
       ABrush.Color := clMoneyGreen;
    end;

    case ACol of
        4 : begin
          if (Grid.Cells[6, ARow] = 'NG') then
             AFont.Color := clRed;
        end;

        5 : begin  // 판정.
            if Grid.Cells[ACol, ARow] = 'OK' then begin
                AFont.Color := clGreen;
                AFont.Style := [fsBold];
            end else

            if Grid.Cells[ACol, ARow] = 'NG' then begin
                AFont.Color := clRed;
                AFont.Style := [fsBold];
            end;

            if Grid.Cells[ACol, ARow] = 'SKIP' then begin
                AFont.Color := clBlue;
                AFont.Style := [fsBold];
            end;
        end;
    end;
end;

procedure TFrmData.GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
var Str : String;
begin
    VAlign := vtaCenter; // 수직 가운데 정렬

    if (ARow = 0) or (ACol = 0) then
       HAlign := taCenter;

    if (ARow > 0) then
    begin
        case ACol of
            1,2 : HAlign := taLeftJustify;
            4   : begin
                Str := Grid.Cells[ACol, ARow];
                if Grid.Canvas.TextWidth(Str) > Grid.ColWidths[4] then
                    HAlign := taLeftJustify
                else
                    HAlign := taRightJustify;
            end;
            else  HAlign := taCenter;
        end;
    end;
end;

procedure TFrmData.HTML1Click(Sender: TObject);
begin
    SaveDialog.DefaultExt := 'html';
    SaveDialog.Filter := 'HTML Files(*.htm)|htm';
    if SaveDialog.Execute then
        Grid.SaveToHTML(SaveDialog.FileName );
end;

procedure TFrmData.CSV1Click(Sender: TObject);
begin
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.Filter := 'CSV Files(*.csv)|csv';
    if SaveDialog.Execute then
        Grid.SaveToCSV(SaveDialog.FileName );
end;

procedure TFrmData.EXCEL1Click(Sender: TObject);
begin
    SaveDialog.DefaultExt := 'xls';
    SaveDialog.Filter := 'Excel Files(*.xls)|xls';
    if SaveDialog.Execute then
        Grid.SaveToXLS(SaveDialog.FileName );
end;

procedure TFrmData.PageControlChange(Sender: TObject);
begin
    rdoDataMode.ItemIndex := PageControl.ActivePageIndex;
    INI.SaveData;
    if PageControl.ActivePageIndex = 1 then
        DisplayData;
end;

procedure TFrmData.TabSheet1Resize(Sender: TObject);
begin
    Lb_StepName.Width := (TabSheet1.Width - 130);
    Gauge.Width       := (TabSheet1.Width - 130);
    Lb_Result.Width   := (TabSheet1.Width - 130);
end;

procedure TFrmData.rdoDataModeClick(Sender: TObject);
begin
    PageControl.ActivePageIndex := ZIniRadioGroup(Sender as ZIniRadioGroup).ItemIndex;
    INI.SaveData;
end;

end.
