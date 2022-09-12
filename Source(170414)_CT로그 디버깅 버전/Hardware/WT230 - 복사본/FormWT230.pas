unit FormWT230;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  ZGPIBDev, DPBLabel, Spin, Math, Grids, FormDevice;

type
  TFrmWT230 = class(TFrmDevice)
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
    Grid: TStringGrid;
    Cb_Repeat: TCheckBox;
    BtnMeas: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BtnClear: TSpeedButton;
    BtnSend: TBitBtn;
    Edit_Send: ZIniEdit;
    MemoRX: TMemo;
    TabSheet2: TTabSheet;
    MemoInit: TMemo;
    TimerOut: TTimer;
    Ed_Interval: ZIniSpinEdit;
    EdtScale: ZIniEdit;
    dpbLabel1: TdpbLabel;
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
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Cb_RepeatClick(Sender: TObject);
    procedure TimerOutTimer(Sender: TObject);
    procedure setPolling(Param : Boolean);
  private
    { Private declarations }
    TxStr, RxStr : String;
    bWaitComm : Boolean;
    bPolling  : Boolean;
    procedure AddLog(Param : String);
    procedure DecodeData(RdStr: String);
    function  CommWait(nTimeout : Integer = 1000) : Boolean;
  public
    { Public declarations }
    function  GetValue(nElement, nItemNo: Integer): Double;

    property  Polling : Boolean read bPolling write setPolling;
    //------------------------------------------------------------
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
  end;

var
  FrmWT230: TFrmWT230;

implementation

uses
    GenUtils;

{$R *.dfm}

const
    MEAS_CMD =  ':MEAS:NORMAL:VALUE?';
    INVALID_VALUE = -9999;


//------------------------------------------------------------------------------
function TFrmWT230.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := CmbComport.ItemIndex + 1;
    Comm.ComPortSpeed := 9600;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';

    AddLog(StatusBar.SimpleText);
    DevInit('');
end;
//------------------------------------------------------------------------------
function TFrmWT230.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
    AddLog(StatusBar.SimpleText);
end;
//------------------------------------------------------------------------------
function TFrmWT230.DevInit(Param: String): Integer;
begin
    bWaitComm := False;
    Comm.FlushBuffers(True, True);
    
   // DevSend('*RST');
    DevSend(':MEAS:ITEM:PRESET');
    DevSend(':MEAS:ITEM:PF:ALL ON');
    DevSend(':MEAS:ITEM:VHZ:ALL ON');
end;
//------------------------------------------------------------------------------
function TFrmWT230.DevRead(Param: String): String;
var fValue, fTime  : Double;
    nCol, nRow : Integer;
begin
    Result := 'N/A';

    DevSend(MEAS_CMD);
    fTime := GetTickCountEX;
    while (GetTickCountEX - fTime < 1000) do begin
        if not bWaitComm then break;
        Application.ProcessMessages;
        Sleep(1);
    end;

    if (not bWaitComm) then
    begin
        nCol := StrToIntDef( GetToken(Param, ','), 0);
        nRow := StrToIntDef( GetToken(Param, ','), 0);

        if (nCol < 1) or (nCol >= Grid.ColCount) then exit;
        if (nRow < 1) or (nRow >= Grid.RowCount) then exit;

        fValue := StrToFloatDef(Grid.Cells[nCol, nRow], -9999);
        Result := FormatFloat('0.####', fValue);
    end;
    bWaitComm := False;
end;

//------------------------------------------------------------------------------
function TFrmWT230.DevSend(Param: String): Integer;
begin
    if (not Comm.Connected) then exit;

    TxStr := Param;
    RxStr := '';

    if Comm.Connected then
    begin
        MemoRX.Lines.Add('> ' + TxStr);
        Comm.SendString(TxStr + CRLF);

        if Pos('?', TxStr) > 0 then begin
            bWaitComm := True;
            TimerOut.Enabled := True;
        end;
    end;
