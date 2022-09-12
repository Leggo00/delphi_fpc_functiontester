 //------------------------------------------------------------------------------
//
//  KMI Traceability Server   2013. 04.03
//
//------------------------------------------------------------------------------
unit FormTraceClient;
                                               
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DPBLabel, ZINICtrl, ExtCtrls, ComCtrls, Buttons,
  ScktComp, XiButton, Grids, ValEdit, Menus;

type
  TConnectState = (cs_Connected, cs_Connecting, cs_Disconnect );

  TFrmTraceClient = class(TForm)
    Panel1: TPanel;
    INI: ZIniData;
    Ed_IPAddr: ZIniEdit;
    dpbLabel1: TdpbLabel;
    StatusBar: TStatusBar;
    GroupBox1: TGroupBox;
    ClientSocket: TClientSocket;
    dpbLabel2: TdpbLabel;
    Ed_Station: ZIniEdit;
    BtnConnect: TXiButton;
    BtnDisConnect: TXiButton;
    BtnSend: TXiButton;
    Label2: TLabel;
    ValueListEditor: TValueListEditor;
    Cb_Cmd: TComboBox;
    BtnExecute: TXiButton;
    Timer: TTimer;
    Image7: TImage;
    Image1: TImage;
    ValueListEditorOut: TValueListEditor;
    Label1: TLabel;
    Label3: TLabel;
    BtnClear: TXiButton;
    PopupMenu: TPopupMenu;
    LOGLISTCLEAR1: TMenuItem;
    cbAutoConnect: ZIniCheckBox;
    TimerConnect: TTimer;
    Timer1: TTimer;
    ListBoxLog: TListBox;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit2: ZIniEdit;
    Edit3: ZIniEdit;
    cbFrontCheck: ZIniCheckBox;
    EditSendData: TEdit;
    procedure BtnDisConnectClick(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure Cb_CmdChange(Sender: TObject);
    procedure BtnExecuteClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure LOGLISTCLEAR1Click(Sender: TObject);
    procedure TimerConnectTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    TxStr, RxStr : String;
    ConnectState : TConnectState;
    ConnectedTime : TDateTime;


    nSerial : Integer;
    nErrorCount : Integer;
    fConnectingTime : Double;

    procedure AddLog(Param : String; bDispTime : Boolean = True);
    function CheckData(Index : Integer; RdStr, Station, Command:String; var ValData:String):Integer;
    procedure SendTestMessage;
    { Private declarations }
  public
    { Public declarations }
    nIndex : integer;
    bConnecttionRun, bServerConnected :Boolean;

    function  CommConnect(bOnOff: Boolean): Boolean;
    function  CommSend(MsgStr : String): Boolean;
    function  CommRead(MsgStr : String; nTimeOut : Integer = 9000) : Integer;

    // Traceability Function.
    function  GetServerTime(sStation : String; var ServerTime : TDateTime) : Integer;
    function  CheckSNState (sStation, sSerial : String) : Integer;
    function  CheckSNInfo  (sStation, sSerial : String; var sModelName, sState : String) : Integer;
    function  CreateSerial (sStation, sSerial, sResult, sModelCode : String; TestTime : TDateTime; nCycleTime : Integer) : Integer;
    function  UploadState  (sStation, sSerial, sResult : String; TestTime : TDateTime; nCycleTime : Integer) : Integer;

    function  UploadStateAndResult(sStation, sSerial, sResult, sList : String; TestTime : TDateTime; nCycleTime, nItemCount : Integer) : Integer;

    function  SetAttributeForSN(sStation, sSerial, sAttributeCode, sAttributeValue : String) : Integer;
    function  GetAttributeForSN(sStation, sSerial, sAttributeCode : String; var sAttributeValue : String) : Integer;
    function  GetAttributeForVL(sStation, sAttributeValue, sAttributeCode : String; var sSerial : String) : Integer;
    function  UploadStationState(sStation : String; nState : Integer) : Integer;
    function  ChangeSerial(sStation, sPrevSerial, sNextSerial : String) : Integer;
    function  GetStationSetup(sStation : String; var sWorkOrder, sModelName : String) : Integer;
    function  SetWorkOrderPdCount(sStation, sWorkOrder, sProductCount: String): Integer;
    function  GetWorkOrderPdCount(sStation, sWorkOrder: String; var sTargetCount, sProductCount : String): Integer;
    function  ChangeModelName(sStation, sSerial,sModelName: String): Integer;
  end;

var
  FrmTraceClient: TFrmTraceClient;

implementation

uses
    GenUtils, Global, DateUtils, FormMain;

{$R *.dfm}

function TFrmTraceClient.CheckData(Index : Integer; RdStr, Station, Command:String; var ValData:String):Integer;
var TxStr : String;
    sHeader, sLength, sStation, sCommand, sResult : String;
    nLength : Integer;
begin
    Result  := -9999;
    TxStr   := '';
                                    //S;0026;CheckSNState;5000;-1;Fail;
    sHeader  := GetToken(RdStr, ';');
    sLength  := GetToken(RdStr, ';');
    sCommand := UpperCase(GetToken(RdStr, ';'));
    sStation := GetToken(RdStr, ';');
    sResult  := GetToken(RdStr, ';');

    // 1) 헤더를 비교한다.
    if (sHeader <> 'S') then begin
//        TxStr := Format('%s;%s;-100;Unknown Header', [sCommand, sStation]);
//        Result  := -100;
//        exit;
    end;

    // 2) 데이터 길이를 비교한다.
    nLength := StrToIntDef(sLength, -1)-2;
    if (nLength <> Length(RxStr)) then begin
//        TxStr := Format('%s;%s;-101;Datasize not equal', [sCommand, sStation]);
//        Result  := -101;
//        exit;
    end;

    // 3) Statoin을 비교한다.
    if (sStation <> Station) then begin
//        TxStr := Format('%s;%s;-102;Station not equal', [sCommand, sStation]);
//        Result  := -102;
//        exit;
    end;

    // 4) Command을 비교한다.
    if (sCommand <> Command) then begin
//        TxStr := Format('%s;%s;-103;Command not equal', [sCommand, sStation]);
//        Result  := -103;
//        exit;
    end;
          {
    case Index of
        3 : begin
                Result  :=  StrToIntDef(GetToKen(RdStr, ';'),-9999);             // QUERY 결과 ( SUCCESS = 0  Else FAIL)
                GetToKen(RdStr, ';');             // 시간
                GetToKen(RdStr, ';');             // MODEL
                ValData := GetToKen(RdStr, ';');  // PASS or FAIL
        end;

        9 : begin
                Result  :=  StrToIntDef(GetToKen(RdStr, ';'),-9999);             // QUERY 결과 ( SUCCESS = 0  Else FAIL)
                GetToKen(RdStr, ';');             // 시간
                ValData := RdStr;
        end;

        10 : begin
                Result  :=  StrToIntDef(GetToKen(RdStr, ';'),-9999);             // QUERY 결과 ( SUCCESS = 0  Else FAIL)
                GetToKen(RdStr, ';');             // 시간
                ValData := RdStr;
        end;
    end;

}


end;


procedure TFrmTraceClient.AddLog(Param : String; bDispTime : Boolean = True);
var sFileName : String;
begin
    sFileName := GetAppDir('LOG') + 'TRACE\'  + FormatDateTime('YY-MM', Now) + '\Debug\' + Ed_Station.Text + '\'+
                FormatDateTime('YYMMDD', Now) + '.txt';
    WriteDebugStr(Param, sFileName);

    with ListBoxLog do begin
        if Count > 200 then Items.Delete(0);
        ItemIndex := Items.Add(FormatDateTime('HH:NN:SS.ZZZ | ', Now) + Param);
    end;
    
end;

procedure TFrmTraceClient.BtnConnectClick(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmTraceClient.BtnDisConnectClick(Sender: TObject);
begin
    CommConnect(False);
end;

function TFrmTraceClient.CommConnect(bOnOff : Boolean) : Boolean;
var fTime : Double;
begin
    bServerConnected := False;
    try
        if (bOnOff) then
        begin
            if ClientSocket.Active then
                ClientSocket.Active := False;

            BtnConnect.Enabled := False;
            bConnecttionRun := True;
            ClientSocket.Address := Ed_IPAddr.Text;
            ClientSocket.Port    := SOCKET_PORT;
            ClientSocket.Active := True;

            {
            fTime := GetTickCountEx;
            while (GetTickCountEx - fTime) < (StrToIntDef(EditWaitTime.Text,3) * 1000) do
            begin
                if bServerConnected then
                begin
                    Addlog(Format('Connecting LoadTime : %f',[(GetTickCountEx - fTime)/1000]));
                    break;
                end;
                if ConnectState = cs_Disconnect then break;
                StatusBar.Panels[1].Text := Format('Connecting LoadTime : %f',[(GetTickCountEx - fTime)/1000]);
                application.processmessages;
            end;

            if bServerConnected then
            begin
                StatusBar.Panels[0].Text := 'Connected!';
            end
            else
            begin
                StatusBar.Panels[1].Text := 'DisConnected!';
                BtnConnect.Enabled := true;
            end;
            }
            BtnConnect.Enabled := true;

        end else begin
            ClientSocket.Active := False;
            //BtnConnect.Enabled := True;
            //StatusBar.Panels[1].Text := '';
        end;
    finally
        bConnecttionRun := False;
    end;
end;

//------------------------------------------------------------------------------
// Socket Message를 전송한다.
function TFrmTraceClient.CommSend(MsgStr : String) : Boolean;
begin
    Result := False;

    // 앞의 헤더는 항상 자동으로 붙는다.
    TxStr := Format('C;%.4d;%s', [Length(MsgStr), MsgStr]);
    RxStr := '';
    if (not ClientSocket.Active) then exit;

    AddLog('TX> ' + TxStr);
    ClientSocket.Socket.SendText(TxStr + CRLF);

    Result := True;
end;

//------------------------------------------------------------------------------
// Socket Message를 수신한다.
function TFrmTraceClient.CommRead(MsgStr : String; nTimeOut : Integer = 9000) : Integer;
var fTime : Double;
    Str, RdStr, sCommand, sStation : String;
    nRet, nLength : Integer;
begin

    if Not bServerConnected then
    begin
        Result := RES_SERVER_SOCKET_CONNECT_ERROR;
    end;

    Result := RES_UNKNOWN_ERROR;

    fTime := GetTickCountEX;
    try
        // 전송메세지가 있으면 먼저 보낸다.
        if MsgStr <> '' then
            CommSend(MsgStr);

        // 메세지를 기다린다.
        while (GetTickCountEX - fTime < nTimeOut) do
        begin
            if Pos(CRLF, RxStr) > 0 then begin
                RxStr := GetToken(RxStr, CRLF);
                AddLog('RX> ' + RxStr);
                break;
            end;
            Application.ProcessMessages;
            FrmMain.WritePCAlive();
        end;

        // 정상 응답확인.
        if (RxStr <> '') then
        begin
            RdStr := RxStr;
            Str := GetToken(RdStr, DELIMITER);   // Header
            if (Str = HEADER_SERVER) then
            begin
                nLength := StrToIntDef(GetToken(RdStr, DELIMITER), 0);  // Length
                if ( nLength = Length(RdStr) ) then
                begin
                    sCommand := GetToken(RdStr, ';');                // Command
                    sStation := GetToken(RdStr, ';');                // Station
                    nRet := StrToIntDef(GetToken(RdStr, DELIMITER), RES_UNKNOWN_ERROR);  // Result
                end else
                    nRet := RES_DATASIZE_NOT_EQUAL;
            end else begin
                nRet := RES_UNKNOWN_HEADER;
            end;
        end else
        begin
            // 아주심각한 에러로 카운트 하기로 한다.
            nRet := RES_SERVER_ERROR;
            Inc(nErrorCount);
            StatusBar.Panels[3].Text := Format('SERVER_ERROR_COUNT : %d',[nErrorCount]);
        end;

    finally
        Result := nRet;
        AddLog(Format('* Time (%f ms) : %s', [GetTickCountEX - fTime, GetErrorString(nRet)]));
        AddLog('', False);
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    AddLog('Server Connected');
    StatusBar.Panels[0].Text := 'Connected';

    ConnectedTime := Now;
    ConnectState := cs_Connected;

    BtnConnect.Enabled := True;
end;


//------------------------------------------------------------------------------
procedure TFrmTraceClient.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    AddLog('Server Connecting... : ' + ClientSocket.Address);
    StatusBar.Panels[0].Text := 'Connecting...';

    ConnectState := cs_Connecting;
    fConnectingTime := GetTickCountEx;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    AddLog('Server DisConnect');
    StatusBar.Panels[0].Text := 'Disconnect';

    ConnectState := cs_Disconnect;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
    AddLog(Format('Soket Error %d ', [ErrorCode]));
    ErrorCode := 0;

    BtnConnect.Enabled := True;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var sTemp : String;
begin
    RxStr := RxStr + Socket.ReceiveText;
    if bConnecttionRun then
    begin
        if Pos('Connected', RxStr) > 0 then
        begin
            sTemp := RxStr;
            StatusBar.Panels[1].Text := RxStr;
            GetToKen( sTemp, ' = ');
            GetToKen( sTemp, ';');
            sTemp := GetToKen( sTemp, ';');
            if sTemp = '0' then bServerConnected := True
            else if StrToIntDef(sTemp,-1) = RES_SERVER_SOCKET_CONNECT_ERROR then
                bServerConnected := False
            else
                bServerConnected := False;
            AddLog(RxStr);
            RxStr := '';
        end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.FormCreate(Sender: TObject);
begin
{    INI.LoadData;
    ConnectState := cs_Disconnect;
    nErrorCount := 0;
    CommConnect(True);
    TimerConnect.Enabled := True;
}
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.BtnSendClick(Sender: TObject);
begin
    CommRead(EditSendData.Text);
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.BtnClearClick(Sender: TObject);
begin
    ListBoxLog.Clear;
end;

//------------------------------------------------------------------------------
procedure TFrmTraceClient.Cb_CmdChange(Sender: TObject);
var Idx : Integer;
    sStation : String;
begin
    ValueListEditor.Strings.Clear;
    sStation := Ed_Station.Text;

    Idx := Cb_Cmd.ItemIndex + 1;
{
01) GetServerTime
02) CheckSNState
03) CheckSNInfo
04) CreateSerial
05) UploadState
06) UploadStateAndResult
07) SetAttributeForSN
08) GetAttributeForSN
09) GetAttributeForVL
10) UploadStationState
11) ChangeSerial
12) GetStationSetup
13) SetWorkOrderPdCount
14) GetWorkOrderPdCount
15) ChangeModel
}
    
    case Idx of
        // 1) GetServerTime
        1: begin
            ValueListEditor.Values['STATION']   := sStation;
        end;

        // 2) CheckSNState & 3) CheckSNInfo
        2,3: begin
            ValueListEditor.Values['STATION']   := sStation;
            ValueListEditor.Values['SERIAL']    := '';
        end;

        // CreateSerial
        4: begin
            ValueListEditor.Values['STATION']   := sStation;
            ValueListEditor.Values['SERIAL']    := '';
            ValueListEditor.Values['RESULT']    := '1';
            ValueListEditor.Values['TESTTIME']  := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
            ValueListEditor.Values['MODELCODE'] := '';
            ValueListEditor.Values['CYCLETIME'] := '0';
        end;

        // 3) UploadState
        5: begin
            ValueListEditor.Values['STATION']   := sStation;
            ValueListEditor.Values['SERIAL']    := '';
            ValueListEditor.Values['RESULT']    := '1';
            ValueListEditor.Values['TESTTIME']  := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
            ValueListEditor.Values['CYCLETIME'] := '0';
        end;

        // 4) UploadStateAndResult
        6: begin
            ValueListEditor.Values['STATION']   := sStation;
            ValueListEditor.Values['SERIAL']    := '';
            ValueListEditor.Values['RESULT']    := '1';
            ValueListEditor.Values['TESTTIME']  := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
            ValueListEditor.Values['CYCLETIME'] := '0';
            ValueListEditor.Values['ITEMCOUNT'] := '1';
            ValueListEditor.Values['DATACOUNT'] := '';
            ValueListEditor.Values['DATALIST']  := '';
        end;

        // 5) SetAttributeForSN.
        7: begin
            ValueListEditor.Values['STATION']        := sStation;
            ValueListEditor.Values['SERIAL']         := '';
            ValueListEditor.Values['ATTRIBUTECODE']  := '';
            ValueListEditor.Values['ATTRIBUTEVALUE'] := '';
        end;

        // 6) GetAttributeForSN.
        8: begin
            ValueListEditor.Values['STATION']       := sStation;
            ValueListEditor.Values['SERIAL']        := '';
            ValueListEditor.Values['ATTRIBUTECODE'] := '';
        end;

        //  GetAttributeForVL.
        9: begin
            ValueListEditor.Values['STATION']       := sStation;
            ValueListEditor.Values['ATTRIBUTEVALUE']:= '';
            ValueListEditor.Values['ATTRIBUTECODE'] := '';
        end;

        // UploadStationState
        10: begin
            ValueListEditor.Values['STATION'] := sStation;
            ValueListEditor.Values['STATE']   := '';
        end;

        // ChangeSerial
        11: begin
            ValueListEditor.Values['STATION']     := sStation;
            ValueListEditor.Values['PREV_SERIAL'] := '';
            ValueListEditor.Values['NEXT_SERIAL'] := '';
        end;

        // GetStationSetup
        12: begin
            ValueListEditor.Values['STATION']     := sStation;
        end;

        // SetWorkOrderPdCount
        13: begin
            ValueListEditor.Values['STATION']         := sStation;
            ValueListEditor.Values['WORKORDER']       := '';
            ValueListEditor.Values['PRODUCT_COUNT']   := '1';
        end;

        // GetWorkOrderPdCount
        14: begin
            ValueListEditor.Values['STATION']         := sStation;
            ValueListEditor.Values['WORKORDER']       := '';
        end;

        // ChangeModelCode
        15: begin
            ValueListEditor.Values['STATION']     := sStation;
            ValueListEditor.Values['SERIAL']      := '';
            ValueListEditor.Values['MODELCODE']   := '';
        end;
    end;
