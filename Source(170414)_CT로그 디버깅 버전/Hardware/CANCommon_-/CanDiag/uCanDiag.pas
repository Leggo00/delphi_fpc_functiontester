//------------------------------------------------------------------------------
//
//   CAN DIAG CLASS.
//
//
//------------------------------------------------------------------------------

unit uCanDiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uCanUnit, SyncObjs;

const
    // 응답메세지 정리. 0보다 클경우 정상응답.
    RES_ERROR    = -2;
    RES_NORES    = -1;
    RES_NEGATIVE =  0;
    RES_POSITIVE =  1;

    FILTER_BYTE = $55;  

type
  TStringMode = (sm_Hex, sm_Ascii);

  // DIAG 관련 클래스...
  TCanDiag = class(TForm)
  private
    nPort      : Integer;
    m_Critical : TCriticalSection;
    FLockCount : Integer;


    procedure AddLog(Param : String);
    function  EncodeDiag(StrList : TStrings): String;
    function  DecodeDiag(StrList: TStrings; var RxStr : String) : Boolean;
    function  ReadMsg(nReadCount : Integer; RdList : TStrings; nTimeout : Integer; bConsecutive : Boolean) : Integer;

  public
    CanUnit : TCanUnit;
    TxID, RxID : Integer;

    TxBuff, RxBuff : array [0..$FFF] of Byte;
    FTxLen,  FRxLen  : Integer;

    FResultStr : TStringList;
    bViewAllMsg, bIDFilter : Boolean;
    sErrorMessage : String;
    
    // 요청시간 및 응답시간 추가.
    fRequestTime, fReponseTime, fdTime : Double;
    constructor Create;
    destructor  Destroy; override;

    function    Send(Param : String) : Integer;
    function    IsLock: Boolean;
    procedure   Lock;
    procedure   UnLock;

    function    GetTxStr(nMode : TStringMode; nStart, nLen : Integer) : String;
    function    GetRxStr(nMode : TStringMode; nStart, nLen : Integer) : String;

    property    TxLen : Integer read FTxLen;
    property    RxLen : Integer read FRxLen;

    function    GetGMLanDTC(Param : String) : String;
  end;

  function GetErrorCode(nError : Byte) : String;

implementation


{ TCanDiag }

uses
    GenUtils;

constructor TCanDiag.Create;
begin
    //inherited;

    m_Critical := TCriticalSection.Create;
    FLockCount := 0;
    nPort  := 1;
    bViewAllMsg := False;
    bIDFilter   := True;

    FResultStr := TStringList.Create;
end;

destructor TCanDiag.Destroy;
begin
    FResultStr.Free;
    m_Critical.Free;
    inherited;
end;

function TCanDiag.DecodeDiag(StrList: TStrings; var RxStr : String) : Boolean;
var i, j, nCount, nSeqNo, nSeqTarget : Integer;
    nType : Byte;
    CanMsg : TCanMessage;
begin
    RxStr     := '';
    Result    := False;

    if StrList.Count < 1 then exit;

    CanMsg := StrToCanMsg(StrList[0]);
    if (CanMsg.CanID <> RxId) then exit;

    nType := (CanMsg.Data[0] and $F0);
    //----------------------------------------------------
    // Single Frame
    if (nType = $00) then begin
        nCount := (CanMsg.Data[0] and $0F);
        for j:= 1 to nCount do begin
            RxBuff[RxLen] := CanMsg.Data[j];
            Inc(FRxLen);
        end;
        Result := True;
    end;
    //----------------------------------------------------
    // First Frame.
    if (nType = $10) then begin
        nCount := (CanMsg.Data[0] and $0F) * $100 + CanMsg.Data[1];
        for j:= 2 to 7 do begin
            RxBuff[FRxLen] := CanMsg.Data[j];
            Inc(FRxLen);
        end;

        nSeqTarget := 1;
        for i := 1 to StrList.Count-1 do
        begin
            CanMsg := StrToCanMsg(StrList[i]);
            if (CanMsg.CanID <> RxId) then continue;

            nType  := (CanMsg.Data[0] and $F0);
            nSeqNo := (CanMsg.Data[0] and $0F);
            
            if (nType = $20) and (nSeqNo = nSeqTarget) then // Consecutive Frame.
            begin
                for j:= 1 to 7 do begin
                    if (RxLen < nCount) and (FRxLen <= High(RxBuff)) then
                    begin
                        RxBuff[FRxLen] := CanMsg.Data[j];
                        Inc(FRxLen);
                    end;
                end;
                nSeqTarget := (nSeqTarget + 1) and $0F;
            end else
                exit;

            // 데이터 내용이 완료되었으면..
            if (RxLen >= nCount) then begin
                Result := True;
                break;
            end;
        end;
    end;

    //----------------------------------------------------
    if (Result) then
        RxStr := Trim( MakeHexaString(@RxBuff[0], RxLen) )
    else
        RxStr := '';
