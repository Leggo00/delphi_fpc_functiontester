unit FormWSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice;

type
  TFrmWSS = class(TFrmDevice)
    Comm: TCommPortDriver;
    INI: ZIniData;
    MemoRX: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    SpeedButton1: TSpeedButton;
    StatusBar: TStatusBar;
    Edt_Send: ZIniEdit;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Rg_SmartMode: TRadioGroup;
    Cb_SmartEnable: TCheckBox;
    Cb_FL: TCheckBox;
    Cb_FR: TCheckBox;
    Cb_RL: TCheckBox;
    Cb_RR: TCheckBox;
    SpeedButton2: TSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    bWaitComm : Boolean;
    sRecive, RxStr : String;

    TxBuff, RxBuff : array[0..255] of Byte;
    TxLen, RxLen : Integer;
     
    function CommSend(Cmd: Byte; Buff: array of Byte): Boolean;
    function CommRead: Boolean;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmWSS :  TFrmWSS;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmWSS.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := ComboBox_Port.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then begin
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort]);
        DevInit('');
    end else begin
        StatusBar.SimpleText := 'DISCONNECT';
        MessageBox(Format('WSS 통신포트(COM%d)를 OPEN할 수 없습니다.', [Comm.ComPort]), '에러', MB_OK or MB_ICONERROR);
    end;
end;
//------------------------------------------------------------------------------
function TFrmWSS.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmWSS.DevInit(Param: String): Integer;
begin
    CommSend($01, []);
    Comm.FlushBuffers(True, True);
end;
//------------------------------------------------------------------------------
function TFrmWSS.DevRead(Param: String): String;
begin
    //
end;

//------------------------------------------------------------------------------
function TFrmWSS.DevSend(Param: String): Integer;
var nData : Byte;
begin
    nData := HexToIntDef(Param, 0);
    CommSend($11, [nData]);
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmWSS.FormDestroy(Sender: TObject);
begin
    inherited;
    INI.SaveData;
end;

procedure TFrmWSS.SpeedButton1Click(Sender: TObject);
begin
    DevOpen('')
end;

procedure TFrmWSS.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;

procedure TFrmWSS.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var i, nReadCount : Integer;
begin
    for i:=0 to DataSize-1 do begin
        if (RxLen >= 0) and (RxLen < High(RxBuff)) then
            RxBuff[RxLen] := Byte((PChar(DataPtr) + i)^);
        Inc(RxLen);
    end;

    //  CAN READ인경우 DataLength가 2Byte 나머지 데이터를 읽는다.
    if (RxLen > 4) then begin
        nReadCount := 4 + RxBuff[3] + 1; // Heder(1) + ID(1) + Cmd(1) + Len(1) + DataLen(N)
        if (RxLen >= nReadCount) then
            CommRead();
    end;
end;

procedure TFrmWSS.BitBtn2Click(Sender: TObject);
begin
   DevSend(Edt_Send.Text);
end;


function TFrmWSS.CommRead : Boolean;
begin
    MemoRX.Lines.Add( 'RX> ' + MakeHexaString(@RxBuff[0], RxLen) );
    Result := True;
end;

function TFrmWSS.CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
var i, nCount, nReadCount : Integer;
    CheckSum : Byte;
    DataPtr : pchar;
    fTime, fFrameTime : Double;
begin
    Result := False;
    if not Comm.Connected then exit;

    MemoRX.Lines.Clear;
    try
        DataPtr := @RxBuff[0];
    
        TxBuff[0] := $55;    // HEADER.
        TxBuff[1] := 1;      // Card ID
        TxBuff[2] := Cmd;    // Command.

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
        RxLen := 0;

        Comm.FlushBuffers(True, True);
        Comm.SendData(@TxBuff[0], TxLen);

        MemoRX.Lines.Add( 'TX> ' + MakeHexaString(@TxBuff[0], TxLen) );
    finally
    end;
end;


procedure TFrmWSS.BitBtn1Click(Sender: TObject);
begin
    CommSend($01, []);
end;

procedure TFrmWSS.BitBtn3Click(Sender: TObject);
var nData : Byte;
begin
    nData := (Rg_SmartMode.ItemIndex + 1) shl 4;
    //
    if Cb_SmartEnable.Checked then nData := nData or $80;
    if Cb_FL.Checked          then nData := nData or $08;
    if Cb_FR.Checked          then nData := nData or $04;
    if Cb_RL.Checked          then nData := nData or $02;
    if Cb_RR.Checked          then nData := nData or $01;

    CommSend($11, [nData]);
end;

procedure TFrmWSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  INI.SaveData;
end;

procedure TFrmWSS.FormCreate(Sender: TObject);
begin
  inherited;

  INI.LoadData;
  DevOpen('');
end;


end.


