//****************************************************************************//
//   Station 은 이곳에서 생성한다.
//****************************************************************************//
unit uStation;

interface

uses
  Classes, Sysutils, HWGlobal ,uSocketKMI, uEthernetAD;

type
  TSlot = record
      BdType : Integer;
      BdIdx  : Integer;  // 보드 종류별 Index
      SlotIP : String;
  end;

  TStation = class
  private
    FThread : TThread;
    procedure EnSlotConnect(bConnect:Boolean);
    procedure ThreadReadCreate;
    procedure ThreadTerminate;
    procedure ReadADAll;
    function ADIdx(SlotNo: Integer): Integer;
  protected
    //FThread : TThreadRead;
  public
    FStation : Integer;
    FIP : String;

    FSocket : TSocketKMI;

    FADCnt, FDOCnt, FDICnt, FDACnt, FROCnt, FADECnt, FCANCnt : Integer; // Station 내부의 AD 카운트

    FSlot : array[1..MAX_SLOT] of TSlot;
    EthernetAD : array of TEthernetAD;

    FADScale : array of array of TADScale;

    constructor Create;
    destructor  Destroy; override;
    procedure   Build(Param:String);
    procedure   Connect;
    procedure   DisConnect;

    function    Write(Command : Integer; Data : array of Byte):Boolean;
    function    Read : Boolean;
  end;

  TThreadRead = class(TThread)
  private
    FStation : TStation;
  public
    Enabled : Boolean;
    procedure Execute; override;
    constructor Create(Parent : TObject);
  end;

implementation

uses GenUtils, FormHWMain;

// AD 값을 읽어온다.
procedure TStation.ReadADAll;
var i, j, nCnt : Integer;
    aAIData : array of Byte;
    aDIData : array of Byte;
begin
    if not TThreadRead(FThread).Enabled then exit;

    //--------------------------------------------------------------------------
    // Station 에 AD가 있으면 KMI_ADALL_CMD 명령어 사용.
    if FADCnt > 0 then //
    begin
        SetLength(aAIData, FAdCnt);
        nCnt := 0;
        for i:=1 to MAX_SLOT do
        begin
            if FSlot[i].BdType = KMI_AD then
            begin
                aAIData[nCnt] := i;
                Inc(nCnt);
                if nCnt = FADCnt then break;  // AD Count 만큼 읽었다면 루프를 빠진다.
            end;
        end;
        Write(KMI_ADALL_CMD, aAIData);
    end;

    //--------------------------------------------------------------------------
    // Station 에 DI가 있으면...
    if FDICnt > 0 then
    begin
        SetLength(aDIData, FDICnt);
        nCnt := 0;
        for i:=1 to MAX_SLOT do
        begin
            if FSlot[i].BdType = KMI_DI then
            begin
                //Write(KMI_DI_CMD, [i]);   // <-  이 명령어로 이용.

                aDIData[nCnt] := i;
                Inc(nCnt);
                if nCnt = FDICnt then break;  // DI Count 만큼 읽었다면 루프를 빠진다.
            end;
        end;
        Write(KMI_DIALL_CMD, aDIData);   // <-  이 명령어로 이용.
    end;
end;

{ TStation }
constructor TStation.Create;
begin
    inherited;
    ThreadReadCreate;
end;

destructor TStation.Destroy;
begin
    ThreadTerminate;
    inherited;
end;

{ TThreadRead }
constructor TThreadRead.Create(Parent : TObject);
begin
    inherited Create(False);
    FStation := TStation(Parent);
    Enabled := False;
end;

//------------------------------------------------------------------------------
// Thread 생성 (Read)
procedure TStation.ThreadReadCreate;
begin
    FThread := TThreadRead.Create(Self);
    FThread.Resume();
end;

//------------------------------------------------------------------------------
// Thread 종료
procedure TStation.ThreadTerminate;
begin
    if FThread <> nil then
        FThread.Terminate;
end;


