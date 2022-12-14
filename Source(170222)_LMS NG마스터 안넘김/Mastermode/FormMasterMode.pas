unit FormMasterMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ZINICtrl, DPBLabel, Spin, Buttons, Grids,
  chkgrid, BaseGrid, AdvGrid, ComCtrls, AdvGridWorkbook, RealSpinEdit,
  XiPanel, ValEdit, INIFiles, AMLed, VrControls, VrThreads, FormMain;
const
  DEFAULT_Master = 5;

type
  TFrmMasterMode = class(TForm)
    BtnSave: TSpeedButton;
    PageControl1: TPageControl;
    TESTOPTION: ZIniData;
    TabSheet2: TTabSheet;
    cbReMasterMode: ZIniCheckBox;
    TabSheet3: TTabSheet;
    cbWorkOder: ZIniCheckBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    cbMasterCheck: ZIniCheckBox;
    GridLoad: TAdvStringGrid;
    lbLoadBarcode: ZIniListBox;
    edtSerachBarcode: ZIniEdit;
    Button1: TButton;
    cbMasteralarm: ZIniCheckBox;
    GroupBox3: TGroupBox;
    cbNGCHECK: ZIniCheckBox;
    Label3: TLabel;
    spnNGcounter: ZIniSpinEdit;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    LED_MASTER_MODE: TLed;
    GroupBox5: TGroupBox;
    TabSheet4: TTabSheet;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    edtMasterProduct: ZIniEdit;
    edtAuto: ZIniEdit;
    LED_AUTO: TLed;
    Label13: TLabel;
    edtMasterTime: ZIniEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    cbDayUse: ZIniCheckBox;
    DateTimePicker2: TDateTimePicker;
    cbNightUse: ZIniCheckBox;
    BitBtn13: TBitBtn;
    cbMasterTimeCheck: ZIniCheckBox;
    edtHistory: ZIniEdit;
    edtMasterTime1: ZIniEdit;
    edtMasterTime2: ZIniEdit;
    rdoSTATIONmode: ZIniRadioGroup;
    cbPLCModeCheck: ZIniCheckBox;
    Button2: TButton;
    EditJIGMODEL: TEdit;
    Label4: TLabel;
    SAVETIME: ZIniData;
    Label5: TLabel;
    EditPartNum: TEdit;
    Label11: TLabel;
    spnNGspec: ZIniSpinEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LED_MASTER_PD: TLed;
    cbDebug: TCheckBox;
    GridMaster: TAdvStringGrid;
    Label2: TLabel;
    lbMaster: ZIniListBox;
    ZIniSpinEdit2: ZIniSpinEdit;
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    BtnMasterAdd: TSpeedButton;
    BtnMasterDelete: TSpeedButton;
    Ed_MasterSerial: TEdit;
    Ed_MasterModelCode: TEdit;
    VList_Master: TValueListEditor;
    Cb_AutoNGStop: ZIniCheckBox;
    Ed_NgStopCount: ZIniSpinEdit;
    lbStep: ZIniListBox;
    edtStep: TEdit;
    BtnInput1Up: TSpeedButton;
    BtnInput1Dn: TSpeedButton;
    BtnInput1Add: TSpeedButton;
    BtnInput1Delete: TSpeedButton;
    Button3: TButton;
    TimerMaster: TTimer;
    INI: ZIniData;
    Edit1: TEdit;
    Button4: TButton;
    cbStepCheck: ZIniCheckBox;
    Panel2: TPanel;
    cbStepCount: ZIniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DtcGridGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure OptionGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure LedGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure GridMasterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GridLoadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LED_MASTER_MODEClick(Sender: TObject);
    procedure TimerMasterTimer(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnInput1AddClick(Sender: TObject);
    procedure BtnInput1DeleteClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure GridMasterClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure lbStepDblClick(Sender: TObject);
    procedure BtnInput1UpClick(Sender: TObject);
    procedure BtnInput1DnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BMASTERMODE   : Boolean; // ?????? ???? ON
    MASTERSTATION : INTEGER; //MASTER STATION


    Old_jig, Old_PartNum : string;
    Old_PlcMode : Boolean;
    gbMasterBCR : boolean;
    StepList : Tstringlist;
    NGList  : Tstringlist;
    function Execute() : Boolean;
    procedure LoadFile();
    procedure SaveFile();

    function MasterBcdCheck(Serial : string; var bMasterType : Boolean) : Boolean;

    function FindMasterBarcode(Serial: string; CheckMode : integer; var aResult : Boolean; VAR PARTNUM,SETFILE : STRING;var ChangeResult : Boolean): Boolean;   //?????? ?????????? ???? ?? ?????? ?????? ????
    function ResetMasterResult(Mode : integer) : Boolean;
    function CheckMaster(): Boolean;                                                          // ?????? ???? ???? ???? ???? ON OFF
    function ExistJigMaster(Mode : integer): Boolean;                                         // ?????? ???? ?? ?????? ?????? ?????? ????.
    function CheckTryBarcode(Mode : Integer) : Boolean;                                       // ?????? ?????? ???? ?????? ????.
    function MasterModeOFF(Mode : integer): Boolean;
  end;
var
  FrmMasterMode: TFrmMasterMode;

implementation

uses
    GenUtils, ShellAPI, Math, FormMaterAlret, FormMelsecQ,
  FormTestOption, FormEditModel, StrUtils, FormLog, Global, FormLMSedit;

{$R *.dfm}


function TFrmMasterMode.FindMasterBarcode(Serial: string; CheckMode : integer; var aResult : Boolean; VAR PARTNUM,SETFILE : STRING; var ChangeResult : Boolean): Boolean;
var
    c,r, nParamIndex,i : integer;
    bUse, bState : Boolean;
    nTemp : integer;
    sTemp,sTemp1, sParam : string;
    sProject : string;
    bStepResult : Boolean;
    sNg : string;
begin
    sNg := '';
    ChangeResult := True;
    Result := False;
    case rdoSTATIONmode.ItemIndex of
        0 : begin
            sParam := EditPartNum.Text;
            nParamIndex := 2; //partnum???? clear
        end;
        1 : begin
            sParam := EditJIGMODEL.Text;
            nParamIndex := 4; //PLC ???? clear
        end;
    end;

    with GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
            if (bUse) then
            begin                              //(FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0)
                if (Serial = Cells[1, r]) AND (sParam = Cells[nParamIndex, r]) then
                begin
                    AddLog('* Master barcode Read : ' + gModelCode);
                    FrmTestOption.BtnLoadMasterClick(nil);
                    Case CheckMode of
                        1 : begin //?????? ???? ????
                            StepList.Clear;
                            NGList.Clear;

                            //PLC?????????? ?????? ????, ?????? PartNumber?? ???? ???????? ?????? ?????? ????
                            with FrmMain do
                            begin
                                gModelCode := Cells[2,r];
                                if not FrmMain.OpenModal(True) then begin
                                    MessageBox('Model failed to open', 'Failure', MB_OK or MB_ICONERROR);
                                    ChangeResult := False;
                                    break;
                                end;
                                sProject := Cells[3,r];
                                aResult  := (Cells[5,r] = 'OK');

                                lbStep.IniKey := Serial;
                                INI.LoadData;

                                for i := 0 to lbStep.Items.count-1 do
                                begin
                                    StepList.Add( lbStep.Items[i] );
                                end;
                                if FrmMain.ChangeProject(sProject) then
                                begin
                                    CASE MASTERSTATION OF
                                    1 : begin
                                        Addlog(Format('Master Model Change : [%s]',[Format('%s - %s', [gModel, gModelCode])]));
                                        Addlog(Format('Master Project Change : [%s]',[Cells[3,r]]));
                                        Addlog(Format('MasterBarocde Check OK : [%s]',[Serial]));
                                        //FrmMelsecQ.SendCommand(edtMasterProduct.Text, 1);
                                        PARTNUM := Cells[2,R];
                                        SETFILE := Cells[3,R];
                                    end;
                                    end;
                                end else begin
                                    Addlog(Format('Master Project Change NG!!!! : [%s]',[Cells[3,r]]));
                                    MessageBox('Master Project Change NG!!!!', 'Failure', MB_OK or MB_ICONERROR);
                                    ChangeResult := False;
                                    break;
                                end;
                            end;

                            Result := True;
                            break;
                        end;
                        2 : begin //?????? ?????? ???? ????.
                            //FrmMelsecQ.SendCommand(edtMasterProduct.Text, 0);
                            sTemp := IfThen(aResult,'OK','NG');
                            sTemp1 := '[' + Cells[5,r] + ']';
                            bStepResult :=  True;



                            if cbStepCheck.Checked and (not aResult) then
                            begin
                                for i := 0 to StepList.Count-1 do
                                begin
                                    AddLog(StepList.Strings[i]);
                                    if pos(sTemp1, StepList.Strings[i]) <= 0 then
                                    begin
                                        Addlog(Format('Serial : [%s], Model : [%s], PARTNUM : [%s], SETFILE : [%s], JIG : [%s] STEP CHECK NG',
                                        [Serial, gModel, Cells[2,r], Cells[3,r],  sParam ]));
                                        bStepResult := False;
                                        //sNg := 'NG ???? ???? ???? - ????,';
                                        sNg := '???? ???? ????, ';
                                       // break;
                                    end;
                                    //if (not aResult) then
                                    if (FrmMasterAlret <> nil) then
                                        FrmMasterAlret.SetTESTData(2, Serial,StepList.Strings[i]);
                                end;
                                if cbStepCount.Checked and bStepResult then
                                begin
                                    if (StepList.Count) <> (NGList.Count) then
                                    begin
                                        //sNg := sNg + 'NG ???? ???? ???? -????';
                                        sNg := sNg + '???? ???? ????';
                                        bStepResult := False;
                                        AddLog(Format('[Count Check NG] spec : %d, value : %d',[StepList.Count, NGList.Count]));
                                    end;
                                end;
                            end;

                            if (Cells[5,r] = sTemp) and (bStepResult) then
                            begin
                                if (FrmMasterAlret <> nil) then
                                    FrmMasterAlret.SetTESTData(1, Serial, 'CHECK OK');
                                SetCheckBoxState(6,r, True);

                                CASE MASTERSTATION OF
                                1 : begin
                                    Addlog(Format('Serial : [%s], Model : [%s], PARTNUM : [%s], SETFILE : [%s], JIG : [%s] Master Check OK',
                                    [Serial, gModel, Cells[2,r], Cells[3,r],  sParam ]));
                                end;
                                end;

                            end else begin
                                if sNg = '' then begin
                                    FrmMasterAlret.SetStatusBar('MASTER SAMPLE ?????? ????!!! ?????????? ???? ????????!!!' , clRed);
                                end else begin
                                    FrmMasterAlret.SetStatusBar(sNg + '?????????? ???? ????????!!!' , clRed);
                                end;
                                if (FrmMasterAlret <> nil) then
                                    FrmMasterAlret.SetTESTData(1, Serial, 'CHECK NG');
                                CASE MASTERSTATION OF
                                1 : begin
                                    Addlog(Format('Serial : [%s], Model : [%s], PARTNUM : [%s], SETFILE : [%s], JIG : [%s] Master Check NG, RESULT UNMATCHED',
                                    [Serial, gModel, Cells[2,r], Cells[3,r],  sParam ]));
                                end;
                                end;
                            end;
                            StepList.Clear;
                            NGList.Clear;
                            SaveFile();

                            Result := True;
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

function TFrmMasterMode.ExistJigMaster(Mode : integer): Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    nTemp : integer;
    sTemp : string;
begin
    Result := False;
    with GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
                          //(FrmMelsecQ.ReadBlockCommand(FindAddr(nStation,'PLC_MODEL', nTemp), nTemp, 0)
            case Mode of
                0 : begin
                    sTemp := EditPartNum.Text;
                    c := 2; //partnum???? clear
                end;
                1 : begin
                    sTemp := EditJIGMODEL.Text;
                    c := 4; //PLC ???? clear
                end;
            end;

            if (bUse) and (sTemp = Cells[c, r]) then
            begin
                if ('' <> Cells[1, r])then
                begin
                    Result := True;
                end;
            end;
        end;
    end;
    if Result then
    begin

    end else begin
        case MASTERSTATION OF
        1 : Addlog('Now, We not find master barcode!!! Check the Jig Model or Variant');
        END;
    end;
end;




function TFrmMasterMode.CheckTryBarcode(Mode : Integer) : Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    sTemp : string;
begin
    Result := True;
    with GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            GetCheckBoxState(0,r, bUse);
            case Mode of
                0 : begin
                    sTemp := EditPartNum.Text;
                    c := 2; //partnum???? clear
                end;
                1 : begin
                    sTemp := EditJIGMODEL.Text;
                    c := 4; //PLC ???? clear
                end;
            end;
            if (bUse) and (sTemp = Cells[c,r]) then
            begin
                GetCheckBoxState(6,r, bState);
                if (not bState) then Result := False;
            end;
        end;
    end;
end;

function TFrmMasterMode.CheckMaster(): Boolean;
var
    MasterTime : TdateTime;
    nTemp, c, r : integer;
    aTime1, aTime2, aTime3, aTime4, aTime5, aTime6 : TDateTime;
    sTemP : string;
    sRdStr, Str : String;
    tempTime : Ttime;
    Mode : integer;
    sTemp1 : string;
    sTrash : string;
begin
    if (not cbMasteralarm.Checked) then
    begin
        Result := True;
        exit;
    end;

    IF NOT  ExistJigMaster(rdoSTATIONmode.ItemIndex) THEN
        EXIT;

    if cbMasterTimeCheck.Checked then
    begin
        if (cbDayUse.Checked) OR (cbNightUse.Checked) then
        begin
            DateTimePicker1.Date := Now;
            DateTimePicker2.Date := Now;

            aTime1 := DateTimePicker1.DateTime;    //????????
            aTime2 := DateTimePicker2.DateTime;    //????????
            aTime3 := Now;
            sTrash := edtHistory.Text;
            if (sTrash <> '') then
                aTime4 := StrToDateTime(sTrash); //,'YYYY-MM-DD HH:NN:SS'


            if ((aTime1 <= aTime3) and (cbDayUse.Checked)   and (aTime4 < aTime1) and (not BMASTERMODE)) or
               ((aTime2 <= aTime3) and (cbNightUse.Checked) and (aTime4 < aTime2) and (not BMASTERMODE)) then
            begin
                edtHistory.Text := '';
                SAVETIME.SaveData;

                BMASTERMODE := ExistJigMaster(rdoSTATIONmode.ItemIndex);
                if (BMASTERMODE) then
                begin
                    ResetMasterResult(rdoSTATIONmode.ItemIndex);
                    FrmMasterAlret.Show;
                    CASE MASTERSTATION OF
                    1 : Addlog(Format('%d# : TIME CHECK MASTER MODE START',[MASTERSTATION]));
                    end;
                end;
            END;
       end;
    end;

end;


procedure TFrmMasterMode.LoadFile();
var
    i, c ,r : integer;
    sDir, sFileName, sRow : String;
    TempGrid : TCheckStringGrid;
    TempListBox : ZIniListBox;
begin
    TESTOPTION.LoadData;
    GridMaster.RowCount := IfThen((not(lbMaster.Items.Count in [0,1])), lbMaster.Items.Count+ 1, 2);//step.Items.Count;
    for r := 1 to GridMaster.RowCount-1 do
    begin
        GridMaster.AddCheckBox(0,r,True,True);
        GridMaster.AddCheckBox(6,r,True,True);
        GridMaster.SetCheckBoxState(6, r, False);
    end;

    GridMaster.Cells[0,0] := 'Use';
    GridMaster.Cells[1,0] := 'BARCODE';
    GridMaster.Cells[2,0] := 'PartNum';
    GridMaster.Cells[3,0] := 'Project';
    GridMaster.Cells[4,0] := 'JigModel';
    GridMaster.Cells[5,0] := 'OK/NG';
    GridMaster.Cells[6,0] := 'Try';

    for r := 0 to lbMaster.Items.Count-1 do begin
        sRow := lbMaster.Items[r];
        for c := 0 to GridMaster.ColCount-1 do begin
            GridMaster.Cells[c,r+1] := GetToken(sRow, ';');
        end;
    end;
    {
    // ?????? ?????? ???? Load
    GridLoad.RowCount := IfThen((not(lbLoadBarcode.Items.Count in [0,1])), lbLoadBarcode.Items.Count+ 1, 2);//step.Items.Count;
    for r := 1 to GridLoad.RowCount-1 do
    begin
        GridLoad.AddCheckBox(0,r,True,True);
    end;
    GridLoad.Cells[0,0] := 'Use';
    GridLoad.Cells[1,0] := 'BARCODE';
    GridLoad.Cells[2,0] := 'Info';

    for r := 0 to lbLoadBarcode.Items.Count-1 do begin
        sRow := lbLoadBarcode.Items[r];
        for c := 0 to GridLoad.ColCount-1 do begin
            GridLoad.Cells[c,r+1] := GetToken(sRow, ';');
        end;
    end;   }
end;

procedure TFrmMasterMode.SaveFile();
var
    i, c ,r : integer;
    sDir, sFileName, sRow : String;
    TempGrid : TCheckStringGrid;
    TempListBox : ZIniListBox;
begin
    //STEP LIST INI LOAD
    lbMaster.Clear;
    for r := 1 to GridMaster.RowCount-1 do begin
        sRow := GridMaster.Cells[0,r];
        for c := 1 to GridMaster.ColCount-1 do begin
             sRow := sRow + ';' + GridMaster.Cells[c,r];
        end;
        lbMaster.Items.Add(sRow);
    end;

    lbLoadBarcode.Clear;
    for r := 1 to GridLoad.RowCount-1 do begin
        sRow := GridLoad.Cells[0,r];
        for c := 1 to GridLoad.ColCount-1 do begin
             sRow := sRow + ';' + GridLoad.Cells[c,r];
        end;
        lbLoadBarcode.Items.Add(sRow);
    end;
    TESTOPTION.SaveData;
end;

//------------------------------------------------------------------------------
function TFrmMasterMode.Execute() : Boolean;
begin
    if (ShowModal() = mrOk) then
    begin
        Result := True;
    end else
        Result := False;
end;
//------------------------------------------------------------------------------
procedure TFrmMasterMode.FormCreate(Sender: TObject);
var FileDir, FileName, RdStr : String;
    i, y : integer;
    Grid : TAdvStringGrid;
    MASTER : TIniFile;
begin
    StepList := TStringList.Create;
    StepList.Clear;

    NGList := TStringList.Create;
    NGList.Clear;

    i := 1;
    MASTERSTATION := i;
    Tag := i;
    TESTOPTION.IniSection := Format('FormMaster%d', [i]);
    SAVETIME.IniSection := Format('FormMaster%d', [i]);
    Caption := Format('%S #%d', [Caption, i]);

    TESTOPTION.LoadData;
    SAVETIME.LoadData;

    BMASTERMODE   := False;
    Old_PlcMode   := False;

    Old_jig       := IntToStr(FrmMelsecQ.ReadCommand(sPLCModel));
    Old_PartNum   := '';  //jhy
    gbMasterBCR   := False;

    LoadFile();
    if (edtMasterTime1.Text <> '') then
        DateTimePicker1.Time := StrToTime(edtMasterTime1.Text);
    if (edtMasterTime2.Text <> '') then
        DateTimePicker2.Time := StrToTime(edtMasterTime2.Text);
    TimerMaster.Enabled := True;
    lbStep.IniKey := GridMaster.Cells[1, GridMaster.Row];
    INI.LoadData;
end;
//------------------------------------------------------------------------------
procedure TFrmMasterMode.DtcGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    //VAlign := vtaCenter;
end;

procedure TFrmMasterMode.OptionGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    //VAlign := vtaCenter;
end;

procedure TFrmMasterMode.LedGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    //VAlign := vtaCenter;
end;

procedure TFrmMasterMode.BtnGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    //VAlign := vtaCenter;
end;

procedure TFrmMasterMode.SpeedButton1Click(Sender: TObject);
var
    sDir : string;
begin
    sDir := GetAppDir('SET');

    ShellExecute(0, pchar('open'), pchar('explorer.exe'), pchar(sDir), nil, SW_SHOW);

end;

procedure TFrmMasterMode.BtnSaveClick(Sender: TObject);
begin
    SaveFile();
    edtMasterTime1.Text := TimeToStr(DateTimePicker1.Time);
    edtMasterTime2.Text := TimeToStr(DateTimePicker2.Time);
    TESTOPTION.SaveData;
end;

procedure TFrmMasterMode.GridMasterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = VK_INSERT) then
    BEGIN
        (Sender as TAdvStringGrid).InsertRows((Sender as TAdvStringGrid).Row, 1);
        (Sender as TAdvStringGrid).AddCheckBox(0,(Sender as TAdvStringGrid).Row,False,False);
        (Sender as TAdvStringGrid).AddCheckBox(6,(Sender as TAdvStringGrid).Row,False,False);
    END;
    if (key = VK_DELETE) then
        (Sender as TAdvStringGrid).RemoveRows((Sender as TAdvStringGrid).Row, 1);

    if (key = VK_DOWN) and ((Sender as TAdvStringGrid).RowCount-1 = (Sender as TAdvStringGrid).Row) and ((Sender as TAdvStringGrid).Row <> 0) then
    begin
        (Sender as TAdvStringGrid).RowCount := (Sender as TAdvStringGrid).RowCount + 1;
        (Sender as TAdvStringGrid).AddCheckBox(0,(Sender as TAdvStringGrid).RowCount-1,False,False);
        (Sender as TAdvStringGrid).AddCheckBox(6,(Sender as TAdvStringGrid).RowCount-1,False,False);
    end;
                   //????
    if (Key = VK_F5) and ((Sender as TAdvStringGrid).Row <> 1) then 
    begin
        (Sender as TAdvStringGrid).MoveRow((Sender as TAdvStringGrid).Row, (Sender as TAdvStringGrid).Row-1);
    end;

    if (Key = VK_F6) and ((Sender as TAdvStringGrid).Row <> ((Sender as TAdvStringGrid).RowCount -1)) then //??????
    begin
        (Sender as TAdvStringGrid).MoveRow((Sender as TAdvStringGrid).Row, (Sender as TAdvStringGrid).Row+1);
    end;
