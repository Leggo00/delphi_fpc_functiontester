unit FormClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AMLed, StdCtrls, DPBLabel, ExtCtrls,
  ComCtrls, ZINICtrl, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient;

type
  TFrmClient = class(TForm)
    Panel5: TPanel;
    StatusBar1: TStatusBar;
    INI: ZIniData;
    Panel3: TPanel;
    dpbLabel7: TdpbLabel;
    dpbLabel3: TdpbLabel;
    dpbLabel4: TdpbLabel;
    dpbLabel5: TdpbLabel;
    edtTacTime: TEdit;
    dpbLabel2: TdpbLabel;
    dpbLabel11: TdpbLabel;
    rbPass: TRadioButton;
    rbFail: TRadioButton;
    dpbLabel10: TdpbLabel;
    edtSerial: TEdit;
    lbLine: TdpbLabel;
    Button4: TButton;
    IdTCPClient: TIdTCPClient;
    cbLineInfo: ZIniComboBox;
    cbOperInfo: ZIniComboBox;
    cbModelInfo: ZIniComboBox;
    Button3: TButton;
    edtModelResult: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    lbProcesses: TListBox;
    dpbLabel1: TdpbLabel;
    Panel4: TPanel;
    btnConnect: TButton;
    btnDisConnect: TButton;
    btnDBSet: TButton;
    btnClear: TButton;
    Button2: TButton;
    LedPass: TLed;
    LedFail: TLed;
    LedACK: TLed;
    LedNAK: TLed;
    Button1: TButton;
    dpbLabel6: TdpbLabel;
    cbSendModel: ZIniCheckBox;
    //procedure CSocketDataAvailable(Sender: TObject; Error: Word);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cbLineInfoChange(Sender: TObject);
    procedure btnDisConnectClick(Sender: TObject);
    procedure IdTCPClientConnected(Sender: TObject);
    procedure IdTCPClientDisconnected(Sender: TObject);
    procedure btnDBSetClick(Sender: TObject);
  private
//    function ConnectServer(addr: String; nPort:Integer): Boolean;
    procedure ResetForm;
    procedure LockControls(ALock: Boolean);
    function StartClient: Boolean;
    procedure DisplayInfo;
    function ResultCheck(RdStr: String): String;
    function FindResult: String;
    { Private declarations }
  public
    { Public declarations }
    function SendMessage(Header, sOper, sSerial, sModel, sReslut,
      sTacTime: String): String;
    function MD_TraceRead(sHeader, sSerial, sResult, ModelNo : String):String;
  end;

var
  FrmClient: TFrmClient;

implementation

uses UnitFunction, GenUtils, TraceGrobal, FormDBConnect, IbDataModule;

{$R *.dfm}

procedure TFrmClient.FormCreate(Sender: TObject);
begin
    LoadDBINI;
    btnConnectClick(Nil);
    if IbDM.IBDatabase.Connected then DisplayInfo;
    INI.LoadData;
    StatusBar1.Panels[3].Text := 'SW Ver.'+ FormatDateTime('YYMMDDHH',FileDateToDateTime(FileAge(Application.ExeName)))+'  ';
end;

procedure TFrmClient.DisplayInfo;
begin
    IbDM.MakeLineInfo;   // 라인정보
    IbDM.MakeModelInfo;  // 모델정보
    IbDM.MakeOperInfo;   // 라인정보
    AddLineName(cbLineInfo, 0, False);
    AddOperName(FindLineCode(cbLineInfo.Text,1), cbOperInfo, 0, False);
    AddModelName(cbModelInfo, 0, False);

end;

procedure TFrmClient.btnConnectClick(Sender: TObject);
begin
    if StartClient then IbDM.DBConnect(DBConfig.HostName, DBConfig.Database);
    if IbDM.IBDatabase.Connected then DisplayInfo;
end;