end;

//------------------------------------------------------------------------------
function TCanDiag.EncodeDiag(StrList: TStrings): String;
var i, Idx, nSeqNo : Integer;
    CanStr : String;
    nHeader : Byte;
    CanMsg : TCanMessage;
begin
    CanMsg.CanID  := TxID;
    CanMsg.DLC    := 8; // 항상 8byte전송.
    CanMsg.nCycle := 0; // Cycle 0

    StrList.Clear;
    //------------------------------------
    if TxLen < 8 then // Single Frame.
    begin
        CanStr := '';
        CanMsg.Data[0] := TxLen;
        for i:= 0 to 6 do begin
            if i < TxLen then CanMsg.Data[i+1] := TxBuff[i]
                         else CanMsg.Data[i+1] := FILTER_BYTE;
        end;
        StrList.Add( CanMsgToStr(CanMsg) );
    end else
    //------------------------------------
    begin
        Idx    := 0;
        nSeqNo := 1;   // Sequence NO.는 1번부터 시작.
        while (Idx < TxLen) do
        begin
            if (Idx = 0) then // First Frame.
            begin
                CanMsg.Data[0] := ((TxLen div $100) + $10); // Header;
                CanMsg.Data[1] := ((TxLen mod $100)      ); // Header;
                for i:= 0 to 5 do
                    CanMsg.Data[i+2] :=  TxBuff[idx + i];

                Idx := Idx + 6;
                StrList.Add( CanMsgToStr(CanMsg) );
            end else
            begin             // Consecutive Frame.
                CanMsg.Data[0] := (nSeqNo + $20); // Header;
                for i:= 0 to 6 do begin
                    if (idx + i) < TxLen then CanMsg.Data[i+1] := TxBuff[idx+i]
                                         else CanMsg.Data[i+1] := FILTER_BYTE;
                end;

                Idx := Idx + 7;
                nSeqNo := (nSeqNo + 1) mod 16;
                StrList.Add( CanMsgToStr(CanMsg) );
            end;
        end;
    end;
end;

function TCanDiag.Send(Param : String) : Integer;
const
    RETRYCOUNT = 1;

var i, j, nDataLen, nFrameLen, nCount : Integer;
    Str, RdStr, RxStr : String;
    CanMsg : TCanMessage;
    fTime : Double;
    TxList, RxList, StrList : TStringList;
    bFinished, bSending : Boolean;

    nMode, nErrorCount : Integer;
    nTimeOut : Integer;