//------------------------------------------------------------------------------
// Read Thread Excute Message 처리 각 Station마다 별도 Thread로 Read를 수행한다.
procedure TThreadRead.execute;
begin
    while not Terminated do
    begin
        FStation.ReadADAll;
        Sleep(20);  // 20 ms 주기로 ReadADAll수행.
    end;
end;

//------------------------------------------------------------------------------
// Station 의 Slot 을 구성한다.
procedure TStation.Build(Param:String);
var str : String;
    i, idx : Integer;
begin
    TThreadRead(FThread).Enabled := False;
    FAdCnt   := 0;
    FDoCnt   := 0;
    FDiCnt   := 0;
    FDACnt   := 0;
    FROCnt   := 0;
    FADECnt  := 0;

    
    for i := 1 to MAX_SLOT do
    begin
        if i = 1 then
        begin
            FSocket := TSocketKMI.create;  // Station 의 Main Socket Create
           // FStation := i;
            FSocket.OnEvent  := FrmHWMain.OnEvent;
        end;
        
        str := GetToKen(Param,',');
        if (str = '') or (str = 'NONE')  then FSlot[i].BdType := KMI_NONE;
        if (str = 'AD') then
        begin
            Inc(FADCnt);
            Inc(ADCntTmp);
            FSlot[i].BdType := KMI_AD;
            FSlot[i].BdIdx  := FADCnt; //ADCntTmp;
            ADTbl[ADCntTmp-1].Station  := FStation;
            ADTbl[ADCntTmp-1].Slot     := i;
        end;
        if (str = 'AD(E)') then
        begin
            Inc(FADECnt);
            Inc(ADCntTmp);
            FSlot[i].BdType := KMI_ADE;
            FSlot[i].BdIdx  := ADCntTmp;
            ADTbl[ADCntTmp-1].Station  := FStation;
            ADTbl[ADCntTmp-1].Slot     := i;

            SetLength(EthernetAD, FADECnt);
            EthernetAD[FADECnt-1] := TEthernetAD.Create;
            EthernetAD[FADECnt-1].FStation := FStation;
            EthernetAD[FADECnt-1].FBDIndex := ADCntTmp;
            EthernetAD[FADECnt-1].FSlot := i;
            EthernetAD[FADECnt-1].FIP := ParseIp(FIP, i);
            EthernetAD[FADECnt-1].FSocket.OnEvent := FrmHWMain.OnEvent;
        end;
        {
        // CAN
        if (str = 'CAN(E)') then
        begin
            Inc(FCANCnt);
            Inc(CANCntTmp);
            SetLength(EthernetCAN, CANCntTmp);
            EthernetCAN[FCANCnt-1] := TEthernetCAN.Create;
            EthernetCAN[FCANCnt-1].FStation := FStation;
            EthernetCAN[FCANCnt-1].FSlot := i;
            EthernetCAN[FCANCnt-1].FIP := ParseIp(FIP, i);
            EthernetCAN[FCANCnt-1].FSocket.OnEvent := FrmHWMain.OnEvent;
        end;
        }
        if Pos('DO', Str) > 0 then
        begin
            GetToKen(Str,'_');
            if Str = '' then Str := '16';
            Inc(FDoCnt);
            Inc(DOCntTmp);
            FSlot[i].BdType := KMI_DO;
            FSlot[i].BdIdx  := DOCntTmp;
            DOTbl[DOCntTmp-1].Station := FStation;
            DOTbl[DOCntTmp-1].Slot    := i;
            DOTbl[DOCntTmp-1].MaxCh   := StrToInt(Str);
        end;
        if Pos('DI', Str) > 0 then
        begin
            GetToKen(Str,'_');
            if Str = '' then Str := '16';
            Inc(FDiCnt);
            Inc(DICntTmp);
            FSlot[i].BdType := KMI_DI;
            FSlot[i].BdIdx  := DICntTmp;
            DITbl[DICntTmp-1].Station := FStation;
            DITbl[DICntTmp-1].Slot    := i;
            DITbl[DICntTmp-1].MaxCh   := StrToInt(Str);
        end;
        if (str = 'DA')                  then
        begin
            Inc(FDaCnt);
            Inc(DACntTmp);
            FSlot[i].BdType := KMI_DA;
            FSlot[i].BdIdx := DACntTmp;
            DATbl[DACntTmp-1].Station := FStation;
            DATbl[DACntTmp-1].Slot    := i;
        end;
        if Pos('RO', Str) > 0 then
        begin
            GetToKen(Str,'_');
            Inc(FRoCnt);
            Inc(ROCntTmp);
            FSlot[i].BdType := KMI_RO;
            FSlot[i].BdIdx := ROCntTmp;
            ROTbl[ROCntTmp-1].Station  := FStation;
            ROTbl[ROCntTmp-1].Slot     := i;
            ROTbl[ROCntTmp-1].MaxCh   := StrToInt(Str);
        end;
    end;

    TThreadRead(FThread).Enabled := True;

