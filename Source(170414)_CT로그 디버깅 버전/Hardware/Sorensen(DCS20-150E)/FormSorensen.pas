unit FormSorensen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DPBLabel, Buttons, ZINICtrl, ComDrv32, ComCtrls, EdLists,
  ExtCtrls, FormDevice;

const
    MAX_COUNT = 2;

type
  TReadMode = (rmVoltage, rmCurrent);

  TFrmSorensen = class(TFrmDevice)
    chkConnectOnOff: TCheckBox;
    cmbComPort: ZIniComboBox;
    BtnSend: TBitBtn;
    BtnClear: TBitBtn;
    Label7: TLabel;
    Label6: TLabel;
    ListRx: TListBox;
    INI: ZIniData;
    Comm: TCommPortDriver;
    edtSend: TEdit;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    edtVoltage: ZIniEdit;
    Label2: TLabel;
    edtCurrent: ZIniEdit;
    Label3: TLabel;
    edtCmdList: TListBox;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TimerRead: TTimer;
    dpbLabel2: TdpbLabel;
    dpbLabel1: TdpbLabel;
    lblCurrent: TdpbLabel;
    lblVoltage: TdpbLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure chkConnectOnOffClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCmdListDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    giIndex : integer;
    gReadMode: TReadMode;
    gsReadData: string;
    procedure AddLog(Param: string);

  public
    IsReceiveCommOk : Boolean;

    procedure CommOpen(bOnOff : Boolean);
    procedure CommClose();
    procedure CommInit();
    procedure CommSend(DataStr : String);
    function  CommRead(Param : String) : String;

    procedure SetPowerOn(fVolt, fCurr: double);
    procedure SetPowerOff();


    function GetVoltage: double;
    function GetCurrent: double;
    function CommTestStart(bStartOk : Boolean) : Boolean;

    { Public declarations }
    function DevClose(Param: String): Integer;  override;
    function DevInit(Param: String): Integer;   override;
    function DevOpen(Param: String): Integer;   override;

    function DevRead(Param: String): String;    override;
    function DevSend(Param: String): Integer;   override;

  end;

var
  FrmSorensen: TFrmSorensen;

implementation

uses
    GenUtils, Math;

{$R *.DFM}


//------------------------------------------------------------------------------
function TFrmSorensen.DevOpen(Param: String): Integer;
begin
    CommOpen(True);
end;
//------------------------------------------------------------------------------
function TFrmSorensen.DevClose(Param: String): Integer;
begin
    CommClose();
end;
//------------------------------------------------------------------------------
function TFrmSorensen.DevInit(Param: String): Integer;
begin
//
end;
//------------------------------------------------------------------------------
function TFrmSorensen.DevRead(Param: String): String;
var fValue : Double;
    sRdStr : string;
begin
    sRdStr := '';
    if (Param = 'VOUT?') then Param := 'MEAS:VOLT?';  
    if (Param = 'CURR?') then Param := 'MEAS:CURR?';

    //if (Param = '1') then begin
        //fValue := Getcurrent;
        sRdStr := CommRead(Param);
        Result := sRdStr;
    //end;
end;

//------------------------------------------------------------------------------
function TFrmSorensen.DevSend(Param: String): Integer;
begin
    CommSend(Param);
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================


procedure TFrmSorensen.FormCreate(Sender: TObject);
begin
    Ini.LoadData;
    CommOpen(true);
end;

procedure TFrmSorensen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Ini.SaveData;
end;

procedure TFrmSorensen.CommOpen(bOnOff : Boolean);
var nPort, i: Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := cmbComPort.ItemIndex + 1;
    Comm.Connect;
    CommInit;

    CommSend('SYST:REM:STAT REM');

    chkConnectOnOff.Checked := True;

    if Comm.Connected then begin
        StatusBar1.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort]);
    end else begin
        StatusBar1.SimpleText := 'DISCONNECT';
    end;
end;

procedure TFrmSorensen.CommClose();
begin
    Comm.Disconnect;
    chkConnectOnOff.Checked := False;
end;