begin
    Result := RES_NORES;
    if (CanUnit = nil) or (Param = '') then exit;

    fTime := GetTickCountEX;

    Lock;

    CanUnit.PauseReadPolling;
    // CanUnit.PauseSendPolling;

    StrList := TStringList.Create;
    TxList  := TStringList.Create;
    RxList  := TStringList.Create;
    FResultStr.Clear;
    try
        // 데이터를 버퍼에 넣는다.
        FTxLen := 0;
        while Param <> '' do begin
            Str := GetToken(Param, ' ');
            TxBuff[FTxLen] := HexToIntDef(Str, 0);
            Inc(FTxLen);
        end;
        AddLog(Format('REQ> %.3x %s', [TxID, MakeHexaString(@TxBuff[0], FTxLen)]));
        EncodeDiag(TxList);

        // CAN Mask기능사용 및 기존버퍼를 없애기 위해 미리한번 읽는다.
        // ReadCAN(nPort, StrList, RxID, 1);
        nMode := 0;
        nErrorCount := 0;
        bFinished := False;
        nDataLen := 0;
        FRxLen := 0;
        nTimeOut := 2000;

        fRequestTime := 9999;
        fReponseTime := 0;

        while (not bFinished) do
        begin
            Sleep(1);
            Application.ProcessMessages;
            case nMode of
            0: begin // 첫번쨰 데이터를 보낸다.

                // 기존의데이터를 삭제한다.
                //CanUnit.Clear(nPort, False, True);
                CanUnit.Clear(nPort, False, False);

                RdStr := TxList[0];
                CanUnit.Send(nPort, StrToCanMsg(RdStr));

                if TxList.Count < 2 then nMode := 1  // Single Frame.
                                    else nMode := 3; // First Frame.
            end;

            1: begin // 첫번쨰 응답을 기다린다.
                if ReadMsg(1, StrList, nTimeOut, False) > 0 then
                begin
                    CanMsg := StrToCanMsg( StrList[0] );
                    case (CanMsg.Data[0] and $F0) of
                        $00 : begin // Single Frame.
                            RxList.AddStrings(StrList);
                            nMode := 4;
                        end;
                        $10 : begin // First Frame.
                            RxList.AddStrings(StrList);
                            nMode := 2;
                        end;
                        $F0 : begin // No Response.
                            bFinished := True;
                        end;
                        else begin
                            bFinished := True;
                        end;
                    end;
                    nErrorCount := 0;
                end else begin
                    Inc(nErrorCount);
                    nMode := 0;  // 에러증가하고 다시 시작..

                    if nErrorCount >= RETRYCOUNT then // 에러가 기준수이상인경우 없는경우.
                        bFinished := True;
                end;
            end;
            //------------------------------------------------------------------
            2: begin // Flow Control 을 전송한다.
                CanMsg.CanID   := TxID;
                CanMsg.DLC     := 8;
                CanMsg.nCycle  := 0;
                CanMsg.Data[0] := $30 + 0;   // FS    : Flow Status  0 = ContinueToSend
                CanMsg.Data[1] := $00;       // BS    : BlockSize  00 : All Tx data
                CanMsg.Data[2] := $00;       // STime : Seperation Time  5ms
                for i := 3 to 7 do CanMsg.Data[i] := 0;

                CanUnit.Send(nPort, CanMsg);

                CanMsg    := StrToCanMsg(RxList[0]);
                nDataLen  := ((CanMsg.Data[0] and $0F) * $100)+ CanMsg.Data[1];   // 데이터 갯수를 얻는다.
                nFrameLen := ((nDataLen - 7) div 7)+1;                            // 들어올 프레임수를 얻는다.
                // 이후 들어올 Frame수를 얻는다. 6 Byte는 먼저 들어왔고...  6 = 0 13=1, 14=2 가 나와야된다.
                // FistFrame : XX XX 01 02 03 04 05 06
                //        #1 : XX 07 08 09 10 11 12 13
                //        #2 : XX 14 15 16 17 18 19 20
                //        #3 : XX 21 22 23 24 25 26 27.  이런순..

                // 프레임 수만큼 데이터를 읽는다.
                nCount := ReadMsg(nFrameLen, StrList, nFrameLen * 1000, True);

                RxList.AddStrings(StrList);
                nMode := 4;
            end;
            //------------------------------------------------------------------
            3 : begin // First Frame 전송후 FlowControl을 기다린다.
                i := 1;

                bSending := True;
                while (bSending) and (not bFinished) do
                begin
                    if ReadMsg(1, StrList, nTimeOut, False) <= 0 then
                    begin
                        // 응답이 없는경우. RETRY COUNT횟수이상 넘어가면 종료처리.
                        if nErrorCount > RETRYCOUNT then begin
                            bFinished := True;
                            break;
                        end else
                        begin
                            Inc(nErrorCount);
                            continue;
                        end;
                    end else begin
                       nErrorCount := 0;
                    end;

                    CanMsg := StrToCanMsg(StrList[0]);
                    if (CanMsg.Data[0] and $F0) = $30 then // Flow Control이 맞다..
                    begin
                        case (CanMsg.Data[0] and $0F) of
                            $00 : begin                          // Continue To Send
                                nFrameLen := CanMsg.Data[1];
                                if (nFrameLen = 0) then nFrameLen := 1000;

                                // Flow Control이 들어오면 요청프레임 갯수만큼 전송한다.
                                for j:= 1 to nFrameLen do
                                begin
                                    RdStr := TxList[i];
                                    CanUnit.Send(nPort, StrToCanMsg(RdStr));
                                    Inc(i);

                                    // 메세지 전송완료. 응답 프레임을 기다린다.
                                    if i > TxList.Count-1 then
                                    begin
                                        nMode    := 1;
                                        bSending := False;
                                        break;
                                    end;

                                    Sleep(CanMsg.Data[2]);
                                end;
                            end;
                            $01 : continue;                      // Wait.
                            $02 : bFinished := True;             // OverFlow.
                        end;
                    end else
                    begin   // Flow Control 이 아닌경우.
                        bFinished := True;
                        break;
                    end;
                end; // End of While;
            end;
            //------------------------------------------------------------------
            4 : begin // Finished
                bFinished := True;

                if DecodeDiag(RxList, RxStr) then
                begin
                    AddLog(Format('RES> %.3x %s', [RxID, RxStr] ));

                    if (RxBuff[0] = TxBuff[0] + $40) then
                    begin
                        sErrorMessage := '* Positive Response';
                        Result := RES_POSITIVE;
                    end else
                    if (RxBuff[0] = $7F) then
                    begin
                        // Pending Message 처리.
                        if (RxBuff[2] = $78) then begin
                            FRxLen := 0;
                            RxBuff[0] := 0;
                            nMode := 1;
                            nTimeOut := 5000;
                            RxList.Clear;
                            bFinished := False;
                            continue;
                        end;
                        sErrorMessage := Format('* Negative Response : (%.2x) %s', [RxBuff[2], GetErrorCode(RxBuff[2])]);  // 비정상응답
                        Result := RES_NEGATIVE;
                    end else
                    begin
                        FRxLen := 0;
                        sErrorMessage := '* Frame Error';
                        Result := RES_ERROR;
                    end;
                end else begin
                    FRxLen := 0;
                    sErrorMessage := '* Frame Error';
                    Result := RES_ERROR;
                end;
            end;
            end; // end of Case.
        end;// end of while.
    finally
        RxList.Free;
        TxList.Free;
        StrList.Free;

        UnLock;

        CanUnit.ContinueReadPolling;
    end;

    if Result < 0 then
        sErrorMessage := '* No Response';

    // 총응답시간을 구한다. Response를 측정못했을경우
    // GetTickCountEX로 계산하여 총 측정시간으로 구한다.
    if (fReponseTime = 0) then begin
        fRequestTime := fTime;
        fReponseTime := GetTickCountEX;
    end;
    // Request 시간을 측정못했을경우에는 0부터 시작.
    if (fRequestTime = 9999) then
        fRequestTime := 0;

    fdTime := (fReponseTime - fRequestTime);
    AddLog(Format('%s (%f ms)', [sErrorMessage, fdTime ]));