end;


// Main Socket 연결
procedure TStation.Connect;
begin
    FSocket.FIP := FIP;
    FSocket.Connect;
    EnSlotConnect(True);
end;

// Main Socket 해제
procedure TStation.DisConnect;
begin
    FSocket.DisConnect;
    EnSlotConnect(False);
end;

// Ethernet Slot 의 Socket 연결
procedure TStation.EnSlotConnect(bConnect:Boolean);
var i : integer;
begin
    for i:=0 to FADECnt-1 do
    begin
        if bConnect then EthernetAD[i].Connect('')
                    else EthernetAD[i].DisConnect;
    end;
end;

//------------------------------------------------------------------------------\
// 명령을 전송한다.
function TStation.Write(Command : Integer; Data : array of Byte):Boolean;
var nRetry : Integer;
begin
    FSocket.Lock;
    try
        // Command Retry추가.
        for nRetry := 1 to 3 do begin
            if FSocket.SendCommand(Command, Data) then
            begin
                Result := Read();
                if Result then break;
            end else
                Result := False;
        end;
    finally
        FSocket.UnLock;
    end;
end;

//------------------------------------------------------------------------------\
// Socket Response Data 를 Decoding한다.
function TStation.Read : Boolean;
var i, j, Idx, nBoardID, nStatus, nCommand, nSlotIdx, nDataLen, nSlotNo, nStartCh, nEndCh, nChCount, nStationNo, nSlotCnt : Integer;
    nTime : Cardinal;
    nData, nChPo : Integer;
    fValue : Double;
    CheckSum : Byte;
    nRange, nSampling, nScaleIdx : Integer;
    fTimeStamp : Double;
    sValue, sErrorMsg: string;