end;


    
procedure TFrmWT230.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmWT230.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := Trim(UpperCase( Edit_Send.Text ));
    if SendMsg = '' then exit;

    DevSend( SendMsg );
end;

procedure TFrmWT230.SpeedButton1Click(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmWT230.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;


procedure TFrmWT230.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;


procedure TFrmWT230.BtnInitClick(Sender: TObject);
begin
    DevInit('');
end;

procedure TFrmWT230.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrmWT230.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrmWT230.CommWait(nTimeout : Integer = 1000) : Boolean;
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

procedure TFrmWT230.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    ReceiveData : String;
begin
    RxStr := RxStr + StrPas(DataPtr);

    if Pos(CRLF, RxStr ) > 0 then
    begin
        ReceiveData := GetToken(RxStr, CRLF);
        AddLog('< ' + ReceiveData);

        bWaitComm := False;
        TimerOut.Enabled := False;

        if (TxStr = MEAS_CMD) then
            DecodeData(ReceiveData);
    end;
end;


procedure TFrmWT230.SpeedButton3Click(Sender: TObject);
begin
    Close();
end;

procedure TFrmWT230.DecodeData(RdStr : String);
var
    i, nCol, nRow : Integer;
    fValue : Double;
    Str, sData : String;
begin
    nCol := 1;
    nRow := 1;
    while (RdStr <> '') do begin
        Str := GetToken(RdStr, ',');
        Grid.Cells[nCol, nRow] := FloatToStr( StrToFloatDef(Str, -9999) );
        Inc(nCol);
        if nCol > 4 then begin
            nCol := 1;
            Inc(nRow);
        end;
    end;
end;

procedure TFrmWT230.TimerMeasTimer(Sender: TObject);
begin
    TimerMeas.Enabled := False;
    BtnMeasClick(Sender);


    TimerMeas.Interval := Ed_Interval.Value;
    TimerMeas.Enabled := Cb_Repeat.Checked;
end;

procedure TFrmWT230.FormCreate(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 0;

    INI.LoadData;

    DevOpen('');

    with Grid do begin
        Cells[1, 0] := 'ELEMENT 1';
        Cells[2, 0] := 'ELEMENT 2';
        Cells[3, 0] := 'ELEMENT 3';
        Cells[4, 0] := 'SIGMA';

        Cells[0, 1] := 'V';
        Cells[0, 2] := 'A';
        Cells[0, 3] := 'W';
        Cells[0, 4] := 'PF';
        Cells[0, 5] := 'HZ';
    end;
end;

procedure TFrmWT230.BtnMeasClick(Sender: TObject);
begin
    DevSend(MEAS_CMD);
end;

procedure TFrmWT230.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Str : String;
begin
    Str := Grid.Cells[ACol, ARow];

    Grid.Canvas.FillRect(Rect);
    DrawText(Grid.Canvas.Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TFrmWT230.Cb_RepeatClick(Sender: TObject);
begin
    TimerMeas.Interval := Ed_Interval.Value;
    TimerMeas.Enabled  := Cb_Repeat.Enabled;
end;

procedure TFrmWT230.TimerOutTimer(Sender: TObject);
begin
    TimerOut.Enabled := False;
    bWaitComm := False;
end;

function TFrmWT230.GetValue(nElement, nItemNo : Integer) : Double;
begin
    Result := INVALID_VALUE;

    if not (nElement in [1..4]) then exit;
    if not (nItemNo  in [1..5]) then exit;

    // 폴링모드가 아니면 주기적으로 값을 요청한다.
    if (not bPolling) then begin
        CommWait;
        DevSend(MEAS_CMD);
        CommWait;
    end;
    
    Result := StrToFloatDef( Grid.Cells[nElement, nItemNo], INVALID_VALUE);
end;

procedure TFrmWT230.setPolling(Param: Boolean);
begin
    bPolling := Param;
    Cb_Repeat.Checked := Param;
    Cb_Repeat.OnClick(nil);
end;

end.