end;


//------------------------------------------------------------------------------
// YYYYMMSSHHNNSS 형식을 TDateTime으로 변경한다.
function StrToMyDateTime(Param : String) : TDateTime;
var nYear, nMon, nDay, nHour, nMin, nSec : Word;
begin
    nYear := StrToIntDef( Copy(Param, 1,  4), 2000);
    nMon  := StrToIntDef( Copy(Param, 5,  2), 1);
    nDay  := StrToIntDef( Copy(Param, 7,  2), 1);
    nHour := StrToIntDef( Copy(Param, 9,  2), 0);
    nMin  := StrToIntDef( Copy(Param, 11,  2), 0);
    nSec  := StrToIntDef( Copy(Param, 13, 2), 0);

    Result := EncodeDate(nYear, nMon, nDay) + EncodeTime(nHour, nMin, nSec, 0);
end;


//------------------------------------------------------------------------------
procedure TFrmTraceClient.BtnExecuteClick(Sender: TObject);
var Idx, nRet : Integer;
    ServerTime : TDateTime;

    sStation, sWorkOrder, sModelCode, sState, sAttributeValue, sSerial, sProductCount, sTargetCount : String;
begin
    if not ClientSocket.Active then exit;

    //BtnExecute.Enabled := False;

{
01) GetServerTime
02) CheckSNState
03) CheckSNInfo
04) CreateSerial
05) UploadState
06) UploadStateAndResult
07) SetAttributeForSN
08) GetAttributeForSN
09) GetAttributeForVL
10) UploadStationState
11) ChangeSerial
12) GetStationSetup
13) SetWorkOrderPdCount
}
    Idx := Cb_Cmd.ItemIndex + 1;

    with ValueListEditor do
    begin
        sStation := Values['STATION'];
        case Idx of
            // 1) GetServerTime
            1 : begin
                nRet := GetServerTime(sStation, ServerTime );
            end;

            // 2) CheckSNState
            2: begin
                nRet := CheckSNState(sStation, Values['SERIAL']);
            end;

            // CheckSNInfo
            3: begin
                nRet := CheckSNInfo(sStation, Values['SERIAL'], sModelCode, sState);
            end;

            // Create Serial.
            4: begin
                nRet := CreateSerial( sStation, Values['SERIAL'], Values['RESULT'],  Values['MODELCODE'],
                    StrToTraceDateTime(Values['TESTTIME']), StrToIntDef(Values['CYCLETIME'], 0));
            end;

            //  UploadState
            5: begin
                nRet := UploadState( sStation, Values['SERIAL'], Values['RESULT'],
                    StrToTraceDateTime(Values['TESTTIME']), StrToIntDef(Values['CYCLETIME'], 0));
            end;
            // UploadStateAndResult
            6: begin
                nRet := UploadStateAndResult( sStation, Values['SERIAL'], Values['RESULT'], Values['DATALIST'],
                    StrToTraceDateTime(Values['TESTTIME']), StrToIntDef(Values['CYCLETIME'],0), StrToIntDef(Values['DATACOUNT'],0) );
            end;

            // SetAttributeForSN
            7: begin
                nRet := SetAttributeForSN(sStation, Values['SERIAL'], Values['ATTRIBUTECODE'], Values['ATTRIBUTEVALUE']);
            end;

            // GetAttributeForSN
            8: begin
                nRet := GetAttributeForSN(sStation, Values['SERIAL'], Values['ATTRIBUTECODE'], sAttributeValue);
            end;

            // GetAttributeForVL
            9: begin
                nRet := GetAttributeForVL(sStation, Values['ATTRIBUTEVALUE'], Values['ATTRIBUTECODE'], sSerial);
            end;

            // UploadStationState
            10 : begin
                nRet := UploadStationState(sStation, StrToIntDef(Values['STATE'], 0));
            end;

            // ChangeSerial
            11 : begin
                nRet := ChangeSerial(sStation, Values['PREV_SERIAL'], Values['NEXT_SERIAL']);
            end;

            // GetStationSetup
            12 : begin
                nRet := GetStationSetup(sStation, sWorkOrder, sModelCode);
            end;

            // GetStationSetup
            13 : begin
                nRet := SetWorkOrderPdCount(sStation, Values['WORKORDER'], Values['PRODUCT_COUNT']);
            end;

            // GetStationSetup
            14 : begin
                nRet := GetWorkOrderPdCount(sStation, Values['WORKORDER'], sTargetCount, sProductCount);
            end;

            // ChangeModelName
            15 : begin
                nRet := ChangeModelName(sStation, Values['SERIAL'], Values['MODELCODE']);
            end;
        end;
    end;
    BtnExecute.Enabled := True;