function TFrmClient.StartClient:Boolean;
begin
    Result := True;
    lbProcesses.Items.Clear;
    
    with IdTCPClient do
    begin
        Host := DBConfig.HostName;
        Port := StrTointDef(DBConfig.Port,6010);
        try
            Connect(1000); // add a timeout here if you wish, eg: Connect(3000) = timeout after 3 seconds.
            btnConnect.Enabled := false;
            btnDisconnect.Enabled := true;
            StatusBar1.Panels[0].Text := ' [ '+ DBConfig.Port + '] 서버접속완료...';
        except on E : Exception do
            begin
                LockControls(True);
                ShowMessage(E.Message);
            end;
        end;
    end;

end;

procedure TFrmClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;


function TFrmClient.MD_TraceRead(sHeader, sSerial, sResult, ModelNo : String):String;
var sOper, sModel : String;
begin
    if (sHeader <> 'CHECK') and (sHeader <> 'TEST') and (sHeader <> 'MODEL') then
    begin
        Result := '';
        exit;
    end;

    // 서버로 데이타 전송시 모델코드가 있다면 그대로 전송
    if ModelNo <> '' then  sModel :=  ModelNo
    else // 받아온 모델코드가 없다면 모델전송 체크유무에 따라서 모델코드값을 전송한다.
    begin
        if cbSendModel.Checked then sModel := FindModelCode(cbModelInfo.Text,1)
        else sModel := '';
    end;

    sOper := '';
    if sHeader <> 'MODEL' then
        sOper := FindOperCode(cbOperInfo.Text,FindLineCode(cbLineInfo.Text,1),1);

    Result := SendMessage(sHeader,
                          sOper,
                          sSerial,
                          sModel,
                          sResult,
                          '');
end;

// 메세지 전송
// EX) 'TEST','공정코드','시리얼번호','모델코드','PASS' or 'FAIL', '테스트시간'

function TFrmClient.SendMessage(Header,sOper,sSerial,sModel,sReslut,sTacTime:String):String;
var SendMsg, RdStr : String;
begin
    ResetForm;

    Result := '';

    // 테스트 결과 전송
    if Header = 'TEST' then
    SendMsg := 'C:TEST:' +
               sOper + ':' +
               FormatDateTime('YYYYMMDDHHNNSS',now) + ':' +
               sTacTime + ':' +
               sSerial + ':'+
               sReslut + ':'+
               sModel + ':' + ':';

    // 이전공정 체크
    if Header = 'CHECK' then
    SendMsg := 'C:CHECK:' +
               sOper + ':' +
               sSerial + ':'+
               sModel;

    // 모델체크
    if Header = 'MODEL' then
    SendMsg := 'C:MODEL:' +
               '' + ':' +
               sSerial + ':';


    try
        // 접속이 끊어져 있다면 다시 접속
        if Not IdTCPClient.Connected then StartClient;

        if IdTCPClient.Connected then
        begin
            IdTCPClient.WriteLn(SendMsg);
            AddMsg(lbProcesses, SendMsg);
            RdStr := IdTCPClient.ReadLn(CRLF, 1000);  // 시간초과. 기다린다.
            Result := ResultCheck(RdStr);
        end;

    except on E : Exception do
        begin
            LockControls(True);
         //   WriteDebugStr(E.Message);
        end;
    end;

end;


// 요청메세지에 대한 결과리턴
function TFrmClient.ResultCheck(RdStr:String):String;
var
    Header: String;
begin
    RdStr := GetToKen(RdStr,CRLF);
    AddMsg(lbProcesses, RdStr);
    GetToKen(RdStr,':');
    Header := GetToKen(RdStr,':');

    if Header = 'MODEL' then edtModelResult.Text := RdStr
    else if Header = 'CHECK' then
    begin
        GetToKen(RdStr,':');
        GetToKen(RdStr,':');
        if RdStr = 'PASS' then LedPass.LedOn := True
        else if RdStr = 'FAIL' then LedFail.LedOn := True;
    end
    else if Header = 'TEST' then
    begin
        GetToKen(RdStr,':');
        if RdStr = 'ACK' then LedACK.LedOn := True
        else if RdStr = 'NAK' then LedNAK.LedOn := True;
    end;
    Result := RdStr;
