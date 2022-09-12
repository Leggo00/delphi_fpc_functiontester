unit FormTempSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  DPBLabel, Spin, Math, FormDevice;

type
  TFrmTempSensor = class(TFrmDevice)
    Panel1: TPanel;
    INI: ZIniData;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StatusBar: TStatusBar;
    BtnInit: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Comm: TCommPortDriver;
    Label2: TLabel;
    CmbComport: ZIniComboBox;
    Edit_Send: ZIniEdit;
    BtnSend: TBitBtn;
    BtnClear: TSpeedButton;
    MemoRX: TMemo;
    BitBtn1: TBitBtn;
    Lb_Temp: TdpbLabel;
    CbTempOffset: ZIniCheckBox;
    Edt_TempOffset: ZIniEdit;
    ChkRead: ZIniCheckBox;
    TimerTemp: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CbTempOffsetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChkReadClick(Sender: TObject);
    procedure TimerTempTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fTemperature : Double;

    TxStr, RxStr : String;
    ReceiveData : String;
    bWaitComm : Boolean;

    procedure AddLog(Param : String);
    function  CommWait(nTimeout : Integer = 1000) : Boolean;
  public
    { Public declarations }
    bReceive : Boolean;
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;

    function GetTempurature() : String;
  end;

var
  FrmTempSensor: TFrmTempSensor;

implementation

uses
    GenUtils;

{$R *.dfm}

const
    INVALID_VALUE = -9999;

//------------------------------------------------------------------------------
function TFrmTempSensor.DevOpen(Param: String): Integer;
var nIdx : Integer;
    sTemp, sIdx : String;
begin
    Comm.Disconnect;
    sTemp := CmbComport.Text;
    GetToken(sTemp, 'COM');
    nIdx  := StrToIntDef(sTemp, 0);
    Comm.ComPort := nIdx;
    //Comm.ComPort := CmbComport.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmTempSensor.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmTempSensor.DevInit(Param: String): Integer;
var i : Integer;
    RdStr : String;
begin
    Comm.FlushBuffers(True, True);
    MemoRX.Clear;
end;
//------------------------------------------------------------------------------
function TFrmTempSensor.DevRead(Param: String): String;
var
    nTemp, nOffset, i : integer;
    fTime : double;
begin
    if not Comm.Connect then exit;
    Lb_Temp.Caption := '';

    for i := 1 to 3 do
    begin
        if (Param <> '') then begin
            DevSend(Param);
            fTime := GetTickCountEx;
            //CommWait(3000);
        end;
        while True do
        begin
            Application.ProcessMessages;
            if (GetTickCountEx - fTime) < 35000 then
            begin
                if (bReceive) and (Lb_Temp.Caption <> 'N/A') then
                    break;
            end;

        end;
        if ((Lb_Temp.Caption <> 'N/A') and (Lb_Temp.Caption <> '')) then break;
    end;
    Result := Lb_Temp.Caption;
end;

//------------------------------------------------------------------------------
function TFrmTempSensor.DevSend(Param: String): Integer;
begin
    bWaitComm := True;

    TxStr := Param;
    RxStr := '';
    ReceiveData := '';

    if Comm.Connected then
    begin
        AddLog('> ' + TxStr);
        Param := Param + CRLF;
        bReceive := False;
        Comm.SendData( PChar(Param), Length(Param) );
        Delay(50, True);
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================


procedure TFrmTempSensor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmTempSensor.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := Trim(UpperCase( Edit_Send.Text ));
    if SendMsg = '' then exit;

    DevSend( SendMsg );
end;

procedure TFrmTempSensor.SpeedButton1Click(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmTempSensor.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;

procedure TFrmTempSensor.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;

procedure TFrmTempSensor.BtnInitClick(Sender: TObject);
begin
    DevInit('');
end;

procedure TFrmTempSensor.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrmTempSensor.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrmTempSensor.CommWait(nTimeout : Integer = 1000) : Boolean;
var fTime : Double;
begin
    fTime := GetTickCountEX;
    while (GetTickCountEX - fTime < nTimeOut) do begin
        if (not bWaitComm) then begin
            Result := True;
            exit;
        end;
        Application.ProcessMessages;
    end;
end;

procedure TFrmTempSensor.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var Str : String;
    fTemp, fOffset : Double;

begin
    RxStr := RxStr + StrPas(DataPtr);

    while Pos(CRLF, RxStr ) > 0 do
    begin
        bWaitComm := False;

        ReceiveData := GetToken(RxStr, CRLF);
        AddLog('< ' + ReceiveData);

        // 앞의 헤더를 비교한다.
        if (Length(ReceiveData) < 2) or (ReceiveData[1] <> '!') then continue;

        if (ReceiveData[2] = 'T') then
        begin

            Str := Copy(ReceiveData, 3, Length(ReceiveData)-2);

            fTemperature := StrToFloatDef(Str, -9999);
            if fTemperature <> -9999 then
            begin
                if CbTempOffset.Checked then
                begin
                    fTemp   := fTemperature;
                    fOffset := StrToFloatDef(Edt_TempOffset.Text, 0);

                    fTemperature := fTemp + fOffset;

                    Lb_Temp.Caption := FormatFloat('0.00', fTemperature);
                end else
                begin
                    Lb_Temp.Caption := FormatFloat('0.00', fTemperature);
                end;
                bReceive := True;
            end else
                Lb_Temp.Caption := 'N/A';
        end;
    end;
end;


procedure TFrmTempSensor.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmTempSensor.FormCreate(Sender: TObject);
var i : Integer;
begin
    bReceive := False;
    CmbComport.Items.Clear;
    for i:= 1 to 24 do begin
        CmbComport.Items.Add( Format('COM%d', [i]));
    end;

    INI.LoadData;

    DevOpen('');
   // DevInit('');
end;

procedure TFrmTempSensor.BitBtn1Click(Sender: TObject);
begin
    inherited;
    DevRead('?T');
end;

function TFrmTempSensor.GetTempurature: String;
var Param : String;
begin
    if Comm.Connected then
    begin
        AddLog('> ' + TxStr);
        Param := '?T' + CRLF;
        bReceive := False;
        Comm.SendData( PChar(Param), Length(Param) );
        Delay(200, True);
    end;

    Result := Lb_Temp.Caption;
end;

procedure TFrmTempSensor.CbTempOffsetClick(Sender: TObject);
begin
  inherited;
    if CbTempOffset.Checked then
        Edt_TempOffset.Enabled := True
    else
        Edt_TempOffset.Enabled := False;
end;

procedure TFrmTempSensor.FormShow(Sender: TObject);
begin
  inherited;
    if CbTempOffset.Checked then
        Edt_TempOffset.Enabled := True
    else
        Edt_TempOffset.Enabled := False;
end;

procedure TFrmTempSensor.ChkReadClick(Sender: TObject);
begin
  inherited;

  if ChkRead.Checked then
  begin
      TimerTemp.Enabled := True;
  end else
  begin
      TimerTemp.Enabled := False;
  end;
end;

procedure TFrmTempSensor.TimerTempTimer(Sender: TObject);
begin
  inherited;
    TimerTemp.Enabled := False;
    if not ChkRead.Checked then  exit;

    DevRead('?T');

    TimerTemp.Enabled := True;
end;

procedure TFrmTempSensor.FormDestroy(Sender: TObject);
begin
    ChkRead.Checked := False;
    TimerTemp.Enabled := False;
end;

end.
