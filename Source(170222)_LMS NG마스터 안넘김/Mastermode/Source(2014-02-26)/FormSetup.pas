unit FormSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ZINICtrl, DPBLabel, Spin, Buttons, Grids,
  chkgrid, BaseGrid, AdvGrid, ComCtrls, AdvGridWorkbook, RealSpinEdit,
  XiPanel, ValEdit, INIFiles;

type
  TFrmSetup = class(TForm)
    Panel1: TPanel;
    BtnSave: TSpeedButton;
    PageControl1: TPageControl;
    TESTOPTION: ZIniData;
    TabSheet2: TTabSheet;
    cbNoBarcode_1: ZIniCheckBox;
    cbMesUse_1: ZIniCheckBox;
    cbMaster: ZIniCheckBox;
    cbNoBarcode_2: ZIniCheckBox;
    cbItacUse: ZIniCheckBox;
    cbStateNotUse_1: ZIniCheckBox;
    cbAutoModel: ZIniCheckBox;
    Label1: TLabel;
    edtMin: ZIniEdit;
    edtMax: ZIniEdit;
    Label2: TLabel;
    cbMasterEcuSkip: ZIniCheckBox;
    cbJIGCheck: ZIniCheckBox;
    cbReMasterMode: ZIniCheckBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GridMaster: TAdvStringGrid;
    lbMaster: ZIniListBox;
    edtMasterTime1: ZIniEdit;
    edtMasterTime2: ZIniEdit;
    edtMasterTime3: ZIniEdit;
    edtMasterTime4: ZIniEdit;
    cbMasteralarm: ZIniCheckBox;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    cbDayUse: ZIniCheckBox;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    cbNightUse: ZIniCheckBox;
    cbStopTimeUse: ZIniCheckBox;
    edtStopTime: ZIniEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    cbWorkOder: ZIniCheckBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    cbMasterCheck: ZIniCheckBox;
    GridLoad: TAdvStringGrid;
    lbLoadBarcode: ZIniListBox;
    edtSerachBarcode: ZIniEdit;
    Button1: TButton;
    Label7: TLabel;
    edtJigMin: ZIniEdit;
    edtJigMax: ZIniEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DtcGridGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure OptionGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure LedGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridMasterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GridLoadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute() : Boolean;
    procedure LoadFile();
    procedure SaveFile();
  end;

var
  FrmSetup: TFrmSetup;

implementation

uses
    GenUtils, ShellAPI, Math, FormMain;

{$R *.dfm}
procedure TFrmSetup.LoadFile();
var
    i, c ,r : integer;
    sDir, sFileName, sRow : String;
    TempGrid : TCheckStringGrid;
    TempListBox : ZIniListBox;
begin
    GridMaster.RowCount := IfThen((not(lbMaster.Items.Count in [0,1])), lbMaster.Items.Count+ 1, 2);//step.Items.Count;
    for r := 1 to GridMaster.RowCount-1 do
    begin
        GridMaster.AddCheckBox(0,r,True,True);
        GridMaster.AddCheckBox(4,r,True,True);
        GridMaster.SetCheckBoxState(4, r, False);
    end;

    GridMaster.Cells[0,0] := 'Use';
    GridMaster.Cells[1,0] := 'BARCODE';
    GridMaster.Cells[2,0] := 'MODEL';
    GridMaster.Cells[3,0] := 'JigModel';
    GridMaster.Cells[4,0] := 'Try';
    GridMaster.Cells[5,0] := 'Oring Skip Master';

    for r := 0 to lbMaster.Items.Count-1 do begin
        sRow := lbMaster.Items[r];
        for c := 0 to GridMaster.ColCount-1 do begin
            GridMaster.Cells[c,r+1] := GetToken(sRow, ';');
        end;
    end;

    // 전공정 마스터 항목 Load
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
    end;
end;

procedure TFrmSetup.SaveFile();
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
end;

//------------------------------------------------------------------------------
function TFrmSetup.Execute() : Boolean;
begin
    if (ShowModal() = mrOk) then
    begin
        Result := True;
    end else
        Result := False;
end;
//------------------------------------------------------------------------------
procedure TFrmSetup.FormCreate(Sender: TObject);
var FileDir, FileName, RdStr : String;
    i, y : integer;
    Grid : TAdvStringGrid;
    MASTER : TIniFile;
begin
    // 초기 모델을 OPEN한다.
    TESTOPTION.LoadData;
    LoadFile();
    DateTimePicker1.Time := StrToTime(edtMasterTime1.Text);
    DateTimePicker2.Time := StrToTime(edtMasterTime2.Text);

end;
//------------------------------------------------------------------------------
procedure TFrmSetup.DtcGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmSetup.OptionGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmSetup.LedGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmSetup.BtnGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmSetup.FormShow(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 0;
end;

procedure TFrmSetup.SpeedButton1Click(Sender: TObject);
var
    sDir : string;
begin
    sDir := GetAppDir('SET');

    ShellExecute(0, pchar('open'), pchar('explorer.exe'), pchar(sDir), nil, SW_SHOW);

end;

procedure TFrmSetup.BtnSaveClick(Sender: TObject);
begin
    SaveFile();
    edtMasterTime1.Text := TimeToStr(DateTimePicker1.Time);
    edtMasterTime2.Text := TimeToStr(DateTimePicker2.Time);
    TESTOPTION.SaveData;
end;

procedure TFrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmMain.FrmeMotorEcu.pnSpec.Caption := Format('%s ~ %s',[FrmSetup.edtMin.Text, FrmSetup.edtMax.Text]);
end;

procedure TFrmSetup.GridMasterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = VK_INSERT) then
        (Sender as TAdvStringGrid).InsertRows((Sender as TAdvStringGrid).Row, 1);

    if (key = VK_DELETE) then
        (Sender as TAdvStringGrid).RemoveRows((Sender as TAdvStringGrid).Row, 1);

    if (key = VK_DOWN) and ((Sender as TAdvStringGrid).RowCount-1 = (Sender as TAdvStringGrid).Row) and ((Sender as TAdvStringGrid).Row <> 0) then
    begin
        (Sender as TAdvStringGrid).RowCount := (Sender as TAdvStringGrid).RowCount + 1;
        (Sender as TAdvStringGrid).AddCheckBox(0,(Sender as TAdvStringGrid).RowCount-1,False,False);
        (Sender as TAdvStringGrid).AddCheckBox(4,(Sender as TAdvStringGrid).RowCount-1,False,False);
    end;

end;

procedure TFrmSetup.BitBtn1Click(Sender: TObject);
begin
    FrmMain.FrmeMotorEcu.edtDayHis.Text := '';
end;

procedure TFrmSetup.BitBtn2Click(Sender: TObject);
begin
    FrmMain.FrmeMotorEcu.edtNightHis.Text :='';
end;

procedure TFrmSetup.GridLoadKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmSetup.Button1Click(Sender: TObject);
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

end.


