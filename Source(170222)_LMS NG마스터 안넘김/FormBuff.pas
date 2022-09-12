unit FormBuff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ValEdit, chkgrid, AMLed,
  ComCtrls;

type
  TFrmBuff = class(TForm)
    Panel1: TPanel;
    BtnRecord: TSpeedButton;
    LedRec: TLed;
    TimerLed: TTimer;
    BtnReplay: TSpeedButton;
    Panel2: TPanel;
    BtnDelay: TSpeedButton;
    BtnAddStep: TSpeedButton;
    BtnGraph: TSpeedButton;
    BtnClear: TSpeedButton;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    TabControl: TTabControl;
    InputGrid: TCheckStringGrid;
    procedure BtnRecordClick(Sender: TObject);
    procedure BtnDelayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAddStepClick(Sender: TObject);
    procedure TimerLedTimer(Sender: TObject);
    procedure BtnReplayClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnGraphClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    InputList1, InputList2 : TStringList;
    procedure Add(sItem, sParam : String);
    procedure Clear;
  end;

var
  FrmBuff: TFrmBuff;

implementation

uses Global, FormGraph, GenUtils, FormMain, FormHwTest;

{$R *.dfm}

procedure TFrmBuff.Add(sItem, sParam : String);
var Str : String;
begin
    if BtnRecord.Down then
    begin
        Str := Format('%s;%s;', [sItem, sParam ]);
        if (InputGrid.DrawList.Count > 0) and (InputGrid.DrawList[0] = ';;') then
            InputGrid.DrawList[0] := Str
        else
            InputGrid.DrawList.Add(Str);
        InputGrid.Refresh;
        InputGrid.Row := InputGrid.RowCount-1; 
    end;
end;

procedure TFrmBuff.BtnRecordClick(Sender: TObject);
begin
    LedRec.LedOn := BtnRecord.Down;
    BtnReplay.Enabled := not BtnRecord.Down;
    TimerLed.Enabled  := BtnRecord.Down;
end;

procedure TFrmBuff.BtnDelayClick(Sender: TObject);
begin
    Add('DELAY', '1');
end;

procedure TFrmBuff.BtnGraphClick(Sender: TObject);
begin
    Add('GRAPH', 'ON');
end;


procedure TFrmBuff.FormCreate(Sender: TObject);
begin
    InputList1 := TStringList.Create;
    InputList2 := TStringList.Create;

    Left := 5;
    Top  := 100;

    with InputGrid do begin
        Cells[0,0] := '입력항목';
        Cells[1,0] := '입력값';
    end;
end;

procedure TFrmBuff.FormDestroy(Sender: TObject);
begin
    InputList1.Free;
    InputList2.Free;
end;

procedure TFrmBuff.BtnAddStepClick(Sender: TObject);
var NewStep : TTestStep;
    StepName : String;
    i : Integer;
    RdStr, Str : String;
//    ChInfo : TChInfo;
begin
    // 현재 수행을 자원을 입력한다.
    StepName := InputBox('NewStep', 'Input New StepName', '');
    if (StepName <> '') then
    begin
        NewStep :=  TTestStep.Create;
        NewStep.StepName := StepName;
        NewStep.Enabled  := True;
        NewStep.InputList1.Assign( InputList1 );
        NewStep.InputList2.Assign( InputList2 );
{
        // 그래프 채널을 추가한다.
        if FrmGraph <> nil then
        begin
            for i:= 0 to FrmGraph.TimeGraph.ChList.Count-1 do
            begin
                ChInfo := FrmGraph.TimeGraph.ChList[i];
                Str   := ChInfo.ChName;
                RdStr := Format('%s;%s~%s;',[GetToken(Str, ';'),
                    FormatFloat('0.##', ChInfo.fAxisMin),
                    FormatFloat('0.##', ChInfo.fAxisMax) ]);
                NewStep.OutputList.Add(RdStr);
            end;
        end;
}        
        CurrProject.AddStep(NewStep);
        FrmMain.ViewTestInfo;
    end;
end;

procedure TFrmBuff.TimerLedTimer(Sender: TObject);
begin
    LedRec.LedOn := not LedRec.LedOn;
end;

procedure TFrmBuff.BtnReplayClick(Sender: TObject);
begin
    BtnRecord.Down    := False;

    BtnRecord.Enabled := False;
    BtnReplay.Enabled := False;

    FrmMain.RunInputCondition('TEST', InputList1 );
    FrmMain.RunInputCondition('TEST', InputList2 );

    BtnReplay.Enabled := True;
    BtnRecord.Enabled := True;
end;

procedure TFrmBuff.Clear;
begin
    InputList1.Clear;
    InputList2.Clear;
    InputGrid.Refresh;
end;

procedure TFrmBuff.BtnClearClick(Sender: TObject);
begin
    Clear;
end;

procedure TFrmBuff.btnUpClick(Sender: TObject);
var Idx : Integer;
    TempStr1, TempStr2 : String;
begin
    Idx := InputGrid.Row-1;
    if (Idx < 1) or (Idx >= InputGrid.DrawList.Count) then exit;

    InputGrid.Row := InputGrid.Row-1;

    TempStr1 := InputGrid.DrawList[Idx-1];
    TempStr2 := InputGrid.DrawList[Idx  ];

    InputGrid.DrawList[Idx-1] := TempStr2;
    InputGrid.DrawList[Idx  ] := TempStr1;

    InputGrid.Refresh;
end;

procedure TFrmBuff.btnDownClick(Sender: TObject);
var Idx : Integer;
    TempStr1, TempStr2 : String;
begin
    Idx := InputGrid.Row-1;
    if (Idx < 0) or (Idx >= InputGrid.DrawList.Count-1) then exit;

    InputGrid.Row := InputGrid.Row+1;

    TempStr1 := InputGrid.DrawList[Idx  ];
    TempStr2 := InputGrid.DrawList[Idx+1];

    InputGrid.DrawList[Idx  ] := TempStr2;
    InputGrid.DrawList[Idx+1] := TempStr1;

    InputGrid.Refresh;
end;

procedure TFrmBuff.TabControlChange(Sender: TObject);
begin
    case TabControl.TabIndex of
        0 : InputGrid.DrawList := InputList1;
        1 : InputGrid.DrawList := InputList2;
    end;
end;

procedure TFrmBuff.FormShow(Sender: TObject);
begin
    TabControlChange(Sender);    
end;

end.

