unit FormItac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ZINICtrl, StdCtrls, OleServer, ComCtrls, ewMII;

type
  TSnrInfoData = record
      partNr      : String;
      bomVersion  : APILONG;
      bomIndex    : String;
      partDesc    : String;
      workOrder   : String;
      quantity    : APILONG;
      state          : String;
      cadPartNr      : String;
      customerName   : String;
      customerPartNr : String;
      attribut1      : String;
  end;
  TSerialData= record
      serialNumber    : String;
      serialNumberPos : String;
  end;

  TFrmItac = class(TForm)
    Panel1: TPanel;
    iTacINI: ZIniData;
    BtnApiInit: TSpeedButton;
    MemoLog: TMemo;
    GroupBox1: TGroupBox;
    Edit_StationNo: ZIniEdit;
    Label1: TLabel;
    BtnLogin: TSpeedButton;
    BtnLogOut: TSpeedButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    BtnCheckSerial: TSpeedButton;
    Edit_SerialNo: ZIniEdit;
    StatusBar: TStatusBar;
    Label2: TLabel;
    Edit_SessionID: ZIniEdit;
    BtnGetSnrInofData: TSpeedButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    BtnGetAttribute: TSpeedButton;
    BtnAppendAttribute: TSpeedButton;
    BtnremoveAttribute: TSpeedButton;
    Label6: TLabel;
    Edit_AttributeValue: ZIniEdit;
    BtnuploadStateAndResultData: TSpeedButton;
    Label5: TLabel;
    Edit_TestName: ZIniEdit;
    Edit_TestValue: ZIniEdit;
    Label7: TLabel;
    Rb_Pass: TRadioButton;
    Rb_Fail: TRadioButton;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    BtnapiShutdown: TSpeedButton;
    Button1: TButton;
    Combo_AttributeCode: TComboBox;
    RdoUpLoad: ZIniRadioGroup;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Cb_AttributeCodeForWorkOrder: TComboBox;
    SpeedButton4: TSpeedButton;
    BtnUploadState: TSpeedButton;
    BtnGetStation: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox6: TGroupBox;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    procedure BtnApiInitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
    procedure BtnCheckSerialClick(Sender: TObject);
    procedure BtnAppendAttributeClick(Sender: TObject);
    procedure BtnremoveAttributeClick(Sender: TObject);
    procedure BtnuploadStateAndResultDataClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnGetAttributeClick(Sender: TObject);
    procedure BtnapiShutdownClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnGetSnrInofDataClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtnUploadStateClick(Sender: TObject);
    procedure BtnGetStationClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    //procedure Edit_StationNoChange(Sender: TObject);
  private
    { Private declarations }
    SessionID  : Longint;

    procedure AddLog(const Param: String);
    function LoadingStation(sSerial : String) : Boolean;
  public
    { Public declarations }
    bApiInitialize : Boolean;

    LastMessage : String;
    function Login : Boolean;

    function  UploadState(sSerial : String;  bResult : Boolean) : Integer;
    function  UploadResultDataAndRecipe(sSerial, sproduktNo, sproduktRev : String; sDataList : TStringList; bResult : Boolean) : Integer;
    function  UploadStateAndResultData(sSerial : String; sDataList : TStringList; bResult : Boolean) : Integer;

    function  GetAttribute(sSerial, sAttributeCode : String; var sAttributeValue : String ) : Integer;
    function  GetAttributeForWorkOrder(sWorkOrder, sAttributeCode : String; var sAttributeValue : String ) : Integer;

    function  AppendAttribute(sSerial, sAttributeCode : String; sAttributeValue : String) : Integer;
    function  RemoveAttribute(sSerial, sAttributeCode : String) : Integer;
    function  CheckSNState(sSerial : String; var LoopCount : Integer) : Integer;

    function  SnrUploadInfo(sSerial : String): Integer;
    function  CheckVerifyMerge(sSerial : String) : Boolean;
    function  GetSerialInfoData(sSerial : String; var SnrInfoData : TSnrInfoData ) : APILONG;
    function  SetAssignSerialNumber(sSerial : String): Boolean;

    function  GetOCRData(sSerial : String; var SensorSN, SensorLot : String) : Boolean;
    function  UpdateTestResult(sSerial : String; sDataList : TStringList; bResult : Boolean) : Integer;
    function  UploadFailureSlip(sSerial: String; sFailList : TStringList): Integer;

    function  GetPartNr(): String;

    function QueryRecipeData(sStationNo, sworkOrder, sName : String; var sValue : String ) : APILONG;
    function GetNextSerialNumberForWorkOrder(sWorkOrder : String; var sSerialNo : String) : Integer;

    // HOT TESTER
    function GetHMFforSerial(sSerial: String): String;
    function AppendSerialForWorkOrder(sSerial : String) : Boolean;

    // Housing Assembly, fresh EEPROM Station
    function SwitchSerial(sSerial_old, sSerial_new : String): Integer;
//    function fCheckSnrStateSnrRef(): Integer;
    
  end;

var
  FrmItac: TFrmItac;

implementation

uses GenUtils, Math, FormMain;

{$R *.dfm}

procedure TFrmItac.BtnApiInitClick(Sender: TObject);
var Ret : APILONG;
    errorString : APISTRING;
begin
    if bApiInitialize then exit;

    try
        Ret := apiInit(nil, errorString);
        AddLog('apiIni : ' + IntToStr(Ret) + ' : ' + StrPas(errorString));
    finally
        apiFreeBuffers;
    end;

    if (Ret = 0) then begin
        bApiInitialize := True;
    end else begin
        bApiInitialize := False;
        MessageBox('ITAC 연결실패', '연결실패', MB_OK or MB_ICONERROR);
    end;
end;

procedure TFrmItac.BtnapiShutdownClick(Sender: TObject);
var Ret : APILONG;
    errorString : APISTRING;
begin
    if not bApiInitialize then exit;
    bApiInitialize := False;

    try
        Ret := apiShutdown(errorString);
        AddLog('apiShutdown : ' + IntToStr(Ret) + ' : ' + StrPas(errorString));
    finally
        apiFreeBuffers;
    end;
end;


procedure TFrmItac.BtnLoginClick(Sender: TObject);
begin
    Login();
end;


procedure helperScanf(Buff : APISTRING; Value : String);
var i : Integer;
begin
    for i:= 0 to Length(Value)-1 do
        (Buff + i)^ :=  Value[i+1];
    (Buff + i)^ := #0;
end;


