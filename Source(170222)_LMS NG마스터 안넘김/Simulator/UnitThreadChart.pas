unit UnitThreadChart;

interface

uses
  Classes, Chart, Windows;

type
  TThreadChart = class(TThread)
  private
    { Private declarations }
    FStartTime: TDateTime;
    FChartCount: integer;
    FCheckCount: integer;

    FResourceName: string;
    FTestTime: string;
    FChannel: integer;
    FValue: double;

    procedure ClearChartValue;
    procedure UpdataValue;
    procedure DisplayValue;
  protected
    constructor Create;
    procedure Execute; override;
  public
    FChart : TChart;
  end;

implementation

uses
    Global, SysUtils, GenUtils, TeEngine, Controls, FormHwTest;

{ UnitThreadLabel }

procedure TThreadChart.ClearChartValue;
var
    i: integer;
begin
    with FChart do
    begin
        for i := 0 to SeriesCount - 1 do
            Series[i].Clear;
    end;
end;

procedure TThreadChart.UpdataValue;
var
    i, j: integer;
begin
    with FChart do
    begin
        for i := 0 to SeriesList.Count - 1 do
           Series[i].Delete(0);

        for i := 0 to FCheckCount - 2 do
        begin
            for j := 0 to SeriesCount - 1 do
                Series[j].XValue[i] := i - 1;
        end;
    end;
end;

procedure TThreadChart.DisplayValue;
begin
    with FChart.Series[FChannel] do
    begin
        Title := Format('%s:%.2f', [FResourceName, FValue]);
        AddXY(FChartCount, FValue, FTestTime);
    end;
end;

constructor TThreadChart.Create;
begin
    FreeOnTerminate := True;
    inherited Create(True);
end;

procedure TThreadChart.Execute;
var
    sResourceItems, sParam, sResource, sValue, sTempItems: string;
    aResourceItem: TResourceItem;
    nDisplayMode: integer;
    fDisplayMinute: double;
    i: integer;
    sTime: string;
begin
    with FChart do
    begin
        sResourceItems := Hint;
        sParam := GetToken(sResourceItems, ':');

        nDisplayMode   := StrToIntDef(GetToken(sParam, ','), 1);
        fDisplayMinute := StrToFloatDef(GetToken(sParam, ','), 1);

        case nDisplayMode of
            0: begin // Auto
                BottomAxis.Automatic := True;
            end;
            1: begin // Update
                BottomAxis.Automatic := False;
                BottomAxis.Minimum   := 0;
                FCheckCount          := Round(fDisplayMinute * 60 * 1000) div 10;
                BottomAxis.Maximum   := FCheckCount;
            end;
        end;   
        Synchronize(ClearChartValue);

        FStartTime := Now;
        while not Terminated do
        begin
            if nDisplayMode = 1 then
            begin
                if (FChartCount = FCheckCount) then
                begin
                    Synchronize(UpdataValue);
                end;
            end;

            sTime := FormatDateTime('HH:MM:SS.ZZZ', Now - FStartTime);
            sTempItems := sResourceItems;
            for i := 0 to SeriesCount - 1 do
            begin
                sResource     := GetToken(sTempItems, ',');
                aResourceItem := CurrProject.GetResource(0, sResource);
                sValue        := ReadResName(aResourceItem, '');
                if aResourceItem.ResType in [res_DO, res_DI] then
                begin
                    if sValue = 'ON' then
                        sValue := '1'
                    else
                        sValue := '0';
                end;

                FChannel      := i;
                FResourceName := sResource;
                FTestTime     := sTime;
                FValue        := StrToFloatDef(sValue, 0);

                Synchronize(DisplayValue);
            end;
            Refresh;

            if nDisplayMode = 0 then
            begin
                Inc( FChartCount );
            end
            else begin
                if ( FChartCount < FCheckCount ) then
                    Inc( FChartCount );
            end;

            Sleep(25);
        end;
    end;
end;

end.