end;

procedure TFrmMasterMode.BitBtn1Click(Sender: TObject);
begin
    spnNGcounter.Value := 0;
end;

procedure TFrmMasterMode.BitBtn2Click(Sender: TObject);
begin
    MasterModeOFF(rdoSTATIONmode.ItemIndex);
//KIH    edtNightHis.Text :='';
end;

procedure TFrmMasterMode.GridLoadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = VK_INSERT) then
    begin
        (Sender as TAdvStringGrid).InsertRows((Sender as TAdvStringGrid).Row, 1);
        (Sender as TAdvStringGrid).AddCheckBox(0,(Sender as TAdvStringGrid).Row,False,False);
    end;
    if (key = VK_DELETE) then
        (Sender as TAdvStringGrid).RemoveRows((Sender as TAdvStringGrid).Row, 1);

    if (key = VK_DOWN) and ((Sender as TAdvStringGrid).RowCount-1 = (Sender as TAdvStringGrid).Row) and ((Sender as TAdvStringGrid).Row <> 0) then
    begin
        (Sender as TAdvStringGrid).RowCount := (Sender as TAdvStringGrid).RowCount + 1;
        (Sender as TAdvStringGrid).AddCheckBox(0,(Sender as TAdvStringGrid).RowCount-1,False,False);
    end;
