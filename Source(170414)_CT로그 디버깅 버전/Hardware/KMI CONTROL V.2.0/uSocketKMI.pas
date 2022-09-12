//****************************************************************************//
//  KMI Ethernet Message 송/수신담당. Socket 생성, 칸트롤 담당
//
//****************************************************************************//
unit uSocketKMI;

interface

uses
  Classes, Sysutils, Windows, Forms, ScktComp, SyncObjs, HWGlobal;

const
  KMI_PORT = 5000;

  SOCKET_DISCONNECT = 0;
  SOCKET_CONNECTED  = 1;
  SOCKET_CONNECTING = 2;
  SOCKET_ERROR      = 9;


type
  TSocketKMI = class(TObject)
  private
    Ip        : Integer;
    FBuffLock  : TCriticalSection;
    FStatus  : Integer;   // 0 : No   1 : connect  2 : connecting   9 : Error
    FSocket  : TClientSocket;
    FTxLen, FRxLen : integer;
    FErrorCode : Integer;

    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  public
    FIp      : String;

    TxBuff : array [0..$FF] of Byte;
    RxBuff : array [0..$1FFFF] of Byte;
    OnEvent  : procedure (Sender : TObject) of Object;

    property TxLen : Integer read FTxLen;
    property RxLen : Integer read FRxLen;

    constructor create;
    destructor  destroy; override;

    procedure Connect;
    procedure Disconnect;
    function  SendCommand(Command : Integer; Data : array of Byte):Boolean;

    property  Status        : Integer Read FStatus;
    property  ErrorCode     : Integer Read FErrorCode;

    procedure Lock;
    procedure UnLock;

    procedure AddLog(Param : String);
  end;

implementation

uses GenUtils;


constructor TSocketKMI.create;
begin
    inherited;

    FBuffLock  := TCriticalSection.Create;

    FSocket := TClientSocket.Create(nil);
    //FSocket := TClientSocket.Create(Application.MainForm);

    FSocket.Active        := False;
    FSocket.Port          := KMI_PORT;
    FSocket.ClientType    := ctNonBlocking;
    FSocket.OnConnect     := ClientSocketConnect;
    FSocket.OnConnecting  := ClientSocketConnecting;
    FSocket.OnDisconnect  := ClientSocketDisconnect;
    FSocket.OnError       := ClientSocketError;
end;

destructor TSocketKMI.destroy;
begin
    FSocket.Close;
    FSocket.Free;
    FBuffLock.Free;

    inherited;
end;

procedure TSocketKMI.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    FSocket := TClientSocket(Sender);
    AddLog(Format('%s : CONNECTED',[FSocket.Address]));
    FStatus := SOCKET_CONNECTED;
    FErrorCode := 0;    // 정상연결시.
    try
        if Assigned(OnEvent) then OnEvent(Self);
    except
    end;
end;

procedure TSocketKMI.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    FSocket := TClientSocket(Sender);
    AddLog(Format('%s : CONNECTING...',[FSocket.Address]));
    FStatus := SOCKET_CONNECTING;

    try
        if Assigned(OnEvent) then OnEvent(Self);
    except
    end;
end;

procedure TSocketKMI.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    FSocket := TClientSocket(Sender);
    AddLog(Format('%s : DISCONNECT...',[FSocket.Address]));
    FStatus := SOCKET_DISCONNECT;

    try
        if Assigned(OnEvent) then OnEvent(Self);
    except
    end;
end;

procedure TSocketKMI.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
    AddLog(Format('%s : ErrorCode : %d',[FSocket.Address, ErrorCode]));
    FSocket.Close;
    FStatus := SOCKET_ERROR;
    FErrorCode := ErrorCode;   // 에러코드를 Tag로 전달.
    ErrorCode := 0;
    try
        if Assigned(OnEvent) then OnEvent(Self);
    except
    end;
end;

// 소켓 명령을 전송한다.
function TSocketKMI.SendCommand(Command : Integer; Data : array of Byte):Boolean;
var i, nTotalLen, TotalRXLen, tempLen, nError: Integer;
    CheckSum : Byte;
    DataLen : Word;
    fTime : Double;
    Str : String;
    fCheckTime : Double;
    TempBuff : array [0..$FFFF] of Byte;
    sErrorMsg : String;