end;

// CAN Diag Error Code를 표시한다.
function GetErrorCode(nError : Byte) : String;
begin
    case nError of
        $10 : Result := 'gerneralReject';
        $11 : Result := 'serviceNotSupported';
        $12 : Result := 'subFunctionNotSupported-invalidFormat';
        $21 : Result := 'busy-RepeatRequest';        
        $22 : Result := 'conditionNotCorrect';        
        $23 : Result := 'routineNotComplete';
        $31 : Result := 'requestOutOfRange';
        $33 : Result := 'securityAcessDenied';
        $35 : Result := 'invalidKey';
        $36 : Result := 'exceedNumberOfAttempts';
        $37 : Result := 'requiredTimeDelayNotExpired';
        $40 : Result := 'downloadNotAccepted';
        $41 : Result := 'improperDownloadType';
        $42 : Result := 'can''tDownloadToSpecifiedAddress';
        $43 : Result := 'can''tDownloadNumberOfBytesRequested';
        $50 : Result := 'uploadNotAccepted';
        $51 : Result := 'improperUploadType';
        $52 : Result := 'can''tUploadFromSpecifiedAdress';
        $53 : Result := 'can''tUploadNumberOfBytesRequested';
        $71 : Result := 'transferSuspened';
        $72 : Result := 'transferAborted';
        $74 : Result := 'illegalAdressInBlockTransfer';
        $75 : Result := 'illegalByteCountInBlockTransfer';
        $76 : Result := 'illegalBlockTransferType';
        $77 : Result := 'blockTransferDataChecksumError';
        $78 : Result := 'reqCorrectlyRcvd-RspPending';
        $79 : Result := 'incorrectByteCountBlockTransfer';
        $80 : Result := 'serviceNotSupportedInActiveDiagonosticMode';
    else
        Result := 'Unknown Error';
    end;
