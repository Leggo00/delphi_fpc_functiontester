{* ------------------------------------------------------------

PC   ->   PLC
                  ADDR          OK        NG
BARCODE           B10000        1         0
W
D

-----------------------------------------------------------*}

unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Lcd99, AdvGlowButton, ExtCtrls, jpeg, StdCtrls,
  DPBLabel, XiPanel, FrameMotorEcu, ZINICtrl,
  AdvOfficeImage, AMLed, FormPLCoption, FormListOption, FormBarcode, FormEditModel, FormTraceClient;
const
    RS232MAXCOUNT = 1;

type
  TFrmMain = class(TForm)
    XiPanel2: TXiPanel;
    XiPanel4: TXiPanel;
    pnMenu: TPanel;
    c: TXiPanel;
    BtnHardWare: TAdvGlowButton;
    btnModelSelect: TAdvGlowButton;
    ImageList1: TImageList;
    pnMain: TPanel;
    lbCaption: TdpbLabel;
    TimerAlive: TTimer;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    INI: ZIniData;
    EditModel: ZIniEdit;
    XiPanel1: TXiPanel;
    BtnClient: TAdvGlowButton;
    btnExit: TAdvGlowButton;
    AdvOfficeImage1: TAdvOfficeImage;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    XiPanel10: TXiPanel;
    cmbModelList: TComboBox;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton6: TAdvGlowButton;
    pnJIG: ZIniPanel;
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure BtnHardWareClick(Sender: TObject);
    procedure btnModelSelectClick(Sender: TObject);
    procedure TimerAliveTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure LED_ReadyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvOfficeImage1DblClick(Sender: TObject);
    procedure cmbModelListChange(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure BtnClientClick(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
    procedure AdvGlowButton6Click(Sender: TObject);
  private
    { Private declarations }
    bPCAlive, bPLCAlive : Boolean;
    nPLCAliveCount : Integer;

    function ReadPLCAlive:Boolean;
    procedure UploadModelList;
  public
    bPause : Boolean;
    FrmeMotorEcu : TFrmeMotorEcu;
    gMainPlcInfo : TPLCoptionInfo;
    gModelInfo : TModelInfo;

    procedure WritePCAlive;
    procedure CreateFrames();
    procedure FreeFrames();
    function Reset : Boolean;
    Function Check_iTac(sBarcode, sPartNo: String): Boolean;
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  ListOption : array [1..1] of TFrmListOption;
  FrmBarcode : array [1..2] of TFrmBarcode;
  TRACE : array[1..1] of TFrmTraceClient;

implementation

uses FormMelsecQ,  GenUtils, FormMainStatus, Global, FormTerminate, FormSetup, FormItac,
  FormHeight, PassWord;

{$R *.dfm}

Function TFrmMain.Check_iTac(sBarcode, sPartNo: String): Boolean;
var
    nRet1, nRet2, nLoopCount : integer;
    sPartNo1 : String;
    SnrInfoData : TSnrInfoData;
begin
    Result := False;
    FrmMain.WritePCAlive;
 {
    nRet2 := FrmItac.CheckSNState(sBarcode, nLoopCount);
    FrmeMotorEcu.AddLog(Format('CheckSNState : %d',[nRet2]));

    if (nRet2 = 0) then
    begin
        Result := True;
        FrmeMotorEcu.AddLog('CheckSNState OK!!');
    end;
 }
    FrmMain.WritePCAlive;
    nRet1 := FrmItac.GetSerialInfoData(sBarcode, SnrInfoData);
    FrmMain.WritePCAlive;
    FrmeMotorEcu.AddLog(Format('GetSNInfoData : %d',[nRet1]));

    if nRet1 = 0 then
    begin
    FrmMain.WritePCAlive;
        sPartNo1 := SnrInfoData.partNr;

        FrmeMotorEcu.AddLog(Format('제품 partNumber : %s',[sPartNo1])); // 제품 Part Number
        FrmeMotorEcu.AddLog(Format('현재 설정 partNumber : %s',[sPartNo])); // 현재 모델 설정된 Part Number

        if sPartNo = sPartNo1 then
        begin
            FrmeMotorEcu.AddLog('Part Number Check OK!!');
FrmMain.WritePCAlive;
            nRet2 := FrmItac.CheckSNState(sBarcode, nLoopCount);
FrmMain.WritePCAlive;
            FrmeMotorEcu.AddLog(Format('CheckSNState : %d',[nRet2]));

            if (nRet2 = 0) then
            begin
                Result := True;
                FrmeMotorEcu.AddLog('CheckSNState OK!!');
            end else
            //이전 공정 체크
            if (nRet2 = 5) or (nRet2 = 6) then
            begin
                Result := True;
                FrmeMotorEcu.AddLog('Next Station Diagnostic');
            end;
        end else
        begin
            FrmeMotorEcu.AddLog('Part Number Check NG!!');
            FrmeMotorEcu.AddLog('기종 불일치');
            Result := False;
        end;
    end;

    if Result then
        FrmeMotorEcu.AddLog('ITAC CHECK OK')
    else
        FrmeMotorEcu.AddLog('ITAC CHECK NG');

    sPartNo  := '';
    sPartNo1 := '';
end;

function TFrmMain.Reset : Boolean;
var
    nTemp : integer;
begin
    with FrmMelsecQ do
    begin
        SendCommand(FindAddr(1,'PC_BARCODE_TRIGGER', nTemp), 0);
        SendCommand(FindAddr(1,'PC_BCR_OK', nTemp), 0);
        SendCommand(FindAddr(1,'PC_BCR_NG', nTemp), 0);
        SendCommand(FindAddr(1,'PC_BARCODE_MODEL', nTemp), 0);
        SendCommand(FindAddr(1,'PC_BARCODE_TRIGGER', nTemp), 0);

        SendCommand(FindAddr(0,'PC_READY', nTemp), 0);
        SendCommand(FindAddr(0,'PC_ALIVE', nTemp), 0);

    end;
end;

procedure TFrmMain.CreateFrames();
var i : Integer;
begin
    ListOption[1] := TFrmListOption.Create(nil);
    with ListOption[1] do
    begin
        INI.IniSection := ListOption[1].INI.IniSection + Format('_%d',[1]);
        INI.LoadData;
    end;

    for i := Low(FrmBarcode) to High(FrmBarcode) do
    begin
        FrmBarcode[i] := TFrmBarcode.Create(nil);
        with FrmBarcode[i] do
        begin
            nIndex := i;
            INI.IniSection := FrmBarcode[i].INI.IniSection + Format('_%d',[i]);
            INI.LoadData;
            CommConnect(Ed_PortConfig.Text);
        end;
    end;

    for i := Low(TRACE) to HIGH(TRACE) do
    begin
        TRACE[i] := TFrmTraceClient.Create(nil);
        with TRACE[i] do
        begin
            nIndex := i;
            INI.IniSection := TRACE[i].INI.IniSection + Format('_%d',[i]);
            INI.LoadData;
            CommConnect(True);
            TimerConnect.Enabled := True;
        end;
    end;


//Frame_1 : TFrme1;
    FrmeMotorEcu := TFrmeMotorEcu.Create(pnMain);
    FrmeMotorEcu.Parent := pnMain;

    with FrmeMotorEcu do
    begin
        Top := 2;
        Left := 2;
        FrmeMotorEcu.Width := pnMain.Width - 2;
        Height := pnMain.Height;
        Visible := True;
        pcStatus.ActivePage := TabSheet1;
        INI.LoadData;
        COUNT.LoadData;
        nStation :=1;

        gbStartMaster := False;
        gbMasterResult := False;
        DayIndex := 0;
        fStartTime := 0;
        fStopTime := 0;
        bFirst := True;
        bMasterBarocde := False;

        pnSpec.Caption := Format('%s ~ %s',[FrmSetup.edtMin.Text, FrmSetup.edtMax.Text]);
        gbStartMaster  := False;
        //Frame_1.gtestMode := Frame_1.tmReady;
        DisplayTestStatus('READY');
        TimerRun.Enabled := True;
        btnReset.Enabled := False;
        SetWindowLong(pnLamp.Handle,GWL_STYLE, GetWindowLong(pnLamp.Handle, GWL_STYLE) or ES_WANTRETURN OR ES_MULTILINE );
        PageControl1.ActivePageIndex := 0;
    end;

end;
procedure TFrmMain.FreeFrames();
var
    i : integer;
begin
    with FrmeMotorEcu do
    begin
        INI.SaveData;
        COUNT.SaveData;
        TimerRun.Enabled := False;

    end;

    ListOption[1].INI.SaveData;
    for i := High(TRACE) downto Low(TRACE) do
        FrmBarcode[i].INI.SaveData;

    for i := High(TRACE) downto Low(TRACE) do
        TRACE[i].Free;

    for i := High(ListOption) downto Low(ListOption) do
        ListOption[i].Free;
    FrmeMotorEcu.Free;

    for i := 2 downto 1 do
    begin
        FrmBarcode[i].INI.SaveData;
        FrmBarcode[i].Free;
    end;

end;



procedure TFrmMain.FormShow(Sender: TObject);
var
    nLeft, nTop : integer;
    Temp : Tdatetime;
begin
    Height := 1024;
    Width  := 1280;

    nLeft := (Screen.Width - Width) div 2;
    nTop  := (Screen.Height - Height - 50) div 2;
    SetBounds(nLeft, nTop, Width, Height);
    Caption := lbCaption.Caption;



    Reset();
    UploadModelList;
    CreateFrames();
    DelayEx(200,True);
    TRACE[1].GetServerTime(TRACE[1].Ed_Station.Text, Temp);

    TimerAlive.Enabled := true;
end;


procedure TFrmMain.UploadModelList;
var i : Integer;
    sTemp : string;
begin
    cmbModelList.Clear;
    cmbModelList.Items := FrmEditModel.ComboBox_ALC.Items;

    for i:=0 to cmbModelList.Items.Count-1 do
    begin
        if cmbModelList.Items.strings[i] = EditModel.Text then
        begin
            cmbModelList.ItemIndex := i;
            sTemp := cmbModelList.Text;
            sTemp := GetToken(sTemp, '/');

            GetModelInfo(sTemp, FrmMain.gModelInfo);
        end;
    end;


end;


procedure TFrmMain.btnExitClick(Sender: TObject);
begin
    // LPPA.exe Process 중복 실행 방지..
    FrmTerminate.btnSearchClick(Self);
    FrmTerminate.edtFileName.Text := 'LPPA.exe';
    FrmTerminate.btnAutoTerminateClick(Self);
    // LPPA process 종료 후 실행...

    gClose := True;
    Close;
end;

procedure TFrmMain.BtnHardWareClick(Sender: TObject);
begin
    FrmMelSecQ.show;
end;

procedure TFrmMain.btnModelSelectClick(Sender: TObject);
begin
    FrmPW := TFrmPW.Create(self);
    try
        if FrmPW.Execute then
        begin
            bPause := True;
            FrmEditModel.ShowModal;
        end;
    finally
        FrmPW.Free;
    end;
    UploadModelList;
    bPause := False;
end;

procedure TFrmMain.TimerAliveTimer(Sender: TObject);
var
    nTemp : integer;

    
begin
    TimerAlive.Enabled := False;

    if gClose then exit;

    WritePCAlive;
       // PLC LED 작업

    if (FrmMelsecQ.ReadCommandEx(FindAddr(0,'PC_READY', nTemp)) <> 1) then
    begin
        FrmMelsecQ.SendCommand(FindAddr(0,'PC_READY', nTemp), 1);
    end;

    //FindAddr(Station : integer; sCompareStr : String): String;
    With FrmPLCoption do
    begin
       FrmMainStatus.LED_PLC_READY.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(0,'PLC_READY', nTemp)) = 1);

       FrmMainStatus.LED_Ready.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(0,'PC_READY', nTemp)) = 1);
       FrmMainStatus.LED_Alive.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(0,'PC_ALIVE', nTemp)) = 1);
       FrmMainStatus.LED_Reset.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(0,'PC_RESET', nTemp)) = 1);
       
    end;

