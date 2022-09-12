unit FormTRClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, StdCtrls, ExtCtrls, Buttons, ScktComp, DPBLabel,
  ComCtrls;

const
    TR_CLINET_VERION = 'V20060630';


    RETRY_CONNECT_INTERVAL = 5;   // 재접속 주기 (초단위)
    REQUEST_TIMEOUT        = 2000; // 통신 요청 응답 Timeout


    SERIAL_NORESPONE = 0;
    SERIAL_NOEXIST   = 1;
    SERIAL_PASS      = 2;
    SERIAL_FAIL      = 3;
    SERIAL_REWORK    = 4;
    SERIAL_ERROR     = 5;

type
  TConnectionState = ( cs_DisConnect, cs_Connting, cs_Connect );

  TFrmTRClient = class(TForm)
    Panel1: TPanel;
    Edit_IPAddr: ZIniEdit;
    INI: ZIniData;
    BtnConnect: TSpeedButton;
    Label1: TLabel;
    ClientSocket: TClientSocket;
    Label_State: TdpbLabel;
    Label2: TLabel;
    Edit_WorkNo: ZIniEdit;
    StatusBar: TStatusBar;
    TimerCheck: TTimer;
    ProgressBar: TProgressBar;
    ListBoxLog: TListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListBoxRx: TListBox;
    Edit_Send: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnTest: TSpeedButton;
    Label6: TLabel;
    Combo_Command: ZIniComboBox;
    Edit_Serial: TEdit;
    ComboResult: ZIniComboBox;
    Edit_Opt: TEdit;
    Label7: TLabel;
    BtnClear: TSpeedButton;
    CheckBox_AutoUpload: ZIniCheckBox;
    CheckBox_AutoConnect: TCheckBox;
    TimerConnect: TTimer;
    SpeedButton1: TSpeedButton;
    Cb_UseUnloadFail: ZIniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnTestClick(Sender: TObject);
    procedure Edit_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure ClientSocketConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure TimerConnectTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    nWaitConnect : Integer;

    bUpLoading : Boolean;
    RxStr : String;
    procedure AddMsg(Param : String);
  public
    { Public declarations }
    ConnectState : TConnectionState;

    function CommConnect(bOnOff, bWait : Boolean) : Boolean;
    function SendCommad(Param : String) : Boolean;

    //--------------------------------------------------------------------------
    // 추적성용 메세지.
    function SendTestResult(sTestTime, sSerialNo, sTestRes, sTestOpt : String ) : Boolean;
    function CheckSerial(sSerialNo : String ) : Integer;
    function SendStatus(sStatus : String) : Boolean;
    function GetServerTime() : Boolean;
    function GetOrder(sModel : String) : String;
    function GetModelInfo(sSerialNo : String) : String;

  end;

var
  FrmTRClient: TFrmTRClient;

implementation

{$R *.dfm}

uses
    GenUtils;

procedure TFrmTRClient.AddMsg(Param : String);
begin
    if ListBoxRx.Items.Count > 100 then ListBoxRx.Items.Delete(0);
    
    ListBoxRx.ItemIndex := ListBoxRx.Items.Add(Param);
end;

//------------------------------------------------------------------------------
// 서버에 결과정보를 보낸다.
function TFrmTRClient.SendTestResult(sTestTime, sSerialNo, sTestRes, sTestOpt : String ) : Boolean;
var SendStr, ReadStr : String;
    sHeader, sCommand, sWorkNo, sParam : String;
begin
    Result := False;

    SendStr := Format('C:TEST:%s:%s:%s:%s:%s', [Edit_WorkNo.Text, sTestTime, sSerialNo, sTestRes, sTestOpt]);
    if SendCommad(SendStr) then
    begin
        // EX) RxStr = 'S:TEST:P1:ACK
        ReadStr := GetToken(RxStr, CRLF);

        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');
        sParam   := GetToken(ReadStr, ':');


        if (sHeader  = 'S') and
           (sCommand = 'TEST') and
           (sWorkNo  = Edit_WorkNo.Text) then
        begin
            // ACK 신호가 들어왔을때만 정상처리.
            Result := (sParam = 'ACK');
        end;
    end;

    // 전송실패 메세지 기록.
    if (Cb_UseUnloadFail.Checked) and (not Result) then
        ListBoxLog.Items.Add(SendStr);
end;

//------------------------------------------------------------------------------
// 서버에 결과정보를 보낸다.
function TFrmTRClient.CheckSerial(sSerialNo : String ) : Integer;
var SendStr, ReadStr : String;
    sHeader, sCommand, sWorkNo, sSerial, sParam : String;
