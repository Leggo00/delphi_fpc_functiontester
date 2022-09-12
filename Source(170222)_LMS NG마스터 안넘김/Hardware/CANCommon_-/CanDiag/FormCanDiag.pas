//------------------------------------------------------------------------------
//
//   CAN DIAG MODULE
//
//
//------------------------------------------------------------------------------
unit FormCanDiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, Buttons, ExtCtrls, ComCtrls, uCanUnit, SyncObjs,
  uCanDiag, Spin, Inifiles, XiButton;

type
  TFrmCanDiag = class(TForm)
    GroupBox1: TGroupBox;
    Edit_TxID: ZIniEdit;
    Edit_RxID: ZIniEdit;
    Label3: TLabel;
    Edit_TxMsg: ZIniEdit;
    Label4: TLabel;
    Edit_RxMsg: ZIniEdit;
    Label1: TLabel;
    Label2: TLabel;
    INI: ZIniData;
    Timer: TTimer;
    StatusBar: TStatusBar;
    Edit_TxLen: ZIniEdit;
    Edit_RxLen: ZIniEdit;
    Label7: TLabel;
    BtnSendCommand: TSpeedButton;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Memo: TMemo;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Edit_StartDiag: ZIniEdit;
    Edit_StopDiag: ZIniEdit;
    Edit_Present: ZIniEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Edit_PresentInterval: ZIniEdit;
    Panel2: TPanel;
    CheckBox_ViewAll: TCheckBox;
    Cb_ViewPresent: ZIniCheckBox;
    Cb_IDFilter: TCheckBox;
    BtnStartDiag: TXiButton;
    BtnStopDiag: TXiButton;
    BtnSecurity: TXiButton;
    BtnTesterPresent: TXiButton;
    BtnDiableNormalMessage: TXiButton;
    BtnClear: TXiButton;
    Label12: TLabel;
    Edit_SecurityLevel: ZIniEdit;
    TimerTestPresent: TTimer;
    Cb_UseRandomKey: ZIniCheckBox;
    Ed_LogFileName: ZIniEdit;
    Cb_SaveLog: TCheckBox;
    SpeedButton2: TSpeedButton;
    SaveDialog1: TSaveDialog;
    XiButton1: TXiButton;
    XiButton2: TXiButton;
    XiButton3: TXiButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendCommandClick(Sender: TObject);
    procedure BtnStartDiagClick(Sender: TObject);
    procedure BtnTesterPresentClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnStopDiagClick(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox_ViewAllClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cb_IDFilterClick(Sender: TObject);
    procedure BtnDiableNormalMessageClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTestPresentTimer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
    procedure XiButton2Click(Sender: TObject);
    procedure XiButton3Click(Sender: TObject);
  private
    bConnected : Boolean;
    ConnectTime : TDateTime;
    fLastSendTime : Double;

    procedure AddLog(Msg: String; bViewTime : Boolean = True);
    { Private declarations }
  public
    { Public declarations }
    CanDiag : TCanDiag;
    sErrorMessage : String;

    function  StartDiag(Param : String = '') : Boolean;
    function  StopDiag(Param : String = '')  : Boolean;
    function  SendDiag(Param : String) : Integer;
    function  SetID(TxID, RxID : Integer) : Boolean;
    function  SecurityAccess(nLevel : Integer) : Boolean;
  end;

var
  FrmCanDiag: TFrmCanDiag;

implementation

uses
    GenUtils, FormCANCom;
{$R *.dfm}

function TFrmCanDiag.StartDiag(Param : String = '') : Boolean;
var MsgStr : String;
begin
    Result := False;

    CanDiag.TxID := HexToIntDef(Edit_TxID.Text, 0);
    CanDiag.RxID := HexToIntDef(Edit_RxID.Text, 0);

    if (Visible) then Memo.Lines.Clear;

    if Param = '' then Param := Edit_StartDiag.Text;
    
    if SendDiag(Edit_StartDiag.Text) > 0 then
    begin
        Timer.Enabled := True;
        bConnected    := True;
        ConnectTime   := Now;
        fLastSendTime := GetTickCountEx;
        Result := True;
    end else
    begin
        Timer.Enabled := False;
        bConnected := False;
        Result := False;
    end;
end;

//------------------------------------------------------------------------------
// Request, Response ID변경시 필요.
function TFrmCanDiag.SetID(TxID, RxID : Integer) : Boolean;
begin
    if (TxID < 0) or (RxID < 0) then exit;

    CanDiag.TxID := TxID;
    CanDiag.RxID := RxID;

    Edit_TxID.Text := Format('%x', [TxID]);
    Edit_RxID.Text := Format('%x', [RxID]);

    Result := True;
end;

function TFrmCanDiag.StopDiag(Param : String = '') : Boolean;
begin
    Timer.Enabled := False;
    StatusBar.Panels[0].Text := 'DISCONNECT';
    StatusBar.Panels[1].Text := '';
    bConnected := False;

    Result := (SendDiag(Edit_StopDiag.Text) > 0);
end;


procedure TFrmCanDiag.FormCreate(Sender: TObject);
begin
    CanDiag := TCanDiag.Create;
    INI.LoadData;

    CanDiag.TxID := HexToIntDef(Edit_TxID.Text, 0);
    CanDiag.RxID := HexToIntDef(Edit_RxID.Text, 0);
    PageControl.ActivePageIndex := 0;

    CheckBox_ViewAllClick(Sender);
end;

procedure TFrmCanDiag.FormDestroy(Sender: TObject);
begin
    CanDiag.Free;
end;

procedure TFrmCanDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    BtnStopDiagClick(Sender);

    INI.SaveData;
end;

procedure TFrmCanDiag.AddLog(Msg : String; bViewTime : Boolean = True);
var WtStr : String;
    List  : TStrings;
begin
    // Log 기록남긴다.
    if Cb_SaveLog.Checked then
        WriteDebugStr(Msg, Ed_LogFileName.Text);
        
    if (Visible) and (Timer.Tag = 0) then
    begin
        if Memo.Lines.Count > 200 then Memo.Lines.Delete(0);
        if bViewTime then
             Msg := FormatDateTime('HH:NN:SS', Now) + ' ' + Msg;

        Memo.Lines.Add(Msg);
    end;
end;

//------------------------------------------------------------------------------
function TFrmCanDiag.SendDiag(Param : String) : Integer;
var nRetry, nRetryCount : Integer;
    i : Integer;
    TxId, RxId : Integer;
    sSendMessage : String;
begin
    // 송수신한 메시지 ID를 전달할수 있다. 2011.08.30 수정. 정성일.
    // Param = <diag Message>:<TxId>,<RxId>
    // ex) Param = 02 10:603,607

    if CanDiag = nil then exit;

    sSendMessage := GetToken(Param, ':');
    TxId := HexToIntDef(GetToken(Param, ','), -1);
    RxId := HexToIntDef(GetToken(Param, ','), -1);

    if (TxId < 0) then TxId := HexToIntDef(Edit_TxID.Text, 0);
    if (RxId < 0) then RxId := HexToIntDef(Edit_RxID.Text, 0);

    CanDiag.TxID := TxId;
    CanDiag.RxID := RxId;

    fLastSendTime := GetTickCountEx;

    // KMI CAN이 버퍼가 작아 MASK처리함. 2011-06-21
   // CanDiag.CanUnit.Open(1, 500, 'MASK='+ Edit_RxID.Text);
   
    // 반복횟수 설정..
    nRetryCount := 1;
    for nRetry := 1 to nRetryCount do
    begin
        Result := CanDiag.Send(sSendMessage);
        if (Timer.Tag = 0) {and (Visible)} then
        begin
            // 속도증가를 위해서 처리함. 2011.10.20.
            {
            for i:= 0 to CanDiag.FResultStr.Count-1 do begin
                CanDiag.FResultStr[i] := FormatDateTime('HH:NN:SS', Now) + ' ' + CanDiag.FResultStr[i];
            Memo.Lines.AddStrings(CanDiag.FResultStr);
            }
            
            Memo.Lines.BeginUpdate;
            for i := 0 to CanDiag.FResultStr.Count-1 do
                AddLog(  CanDiag.FResultStr[i] );
            Memo.Lines.EndUpdate;

            AddLog('', False); // 빈칸삽입으로 Scroll효과..
            //Memo.Lines.EndUpdate;
           // Memo.ScrollBy(0, -100);
        end;
        if Result >= 0 then break;
    end;
   // CanDiag.CanUnit.Open(1, 500, '');
end;


procedure TFrmCanDiag.BtnSendCommandClick(Sender: TObject);
begin
    SendDiag(Edit_TxMsg.Text);
end;

procedure TFrmCanDiag.BtnStartDiagClick(Sender: TObject);
begin
    BtnStartDiag.Enabled := False;
    StartDiag();
    BtnStartDiag.Enabled := True;
end;

procedure TFrmCanDiag.BtnStopDiagClick(Sender: TObject);
begin
    BtnStopDiag.Enabled := False;
    StopDiag();
    BtnStopDiag.Enabled := True;
end;

procedure TFrmCanDiag.BtnTesterPresentClick(Sender: TObject);
var nRetry : Integer;
    SendStr : String;
begin
   if not Cb_ViewPresent.Checked then Timer.Tag := 1;

    SendStr := Trim(Edit_Present.Text);
    if SendStr <> '' then
    begin
        // 통신 에러에 대비하여 2번 시도한다.
        for nRetry := 1 to 2 do begin
            bConnected := (SendDiag(SendStr) >= 0);
            if bConnected then break;
        end;

        // 응답이 안된경우.
        if not bConnected then begin
            StatusBar.Panels[0].Text := 'DISCONNECT';
            Timer.Enabled := False;
        end;
    end;
    Timer.Tag := 0;
end;


procedure TFrmCanDiag.TimerTimer(Sender: TObject);
var fElapseTime : Double;
    PresentInterval : Integer;
begin
    Timer.Enabled := False;

    PresentInterval := Trunc(StrToFloatDef(Edit_PresentInterval.Text, 0) * 1000);
    if PresentInterval <= 0 then PresentInterval := 3000;

    if bConnected then begin
        fElapseTime := GetTickCountEX - fLastSendTime;
        StatusBar.Panels[1].Text := Format('%3.1f / %3.1f', [ fElapseTime / 1000, PresentInterval / 1000 ]);
        if (fElapseTime >= PresentInterval) then
            BtnTesterPresentClick(Sender);

        StatusBar.Panels[0].Text := 'CONNECTED : ' + MakeElapseTimeStr(ConnectTime,  Now);
    end else
        StatusBar.Panels[0].Text := 'DISCONNECT';

    Timer.Enabled := bConnected;
end;

function GetSeedkey(nLevel : Integer;
       Seed1, Seed2, Seed3, Seed4 : Byte;
    var Key1, Key2, Key3, Key4 : Byte) : Boolean;
var
    Mask1, Mask2, Mask3, Mask4 : Byte;
begin
    Result := False;

    case nLevel of
        $01: begin
            Key1 := Byte(256 - Byte(Seed1 + Seed2 + Mask1));
            Key2 := Byte(256 + Seed1 - Seed2 + Mask2);
            Key3 := 0;
            Key4 := 0;
            Result := True;
        end;

        $02: begin
            Key1 := Byte(256 - Byte(Seed1 + Seed2 + Mask1));
            Key2 := Byte(256 + Seed1 - Seed2 + Mask2);
            Key3 := Byte(256 - Byte((255- Seed3) + Seed4 + Mask3));
            Key4 := Byte(256 + (255 - Seed3) - Seed4 + Mask4);
            Result := True;
        end;

        // MasterKey
        $FD : begin
            Key1 := $ED;
            Key2 := $CB;
            Key3 := $A9;
            Key4 := $87;
            Result := True;
        end;
    end;
end;


procedure TFrmCanDiag.BtnSecurityClick(Sender: TObject);
begin
    SecurityAccess(1);
end;


function TFrmCanDiag.SecurityAccess(nLevel : Integer) : Boolean;
var
    Seed : array[1..6] of Byte;
    Mask : array[1..6] of Byte;
    Key  : array[1..6] of Byte;
    i, nTemp, nSeed : integer;
    sTemp, Str, WtStr, sSeedKey, sMaskKey, sSendKey : String;
    Seed1, Seed2, Seed3 : Byte;
    IniF : TIniFile;
begin
    Result := False;

    WtStr := '10 07';// Extended Mode
    if SendDiag(WtStr) <> 1 then exit;
    //------------------------------------------------------------------SEED KEY 요청
    {// Step1) Security Seed를 요청.  Level값이이면 INI에서 읽은Default 값으로 접근.
    if nLevel <= 0 then
        nLevel   := HexToIntDef('1', $01);  // Security Level 3
    }
    WtStr := Format('27 %.2x', [1]);
    if SendDiag(WtStr) <> 1 then EXIT;
    //------------------------------------------------------------------MAKE KEY
    sTemp := Format('%.2X%.2X', [CanDiag.RxBuff[2], CanDiag.RxBuff[3]]);
    // Seed 값을 이용하여 Key값을 계산한다.
    nTemp    := HexToIntDef(Trim(sTemp), 0);
    nSeed  := ((nTemp * 20077) + 12345) xor $A5A5;
    sTemp  := IntToHex(nSeed,15);
    sSendKey := Copy(sTemp, length(sTemp) - 3, 2) + ' '+ Copy(sTemp, length(sTemp) - 1, 2);
    //------------------------------------------------------------------SEND KEY
    // Step2) Key값을 보낸다.
    WtStr := Format('27 %.2X %s', [2, sSendKey]);
    if SendDiag(WtStr) <> 1 then exit;

    sSeedKey := Format('%.2X %.2X', [CanDiag.RxBuff[2], CanDiag.RxBuff[3]]);
    AddLog('* Security Access Service');
    AddLog(Format('- Seed : %s', [ sSeedKey ]));
    AddLog(Format('- Key  : %s', [ sSendKey ]));
    AddLog('', False);

    Result := True;
end;
{


function TFrmCanDiag.SecurityAccess(nLevel : Integer) : Boolean;
var i, nSeedCount, nKeyCount : Integer;

    Seed, Mask, Key : array[0..3] of Byte;
    
    Str, WtStr, sSeedKey, sMaskKey, sSendKey : String;
    IniF : TIniFile;
begin
    IniF := TIniFile.Create(INI.IniFileName);
    try
        Str      := IniF.ReadString('DIAG', 'SecurityLevel', '');
        sSeedKey := IniF.ReadString('DIAG', 'SeedKey', '00000000');
        sMaskKey := IniF.ReadString('DIAG', 'MaskKey', '00000000');
        sSendKey := IniF.ReadString('DIAG', 'SendKey', '00000000');
    finally
        IniF.Free;
    end;

    // Step1) Security Seed를 요청.  Level값이이면 INI에서 읽은Default 값으로 접근.
    if nLevel <= 0 then
        nLevel   := HexToIntDef(Str, $FD);  // Security Level 3

    WtStr := Format('27 %.2x', [nLevel]);
    if SendDiag(WtStr) <> 1 then exit;

    // 응답메세지에서 Seed값을 가져온다.
    // TX> 27 01
    // RX> 67 01 12 34 56 78
    nSeedCount := 0;
    for i:= 0 to 3 do begin
        if (i+2 >= CanDiag.RxLen) then break;
        Seed[i] := CanDiag.RxBuff[i+2];
        Inc(nSeedCount);
    end;

    // Mask 값을 얻는다,
    Mask[0] := HexToIntDef( Copy(sSendKey, 1, 2), 0);
    Mask[1] := HexToIntDef( Copy(sSendKey, 3, 2), 0);
    Mask[2] := HexToIntDef( Copy(sSendKey, 5, 2), 0);
    Mask[3] := HexToIntDef( Copy(sSendKey, 7, 2), 0);

    if (Cb_UseRandomKey.Checked) then
    begin
        case nLevel of
            $01: begin
                Key[0] := Byte(256 - Byte(Seed[0] + Seed[1] + Mask[0]));
                Key[1] := Byte(256 + Seed[0] - Seed[1] + Mask[1]);
                Key[2] := 0;
                Key[3] := 0;
                Result := True;
            end;

            $03: begin
                Key[0] := Byte(256 - Byte(Seed[0] + Seed[1] + Mask[0]));
                Key[1] := Byte(256 + Seed[0] - Seed[1] + Mask[1]);
                Key[2] := Byte(256 - Byte((255- Seed[2]) + Seed[3] + Mask[2]));
                Key[3] := Byte(256 + (255 - Seed[2]) - Seed[3] + Mask[3]);
                Result := True;
            end;
        end;
    end else begin
        // INI에서 가져온 sSend Key값을 적용.
        nKeyCount := 0;
        for i:= 0 to 3 do begin
            Str := Copy(sSendKey, (i*2)+1, 2);
            if Length(Str) <> 2 then break;

            Key[i] := HexToIntDef(Str, 0);
            Inc(nKeyCount);
        end;
    end;

    // Step2) Key값을 보낸다.
    WtStr := Format('27 %.2x %s', [nLevel+1,  MakeHexaString(@Key[0],  nKeyCount)]);
    if SendDiag(WtStr) <> 1 then exit;

    AddLog('* Security Access Service');
    AddLog(Format('- Seed : %s', [ MakeHexaString(@Seed[0], nSeedCount) ]));
    AddLog(Format('- Key  : %s', [ MakeHexaString(@Key[0],  nKeyCount)  ]));
    AddLog('', False);
end;
 }

procedure TFrmCanDiag.CheckBox_ViewAllClick(Sender: TObject);
begin
    CanDiag.bViewAllMsg := CheckBox_ViewAll.Checked;
    Cb_IDFilter.Enabled := CheckBox_ViewAll.Checked;
end;

procedure TFrmCanDiag.SpeedButton1Click(Sender: TObject);
begin
    FrmCANCom.Show;
end;

procedure TFrmCanDiag.Cb_IDFilterClick(Sender: TObject);
begin
    CanDiag.bIDFilter := Cb_IDFilter.Checked;
end;


procedure TFrmCanDiag.BtnClearClick(Sender: TObject);
begin
    Memo.Lines.Clear;
end;

procedure TFrmCanDiag.FormShow(Sender: TObject);
begin
    Edit_TxMsg.SelectAll;
    Edit_TxMsg.SetFocus;
end;

procedure TFrmCanDiag.BtnDiableNormalMessageClick(Sender: TObject);
var CanMsg : TCanMessage;
begin
    SendDiag('10 90:7DF,7DA');  // Start Extended session.
    Delayex(100, True);
    SendDiag('28 01:7DF,7DA');  // Disable Normal Message

    // Test Present Code를 주기적으로 전송해준다. (3000초간격)
    CanMsg := StrToCanMsg('7DF=02 3E 00 55 55 55 55 55:3000');
    CanDiag.CanUnit.Send(1, CanMsg);

//    TimerTestPresent.Enabled := True;
end;

procedure TFrmCanDiag.TimerTestPresentTimer(Sender: TObject);
begin
    TimerTestPresent.Enabled := False;

    if not Cb_ViewPresent.Checked then Timer.Tag := 1;

    SendDiag('3E 00:7DF,7DA');  // TestPresnet Code

    TimerTestPresent.Enabled := True;
    Timer.Tag := 0;
end;

procedure TFrmCanDiag.SpeedButton2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then begin
        Ed_LogFileName.Text := SaveDialog1.FileName;
    end;
end;

procedure TFrmCanDiag.XiButton1Click(Sender: TObject);
begin
    SendDiag('2E 05 00 00 00');
end;

procedure TFrmCanDiag.XiButton2Click(Sender: TObject);
begin
    SendDiag('2E 05 00 01 14');
end;

procedure TFrmCanDiag.XiButton3Click(Sender: TObject);
begin
    SendDiag('2E 05 00 02 14');
end;

end.