end;

procedure TFrmMasterMode.Button1Click(Sender: TObject);
var
    r : integer;
    bUse : Boolean;
begin
//edtSerachBarcode


    for r := 1 to GridLoad.RowCount-1 do
    begin
        bUse := False;
        GridLoad.GetCheckBoxState(0,r, bUse);
        if (bUse) then
        begin
            if (edtSerachBarcode.Text = GridLoad.Cells[1, r]) then
            begin
                GridLoad.SelectRows(r,1);
                GridLoad.FocusCell(1,r);
            end;
        end;
    end;
end;

procedure TFrmMasterMode.Button2Click(Sender: TObject);
begin
    FrmMasterAlret.shOW;
end;

procedure TFrmMasterMode.LED_MASTER_MODEClick(Sender: TObject);
begin
    TLed(Sender AS TLed).LedOn := NOT TLed(Sender AS TLed).LedOn;
end;

procedure TFrmMasterMode.TimerMasterTimer(Sender: TObject);
begin
    TimerMaster.Enabled := False;

    if not cbDebug.Checked then
    begin
        LED_MASTER_PD.LedOn   := (FrmMelsecQ.ReadCommandEx(edtMasterProduct.Text) = 1);
        LED_MASTER_MODE.LedOn := (FrmMelsecQ.ReadCommandEx(edtMasterTime.Text)    = 1);
        //LED_MASTER_OK.LedOn   := (FrmMelsecQ.ReadCommandEx(edtMasterOK.Text)      = 1);
        //LED_MASTER_NG.LedOn   := (FrmMelsecQ.ReadCommandEx(edtMasterNG.Text)      = 1);
        LED_AUTO.LedOn        := (FrmMelsecQ.ReadCommandEx(edtAuto.Text)          = 1);

        EditJIGMODEL.Text := IntToStr(FrmMelsecQ.ReadCommand(sPLCModel)); //FrmMain.Lb_Model.Caption;
        //EditPartNum.Text  := FrmMain.gModelInfo.PartNum;
        {if (BMASTERMODE) and (not FrmMain.gbRunning) then
            FrmMelsecQ.SendCommand(edtMasterTime.Text, 1);
        }
    end;

    IF (not FrmTestOption.Cb_UseBarcode.Checked) or (not cbMasteralarm.Checked) then begin
        TimerMaster.Enabled := True;
        EXIT;
    end;

    //----------------------------------------------------------------------------- ?????????? ?????? ????
    if cbReMasterMode.Checked then
    begin
        if rdoSTATIONmode.ItemIndex = 0 then                 //?????? ???????? ??????
        begin
            if (EditJIGMODEL.text <> Old_PartNum) then begin
                if BMASTERMODE then
                Old_PartNum := EditPartNum.Text;
                BMASTERMODE := ExistJigMaster(rdoSTATIONmode.ItemIndex);
                if BMASTERMODE then
                begin
                    if NOT FrmMasterAlret.Showing then
                    FrmMasterAlret.Show;
                    edtHistory.Text := '';
                    SAVETIME.SaveData;
                    ResetMasterResult(rdoSTATIONmode.ItemIndex);
                                //lbMaster.Visible := True;
                    CASE MASTERSTATION OF
                    1 : Addlog(Format('%d# : MODEL PARTNUMBER CHANGE MASTER MODE START',[MASTERSTATION]));
                    end;
                end;
            end;
        end else if rdoSTATIONmode.ItemIndex = 1 then
        begin  //plc ???? ???? ??????
            if (EditJIGMODEL.text <> Old_jig) then begin
                if BMASTERMODE then
                begin
                    FrmMasterAlret.Close;
                    DelayEx(500, True);
                end;

                Old_jig := EditJIGMODEL.Text;
                BMASTERMODE := ExistJigMaster(rdoSTATIONmode.ItemIndex);
                if BMASTERMODE then
                begin
                    if NOT FrmMasterAlret.Showing then
                    FrmMasterAlret.Show;
                    edtHistory.Text := '';
                    SAVETIME.SaveData;                    
                    ResetMasterResult(rdoSTATIONmode.ItemIndex);
                    CASE MASTERSTATION OF
                    1 : Addlog(Format('%d# : MODEL PLC CHANGE MASTER MODE START',[MASTERSTATION]));
                    end;
                end;
            end;
        end;
    end else begin
        Old_PartNum := EditPartNum.Text;
        Old_jig     := EditJIGMODEL.Text;
    end;

    //----------------------------------------------------------------------------- NGCOUNT ?????? ???????? ??????
    if (cbNGCHECK.Checked) then
    begin
        if (spnNGcounter.Value >= spnNGspec.Value) and (spnNGspec.Value <> 0) then
        begin
            FrmLMSedit.gState := tsStop;
            spnNGcounter.Value := 0;
            CASE MASTERSTATION OF
            1 : Addlog(Format('%d# : NG CHECK MASTER MODE START',[MASTERSTATION]));
            end;
            IF BMASTERMODE THEN begin
                TimerMaster.Enabled := True;
                EXIT;
            end;
            BMASTERMODE := ExistJigMaster(rdoSTATIONmode.ItemIndex);
            if BMASTERMODE then
            begin
                if NOT FrmMasterAlret.Showing then
                FrmMasterAlret.Show;
                edtHistory.Text := '';
                SAVETIME.SaveData;
                ResetMasterResult(rdoSTATIONmode.ItemIndex);
                CASE MASTERSTATION OF
                1 : Addlog(Format('%d# : NG CHECK MASTER MODE START',[MASTERSTATION]));
                end;
            end;
        end;
    end;


    //----------------------------------------------------------------------------- ???? -> ????-> ???? ??
    if (cbPLCModeCheck.Checked) then
    begin
        if not LED_AUTO.LedOn then
            Old_PlcMode := True;

        if LED_AUTO.LedOn and Old_PlcMode then
        begin
            Old_PlcMode := False;
            CASE MASTERSTATION OF
            1 : Addlog(Format('%d# : PLC MODE CHANGE MASTER MODE START',[MASTERSTATION]));
            end;
            IF BMASTERMODE THEN begin
                TimerMaster.Enabled := True;
                EXIT;
            end;
            BMASTERMODE := ExistJigMaster(rdoSTATIONmode.ItemIndex);
            if BMASTERMODE then
            begin
                if NOT FrmMasterAlret.Showing then
                FrmMasterAlret.Show;
                edtHistory.Text := '';
                SAVETIME.SaveData;
                ResetMasterResult(rdoSTATIONmode.ItemIndex);
            end;
        end;
    end else
        Old_PlcMode := False;

    //----------------------------------------------------------------------------- ??/???? ???? ??????????
    CheckMaster();

    //----------------------------------------------------------------------------- ?????????? ????.
    if BMASTERMODE then
    begin
        if NOT FrmMasterAlret.Showing then
            FrmMasterAlret.Show;

        if CheckTryBarcode(rdoSTATIONmode.ItemIndex) then
        begin
            edtHistory.Text := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
            SAVETIME.SaveData;
            BMASTERMODE := False;
            FrmMasterAlret.SetStatusBar('MASTER SAMPLE ?????? ???? ????!!!' , clGreen);
            if FrmMasterAlret.Showing then
                FrmMasterAlret.Close;
            CASE MASTERSTATION OF
            1 : Addlog(Format('%d# : MASTER MODE OK',[MASTERSTATION]));
            end;
            //FrmMelsecQ.SendCommand(edtMasterTime.Text, 0);

        end;
    end else begin
        //if FrmMasterAlret.Showing then
        //    FrmMasterAlret.Close;
    end;

     TimerMaster.Enabled := True;
