//****************************************************************************//
//
//   EthernetAD Board���� ���� Slot ���� �̰����� �����Ѵ�.
//
//   KMI Controller�� ��ġ�Ǵ� ��� Ethernet����� Base Class.
//
//****************************************************************************//
unit uEthernetAD;

interface

uses
  Classes, Sysutils, HWGlobal, uSocketKMI;

const
    MAX_ADE_CAHNNEL = 32;
    RETRY = 3;

type
  TEthernetADStatus = ( st_Ready, st_Busy, st_Complete, st_Fail );

  TEthernetAD = class
  private
    BuffTbl  : TRdBuff;     // Buff�� �޸�..

    FThread : TThread;      // ������ Thread.

    FBuffMemory   : TRdBuff;   // Buff�޸�.
    FBuffLengh    : Integer;   // Buffer �޸�  Size.
    FBuffStatus   : Byte;      // 0x01 : Busy ���� - ���� Buffer Mode �� ADC ������
                               // 0x03 : Busy ���� - ���� Continuous Mode �� ADC ������
                               // 0x00 : Non Busy ���� - ���� ADC �������� ����
                               // 0x80 : ADC Complate
    procedure ThreadReadCreate;
    procedure ThreadTerminate;

    function  Write(Command : Integer; Data : array of Byte):Boolean;
    function  Read : Boolean;
  public
    FSocket : TSocketKMI;

    FIP : String;
    FSlot : Integer;
    FStation : Integer;  // �ڽ��� ���� Station �� Slot No.
    FData : TSdBuff;
    FBDIndex : Integer;  // �ڽ��� ���� Board �׷��� Index
    FADScale  : array [0..MAX_ADE_CAHNNEL-1] of TADScale;

    FMode : Integer;                // FMode

    FSamplingRate : Double;     // SamplingRate.
    FChannalList  : String;     // ä�θ��.
    FChannelCount : Integer;    // ���۷� �о���� ä���� ī��Ʈ
    FRecordCount  : Integer;    // Record Size ä�δ� Recordü Count.

    EthernetADStatus  : TEthernetADStatus;

    constructor Create;
    destructor  Destroy; override;

    procedure SetReadPolling(bOnOff : Boolean);

    procedure Connect(sIP : String = '');
    procedure DisConnect;

    procedure ReadADE;

    // Buffer Memory �����..
    function  StartBuffer(sChannel: String; fSampling: Double; nRecordCount: Integer): Boolean;
    function  RunBuffer : Boolean;
    function  ReadBufferStatus : Boolean;
    function  ReadBuffer() : Boolean;
    function  ReturnBuffer() : Pointer;
  end;


implementation

uses GenUtils;

{ TEthernetAD }

type
  TThreadRead = class(TThread)
  private
    FeEthernetAD : TEthernetAD;
  public
    Enabled : Boolean;
    procedure Execute; override;
    constructor Create(Parent : TObject);
  end;

constructor TEthernetAD.Create;
begin
    inherited;
    FSocket := TSocketKMI.create;
    FMode := 0;
    FBuffStatus := 0;

    // Ethernet����� �����Ǹ� �⺻������ ������ ������.
    ThreadReadCreate;
end;

destructor TEthernetAD.Destroy;
begin
    // ����� ������������.
    ThreadTerminate;
    DisConnect;
    inherited;
end;


procedure TEthernetAD.Connect(sIP : String = '');
begin
    if (sIP <> '') then FIP := sIP;

    try
        FSocket.FIP := FIP;
        FSocket.Connect;
    except
    end;
end;

procedure TEthernetAD.DisConnect;
begin
    FSocket.DisConnect;
end;

procedure TEthernetAD.SetReadPolling(bOnOff: Boolean);
begin
    TThreadRead(FThread).Enabled := bOnOff;
end;

{ TThreadRead }
constructor TThreadRead.Create(Parent : TObject);
begin
    inherited Create(False);
    
    FeEthernetAD := TEthernetAD(Parent);
    Enabled := True;  // ������ �����ϸ� ��Ž���.
end;

