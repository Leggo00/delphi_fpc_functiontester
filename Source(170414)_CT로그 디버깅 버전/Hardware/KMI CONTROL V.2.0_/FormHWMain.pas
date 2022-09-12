//------------------------------------------------------------------------------
//
//  KMI GEN2 BOARD 통합모듈..
//
//------------------------------------------------------------------------------
unit FormHWMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSocketKMI, AMLed, Menus, ExtCtrls, ZINICtrl, Grids,
  BaseGrid, AdvGrid, XiButton, ComCtrls, uStation, uEthernetAD, SyncObjs,
  ScktComp, HWGlobal, Global, XiPanel, AdvObj, mmsystem, Spin, Inifiles;

type
  TFrmHWMain = class(TForm)
    Panel1: TPanel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    XiButton1: TXiButton;
    XiButton2: TXiButton;
    GridCfg: TAdvStringGrid;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    GridVal: TAdvStringGrid;
    INI: ZIniData;
    TimerDisplay: TTimer;
    cbSetting: TCheckBox;
    TimerConnect: TTimer;
    plScale: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnScaleOK: TButton;
    BtnScaleClose: TButton;
    EditMin: TEdit;
    EditMax: TEdit;
    EditUnit: TEdit;
    EditOffset: TEdit;
    EditScale: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    lbBdNo: TLabel;
    lbChNo: TLabel;
    Label9: TLabel;
    LbSTNo: TLabel;
    LbADEBdNo: TLabel;
    XiPanel1: TXiPanel;
    BtnConnect: TXiButton;
    BtnDisconnect: TXiButton;
    BtnInitial: TXiButton;
    BtnADBuff: TXiButton;
    StatusBar: TStatusBar;
    cbDebug: TCheckBox;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    MemoLog: TMemo;
    Label10: TLabel;
    edtIGNResource: ZIniEdit;
    BtnClearLog: TXiButton;
    Cb_AutoConnect: ZIniCheckBox;
    Label1: TLabel;
    cmbStationCount: ZIniComboBox;
    BtnSetStation: TXiButton;
    cbLogSave: TCheckBox;
    Panel4: TPanel;
    Rg_Display: TRadioGroup;
    BtnSetScale: TXiButton;
    Ed_UpdateRate: ZIniSpinEdit;
    Label11: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    MemoExcept: TMemo;
    Label12: TLabel;
    Button1: TButton;
    procedure N1Click(Sender: TObject);
    procedure BtnSetStationClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridCfgGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure GridCfgGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure GridCfgGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure btnSaveClick(Sender: TObject);
    procedure GridValDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure TimerDisplayTimer(Sender: TObject);
    procedure GridValGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSettingClick(Sender: TObject);
    procedure cbLogSaveClick(Sender: TObject);
    procedure TimerConnectTimer(Sender: TObject);
    procedure GridValMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnScaleCloseClick(Sender: TObject);
    procedure BtnScaleOKClick(Sender: TObject);
    procedure cmbStationCountChange(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisconnectClick(Sender: TObject);
    procedure BtnInitialClick(Sender: TObject);
    procedure BtnSetScaleClick(Sender: TObject);
    procedure BtnADBuffClick(Sender: TObject);
    procedure BtnClearLogClick(Sender: TObject);
    procedure Cb_AutoConnectClick(Sender: TObject);
  private
    { Private declarations }
    xPos, yPos : Integer; // 마우스 포인트 (Scale 폼을 해당 자원 근처에서 열기 위함)

    StCnt : Integer;
    Station : array of TStation;

    DummyTime : Double;      // 해당 Station 에 AD, DI 의 주기적으로 Reading 을 하면서 Main 보드로의 메세지 전송을 할 보드가 설치 되지 않았을 경우 일정주기로 통신의 접속을 유지시키 위한 변수

    procedure MakeGridCfg(nColCount: Integer);
    procedure SaveConfig;
    procedure LoadConfig;
    procedure SocketConnect(bConnect: Boolean);
    function  SocketStatusDisplay() : Integer;
    procedure MakeStation;
    function  GetBuffChCnt(sCh:String) : Integer;
    procedure AddLog(Param : String);
  public
    { Public declarations }
    procedure DisplayValue;

    procedure MakeADScale;
    procedure OnEvent(Sender: TObject);
    // AD Buff
    function  SetADEBuff(nBDNo, nRecordCount : Integer; fSampleRate : Double; sCh : String) : Boolean;

    function  BuffStatus(nBDNo : Integer) : Boolean;
    function  ReadADEBuff(nBDNo : Integer):TRdBuff;

    procedure ResetRO(nBDNo: integer);

    // DO/DA/RO/AD/DI
    function WriteDO(nBDNo, nChNo: Integer; bOnOff: Boolean): Boolean;
    function WriteDA(nBDNo, nChNo : Integer; fValue: Double): Boolean;
    function WriteRO(nBDNo, nChNo : Integer; fValue: Double): Boolean;
    function WritePO(nBDNo, nChNo: Integer; fFreq, fDuty: Double): Boolean;
    function ReadAD(nBDNo, nChNo : Integer) : Double;
    function ReadDI(nBDNo, nChNo : Integer) : Boolean;

    // 통합 하드웨어 제어Function.
    procedure GetIOcontrolList (Strlist: TStrings; ResType : TResType);
    function  WriteIOcontrol(ctlname, param : String; tagStr: String = ''): Boolean;
    function  ReadIOcontrol(ctlname, param : String; tagStr: String = ''): String;
    procedure InitializeDeviceAll(bAllReset : Boolean = True);


    function GetAdBoardCount(): integer;

    function Save_IOStatus(sFileName : String) : Boolean;
  end;

var
  FrmHWMain: TFrmHWMain;

implementation

uses GenUtils, FormIOScale, FormADBuff{, FormHwTest,  FormCanDiag};  // FormComm

{$R *.dfm}

function TFrmHWMain.GetAdBoardCount(): integer;
var
    i: integer;
begin
    Result := 0;
    for i := 0 to StCnt-1 do
    begin
        if Assigned(Station[i]) then
        begin
            Result := Result + Station[i].FADCnt;
        end;
    end;
end;

procedure TFrmHWMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmHWMain.FormCreate(Sender: TObject);
var INIExcept : TInifile;
    FileName, RdStr, ctlname : String;
    i : integer;
begin
    timeBeginPeriod(1);

    bSaveLog := False;
    StCnt := 0;

    // -------------------------------------------150328 by shs. 예외 I/O 처리.
    // 초기화하지 말아야할 목록리스트.
    // Tag를 0으로 하면 ResetIO에서 제외됨..

    FileName := GetAppDir('') + 'IOCONFIG.INI';
    INIExcept := TIniFile.Create(FileName);
    try
        INIExcept.ReadSectionValues('EXCEPT_RESET', MemoExcept.Lines);
        for i:=0 to MemoExcept.Lines.Count-1 do begin
            RdStr := Trim(MemoExcept.Lines[i]);
            ctlname := GetToken(RdStr, '=');
            {Ctrl := GetIOcontrol(ctlname);

            if (Ctrl <> nil) then
            begin
                 Ctrl.Tag := StrToIntDef(RdStr, 0);
                 if (Ctrl.Tag <> 0) then
                    Ctrl.Font.Color := clBlue;
            end;}
        end;
    finally
        INIExcept.Free;
    end;

    INI.LoadData;

    cmbStationCountChange(Self);
    BtnSetStationClick(nil);
    MakeADScale;
    SocketConnect(true);
    DummyTime := GetTickCountEx;

    TimerConnect.Enabled := Cb_AutoConnect.Checked;
    BtnDisconnect.Tag    := 0;
end;

procedure TFrmHWMain.InitializeDeviceAll(bAllReset : Boolean = True);
var i, j : Integer;
    nStation, nSlot, nResNo, nChNo, nMaxCh : Integer;
    nTmp: integer;
    fStartTime: double;
    nByte : array of Byte;

    DOValue : Word;

    sDOItem : String;
begin
    fStartTime := GetTickCountEx;

    with FrmHWMain do
    begin
        for i := 1 to DOCnt do
        begin
            nStation := DOTbl[i-1].Station;
            nSlot    := DOTbl[i-1].Slot;
            nMaxCh   := DOTbl[i-1].MaxCh;
            nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
            nTmp      := nResNo mod MAX_SLOT;
            if (nResNo > -1) then
            begin
                DOValue := 0;

                // 초기화시 AllReset이 아니면 Reset 제외 목록을 찾아서 제외한다.  by JSI.
                if (not bAllReset) then begin
                    for j := 0 to 15 do begin
                        sDOItem := Format('DO%d_%.2d', [i, j+1]);   // DO1_01
                        if (MemoExcept.Lines.Values[sDOItem] = '1') and (ValueTbl[nResNo, j] = 1) then
                        begin
                            DOValue := DOValue + (1 shl j);
                            ValueTbl[nResNo, j] := 1;
                        end else
                            ValueTbl[nResNo, j] := 0;
                    end;
                end else begin
                    for nChNo := 0 to nMaxCh -1 do
                        ValueTbl[nResNo, nChNo] := 0;
                end;
                Station[nStation-1].Write(KMI_DO_CMD, [nTmp+1, HI(DOValue), LO(DOValue)]);
                //Station[nStation-1].Write(KMI_DO_CMD, [nTmp+1, 0, 0]);
            end;

        end;

        for i := 1 to DACnt do
        begin
            for j := 1 to 8 do
                WriteDA(i, j, 0);
        end;

        for i:= 1 to ROCnt do
            ResetRO(i);
    end;
    //    Caption := Format('%f', [ (GetTickCountEx - fStartTime) / 1000 ]);

end;


// 메뉴클릭시 이동
procedure TFrmHWMain.N1Click(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// AD Sacle Start Calibration 결과값을 넣기위한 배열을 생성
//------------------------------------------------------------------------------

// AD Scale 배열을 만든다.
procedure TFrmHWMain.MakeADScale;
var
    i, j, k, nRow, nADCnt, nADECnt : Integer;
begin
    for i := 0 to StCnt-1 do
    begin
        nADCnt  := 0;
        nADECnt := 0;
        SetLength(Station[i].FADScale, Station[i].FAdCnt, MAX_CHANNEL);
        for j := 1 to MAX_SLOT do
        begin
            if Station[i].FSlot[j].BdType = KMI_AD then
            begin
                for k := 0 to MAX_CHANNEL-1 do
                begin
                    with Station[i].FADScale[nADCnt,k] do
                    begin
                    
                        try
                            nRow:= k + ((nADCnt+nADECnt)*MAX_CHANNEL_COUNT) + 1;

                            if (FrmIOScale <> nil) and (FrmIOScale.GridAD.RowCount > nRow) then
                            begin
                                with FrmIOScale.GridAD do
                                begin
                                    Range  := RangeValue(Cells[1, nRow]);
                                    Min    := StrToFloatDef(Cells[2,nRow],0);
                                    Max    := StrToFloatDef(Cells[3,nRow],30);
                                    sUnit  := Cells[4,nRow];
                                    Scale  := StrToFloatDef(Cells[5,nRow],1);
                                    offset := StrToFloatDef(Cells[6,nRow],0);
                                end;
                            end;
                        except
                            //ShowMessage(Format('%d  %d  %d',[k, nADCnt, nADECnt]));
                        end;

                    end;
                end;
                Inc(nADCnt);
            end
            else if Station[i].FSlot[j].BdType = KMI_ADE then
            begin
                for k:=0 to MAX_CHANNEL-1 do
                begin
                    with Station[i].EthernetAD[nADECnt].FADScale[k] do
                    begin
                        if (FrmIOScale <> nil) and (FrmIOScale.GridAD.RowCount > k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1) then
                        begin
                            Range  := RangeValue(FrmIOScale.GridAD.Cells[1,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1]);
                            Min    := StrToFloatDef(FrmIOScale.GridAD.Cells[2,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1],0);
                            Max    := StrToFloatDef(FrmIOScale.GridAD.Cells[3,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1],30);
                            sUnit  := FrmIOScale.GridAD.Cells[4,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1];
                            Scale  := StrToFloatDef(FrmIOScale.GridAD.Cells[5,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1],1);
                            offset := StrToFloatDef(FrmIOScale.GridAD.Cells[6,k+((nADCnt+nADECnt)*MAX_CHANNEL_COUNT)+1],0);
                        end;
                    end;
                end;
                Inc(nADECnt);
            end;
        end;
    end;

end;

// Ethernet 통신을 연결 또는 해제 한다.
procedure TFrmHWMain.SocketConnect(bConnect:Boolean);
var i : Integer;
begin
    // Log를 남긴다.
    if bConnect then AddLog('> Try connecting.')
                else AddLog('> Try disconnecting.');

    for i:=0 to StCnt-1 do
    begin
        if bConnect then Station[i].Connect
                    else Station[i].DisConnect;
    end;
end;

// GRID에 STATION 정보를 셋팅한다.
procedure TFrmHWMain.MakeGridCfg(nColCount : Integer);
var i, j : Integer;
begin
    with GridCfg do
    begin
        for i:=0 to RowCount-1 do
        begin
            for j:=0 to ColCount-1 do
            begin
                if (Cells[j,i] = '') or (Cells[j,i] = 'NONE') then Cells[j,i] := '';
                if j > nColCount then Cells[j,i] := '';
            end;
        end;

        RowCount := 21;
        if nColCount < 1 then ColCount := 2
        else  ColCount := (nColCount+1);

        FixedCols := 1;

        Cells[0,1] := 'MAIN';
        for i:=2 to RowCount-1 do
        begin
            Cells[0,i] := Format('SLOT#%d',[i-1]);
        end;

        ColWidths[0] := 100;
        ColWidths[1] := 100;
        for i:=1 to nColCount do
        begin
            Cells[i,0] := Format('STATION %d',[i]);      ColWidths[i] := 100;
            Cells[i,1] := Format('192.168.0.%d',[(i-1)*10*2+10]);
        end;
    end;
end;

procedure TFrmHWMain.cmbStationCountChange(Sender: TObject);
var i : Integer;
begin
    StCnt := StrToIntDef(cmbStationCount.text, 0);
    MakeGridCfg(StCnt);

    SetLength(Station,StCnt);
    for i:= 0 to StCnt-1 do
    begin
        if Assigned(Station[i]) then Station[i].Free;
    end;

    for i:= 0 to StCnt-1 do
    begin
        Station[i] := TStation.Create;
        Station[i].FStation := i+1;
    end;

end;

// Station 을 생성한다.
procedure TFrmHWMain.BtnSetStationClick(Sender: TObject);
begin
    if Visible then SaveConfig;

    LoadConfig;
    MakeStation;

    if Visible then MakeADScale;
end;

procedure TFrmHWMain.GridCfgGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmHWMain.GridCfgGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
    with (Sender as TAdvStringGrid) do
    begin
        if Cells[ACol, ARow] = 'ON' then
        begin
            AFont.Color := clRed;
            AFont.Style := [fsBold];
        end;
        if Cells[ACol, ARow] = 'N/A' then
            AFont.Color := clRed;
    end;
end;

// 그리드에 SLOT TYPE 추가
procedure TFrmHWMain.GridCfgGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
    if (ARow > 1) then
    begin
        aEditor := edComboList;
        GridCfg.ClearComboString;
        GridCfg.AddComboString('NONE');
        GridCfg.AddComboString('AD');
        GridCfg.AddComboString('AD(E)');
        GridCfg.AddComboString('DO_16');
        GridCfg.AddComboString('DO_32');
        GridCfg.AddComboString('DI_16');
        GridCfg.AddComboString('DI_32');
        GridCfg.AddComboString('DA');
        GridCfg.AddComboString('RO_1');
        GridCfg.AddComboString('RO_2');
        GridCfg.AddComboString('COM');
        GridCfg.Combobox.DropDownCount := 20;
    end;
end;

// STATION, SLOT 을 생성
procedure TFrmHWMain.MakeStation;
var nCnt, nSlot, nStation, i, nCol : integer;
    Str, sCard : String;
begin
    GridVal.ColCount := (StCnt*MAX_SLOT) + 1;
    // 전역변수인 보드의 카운트를 이곳에서 초기화
    DOCnt  := 0;
    DICnt  := 0;
    DACnt  := 0;
    ADCnt  := 0;
    ROCnt  := 0;

    DOCntTmp := 0;
    DICntTmp := 0;
    DACntTmp := 0;
    ADCntTmp := 0;
    ADECntTmp:= 0;
    ROCntTmp := 0;

    nCnt   := 0;
    
    GridVal.Clear;
    for i:= 1 to 32 do begin
        GridVal.Cells[0, i] := Format('CH %.2d', [i]);
    end;

    for nStation := 1 to StCnt do
    begin
        Str := '';
        for nSlot :=1 to MAX_SLOT do
        begin
            nCol := (nStation-1) * 19 + nSlot;

            sCard := GridCfg.Cells[nStation, nSlot+1];
            Str := Str + sCard+',';

            GridVal.ColWidths[nCol] := 60;
            if (sCard = 'AD(E)') or (sCard = 'AD') then
            begin
                Inc(ADCnt);
                GridVal.Cells[nCol, 0] := Format('SLOT %.2d AD%d', [nSlot, ADCnt]);
            end
            else if sCard = 'DA' then
            begin
                Inc(DaCnt);
                GridVal.Cells[nCol, 0] := Format('SLOT %.2d DA%d', [nSlot, DaCnt]);
            end
            else if Pos('DO', sCard) > 0 then
            begin
                Inc(DoCnt);
                GridVal.Cells[nCol, 0] := Format('SLOT %.2d DO%d', [nSlot, DoCnt]);
            end
            else if Pos('DI', sCard) > 0 then
            begin
                Inc(DICnt);
                GridVal.Cells[nCol, 0] := Format('SLOT %.2d DI%d', [nSlot, DICnt]);
            end
            else if Pos('RO', sCard) > 0 then
            begin
                Inc(ROCnt);
                GridVal.Cells[nCol, 0] := Format('SLOT %.2d RO%d', [nSlot, ROCnt]);
            end else begin
                // Default
                GridVal.Cells[nCol, 0] := Format('%.2d', [nSlot]);
                GridVal.ColWidths[nCol] := 20;
            end;
        end;
        
        SetLength(ADTbl, ADCnt);
        SetLength(DATbl, DACnt);
        SetLength(DOTbl, DOCnt);
        SetLength(DITbl, DICnt);
        SetLength(ROTbl, ROCnt);
        Station[nStation-1].FIP := GridCfg.Cells[nStation,1];
        Station[nStation-1].Build(Str);
    end;
    
    FillChar(ValueTbl,0,0);
    SetLength(ValueTbl, StCnt * MAX_SLOT, MAX_CHANNEL);

end;

procedure TFrmHWMain.btnSaveClick(Sender: TObject);
begin

end;

// Station 별 Slot 정보를 저장한다.
procedure TFrmHWMain.SaveConfig;
var StrList : TStringList;
    i, j : Integer;
    sTemp : String;
begin
    StrList := TStringList.Create;
    try
        StrList.Add(Format('STATION COUNT=%d',[cmbStationCount.ItemIndex]));
        for i:= 1 to GridCfg.RowCount-1 do
        begin
            sTemp := '';
            for j:=1 to GridCfg.ColCount-1 do
            begin
                sTemp := sTemp + GridCfg.Cells[j,i] + ',';
            end;
            if i = 1 then sTemp := 'MAIN='+sTemp
            else sTemp := Format('SLOT#%d=',[i-1])+sTemp;
            StrList.Add(sTemp);
        end;
        StrList.SaveToFile(GetAppDir('')+'BoardInfo.ini');
    finally
        StrList.Free;
    end;

end;


// Station 별 Slot 정보를 로드한다.
procedure TFrmHWMain.LoadConfig;
var StrList : TStringList;
    i, j, nCol, nStationCount : Integer;
    sTemp : String;
begin
    if Not FileExists(GetAppDir('')+'BoardInfo.ini') then exit;
    StrList := TStringList.Create;
    try
        StrList.LoadFromFile(GetAppDir('')+'BoardInfo.ini');
        nStationCount := StrToIntDef(StrList.Values['STATION COUNT'],0);
        cmbStationCount.ItemIndex := nStationCount;
        for i:= 1 to StrList.Count-1 do
        begin
            sTemp := StrList.Strings[i];
            GetToKen(sTemp,'=');
            for j:=1 to nStationCount do
            begin
                GridCfg.Cells[j,i] := GetToKen(sTemp,',');
            end;
        end;
    finally
        StrList.Free;
    end;

end;


// 소켓의 연결상태를 Display 한다.
// 0 : 연결완료
// 1 : Main Disconnect
// 2 : ADE Disconnect
function TFrmHWMain.SocketStatusDisplay() :Integer;
var i, j : Integer;
    sStatus : String;
begin
    Result := 0;
    try
    for i := 0 to StCnt-1 do
    begin
        // Station
        if Assigned(Station[i]) then
        case Station[i].FSocket.Status of
            SOCKET_DISCONNECT :  begin
                GridCfg.Colors[i+1,1] := clGray;
                Result := 1;
                sStatus := 'Disconnect';
            end;
            SOCKET_CONNECTED :  begin
                GridCfg.Colors[i+1,1] := clLime;
                sStatus := 'Connected';
            end;
            SOCKET_CONNECTING :  begin
                GridCfg.Colors[i+1,1] := clYellow;
                sStatus := 'Connecting...';
            end;
            SOCKET_ERROR :  begin
                GridCfg.Colors[i+1,1] := clRed;
                Result := 1;
                sStatus := 'ERROR';
            end;
            else begin
                sStatus := 'UNKNOWN';
            end;
        end;
        StatusBar.Panels[i].Text := sStatus;

        // Station 내부의 Ethernet 보드
        for j:=0 to Station[i].FADECnt-1 do
        begin
            if Assigned(Station[i].EthernetAD[j]) then
            case Station[i].EthernetAD[j].FSocket.Status of
                SOCKET_DISCONNECT :  begin
                         GridCfg.Colors[i+1, Station[i].EthernetAD[j].FSlot+1] := clGray;
                         Result := 2;
                     end;
                SOCKET_CONNECTED  :  GridCfg.Colors[i+1, Station[i].EthernetAD[j].FSlot+1] := clLime;
                SOCKET_CONNECTING :  GridCfg.Colors[i+1, Station[i].EthernetAD[j].FSlot+1] := clYellow;
                SOCKET_ERROR      :  begin
                         GridCfg.Colors[i+1, Station[i].EthernetAD[j].FSlot+1] := clRed;
                         Result := 2;
                     end;
            end;
        end;
    end;
    except
        //
    end;
end;


//------------------------------------------------------------------------------
//  버퍼의 데이터를 화면에 표시한다.
//------------------------------------------------------------------------------
procedure TFrmHWMain.DisplayValue;
var
    nStation, nSlot, nCh, nSlotIdx, nMaxCh, i : Integer;
    nSt, nSl : Integer;
    sValue: String;
    nResNo, nADNo : integer;
    fValue : Double;
begin
    try
{
    nCh   := ARow;
    nStation := (nCol Div MAX_SLOT);
    nSlot    := (nCol mod MAX_SLOT);
    if nSlot = 0 then nSlot := 19;

    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nValIdx  := (nStation * MAX_SLOT)+(nSlot-1);         // ValueTbable 의 INdex No

    nBdType  := Station[nStation].FSlot[nSlot].BdType;
    nBdNo    := Station[nStation].FSlot[nSlot].BdIdx;    // 실제 자신의 속한 보드별 그룹의 No 를 리턴
}

    nResNo := 0;
    for nStation:= 0 to StCnt-1 do
    begin
        nADNo := 0;  // 각 Station에 0부터 시작.
        for nSlot:=1 to MAX_SLOT do
        begin
            nSlotIdx := (nStation*19) + nSlot;
            case Station[nStation].FSlot[nSlot].BdType of
            //------------------------------------------------------------------
            KMI_AD, KMI_ADE : begin
                for nCh := 0 to 31 do begin
                    case Rg_Display.ItemIndex of
                        0: fValue := ValueTbl[nSlotIdx-1, nCh];
                        1: fValue := Station[nStation].FADScale[nADNo, nCh].Min;
                        2: fValue := Station[nStation].FADScale[nADNo, nCh].Max;
                        3: fValue := Station[nStation].FADScale[nADNo, nCh].Scale;
                        4: fValue := Station[nStation].FADScale[nADNo, nCh].offset;
                    end;

                    if fValue = INVALID_VALUE then
                        sValue := 'N/A'
                    else begin
                        if Rg_Display.ItemIndex = 0 then
                            sValue := FormatFloat('0.000', fValue)
                        else
                            sValue := FormatFloat('0.###', fValue);
                    end;

                    if (sValue <> GridVal.Cells[nSlotIdx, nCh+1]) then
                        GridVal.Cells[nSlotIdx, nCh+1] := sValue;
                end;
                Inc(nADNo);
            end;
            //------------------------------------------------------------------
            KMI_DO : begin
                for i:=0 to DOCnt-1 do
                begin
                    nSt   := DOTbl[i].Station -1;
                    nSl   := DOTbl[i].Slot;
                    if (nSt = nStation) and (nSl = nSlot) then
                    begin
                        nMaxCh   := DOTbl[i].MaxCh;
                        break;
                    end;
                end;

                for nCh := 0 to nMaxCh-1 do
                begin
                    if ValueTbl[nSlotIdx-1, nCh] <> 0 then
                        sValue := 'ON'
                    else
                        sValue := 'OFF';

                    if (sValue <> GridVal.Cells[nSlotIdx, nCh+1]) then
                        GridVal.Cells[nSlotIdx, nCh+1] := sValue;
                end;
            end;
            //------------------------------------------------------------------
            KMI_DI :  begin
                for i:=0 to DICnt-1 do
                begin
                    nSt   := DITbl[i].Station -1;
                    nSl   := DITbl[i].Slot;
                    if (nSt = nStation) and (nSl = nSlot) then
                    begin
                        nMaxCh   := DITbl[i].MaxCh;
                        break;
                    end;
                end;

                for nCh := 0 to nMaxCh-1 do
                begin
                    if ValueTbl[nSlotIdx-1, nCh] <> 0 then
                        sValue := 'ON'
                    else
                        sValue := 'OFF';

                    if (sValue <> GridVal.Cells[nSlotIdx, nCh+1]) then
                        GridVal.Cells[nSlotIdx, nCh+1] := sValue;
                end;
            end;
            //------------------------------------------------------------------
            KMI_DA : begin
                for nCh := 0 to 7 do begin
                    sValue := FormatFloat('0.000', ValueTbl[nSlotIdx-1, nCh]);

                    if (sValue <> GridVal.Cells[nSlotIdx, nCh+1]) then
                        GridVal.Cells[nSlotIdx, nCh+1] := sValue;
                end;
            end;
            //------------------------------------------------------------------
            KMI_RO : begin
                for i:=0 to ROCnt-1 do
                begin
                    nSt   := ROTbl[i].Station -1;
                    nSl   := ROTbl[i].Slot;
                    if (nSt = nStation) and (nSl = nSlot) then
                    begin
                        nMaxCh   := ROTbl[i].MaxCh;
                        break;
                    end;
                end;

                for nCh := 0 to nMaxCh-1 do begin
                    sValue := FormatFloat('0.000', ValueTbl[nSlotIdx-1, nCh]);
                    if (sValue <> GridVal.Cells[nSlotIdx, nCh+1]) then
                        GridVal.Cells[nSlotIdx, nCh+1] := sValue;
                end;
            end;


            end;
        end;

    end;

    finally
    end;
end;

//------------------------------------------------------------------------------
//  그리드 더블클릭시 제어 (DO, RO, PO)
//------------------------------------------------------------------------------
procedure TFrmHWMain.GridValDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var i, nCol : Integer;
    nStation, nSlot, nValIdx, nCh, nBdType, nBdNo, nResNo : Integer;
    fValue : Double;
    sValue : String;
begin
    if (ARow < 0) or (ACol < 0) then exit;

    nCol := ACol;
{
    for i:=Low(BaseSlotInfo) to High(BaseSlotInfo) do
    begin
        if ACol = BaseSlotInfo[i-1].ReNewIdx then
        begin
            nCol := i;
            break;
        end;
    end;
}
    nCh   := ARow;
    nStation := (nCol Div MAX_SLOT);
    nSlot    := (nCol mod MAX_SLOT);
    if nSlot = 0 then nSlot := 19;

    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nValIdx  := (nStation * MAX_SLOT)+(nSlot-1);         // ValueTbable 의 INdex No

    nBdType  := Station[nStation].FSlot[nSlot].BdType;
    nBdNo    := Station[nStation].FSlot[nSlot].BdIdx;    // 실제 자신의 속한 보드별 그룹의 No 를 리턴

    case nBdType of
        KMI_DO : begin
            WriteDO(nBdNo, nCh, (ValueTbl[nValIdx, nCh-1] = 0));
        end;

        KMI_DA : begin
            sValue := FloatToStr(ValueTbl[nValIdx, nCh-1]);
            if InputQuery(Format('DA%d_%.2d', [nBdNo, nCh]), 'INPUT VALUE', sValue) then
            begin
                fValue := StrToFloatDef(sValue, 0);
                WriteDA(nBdNo, nCh, fValue);
            end;
        end;

        KMI_RO : begin
            sValue := FloatToStr(ValueTbl[nValIdx, nCh-1]);
            if InputQuery(Format('RO%d', [nBdNo]), 'INPUT VALUE', sValue) then
            begin
                fValue := StrToFloatDef(sValue, 0);
                WriteRO(nBdNo, nCh, fValue);
            end;

        end;

        KMI_AD : begin
            LbSTNo.Caption := Format('%d',[nStation+1]);
            LbBDNo.Caption := Format('%d',[nBdNo]);
            LbCHNo.Caption := Format('%d',[nCh]);
            LbADEBdNo.Caption := 'NONE';
            with Station[nStation].FADScale[nBdNo-1,nCh-1] do
            begin
                EditMin.Text    := Format('%f',[Min]);
                EditMax.Text    := Format('%f',[Max]);
                EditUnit.Text   := sUnit;
                EditScale.Text  := Format('%f',[Scale]);
                EditOffset.Text := Format('%f',[Offset]);
            end;
            plScale.Left := xPos + 20;
            if nCh > 15 then
                plScale.Top  := yPos - 250
            else
                plScale.Top  := yPos;
            plScale.Visible := true;
        end;

        KMI_ADE : begin
            // ADE 의 SLOT 번호를 가져와서 FEnSlot 의 배열인덱스를 받는다.
            for i:=1 to Station[nStation].FADECnt do
            begin
                if nSlot = Station[nStation].EthernetAD[i-1].FSlot then
                begin
                    nSlot := i;
                    break;
                end;
            end;
            LbSTNo.Caption := Format('%d',[nStation+1]);
            LbBDNo.Caption := Format('%d',[nBdNo]);
            LbCHNo.Caption := Format('%d',[nCh]);
            LbADEBdNo.Caption := Format('%d',[nSlot]);
            with Station[nStation].EthernetAD[nSlot-1].FADScale[nCh-1] do
            begin
                EditMin.Text    := Format('%f',[Min]);
                EditMax.Text    := Format('%f',[Max]);
                EditUnit.Text   := sUnit;
                EditScale.Text  := Format('%f',[Scale]);
                EditOffset.Text := Format('%f',[Offset]);
            end;
            plScale.Left := xPos + 20;
            if nCh > 15 then
                plScale.Top  := yPos - 250
            else
                plScale.Top  := yPos;
            plScale.Visible := true;
        end;

    end;

end;

//------------------------------------------------------------------------------
// AD SCALE 값을 조정한다.
procedure TFrmHWMain.BtnScaleOKClick(Sender: TObject);
var i : Integer;
    nStation, bBoard, nChannel : Integer;
begin
    nStation := StrToIntDef(LbSTNo.Caption,1)-1;
    bBoard   := StrToIntDef(LbBDNo.Caption,1)-1;
    nChannel := StrToIntDef(LbCHNo.Caption,1)-1;

    if LbADEBdNo.Caption = 'NONE' then
    begin
        // AD 일 경우
        with Station[nStation].FADScale[bBoard,nChannel] do
        begin
            Min    := StrToFloatDef(EditMin.Text,0);
            Max    := StrToFloatDef(EditMax.Text,30);
            sUnit  := EditUnit.Text;
            Scale  := StrToFloatDef(EditScale.Text,1);
            offset := StrToFloatDef(EditOffset.Text,0);
        end;
    end else
    begin
        // ADE 일 경우
        with Station[nStation].EthernetAD[bBoard].FADScale[nChannel] do
        begin
            Min    := StrToFloatDef(EditMin.Text,0);
            Max    := StrToFloatDef(EditMax.Text,30);
            sUnit  := EditUnit.Text;
            Scale  := StrToFloatDef(EditScale.Text,1);
            offset := StrToFloatDef(EditOffset.Text,0);
        end;
    end;

    // 훗날에 Station 이 2개 이상일 경우에 Scale 폼의 PageContorl 의 tabsheet 을 Station 갯수로 증가시키도록 해주세요!
    with FrmIOScale.GridAD do
    begin
        for i:=1 to RowCount-1 do
        begin
            if Format('AD%d_%.2d',[StrToIntDef(LbBDNo.Caption,1),StrToIntDef(LbCHNo.Caption,1) ]) = FrmIOScale.GridAD.Cells[0,i] then
            begin
                Cells[2,i] := EditMin.Text;
                Cells[3,i] := EditMax.Text;
                Cells[4,i] := EditUnit.Text;
                Cells[5,i] := EditScale.Text;
                Cells[6,i] := EditOffset.Text;
                break;
            end;
        end;
    end;

    FrmIOScale.SaveScaleFile();
    plScale.Visible := False;
end;


procedure TFrmHWMain.BtnScaleCloseClick(Sender: TObject);
begin
    plScale.Visible := False;
end;


//------------------------------------------------------------------------------
// HardWare Control Start
// 전송방법
// 자신이 속한 Board 테이블에서 Station , Slot 번호를 받아와
// 해당 Station 으로 커멘트 전송
//------------------------------------------------------------------------------
// DO 컨트롤
function TFrmHWMain.WriteDO(nBDNo, nChNo : Integer; bOnOff: Boolean) : Boolean;
var i, nResNo, nStation, nSlot, nMaxCh : Integer;
    DOValue : Longword;
    ChPos : LongWord;
begin
    Result := False;

    if DOTbl = nil then exit;
    if (nBDNo < 1) then exit;
    nStation := DOTbl[nBDNo-1].Station;
    nSlot    := DOTbl[nBDNo-1].Slot;
    nMaxCh   := DOTbl[nBDNo-1].MaxCh;
    if (nChNo > nMaxCh) then exit;

    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := nChNo-1;

    if (nResNo > -1) then
    begin
        if bOnOff then
            ValueTbl[nResNo, nChNo] := 1
        else
            ValueTbl[nResNo, nChNo] := 0;

        DOValue := 0;
        ChPos := (nChNo Div 8);
        for i:= (0 + (ChPos*8)) to (7 + (ChPos*8)) do begin
            if ValueTbl[nResNo, i] <> 0 then
                DOValue := DOValue + (1 shl (i - (ChPos*8)));
        end;
        nResNo := nResNo mod MAX_SLOT;

        Result := Station[nStation-1].Write(KMI_WR_CMD, [nResNo+1, ChPos, DOValue]);

        //------------------------------
        // DUBUG.....
        if (not Result) then begin
            if bOnOff then
                ValueTbl[nResNo, nChNo] := 0
            else
                ValueTbl[nResNo, nChNo] := 1;
            //
        end;

        //------------------------------
        // Station[nStation-1].Write(KMI_DO_CMD, [nResNo+1, ChPos, DOValue]);

        // WriteDO 명령어를 안쓰고 WR_CMD 를 사용함. 왜????
    end;
end;

//------------------------------------------------------------------------------
function TFrmHWMain.WriteDA(nBDNo, nChNo : Integer; fValue: Double)  : Boolean;
var nResNo, nStation, nSlot, nData : Integer;
    DOValue : Word;
begin
    if DATbl = nil then exit;
    if (nBDNo < 1) or (nChNo > 10) then exit;

    nStation := DATbl[nBDNo-1].Station;
    nSlot    := DATbl[nBDNo-1].Slot;
    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := nChNo-1;

    if (nResNo > -1) then
    begin
        ValueTbl[nResNo, nChNo] := fValue;
        nData := Round( RescaleData(0, 10, 0, 4096, fValue) );
        nResNo := nResNo mod MAX_SLOT;
        Station[nStation-1].Write(KMI_DA_CMD, [nResNo+1, nChNo, HI(nData), LO(nData)]);
    end;
end;
//------------------------------------------------------------------------------
procedure TFrmHWMain.ResetRO(nBDNo: integer);
var i, R, n, V : Integer;
    nResNo, nStation, nSlot, nData, nVer, nMaxCh : Integer;
    DOValue : Word;
    sData : String;
    fValue: double;
    nChNo: integer;

begin
    if ROTbl = nil then exit;
    if (nBDNo < 1) then exit;
    fValue := 0;

    nStation := ROTbl[nBDNo-1].Station;
    nSlot    := ROTbl[nBDNo-1].Slot;
    nMaxCh   := ROTbl[nBDNo-1].MaxCh;
    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := 0;

    if (nResNo > -1) then
    begin
        ValueTbl[nResNo, nChNo] := fValue;
        nResNo := nResNo mod MAX_SLOT;
        if nMaxCh = 1 then // Old 1 Channel RO
            Station[nStation-1].Write(KMI_RO_CMD, [nResNo+1, 0, 0, 0]);
    end;
end;

//------------------------------------------------------------------------------
function TFrmHWMain.WriteRO(nBDNo, nChNo : Integer; fValue: Double)  : Boolean;
var i, R, n, V : Integer;
    nResNo, nStation, nSlot, nData, nVer, nMaxCh : Integer;
    DOValue : Word;
    sData : String;
begin
    if DOTbl = nil then exit;
    if (nBDNo < 1) or (nChNo > 2) then exit;

    nStation := ROTbl[nBDNo-1].Station;
    nSlot    := ROTbl[nBDNo-1].Slot;
    nMaxCh   := ROTbl[nBDNo-1].MaxCh;
    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := nChNo-1;


    if (nResNo > -1) then
    begin
        ValueTbl[nResNo, nChNo] := fValue;

        if nMaxCh = 1 then // Old 1 Channel RO
        begin
            // fValue = 000.00 -> Data..
            R := Round(fValue * 100); // 소수점 2자리까지 XXX.XX -> XXXXX

            nData := 0;
            for n := 0 to 4 do
            begin
                // 저항 Range를 0.01 에서 999.99 -> 1599.99 까지 확장.
                if (n=4) and (R > 9) then
                begin
                    R := (R and $0F);
                    for i:=0 to 3 do begin
                        //WriteDO (4 * n+i, R and (R shl i) = 0);
                        if (R and (1 shl i) = 0) then
                            nData := nData or (1 shl ((n*4)+i));
                    end;
                end else begin
                    V := R mod 10; // 맨끝자리 BCD DIGIT 하나 구함
                    for i := 0 to 3 do begin
                        if (V and (1 shl i) = 0) then
                            nData := nData or (1 shl ((n*4)+i));
                    end;
                end;
                R := R div 10;
            end;
            nResNo := nResNo mod MAX_SLOT;
            Station[nStation-1].Write(KMI_RO_CMD, [nResNo+1, (nData shr 16) and $FF,
                                                             (nData shr 8 ) and $FF,
                                                             (nData       ) and $FF]);

        // 저항 2채널짜리 보드.                                                     /
        end else if nMaxCh = 2 then // New 2 Channel RO
        begin
            // 55 0A 00 10 10 00 03 03 03 02   -> 채널정보
            // 55 0A 00 10 10 00 03 03 02 11   -> DATA
            // 55 0A 00 10 10 00 03 03 01 22   -> DATA
            // 55 0A 00 10 10 00 03 03 00 33   -> DATA

            // 3Slot, Ch1 => 112.233 Ω전송

            // 55 0A 00 10 10 00 03 03 03 03   -> 채널정보
            // 55 0A 00 10 10 00 03 03 02 11   -> DATA
            // 55 0A 00 10 10 00 03 03 01 22   -> DATA
            // 55 0A 00 10 10 00 03 03 00 33   -> DATA

            // 3Slot, Ch2 => 112.233 Ω전송
            nVer := 1; // New -> 1 ,  Lagacy -> 0
            nData := (nVer Shl 1);
            nData := nData + nChNo;
            // 채널정보 전송
            Station[nStation-1].Write(KMI_WR_CMD, [nResNo+1, 3, nData]);
            // Data 전송

            // fValue = 000.000 -> Data..
            nData := Round(fValue * 1000); // 소수점 2자리까지 XXX.XX -> XXXXX
            sData := Format('%.6d',[nData]);
            // BCD 반전
            nResNo := nResNo mod MAX_SLOT;
            Station[nStation-1].Write(KMI_WR_CMD, [nResNo+1, 2, StrToIntDef('$'+Copy(sData,1,2),0) xor $FF]);
            Station[nStation-1].Write(KMI_WR_CMD, [nResNo+1, 1, StrToIntDef('$'+Copy(sData,3,2),0) xor $FF]);
            Station[nStation-1].Write(KMI_WR_CMD, [nResNo+1, 0, StrToIntDef('$'+Copy(sData,5,2),0) xor $FF]);
        end;
    end;
end;
//------------------------------------------------------------------------------
// ReadAD
function TFrmHWMain.ReadAD(nBDNo, nChNo : Integer) : Double;
var nResNo, nStation, nSlot : Integer;
begin
    if ADTbl = nil then exit;
    Result := INVALID_VALUE;
    if (nBDNo > (ADCntTmp + ADECntTmp)) or (nChNo < 1) then exit;

    nStation := ADTbl[nBDNo-1].Station;
    nSlot    := ADTbl[nBDNo-1].Slot;
    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := nChNo-1;

//    nResNo := nResNo mod MAX_SLOT;
    Result := ValueTbl[nResNo, nChNo];
end;
//------------------------------------------------------------------------------
// ReadDI
function TFrmHWMain.ReadDI(nBDNo, nChNo: Integer): Boolean;
var nResNo, nStation, nSlot : Integer;
begin
    if DITbl = nil then exit;
    Result := False;
    if (nBDNo > (DICntTmp)) or (nChNo < 1) then exit;

    nStation := DITbl[nBDNo-1].Station;
    nSlot    := DITbl[nBDNo-1].Slot;
    nResNo   := (((nStation -1)* MAX_SLOT) + nSlot)-1;
    nChNo    := nChNo-1;

    Result := (ValueTbl[nResNo, nChNo] <> 0);

end;

//------------------------------------------------------------------------------
// 주기적으로 측정값을 표시한다.
procedure TFrmHWMain.TimerDisplayTimer(Sender: TObject);
var i : Integer;
begin
    TimerDisplay.Enabled := False;

    if PageControl.ActivePageIndex = 1 then
        DisplayValue;

    // 해당 Station 에 AD, DI 의 주기적으로 Reading 을 하면서 Main 보드로의
    // 메세지 전송을 할 보드가 설치 되지 않았을 경우 일정주기로 통신의 접속을 유지시키 위한 변수
    for i:=0 to StCnt-1 do
    begin
        if (Station[i].FADCnt = 0) and (Station[i].FDICnt = 0) then
        begin
            if (GetTickCountEx - DummyTime) >  4000 then
            begin
                Station[i].Write(KMI_DM_CMD, []);   // Dummy명령어 전송.
                DummyTime := GetTickCountEx;
            end;
        end;
    end;
    
    TimerDisplay.Interval := Ed_UpdateRate.Value;
    TimerDisplay.Enabled  := True;
end;

procedure TFrmHWMain.GridValGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
    with (Sender as TAdvStringGrid) do begin
        if Cells[ACol, ARow] = 'ON' then
        begin
            AFont.Color := clBlue;
            AFont.Style := [fsBold];
        end;
        if Cells[ACol, ARow] = 'N/A' then
            AFont.Color := clRed;
    end;
end;

procedure TFrmHWMain.FormDestroy(Sender: TObject);
begin
    TimerConnect.Enabled := False;

    InitializeDeviceAll;

    SocketConnect(False);
end;


procedure TFrmHWMain.FormShow(Sender: TObject);
begin
    TimerDisplay.Enabled := True;
end;

procedure TFrmHWMain.cbSettingClick(Sender: TObject);
begin
    TimerDisplay.Enabled := False;
    SocketConnect(False);

    cmbStationCount.Enabled := cbSetting.Checked;
    BtnSetStation.Enabled   := cbSetting.Checked;
    GridCfg.Enabled         := cbSetting.Checked;
    
    if not cbSetting.Checked then
    begin
        SocketConnect(True);
        TimerDisplay.Enabled := True;
    end;
end;

//------------------------------------------------------------------------------
// Socket 쪽에 Event가 발생하면 여기서 처리한다.
procedure TFrmHWMain.OnEvent(Sender: TObject);
var i, nStatus, nStationNo, nErrCode : Integer;
    sMessage : String;
begin
    try
        // Staion Nuber를 찾는다.
        nStationNo := -1;
        for i := 0 to StCnt-1 do begin
            if (Station[i].FSocket = Sender) then
            begin
                nStationNo := i+1;
                break;
            end;
        end;

        // Staution의 Event항목을 표시한다.
        if nStationNo > 0 then begin
            nStatus  := (Sender as TSocketKMI).Status;
            nErrCode := (Sender as TSocketKMI).ErrorCode;
            case nStatus of
                SOCKET_DISCONNECT : AddLog(Format('(Station %d) DisConnect',    [nStationNo]));
                SOCKET_CONNECTED  : AddLog(Format('(Station %d) Connected',     [nStationNo]));
                SOCKET_CONNECTING : AddLog(Format('(Station %d) Connecting...', [nStationNo]));
                SOCKET_ERROR      : AddLog(Format('(Station %d) Error(%d)',     [nStationNo, nErrCode]));
            end;
        end;
    except
    end;

    // 화면에 연결상태 표시.
    SocketStatusDisplay();

{
// 0 : 연결완료
// 1 : Main Disconnect
// 2 : ADE Disconnect
    // Main DisConnect 일 경우에만 재접속 시도
    if (SocketConnReq = 1) and (not cbSetting.Checked) and (Cb_AutoConnect.Checked) then
    begin
        TimerConnect.Enabled := True;
    end;
}
end;

//------------------------------------------------------------------------------
// AD BUFFER  sSampleRate = 10Kz  sCh = 1,18,2,
function TFrmHWMain.SetADEBuff(nBDNo, nRecordCount : Integer; fSampleRate : Double; sCh : String) : Boolean;
var
    ChCnt, i, j : Integer;
    nStation, nSlot : Integer;
    fTime : Double;
begin
    Result := False;
    //if (nBDNo > ADECnt) then exit;
    if ADTbl = nil then exit;

    try
        nStation := ADTbl[nBDNo-1].Station;
        nSlot    := ADTbl[nBDNo-1].Slot;

        // ADE 의 SLOT 번호를 가져와서 FEnSlot 의 배열인덱스를 받는다.
        for i:=1 to Station[nStation-1].FADECnt do
        begin
            if nSlot = Station[nStation-1].EthernetAD[i-1].FSlot then
            begin
                nSlot := i;
                Station[nStation-1].EthernetAD[nSlot-1].StartBuffer(sCh, fSampleRate, nRecordCount );
                Result := True;
                break;
            end;
        end;
    except
    end;
end;

//------------------------------------------------------------------------------
// 고속 ADBuff상태를 가져온다.
function TFrmHWMain.BuffStatus(nBDNo : Integer) : Boolean;
var ChCnt, i, j : Integer;
    nStation, nSlot : Integer;
begin
    Result := False;

    //if nBDNo > ADECnt then exit;
    if ADTbl = nil then exit;

    nStation := ADTbl[nBDNo-1].Station;
    nSlot    := ADTbl[nBDNo-1].Slot;

    // ADE 의 SLOT 번호를 가져와서 FEnSlot 의 배열인덱스를 받는다.
    for i:=1 to Station[nStation-1].FADECnt do
    begin
        if nSlot = Station[nStation-1].EthernetAD[i-1].FSlot then
        begin
            nSlot := i;
            break;
        end;
    end;

    with Station[nStation-1].EthernetAD[nSlot-1] do
    begin
        Result := (EthernetADStatus = st_Complete);
    end;
end;


//------------------------------------------------------------------------------
// 고속 ADBuff 데이터를 가져온다.
function TFrmHWMain.ReadADEBuff(nBDNo : Integer):TRdBuff;
var ChCnt, i, j : Integer;
    nStation, nSlot : Integer;
    DataPtr: Pointer;
begin
    Result := Nil;

    //if nBDNo > ADECnt then exit;
    if ADTbl = nil then exit;

    nStation := ADTbl[nBDNo-1].Station;
    nSlot    := ADTbl[nBDNo-1].Slot;


    // ADE 의 SLOT 번호를 가져와서 FEnSlot 의 배열인덱스를 받는다.
    for i:=1 to Station[nStation-1].FADECnt do
    begin
        if nSlot = Station[nStation-1].EthernetAD[i-1].FSlot then
        begin
            nSlot := i;
            break;
        end;
    end;


    with Station[nStation-1].EthernetAD[nSlot-1] do
    begin
        if (EthernetADStatus = st_Complete) then
        begin
            Result := TRdBuff(ReturnBuffer^);
        end;
    end;
end;

// 채널의 카운트를 읽어온다.
// 1,3,5 -> 3
function TFrmHWMain.GetBuffChCnt(sCh:String):Integer;
var sTemp : String;
    nData : array of Integer;
begin
    Result := 0;
    while (sCh <> '') do
    begin
        sTemp := GetToKen(sCh,',');
        Inc(Result);
    end;
end;

procedure TFrmHWMain.cbLogSaveClick(Sender: TObject);
begin
    bSaveLog := cbLogSave.Checked;
end;

////////////////////////////////////////////////////////////////////////////////
// 기존 HardWare 추가
function TFrmHWMain.WriteIOcontrol(ctlname, param, tagStr: String): Boolean;
var i, nCardNo, nChNo : Integer;
    Str, RdStr, IOName : String;
begin
    // crlName = AD1_02,, 이런식...
    with FrmHWMain do
    begin
        RdStr := ctlname;
        Str := GetToken(RdStr, '_');

        IOName  := Copy(Str, 1, 2);
        nCardNo := StrToIntDef(Copy(Str, 3, Length(Str)-2), 1);
        nChNo   := StrToIntDef(RdStr, 1);

        if Pos('DO', IOName) > 0 then begin
            WriteDO(nCardNo, nChNo, (param = 'ON') or (param = '1') or (param = 'TRUE'));
        end else
        if (IOName = 'DA') then begin
            WriteDA(nCardNo, nChNo, StrToFloatDef(param, 0));
        end else
        if Pos('RO', IOName) > 0 then begin
            // 이건왜 주서처리???
            //WriteRO(nCardNo, nChNo, StrToFloatDef(param, 0));
        end;

    end;
end;

function TFrmHWMain.ReadIOcontrol(ctlname, param, tagStr: String): String;
var i, nCardNo, nChNo : Integer;
    Str, RdStr, IOName : String;
    fValue : Double;
begin
    // crlName = AD1_02,, 이런식...
    with FrmHWMain do
    begin
        RdStr := ctlname;
        Str := GetToken(RdStr, '_');

        IOName  := Copy(Str, 1, 2);
        nCardNo := StrToIntDef(Copy(Str, 3, Length(Str)-2), 1);
        nChNo   := StrToIntDef(RdStr, 1);

        if (IOName = 'AD') then
        begin
            fValue := ReadAD(nCardNo, nChNo);
            if tagStr <> '' then
            begin
                RdStr := tagStr;
                Str := GetToken(RdStr, '_');
                IOName  := Copy(Str, 1, 2);
                nCardNo := StrToIntDef(Copy(Str, 3, Length(Str)-2), 1);
                nChNo   := StrToIntDef(RdStr, 1);
                fValue  := ABS(fValue - ReadAD(nCardNo, nChNo));
            end;
            Result := FloatToStr(fValue);
        end else
        if Pos('DI', IOName) > 0 then begin
            if ReadDI(nCardNo, nChNo) then
                Result := 'TRUE'
            else
                Result := 'FALSE';
        end;
    end;
end;


procedure TFrmHWMain.GetIOcontrolList (Strlist: TStrings; ResType : TResType);
var i, j: Integer;
begin
    Strlist.Clear;
    case ResType of
        res_AO : begin
            for i := 1 to DACnt do
                for j := 1 to 8 do
                    StrList.Add(Format('DA%d_%.2d',[i,j]));
        end;

        res_DO : begin
            for i := 1 to DOCnt do
                for j := 1 to MAX_IO_CH do
                    StrList.Add(Format('DO%d_%.2d',[i,j]));
        end;

        res_RO : begin
                Strlist.Add ('RO1_1');
                Strlist.Add ('RO1_2');
                Strlist.Add ('RO2_1');
                Strlist.Add ('RO2_2');
                Strlist.Add ('RO3_1');
                Strlist.Add ('RO3_2');
                Strlist.Add ('RO4_1');
                Strlist.Add ('RO4_2');
                Strlist.Add ('RO5_1');
                Strlist.Add ('RO5_2');
        end;

        res_PO : begin
            Strlist.Add ('PO1_01');
            Strlist.Add ('PO1_02');
            Strlist.Add ('PO1_03');
            Strlist.Add ('PO1_04');
        end;

        res_COMIN : begin
           Strlist.Add ('CANDIAG');
           Strlist.Add ('KLINE');
           //Strlist.Add ('TEMP');
           
           //for i:= 1 to MAX_DEVCOUNT do Strlist.Add (Format('DEV_%.2d', [i]));
        end;

        res_VRIN : begin // Read
            Strlist.Add ('GRAPH');
            Strlist.Add ('KMISCOPE');
        end;

        res_AD : begin
            for i:=1 to ADCnt do
                for j:=1 to 32 do
                    StrList.Add(Format('AD%d_%.2d',[i,j]));
        end;

        res_DI : begin
            for i:=1 to DICnt do
                for j:=1 to MAX_IO_CH do
                    StrList.Add(Format('DI%d_%.2d',[i,j]));
        end;

        res_COMOUT : begin
            //for i:= 1 to MAX_DEVCOUNT do Strlist.Add (Format('DEV_%.2d', [i]));
            Strlist.Add ('CANDIAG');
            Strlist.Add ('KLINE');
            Strlist.Add ('ACTUATOR');
        end;

        res_VROUT : begin  // Write
            Strlist.Add ('RESETIO');
            Strlist.Add ('GRAPH');
            Strlist.Add ('KMISCOPE');
            Strlist.Add ('MANUAL');
        end;

        res_CAN : begin
            Strlist.Add ('CAN1_01');
            Strlist.Add ('CAN1_02');
            Strlist.Add ('CAN2_01');
            Strlist.Add ('CAN2_02');
        end;
    end;
end;



// 연결종료시 자동 재 접속.
procedure TFrmHWMain.TimerConnectTimer(Sender: TObject);
var i : Integer;
begin
    TimerConnect.Enabled := False;

    // 자동 재접속 옵션이 켜있고 사용자 의지 Disconnect가 아닐경우에만
    // 재접속을 시도한다.  연결이 끊어진 소켓에 대하여만 접속시도.   2015.04.01 수정.
    if (Cb_AutoConnect.Checked) and (BtnDisconnect.Tag = 0) then
    begin

        for i := 0 to StCnt-1 do
        begin
            // Auto Reconnect상태일 때, 해당 Station에 대하여 현재 Socket 상태가
            // disconnect(0)이거나 Error(9)일 때, 재접속을 시도한다.
            if (Station[i].FSocket.Status in [0, 9]) then begin
                AddLog(Format('Try to reconnect socket%d', [i+1]));
                Station[i].FSocket.Connect;
            end;
        end;
        BtnDisconnect.Tag := 0;
    end;

    TimerConnect.Enabled := True;
end;

procedure TFrmHWMain.GridValMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    xPos := X;
    yPos := Y;
end;

procedure TFrmHWMain.BtnConnectClick(Sender: TObject);
begin
    SocketConnect(True);
end;

procedure TFrmHWMain.BtnDisconnectClick(Sender: TObject);
begin
    BtnDisconnect.Tag := 1;
    SocketConnect(False);
end;

procedure TFrmHWMain.BtnInitialClick(Sender: TObject);
begin
    InitializeDeviceAll(False);
end;

procedure TFrmHWMain.BtnSetScaleClick(Sender: TObject);
begin
    FrmIOScale.Show;
end;

procedure TFrmHWMain.BtnADBuffClick(Sender: TObject);
var i, nStation, nSlot : Integer;
begin
    FrmADBuff.cbBuffADSlot.Clear;
    for i:= Low(ADTbl) to High(ADTbl) do
    begin
        nStation := ADTbl[i].Station;
        nSlot    := ADTbl[i].Slot;
        if Station[nStation-1].FSlot[nSlot].BdType = KMI_ADE then
            FrmADBuff.cbBuffADSlot.Items.Add(Format('SLOT%d AD(E)%d', [((nStation-1)*MAX_SLOT)+nSlot, i+1]));
    end;
    FrmADBuff.ShowModal;
end;

function TFrmHWMain.WritePO(nBDNO, nChNo: Integer; fFreq, fDuty: Double): Boolean;
var Str : String;
    i, Port : Integer;
begin
{
    Result := False;
    Str   := Format('CH%d,%d,%d',[nChNo, Round(fFreq*10), Round(fDuty*10)]); //'CH1,1200,500'=12KHZ,50%
    with FrmComm do
    begin
        Comm.Disconnect;
        Comm.ComPort := FrmComm.ComboBox_Comport.ItemIndex + 1;
        Comm.Connect;

        Comm.SendString(Str + CRLF);
        DelayEx(20, False);
        Comm.Disconnect;
    end;
    Result := True;
    }
end;


// 현재 IO 상태를 파일로 저장한다. 디버깅용.
function TFrmHWMain.Save_IOStatus(sFileName : String) : Boolean;
begin
    //
end;

procedure TFrmHWMain.AddLog(Param: String);
begin
   // if not cbLogSave.Checked then exit;
    
    if MemoLog.Lines.Count > 1000 then
        MemoLog.Lines.Delete(0);

    MemoLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + ' ' + Param);
    WriteDebugStr(Param);
end;

procedure TFrmHWMain.BtnClearLogClick(Sender: TObject);
begin
    MemoLog.Lines.Clear;
end;

procedure TFrmHWMain.Cb_AutoConnectClick(Sender: TObject);
begin
    TimerConnect.Enabled := Cb_AutoConnect.Checked;
end;

end.