end;

function TFrmMasterMode.ResetMasterResult(Mode : integer): Boolean;
var
    c,r : integer;
    sJig : string;
begin
    Result := False;
    for r:= 0 to GridMaster.RowCount-1 do
    begin
        case Mode of
            0 : begin
                sJig := EditPartNum.Text;
                c := 2; //partnum???? clear
            end;
            1 : begin
                sJig := EditJIGMODEL.Text;
                c := 4; //PLC ???? clear
            end;
        end;
        if (sJig = GridMaster.Cells[c,r]) then
        begin
            GridMaster.SetCheckBoxState(6, r, False);
            Result := True;
        end;
    end;
end;

procedure TFrmMasterMode.Panel1DblClick(Sender: TObject);
begin
    cbDebug.Visible := not cbDebug.Visible;
end;

function TFrmMasterMode.MasterModeOFF(Mode: integer): Boolean;
var
    c,r : integer;
    bUse, bState : Boolean;
    sTemp : string;
begin
    Result := False;
    with GridMaster do
    begin
        for r := 1 to RowCount-1 do
        begin
            case Mode of
                0 : begin
                    sTemp := EditPartNum.Text;
                    c := 2; //partnum???? clear
                end;
                1 : begin
                    sTemp := EditJIGMODEL.Text;
                    c := 4; //PLC ???? clear
                end;
            end;
            if (sTemp = Cells[c,r]) then
            begin
                SetCheckBoxState(6,r,True);
                Result := True;
            end;
        end;
    end;

    if Result then
        case MASTERSTATION OF
        1 : Addlog('MASTER MODE OFF');
        END;