procedure TFrmSorensen.CommInit();
begin
    ListRx.Clear;
    Comm.FlushBuffers(true, true);
end;

procedure TFrmSorensen.CommSend(DataStr : String);
var Buff : array of Byte;
    Str : String;
    BuffLen : Integer;
begin
    if (not Comm.Connected) then exit;
    Comm.FlushBuffers(True, True);  // 기존데이터를 제거하고. 응답받을준비를 한다.
    Comm.ContinuePolling;

    DataStr := DataStr + CR;
    Comm.SendString(DataStr);
    Delayex(10, True);
    // 통신요청이 끝나면 노이즈때문에 프로그램 부하를 줄이기 위해 Polling중지..
    Comm.PausePolling;
end;

procedure TFrmSorensen.BtnSendClick(Sender: TObject);
begin
    CommSend(edtSend.Text);
end;

procedure TFrmSorensen.BtnClearClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmSorensen.chkConnectOnOffClick(Sender: TObject);
begin
    if chkConnectOnOff.Checked then
        CommOpen(true)
    else
        CommClose();
end;

procedure TFrmSorensen.AddLog(Param : string);
begin
    if ListRx.Items.Count > 10 then ListRx.Items.Clear;
    ListRx.Items.add(Param);
end;

procedure TFrmSorensen.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    i : Integer;
    sReadData: string;
