unit FormMaterAlret;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ZINICtrl, StdCtrls, Grids, BaseGrid, AdvGrid,INIfiles,
  FrameMasterMenu, FrameMView;

const MAXCOUNT = 20;

type
  TFrmMasterAlret = class(TForm)
    plMessage: TPanel;
    ZIniFormPosition1: ZIniFormPosition;
    INI: ZIniData;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    pnMasetrAlert: TPanel;
    procedure FormShow(Sender: TObject);
    procedure GridWarningGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure plMessageClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gMASTERcount : integer;
    FrmeMView : array [1..MAXCOUNT] of TFrmMView;
    FarmMenu : array [1..MAXCOUNT] of TFrmMMenu;

    procedure SetView();
    procedure SetStatusBar(param : string; sColor : TColor);
    function SetTESTData(nMode :integer; Serial : string; sParam : string) : Boolean;

  end;

var
  FrmMasterAlret: TFrmMasterAlret;

implementation

uses FormMasterMode, Genutils, FormUDPComm, Formmain;

{$R *.dfm}

procedure TFrmMasterAlret.FormShow(Sender: TObject);
begin
    SetView;
    Left := (Screen.Width  - Width) div 2;
    Top  := (Screen.Height - Height) div 2;
end;

procedure TFrmMasterAlret.GridWarningGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmMasterAlret.SetStatusBar(param: string; sColor: TColor);
begin
    plMessage.Caption := param;
    plMessage.Color   := scolor;
    FrmUDPComm.SendUDP(Format('MASTERSTATUS:%d:1:%s', [nTesterNo, param ]));
end;

procedure TFrmMasterAlret.SetView;
var
    c,r, j, stepCount : integer;
    sJig, sbcd : string;
    bState : Boolean;
    INItest : TIniFile;
    nMasterCOUNT, nMenu : INTEGER;
begin
    if (FrmMasterAlret = nil) then exit;
    SetStatusBar('MASTER SAMPLE 테스트 진행 바랍니다!!!',clGray);
    nMasterCOUNT := 0;
    nMenu := 0;
    INItest := TIniFile.Create(GETAPPDIR('') + 'STEP.INI');
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
                    nMasterCOUNT := nMasterCOUNT + 1;


                    if (((nMasterCOUNT-1) mod 5) = 0) then
                    begin
                        Inc(nMenu);
                        FarmMenu[nMenu] := TFrmMMenu.Create(pnMasetrAlert);
                        FarmMenu[nMenu].Parent := pnMasetrAlert;
                        with FarmMenu[nMenu] do
                        begin
                             Name := 'FMenu' + IntToStr(nMenu);
                             Left := 0;
                             Top  := (FarmMenu[nMenu].Height) * (nMenu-1);
                             FrmMasterAlret.Height := ((FarmMenu[nMenu].Height+4) * (nMenu)) + plMessage.Height + 14 + 18;
                             Visible :=  True;
                        end;
                    end;

                    FrmeMView[nMasterCOUNT] := TFrmMView.Create(pnMasetrAlert);
                    FrmeMView[nMasterCOUNT].Parent := pnMasetrAlert;
                    with FrmeMView[nMasterCOUNT] do
                    begin
                         FrmeMView[nMasterCOUNT].Name := 'FM_view' + IntToStr(nMasterCOUNT);
                         Left := (FarmMenu[nMenu].Width) + (FrmeMView[nMasterCOUNT].Width) * ((nMasterCOUNT-1) mod 5);
                         Top  := (FarmMenu[nMenu].Height) * (nMenu-1);
                         if (nMasterCOUNT = 1) then
                            FrmMasterAlret.Width := Left +  (FrmeMView[nMasterCOUNT].Width)*5 + 14;
                         Visible :=  True;

                         pnVariant.Caption := GridMaster.Cells[2,r];
                         pnBcd.Caption     := GridMaster.Cells[1,r];
                         pnStatus.Caption  := 'READY';
                          if (GridMaster.Cells[5,r] = 'OK') then
                          begin
                              pnType.Caption := 'OK Master';
                              pnType.Color   := $00804000;
                              pnStatus.Align   := alClient;
                              Grid.Visible   := False;
                          end else begin
                              pnType.Caption := 'NG Master';
                              pnType.Color   := clRed;
                              pnStatus.Align   := alTop;
                              Grid.Clear;
                              Grid.RowCount := 1;
                              Grid.Visible   := True;
                              Grid.Colors[0, 0] := $00FFC8C8;
                              Grid.Colors[1, 0] := $00FFC8C8;
                              Grid.WordWraps[0, 0] := False;
                              Grid.WordWraps[1, 0] := False;
                              Grid.Cells[0, 0]   := 'NG STEP';
                              Grid.Cells[1, 0] := 'Result';

                              stepCount := INItest.ReadInteger('STEP',pnBcd.Caption+'_Count',0);
                              for j:= 0 to stepCount-1 do begin
                                  Grid.RowCount := Grid.RowCount + 1;
                                  Grid.Cells[0, j+1] := INItest.ReadString('STEP',pnBcd.Caption+'_' + inttostr(j),'');
                                  Grid.FontSizes[0, j+1] := 7;
                                  Grid.FontSizes[1, j+1] := 7;
                                  //Grid.WordWraps[0, j+1] := True;
                              end;
                          end;
                    end;
                end;
            end;
        end;
    end;
    gMASTERcount := nMasterCOUNT;