end;

procedure TCanDiag.Lock;
begin
    // 다른쓰레드에서 접근을 못하도록 막는다.
    m_Critical.Acquire;
    Inc(FLockCount);
end;

procedure TCanDiag.UnLock;
begin
    // 다른쓰레드접근을 해제한다.
    m_Critical.Release;
    Dec(FLockCount);
end;

function TCanDiag.IsLock : Boolean;
begin
    Result := (FLockCount > 0);
end;

//------------------------------------------------------------------------------
// CAN 메세지를 해당 갯수만큼 읽어온다.
function TCanDiag.ReadMsg(nReadCount : Integer; RdList : TStrings; nTimeout : Integer; bConsecutive : Boolean) : Integer;
var i : Integer;
    fTime,  fLastTime : Double;
    RdStr   : String;
    bIDCheck : Boolean;
begin
    Result := 0;
    RdList.Clear;
    if (CanUnit = nil) then exit;

    fTime := GetTickCountEX;

    fLastTime := fTime;
    while (GetTickCountEX - fTime < nTimeout) do
    begin
        // bConsecutive Frame의 경우 Timeout이 아니여도 마지막 수신 메세지가 기준 Frame간격이 1초를 초과한 경우 에러처리..
        if (bConsecutive) and (GetTickCountEX - fLastTime > 1000) then break;

        CanUnit.Read(nPort);

        CanUnit.Lock;
        try
            for i:= 0 to CanUnit.BuffCount-1 do
            begin
                bIDCheck := False;

                // TX Message확인..
                if (CanUnit.BuffMessage[i].CANId = TxID ) then
                begin
                    if CanUnit.BuffMessage[i].TimeStamp <= fRequestTime then
                        fRequestTime := CanUnit.BuffMessage[i].TimeStamp;
                    bIDCheck := True;
                end else

                // RX Message확인..
                if (CanUnit.BuffMessage[i].CANId = RxID ) then
                begin
                    RdStr := CanMsgToStr( CanUnit.BuffMessage[i] );
                    RdList.Add(RdStr);
                    fLastTime := fTime;   // 마지막 메세지 수신기록

                    if CanUnit.BuffMessage[i].TimeStamp >= fReponseTime then
                        fReponseTime := CanUnit.BuffMessage[i].TimeStamp;
                    bIDCheck := True;
                end;

                // TX or RX Message인경우 화면표시..
                if ((not bIDFilter) or (bIDCheck)) and (bViewAllMsg) then begin
                    with CanUnit.BuffMessage[i] do
                        RdStr := Format('> %.3x=%-24s: %f', [CANId, MakeHexaString(@Data[0], DLC), TimeStamp]);
                    AddLog('' + RdStr);
                end;

                if (RdList.Count >= nReadCount) then begin
                    Result := RdList.Count;
                    exit;
                end;
            end;
        finally
            CanUnit.UnLock;
        end;
        Sleep(1); // CPU 점유를 낮추고.. 지연후에 다시 읽는다.
    end; // end of while.