end;

//
function TFrmClient.FindResult:String;
begin
    if rbPass.Checked then Result := 'PASS'
    else Result := 'FAIL';
end;

// 이전공정확인
procedure TFrmClient.Button1Click(Sender: TObject);
var sResult, sModel : String;
begin
    if rbPass.Checked then sResult := 'PASS'
    else sResult := 'FAIL';

    sModel := '';
    if cbSendModel.Checked then sModel := FindModelCode(cbModelInfo.Text,1);

    SendMessage('CHECK' ,
                FindOperCode(cbOperInfo.Text,FindLineCode(cbLineInfo.Text,1),1),
                edtSerial.Text,
                sModel,
                sResult,
                edtTacTime.Text);

end;


procedure TFrmClient.btnClearClick(Sender: TObject);
begin
    lbProcesses.Clear;
end;


procedure TFrmClient.ResetForm;
begin
    LedACK.LedON := False;
    LedNAK.LedON := False;
    LedPASS.LedON := False;
    LedFAIL.LedON := False;
    edtModelResult.Text := '';
end;

// 테스트결과전송
procedure TFrmClient.Button2Click(Sender: TObject);
var sResult, sModel : String;
begin
    if rbPass.Checked then sResult := 'PASS'
    else sResult := 'FAIL';

    sModel := '';
    if cbSendModel.Checked then sModel := FindModelCode(cbModelInfo.Text,1);

    SendMessage('TEST' ,
                FindOperCode(cbOperInfo.Text,FindLineCode(cbLineInfo.Text,1),1),
                edtSerial.Text,
                sModel,
                sResult,
                edtTacTime.Text);

end;


// 모델정보요청
procedure TFrmClient.Button3Click(Sender: TObject);
begin
    SendMessage('MODEL' ,cbOperInfo.Text, edtSerial.Text, cbModelInfo.Text, '', edtTacTime.Text);
end;

procedure TFrmClient.Button4Click(Sender: TObject);
begin
    INI.SaveData;
end;

procedure TFrmClient.cbLineInfoChange(Sender: TObject);
begin
    AddOperName(FindLineCode(cbLineInfo.Text,1), cbOperInfo, 0, False);
end;

procedure TFrmClient.btnDisConnectClick(Sender: TObject);
begin
    try
        if IdTCPClient.Connected then IdTCPClient.Disconnect; // we can disconnect from either the server or the client side
        btnConnect.Enabled := true;
        btnDisconnect.Enabled := false;
    except on E : Exception do
        //ShowMessage(E.Message);
    end;
    StatusBar1.Panels[0].Text := ' [ '+ DBConfig.Port + '] 서버접속해제';
end;

procedure TFrmClient.IdTCPClientConnected(Sender: TObject);
var
    LString : String;
begin
    LString := IdTCPClient.ReadLn;
    lbProcesses.Items.Insert(0,'Connected to remote server');
    lbProcesses.Items.Insert(0,'Server said -> ' + LString);
    LockControls(true);

end;

procedure TFrmClient.IdTCPClientDisconnected(Sender: TObject);
begin
    lbProcesses.Items.Insert(0,'Disconnected from remote server');
    LockControls(false);
end;

// 특정 Tag 의 컴포넌트를 Lock
procedure TFrmClient.LockControls(ALock: Boolean);
var
    i : integer;
begin
    for i := 0 to componentcount-1 do
        if TControl(Components[i]).Tag = 99 then
            TControl(Components[i]).Enabled := ALock;
end;

procedure TFrmClient.btnDBSetClick(Sender: TObject);
begin
    FrmDBConnect.Show;
end;

end.
