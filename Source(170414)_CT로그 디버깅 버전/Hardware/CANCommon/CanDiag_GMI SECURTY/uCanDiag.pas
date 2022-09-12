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
    POSITIVE_RES =  1;
    NEGATIVE_RES =  0;
    NO_RESPONSE  = -1;
    RES_ERROR    = -2;

type
  TStringMode = (sm_Hex, sm_Ascii);

  // DIAG ���� Ŭ����...
  TCanDiag = class(TForm)
  private
    nPort      : Integer;
    m_Critical : TCriticalSection;
    FLockCount : Integer;
    FTxLen,  FRxLen  : Integer;

    procedure AddLog(Param : String);
    function  EncodeDiag(StrList : TStrings): String;
    function  DecodeDiag(StrList: TStrings; var RxStr : String) : Boolean;
    function  ReadMsg(nReadCount : Integer; RdList : TStrings; nTimeout : Integer = 1000) : Integer;
  public
    CanUnit : TCanUnit;
    TxID, RxID : Integer;
    TxBuff, RxBuff : array [0..$FF] of Byte;
    FResultStr : TStringList;

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
  end;

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
                    if (RxLen < nCount) then
                    begin
                        RxBuff[FRxLen] := CanMsg.Data[j];
                        Inc(FRxLen);
                    end;
                end;
                Inc(nSeqTarget);
            end else
                exit;

            // ������ ������ �Ϸ�Ǿ�����..
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
    CanMsg.DLC    := 8; // �׻� 8byte����.
    CanMsg.nCycle := 0; // Cycle 0

    StrList.Clear;
    //------------------------------------
    if TxLen < 8 then // Single Frame.
    begin
        CanStr := '';
        CanMsg.Data[0] := TxLen;
        for i:= 0 to 6 do begin
            if i < TxLen then CanMsg.Data[i+1] := TxBuff[i]
                         else CanMsg.Data[i+1] := $FF;
        end;
        StrList.Add( CanMsgToStr(CanMsg) );
    end else
    //------------------------------------
    begin
        Idx    := 0;
        nSeqNo := 1;   // Sequence NO.�� 1������ ����.
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
                                         else CanMsg.Data[i+1] := $FF;
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
    Str, RdStr, RxStr, sResultStr : String;
    CanMsg : TCanMessage;
    fTime : Double;
    TxList, RxList, StrList : TStringList;
    bFinished, bSending : Boolean;

    nMode, nErrorCount : Integer;
begin
    Result := NO_RESPONSE;
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
        AddLog('REQ > ' + Param);

        // �����͸� ���ۿ� �ִ´�.
        FTxLen := 0;
        while Param <> '' do begin
            Str := GetToken(Param, ' ');
            TxBuff[FTxLen] := HexToIntDef(Str, 0);
            Inc(FTxLen);
        end;
        EncodeDiag(TxList);

        // CAN Mask��ɻ�� �� �������۸� ���ֱ� ���� �̸��ѹ� �д´�.
        // ReadCAN(nPort, StrList, RxID, 1);
        nMode := 0;
        nErrorCount := 0;
        bFinished := False;
        nDataLen := 0;
        FRxLen := 0;

        while (not bFinished) do
        begin
            Sleep(1);
            case nMode of
            0: begin // ù���� �����͸� ������.

                // �����ǵ����͸� �����Ѵ�.
                CanUnit.Clear(nPort, False, True);

                RdStr := TxList[0];
                CanUnit.Send(nPort, StrToCanMsg(RdStr));

                if TxList.Count < 2 then nMode := 1  // Single Frame.
                                    else nMode := 3; // First Frame.
            end;

            1: begin // ù���� ������ ��ٸ���.
                if ReadMsg(1, StrList, 200) > 0 then
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
                    nMode := 0;  // ���������ϰ� �ٽ� ����..

                    if nErrorCount >= RETRYCOUNT then // ������ ���ؼ��̻��ΰ�� ���°��.
                        bFinished := True;
                end;
            end;
            //------------------------------------------------------------------
            2: begin // Flow Control �� �����Ѵ�.
                CanMsg.CanID   := TxID;
                CanMsg.DLC     := 8;
                CanMsg.nCycle  := 0;
                CanMsg.Data[0] := $30 + 0;   // FS    : Flow Status  0 = ContinueToSend
                CanMsg.Data[1] := $00;       // BS    : BlockSize  00 : All Tx data
                CanMsg.Data[2] := $00;       // STime : Seperation Time  5ms
                for i := 3 to 7 do CanMsg.Data[i] := 0;

                CanUnit.Send(nPort, CanMsg);

                CanMsg    := StrToCanMsg(RxList[0]);
                nDataLen  := ((CanMsg.Data[0] and $0F) * $100)+ CanMsg.Data[1]; // ������ ������ ��´�.
                nFrameLen := ((nDataLen - 7) div 7)+1;                            // ���� �����Ӽ��� ��´�.
                // ���� ���� Frame���� ��´�. 6 Byte�� ���� ���԰�...  6 = 0 13=1, 14=2 �� ���;ߵȴ�.
                // FistFrame : XX XX 01 02 03 04 05 06
                //        #1 : XX 07 08 09 10 11 12 13
                //        #2 : XX 14 15 16 17 18 19 20
                //        #3 : XX 21 22 23 24 25 26 27.  �̷���..

                // ������ ����ŭ �����͸� �д´�.
                nCount := ReadMsg(nFrameLen, StrList, nFrameLen * 100);
                {
                if nCount <> nFrameLen then begin
                    //  ShowMessage(Format('%d/%d%s%s', [nCount, nFrameLen, CRLF,  StrList.Text]));
                end;
                }
                RxList.AddStrings(StrList);
                nMode := 4;
            end;
            //------------------------------------------------------------------
            3 : begin // First Frame ������ FlowControl�� ��ٸ���.
                i := 1;

                bSending := True;
                while (bSending) and (not bFinished) do
                begin
                    if ReadMsg(1, StrList, 200) <= 0 then
                    begin
                        // ������ ���°��. RETRY COUNTȽ���̻� �Ѿ�� ����ó��.
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
                    if (CanMsg.Data[0] and $F0) = $30 then // Flow Control�� �´�..
                    begin
                        case (CanMsg.Data[0] and $0F) of
                            $00 : begin                          // Continue To Send
                                nFrameLen := CanMsg.Data[1];
                                if (nFrameLen = 0) then nFrameLen := 1000;

                                // Flow Control�� ������ ��û������ ������ŭ �����Ѵ�.
                                for j:= 1 to nFrameLen do
                                begin
                                    RdStr := TxList[i];
                                    CanUnit.Send(nPort, StrToCanMsg(RdStr));
                                    Inc(i);

                                    // �޼��� ���ۿϷ�. ���� �������� ��ٸ���.
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
                    begin   // Flow Control �� �ƴѰ��.
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
                    AddLog('RES > ' + RxStr);

                    if (RxBuff[0] = TxBuff[0] + $40) then
                    begin
                        sResultStr := '* Positive Response';
                        Result := POSITIVE_RES;
                    end else
                    if (RxBuff[0] = $7F) then
                    begin
                        sResultStr := '* Negative Response!!';
                        Result := NEGATIVE_RES;
                    end else
                    begin
                        FRxLen := 0;
                        sResultStr := '* Frame Error';
                        Result := RES_ERROR;
                    end;
                end else begin
                    FRxLen := 0;
                    sResultStr := '* Frame Error';
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
        //CanUnit.ContinueSendPolling;
    end;

    if Result < 0 then
        sResultStr := '* TIME OUT.';

    AddLog(Format('%s (%f ms)', [sResultStr, GetTickCountEX - fTime ]));
