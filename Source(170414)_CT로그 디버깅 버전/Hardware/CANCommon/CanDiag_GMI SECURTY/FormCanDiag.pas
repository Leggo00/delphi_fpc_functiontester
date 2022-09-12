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
  uCanDiag;
const
    POSITIVE_RES =  1;
    NEGATIVE_RES =  0;
    NO_RESPONSE  = -1;

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
    GroupBox2: TGroupBox;
    BtnStartDiag: TSpeedButton;
    BtnTesterPresent: TSpeedButton;
    StatusBar: TStatusBar;
    Edit_TxLen: ZIniEdit;
    Edit_RxLen: ZIniEdit;
    Label7: TLabel;
    BtnStopDiag: TSpeedButton;
    BtnSendCommand: TSpeedButton;
    CheckBox_VIewAll: TCheckBox;
    Edit_StartDiag: ZIniEdit;
    Edit_StopDiag: ZIniEdit;
    Edit_Present: ZIniEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo: TMemo;
    BtnSecurity: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Edit_ReadID: ZIniEdit;
    Cb_SendTestPresent: ZIniCheckBox;
    BtnGmvSec: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendCommandClick(Sender: TObject);
    procedure BtnStartDiagClick(Sender: TObject);
    procedure BtnTesterPresentClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnStopDiagClick(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnGmvSecClick(Sender: TObject);
  private
    bConnected  : Boolean;
    ConnectTime : TDateTime;
    nLastSendTime : Integer;

    procedure AddLog(Msg: String);
    { Private declarations }
  public
    { Public declarations }
    CanDiag : TCanDiag;

    function  StartDiag : Boolean;
    function  StopDiag  : Boolean;
    function  SendDiag(Param : String) : Integer;
    function  SetID(TxID, RxID : Integer) : Boolean;
  end;

var
  FrmCanDiag: TFrmCanDiag;

implementation

uses
    GenUtils;
{$R *.dfm}

function TFrmCanDiag.StartDiag() : Boolean;
var MsgStr : String;
begin
    Result := False;

    CanDiag.TxID := HexToIntDef(Edit_TxID.Text, 0);
    CanDiag.RxID := HexToIntDef(Edit_RxID.Text, 0);

    if (Visible) then Memo.Lines.Clear;

    if SendDiag(Edit_StartDiag.Text) > 0 then
    begin
        Timer.Enabled := True;
        bConnected    := True;
        ConnectTime   := Now;
        nLastSendTime := GetTickCount;
        Cb_SendTestPresent.Checked := True;
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

function TFrmCanDiag.StopDiag() : Boolean;
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
end;

procedure TFrmCanDiag.FormDestroy(Sender: TObject);
begin
    CanDiag.Free;
end;




procedure TFrmCanDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    BtnStopDiagClick(Sender);

    INI.SaveData;
end;

procedure TFrmCanDiag.AddLog(Msg : String);
var WtStr : String;
    List  : TStrings;
begin
    if (Visible) and (Timer.Tag = 0) then
    begin
        if Memo.Lines.Count > 1000 then Memo.Lines.Delete(0);
        Memo.Lines.Add(Msg);
    end;
end;

//------------------------------------------------------------------------------
function TFrmCanDiag.SendDiag(Param : String) : Integer;
var nRetry : Integer;
begin
    nLastSendTime := GetTickCount;

    // 3회 반복하여..
    for nRetry := 1 to 3 do
    begin
        Result := CanDiag.Send(Param);

        if (Visible) then
        begin
            Memo.Lines.Append( CanDiag.FResultStr.Text );
        end;

        if Result >= 0 then break;
    end;
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
   // if not Cb_ViewTestPresent.Checked then Timer.Tag := 1;
   Timer.Tag := 1;

    SendStr := Trim(Edit_Present.Text);
    if SendStr <> '' then
    begin
        // 통신 에러에 대비하여 2번 시도한다.
//        for nRetry := 1 to 2 do begin
            bConnected := (SendDiag(SendStr) >= 0);
//            if bConnected then break;
//        end;

        // 응답이 안된경우.
        if not bConnected then begin
            StatusBar.Panels[0].Text := 'DISCONNECT';

            Timer.Enabled := False;
        end;
        Cb_SendTestPresent.Checked := False;
    end;
    Timer.Tag := 0;
end;


procedure TFrmCanDiag.TimerTimer(Sender: TObject);
const
    PRESENT_INTERVAL = 3000;

var nElapseTime : Integer;
begin
    Timer.Enabled := False;

    if bConnected then begin
        nElapseTime := GetTickCount - nLastSendTime;
        StatusBar.Panels[1].Text := Format('%3.1f / %3.1f', [ nElapseTime / 1000, PRESENT_INTERVAL / 1000 ]);
        if (nElapseTime > PRESENT_INTERVAL) and (Cb_SendTestPresent.Checked) then
            BtnTesterPresentClick(Sender);

        StatusBar.Panels[0].Text := 'CONNECTED';
        StatusBar.Panels[2].Text := MakeElapseTimeStr(ConnectTime,  Now);
    end else
        StatusBar.Panels[0].Text := 'DISCONNECT';

    Timer.Enabled := bConnected;
end;

procedure TFrmCanDiag.BtnSecurityClick(Sender: TObject);
begin
    SendDiag('27 03');
    SendDiag('27 04 ED CB A9 87');
end;

procedure TFrmCanDiag.SpeedButton1Click(Sender: TObject);
begin
    Memo.Lines.Clear;
    SendDiag(Edit_ReadID.Text);
end;

procedure TFrmCanDiag.BtnGmvSecClick(Sender: TObject);
var sData,sGetdata : String;
    fGetData, fKey : Double;
    nKey : Integer;
    sSeed, sSeed1, sSeed2, sKey, sTemp, sKey1, sKey2 : String;
begin
    SendDiag('27 FB');
    sData :=  FrmCanDiag.CanDiag.GetRxStr(sm_Hex , 1, 5);
    Edit1.Text := sData;
    GetToken(sdata, ' ');
    GetToken(sdata, ' ');
    sSeed1 := GetToken(sdata, ' ');
    sSeed2 := sData;

    sSeed    := sSeed1 + sSeed2;
    fGetData := HexToIntDef(sSeed, 0);
    fKey     := (fGetData/ 20) + 3;
    nKey     := Trunc(fKey);

    sTemp  := IntToHex(nKey, 4);
    Edit2.Text := sTemp;
    sKey1 := Copy(sTemp, 1,2);
    sKey2 := Copy(sTemp, 3,2);
    sKey  := sKey1 + ' ' + sKey2;
    Edit3.Text := skey;
    Delay(50, True);
    SendDiag('27 FC ' + skey );

end;

end.