//------------------------------------------------------------------------------
// Thread ���� (Read)
procedure TEthernetAD.ThreadReadCreate;
begin
    FThread := TThreadRead.Create(Self);
    FThread.Resume();
end;

//------------------------------------------------------------------------------
// Thread ����
procedure TEthernetAD.ThreadTerminate;
begin
    if FThread <> nil then begin
        FThread.Terminate;
    end;
end;

//------------------------------------------------------------------------------
// Read Thread Excute Message ó���ӵ��� ���ؼ� ������ó����.
procedure TThreadRead.execute;
var
    fCheckTime, fTimeOut : Double;
begin
    while not Terminated do
    begin
        case FeEthernetAD.FMode of
        // 0) Pollig ���..
        0 : begin
            //
            if Enabled then
                FeEthernetAD.ReadADE;
        end;

        // 1) ���� �б� ����.
        1: begin
            FeEthernetAD.EthernetADStatus := st_Busy;
            if FeEthernetAD.RunBuffer then
            begin
                FeEthernetAD.FMode := 2;

                fCheckTime := GetTickCountEx;
                FeEthernetAD.FSocket.AddLog('Buffer Start');
            end else begin
                FeEthernetAD.FMode := 0;
                FeEthernetAD.EthernetADStatus := st_Ready;
            end;
        end;

        // 2) ���� �б� �Ϸ� ���..
        2 : begin
            // Timeoutó��..
            if FeEthernetAD.FSamplingRate <> 0 then
                fTimeOut :=  FeEthernetAD.FRecordCount / (FeEthernetAD.FSamplingRate/1000) + 500
            else
                fTimeOut := 0;

            if (GetTickCountEx - fCheckTime > fTimeOut) then begin
                FeEthernetAD.FSocket.AddLog('Buffer Timout');
                FeEthernetAD.FMode := 4;
            end;

            if FeEthernetAD.ReadBufferStatus then
            begin
                if (FeEthernetAD.FBuffStatus = $80) then begin
                    FeEthernetAD.FSocket.AddLog('Buffer Complete');
                    FeEthernetAD.FMode := 3;
                end;
            end;
        end;

        // 3) ���۸� �а� ����ó���Ѵ�. ����Ǹ� �ٽ� �������� ����.
        3 : begin
             if FeEthernetAD.ReadBuffer() then
             begin
                FeEthernetAD.EthernetADStatus := st_Complete;
                FeEthernetAD.FSocket.AddLog('Buffer Read Complete');
                FeEthernetAD.FMode := 0;
             end else
                FeEthernetAD.FMode := 4;
        end;
        
        // 4) �����б� ����..
        4 : begin
            // ����&����..ó��...

            FeEthernetAD.FMode := 0;
            FeEthernetAD.EthernetADStatus := st_Fail;

            FeEthernetAD.FSocket.AddLog('Error');
        end;
        end;
        Sleep(10);
    end;
end;

//------------------------------------------------------------------------------
// ADE ��ü ä���� ���� READ
procedure TEthernetAD.ReadADE;
begin
    // ReadADE
    Write(KMI_ADE_CMD, [0, MAX_ADE_CAHNNEL-1]);
end;

//------------------------------------------------------------------------------
// ADE BUFFER �� ���°��� READ
function TEthernetAD.ReadBufferStatus : Boolean;
begin
    Result := Write(KMI_ADE_BUFF_STATUS, []);
end;

//------------------------------------------------------------------------------
// ADE BUFFER �� ������� ����
function TEthernetAD.ReadBuffer() : Boolean;
var ptr : Pointer;
begin
    Result := False;

    if FBuffStatus = $80 then
    begin
        Result := Write(KMI_ADE_BUFF_READ, []);
    end;
end;

//------------------------------------------------------------------------------
function TEthernetAD.ReturnBuffer():Pointer;
begin
    Result := @BuffTbl;
end;


//------------------------------------------------------------------------------
// ����� �����Ѵ�.
function TEthernetAD.Write(Command : Integer; Data : array of Byte):Boolean;
var bWriteResult : Boolean;
    i : Integer;