end;

procedure TCanDiag.Lock;
begin
    // �ٸ������忡�� ������ ���ϵ��� ���´�.
    m_Critical.Acquire;
    Inc(FLockCount);
end;

procedure TCanDiag.UnLock;
begin
    // �ٸ������������� �����Ѵ�.
    m_Critical.Release;
    Dec(FLockCount);
end;

function TCanDiag.IsLock : Boolean;
begin
    Result := (FLockCount > 0);
end;

//------------------------------------------------------------------------------
// CAN �޼����� �ش� ������ŭ �о�´�.
function TCanDiag.ReadMsg(nReadCount : Integer; RdList : TStrings; nTimeout : Integer = 1000) : Integer;
var i : Integer;
    fTime   : Double;
    RdStr   : String;
begin
    Result := 0;
    RdList.Clear;
    if (CanUnit = nil) then exit;

    fTime := GetTickCountEX;
    while (GetTickCountEX - fTime < nTimeout) do
    begin
        CanUnit.Read(nPort);

        CanUnit.Lock;
        try
            for i:= 0 to CanUnit.BuffCount-1 do
            begin
                if (CanUnit.BuffMessage[i].CANId = RxID ) then
                begin
                    RdStr := CanMsgToStr( CanUnit.BuffMessage[i] );
                    RdList.Add(RdStr);
                end;

                // �޼��� ������ ǥ���Ѵ�.
                with CanUnit.BuffMessage[i] do
                begin
                    if (CanID = RxID) or (CanID = TxID) then
                    begin
                        RdStr := Format('> %.3x=%-24s: %f', [CANId, MakeHexaString(@Data[0], DLC), TimeStamp]);
                        AddLog('' + RdStr);
                    end else
                    begin
                        // if (CheckBox_VIewAll.Checked) then
                        begin
                            RdStr := Format('  %.3x=%-24s: %f', [CANId, MakeHexaString(@Data[0], DLC), TimeStamp]);
                            AddLog('' + RdStr);
                        end;
                    end;
                end;

                if (RdList.Count >= nReadCount) then begin
                    Result := RdList.Count;
                    exit;
                end;
            end;
        finally
            CanUnit.UnLock;
        end;
        Sleep(10); // CPU ������ ���߰�.. �����Ŀ� �ٽ� �д´�.
    end;
end;

procedure TCanDiag.AddLog(Param: String);
begin
    FResultStr.Add(Param);
end;

function TCanDiag.GetTxStr(nMode : TStringMode; nStart, nLen : Integer) : String;
var i : Integer;
begin
    Result := '';
    nStart := nStart - 1;  // Start�� 1���� ����.
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
    nStart := nStart - 1;  // Start�� 1���� ����.
    for i:= nStart to nStart + nLen -1 do
    begin
        if (i < 0) or (i >= RxLen) then break;

        case nMode of
        sm_Hex   : Result := Result + IntToHex (RxBuff[i], 2) + ' ';  // HEX
        sm_Ascii : Result := Result + Char(RxBuff[i]);                // ASCII
        end;
    end;
    Result := Trim(Result);
end;

end.