end;

procedure SetPCDateTime(Param:String);
var SystemTime: TSystemTime;
    nHour : Integer;
begin
    with SystemTime do
    begin
        wYear:= StrToInt(GetToKen(Param,'-'));
        wMonth:= StrToInt(GetToKen(Param,'-'));
        wDay:= StrToInt(GetToKen(Param,' '));
        nHour:= StrToInt(GetToKen(Param,':'));
        wHour:= nHour;
        wMinute:= StrToInt(GetToKen(Param,':'));
        wSecond:= StrToInt(GetToKen(Param,'.'));
        wMilliseconds:= 0;
    end;
    SetLocalTime( SystemTime );
end;

//------------------------------------------------------------------------------
// 1) GetServerTime
function TFrmTraceClient.GetServerTime(sStation : String; var ServerTime : TDateTime) : Integer;
var Str, WtStr, RdStr : String;
    SystemTime: TSystemTime;
    nYear, nMon, nDay, nHour, nMin, nSec, nAMilliSec : Word;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('GetServerTime;%s;', [sStation]);
    Result := CommRead(WtStr);
    if (Result = RES_SUCCESS) then
    begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result


        Str := GetToken(RdStr, ';');  // TimeData

        SetPCDateTime(Format('%s-%s-%s %s:%s:%s.%s',[Copy(Str,1,4),
                                                     Copy(Str,5,2),
                                                     Copy(Str,7,2),
                                                     Copy(Str,9,2),
                                                     Copy(Str,11,2),
                                                     Copy(Str,13,2),
                                                     '0']));
    end;