begin
    Result := False;
    for i:=1 to RETRY do
    begin
        FSocket.Lock;
        try
            bWriteResult := FSocket.SendCommand(Command, Data);
        finally
            FSocket.UnLock;
        end;
        if bWriteResult then break; 
    end;
    if bWriteResult then
        Result := Read;
end;


function TEthernetAD.StartBuffer(sChannel: String; fSampling: Double;
  nRecordCount: Integer): Boolean;
begin
    FChannalList  := sChannel;
    FRecordCount  := nRecordCount;
    FSamplingRate := fSampling;
    
    EthernetADStatus := st_Busy;

    FMode := 1;
end;

function TEthernetAD.RunBuffer : Boolean;
var i : Integer;
    nSampleIdx : Byte;
    aData : array of Byte;
    StrList : TStringList;
begin
    Result := False;

//******************************************************************************
// AD Buffer Read �� Sampling Rate Table
// -----------------------------------------------------------------------------
//         �ֻ��� Bit  |    0     |    1     |    Ch �� Limit
//   Value             |          |          |    (Khz �������� �ش�)
//   ------------------|----------|----------|----------------------------------
//           0         |   1Hz    |  1KHz    |    �������
//           1         |   2Hz    |  2KHz    |    �������
//           2         |   5Hz    |  5KHz    |    �������
//           3         |   10Hz   |  10KHz   |    20 ea
//           4         |   20Hz   |  20KHz   |    10 ea
//           5         |   50Hz   |  50KHz   |    4 ea
//           6         |   100Hz  |  100KHz  |    3 ea
//           7         |   200Hz  |  200KHz  |    1 ea
//           8         |   250Hz  |  250KHz  |    1 ea
//           9         |   300Hz  |  300KHz  |    1 ea
//           10        |   500Hz  |  500KHz  |    1 ea
//******************************************************************************

    if (FSamplingRate >= 500000) then begin nSampleIdx := $8A; FSamplingRate := 500000 end else // 500KHz
    if (FSamplingRate >= 300000) then begin nSampleIdx := $89; FSamplingRate := 300000 end else // 300KHz
    if (FSamplingRate >= 250000) then begin nSampleIdx := $88; FSamplingRate := 250000 end else // 250KHz
    if (FSamplingRate >= 200000) then begin nSampleIdx := $87; FSamplingRate := 200000 end else // 200KHz
    if (FSamplingRate >= 100000) then begin nSampleIdx := $86; FSamplingRate := 100000 end else // 100KHz
    if (FSamplingRate >= 50000 ) then begin nSampleIdx := $85; FSamplingRate := 50000  end else // 50KHz
    if (FSamplingRate >= 20000 ) then begin nSampleIdx := $84; FSamplingRate := 20000  end else // 20KHz
    if (FSamplingRate >= 10000 ) then begin nSampleIdx := $83; FSamplingRate := 10000  end else // 10KHz
    if (FSamplingRate >= 5000  ) then begin nSampleIdx := $82; FSamplingRate := 5000   end else // 5KHz
    if (FSamplingRate >= 2000  ) then begin nSampleIdx := $81; FSamplingRate := 2000   end else // 2KHz
    if (FSamplingRate >= 1000  ) then begin nSampleIdx := $80; FSamplingRate := 1000   end else // 1KHz

    if (FSamplingRate >= 500   ) then begin nSampleIdx := $0A; FSamplingRate := 500    end else // 500KHz
    if (FSamplingRate >= 300   ) then begin nSampleIdx := $09; FSamplingRate := 300    end else // 300KHz
    if (FSamplingRate >= 250   ) then begin nSampleIdx := $08; FSamplingRate := 250    end else // 250KHz
    if (FSamplingRate >= 200   ) then begin nSampleIdx := $07; FSamplingRate := 200    end else // 200KHz
    if (FSamplingRate >= 100   ) then begin nSampleIdx := $06; FSamplingRate := 100    end else // 100KHz
    if (FSamplingRate >= 50    ) then begin nSampleIdx := $05; FSamplingRate := 50     end else // 50KHz
    if (FSamplingRate >= 20    ) then begin nSampleIdx := $04; FSamplingRate := 20     end else // 20KHz
    if (FSamplingRate >= 10    ) then begin nSampleIdx := $03; FSamplingRate := 10     end else // 10KHz
    if (FSamplingRate >= 5     ) then begin nSampleIdx := $02; FSamplingRate := 5      end else // 5KHz
    if (FSamplingRate >= 2     ) then begin nSampleIdx := $01; FSamplingRate := 2      end else // 2KHz
    if (FSamplingRate >= 1     ) then begin nSampleIdx := $00; FSamplingRate := 1      end;      // 1KHz
    
    StrList := TStringList.Create;
    try
        StrList.Text := ReplaceStr(FChannalList, ',', CRLF);
        FChannelCount := StrList.Count;

        if (FChannelCount > 0) and (FRecordCount > 0)then
        begin
            // �޸� �Ҵ�. ������ �Ҵ�.
            FBuffLengh := FRecordCount * FChannelCount;

            SetLength(BuffTbl, 0, 0);
            SetLength(BuffTbl, FRecordCount, FChannelCount);

            // ä�� ������ �Ѵ�.
            SetLength(aData, FChannelCount+4);
            aData[0] := nSampleIdx;
            aData[1] := HI(FRecordCount);
            aData[2] := LO(FRecordCount);
            aData[3] := FChannelCount;
            for i:=0 to FChannelCount-1 do
                aData[4+i] := StrToIntDef(StrList[i], 0)-1;

            Result := Write(KMI_ADE_BUFF_SET, aData);
            FSocket.AddLog(Format('KMI_ADE_BUFF_SET %d',[Ord(Result)]));
        end else begin
            FBuffLengh := 0;
            SetLength(BuffTbl, 0, 0);
        end;
    finally
        StrList.Free;
    end;