begin
    SendStr := 'C:CHECK:' + Edit_WorkNo.Text + ':' + sSerialNo;

    if SendCommad(SendStr) then
    begin
        ReadStr := GetToken(RxStr, CRLF);

        // EX) RxStr = 'S:CHECK:P1:ABC0001:PASS
        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');
        sSerial  := GetToken(ReadStr, ':');
        sParam   := ReadStr; //GetToken(ReadStr, ':');

        if (sHeader  = 'S') and
           (sCommand = 'CHECK') and
           (sWorkNo  = Edit_WorkNo.Text) and
           (sSerial  = sSerialNo) then
        begin
            if (sParam = 'PASS') then Result := SERIAL_PASS
            else
            if (sParam = 'FAIL') then Result := SERIAL_FAIL
            else
            if (sParam = 'REWO') then Result := SERIAL_REWORK
            else
                Result := SERIAL_ERROR;
        end else
            Result := SERIAL_ERROR;

    end else
        Result := SERIAL_NORESPONE;
end;

//------------------------------------------------------------------------------
// 서버에 장비상태를 전송한다.
function TFrmTRClient.SendStatus(sStatus : String) : Boolean;
var SendStr, ReadStr : String;
    sHeader, sCommand, sWorkNo, sSerial, sParam : String;
begin
    Result := False;

    SendStr := 'C:STATUS:' + Edit_WorkNo.Text + ':' + sStatus;

    if SendCommad(SendStr) then
    begin
        ReadStr := GetToken(RxStr, CRLF);

        // EX) RxStr = 'S:TEST:P1:ACK
        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');
        sParam   := GetToken(ReadStr, ':');

        if (sHeader  = 'S') and
           (sCommand = 'STATUS') and
           (sWorkNo  = Edit_WorkNo.Text) and
           (sParam   = 'ACK') then
                Result := True;
    end;
end;

//------------------------------------------------------------------------------
// 서버에 작업오더를 받는다.
function TFrmTRClient.GetOrder(sModel : String) : String;
var SendStr, ReadStr : String;
    sHeader, sCommand, sWorkNo, sSerial, sParam : String;
begin
    Result := '';

    SendStr := 'C:ORDER:' + Edit_WorkNo.Text + ':' + sModel;

    if SendCommad(SendStr) then
    begin
        ReadStr := GetToken(RxStr, CRLF);

        // EX) RxStr = 'S:TEST:P1:ACK
        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');

        if (sHeader  = 'S') and
           (sCommand = 'ORDER') and
           (sWorkNo  = Edit_WorkNo.Text) and
           (ReadStr <> '') then
        begin
            Result := ReadStr;
        end;
    end;
end;

function MyStrToDateTime(Param : String; var DateTime : TDateTime) : boolean;
var
    nYear, nMon, nDay, nHour, nMin, nSec : Word;
begin
    // 12345678901234
    // 20060102123456
    Result := False;

    if Length(Param) <> 14 then exit;
    try
        nYear := StrToIntDef( Copy(Param, 1,  4), 2000);
        nMon  := StrToIntDef( Copy(Param, 5,  2), 1);
        nDay  := StrToIntDef( Copy(Param, 7,  2), 1);
        nHour := StrToIntDef( Copy(Param, 9,  2), 1);
        nMin  := StrToIntDef( Copy(Param, 11, 2), 1);
        nSec  := StrToIntDef( Copy(Param, 13, 2), 1);

        DateTime := EncodeDate(nYear, nMon, nDay) + EncodeTime(nHour, nMin, nSec, 0);
        Result := True;
    except
    end;
end;

//------------------------------------------------------------------------------
// 서버에 시간정보를 요청한다.
function TFrmTRClient.GetServerTime() : Boolean;
var SendStr, ReadStr : String;
    ServerTime : TDateTime;
    SystemTime : TSystemTime;
    Str : String;

    sHeader, sCommand, sWorkNo, sSerial, sParam : String;

begin
    Result := False;
    SendStr := 'C:TIME:' + Edit_WorkNo.Text;
    if SendCommad(SendStr) then
    begin
        ReadStr := GetToken(RxStr, CRLF);
        //                        12345678901234
        // EX) RxStr = 'S:TIME:P1:20060102123456
        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');
        sParam   := GetToken(ReadStr, ':');

        if (sHeader  = 'S') and
           (sCommand = 'TIME') and
           (sWorkNo  = Edit_WorkNo.Text) then
        begin

            if MyStrToDateTime(sParam, ServerTime) then
            begin
                DateTimeToSystemTime(ServerTime, SystemTime);
                SetLocalTime( SystemTime );
                Result := True;
            end;
        end;
    end;
end;

