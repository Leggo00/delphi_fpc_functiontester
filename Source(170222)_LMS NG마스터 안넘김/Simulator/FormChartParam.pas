unit FormChartParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, Chart, StdCtrls, ExtCtrls;

type
  TFrmChartParam = class(TForm)
    gridSeries: TAdvStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rdoDisplayMode: TRadioGroup;
    edtDisplayMinute: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure gridSeriesClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(sValue: string; aChart: TChart): string;
  end;

var
  FrmChartParam: TFrmChartParam;

implementation

uses
    GenUtils, FormResource;

{$R *.dfm}

procedure TFrmChartParam.FormCreate(Sender: TObject);
begin
    with gridSeries do
    begin
        Cells[0, 0] := 'Series Title';
        Cells[1, 0] := 'Resource Name';
    end;
end;

procedure TFrmChartParam.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TFrmChartParam.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure ClearGrid(aGrid: TStringGrid);
var
    nRow, nCol: integer;
begin
    with aGrid do
    begin
        for nRow := 1 to RowCount - 1 do
            for nCol := 1 to ColCount  - 1 do
                Cells[nCol, nRow] := '';
        RowCount := 2;
    end;
end;

function TFrmChartParam.Execute(sValue: string; aChart: TChart): string;
var
    i: integer;
    sParam: string;
begin
    Result := sValue;

    ClearGrid(gridSeries);
    with gridSeries do
    begin
        RowCount := aChart.SeriesCount + 1;

        // 기타 차트 옵션
        sParam := GetToken(sValue, ':');
        rdoDisplayMode.ItemIndex := StrToIntDef(GetToken(sParam, ','), 1);
        edtDisplayMinute.Text    := GetToken(sParam, ',');

        for i := 1 to aChart.SeriesCount do
        begin
            Cells[0, i] := Format('Series%d', [i]); 
            Cells[1, i] := GetToken(sValue, ',');
        end;

        if ShowModal = mrOK then
        begin
            sValue := '';
            for i := 1 to RowCount - 1 do
            begin
                if i = 1 then
                    sValue := Cells[1, i]
                else
                    sValue := Format('%s,%s', [ sValue, Cells[1, i] ]);

                aChart.Series[i - 1].Title := Cells[1, i];
            end;

            Result := Format('%d,%s:%s', [rdoDisplayMode.ItemIndex,
                                          edtDisplayMinute.Text,
                                          sValue] );
        end;

    end;
end;

procedure TFrmChartParam.gridSeriesClickCell(Sender: TObject; ARow,
  ACol: Integer); 
begin
    if ACol = 1 then
        gridSeries.Cells[ACol, ARow] := FrmResouce.Execute(gridSeries.Cells[ACol, ARow], Left + Width, Top);
end;

end.
