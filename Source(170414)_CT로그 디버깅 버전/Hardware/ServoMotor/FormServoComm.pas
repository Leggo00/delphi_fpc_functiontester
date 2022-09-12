unit FormServoComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ZINICtrl, ComDrv32, StdCtrls, ExtCtrls, Buttons,
  DPBLabel, Spin;

type
  TFrmServoComm = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Combo_CommPort: ZIniComboBox;
    Label12: TLabel;
    MemoTx: TMemo;
    Label4: TLabel;
    MemoRx: TMemo;
    Comm: TCommPortDriver;
    INI: ZIniData;
    GroupBox1: TGroupBox;
    Edit_Position: TEdit;
    Edit_Speed: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnConnect: TButton;
    BtnClose: TButton;
    BtnSetPos: TButton;
    BtnGetPos: TButton;
    SpeedButton2: TButton;
    SpeedButton6: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    edtRpm: ZIniSpinEdit;
    Button4: TButton;
    Button5: TButton;
    edtRpmFactor: ZIniEdit;
    Label5: TLabel;
    SpeedButton4: TButton;
    SpeedButton1: TButton;
    SpeedButton3: TButton;
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSetPosClick(Sender: TObject);
    procedure BtnGetPosClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    bReceiveOK : Boolean;
    ReceiveStr : String;
    function SendCommand(Command : String; bWait : Boolean) : Boolean;
    function GetRpmConstant(iRpm: integer) : integer;
  public
    { Public declarations }
    function  CommConnect(bFlag : Boolean) : Boolean;
    procedure CommClear();

    procedure SetMotorOnOff(bOnOff : Boolean);
//    function  SetPosition(fAngle : Double; nSpeed : Integer) : Boolean;

    function SetSpeed(nSpeed : Integer) : Boolean;
    function SetPosition(fAngle : Double) : Boolean;
    function MoveMotor(nPos, nSpeed : Integer) : Boolean;

    function  SetHome()  : Boolean;
    function  SetStop()  : Boolean;
    function  SetReset() : Boolean;
    function  SetZeroPos() : Boolean;
    function  GetPosition() : Integer;
    function  GetState() : Integer;

    function JogForward(nRpm: integer) : Boolean;
    function JogReverse(nRpm: integer) : Boolean;

    procedure MoveServo(fAngle: double);

  end;


const
    SERVO_OFF        = 0;
    SERVO_RUN        = 1;
    SERVO_STOP       = 2;
    SERVO_HOME       = 3;
    SERVO_MANUAL     = 4;
    SERVO_READY      = 5;
    SERVO_STOP_HOME  = 6;
    SERVO_JOG_MANUAL = 7;
    SERVO_ERROR      = 8;

//    SERVO_SPEED      = 25;
    SERVO_SPEED      = 5;

    MOTOR_FACTOR = 2048 / 360;

//var
//  FrmServoComm: TFrmServoComm;

implementation

uses GenUtils;

{$R *.dfm}

function TFrmServoComm.CommConnect(bFlag : Boolean) : Boolean;
begin
    Comm.Disconnect;

    if (bFlag) then
    begin
        Comm.ComPort := Combo_CommPort.ItemIndex + 1;
        Comm.Connect;
    end;
    Result := Comm.Connected;

    if Result then
       BtnConnect.Caption := '해제'
    else
       BtnConnect.Caption := '연결';

    MemoTx.Clear;
    MemoRx.Clear;
end;

procedure TFrmServoComm.CommClear();
begin
    Comm.FlushBuffers(True, True);
    MemoTx.Text := '';
    MemoRx.Text := '';

    ReceiveStr := '';  
end;

function TFrmServoComm.SendCommand(Command : String; bWait : Boolean) : Boolean;
var ReadLen : Integer;
    nTime : Integer;
begin
    Result := False;
    if not Comm.Connected then
        CommConnect(True);

    CommClear();

    ReceiveStr := '';

    Comm.FlushBuffers(True, True);  // 기존데이터를 제거하고. 응답받을준비를 한다.
    Comm.ContinuePolling;

    Comm.SendString(Command + CRLF);

    MemoTx.Lines.Text := Command;

    bReceiveOK := True;
    if bWait then
    begin
        nTime := GetTickCount();
        while (GetTickCount() - nTime < 1000) do begin
            if not bReceiveOK then begin
                Result := True;
                break;
            end;
            Application.ProcessMessages();
            Sleep(1);   // <- CPU로드를 줄인다..
        end;
        bReceiveOK := False;
    end;
    // 통신요청이 끝나면 노이즈때문에 프로그램 부하를 줄이기 위해 Polling중지..
    Comm.PausePolling;    
end;


procedure TFrmServoComm.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    ReceiveStr := ReceiveStr + StrPas(DataPtr);

    if Pos(CRLF, ReceiveStr) > 0 then
    begin
        //MemoRx.Text := ReceiveStr;
        bReceiveOK  := False;
    end;
end;

function TFrmServoComm.SetSpeed(nSpeed : Integer) : Boolean;
begin
    Result := False;

    SendCommand(Format('0SPD%.8d', [nSpeed * SERVO_SPEED]), False);

    Result := True;
end;

function TFrmServoComm.SetPosition(fAngle : Double) : Boolean;
var nPos : Integer;
begin
    Result := False;

    nPos := Round(fAngle * MOTOR_FACTOR);
    SendCommand(Format('0STI%.8d', [nPos]), False);

    Result := True;