end;

//------------------------------------------------------------------------------
function TEthernetAD.Read:Boolean;
var i, j, Idx, nBoardID, nStatus, nCommand : Integer;
    nSlotIdx, nDataLen, nSlotNo, nStartCh, nEndCh, nChCount, nStationNo, nSlotCnt : Integer;
    nTime : Cardinal;
    nData : Integer;
    fValue : Double;
    CheckSum : Byte;
    nRange, nSampling, nScaleIdx : Integer;
    fTimeStamp : Double;

    ChIdx : array[0..MAX_ADE_CAHNNEL-1] of Byte;
begin
    Result := False;

    try

    with FSocket do begin
    // 1) Header �� ���Ѵ�.
    if (RxBuff[0] <> $AA) then begin
        FSocket.AddLog('Header Error');
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
               (RxBuff[11]*$100)   +  RxBuff[12];           // �ð��� 0.1ms����...

    if (not nSlotNo in [1..MAX_SLOT]) then exit;

    nSlotNo := nSlotNo + ((FStation-1) * MAX_SLOT);

    case  nCommand of
        KMI_ADE_CMD : begin // ADE Command
            //nSlotNo := nBoardID;
            nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
            nRange     := RxBuff[8];   //  xxxx xxxx    ->
            nSampling  := RxBuff[9];
            nChCount   := RxBuff[10];
            // 0x00000164 -> 356*100us -> 35.6ms
            fTimeStamp := StrToFloatDef(Format('%d',[RxBuff[10+nChCount+1]*$1000000+RxBuff[10+nChCount+2]*$10000+RxBuff[10+nChCount+3]*$100+RxBuff[10+nChCount+4]]),0)/100;

            nScaleIdx := FBDIndex;

            for i:= 0 to nChCount-1 do begin
                Idx   := (i*2) + 10 + nChCount + 5;
                nData := ((RxBuff[Idx]*$100 + RxBuff[Idx+1]) and $3FFF);
{
                // Bi-Pola / UniPola.
                if (nRange and $80) then
                    nData := (nData - $2000);

                fValue :=  nData/ $4000 * 10;
                fValue :=  nData/ $4000 * 5;  * (ADScale[nScaleIdx, i].Max - ADScale[nScaleIdx, i].Min) - ADScale[nScaleIdx, i].Min;

                //case nRange of  Bi/Uni, 5V/10V
                //                ~~         ~~~
}
                if nScaleIdx > -1 then begin
                    fValue := RescaleData(0, $3FFF, FADScale[i].Min, FADScale[i].Max, nData);  //<- ������ �ȸ¾Ƽ� �ӽ� ����... 9V�Է½� 9.56V����..
                    fValue := (FADScale[i].Scale * fValue) + FADScale[i].Offset
                end;
                ValueTbl[nSlotNo-1, i] := fValue;
            end;
            Result := True;
            AddLog(Format('SlotNo%.2d: AD%d~%d : (%10.4f Sec) : Range %d : Sampling %d : TimeStamp %f :',
                [nSlotNo, 1, nChCount, nTime / 10000, nRange, nSampling, fTimeStamp]));

        end;

        KMI_ADE_BUFF_SET : begin
            AddLog(Format('SlotNo%.2d: Status %x',[nSlotNo, RxBuff[8]]));
            Result := True;
        end;

        // AD Buffer Read
        $0216 : begin
            nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
            nRange     := RxBuff[8];
            nSampling  := RxBuff[9];
            nChCount   := RxBuff[10];

            // ä�θ���Ʈ�� �����´�.  11Byte���� ä�������� ����´�.
            Idx := 11;
            for i:= 0 to nChCount-1 do
            begin
                ChIdx[i] := RxBuff[11];
                if not (ChIdx[i] in [0..MAX_ADE_CAHNNEL-1]) then ChIdx[i] := $FF;
                Inc(Idx);
            end;

            // 0x00000164 -> 356*100us -> 35.6ms     100us����..
            fTimeStamp := StrToFloatDef(Format('%d',[
                RxBuff[10+nChCount+1] * $1000000+
                RxBuff[10+nChCount+2] * $10000+
                RxBuff[10+nChCount+3] * $100+
                RxBuff[10+nChCount+4]]),0)/100;

            nScaleIdx := FBDIndex;
            try
            for j:= 0 to FRecordCount-1 do begin
                for i:= 0 to nChCount-1 do begin
                    Idx := (j*(nChCount*2))+(i*2) + 10 + nChCount + 5;
                    nData := ((RxBuff[Idx]*$100 + RxBuff[Idx+1]) and $3FFF);
                    
                    fValue := -9999;
                    if (nScaleIdx > -1) and ( ChIdx[i] in [0..31] ) then begin
                        // 000~3FFF => -10~10V
                        fValue := RescaleData(0, $3FFF, FADScale[i].Min, FADScale[i].Max, nData);
                        fValue := (FADScale[ ChIdx[i] ].Scale * fValue) + FADScale[ ChIdx[i] ].Offset;
                    end;
                    BuffTbl[j, i] := fValue;
                end;
            end;

            AddLog(Format('SlotNo%.2d: AD%d~%d : (%10.4f Sec) : DataLen %d : Range %d : Sampling %d : TimeStamp %f :',
                [nSlotNo, 1, nChCount, nTime / 10000, nDataLen, nRange, nSampling, fTimeStamp]));
            Result := True;

            except
                //
            end;
        end;

        $0218 : begin
           nSlotNo    := (FStation-1)*MAX_SLOT + FSlot;
           FBuffStatus := RxBuff[8];

            // AD Buffer Status
           // 0x01 : Busy ���� - ���� Buffer Mode �� ADC ������
           // 0x03 : Busy ���� - ���� Continuous Mode �� ADC ������
           // 0x00 : Non Busy ���� - ���� ADC �������� ����
           // 0x80 : ADC Complate
             
           AddLog(Format('SlotNo%.2d: Status %x',[nSlotNo, RxBuff[8]]));
           Result := True;
        end;
    end;
    end;

    finally
        //bSaveLog := False;
    end;
    // AA 01 00 00 10 13 00 40 00 9F AB D1 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ED
end;


end.