end;


//------------------------------------------------------------------------------
// 2) CheckSNState
function TFrmTraceClient.CheckSNState(sStation, sSerial : String) : Integer;
var WtStr, TempRxStr, RdStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('CheckSNState;%s;%s;', [sStation, sSerial]);
    CommRead(WtStr);
    TempRxStr := RxStr;  //S;0026;CheckSNState;5000;-1;Fail;
    GetToken(TempRxStr, ';');
    GetToken(TempRxStr, ';');
    GetToken(TempRxStr, ';');
    GetToken(TempRxStr, ';');
    RdStr := GetToken(TempRxStr, ';');

    Result:= StrToIntDef(RdStr, -1);
end;

//------------------------------------------------------------------------------
// 3) CheckSNInfo
function TFrmTraceClient.CheckSNInfo(sStation, sSerial : String; var sModelName, sState : String) : Integer;
var WtStr : String;
    RdStr, Str : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;
    //
    WtStr := Format('CheckSNInfo;%s;%s;', [sStation, sSerial]);
    Result := CommRead(WtStr);
    if (Result = RES_SUCCESS) then begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result

        Str := GetToken(RdStr, ';');  // SerialNo
        sModelName := GetToken(RdStr, ';');  // ModelName
        sState := GetToken(RdStr, ';');  // Status
    end;