function TFrmItac.Login : Boolean;
var Ret : APILONG;
    seccValData : TApiSessionValidationStruct;
    StationNo, MsgStr : String;
    errorString : APISTRING;
begin
    if not bApiInitialize then exit;
    StationNo := Edit_StationNo.Text;
{
    seccValData.user             := PChar(StationNo);
    seccValData.password         := nil;
    seccValData.client           := '01';
    seccValData.systemIdentifier := PChar(StationNo);
    seccValData.isVip     := 0;
    seccValData.isStation := 1;

    SessionID := apiLogin(seccValData, errorString);

    AddLog('apiLogin : SessionID=' + IntToStr(SessionID) + ' ' + StrPas(errorString));
    Edit_SessionID.Text := IntToStr( SessionID );
}

    seccValData.user             := GetMemory(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    seccValData.password         := GetMemory(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    seccValData.client           := GetMemory(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    seccValData.systemIdentifier := GetMemory(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    helperScanf(seccValData.user, StationNo);
    helperScanf(seccValData.password, '');
    helperScanf(seccValData.client,   '01');
    seccValData.isVip     := 0;
    seccValData.isStation := 1;

    helperScanf(seccValData.systemIdentifier, StationNo);

    SessionID := apiLogin(seccValData, errorString);
    AddLog('apiLogin : SessionID=' + IntToStr(SessionID) + ' ' + StrPas(errorString));

    Edit_SessionID.Text := IntToStr( SessionID );

    FreeMem(seccValData.user);
    FreeMem(seccValData.password);
    FreeMem(seccValData.client);
    FreeMem(seccValData.systemIdentifier);

    apiFreeBuffers;
end;

procedure TFrmItac.BtnLogOutClick(Sender: TObject);
var errorString : APISTRING;
begin
    if not bApiInitialize then exit;

    apiLogout(Sessionid, errorString);
    SessionID := -1;
    AddLog('apiLogout : ' + StrPas(errorString));
end;

procedure TFrmItac.FormCreate(Sender: TObject);
var Str : APISTRING;
begin
    iTacINI.LoadData;

    Caption := Caption + ' : ' + GetExeVersion;
    Str := apiGetVersion;
    StatusBar.Panels[0].Text := StrPas(Str);

    SessionID := -1;

    BtnApiInitClick(Sender);
    if bApiInitialize then Login;
end;

procedure TFrmItac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    iTacINI.SaveData;
    //BtnapiShutdownClick(Self);
end;

procedure TFrmItac.AddLog(const Param : String);
begin
    if MemoLog.Lines.Count > 200 then
        MemoLog.Lines.Delete(0);

    MemoLog.Lines.Add(Param);
    //FrmMain.AddLog(0, Param );
end;

procedure TFrmItac.BtnCheckSerialClick(Sender: TObject);
var nLoopCount : Integer;
begin
    CheckSNState(Edit_SerialNo.Text, nLoopCount);
end;


function TFrmItac.GetSerialInfoData(sSerial : String; var SnrInfoData : TSnrInfoData ) : APILONG;
var
    // In
    stationNr    : APISTRING;
    serialnumber : APISTRING;
    serialnumberPos : APISTRING;

    // Out
    partNr      : APISTRING;
    bomVersion  : APILONG;
    bomIndex    : APISTRING;
    partDesc    : APISTRING;
    workOrder   : APISTRING;
    quantity    : APILONG;
    state          : APISTRING;
    cadPartNr      : APISTRING;
    customerName   : APISTRING;
    customerPartNr : APISTRING;
    attribut1      : APISTRING;

    errorString    : APISTRING;
begin
    Result := -9999;
    if not bApiInitialize then exit;

    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumberPos := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        helperScanf(stationNr,       Edit_StationNo.Text);
        helperScanf(serialnumber,    sSerial);
        helperScanf(serialnumberPos, '1');

        Result := getSnrInfoData(sessionId, stationNr, serialnumber, serialnumberPos,
                partNr, bomVersion, bomIndex, partDesc, workOrder, quantity, state, cadPartNr, customerName, customerPartNr, attribut1, errorString);

        LastMessage := Format('getSnrInfoData : (%d) %s', [ Result, StrPas(errorString)]);
        AddLog(LastMessage);

        if Result = 0 then
        begin
            AddLog(Format('partNr=%s, bomVersion=%d, WorkOrder=%s', [ StrPas(partNr), bomVersion, StrPas(workOrder)]));

            SnrInfoData.partNr         := partNr;
            SnrInfoData.bomVersion     := bomVersion;
            SnrInfoData.bomIndex       := bomIndex;
            SnrInfoData.partDesc       := partDesc;
            SnrInfoData.workOrder      := workOrder;
            SnrInfoData.quantity       := quantity;
            SnrInfoData.state          := state;
            SnrInfoData.cadPartNr      := cadPartNr;
            SnrInfoData.customerName   := customerName;
            SnrInfoData.customerPartNr := customerPartNr;
            SnrInfoData.attribut1      := attribut1;
        end;
    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(serialnumberPos);
        apiFreeBuffers;
    end;
end;

function TFrmItac.GetAttribute(sSerial, sAttributeCode : String; var sAttributeValue : String ) : Integer;
var
    // IN
    stationNr : APISTRING;
    serialNumber : APISTRING;
    attributeCode : APISTRING;

    // OUT
    snrAttributeInfosSize : APILONG;
    snrAttributeInfos : ^TSnrAttributeInfo;
    errorString : APISTRING;

    Str : String;
begin
    Result := -9999;
    sAttributeValue := '';

    if not bApiInitialize then exit;

    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeCode   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(stationNr,      Edit_StationNo.Text);
        helperScanf(serialnumber,   sSerial);
        helperScanf(attributeCode,  sAttributeCode);

        Result := getAttributesForSerialNumber(
            sessionId,
            stationNr,
            serialNumber,
            attributeCode,
            // OUT
            snrAttributeInfosSize,
            @snrAttributeInfos,
            errorString
        );

        AddLog(Format('getAttributesForSerialNumber : (%d) %s', [ Result, StrPas(errorString)]));
        if (Result = 0) and (snrAttributeInfosSize > 0) then
        begin
            // sAttributeValue := StrPas( snrAttributeInfos^.attributeValue);
            Str := Format('AttributeInfo : %s=%s',
                [ StrPas(snrAttributeInfos^.attributeCode), StrPas(snrAttributeInfos^.attributeValue)]);
            AddLog( Str );

            sAttributeValue := StrPas(snrAttributeInfos^.attributeValue);
        end else
            sAttributeValue := '';
    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(attributeCode);
        apiFreeBuffers;
    end;
end;

function TFrmItac.GetAttributeForWorkOrder(sWorkOrder, sAttributeCode : String; var sAttributeValue : String ) : Integer;
var
    // IN
    stationNr, chargeExt, serialNumber,  partNo, attributeCode, attributeType : APISTRING;
    chargeAttributeInfosSize : APILONG;

    // OUT
    chargeAttributeInfos : ^TChargeAttributeInfo;
    errorString : APISTRING;

    Str : String;
begin
    sAttributeValue := '';

    if not bApiInitialize then exit;

    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    chargeExt       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    partNo          := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeCode   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeType   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        helperScanf(stationNr,    Edit_StationNo.Text);
        helperScanf(chargeExt,    sWorkOrder);
        helperScanf(serialNumber,  '-1');
        helperScanf(partNo,        '-1');
        helperScanf(attributeCode, sAttributeCode);
        helperScanf(attributeType, '-1');

        Result := getAttributesForWorkorder(
            // IN
            sessionId,
            stationNr,
            chargeExt,
            serialNumber,
            partNo,
            attributeCode,
            attributeType,

            // OUT
            chargeAttributeInfosSize,
            @chargeAttributeInfos,
            errorString
        );

        AddLog(Format('getAttributesForWorkorder : (%d) %s', [ Result, StrPas(errorString)]));
        if (Result = 0) and (chargeAttributeInfosSize > 0) then
        begin
            sAttributeValue := StrPas( chargeAttributeInfos^.attributeValue);
            Str := Format('AttributeInfo : %s=%s',
                [ StrPas(chargeAttributeInfos^.attributeCode), StrPas(chargeAttributeInfos^.attributeValue)]);
            AddLog( Str );

            sAttributeValue := StrPas(chargeAttributeInfos^.attributeValue);

        end else
            sAttributeValue := '';
    finally
        FreeMem(stationNr);
        FreeMem(chargeExt);
        FreeMem(serialNumber);
        FreeMem(partNo);
        FreeMem(attributeCode);
        FreeMem(attributeType);
      
        apiFreeBuffers;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmItac.BtnAppendAttributeClick(Sender: TObject);
begin
    AppendAttribute(Edit_SerialNo.Text, Combo_AttributeCode.Text, Edit_AttributeValue.Text);
end;

//------------------------------------------------------------------------------
procedure TFrmItac.BtnremoveAttributeClick(Sender: TObject);
begin
    RemoveAttribute(Edit_SerialNo.Text, Combo_AttributeCode.Text);
end;

//------------------------------------------------------------------------------
procedure TFrmItac.BtnuploadStateAndResultDataClick(Sender: TObject);
var sStrList : TStringList;
begin
{
    sStrList :=  TStringList.Create;

    if Rb_Pass.Checked then
        UpdateTestState(Edit_SerialNo.Text, True)
    else
        UpdateTestState(Edit_SerialNo.Text, False) ;

    sStrList.Free;
}
end;

function TFrmItac.UploadState(sSerial : String; bResult : Boolean) : Integer;
var i, Ret : APILONG;
    stationNr : APISTRING;
    processLayer : APILONG;
    serialNumber : APISTRING;
    serialNumberPos : APISTRING;
    serialNumberState : APILONG;
    duplicateSerialNumber : APILONG;
    checkActiveWorkOrder : APILONG;
    loopCounter : APILONG;
    errorString : APISTRING;
    sString : String;
begin
    Result := -9999;
    if not bApiInitialize then exit;

    stationNr           := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumber        := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumberPos     := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        helperScanf(stationNr,       Edit_StationNo.Text);
        processLayer                 := 2;
        helperScanf(serialnumber,    sSerial);
        helperScanf(serialnumberPos, '1');

        if bResult then
            serialNumberState        := 0 // 0=PASS / 1=FAIL
        else
            serialNumberState        := 1; // 0=PASS / 1=FAIL

        duplicateSerialNumber       := 0;
        checkActiveWorkOrder        := 0;

        Result := ewMII.uploadState(
            sessionId,
            stationNr,
            processLayer,
            serialNumber,
            serialNumberPos,
            serialNumberState,
            duplicateSerialNumber,
            checkActiveWorkOrder,
            errorString );

        LastMessage := Format('uploadState : (%d) LoopCounter=%d %s', [ Result, loopCounter, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(serialnumberPos);

        apiFreeBuffers;
    end;
end;

procedure TFrmItac.SpeedButton2Click(Sender: TObject);
var sWorkOrder, Str, sName, sValue : String;
    SnrInfoData : TSnrInfoData;
begin
    if GetSerialInfoData(Edit_SerialNo.Text, SnrInfoData) = 0 then
    begin
        QueryRecipeData( Edit_StationNo.Text , SnrInfoData.workOrder, sName, sValue);
    end;
end;


function TFrmItac.QueryRecipeData(sStationNo, sworkOrder, sName : String; var sValue : String ) : APILONG;
var i : Integer;
    // IN
    stationNr, workOrder : APISTRING;

    // OUT
    recipeDataArraySize, recipeDataArraySizeSave : APILONG;
    recipeDataArray, recipeDataArraySave, PtIdx :  PRecipeDataArray;
    errorString : APISTRING;

    sSubName, sSubValue : String;
const ARRAY_SIZE = 1;
begin
    sValue := '';
    Result := -9999;

    if (sworkOrder = '') then exit;

    try
        StationNr := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
        workOrder := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

       // sStationNo := '26030011';

        helperScanf(StationNr,  sStationNo);
        helperScanf(workOrder,  sworkOrder);

        recipeDataArraySize     := ARRAY_SIZE;
        recipeDataArraySizeSave := recipeDataArraySize;

        recipeDataArray := AllocMem(ARRAY_SIZE * sizeof(TRecipeData));
        recipeDataArraySave := recipeDataArray;

        for i:= 0 to recipeDataArraySizeSave -1 do begin
            recipeDataArray^.name  := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            recipeDataArray^.value := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

            //sName := 'HMF_File.nom';
            helperScanf(recipeDataArray^.name,  sName);
            helperScanf(recipeDataArray^.value, '');
        end;

        Result := ewMII.queryRecipeData(
                  sessionID,
                  stationNr,
                  workOrder,
                  recipeDataArraySize,
                  @recipeDataArray,
                  errorString);

        for i:=0 to recipeDataArraySize-1 do begin
            PtIdx := PRecipeDataArray(PChar(recipeDataArray) + i * Sizeof(TRecipeData));
            LastMessage := Format('queryRecipeData : (%d) Workorder=%s (%d), %s=%s %s',
                [i, sworkOrder, Result,  StrPas(PtIdx^.name),  StrPas(PtIdx^.value),  StrPas(errorString)]);
            AddLog(LastMessage);
        end;


        if Result = 0 then begin
            sValue := StrPas(recipeDataArray^.value);
        end;

        LastMessage := Format('QueryRecipeData : (%d) %s', [ Result, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(workOrder);

        for i:= 0 to recipeDataArraySizeSave-1 do
        begin
            FreeMem(recipeDataArraySave^.name);
            FreeMem(recipeDataArraySave^.value);
        end;
        FreeMem(recipeDataArraySave);

        apiFreeBuffers;
    end;
end;

procedure TFrmItac.BtnGetAttributeClick(Sender: TObject);
var sSerial, sAttribCode, sAttribData : String;
begin
    sSerial      := Edit_SerialNo.Text;
    sAttribCode  := Combo_AttributeCode.Text;

    GetAttribute(sSerial, sAttribCode, sAttribData);
    Edit_AttributeValue.Text :=  sAttribData;
end;


//------------------------------------------------------------------------------
// YAW CALIBRAION을 위해 LOT / SN를 가져온다.
function TFrmItac.GetOCRData(sSerial : String; var SensorSN, SensorLot : String) : Boolean;
var sAttributeCode, sAttributeValue : String;
begin
    Result := True;
    if (SessionID < 0) then Login;
    Result := GetAttribute(sSerial, 'YAW_LOT', SensorLot ) = 0;
    Result := GetAttribute(sSerial, 'YAW_SNR',  SensorSN  ) = 0;
end;

//------------------------------------------------------------------------------
// YAW CALIBRAION을 위해 LOT / SN를 가져온다.
function TFrmItac.CheckSNState(sSerial : String; var LoopCount : Integer) : Integer;
var Str, sAttributeCode, sAttributeValue : String;
    // In
    StationNr, serialnumber, serialNumberPos : APISTRING;
    ProcessLayer : Integer;
    // Out
    errorString : APISTRING;
    //LpCount : Integer;
begin
    Result := -1;
    if (sSerial = '') then exit;

    StationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    ProcessLayer    := 2;
    serialnumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberPos := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        helperScanf(StationNr,       Edit_StationNo.Text);
        helperScanf(SerialNumber,    sSerial);
        helperScanf(SerialNumberPos, '-1');

        Result := checkSerialNumberState(
            SessionID,
            stationNr,
            ProcessLayer,
            SerialNumber,
            SerialNumberPos, LoopCount, errorString);
        LastMessage := Format('checkSerialNumberState : %s (%d), LoopCount=%d %s', [ sSerial,  Result, LoopCount, StrPas(errorString)]);
        AddLog(LastMessage);

    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(serialNumberPos);
        apiFreeBuffers;
    end;
end;



procedure TFrmItac.FormDestroy(Sender: TObject);
begin
    BtnapiShutdownClick(Sender);
end;

procedure TFrmItac.Button1Click(Sender: TObject);
var SensorLot, SensorSN  : String;
begin
    GetOCRData(Edit_SerialNo.Text, SensorLot, SensorSN);
    AddLog(Format('LOT = %s, SN = %s', [SensorLot, SensorSN]));
end;
//------------------------------------------------------------------------------
function TFrmItac.AppendAttribute(sSerial, sAttributeCode, sAttributeValue: String): Integer;
var Ret : APILONG;
    stationNr      : APISTRING;
    serialNumber   : APISTRING;
    attributeCode  : APISTRING;
    attributeValue : APISTRING;
    errorString    : APISTRING;
begin
    Result := -9999;
    if not bApiInitialize then exit;

    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeCode   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeValue  := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(stationNr,      Edit_StationNo.Text);
        helperScanf(serialNumber,   sSerial);
        helperScanf(attributeCode,  sAttributeCode);
        helperScanf(attributeValue, sAttributeValue);

        Result := appendAttributeToSerialNumber(
            sessionId,
            stationNr,
            serialNumber,
            attributeCode,
            attributeValue,
            errorString
        );
        LastMessage := Format('appendAttributeToSerialNumber : %s %s=%s (%d) %s', [ sSerial, sAttributeCode, sAttributeValue, Result, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(attributeCode);
        FreeMem(attributeValue);
        apiFreeBuffers;
    end;
end;

function TFrmItac.RemoveAttribute(sSerial, sAttributeCode: String): Integer;
var
    stationNr     : APISTRING;
    serialNumber  : APISTRING;
    attributeCode : APISTRING;
    errorString   : APISTRING;
begin
    Result := -9999;
    if not bApiInitialize then exit;

    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    attributeCode   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(stationNr,     Edit_StationNo.Text);
        helperScanf(serialNumber,  sSerial);
        helperScanf(attributeCode, sAttributeCode);

        Result := removeAttributeFromSerialNumber(
            sessionId,
            stationNr,
            serialNumber,
            attributeCode,
            errorString
        );
        LastMessage := Format('removeAttributeFromSerialNumber : %s %s (%d) %s', [ sSerial, sAttributeCode, Result, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialnumber);
        FreeMem(attributeCode);
        apiFreeBuffers;
    end;

end;

function TFrmItac.UploadResultDataAndRecipe(sSerial, sproduktNo, sproduktRev: String; sDataList : TStringList;
  bResult: Boolean): Integer;
var Ret : APILONG;
    // IN
    stationNr : APISTRING;
    processLayer : APILONG;
    serialNumberRef : APISTRING;
    serialNumberRefPos : APISTRING;
    serialNumberState : APILONG;
    produktNo : APISTRING;
    produktRev : APISTRING;
    bookDate : APILONG;
    cycleTime : APIFLOAT;
    resultDataExtArraySize : APILONG;
    errorString : APISTRING;
    i, nIdx : Integer;
    resultData : array of TResultDataExtendedStruct;

    sIdx, sName, sValue, sMin, sMax, sUnit, sFail : String;
    sString : String;
begin
    Result := -9999;
    //if (not bApiInitialize) or ( sDataList.Count < 1 ) then exit;

    stationNr                := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // := PChar(Edit_StationNo.Text);
    serialNumberRef          := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberRefPos       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // '1';
    produktNo                := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // '0';
    produktRev               := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // '0';
    try
        processLayer         := 2;
        if bResult then serialNumberState := 0 // 0=PASS / 1=FAIL
                   else serialNumberState := 1; // 0=PASS / 1=FAIL

        helperScanf(stationNr,          Edit_StationNo.Text);
        helperScanf(serialNumberRef,    sSerial);
        helperScanf(serialNumberRefPos, '1');
        helperScanf(produktNo,          sproduktNo);
        helperScanf(produktRev,         sproduktRev);
        bookDate                 := -1;
        cycleTime                := 0;
        resultDataExtArraySize   := sDataList.Count;

        SetLength( resultData, sDataList.Count );

         // sDATA = idx:name:value,min,max,unit
        for nIdx := 0 to sDataList.Count -1 do
        begin
            sString := sDataList[nIdx];
            sIdx   := GetToken(sString, ':');
            sName  := GetToken(sString, ':');
            sValue := GetToken(sString, ':');
            sMin   := GetToken(sString, ':');
            sMax   := GetToken(sString, ':');
            sUnit  := GetToken(sString, ':');
            sFail  := GetToken(sString, ':');

            resultData[nIdx].nr       := StrToFloatDef(sIdx, 0);
            resultData[nIdx].name     := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].value    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].min      := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].max      := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].nom      := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].toleranz := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx]._unit    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            resultData[nIdx].failCode := StrToIntDef(sFail, 0);
            resultData[nIdx].messtyp  := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

            helperScanf(resultData[nIdx].name,    sName);
            helperScanf(resultData[nIdx].value,   sValue);
            helperScanf(resultData[nIdx].min,     sMin);
            helperScanf(resultData[nIdx].max,     sMax);
            helperScanf(resultData[nIdx].nom,     '0');
            helperScanf(resultData[nIdx].toleranz,'0');
            helperScanf(resultData[nIdx]._unit,   sUnit);

            if IsFloat(sMin) and IsFloat(sMax) or IsFloat(sValue) then
                helperScanf(resultData[nIdx].messtyp, 'DEC')
            else
                helperScanf(resultData[nIdx].messtyp, 'TXT');
        end;

        Ret := ewmii.uploadResultDataAndRecipe(
            sessionId,
            stationNr,
            processLayer,
            serialNumberRef,
            serialNumberRefPos,
            serialNumberState,
            produktNo,
            produktRev,
            bookDate,
            cycleTime,
            resultDataExtArraySize,
            @resultData[0],
            errorString
        );

        LastMessage := Format('uploadResultDataAndRecipe : (%d) %s', [ Ret, StrPas(errorString)]);
        AddLog(LastMessage);
        Result := Ret;
    finally
        FreeMem(stationNr);
        FreeMem(serialNumberRef);
        FreeMem(serialNumberRefPos);
        FreeMem(produktNo);
        FreeMem(produktRev);

        for nIdx := 0 to sDataList.Count -1 do
        begin
            FreeMem(resultData[nIdx].name     );
            FreeMem(resultData[nIdx].value    );
            FreeMem(resultData[nIdx].min      );
            FreeMem(resultData[nIdx].max      );
            FreeMem(resultData[nIdx].nom      );
            FreeMem(resultData[nIdx].toleranz );
            FreeMem(resultData[nIdx]._unit    );
            FreeMem(resultData[nIdx].messtyp  );
        end;
        SetLength( resultData, 0 );
        apiFreeBuffers;
    end;
end;


function TFrmItac.UploadStateAndResultData(sSerial : String; sDataList : TStringList; bResult : Boolean) : Integer;
var i : Integer;
    // IN
    stationNr : APISTRING;
    processLayer : APILONG;
    serialNumber : APISTRING;
    serialNumberPos : APISTRING;
    serialNumberState : APILONG;
    duplicateSerialNumber : APILONG;
    resultDataArraySize : APILONG;
    resultData, resultDataArray : PResultDataArray;
    cycleTime : APIFLOAT;

    // OUT
    loopCounter : APILONG;
    errorString : APISTRING;

    sString, sIdx, sName, sValue, sMin, sMax, sUnit, sResult : String;
begin
    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberPos := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    helperScanf(stationNr,  Edit_StationNo.Text);
    processLayer            := 2;
    helperScanf(serialNumber,  sSerial);
    helperScanf(serialNumberPos,  '1');
    serialNumberState       := IfThen(bResult, 0, 1);
    duplicateSerialNumber   := 0;
    resultDataArraySize     := sDataList.Count;
    cycleTime               := 0;

    resultDataArray := AllocMem(resultDataArraySize * sizeof(TResultData));

    for i := 0 to sDataList.Count-1 do
    begin
        sString := sDataList[i];
        sIdx    := GetToken(sString, ':');
        sName   := GetToken(sString, ':');
        sValue  := GetToken(sString, ':');
        sMin    := GetToken(sString, ':');
        sMax    := GetToken(sString, ':');
        sUnit   := GetToken(sString, ':');     // 단위
        sResult := GetToken(sString, ':');     // FAIL 1  PASS 0


        resultData :=  PResultDataArray(PChar(resultDataArray) + i * sizeof(TResultData));
        resultData^.name     := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
        resultData^.value    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

        helperScanf(resultData^.name,   sName);
        helperScanf(resultData^.value,  sValue);
        resultData^.failCode := ifThen((sResult = 'OK'), 0, 1);
    end;

    try
        Result := ewMII.uploadStateAndResultData(
            // IN
            sessionId,
            stationNr,
            processLayer,
            serialNumber,
            serialNumberPos,
            serialNumberState,
            duplicateSerialNumber,
            resultDataArraySize,
            resultDataArray,
            cycleTime,

            // OUT
            loopCounter,
            errorString);

            LastMessage := Format('uploadStateAndResultData : LoopCount=%d (%d) %s ', [ loopCounter, Result, StrPas(errorString)]);
            AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialNumber);
        FreeMem(serialNumberPos);

        for i := 0 to sDataList.Count-1 do
        begin
            resultData :=  PResultDataArray(PChar(resultDataArray) + i * sizeof(TResultData));
            FreeMem(resultData^.name);
            FreeMem(resultData^.value);
        end;
        apiFreeBuffers;
    end;
end;


function TFrmItac.UpdateTestResult(sSerial: String; sDataList: TStringList;
  bResult: Boolean): Integer;
var
    SnrInfoData : TSnrInfoData;
begin
    if GetSerialInfoData(sSerial, SnrInfoData) = 0 then
        Result := UploadResultDataAndRecipe(sSerial, SnrInfoData.partNr, IntToStr(SnrInfoData.bomVersion), sDataList, bResult)
    else
        Result := -9999;
end;

procedure TFrmItac.BtnGetSnrInofDataClick(Sender: TObject);
var
    SnrInfoData : TSnrInfoData;
begin
    GetSerialInfoData(Edit_SerialNo.Text, SnrInfoData);
end;

function TFrmItac.SnrUploadInfo(sSerial: String): Integer;
var Str, sAttributeCode, sAttributeValue : String;
    // In
    StationNr, serialnumber, serialNumberPos : APISTRING;
    ProcessLayer    : integer;
    checkProcessstep: integer;
    // Out
    PartNr          :  APISTRING;
    WorkOrder       :  APISTRING;
    UploadStationNr :  APISTRING;
    ProcessStep     :  integer;
    LpCount         :  integer;
    state           :  integer;
    bookDate        :  integer;
    oldSnrNo        :  APISTRING;
    errorString     :  APISTRING;

    Ret : Integer;
begin
    if sSerial = '' then
        Exit;

    StationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    ProcessLayer    := 2;
    serialnumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberPos := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    checkProcessstep:= 1;

    try
        helperScanf(StationNr,       Edit_StationNo.Text);
        helperScanf(SerialNumber,    sSerial);
        helperScanf(SerialNumberPos, '-1');

        Ret := getSnrUploadInfo(
            //in
            SessionID,
            stationNr,
            ProcessLayer,
            SerialNumber,
            SerialNumberPos,
            checkProcessstep,
            //out
            PartNr,
            WorkOrder ,
            UploadStationNr,
            ProcessStep,
            LpCount,
            state,
            bookDate ,
            oldSnrNo,
            errorString );

        LastMessage := Format('getSnrUploadInfo : %s (%d), LoopCount=%d %s', [ sSerial,  Ret, LpCount, StrPas(errorString)]);
        AddLog(LastMessage);
        Result := Ret;
    finally
        FreeMem(StationNr);
        FreeMem(SerialNumber);
        FreeMem(SerialNumberPos);

        apiFreeBuffers;
    end;
end;

procedure TFrmItac.SpeedButton3Click(Sender: TObject);
var nResult : Integer;
begin
    nResult := SnrUploadInfo(Edit_SerialNo.Text);
end;

function TFrmItac.CheckVerifyMerge(sSerial: String): Boolean;
var StationNr, serialnumberSlave, errorString: APISTRING;
    Ret : Integer;
begin
    Result := False;

    if not bApiInitialize then exit;

    stationNr         := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumberSlave := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(stationNr,     Edit_StationNo.Text);
        helperScanf(serialnumberSlave,  sSerial);

        Ret := verifyMerge(
            sessionId,
            stationNr,
            serialnumberSlave,
            errorString
        );

        AddLog(Format('verifyMerge : %s (%d) %s', [sSerial, Ret, errorString]));
        Result := (Ret = 0);
    finally
        FreeMem(stationNr);
        FreeMem(serialnumberSlave);
        apiFreeBuffers;
    end;

end;

function TFrmItac.SetAssignSerialNumber(sSerial: String): Boolean;
var stationNr: APISTRING;
    processLayer: Integer;
    serialNumberRef: APISTRING;
    serialNumberRefPos: APISTRING;
    serialNumberArraySize: integer;
    DataSerialNumber : Array of TSerialNumberData;
    serialNumberSlave :APISTRING;
    doUploadState : integer;
    serialNumberState: integer;

    errorString : APISTRING;
    Ret : Integer;

    SerialData : TSerialData;
    nCount, i : Integer;
begin
    Result := False;
    if sSerial = '' then
        Exit;
    if not bApiInitialize then exit;
    nCount := 1;

    StationNr            := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    ProcessLayer         := 2;
    serialnumberRef      := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberRefPos   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberArraySize := 1;


    serialNumberSlave    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    doUploadState        := 0;
    serialNumberState    := 0;

    try
        helperScanf(StationNr,            Edit_StationNo.Text);
        helperScanf(serialnumberRef,      '-1');
        helperScanf(serialnumberRefPos,   '-1');
        helperScanf(serialNumberSlave,   sSerial);

        SetLength( DataSerialNumber, nCount );

        for i:= 0 to nCount -1 do
        begin
            DataSerialNumber[i].serialNumber     := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            DataSerialNumber[i].serialNumberPos  := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            helperScanf(DataSerialNumber[i].serialNumber, sSerial);
            helperScanf(DataSerialNumber[i].serialNumberPos, '1');
        end;


        Ret := assignSerialNumberMergeAndUploadState(
            sessionId,
            stationNr,
            processLayer,
            serialNumberRef,
            serialNumberRefPos,
            serialNumberArraySize,
            @DataSerialNumber[0],
            serialNumberSlave,
            doUploadState,
            serialNumberState,
            errorString);

        LastMessage := Format('assignSerialNumberMergeAndUploadState : %s (%d) %s', [ sSerial, Ret, errorString]);
        AddLog(LastMessage);
        Result := (Ret = 0);
    finally
        FreeMem(StationNr);
        FreeMem(serialnumberRef);
        FreeMem(serialNumberRefPos);
        FreeMem(serialNumberSlave);
        for i:= 0 to nCount -1 do
        begin
            FreeMem(DataSerialNumber[i].serialNumber);
            FreeMem(DataSerialNumber[i].serialNumberPos);
        end;

        apiFreeBuffers;
    end;
end;

// NG 발생시 이용
function TFrmItac.UploadFailureSlip(sSerial: String; sFailList: TStringList): Integer;
var Ret : APILONG;
    // IN
    stationNr : APISTRING;
    processLayer : APILONG;
    serialNumberRef : APISTRING;
    serialNumberRefPos : APISTRING;
    serialNumberState : APILONG;
    partNr : APISTRING;
    state: APILONG;
    bookDate : APILONG;
    failureslipSize : APILONG;
    Afailslip, slipIdx : PFailureslipArray;

    checkActiveWorkorder: APILONG;
    errorString : APISTRING;

    i, nIdx : Integer;
    RdStr : String;
begin
    Result := -9999;
    if not bApiInitialize then exit;

    // cmpeName;TestStepName;testStepDescription

    stationNr                := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // := PChar(Edit_StationNo.Text);
    serialNumberRef          := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberRefPos       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR)); // '1';
    partNr                   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        processLayer         := 2;
        helperScanf(stationNr,          Edit_StationNo.Text);
        helperScanf(serialNumberRef,    sSerial);
        helperScanf(serialNumberRefPos, '-1');
        helperScanf(partNr, GetPartNr);

        state                    := -1;
        bookDate                 := -1;
        failureslipSize          := sFailList.Count;
        checkActiveWorkorder     := 0;

        Afailslip := AllocMem( failureslipSize * sizeof(TFailureslip));

        for i := 0 to failureslipSize-1 do
        begin
            RdStr :=  sFailList[i];
            slipIdx := PFailureslipArray(PChar(Afailslip) + i * sizeof(TFailureslip));

            slipIdx^.compName            := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            slipIdx^.testStepName        := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
            slipIdx^.testStepDescription := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

            helperScanf(slipIdx^.compName,            GetToken(RdStr, ';'));
            helperScanf(slipIdx^.testStepName,        GetToken(RdStr, ';'));
            helperScanf(slipIdx^.testStepDescription, GetToken(RdStr, ';'));
        end;

        Result := ewMII.uploadFailureslip(
            sessionId,
            stationNr,
            processLayer,
            serialNumberRef,
            serialNumberRefPos,
            partNr,
            state,
            bookDate,
            failureslipSize,
            Afailslip,
            checkActiveWorkorder,
            errorString
        );

        LastMessage := Format('uploadFailureslip : (%d) %s', [ Ret, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialNumberRef);
        FreeMem(serialNumberRefPos);
        FreeMem(partNr);

        for i:= 0 to failureslipSize-1 do
        begin
            slipIdx := PFailureslipArray(PChar(Afailslip) + i * sizeof(TFailureslip));

            FreeMem(slipIdx^.compName);
            FreeMem(slipIdx^.testStepName);
            FreeMem(slipIdx^.testStepDescription);
        end;
        FreeMem(Afailslip);

        apiFreeBuffers;
    end;

end;

function TFrmItac.GetPartNr: String;
var stationNr : APISTRING;
    sPartNr : APISTRING;
    Ret : Integer;
    bomVersion :  APILONG;
    bomIndex : APISTRING;
    partDesc: APISTRING;
    workOrder :APISTRING;
    quantity : APILONG;
    state : APISTRING;
    cadPartNr : APISTRING;
    processLayer: APILONG;
    customerName : APISTRING;
    customerPartNr : APISTRING;
    attribut1 : APISTRING;
    errorString : APISTRING;

begin
{function getStationSetup(
        sessionId :APILONG ;
        stationNr : APISTRING ;
        var partNr : APISTRING ;
        var bomVersion:  APILONG;
        var  bomIndex : APISTRING;
        var partDesc: APISTRING;
        var  workOrder :APISTRING;
        var quantity : APILONG;
        var  state : APISTRING;
        var cadPartNr : APISTRING;
        var  processLayer: APILONG;
        var customerName : APISTRING;
        var customerPartNr : APISTRING;
        var attribut1 : APISTRING;
        var  errorString : APISTRING
        ): APILONG; cdecl;

}
    stationNr  := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(StationNr,  Edit_StationNo.Text);
        Ret := getStationSetup(
            sessionId,
            stationNr,
            sPartNr,
            bomVersion,
            bomIndex,
            partDesc,
            workOrder,
            quantity,
            state,
            cadPartNr,
            processLayer,
            customerName,
            customerPartNr,
            attribut1,
            errorString);

        LastMessage := Format('getStationSetup : %s (%d) %s', [ sPartNr, Ret, errorString]);
        AddLog(LastMessage);

        Result := sPartNr;
    finally
        FreeMem(StationNr);
        apiFreeBuffers;
    end;
end;


//------------------------------------------------------------------------------
// MGH60 LINE의 Loading Station 공정.
//------------------------------------------------------------------------------
function TFrmItac.LoadingStation(sSerial : String) : Boolean;
var stationNr : APISTRING;
    sPartNr : APISTRING;

    Ret : Integer;
{
    sessionId : APILONG;
    processLayer :APILONG;
    serialnumber: APISTRING;
    serialnumberPos :APISTRING;
    checkProcessStep :APILONG;
    var partNr:APISTRING;
    var workOrder: APISTRING;
    var uploadStationNr : APISTRING;
    var processStep: APILONG;
    var loopCounter : APILONG;
    var state: APILONG;
    var bookDate : APILONG;
    var oldSerialNumber: APISTRING;
    var errorString: APISTRING);
}
begin    {
    stationNr       := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumber    := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialnumberPos := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(StationNr,  Edit_StationNo.Text);

        Ret := getSnrUploadInfo(
            sessionId,
            stationNr,
            processLayer,
            serialnumber,
            serialnumberPos,
            checkProcessStep,

            var partNr:APISTRING;
            var workOrder: APISTRING;
            var uploadStationNr : APISTRING;
            var processStep: APILONG;
            var loopCounter : APILONG;
            var state: APILONG;
            var bookDate : APILONG;
            var oldSerialNumber: APISTRING;
            var errorString: APISTRING);


    finally
        FreeMem(StationNr);
        FreeMem(serialnumber);
        FreeMem(serialnumberPos);

        apiFreeBuffers;
    end;  }
end;

function TFrmItac.GetNextSerialNumberForWorkOrder(sWorkOrder : String; var sSerialNo : String) : Integer;
var i : Integer;
    stationNr : APISTRING;
    workOrder : APISTRING;

    serialNumberArraySize : APILONG;
    serialNumberArray, ArrayIdx : PSerialNumberArray;
    errorString : APISTRING;
begin
    stationNr   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    workOrder   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    try
        helperScanf(StationNr,  Edit_StationNo.Text);
        helperScanf(workOrder,  sWorkOrder);
        serialNumberArraySize := 1;
        
        Result := ewMII.getNextSerialNumberForWorkOrder(
                sessionId,
                stationNr,
                workOrder,
                serialNumberArraySize,
                @serialNumberArray,
                errorString);

        LastMessage := Format('getNextSerialNumberForWorkOrder : (%d) %s', [ Result, errorString]);
        AddLog(LastMessage);

        if (Result = 0) then
        begin
            for i:= 0 to serialNumberArraySize-1 do begin
                // ArrayIdx := PChar(serialNumberArray) + (i * Sizeof(TSerialNumberData));
                ArrayIdx := serialNumberArray;
                AddLog(Format('(%d), SerialNo=%s, serialNumberPos=%s',
                    [i+1, ArrayIdx^.serialNumber, ArrayIdx^.serialNumberPos]));

                sSerialNo := StrPas(ArrayIdx^.serialNumber);
            end;
        end;
    finally
        FreeMem(stationNr);
        FreeMem(workOrder);

        apiFreeBuffers;
    end;
end;



procedure TFrmItac.SpeedButton5Click(Sender: TObject);
begin
    CheckVerifyMerge(Edit_SerialNo.Text);
end;

procedure TFrmItac.SpeedButton6Click(Sender: TObject);
begin
    SetAssignSerialNumber(Edit_SerialNo.Text);
end;

procedure TFrmItac.SpeedButton4Click(Sender: TObject);
var sWorkOrder, sAttributeCode, sAttributeValue : String;
    SnrInfoData : TSnrInfoData;
begin
    if GetSerialInfoData(Edit_SerialNo.Text, SnrInfoData) = 0 then
    begin
        sAttributeCode := Cb_AttributeCodeForWorkOrder.Text;
        GetAttributeForWorkOrder(SnrInfoData.workOrder, sAttributeCode, sAttributeValue);
    end;
end;

procedure TFrmItac.BtnUploadStateClick(Sender: TObject);
begin
    UploadState(Edit_SerialNo.Text, Rb_Pass.Checked);
end;

procedure TFrmItac.BtnGetStationClick(Sender: TObject);
begin
    GetPartNr;
end;

procedure TFrmItac.SpeedButton1Click(Sender: TObject);
var sWorkOrder, sSerialNo : String;
    SnrInfoData : TSnrInfoData;
begin
    if GetSerialInfoData(Edit_SerialNo.Text, SnrInfoData) = 0 then
    begin
        GetNextSerialNumberForWorkOrder(SnrInfoData.workOrder, sSerialNo);
    end;
end;

procedure TFrmItac.SpeedButton7Click(Sender: TObject);
var sMetaFileName : String;
begin
//    sMetaFileName := GetHMFforSerial(Edit_SerialNo.Text);
//    ShowMessage(sMetaFileName);

    AppendSerialForWorkOrder(Edit_SerialNo.Text);
end;

//------------------------------------------------------------------------------
// MGH TESTER용.
//------------------------------------------------------------------------------
function TFrmItac.GetHMFforSerial(sSerial : String) : String;
var Ret : Integer;
    sStationNo, sWorkOrder, sAttributeCode, sAttributeValue : String;
    SnrInfoData : TSnrInfoData;
    sMetaFileName : String;
begin
    Result := '';
    // 1) 공정정보를 가져온다.
    if GetSerialInfoData(sSerial, SnrInfoData) <> 0 then exit;

    // 2) Station No를 가져온다
    sAttributeCode := 'SAMPLE_WO';
    Ret := GetAttributeForWorkOrder(SnrInfoData.workOrder, sAttributeCode, sAttributeValue);

    if (Ret = 0) then begin
        if (sAttributeValue = 'SAMPLE') then
            sStationNo := '22022015'
        else exit;
    end else
    if (Ret = -218) or (Ret = -219) then begin
        sStationNo := '22022011';
    end else
        exit;

    // HMF 파일명을 요청한다.
    Ret := QueryRecipeData(sStationNo, SnrInfoData.workOrder, 'HMF_File.nom', sMetaFileName);
    if Ret <> 0 then exit;

    Result := sMetaFileName;
end;

//------------------------------------------------------------------------------
// MGH HOT TESTER용. 제품에 대한 Serial을 할당받아 Attribute에 저장한다.
//------------------------------------------------------------------------------
function TFrmItac.AppendSerialForWorkOrder(sSerial : String) : Boolean;
var Ret : Integer;
    sStationNo, sWorkOrder, sAttributeCode, sAttributeValue : String;
    SnrInfoData : TSnrInfoData;
    sHMFFileName, sOrderSerial : String;
begin
    Result := False;
    // 1) 공정정보를 가져온다.
    if GetSerialInfoData(sSerial, SnrInfoData) <> 0 then exit;

    // 2) Serial을 가져온다.
    if GetNextSerialNumberForWorkOrder(SnrInfoData.workOrder, sOrderSerial) <> 0 then exit;


    // 3) ATTRIBUTE에 추가한다.
    sHMFFileName := GetHMFforSerial(sSerial);

    if (sHMFFileName <> '') then begin
        while True do begin
            sAttributeCode := 'HMF';
            Ret := AppendAttribute(sSerial, sAttributeCode,  sHMFFileName);

            if (Ret = 0) then break;

            if (Ret = -96) then begin
                Ret := RemoveAttribute(sSerial, sAttributeCode);
                if Ret = 0 then continue
                           else exit;
            end;
            exit;
        end;
    end;

    while True do begin
        sAttributeCode := 'SNR-EEPROM';
        Ret := AppendAttribute(sSerial, sAttributeCode,  sOrderSerial);

        if (Ret = 0) then break;

        if (Ret = -96) then begin
            Ret := RemoveAttribute(sSerial, sAttributeCode);
            if Ret = 0 then continue
                       else exit;
        end;
        exit;
    end;
    Result := True;
end;



procedure TFrmItac.SpeedButton8Click(Sender: TObject);
begin
//    function TFrmItac.UpdateFailureslip(sSerial: String; sDisciption: String; bResult : Boolean): Integer;
end;

function TFrmItac.SwitchSerial(sSerial_old, sSerial_new: String): Integer;
var Ret : APILONG;
    stationNr             : APISTRING;
    processLayer          : APILONG;
    duplicateSerialNumber : APILONG;
    serialNumberOld       : APISTRING;
    serialNumberNew       : APISTRING;

    errorString           : APISTRING;
begin
    Result := -9999;

    if not bApiInitialize then exit;

    stationNr         := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberOld   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));
    serialNumberNew   := AllocMem(MAX_PARAMETER_STRING_LENGTH * sizeof(APICHAR));

    try
        helperScanf(stationNr,         Edit_StationNo.Text);
        helperScanf(serialNumberOld,   sSerial_old);
        helperScanf(serialNumberNew,   sSerial_new);

        processLayer := 2;
        duplicateSerialNumber := 0;

        Result := switchSerialNumber(
            sessionId,
            stationNr,
            processLayer,
            duplicateSerialNumber,
            serialNumberOld,
            serialNumberNew,
            errorString
        );

        LastMessage := Format('switchSerialNumber : %s=%s (%d) %s', [ serialNumberOld, serialNumberNew, Result, StrPas(errorString)]);
        AddLog(LastMessage);
    finally
        FreeMem(stationNr);
        FreeMem(serialNumberOld);
        FreeMem(serialNumberNew);
        apiFreeBuffers;
    end;

end;

end.