end;

function TFrmServoComm.MoveMotor(nPos, nSpeed : Integer) : Boolean;
begin
    Result := True;
    if not SendCommand(Format('0SPD%.8d', [nSpeed]), True) then Result := False;
    if not SendCommand(Format('0STI%.8d', [nPos  ]), True) then Result := False;
end;

procedure TFrmServoComm.SetMotorOnOff(bOnOff : Boolean);
var Param : String;
begin
    if bOnOff then Param := '0SVON'   // SERVO ON
              else Param := '0SVOFF'; // SERVO OFF

    SendCommand( Param, False);
end;
{
    FrmHardware.CommSend(1, '0HOLD' + CR)  // STOP
    FrmHardware.CommSend(1, '0PUN' + CR)   // GET MOTOR POS
}

function TFrmServoComm.GetPosition() : Integer;
var RdStr, Str : String;
    fValue: Double;
begin
    if SendCommand('0PUN', True) then
    begin
        RdStr   := ReceiveStr;
        GetToken(RdStr, '0PUN=');
        Str     := GetToken(RdStr, CRLF);
        fValue  := StrToFloatDef(Str, 0);
        fValue  := fValue / MOTOR_FACTOR;
        Result  := Round(fValue);
    end else
        Result := -99999;
end;

function  TFrmServoComm.GetState() : Integer;
begin
    Result :=0;
end;

function TFrmServoComm.SetHome() : Boolean;
begin
    Result := SendCommand('0ZRN', True);
end;

function TFrmServoComm.SetStop() : Boolean;
begin
    Result := SendCommand('0HOLD', True);

    SetMotorOnOff(False);
end;

function TFrmServoComm.SetReset() : Boolean;
begin
    Result := SendCommand('0RES', True);
end;

function TFrmServoComm.SetZeroPos() : Boolean;
begin
    Result := SendCommand('0ZSET00000000', True);
end;

procedure TFrmServoComm.BtnConnectClick(Sender: TObject);
begin
    CommConnect(not Comm.Connected);
end;

procedure TFrmServoComm.BtnCloseClick(Sender: TObject);
begin
//    SetMotorOnOff(False);
    Close();
end;

procedure TFrmServoComm.FormCreate(Sender: TObject);
begin
    INI.LoadData;
end;

procedure TFrmServoComm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmServoComm.BtnSetPosClick(Sender: TObject);
var nSpeed : Integer;
    fAngle : Double;
begin
    fAngle  := StrToFloatDef(Edit_Position.Text, 0);
    nSpeed  := StrToIntDef(Edit_Speed.Text, 0);
    SetSpeed(nSpeed);
    SetPosition(fAngle);
end;

procedure TFrmServoComm.MoveServo(fAngle: double);
var nSpeed : Integer;
begin
//    fAngle  := StrToFloatDef(Edit_Position.Text, 0);
    nSpeed  := StrToIntDef(Edit_Speed.Text, 0);
    SetSpeed(nSpeed);
    SetPosition(fAngle);
end;

procedure TFrmServoComm.BtnGetPosClick(Sender: TObject);
var fAngle : Double;
begin
    fAngle := GetPosition();
    Edit_Position.Text := FormatFloat('0.00', fAngle);
end;

procedure TFrmServoComm.SpeedButton2Click(Sender: TObject);
begin
    SetMotorOnOff(True);
end;

procedure TFrmServoComm.SpeedButton6Click(Sender: TObject);
begin
    SetMotorOnOff(False);
end;

procedure TFrmServoComm.SpeedButton4Click(Sender: TObject);
begin
    SetHome();
end;

procedure TFrmServoComm.SpeedButton1Click(Sender: TObject);
begin
    SetStop();
end;

procedure TFrmServoComm.SpeedButton3Click(Sender: TObject);
begin
    SetReset();
end;

function TFrmServoComm.GetRpmConstant(iRpm: integer) : integer;
//const
//    RPM100 = 205;
var
    fFactor: double;
begin
    fFactor := StrToFloatDef(edtRpmFactor.Text, 100);
    Result := Round(RescaleData(0, 100, 0, fFactor, iRpm));
end;

function TFrmServoComm.JogForward(nRpm: integer) : Boolean;
var
    sCommand: string;
begin
    if nRpm = 0 then
    begin
        SetStop;
        exit;
    end;

    SetMotorOnOff(False);
    SetMotorOnOff(True);

    sCommand := Format('0JOGP%.8d', [GetRpmConstant(nRpm)]);
    Result := SendCommand(sCommand, True);
end;

function TFrmServoComm.JogReverse(nRpm: integer) : Boolean;
var
    sCommand: string;
begin
    if nRpm = 0 then
    begin
        SetStop;    
        exit;
    end;

    SetMotorOnOff(False);
    SetMotorOnOff(True);

    sCommand := Format('0JOGN%.8d', [GetRpmConstant(nRpm)]);
    Result := SendCommand(sCommand, True);
end;

procedure TFrmServoComm.Button1Click(Sender: TObject);
begin
    JogForward(StrToIntDef(edtRpm.Text, 100));
end;

procedure TFrmServoComm.Button2Click(Sender: TObject);
begin
    JogReverse(StrToIntDef(edtRpm.Text, 100));
end;

end.
