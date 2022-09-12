unit Form7555;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  DPBLabel, Spin, Math, FormDevice;

type
  TFrm7555 = class(TFrmDevice)
    Panel1: TPanel;
    INI: ZIniData;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StatusBar: TStatusBar;
    Panel2: TPanel;
    BtnInit: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Comm: TCommPortDriver;
    Label2: TLabel;
    CmbComport: ZIniComboBox;
    TimerMeas: TTimer;
    Cb_Repeat: TCheckBox;
    BtnMeas: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoInit: TMemo;
    BtnClear: TSpeedButton;
    BtnSend: TBitBtn;
    Edit_Send: ZIniEdit;
    MemoRX: TMemo;
    TimerOut: TTimer;
    Rg_Channel: TRadioGroup;
    Pn_Value: TPanel;
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
    procedure TimerMeasTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMeasClick(Sender: TObject);
    procedure Cb_RepeatClick(Sender: TObject);
    procedure TimerOutTimer(Sender: TObject);
    procedure Rg_ChannelClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    TxStr, RxStr : String;
    ReceiveData : String;
    bWaitComm : Boolean;
    fMeasValue : Double;

    procedure AddLog(Param : String);
    procedure DecodeData(RdStr : String);
    function  CommWait(nTimeout : Integer = 1000) : Boolean;
  public
    { Public declarations }
    function  GetValue : Double;

    { Public declarations }
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
  end;

var
  Frm7555: TFrm7555;

implementation

uses
    GenUtils;

{$R *.dfm}

const
    MEAS_CMD =  ':MEAS?';
    INVALID_VALUE = -9999;


//------------------------------------------------------------------------------
function TFrm7555.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := CmbComport.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';

//    Init('');
end;
//------------------------------------------------------------------------------
function TFrm7555.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrm7555.DevInit(Param: String): Integer;
var i : Integer;
    RdStr : String;
begin
    Comm.FlushBuffers(True, True);

    MemoRX.Clear;
    for i:= 0 to MemoInit.Lines.Count-1 do begin
        RdStr := Trim(MemoInit.Lines[i]);
        if RdStr <> '' then
            DevSend(RdStr);
    end;

    DevSend('*RST');
    Delayex(1000, True);
    DevSend(':COMM:HEAD 0'); // Default 값이 헤더 있는사양임.
    DevSend(':FUNC:SCAN ONLY');
    DevSend(':FUNC:SCAN:CH 1');

    DevSend(MEAS_CMD);
end;
//------------------------------------------------------------------------------
function TFrm7555.DevRead(Param: String): String;
var fScale, fOffset, fValue : Double;
begin
    Pn_Value.Caption := '';
    ReceiveData := '';
    fMeasValue := -99999999;

    Delayex(100, True);
    CommWait;
    DevSend(Param);
    CommWait(3000);

    if Pos('RES', Param) > 0 then fScale := 1
    else
        fScale  := 1000; //StrToFloatDef(GetToken(Param, ','), 1);

    fOffset := 0;    //StrToFloatDef(GetToken(Param, ','), 0);
    
    fValue := fMeasValue * fScale + fOffset;
    Result := FloatToStr( fValue );
end;

//------------------------------------------------------------------------------
function TFrm7555.DevSend(Param: String): Integer;
begin
     if bWaitComm then exit;
    bWaitComm := True;

    TxStr := Param;
    RxStr := '';
    ReceiveData := '';

    if Comm.Connected then
    begin
        AddLog('> ' + TxStr);
        Param := Param + CRLF;
        Comm.SendData( PChar(Param), Length(Param) );
        if Pos('?',Param) > 0 then
            CommWait(5000);

        bWaitComm := False;
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================


procedure TFrm7555.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrm7555.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := Trim(UpperCase( Edit_Send.Text ));
    if SendMsg = '' then exit;

    DevSend( SendMsg );
end;

procedure TFrm7555.SpeedButton1Click(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrm7555.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;


procedure TFrm7555.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;

procedure TFrm7555.BtnInitClick(Sender: TObject);
begin
    DevInit('');
end;

procedure TFrm7555.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrm7555.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrm7555.CommWait(nTimeout : Integer = 1000) : Boolean;
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

function GetValue(ValStr : String) : Double;
var
    Value : Double;
    sVal, sExp : String;
    nExp : Integer;
begin
    if not TryStrToFloat(ValStr, Result) then
        Result := 0;

end;

procedure TFrm7555.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    RxStr := RxStr + StrPas(DataPtr);

    if Pos(CRLF, RxStr ) > 0 then
    begin
        ReceiveData := GetToken(RxStr, CRLF);
        AddLog('< ' + ReceiveData);

        bWaitComm := False;
        TimerOut.Enabled := False;

        if Pos('MEAS', TxStr) > 0 then
        begin
            Pn_Value.Caption := '';
            DecodeData(ReceiveData);
        end;
    end;
end;


procedure TFrm7555.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TFrm7555.DecodeData(RdStr : String);
var
    i, nCol, nRow : Integer;
    fValue : Double;
    Str, sData : String;
begin
//    :MEAS:SCAN 1,-0.003E-03
    // Idx 번지의 데이터를 가져온다.
   // Str := GetToken(RdStr, ' '); // Header제거..
    Str := GetToken(RdStr, ',');

    // 채널번호인경우 채널번호 제거...
    if (Str = '1') or (Str = '2') or (Str = '3') or (Str = '4') then begin
        Str := RdStr;
    end;
    fMeasValue := StrToFloatDef(Str, -9999);
    Pn_Value.Caption := FormatFloat('0.0000', fMeasValue) + ' V';
end;

procedure TFrm7555.TimerMeasTimer(Sender: TObject);
begin
    TimerMeas.Enabled := False;

    BtnMeasClick(Sender);

    //TimerMeas.Enabled := Cb_Repeat.Checked;
    TimerMeas.Enabled := True;
end;

procedure TFrm7555.FormCreate(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 0;

    INI.LoadData;
    bWaitComm := False;
    DevOpen('');
    DevInit('');
end;

procedure TFrm7555.BtnMeasClick(Sender: TObject);
begin
    //if not bWaitComm then
    DevSend(MEAS_CMD);
end;

procedure TFrm7555.Cb_RepeatClick(Sender: TObject);
begin
    TimerMeas.Enabled := Cb_Repeat.Enabled;
end;

function TFrm7555.GetValue : Double;
begin
    CommWait;
    DevSend(MEAS_CMD);
    CommWait;

    Result := fMeasValue;
end;

procedure TFrm7555.TimerOutTimer(Sender: TObject);
begin
    TimerOut.Enabled := False;
    bWaitComm := False;
end;

procedure TFrm7555.Rg_ChannelClick(Sender: TObject);
begin
    DevSend(':FUNC:SCAN ONLY');
    DevSend(':FUNC:SCAN:CH ' + IntToStr(Rg_Channel.ItemIndex + 1));
end;

procedure TFrm7555.SpeedButton4Click(Sender: TObject);
var Idx : Integer;
begin
    Idx := (Sender as TSpeedButton).Tag;
    case Idx of
        1: DevSend('MEAS:VOLT:DC?');
        2: DevSend('MEAS:VOLT:AC?');
        3: DevSend('MEAS:RES?');
        4: DevSend('MEAS:RES?');
        5: DevSend('MEAS:CURR:DC?');
        6: DevSend('MEAS:CURR:AC?');
    end;
end;

end.