//==============================================================================
function TFrmTRClient.CommConnect(bOnOff, bWait : Boolean) : Boolean;
begin
    Result := False;

    TimerCheck.Enabled  := False;

    CheckBox_AutoConnect.Checked := bOnOff;

    if (bOnOff) then begin
        if (Edit_IPAddr.Text = '') then exit;
        if (ConnectState <> cs_DisConnect) then exit;

        ClientSocket.Address := Edit_IPAddr.Text;
        ClientSocket.Open;

        // 응답 요청을 기다린다.
        if bWait then
        begin
            ProgressBar.Min := 0;
            ProgressBar.Max := REQUEST_TIMEOUT;
            ProgressBar.Position := 0;
            ProgressBar.Tag := GetTickCount();
            while True do begin
                ProgressBar.Position := (GetTickCount() - ProgressBar.Tag);
                if ( ProgressBar.Position >= ProgressBar.Max) then break; // TIME OUT.

                if (ConnectState = cs_Connect) then begin
                    break;
                end;
                Application.ProcessMessages;
                Sleep(1);
            end;
            ProgressBar.Position := 0;
        end;
        TimerCheck.Enabled  := True;
    end else
    begin
        // 종료정보를 보낸다.
        SendStatus('DISCONNECT');
        
        ClientSocket.Close();
    end;
end;

procedure TFrmTRClient.FormCreate(Sender: TObject);
var
    FileName : String;
begin
    exit;
    Caption := Caption + ' : ' + TR_CLINET_VERION;

    INI.LoadData;

    // LOG 파일을 읽어들인다.
    FileName := GetAppDir('') + 'TRACE.LOG';
    if FileExists(FileName) then begin
        try
            ListBoxLog.Items.LoadFromFile(FileName);
        except
        end;
    end;

    ConnectState := cs_DisConnect;
end;

procedure TFrmTRClient.FormClose(Sender: TObject; var Action: TCloseAction);
var
    FileName : String;
begin
    // LOG 파일을 저장한다.
    FileName := GetAppDir('') + 'TRACE.LOG';
    try
        if FileExists(FileName) then
            DeleteFile(FileName);

        if ListBoxLog.Count > 0 then
            ListBoxLog.Items.SaveToFile(FileName);
    except
    end;

    INI.SaveData;
end;

procedure TFrmTRClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    ConnectState := cs_Connect;

    Label_State.Color   := clGreen;
    Label_State.Caption := '접속완료';

    AddMsg('# 접속완료');

//-------------------------------------------------------
    BtnConnect.Enabled := True;

    if CheckBox_AutoUpload.Checked then
        bUpLoading := True;

    TimerConnect.Enabled := True;
end;

procedure TFrmTRClient.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    ConnectState := cs_Connting;

    Label_State.Color   := clGreen;
    Label_State.Caption := '접속시도중';

    AddMsg('# 접속시도');
    nWaitConnect := 0;
end;

procedure TFrmTRClient.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    ConnectState := cs_Disconnect;

    Label_State.Color   := clGray;
    Label_State.Caption := '접속해제';

    AddMsg('# 접속해제');

    bUpLoading := False;
end;

procedure TFrmTRClient.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
    AddMsg(Format('# ERR : %d', [ErrorCode]));

    ErrorCode := 0;
    Socket.Close;
end;

function TFrmTRClient.SendCommad(Param : String) : Boolean;
begin
    Result := False;

    // 연결이 안되었으면 종료.
    if (ConnectState <> cs_Connect) then exit;

    Screen.Cursor := crHourGlass;

    RxStr := '';
    ClientSocket.Socket.SendText(Param + CRLF);
    AddMsg('<' + Param);

    
    // WAIT CONNECTING....
    StatusBar.Panels[1].Text := 'WAIT RESPONSE';

    ProgressBar.Position := 0;
    ProgressBar.Min := 0;
    ProgressBar.Max := REQUEST_TIMEOUT;

    ProgressBar.Tag := GetTickCount();
    while True do begin
        ProgressBar.Position := (GetTickCount() - ProgressBar.Tag);
        if ( ProgressBar.Position >= ProgressBar.Max) then break; // TIME OUT.

        if Pos(CRLF, RxStr) > 0 then begin
            RxStr := GetToken(RxStr, CRLF);
            AddMsg('>' + RxStr);
            Result := True;
            break;
        end;

        Application.ProcessMessages;
    end;
    ProgressBar.Position := 0;

    Screen.Cursor := crDefault;

    if Result then StatusBar.Panels[1].Text := 'RESPONSE OK'
              else StatusBar.Panels[1].Text := 'TIME OUT!';
end;

procedure TFrmTRClient.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    RxStr := RxStr + Socket.ReceiveText;
end;

procedure TFrmTRClient.BtnConnectClick(Sender: TObject);
begin
    case ConnectState of
        cs_DisConnect : CommConnect(True,  True);
        cs_Connting   : CommConnect(False, True);
        cs_Connect    : CommConnect(False, True);
    end;