begin
    Result := False;
    sErrorMsg := 'Unknown Error';

    try
        with FSocket do
        begin
            // 1) 응답데이터가 없는경우.
            if (RxLen = 0) then begin
                sErrorMsg := 'No Response';
                exit;
            end;

            // 2) Header 를 비교한다.
            if (RxBuff[0] <> $AA) then
            begin
                sErrorMsg := 'Header Error';
                exit;
            end;

            // 3) CheckSum 비교.
            CheckSum := 0;
            for i:= 0 to RxLen-2 do
                CheckSum := Byte(CheckSum + RxBuff[i]);

            if (CheckSum <> RxBuff[RxLen-1]) then
            begin
                sErrorMsg := 'Checksum Error';
                exit;
            end;

            nBoardID := RxBuff[1];
            nStatus  := RxBuff[2];
            nCommand := RxBuff[3]*$10000 + RxBuff[4]*$100 + RxBuff[5];
            nDataLen := RxBuff[6]*$100   + RxBuff[7];
            nSlotNo  := RxBuff[8];
            nTime    :=(RxBuff[9]*1000000) +
                       (RxBuff[10]*$10000) +
                       (RxBuff[11]*$100)   +  RxBuff[12];  // 시간은 0.1ms단위...


            // 4) 유효 Slot 비교.
            if (not nSlotNo in [1..19]) then begin
                sErrorMsg := 'Station Range Over';
                exit;
            end;

            nSlotNo := nSlotNo + ((FStation-1) * MAX_SLOT);

            // 5) Command 확인.
            case  nCommand of
                //------------------------------------------------------------------
                KMI_DM_CMD : begin // Dummy Command ($0008)
                    Result := True;
                end;
                //------------------------------------------------------------------
                KMI_WR_CMD : begin // Port Write Command. ($1010)
                    // Port Write Command는 시간정보만 들어온다..  헤더와 CS만 확인하고 끝.

                    // EX) AA 01 00 00 10 10 00 04 00 46 A0 BD 72
                    //     ~~ ~~ ~~ ~~~~~~~~ ~~~~~ ~~~~~~~~~~~ ~~
                    //     Hd ID St  CMD      Len     Time     CS

                    Result := True;
                end;
                //------------------------------------------------------------------
                KMI_RD_CMD : begin // Read Command. ($1011)
                    // T010 : 55 0A 00 10 11 00 02 04 03 89
                    // R016 : AA 0A 00 00 10 11 00 07 04 03 00 0F EC E3 00 00
                    nChPo := RxBuff[9];
                    nData := RxBuff[14];

                    for i:=0 to 7 do
                    begin
                        if ((nData and (1 shl (i)) <> 0)) then
                            ValueTbl[nSlotNo-1, i+(nChPo*8)] := 1
                        else
                            ValueTbl[nSlotNo-1, i+(nChPo*8)] := 0;
                    end;
                    Result := True;
                end;
                //------------------------------------------------------------------
                KMI_AD_CMD : begin      // AD Single Read Command ($1012)
                    // 미구현.  Firmware구성되어있으나 개별채널 Read 굳이 사용안함.
                    Result := True;
                end;

                //------------------------------------------------------------------
                KMI_ADSCAN_CMD : begin // AD Scan Command ($1013)
                    // AA 01 00 00 10 13 00 40 00 9F AB D1 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ED
                    nStartCh := RxBuff[13];
                    nEndCh   := RxBuff[14];
                    nChCount := nEndCh - nStartCh + 1;

                    nScaleIdx := ADIdx(nSlotNo);

                    for i:= 0 to nChCount-1 do begin
                        Idx := (i*2) + 15;
                        nData := RxBuff[Idx]*$100 + RxBuff[Idx+1];

                        if (nData <> $FFFF) then begin
                            fValue := RescaleData(0, 4096,
                                        FADScale[nScaleIdx, i].Min, FADScale[nScaleIdx, i].Max, nData);

                            if nScaleIdx > -1 then
                                ValueTbl[nSlotNo-1, i] := (FADScale[nScaleIdx, i].Scale * fValue) + FADScale[nScaleIdx, i].Offset
                            else
                                ValueTbl[nSlotNo-1, i] := fValue;
                        end else
                            ValueTbl[nSlotNo-1, i] := INVALID_VALUE;
                    end;
                    Result := True;
                    //AddLog(Format('Slot%.2d: AD%d~%d : (%10.4f Sec) :',
                    //      [nSlotNo, nStartCh, nEndCh, nTime / 10000]));
                end;


                //------------------------------------------------------------------
                KMI_DA_CMD : begin // DA Command. ($0104)
                    // RX) AA 01 00 00 10 14 00 08 10 06 BD E7 81 00 06 66 7E
                    Result := True;
                end;
                //------------------------------------------------------------------
                KMI_DO_CMD : begin // DO Command. ($1015)

                    Result := True;
                end;

                //------------------------------------------------------------------
                KMI_DI_CMD : begin // DI Command. ($1016)
                   nData := RxBuff[13]*$100 + RxBuff[14];

                    for i:= 0 to 15 do begin
                        if ((nData and (1 shl (i)) <> 0)) then
                            ValueTbl[nSlotNo-1, i] := 1
                        else
                            ValueTbl[nSlotNo-1, i] := 0;
                    end;
                    Result := True;
                end;
                //------------------------------------------------------------------
                KMI_RO_CMD : begin // PGMR Command. ($1017)
                   nData := RxBuff[13]*$10000 + RxBuff[14]*$100 + RxBuff[15];
                   fValue := 0;
                   Result := True;
                end;
                //------------------------------------------------------------------
                KMI_ADALL_CMD : begin // AD ALL READ ($1018)
                    //sValue := MakeHexaString(@RxBuff, RxLen); // 확인용.

                    nSlotCnt := RxLen-(9+4);        // Header+CS(9) + Time(4)데이터를 제거하고..
                    nSlotCnt := (nSlotCnt mod 64);  // AD 측정당 64Byte로 구성.  64Byte씩 뺀 나머지가 Slot수.
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
                                        fValue := RescaleData(0, 4096, FADScale[j, i].Min, FADScale[j, i].Max, nData);

                                        ValueTbl[nSlotNo-1, i] := (FADScale[j, i].Scale * fValue) + FADScale[j, i].Offset;
                                    end else begin
                                        // Default Scale 0~FFF => 0~30V
                                        fValue := nData * 30 / 4096;
                                        ValueTbl[nSlotNo-1, i] := fValue;
                                    end;
                                end else
                                    ValueTbl[nSlotNo-1, i] := INVALID_VALUE;
                            end;
                        end;
                        Result := True;
                    except
                    end;

                    //AddLog(Format('Slot%.2d: AD%d~%d : (%10.4f Sec) :',
                    //      [nSlotNo, nStartCh, nEndCh, nTime / 10000]));
                end;
                //------------------------------------------------------------------
                KMI_DIALL_CMD : begin // DI ALL READ ($1019)
                    // DI갯수에따라 Frame길이가 가변된다. DI갯수는 Tx로 확인한다.  2015.3.5
{                    nSlotCnt :=  TxBuff[5]*$100 + TxBuff[6];

                    //  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
                    // AA 01 00 00 10 19 00 0A 09 0C 01 E8 95 7C 00 00 00 00 ED.
                    //                         ~~~~~~            ~~~~~ ~~~~~
                    //                          Slot List        Data1  Data2 ...
                    try
                        for j:= 0 to nSlotCnt-1 do begin
                            nSlotNo := RxBuff[j+8];
                            nSlotNo := nSlotNo + ((FStation-1) * MAX_SLOT);

                            Idx := (j*2) + nSlotCnt + 12; //i
                            nData   := RxBuff[Idx]*$100 + RxBuff[Idx+1];

                            for i:= 0 to 15 do begin
                                if ((nData and (1 shl (i)) <> 0)) then
                                    ValueTbl[nSlotNo-1, i] := 1
                                else
                                    ValueTbl[nSlotNo-1, i] := 0;
                            end;
                        end;
                        Result := True;
                    except
                    end;                                                        }
                    Result := True;
                end;
                //------------------------------------------------------------------
                else
                    sErrorMsg := Format('UnKnown Command (0x%.4x)', [nCommand]);
            end;
        end;

    finally
        {if not Result then
            WriteDebugStr(Format('%s : %s',
                [MakeHexaString(@FSocket.RxBuff[0], FSocket.RxLen),  sErrorMsg]));
        }
    end;
end;


// SLOT 번호를 받아와서 ADTbl 의 INDEX 를 리턴한다.
function TStation.ADIdx(SlotNo:Integer):Integer;
var i : Integer;
begin
    Result := -1;
    for i:= 0 to (ADCnt)-1 do
    begin
        if i > High(ADTbl) then break;
        if SlotNo = ((ADTbl[i].Station-1) * MAX_SLOT) + ADTbl[i].Slot then
        begin
            Result := i;
            break;
        end;
    end;
end;



end.