end;

//------------------------------------------------------------------------------
// 4) CreateSerial
function TFrmTraceClient.CreateSerial(sStation, sSerial, sResult,
  sModelCode: String; TestTime: TDateTime; nCycleTime: Integer): Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('CreateSerial;%s;%s;%s;%s;%s;%d;',
        [sStation, sSerial, sResult, FormatDateTime('YYYYMMDDHHNNSSZZZ', TestTime), sModelCode, nCycleTime]);
    Result := CommRead(WtStr);
end;

//------------------------------------------------------------------------------
// 5) UploadState.
function TFrmTraceClient.UploadState(sStation, sSerial, sResult : String; TestTime : TDateTime; nCycleTime : Integer) : Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('UPLOADSTATE;%s;%s;%s;%s;%d;',
        [sStation, sSerial, sResult, FormatDateTime('YYYYMMDDHHNNSSZZZ', TestTime), nCycleTime]);
    Result := CommRead(WtStr);
end;

//------------------------------------------------------------------------------
// 6) UploadStateAndResult
function TFrmTraceClient.UploadStateAndResult(sStation, sSerial, sResult, sList : String; TestTime : TDateTime; nCycleTime, nItemCount : Integer) : Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('UploadStateAndResult;%s;%s;%s;%s;%d;%d;%s;',
        [sStation, sSerial, sResult, FormatDateTime('YYYYMMDDHHNNSSZZZ', TestTime), nCycleTime, nItemCount, sList]);
    Result := CommRead(WtStr);