//    ReadPLCAlive;
    TimerAlive.Enabled := True;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
    bPause := False;
    gClose := False;
    bPCAlive := False;
    nPLCAliveCount := 0;
    INI.LoadData;
    
end;

function TFrmMain.ReadPLCAlive:Boolean;
var
    bTemp : Boolean;
    nTemp : integer;
begin
    Result := True;
    bTemp := (FrmMelsecQ.ReadCommand(FindAddr(0,'PC_ALIVE', nTemp)) = 1);
    if nPLCAliveCount = 0 then
    begin
        bPCAlive := bTemp;
        nPLCAliveCount := 1;
    end
    else
    begin
        if bTemp <> bPCAlive then
        begin
            // PLC 정상상태
        end
        else
        begin
            Inc(nPLCAliveCount);
        end;
    end;

    if nPLCAliveCount = 5 then
    begin
        result := False; // PLC Dead
    end;
end;


procedure TFrmMain.WritePCAlive;
var
    nTemp : integer;
    sTemp : string;
    filename : string;
begin
    bPCAlive := Not bPCAlive;
    if (FrmMelsecQ.ReadCommand(FindAddr(0,'PC_ALIVE', nTemp))= 0) then
        FrmMelsecQ.SendCommand(FindAddr(0,'PC_ALIVE', nTemp), Ord(bPCAlive));

    sTemp := 'ALIVE : ' + IntToStr(FrmMelsecQ.ReadCommand(FindAddr(0,'PC_ALIVE', nTemp)));
    fileName := GetAppDir('LOG') + 'MOTOR_ECU\' + FormatDateTime('YY-MM', Now) + '\Debug' +
                FormatDateTime('YYMMDD', Now) + '_ALIVE.txt';
    WriteDebugStr(sTemp, filename);