end;

procedure TCanDiag.AddLog(Param: String);
begin
    FResultStr.Add(Param);
end;

function TCanDiag.GetTxStr(nMode : TStringMode; nStart, nLen : Integer) : String;
var i : Integer;
begin
    Result := '';
    nStart := nStart - 1;  // Start는 1부터 시작.
    for i:= nStart to nStart + nLen -1 do
    begin
        if (i < 0) or (i >= TxLen) then break;

        case nMode of
        sm_Hex   : Result := Result + IntToHex (TxBuff[i], 2) + ' ';  // HEX
        sm_Ascii : Result := Result + Char(TxBuff[i]);                // ASCII
        end;
    end;
    Result := Trim(Result);
end;

function TCanDiag.GetRxStr(nMode : TStringMode; nStart, nLen : Integer) : String;
var i : Integer;
begin
    Result := '';
    nStart := nStart - 1;  // Start는 1부터 시작.
    for i:= nStart to nStart + nLen -1 do
    begin
        if (i < 0) or (i >= RxLen) then break;

        case nMode of
        sm_Hex   : Result := Result + IntToHex (RxBuff[i], 2) + ' ';  // HEX
        sm_Ascii : BEGIN
            if (RxBuff[i] in [$20..$7F]) then
                Result := Result + Char(RxBuff[i])
            else
                Result := Result + '  ';
        end;
        end;
    end;
    Result := Trim(Result);
end;


function TCanDiag.GetGMLanDTC(Param : String) : String;
var i, TxId, RxId : Integer;
    CanMessage : TCanMessage;
    Str, RdStr, sDTCCode : String;
    StrList : TStringList;
    fTime : Double;
begin
    Result := 'N/A';
    if CanUnit = nil then exit;
{                        // EX) RdStr -> 123=A9 81 02,542
 > A9 81 02
  542=81 45 45 00 02 00 00 00 : 35.00
  542=81 45 6D 39 02 00 00 00 : 56.00
  542=81 00 00 00 02 00 00 00 : 75.00
* TIME OUT. (435.42 ms)
}
    RdStr := Param;
    Str := GetToken(RdStr, ',');
    CanMessage := StrToCanMsg(Str);

    RxId := HexToIntDef(RdStr, 0);

    StrList := TStringList.Create;
    try
        CanUnit.PauseReadPolling;
        CanUnit.Clear(1, True, True);
        CanUnit.Send(1, CanMessage);

        fTime := GetTickCountEX;
        while (GetTickCountEX - fTime < 1000) do
        begin
            Sleep(10);
            CanUnit.Read(1);

            sDTCCode := '';
            for i:= 0 to CanUnit.BuffCount-1 do
            begin
                if (CanUnit.BuffMessage[i].CANId    = RxId) and
                   (CanUnit.BuffMessage[i].nChannel = 1   ) then
                begin
                    sDTCCode := Format('%.2x%.2x %.2x', [
                        CanUnit.BuffMessage[i].Data[1],
                        CanUnit.BuffMessage[i].Data[2],
                        CanUnit.BuffMessage[i].Data[3] ]);

                    if Pos('0000', sDTCCode) > 0 then break;

                    StrList.Add(sDTCCode);
                end;
            end;
            if Pos('0000', sDTCCode) > 0 then break;
        end;

        Result := IntToStr(StrList.Count) + ',' + ReplaceStr( StrList.Text, CRLF, ',');
        Result := Copy(Result, 1, Length(Result)-1);
    finally
        CanUnit.ContinueReadPolling;
        StrList.Free;
    end;
end;


end.