end;


//------------------------------------------------------------------------------
// 7) SetAttributeForSN
function TFrmTraceClient.SetAttributeForSN(sStation, sSerial, sAttributeCode, sAttributeValue : String) : Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('SetAttributeForSN;%s;%s;%s;%s;', [sStation, sSerial, sAttributeCode, sAttributeValue]);
    Result := CommRead(WtStr);
end;

//------------------------------------------------------------------------------
// 8) GetAttributeForSN
function TFrmTraceClient.GetAttributeForSN(sStation, sSerial, sAttributeCode : String; var sAttributeValue : String) : Integer;
var Str, WtStr, RdStr : String;
begin
    sAttributeValue := '';

    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('GetAttributeForSN;%s;%s;%s;', [sStation, sSerial, sAttributeCode]);
    Result := CommRead(WtStr);

    if (Result = RES_SUCCESS) then
    begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result
        Str := GetToken(RdStr, ';');  // Serial

        sAttributeValue := GetToken(RdStr, ';');
    end;
end;

//------------------------------------------------------------------------------
// 9) GetAttributeForVL
function TFrmTraceClient.GetAttributeForVL(sStation, sAttributeValue, sAttributeCode : String; var sSerial : String) : Integer;
var Str, WtStr, RdStr : String;
begin
    sSerial := '';

    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('GetAttributeForVL;%s;%s;%s;', [sStation, sAttributeValue, sAttributeCode]);
    Result := CommRead(WtStr);

    if (Result = RES_SUCCESS) then
    begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result
        Str := GetToken(RdStr, ';');  // sAttributeValue

        sSerial := GetToken(RdStr, ';');
    end;