begin
    Result := False;

    // 1) 연결상태를 확인.
    if (FStatus <> SOCKET_CONNECTED) then begin
        sErrorMsg := Format('Socket not connected. (%d)',  [FStatus]);
        exit;
    end;

    try
        sErrorMsg := 'Unknown Error';

        AddLog('Input SendKMIComm');

        DataLen   := 0;
        TxBuff[0] := $55;
        TxBuff[1] := Ip;    // 192.168.0.xxx  -> IP Address를 입력한다.

        // Command 3Byte;
        TxBuff[2] := (Command and $FF0000) shr 16;
        TxBuff[3] := (Command and $00FF00) shr 8;
        TxBuff[4] := (Command and $0000FF);

        DataLen := 0;

        FTxLen := 7;
        FRxLen := 0;
        for i:= Low(Data) to High(Data) do begin
            TxBuff[FTxLen] := Data[i];
            Inc(FTxLen);
            Inc(DataLen);
        end;
        TxBuff[5] := HI(DataLen);
        TxBuff[6] := LO(DataLen);

        CheckSum := 0;
        for i:= 0 to TxLen-1 do begin
            CheckSum := CheckSum + TxBuff[i];
        end;

        TxBuff[TxLen] := CheckSum;
        Inc(FTxLen);

        //AddLog('Ready');
        FSocket.Socket.SendBuf(TxBuff, TxLen);

        AddLog(Format('TX %0.5d > ',[TxLen]) + MakeHexaString(@TxBuff[0], TxLen));

        FRxLen := 0;
        nError := 0;
        nTotalLen := 0; // <- 전체받을 갯수..0으로 초기화.

        // 데이터가 나누어 들어오는 경우 나누어받아서 붙인다...
        fCheckTime := GetTickCountEX;
        while (GetTickCountEX - fCheckTime < 1000) do
        begin
            tempLen := FSocket.Socket.ReceiveLength;
            if tempLen > 0 then begin
                FSocket.Socket.ReceiveBuf(TempBuff, tempLen);

                // 임시 버퍼에서 RxBuff로 메모리 이동..
                for i:= 0 to tempLen-1 do begin
                    RxBuff[RxLen] := TempBuff[i];
                    Inc(FRxLen);
                end;

                // 전체 받을 갯수를 확인한다.
                if (RxLen >= 8) and (nTotalLen = 0) then begin
                    nTotalLen := RxBuff[6]*$100 + RxBuff[7];
                end;
                nError := 0;
            end else begin
                Sleep(1);
                Inc(nError);
                if (nError > 20) then begin // Sleep 1ms x 20 정도 데이터가 안들어 오면 에러처리
                    sErrorMsg := 'Receive Timeout';
                    break;
                end;
            end;

            // 데이터를 모두 받았을경우.
            if (nTotalLen > 0) and (RxLen >= nTotalLen + 8) then begin
                Result := True;
                break;
            end;
        end;

        AddLog(Format('RX %0.5d > ',[RxLen]) + MakeHexaString(@RxBuff[0], RxLen));
        AddLog('');
    finally
        if (Result) then
        begin
            // Check Response Error Status.
            if (RxBuff[2] = $EE) then begin
                //WriteDebugStr(MakeHexaString(@RxBuff[0], RxLen));
                Result := False;
            end;
        end else
           // WriteDebugStr(sErrorMsg);
    end;
end;