end;

procedure TFrmTRClient.SpeedButton1Click(Sender: TObject);
begin
//    if ClientSocket.Active then
        CommConnect(False, True);
end;


procedure TFrmTRClient.BtnTestClick(Sender: TObject);
var SendStr : String;
begin
    case Combo_Command.ItemIndex of
        0 : begin // CHECK
            CheckSerial(Edit_Serial.Text);
        end;
        1 : begin // TEST
            SendTestResult(FormatDateTime('YYYYMMDDHHNNSS', Now()), Edit_Serial.Text, ComboResult.Text, Edit_Opt.Text );
        end;
        2 : begin // TIME
            GetServerTime();
        end;
        3 : begin // STATUS
            SendStatus(ComboResult.Text);
        end;
        4 : begin // Model
            GetModelInfo(Edit_Serial.Text);
        end;
    end;
end;

procedure TFrmTRClient.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        SendCommad(Edit_Send.Text);
        Key := 0;
    end;
end;

procedure TFrmTRClient.SpeedButton4Click(Sender: TObject);
begin
    ListBoxLog.Clear;
end;


const
    WAIT_COUNT = 10;

procedure TFrmTRClient.TimerCheckTimer(Sender: TObject);
var RdStr : String;
    sHeader, sCommand, sWorkCode, sTime, sSerial, sResult, sOption : String;
    nElapseTime : Integer;
begin
    TimerCheck.Enabled := False;

    StatusBar.Panels[2].Text := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now());

    //-------------------------------
    case ConnectState of
        cs_DisConnect : begin
            if CheckBox_AutoConnect.Checked then
            begin
                StatusBar.Panels[1].Text := Format('연결대기 : %d', [nWaitConnect]);

                if nWaitConnect <= 0 then // 연결 해제 읽정시간 이상 흐르면 연결시도.
                    CommConnect(True, False)
                else
                    Dec(nWaitConnect);
            end;
        end;

        cs_Connting : begin   // 연결 시도중인경우.
            StatusBar.Panels[1].Text := '연결시도중';
            nWaitConnect := WAIT_COUNT ;
        end;

        cs_Connect : begin    // 연결 되어 있는 경우.
            nWaitConnect := WAIT_COUNT ;

            // 접속되어 있고 미전송 메세지가 있으면 하나씩 전송한다.
            if (bUpLoading) then begin
                if ListBoxLog.Count > 0 then begin
                    RdStr := ListBoxLog.Items[0];
                    // RdStr = 'C:TEST:P5:20060101123456:ABCD0001:PASS:OPTION'

                    sHeader   := GetToken(RdStr, ':');
                    sCommand  := GetToken(RdStr, ':');
                    sWorkCode := GetToken(RdStr, ':');
                    sTime     := GetToken(RdStr, ':');
                    sSerial   := GetToken(RdStr, ':');
                    sResult   := GetToken(RdStr, ':');
                    sOption   := RdStr;

                    if (sHeader = 'C') and (sCommand = 'TEST') and (sResult <> '') then
                        SendTestResult(sTime, sSerial, sResult, sOption);

                    ListBoxLog.Items.Delete(0);
                end else
                    bUpLoading := False;
            end;
        end;
    end;

    TimerCheck.Enabled := True;
end;

procedure TFrmTRClient.BtnClearClick(Sender: TObject);
begin
    ListBoxLog.Clear;
end;


procedure TFrmTRClient.TimerConnectTimer(Sender: TObject);
begin
    // 연결되면 실행됨.
    TimerConnect.Enabled := False;

    SendStatus('CONNECT');
    GetServerTime(); // 접속완료시 서버시간을 요청한다.
end;


function TFrmTRClient.GetModelInfo(sSerialNo: String): String;
var SendStr, ReadStr : String;
    sHeader, sCommand, sWorkNo, sSerial, sParam : String;
begin
    Result := '';

    SendStr := 'C:MODEL:' + Edit_WorkNo.Text + ':' + sSerialNo;// + ':';

    if SendCommad(SendStr) then
    begin
        ReadStr := GetToken(RxStr, CRLF);

        // EX) RxStr = 'S:MODEL:P1:SERIAL:12312412
        sHeader  := GetToken(ReadStr, ':');
        sCommand := GetToken(ReadStr, ':');
        sWorkNo  := GetToken(ReadStr, ':');
        sSerial  := GetToken(ReadStr, ':');

        if (sHeader  = 'S') and
           (sCommand = 'MODEL') and
           (sWorkNo  = Edit_WorkNo.Text) and
           (ReadStr <> '') then
        begin
            Result := ReadStr;
        end;
    end;
end;

end.