end;

//------------------------------------------------------------------------------
// 9) UploadStationState
function TFrmTraceClient.UploadStationState(sStation: String; nState: Integer): Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('UploadStationState;%s;%d;', [sStation, nState]);
    Result := CommRead(WtStr);
end;


//------------------------------------------------------------------------------
// 10) ChangeSerial
function TFrmTraceClient.ChangeSerial(sStation, sPrevSerial, sNextSerial: String): Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('ChangeSerial;%s;%s;%s;', [sStation, sPrevSerial, sNextSerial]);
    Result := CommRead(WtStr);
end;

//------------------------------------------------------------------------------
// 11) GetStationSetup
function TFrmTraceClient.GetStationSetup(sStation: String; var sWorkOrder,
  sModelName: String): Integer;
var WtStr: String;
    RdStr, Str : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('GetStationSetup;%s;', [sStation]);
    Result := CommRead(WtStr);
    if (Result = RES_SUCCESS) then begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result

        sWorkOrder := GetToken(RdStr, ';');  // WorkOrder
        sModelName := GetToken(RdStr, ';');  // ModelName
    end;
end;

//------------------------------------------------------------------------------
// 13) SetWorkOrderPdCount
function TFrmTraceClient.SetWorkOrderPdCount(sStation, sWorkOrder, sProductCount: String): Integer;
var WtStr: String;
    RdStr, Str : String;
begin
    WtStr := Format('SetWorkOrderPdCount;%s;%s;%s;', [sStation, sWorkOrder, sProductCount]);
    Result := CommRead(WtStr);
    if (Result = RES_SUCCESS) then begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result
    end;
end;


//------------------------------------------------------------------------------
// 14) GetWorkOrderPdCount
function TFrmTraceClient.GetWorkOrderPdCount(sStation, sWorkOrder: String; var sTargetCount, sProductCount : String): Integer;
var WtStr: String;
    RdStr, Str : String;
begin
    sTargetCount  := '';
    sProductCount := '';
    WtStr := Format('GetWorkOrderPdCount;%s;%s;', [sStation, sWorkOrder]);
    Result := CommRead(WtStr);
    if (Result = RES_SUCCESS) then begin
        RdStr := RxStr;
        Str := GetToken(RdStr, ';');  // Header
        Str := GetToken(RdStr, ';');  // Length
        Str := GetToken(RdStr, ';');  // Command
        Str := GetToken(RdStr, ';');  // Station
        Str := GetToken(RdStr, ';');  // Result

        sTargetCount  := GetToken(RdStr, ';');  // TargetCount
        sProductCount := GetToken(RdStr, ';');  // ProductCount
    end;
end;

//------------------------------------------------------------------------------
// 15) ChangeModelCode
function TFrmTraceClient.ChangeModelName(sStation, sSerial, sModelName: String): Integer;
var WtStr : String;
begin
    if sStation = '' then sStation := Ed_Station.Text;

    WtStr := Format('ChangeModelName;%s;%s;%s;', [sStation, sSerial, sModelName]);
    Result := CommRead(WtStr);
end;



procedure TFrmTraceClient.TimerTimer(Sender: TObject);
begin
    Timer.Enabled := False;

    if ClientSocket.Active then
        StatusBar.Panels[0].Text := Format('Connected (%s)', [MakeElapseTimeStr(ConnectedTime, Now)]);
    Timer.Enabled := True;

end;


procedure TFrmTraceClient.LOGLISTCLEAR1Click(Sender: TObject);
begin
    ListBoxLog.Clear;