begin
    sReadData := StrPas(DataPtr);
    if Pos(#13, sReadData) > 0 then
    begin
        gsReadData := GetToken(sReadData, #13);
        //GetToken(gsReadData, ' ');
        AddLog(gsReadData);
        if IsFloat(gsReadData) then
        begin
            case gReadMode of
                rmVoltage : lblVoltage.Caption := gsReadData;
                rmCurrent : lblCurrent.Caption := gsReadData;
            end;
        end;
        IsReceiveCommOk := True;
    end;

{
    for i := 0 to DataSize - 1 do
    begin
        if giRxCount > High(giRxCount) then exit;

        if giRxCount >= 0 then
            gRxBuffer[giRxCount] := Byte((PChar(DataPtr) + i)^);

        Inc(giRxCount);
    end;

    gsReadData := '';
    for i := 0 to giRxCount - 1 do
        gsReadData := Trim(Format('%s%s', [gsReadData, Char(gRxBuffer[i])]));

    if IsFloat(gsReadData) then
    begin
        case gReadMode of
            rmVoltage : lblVoltage.Caption := gsReadData;
            rmCurrent : lblCurrent.Caption := gsReadData;
        end;
    end;

    AddStr('<< ' + gsReadData);

    giRxCount := 0;
    gbReceiveOk := True;
}

end;

procedure TFrmSorensen.ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        BtnSendClick(Sender);
end;

function TFrmSorensen.CommRead(Param : String) : String;
const TIME_OUT = 1000;
var nTime : Integer;
    rdStr, Str : String;
begin
    Result := '';
    // EX) SPEED:00 01 02
    //rdStr := GetTokenTrim (Param, ':');

    if Param <> '' then begin
        IsReceiveCommOk := False;
        CommSend(Param);

        nTime := GetTickCount;
        while ( (GetTickCount - nTime) < TIME_OUT ) do
        begin
            if IsReceiveCommOk then Break;
            Application.ProcessMessages;
        end;
    end;

    if IsReceiveCommOk then Result := gsReadData;
    //Str := ListRx.Items.Values[rdStr];
    //Result := GetToken(Str, ' ');
end;

procedure TFrmSorensen.edtCmdListDblClick(Sender: TObject);
begin
    edtSend.Text := edtCmdList.Items[edtCmdList.ItemIndex];
    CommSend(edtSend.Text);
end;

procedure TFrmSorensen.SetPowerOff();
var
    sCommand: string;
begin
    if not Comm.Connected then exit;
    sCommand := Format('SOUR:VOLT %f', [0.0]);
    CommSend(sCommand);
    sCommand := Format('SOUR:CURR %f', [0.0]);
    CommSend(sCommand);
    CommSend('OUTP OFF');
end;

procedure TFrmSorensen.SetPowerOn(fVolt, fCurr: double);
var
    sCommand: string;
begin
    if not Comm.Connected then
    begin
        CommOpen(true);
        DelayEx(50, True);
    end;

    if fVolt = 0 then
    begin
        SetPowerOff();
        exit;
    end;

    sCommand := Format('SOUR:VOLT %f', [fVolt]);
    CommSend(sCommand);
//    DelayEx(100, True);
    sCommand := Format('SOUR:CURR %f', [fCurr]);
    CommSend(sCommand);
//    DelayEx(100, True);
    CommSend('OUTP ON');
end;

procedure TFrmSorensen.BitBtn1Click(Sender: TObject);
begin
    SetPowerOn(StrToFloatDef(edtVoltage.Text, 0), StrToFloatDef(edtCurrent.Text, 0));
end;

procedure TFrmSorensen.BitBtn2Click(Sender: TObject);
begin
    SetPowerOff();
end;

function GetValue(ValStr : String) : Double;
const
    INVALID_VALUE = -99999;
    
var
    Value : Double;
    sVal, sExp : String;
    nExp : Integer;
begin
    if not TryStrToFloat(ValStr, Result) then
        Result := 0;
    {
    // EX) Param = 0.2122E+00

    // 실수부분.
    sVal  := GetToken( ValStr, 'E');
    Value := StrToFloatDef(sVal, 0);

    // 지수부분.
    if Length(ValStr) >= 3 then
    begin
        sExp := Copy(ValStr, 2, 2);
        nExp := StrToIntDef(sExp, 0);

        if (nExp <> 0) then
            Value := Value * Power(10, nExp);
    end;

    if Value < 0     then Result := 0             else
    if Value > 99999 then Result := INVALID_VALUE else
                          Result := Value;
    }
end;

function TFrmSorensen.GetVoltage: double;
begin
    Result := GetValue(lblVoltage.Caption);
end;

function TFrmSorensen.GetCurrent: double;
var fTime : double;
    DataStr : String;
begin

    Comm.FlushBuffers(True, True);  // 기존데이터를 제거하고. 응답받을준비를 한다.
    Comm.ContinuePolling;

    IsReceiveCommOk := false;
    gReadMode := rmCurrent;

    DataStr := 'IOUT?' + CR;
    Comm.SendString(DataStr);

    // 통신요청이 끝나면 노이즈때문에 프로그램 부하를 줄이기 위해 Polling중지..
    fTime := GetTickCountEX;
    while (GetTickCountEx - fTime < 1000) do begin
        if IsReceiveCommOk then
        begin
            Result := GetValue(lblCurrent.Caption);
            break;
        end;
        Application.ProcessMessages;
    end;
    Comm.PausePolling;

{

        CommSend(Param);

        nTime := GetTickCount;
        while ( (GetTickCount - nTime) < TIME_OUT ) do
        begin
            if IsReceiveCommOk then Break;
            Application.ProcessMessages;
        end;
}
end;

procedure TFrmSorensen.TimerReadTimer(Sender: TObject);
begin
    {
    TimerRead.Enabled := False;

    if giIndex > 1 then
        giIndex := 0;

    gReadMode := TReadMode( giIndex );
    case gReadMode of
        rmVoltage : CommSend( 'MEAS:VOLT?' );
        rmCurrent : CommSend( 'MEAS:CURR?' );
    end;

    inc( giIndex );

    TimerRead.Enabled := True;
    }
end;


function TFrmSorensen.CommTestStart(bStartOk : Boolean) : Boolean;
begin
    giIndex := 0;
    TimerRead.Enabled := bStartOk;
end;

procedure TFrmSorensen.SpeedButton1Click(Sender: TObject);
begin
    CommTestStart(True);
end;

procedure TFrmSorensen.SpeedButton2Click(Sender: TObject);
begin
    CommTestStart(False);
end;


procedure TFrmSorensen.Button1Click(Sender: TObject);
begin
  inherited;
    DevRead('MEAS?');
end;

end.
