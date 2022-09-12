unit FormCANEmul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice, uCanUnit, uCanKMI;

type
  TFrmCANEmul = class(TFrmDevice)
    Comm: TCommPortDriver;
    INI: ZIniData;
    MemoLog: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    BtnInit: TSpeedButton;
    StatusBar: TStatusBar;
    TimerStart: TTimer;
    BtnClose: TSpeedButton;
    BtnStop: TBitBtn;
    BtnSend: TBitBtn;
    MemoTx: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
  private
    { Private declarations }
    // RS232용 Buff..
    TxBuff, RxBuff : array [0..MAX_BUFF] of Byte;
    TxLen, RxLen  : Integer;

    procedure AddLog(Param : String);
    function CommSend(Cmd: Byte; Buff: array of Byte): Boolean;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmCANEmul :  TFrmCANEmul;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevOpen(Param: String): Integer;
var nPort : Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := ComboBox_Port.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then begin
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort]);
    end else begin
        StatusBar.SimpleText := 'DISCONNECT';
    end;
    AddLog(StatusBar.SimpleText);

    DevInit('');
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
    AddLog(StatusBar.SimpleText);
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevInit(Param: String): Integer;
begin
    AddLog('> DevInit');
    Comm.FlushBuffers(True, True);
    TxLen := 0;
    RxLen := 0;
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevRead(Param: String): String;
var fValue : Double;
begin
    //
end;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevSend(Param: String): Integer;
var Cmd : String;
    nCmd : Byte;
    Value : TCanMessage;
    i, nLen, nRetry : Integer;
    Buff : array[0..1024] of Byte;
    TxBuff : array of Byte;
begin
    AddLog('> DevSend : ' + Param);
    Cmd := GetToken(Param, ':');

    // 메세지를 통째로 보낸다.
    // ex) Param = COMMAND:12=00 00 00 00 00
    if (Cmd = 'CMD') then begin
        nCmd := HexToIntDef( GetToken(Param, '='), 0);
        nLen := 0;
        while (Param <> '') do begin
            Buff[nLen] := HexToIntDef( GetToken(Param, ' '), 0);
            Inc(nLen);
        end;

        if (nLen > 0) then
        begin
            SetLength(TxBuff, nLen);
            for i:= 0 to nLen-1 do
                TxBuff[i] := Buff[i];

            for nRetry := 1 to 2 do
            begin
                if CommSend(nCmd, TxBuff) then begin
                    AddLog('> DevSend : OK');
                    exit;
                end else begin
                    //
                end;
            end;
        end;
    end else
{
    // ex) Param = SEND:123=00 00 00 00 00:10
    if (Cmd = 'CAN') then begin
        Value := StrToCanMsg(Param);
        Value.nChannel := 1;
        if KmiCAN.Send (1, Value) then begin
            AddLog('> DevSend : OK');

            exit;
            CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
        end;

    end;
}
    AddLog('> DevSend : FAIL');
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmCANEmul.AddLog(Param : String);
begin
    if MemoLog.Lines.Count > 50 then
        MemoLog.Lines.Delete(0); 

    MemoLog.Lines.Add(Param);
end;

procedure TFrmCANEmul.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmCANEmul.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmCANEmul.BtnInitClick(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmCANEmul.BtnCloseClick(Sender: TObject);
begin
    DevClose('');
end;

procedure TFrmCANEmul.BtnStopClick(Sender: TObject);
begin
    DevSend('CMD:31=06');
end;

procedure TFrmCANEmul.BtnSendClick(Sender: TObject);
var i : Integer;
    Param : String;
begin
    inherited;

    for i := 0 to MemoTx.Lines.Count-1 do
    begin
        Param := Trim(MemoTx.Lines[i]);
        DevSend(Param);
    end;
end;

function TFrmCANEmul.CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
var i, nCount, nReadCount : Integer;
    CheckSum : Byte;
    DataPtr : pchar;
    fTime, fFrameTime : Double;
begin
    Result := False;
    if not Comm.Connected then exit;

//    FSendLock.Enter;
    try
        DataPtr := @RxBuff[0];
    
        TxBuff[0] := KMI_FRAME_HEADER;    // HEADER.
        TxBuff[1] := 1;                   // Card ID
        TxBuff[2] := Cmd;                 // Command.

        //    if (bExtendedMode) then TxBuff[1] := (TxBuff[1] or $08);

        nCount := 4;
        for i:= Low(Buff) to High(Buff) do begin
            TxBuff[nCount] := Buff[i];
            Inc(nCount);
            if nCount > High(TxBuff)-2 then break;
        end;
        TxBuff[3] := nCount - 4;         // DataLen;

        // CHECK SUM을 계산한다.
        CheckSum := 0;
        for i:= 0 to nCount-1 do
            CheckSum := Byte(CheckSum + TxBuff[i]);

        TxBuff[nCount] := CheckSum;
        Inc(nCount);
        TxLen := nCount;

        Comm.FlushBuffers(True, True);
        //================================
        // 전송부분 RTS Control/
        fFrameTime := TxLen * (10000 / Comm.ComPortSpeed);   // 전송시간을 계산한다.
        fTime := GetTickCountEX;  // <- 전송시작시간.
        
        //    Comm.ToggleRTS(True);
        Comm.SendData(@TxBuff[0], TxLen);
        //    while (GetTickCountEx - fTime <= fSendTime) do;
        //    Comm.ToggleRTS(False);
        //================================

        RxLen := 0;
        // 전송시간동안은 대기해서 CPU부하를 줄인다.  2010.03.06. 정성일
        while (GetTickCountEx - fTime <= (fFrameTime * 2)) do Sleep(1);

        //  헤더부분문 읽는다.
        nReadCount := 5; // Heder(1) + ID(1) + Cmd(1) + Len(2);

        Comm.InputTimeout := 100;  // Input Timeout 10ms.. 
        nCount := Comm.ReadData(DataPtr, nReadCount);

        // 헤더가 틀린경우
        if (nCount    <> nReadCount      ) or
           (RxBuff[0] <> KMI_FRAME_HEADER) or
           (RxBuff[1] <> TxBuff[1]       ) then
        begin
            exit;
        end;

        RxLen   := RxLen + nCount;
        DataPtr := DataPtr + nCount;

        //  CAN READ인경우 DataLength가 2Byte 나머지 데이터를 읽는다.
        nReadCount := RxBuff[3]*256 + RxBuff[4] + 1;

        nCount := Comm.ReadData(DataPtr, nReadCount);
        RxLen := RxLen + nCount;

        // 데이터  Size정상.
        if (nCount >= nReadCount) then begin
            // CheckSum을 확인한다. 2010.12.20.
            CheckSum := 0;
            for i:= 0 to RxLen-2 do
                CheckSum := Byte(CheckSum + RxBuff[i]);

            if CheckSum <> RxBuff[RxLen-1] then begin
                WriteDebugStr('KMICANEmul 232 CheckSum Error : ' + MakeHexaString(@RxBuff[0], RxLen));
                exit;
            end else
                Result := True;
        end;
    finally
    end;
end;


end.


