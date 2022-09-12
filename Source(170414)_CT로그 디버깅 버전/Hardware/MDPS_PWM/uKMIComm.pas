//------------------------------------------------------------------------------
//
//  KMI COMMNUICATION ���� ��� Class.
//
//------------------------------------------------------------------------------

unit uKMIComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComDrv32, Buttons, StdCtrls, DPBLabel, Spin, ZINICtrl,
  ComCtrls;

type
  // KMI Format�� �⺻���� ����.
  TKMIComm = class
  private
    Comm: TCommPortDriver;
    FTxLen, FRxLen : Integer;
    procedure AddMsg(Param: String);
    procedure CommReceiveData(Sender: TObject;
        DataPtr: Pointer; DataSize: Cardinal);
  public
    BoardID : Integer;
    bPollingMode, bEchoMode, bExtendedMode : Boolean;
    TxBuff, RxBuff : array[0..1024] of Byte;

    OnMessage : TNotifyEvent;

    constructor Create;
    destructor  Destroy;
    function    CommOpen(nPort : Integer) : Boolean;
    function    CommClose : Boolean;
    function    CommClear : Boolean;
    function    CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
    function    CommRead() : Boolean;

    property    TxLen : Integer read FTxLen;
    property    RxLen : Integer read FRxLen;
  end;

implementation


{ TKMIComm }

const
  KMI_REQ_FRAME_HEADER = $55;
  KMI_RES_FRAME_HEADER = $AA;

constructor TKMIComm.Create;
begin
    Comm := TCommPortDriver.Create(Application);
    Comm.OnReceiveData := Self.CommReceiveData;

    bPollingMode  := False;
    bEchoMode     := False;
    bExtendedMode := False;
end;

destructor TKMIComm.Destroy;
begin
    Comm.Free;
end;

function TKMIComm.CommOpen(nPort: Integer): Boolean;
begin
    Comm.Disconnect;
    Comm.ComPortSpeed  := 115200;
    Comm.ComPort       := nPort;
    Comm.Connect;
    Result := Comm.Connected;
end;

function TKMIComm.CommClose: Boolean;
begin
    Comm.Disconnect;
end;

function TKMIComm.CommClear: Boolean;
begin
    FRxLen := 0;
    FTxLen := 0;
    Comm.FlushBuffers(True, True);
end;


function TKMIComm.CommSend(Cmd : Byte; Buff : array of Byte) : Boolean;
var i, nCount, nReadCount : Integer;
    CheckSum : Byte;
    DataPtr : pchar;
    fTime, fSendTime : Double;
begin
    Result := False;
    if not Comm.Connected then exit;

    DataPtr := @RxBuff[0];

    TxBuff[0] := KMI_REQ_FRAME_HEADER;    // HEADER.
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

    // CHECK SUM�� ����Ѵ�.
    CheckSum := 0;
    for i:= 0 to nCount-1 do
        CheckSum := Byte(CheckSum + TxBuff[i]);

    TxBuff[nCount] := CheckSum;
    Inc(nCount);
    FTxLen := nCount;

    Comm.FlushBuffers(True, True);
    if (not bPollingMode) then Comm.PausePolling;

    //================================
    // ���ۺκ� RTS Control/
    //    fSendTime := TxLen * (10000 / Comm.ComPortSpeed);   // ���۽ð��� ����Ѵ�.
    //    fTime := GetTickCountEX;
    //    Comm.ToggleRTS(True);
    Comm.SendData(@TxBuff[0], TxLen);
    //    while (GetTickCountEx - fTime <= fSendTime) do;
    //    Comm.ToggleRTS(False);
    //================================

    FRxLen := 0;
    if (bPollingMode) then begin
        if (bEchoMode) then FRxLen := -TxLen;  // Echo �� ���ֱ� ����..
        Result := True;
        exit;
    end;

    // Echo Mode�ΰ�� Feedback data ����.
    bEchoMode := False;
    if (bEchoMode) then begin
        nCount := Comm.ReadData(DataPtr, TxLen);
        if (nCount <> TxLen) then exit;
    end;

    //  ����κй� �д´�.
    if (bExtendedMode) then nReadCount := 5  // Heder(1) + ID(1) + Cmd(1) + Len(2)
                       else nReadCount := 4; // Heder(1) + ID(1) + Cmd(1) + Len(1);

    nCount := Comm.ReadData(DataPtr, nReadCount);

    // ����� Ʋ�����
    if (nCount    <> nReadCount          ) or
       (RxBuff[0] <> KMI_RES_FRAME_HEADER) or
       (RxBuff[1] <> TxBuff[1]           ) then exit;

    FRxLen  := FRxLen + nCount;
    DataPtr := DataPtr + nCount;

    //  CAN READ�ΰ�� DataLength�� 2Byte ������ �����͸� �д´�.
    if (bExtendedMode) then nReadCount := RxBuff[3]*256 + RxBuff[4] + 1
                       else nReadCount := RxBuff[3] + 1;

    // ������ �����͸� �д´�.
    nCount := Comm.ReadData(DataPtr, nReadCount);
    FRxLen := FRxLen + nCount;

    if (not bPollingMode) then Comm.ContinuePolling;

    // ������  Size����.
    if (nCount >= nReadCount) then
        Result := CommRead();
end;


//------------------------------------------------------------------------------
// ���������͸� �м��Ѵ�.
function TKMIComm.CommRead() : Boolean;
var Cmd : Byte;
    i, Idx, nChannel, nCount, nMsgCount : Integer;
    StrList : TStrings;
    Str : String;
    ReceiveStr : String;
begin
    Result := False;
    if (TxBuff[2] + $80 <> RxBuff[2]) then begin
        exit;  //  Positive �������� Ȯ��.
    end;

    case TxBuff[2] of
        //------------------------------
        $30 : begin
        end;
        //------------------------------
        // 
        $39 : begin
        end;
    end;   
end;


//------------------------------------------------------------------------------
procedure TKMIComm.CommReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Cardinal);
var i, nReadCount : Integer;
begin
    for i:=0 to DataSize-1 do begin
        if (RxLen >= 0) and (RxLen < High(RxBuff)) then
            RxBuff[RxLen] := Byte((PChar(DataPtr) + i)^);
        Inc(FRxLen);
    end;
    //  CAN READ�ΰ�� DataLength�� 2Byte ������ �����͸� �д´�.
    if (bExtendedMode) then nReadCount := 5 + (RxBuff[3]*256 + RxBuff[4] + 1) // Heder(1) + ID(1) + Cmd(1) + Len(2) + DataLen(N)
                       else nReadCount := 4 +  RxBuff[3] + 1;                  // Heder(1) + ID(1) + Cmd(1) + Len(1) + DataLen(N)

    if (RxLen >= nReadCount) then
        CommRead();

end;

//------------------------------------------------------------------------------
procedure TKMIComm.AddMsg(Param: String);
begin
    if Assigned(OnMessage) then
    begin
        try
            OnMessage(Self);
        finally
        end;
    end;
end;


end.