end;

procedure TFrmMain.AdvGlowButton2Click(Sender: TObject);
begin
    FrmPW := TFrmPW.Create(self);
    try
        if FrmPW.Execute then
        begin
            FrmPLCoption.show;
        end;
    finally
        FrmPW.Free;
    end;
end;

procedure TFrmMain.LED_ReadyClick(Sender: TObject);
begin
    (Sender as TLed).LedOn := not (Sender as TLed).LedOn;
    DelayEx(200,True);
    (Sender as TLed).LedOn := not (Sender as TLed).LedOn;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
    Reset();
    gClose := True;
    FreeFrames();
    FrmMelSecQ.CommConnect(False);
end;

procedure TFrmMain.AdvOfficeImage1DblClick(Sender: TObject);
begin
    FrmMainStatus.Show;
end;

procedure TFrmMain.cmbModelListChange(Sender: TObject);
var sTEMP : String;
begin
    sTemp := cmbModelList.Text;
    sTEMP := GetToken(sTemp, '/');

    EditModel.Text := cmbModelList.Text;
    GetModelInfo(sTEMP, gModelInfo);
end;

procedure TFrmMain.AdvGlowButton1Click(Sender: TObject);
begin
    FrmBarcode[1].Show;
end;

procedure TFrmMain.AdvGlowButton3Click(Sender: TObject);
begin
    FrmBarcode[2].Show;
end;

procedure TFrmMain.AdvGlowButton4Click(Sender: TObject);
begin
    FrmPW := TFrmPW.Create(self);
    try
        if FrmPW.Execute then
        begin
            FrmSetup.Show;
        end;
    finally
        FrmPW.Free;
    end;
end;

procedure TFrmMain.BtnClientClick(Sender: TObject);
begin
    TRACE[1].Show;
end;

procedure TFrmMain.AdvGlowButton5Click(Sender: TObject);
begin
    FrmItac.Show;
end;

procedure TFrmMain.AdvGlowButton6Click(Sender: TObject);
begin
    FrmHeight.Show;
end;

end.