{  원래 Socket에 있던것을 다른쪽으로 이동함.
function TSocketKMI.Read:Boolean;
var i, j, Idx, nBoardID, nStatus, nCommand, nSlotIdx, nDataLen, nSlotNo, nStartCh, nEndCh, nChCount, nStationNo, nSlotCnt : Integer;
    nTime : Cardinal;
    nData : Integer;
    fValue : Double;
    CheckSum : Byte;
    nRange, nSampling, nScaleIdx : Integer;
    fTimeStamp : Double;
begin
    Result := False;

    // 1) Header 를 비교한다.
    if (RxBuff[0] <> $AA) then begin
        AddLog('Header Error');
        exit;
    end;

    CheckSum := 0;
    for i:= 0 to RxLen-2 do begin
        CheckSum := Byte(CheckSum + RxBuff[i]);
    end;

    if (CheckSum <> RxBuff[RxLen-1]) then begin
        AddLog('CheckSum Error');
        exit;
    end;

    nBoardID := RxBuff[1];
    nStatus  := RxBuff[2];
    nCommand := RxBuff[3]*$10000 + RxBuff[4]*$100 + RxBuff[5];
    nDataLen := RxBuff[6]*$100 + RxBuff[7];
    nSlotNo  := RxBuff[8];
    nTime    :=(RxBuff[9]*1000000) + (RxBuff[10]*$10000) +
               (RxBuff[11]*$100)   +  RxBuff[12];           // 시간은 0.1ms단위...

    if (not nSlotNo in [1..19]) then exit;

    nSlotNo := nSlotNo + ((FStation-1) * MAX_SLOT);

    case  nCommand of

        $1013 : begin // AD Command
            nStartCh := RxBuff[13];
            nEndCh   := RxBuff[14];
            nChCount := nEndCh - nStartCh + 1;

            nScaleIdx := ADIdx(nSlotNo);

            for i:= 0 to nChCount-1 do begin
                Idx := (i*2) + 15;
                nData := RxBuff[Idx]*$100 + RxBuff[Idx+1];

                if (nData <> $FFFF) then begin
                    fValue := nData * (ADScale[nScaleIdx, i].Max) / 4096;   // 환산식...
                    //fValue := (nData * 30) / 4096;   // 환산식...

                    if nScaleIdx > -1 then
                        ValueTbl[nSlotNo-1, i] := (ADScale[nScaleIdx, i].Scale * fValue) + ADScale[nScaleIdx, i].Offset
                    else
                        ValueTbl[nSlotNo-1, i] := fValue;
                end else
                    ValueTbl[nSlotNo-1, i] := INVALID_VALUE;
            end;
            AddLog(Format('Slot%.2d: AD%d~%d : (%10.4f Sec) :',
                [nSlotNo, nStartCh, nEndCh, nTime / 10000]));
        end;



        // AA 01 00 00 10 10 00 04 00 46 A0 BD 72
        $1010 : begin // Port Write Command.
            // Port Write Command는 시간정보만 들어온다..
        end;


        KMI_WD_CMD : begin // DO..
            AddLog('');
        end;

        KMI_DI_CMD : begin // DI Command.
           nData := RxBuff[13]*$100 + RxBuff[14];

            for i:= 0 to 15 do begin
                if ((nData and (1 shl (i)) <> 0)) then
                    ValueTbl[nSlotNo-1, i] := 1
                else
                    ValueTbl[nSlotNo-1, i] := 0;
            end;

           AddLog(Format('Slot%.2d:READIO = %s %s (%.4x)',
                [nSlotNo, IntToBin(HI(nData), 8), IntToBin(LO(nData), 8), nData]));
        end;

        $1017 : begin // PGMR Command.
           nData := RxBuff[13]*$10000 + RxBuff[14]*$100 + RxBuff[15];

           fValue := 0;
           AddLog(Format('PGMR = %f Ohm (%.5x)', [fValue, nData]));
        end;

        KMI_ADALL_CMD : begin // AD ALL READ
            nSlotCnt := RxLen-(9+4);
            nSlotCnt := (nSlotCnt mod 64);
            try
            for j:= 0 to nSlotCnt-1 do begin
                nSlotNo := RxBuff[(j+1)+7];
                nSlotNo := nSlotNo + ((FStation-1) * MAX_SLOT);
                nScaleIdx := ADIdx(nSlotNo);
                for i:=0 to MAX_CHANNEL-1 do
                begin
                    Idx := (i*2) + (8 + nSlotCnt + 4) + (j*64);
                    nData := RxBuff[Idx]*$100 + RxBuff[Idx+1];

                    if (nData <> $FFFF) then begin
                        if nScaleIdx > -1 then begin
                            fValue := nData * (ADScale[nScaleIdx, i].Max) / 4096;
                            ValueTbl[nSlotNo-1, i] := (ADScale[nScaleIdx, i].Scale * fValue) + ADScale[nScaleIdx, i].Offset
                        end else begin
                            fValue := nData * 30 / 4096;
                            ValueTbl[nSlotNo-1, i] := fValue;
                        end;
                    end else
                        ValueTbl[nSlotNo-1, i] := INVALID_VALUE;

                end;
            end;
            except
                begin
                //StatusBar2.Panels[1].text := Format('nSlotNo=%d  Slot=%d  Ch=%d',[nSlotNo, j, i]);
                //Cb_Read.Checked := False;
                end;
            end;
            AddLog(Format('Slot%.2d: AD%d~%d : (%10.4f Sec) :',
                [nSlotNo, nStartCh, nEndCh, nTime / 10000]));
        end;


        KMI_ADE_CMD : begin // ADE Command
            //nSlotNo := nBoardID;
            nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
            nRange     := RxBuff[8];   //  xxxx xxxx    ->
            nSampling  := RxBuff[9];
            nChCount   := RxBuff[10];
            // 0x00000164 -> 356*100us -> 35.6ms
            fTimeStamp := StrToFloatDef(Format('%d',[RxBuff[10+nChCount+1]*$1000000+RxBuff[10+nChCount+2]*$10000+RxBuff[10+nChCount+3]*$100+RxBuff[10+nChCount+4]]),0)/100;

            nScaleIdx := ADIdx(nSlotNo);

            for i:= 0 to nChCount-1 do begin
                Idx   := (i*2) + 10 + nChCount + 5;
                nData := ((RxBuff[Idx]*$100 + RxBuff[Idx+1]) and $3FFF);
{
                // Bi-Pola
                if (nRange and $80) then
                    nData := (nData - $2000);

                fValue :=  nData/ $4000 * 10;
                fValue :=  nData/ $4000 * 5;  * (ADScale[nScaleIdx, i].Max - ADScale[nScaleIdx, i].Min) - ADScale[nScaleIdx, i].Min;

                //case nRange of  Bi/Uni, 5V/10V
                //                ~~         ~~~
}

{
                if nScaleIdx > -1 then begin
                    fValue := RescaleData(0, $3FFF, ADScale[nScaleIdx, i].Min, ADScale[nScaleIdx, i].Max, nData);  //<- 비율이 안맞아서 임시 적용... 9V입력시 9.56V읽힘..
                    fValue := (ADScale[nScaleIdx, i].Scale * fValue) + ADScale[nScaleIdx, i].Offset
                end;
                ValueTbl[nSlotNo-1, i] := fValue;
                {
                if (nData <> $FFFF) then begin
                    ////////////fValue := (nData - 8192) / 8192 * 20;  // 환산식...     8192 -> $2000
                    if nScaleIdx > -1 then begin
                        fValue := (nData - 8192) / 8192 * (ADScale[nScaleIdx, i].Max);
                        ValueTbl[nSlotNo-1, i] := (ADScale[nScaleIdx, i].Scale * fValue) + ADScale[nScaleIdx, i].Offset
                    end else begin
                        fValue := (nData - 8192) / 8192 * 10;
                        ValueTbl[nSlotNo-1, i] := fValue;
                    end;

                end else
                    ValueTbl[nSlotNo-1, i] := INVALID_VALUE;
                }
{            end;
            AddLog(Format('SlotNo%.2d: AD%d~%d : (%10.4f Sec) : Range %d : Sampling %d : TimeStamp %f :',
                [nSlotNo, 1, nChCount, nTime / 10000, nRange, nSampling, fTimeStamp]));

        end;


        // AD Buffer Read
        $0216 : begin
            nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
            nRange     := RxBuff[8];
            nSampling  := RxBuff[9];
            nChCount   := RxBuff[10];
            // 0x00000164 -> 356*100us -> 35.6ms
            fTimeStamp := StrToFloatDef(Format('%d',[RxBuff[10+nChCount+1]*$1000000+RxBuff[10+nChCount+2]*$10000+RxBuff[10+nChCount+3]*$100+RxBuff[10+nChCount+4]]),0)/100;

            nScaleIdx := ADIdx(nSlotNo);
            try
            for j:= 0 to FRecordCount-1 do begin
                for i:= 0 to nChCount-1 do begin
                    Idx := (j*(nChCount*2))+(i*2) + 10 + nChCount + 5;
                    nData := ((RxBuff[Idx]*$100 + RxBuff[Idx+1]) and $3FFF);

                    if nScaleIdx > -1 then begin
                        fValue := RescaleData(0, $3FFF, ADScale[nScaleIdx, i].Min, ADScale[nScaleIdx, i].Max, nData);  //<- 비율이 안맞아서 임시 적용... 9V입력시 9.56V읽힘..
                        fValue := (ADScale[nScaleIdx, i].Scale * fValue) + ADScale[nScaleIdx, i].Offset
                    end;
                    BuffTbl[j, i] := fValue;

                    {
                    if (nData <> $FFFF) then begin
                        if nScaleIdx > -1 then begin
                            fValue := (nData - 8192) / 8192 * (ADScale[nScaleIdx, i].Max);
                            BuffTbl[j, i] := fValue;
                        end else begin
                            fValue := (nData - 8192) / 8192 * 30;  // 환산식...
                        end;
                    end else
                        BuffTbl[j, i] := INVALID_VALUE;
                        }
{                end;
            end;
            AddLog(Format('SlotNo%.2d: AD%d~%d : (%10.4f Sec) : DataLen %d : Range %d : Sampling %d : TimeStamp %f :',
                [nSlotNo, 1, nChCount, nTime / 10000, nDataLen, nRange, nSampling, fTimeStamp]));
            except
                //
            end;

        end;


        // AD Buffer Status
        // 0x01 : Busy 상태 - 현재 Buffer Mode 로 ADC 수행중
        // 0x03 : Busy 상태 - 현재 Continuous Mode 로 ADC 수행중
        // 0x00 : Non Busy 상태 - 현재 ADC 수행하지 않음
        // 0x80 : ADC Complate
        $0218 : begin
           nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
           case RxBuff[8] of
              $00 :  FBuffStatus := st_NonBusy;
              $01 :  FBuffStatus := st_BusyBuffer;
              $03 :  FBuffStatus := st_BusyContinus;
              $80 :  FBuffStatus := st_Complete;
           end;
           AddLog(Format('SlotNo%.2d: Status %x',[nSlotNo, RxBuff[8]]));
        end;

    end;
    // AA 01 00 00 10 13 00 40 00 9F AB D1 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ED
end;
}

procedure TSocketKMI.Connect;
begin
    Ip := IpEnd(FIp);  // 192.168.0.100
    FSocket.Address := FIp;
    FSocket.Active  := True;
end;

procedure TSocketKMI.disconnect;
begin
    FSocket.Active := False;
    FSocket.Socket.Close;
end;

// Log 정보를 Display 한다.
procedure TSocketKMI.AddLog(Param : String);
var text : TextFile;
    sDir, sFileName : String;
begin
    if Not bSaveLog then exit;
    sDir := GetAppDir('')+'LOG';
    sDir := StringReplace(sDir, '\\' , '\', [rfReplaceAll]);
    if Not DirectoryExists(sDir) then ForceDirectories(sDir);

    sFileName := sDir + '\' + Format('192_168_0_%d.log',[Ip]);
    Param     := Format('[%s]:%s',[FormatDateTime('HH:NN:SS.ZZZ',Now),Param]);
    AssignFile (text, sFileName);
    try
    	  if Not FileExists(sFileName) then Rewrite (text) else Append (text);
        WriteLn (text, Param );
    finally
    	  CloseFile (text);
    end;
end;


procedure TSocketKMI.Lock;
begin
    FBuffLock.Enter;
end;

procedure TSocketKMI.UnLock;
begin
    FBuffLock.Leave;
end;

end.