end;

procedure TFrmTraceClient.TimerConnectTimer(Sender: TObject);
begin
    TimerConnect.Enabled := False;

    if not (cbAutoConnect.Checked) then
    begin
        TimerConnect.Enabled := True;
        Exit;
    end;

    if (ConnectState = cs_Disconnect) then
        CommConnect(True);

    if (ConnectState = cs_Connecting) then
    begin
        if (GetTickCountEx - fConnectingTime) > 5000 then
        begin
            CommConnect(False);
            ConnectState := cs_Disconnect;
        end;
    end;

    TimerConnect.Enabled := cbAutoConnect.Checked;
end;

procedure TFrmTraceClient.SendTestMessage();
begin
 //   if CheckBox1.Checked then
end;

procedure TFrmTraceClient.CheckBox1Click(Sender: TObject);
begin
    if Not CheckBox1.Checked then exit; 
    nSerial := StrToIntDef(Edit3.text,0);
    nErrorCount := 0;
    Timer1.Interval := StrToIntDef(Edit1.Text,1000);
    Timer1.Enabled  := True;

end;

procedure TFrmTraceClient.Timer1Timer(Sender: TObject);

function GetDataCount(Param, Str:String):Integer;
var i : Integer;
begin
    Result := 0;
    for i:=1 to Length(Param) do
    begin
        if Param[i] = Str then
        begin
            Result := Result + 1;
        end;
    end;
end;

var sSendData : String;
    nRet, nTestResult : Integer;
    bResult : Boolean; // 양품시에만 시리얼을 증가시키기 위한 변수
    bCreate : Boolean;
    sModelCode, sState : String;
    nDataCount : Integer;
begin
    Timer1.Enabled := False;

    try
        bCreate := False;
        bResult := True;
        Cb_Cmd.ItemIndex := 4;
        nTestResult := Random(4);
        if nTestResult in [1,2,3] then nTestResult := 1; // 양품의 확률을 높인다.

        Edit4.text := Format('%s%0.10d',[Edit2.text, nSerial]);
        with ValueListEditor do
        begin
            Values['STATION']   := Ed_Station.Text;
            Values['MODELCODE'] := '010.123-456';
            Values['SERIAL']    := Edit4.text;
            Values['RESULT']    := IntToStr(nTestResult);
            Values['TESTTIME']  := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
            Values['CYCLETIME'] := IntToStr(Random(100));
            Values['DATACOUNT'] := IntToStr(GetDataCount(EditSendData.text, '|'));
            Values['DATALIST']  := EditSendData.Text;

            if Values['STATION'] = '5000' then
            begin
                nRet :=  CheckSNInfo(Values['STATION'],
                                     Values['SERIAL'],
                                     sModelCode,
                                     sState);

                if nRet = RES_SERIAL_NOT_FOUND then
                begin
                    Values['RESULT'] := '1';   // Create 에서는 양품으로 만든다.
                    nRet :=  CreateSerial( Values['STATION'],
                                           Values['SERIAL'],
                                           Values['RESULT'],
                                           Values['MODELCODE'],
                                           StrToTraceDateTime(Values['TESTTIME']),
                                           StrToIntDef(Values['CYCLETIME'],
                                           0));
                    if nRet < 0 then
                        bResult := False
                    else bCreate := true;
                end;
            end
            else
            begin    // 이전공정체크
                nRet :=  CheckSNState( Values['STATION'],
                                       Values['SERIAL']);

                if Not cbFrontCheck.Checked then
                begin
                    if nRet < 0 then
                    begin
                        bResult := False;
                    end;
                end;
            end;

            // UploadStateAndResult
            if (Values['STATION'] <> '5000') and bResult then
            //if bResult then
            begin
                if bCreate then  Values['RESULT'] := '1';  // 초기공정은 무조건 합격으로 하자.

                nRet := UploadStateAndResult(Values['STATION'],
                                             Values['SERIAL'],
                                             Values['RESULT'],
                                             Values['DATALIST'],
                                             StrToTraceDateTime(Values['TESTTIME']),
                                             StrToIntDef(Values['CYCLETIME'],0),
                                             StrToIntDef(Values['DATACOUNT'],0)
                                             );


                if nRet < 0 then
                begin
                    bResult := False;
                end;
            end;
        end;

        if (Ed_Station.Text = '5000') then
        begin
            if (bCreate) then
            begin
                Inc(nSerial);
            end;
        end
        else
        begin
            if (bResult) and (nTestResult = 1) then
            begin
                Inc(nSerial);
            end;
        end;

    except
        ///
    end;

    Timer1.Enabled := CheckBox1.Checked;
end;

end.


