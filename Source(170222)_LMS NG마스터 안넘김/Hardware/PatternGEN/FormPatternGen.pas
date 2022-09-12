unit FormPatternGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  DPBLabel, Spin, Math, FormDevice;

type
  TFrmPatternGen = class(TFrmDevice)
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
  private
    { Private declarations }
    TxStr, RxStr : String;
    ReceiveData : String;
    bWaitComm : Boolean;
    fMeasValue : Double;

    procedure AddLog(Param : String);
    function  CommWait(nTimeout : Integer = 1000) : Boolean;
  public
    { Public declarations }
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
  end;

var
  FrmPatternGen: TFrmPatternGen;

implementation

uses
    GenUtils;

{$R *.dfm}

const
    MEAS_CMD =  'MEAS?';
    INVALID_VALUE = -9999;


//------------------------------------------------------------------------------
function TFrmPatternGen.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := CmbComport.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmPatternGen.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmPatternGen.DevInit(Param: String): Integer;
var i : Integer;
    RdStr : String;
begin
    Comm.FlushBuffers(True, True);
    MemoRX.Clear;
end;
//------------------------------------------------------------------------------
function TFrmPatternGen.DevRead(Param: String): String;
begin
    //
end;

//------------------------------------------------------------------------------
function TFrmPatternGen.DevSend(Param: String): Integer;
begin
    bWaitComm := True;

    TxStr := Param;
    RxStr := '';
    ReceiveData := '';

    if Comm.Connected then
    begin
        AddLog('> ' + TxStr);
        Param := Param + CRLF;
        Comm.SendData( PChar(Param), Length(Param) );
        Delay(50, True);
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================


procedure TFrmPatternGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmPatternGen.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := Trim(UpperCase( Edit_Send.Text ));
    if SendMsg = '' then exit;

    DevSend( SendMsg );
end;

procedure TFrmPatternGen.SpeedButton1Click(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmPatternGen.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;


procedure TFrmPatternGen.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;

procedure TFrmPatternGen.BtnInitClick(Sender: TObject);
begin
    DevInit('');
end;

procedure TFrmPatternGen.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrmPatternGen.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrmPatternGen.CommWait(nTimeout : Integer = 1000) : Boolean;
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

procedure TFrmPatternGen.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    RxStr := RxStr + StrPas(DataPtr);

    if Pos(CRLF, RxStr ) > 0 then
    begin
        ReceiveData := GetToken(RxStr, CRLF);
        AddLog('< ' + ReceiveData);

        bWaitComm := False;
    end;
end;


procedure TFrmPatternGen.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmPatternGen.FormCreate(Sender: TObject);
begin
    INI.LoadData;

    DevOpen('');
    DevInit('');
end;

end.