end;

procedure TFrmMasterMode.FormDestroy(Sender: TObject);
begin
    TimerMaster.Enabled := False;
    StepList.Free;
    NGList.Free;
    //FrmMelsecQ.SendCommand(edtMasterProduct.Text, 0);
end;

procedure TFrmMasterMode.BtnInput1AddClick(Sender: TObject);
begin
    lbStep.Items.Add(edtStep.Text);
end;

procedure TFrmMasterMode.BtnInput1DeleteClick(Sender: TObject);
begin
    lbStep.Items.Delete(lbStep.ItemIndex);
end;

procedure TFrmMasterMode.Button3Click(Sender: TObject);
begin

    lbStep.IniKey := GridMaster.Cells[1, GridMaster.Row];
    INI.SaveData;
end;

procedure TFrmMasterMode.GridMasterClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
    lbStep.IniKey := GridMaster.Cells[1, GridMaster.Row];
    INI.LoadData;
end;

procedure TFrmMasterMode.Button4Click(Sender: TObject);
var aResult, Changeresult : Boolean;
    partnum, setfile : string;
begin
    FindMasterBarcode(Edit1.Text, 1, aResult, partnum, setfile, Changeresult);
end;

procedure TFrmMasterMode.BitBtn13Click(Sender: TObject);
begin
    edtHistory.Text := '';
    SAVETIME.SaveData;
end;

procedure TFrmMasterMode.lbStepDblClick(Sender: TObject);
begin
    edtStep.Text := lbStep.Items[lbStep.ItemIndex];
end;

procedure TFrmMasterMode.BtnInput1UpClick(Sender: TObject);
begin
    if lbStep.ItemIndex = 0 then exit;
    lbStep.Items.Move(lbStep.ItemIndex,lbStep.ItemIndex-1);
end;

procedure TFrmMasterMode.BtnInput1DnClick(Sender: TObject);
begin
    if lbStep.ItemIndex = lbStep.Items.Count-1 then exit;
    lbStep.Items.Move(lbStep.ItemIndex,lbStep.ItemIndex+1);
end;

function TFrmMasterMode.MasterBcdCheck(Serial: string; var bMasterType : Boolean): Boolean;
var r : integer;
    bUse : Boolean;
begin
    Result := False;
    for r := 0 to GridMaster.RowCount-1 do
    begin
        with GridMaster do
        begin
            GetCheckBoxState(0,r, bUse);
            if (bUse) and (Serial = Cells[1,r])then
            begin
                bMasterType := ('OK' = UPPERCASE(Trim(Cells[5,r])));
                Result := True;
                break;
            end;
        end;
    end;
end;

end.