end;


procedure TFrmMasterAlret.plMessageClick(Sender: TObject);
begin
    INI.SaveData;
end;




function TFrmMasterAlret.SetTESTData(nMode: integer; Serial, sParam: string) : Boolean;
var i, c : integer;
    bResult : Boolean;
    specstep : string;
begin
    if (FrmMasterAlret = nil) then exit;
    Result := False;
    c      := 0;
    if (gMASTERcount < 1) then exit;

    for i := 1 to gMASTERcount do
    begin
        if FrmeMView[i].pnBcd.Caption = Serial then
            break;
    end;

    case nMode of
        1 : begin // Status
            with FrmeMView[i] do
            begin
                pnStatus.Caption := sParam;

                if (Pos('TEST', sParam) > 0 ) then begin
                    pnStatus.Color := $00804000;
                end else if ( Pos('OK', sParam) > 0 ) then begin
                    pnStatus.Color := clGreen;
                end else if ( Pos('NG', sParam) > 0 ) then begin
                    pnStatus.Color := clRed;
                end;
            end;
            Result := True;
        end;
        2: begin  // Set NG step
            with FrmeMView[i] do
            begin
                if Pos('[NG]', sParam )> 0 then
                begin
                    bResult := True;
                    sParam := GetToken(sParam, '[NG]');
                end else begin
                    if Pos('[OK]', sParam )> 0 then
                        sParam := GetToken(sParam, '[OK]');

                    bResult :=  False;
                end;
                for i := 1 to Grid.RowCount do
                begin
                    specstep := Grid.Cells[c,i];
                    if (specstep = sParam)  then
                    begin
                        with Grid do
                        begin
                            if bResult then
                            begin
                                Cells[c+1, i]      := Cells[c, i];    //'OK';
                                Colors[c+1, i]     := clGreen;
                                FontColors[c+1, i] := clWhite;
                            end else begin
                                Cells[c+1, i]      := Cells[c, i];  //'NG';
                                Colors[c+1, i]     := clRed;
                                FontColors[c+1, i] := clWhite;
                            end;
                        end;
                    end;
                end;
           end;
        end;
        3 : begin

        end;
    end;

end;

procedure TFrmMasterAlret.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i : integer;
begin

    for i := LOW(FrmeMView) to High(FrmeMView) do
    begin
        if FrmeMView[i] <> nil then
        begin
            FrmeMView[i].Free;
        end;
        FrmeMView[i] := nil;
    end;
    for i := LOW(FarmMenu) to High(FarmMenu) do
    begin
        if FarmMenu[i] <> nil then
        begin
            FarmMenu[i].Free;
        end;
        FarmMenu[i] := nil;
    end;
   // DelayEx(500,True);
end;

procedure TFrmMasterAlret.Button4Click(Sender: TObject);
begin
        ShowMessage(IntToStr(Height));
end;

end.
