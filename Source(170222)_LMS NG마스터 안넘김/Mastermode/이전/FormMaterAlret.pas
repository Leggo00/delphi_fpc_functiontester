unit FormMaterAlret;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ZINICtrl, StdCtrls, Grids, BaseGrid, AdvGrid,INIfiles;

type
  TFrmMasterAlret = class(TForm)
    plMessage: TPanel;
    ZIniFormPosition1: ZIniFormPosition;
    INI: ZIniData;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GridWarning_: TAdvStringGrid;
    pnMasetrAlert: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridWarning_GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button3Click(Sender: TObject);
    procedure plMessageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ResetGrid();
    procedure SetGrid();
    procedure SetStatusBar(param : string; sColor : TColor);
    procedure GridSetNewpdt(nMasterIdx : integer);
    procedure SetNGstepData(Serial, step : string; bOKNGmaster : Boolean);
  end;

var
  FrmMasterAlret: TFrmMasterAlret;

implementation

uses FormMasterMode, Genutils;

{$R *.dfm}

procedure TFrmMasterAlret.FormShow(Sender: TObject);
begin
    ResetGrid();
    SetGrid;
    INI.LoadData;
end;

procedure TFrmMasterAlret.Button1Click(Sender: TObject);
BEGIN
    ResetGrid();
end;


procedure TFrmMasterAlret.GridWarning_GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmMasterAlret.SetStatusBar(param: string; sColor: TColor);
begin
    plMessage.Caption := param;
    plMessage.Color   := scolor;
end;

procedure TFrmMasterAlret.Button3Click(Sender: TObject);
begin
    GridSetNewpdt(6);
end;

procedure TFrmMasterAlret.GridSetNewpdt(nMasterIdx: integer);
var i, col : integer;
begin
    with GridWarning do
    begin
        if (DEFAULT_Master < nMasterIdx) then
        begin
            GridWarning.ColCount := (nMasterIdx * 2) +1;//Grid.ColCount + 2;
            for i := 0 to 3 do begin
                col := (2*(nMasterIdx-1))+1;
                GridWarning.MergeCells(col,i,2,1);
            end;
        end;
    end;
end;

procedure TFrmMasterAlret.ResetGrid;
VAR i,j, pdtcount : integer;
begin
    i := 1;
    pdtcount := 5;

    GridWarning.Clear;
    GridWarning.FixedCols := 0;
    GridWarning.FixedRows := 0;
    GridWarning.RowCount  := 9;
    GridWarning.ColCount  := 11;
    GridWarning.DefaultColWidth  := 100;
    GridWarning.DefaultRowHeight := 40;
    GridWarning.Font.Size := 15;
    GridWarning.font.Style := [fsBold];
    GridWarning.MergeCells(0,3,1,6);
    with GridWarning do
    begin

        //GridWarning.[0,0] := 'MASTER SAMPLE 테스트 진행 바랍니다!!!';
        GridWarning.Cells[0,0] := 'Variant';
        GridWarning.Cells[0,1] := 'SerialNo';
        GridWarning.Cells[0,2] := 'Master';
        GridWarning.Cells[0,3] := 'Result';
    end;
    SetStatusBar('MASTER SAMPLE 테스트 진행 바랍니다!!!',clGray);
    for j := 0 to pdtcount-1 do begin
        for i := 0 to 3 do begin
            GridWarning.MergeCells((2*j)+1,i,2,1);
        end;
    end;
end;

procedure TFrmMasterAlret.SetGrid;
var
    c,r, setC,j, stepCount : integer;
    sJig, sbcd : string;
    bState : Boolean;
    INItest : TIniFile;
    nMasterPdtCOUNT : INTEGER;

begin
    nMasterPdtCOUNT := 0;
    INItest := TIniFile.Create(GETAPPDIR('') + 'STEP.INI');
    setC := 1;
    with FrmMasterMode do
    begin
        for r:= 0 to GridMaster.RowCount-1 do
        begin
            case rdoSTATIONmode.ItemIndex of
                0 : begin
                    sJig := EditPartNum.Text;
                    c := 2; //partnum기준 clear
                end;
                1 : begin
                    sJig := EditJIGMODEL.Text;
                    c := 4; //PLC 기준 clear
                end;
            end;
            if (sJig = GridMaster.Cells[c,r]) then
            begin
                GridMaster.GetCheckBoxState(0, r, bState);
                if (bState) then begin
                    Inc(nMasterPdtCOUNT);

                    if (nMasterPdtCOUNT > DEFAULT_Master) then
                    begin
                        GridSetNewpdt(nMasterPdtCOUNT);
                    end;

                    GridWarning.Cells[setc, 0] := GridMaster.Cells[2,r];
                    sbcd := GridMaster.Cells[1,r];
                    GridWarning.Cells[setc, 1] := sbcd;
                    if (GridMaster.Cells[5,r] = 'OK') then
                    begin
                        GridWarning.Cells[setc, 2] := 'OK MASTER';
                        GridWarning.Cells[setc, 3] := 'READY';
                        GridWarning.MergeCells(setc,3,2,6);
                    end else begin
                        GridWarning.Cells[setc, 2]   := 'NG MASTER';
                        GridWarning.Cells[setc, 3]   := 'READY';
                        GridWarning.Cells[setc, 4]   := 'NG STEP';
                        GridWarning.Cells[setc+1, 4] := 'RESULT';

                        stepCount := INItest.ReadInteger('STEP',sbcd+'_Count',0);
                        for j:=0 to stepCount-1 do begin
                            GridWarning.Cells[setc, 5 + j] := INItest.ReadString('STEP',sbcd+'_' + inttostr(j),'');
                            GridWarning.FontSizes[setc, 5 + j] := 10;
                            GridWarning.WordWraps[setc, 5 + j] := True;
                            if (3 < j) then break;
                        end;
                    end;
                setc := setc + 2;
                end;
            end;
        end;
    end;
end;

procedure TFrmMasterAlret.SetNGstepData(Serial, step: string; bOKNGmaster : Boolean);
var c, r, i, nTrash : integer;
    bResult : BOOLEAN;
    specstep : string;
begin
//8.3.1.7 Write P-Gain value
//Format('[%s]',[sResult]);
    with GridWarning do
    begin
        for i := 1 to GridWarning.ColCount-1 do
        begin

            if (((i) mod 3) = 0) or (i = 1)then
            begin
                if (Serial = Cells[i, 1]) then
                begin
                    c := i;
                    break;
                end;
            end;
        end;
        if bOKNGmaster then
        begin
            Cells[c, i]      := 'CHECK OK';
            Colors[c, i]     := clGreen;
            FontColors[c, i] := clWhite;
        end else begin
            if Pos('[NG]', step )> 0 then
            begin
                bResult := True;
                step := GetToken(step, '[NG]');
            end else begin
                if Pos('[OK]', step )> 0 then
                    step := GetToken(step, '[OK]');

                bResult :=  False;
            end;
            for i := 5 to GridWarning.RowCount do
            begin
                specstep := GridWarning.Cells[c,i];
                if (specstep = step)  then
                begin
                    if bResult then
                    begin
                        Cells[c+1, i]      := 'CHECK OK';
                        Colors[c+1, i]     := clGreen;
                        FontColors[c+1, i] := clWhite;
                    end else begin
                        Cells[c+1, i]      := 'CHECK NG';
                        Colors[c+1, i]     := clRed;
                        FontColors[c+1, i] := clWhite;
                    end;
                end;
            end;
        end;
    end;
end;

procedure TFrmMasterAlret.plMessageClick(Sender: TObject);
begin
    INI.SaveData;
end;

end.
