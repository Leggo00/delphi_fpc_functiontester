unit FormKMIComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DPBLabel, Spin, ZINICtrl, ComCtrls, ExtCtrls, Buttons,
  ComDrv32, ScieCalc;

const
    MAX_BUFF = 255;
    COM_TIME_OUT = 2000;

    //
    RES_NORES   = 0;
    RES_SUCCESS = 1;
    RES_ERROR   = 2;
    
type
  TFrmKMIComm = class(TForm)
    Panel1: TPanel;
    StatusBar: TStatusBar;
    Edit_Comport: ZIniSpinEdit;
    dpbLabel1: TdpbLabel;
    INI: ZIniData;
    BtnConnect: TSpeedButton;
    BtnClose: TSpeedButton;
    Comm: TCommPortDriver;
    dpbLabel8: TdpbLabel;
    BtnClear: TSpeedButton;
    ScieCalc: TScieCalc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dpbLabel2: TdpbLabel;
    BtnSend: TSpeedButton;
    dpbLabel3: TdpbLabel;
    dpbLabel4: TdpbLabel;
    dpbLabel5: TdpbLabel;
    dpbLabel6: TdpbLabel;
    dpbLabel7: TdpbLabel;
    Memo: TMemo;
    Edit_Addr: ZIniEdit;
    Edit_Header: ZIniEdit;
    Edit_Len: ZIniEdit;
    Edit_Data: ZIniEdit;
    Edit_Cs: ZIniEdit;
    ComboBox_Cmd: TComboBox;
    Edit_Fmt: ZIniEdit;
    Edit_Tgt: ZIniEdit;
    dpbLabel9: TdpbLabel;
    dpbLabel10: TdpbLabel;
    Edit_Src: ZIniEdit;
    dpbLabel11: TdpbLabel;
    dpbLabel12: TdpbLabel;
    ComboBox_SID: TComboBox;
    dpbLabel13: TdpbLabel;
    ComboBox_Param1: TComboBox;
    Memo_KWP: TMemo;
    BtnKWPConnect: TSpeedButton;
    BtnKWPSend: TSpeedButton;
    dpbLabel15: TdpbLabel;
    dpbLabel16: TdpbLabel;
    Edit_Frame: ZIniEdit;
    ComboBox_Param2: TComboBox;
    BtnKWPDisconnect: TSpeedButton;
    OpenDialog: TOpenDialog;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    MemoMsg: TMemo;
    MemoTx: TMemo;
    MemoRx: TMemo;
    BtnOpen: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnKWPConnectClick(Sender: TObject);
    procedure BtnKWPSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox_SIDChange(Sender: TObject);
    procedure BtnKWPDisconnectClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure ComboBox_Param1Change(Sender: TObject);
    procedure ComboBox_Param2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
    sConfigFile : String;
//    KWPMsg : TKWPMsg;

    nReqRes : Integer;
    TxBuff, RxBuff : array [0..MAX_BUFF] of Byte;
    TxLen,  RxLen  : Integer;
    nCheckTime : Integer;
    procedure AddMsg(Param : String);
    procedure AddKWPLog(Param: String);
    procedure SendKWP(Param: String);
    procedure MakeFrame;
    procedure DecodeReceiveFrame;
  public
    { Public declarations }
    function CommConnect(bOnOff : Boolean) : Boolean;
    function CommSend(nAddr, nCmd : Byte; Param : String) : Boolean;

    function ReadBit(nStartByte, nStartBit, nBitLen: Integer; ExpStr : String) : String;
    function ReadKwpData(Cmd, Param : String) : String;
  end;


var
  FrmKMIComm: TFrmKMIComm;


implementation

{$R *.dfm}

uses
    GenUtils;

procedure TFrmKMIComm.AddMsg(Param : String);
begin
    if Memo.Lines.Count > 100 then
        Memo.Lines.Delete(0);
    Memo.Lines.Add(Param);
end;

function TFrmKMIComm.CommConnect(bOnOff : Boolean) : Boolean;
begin
    Comm.Disconnect;
    if (bOnOff) then
    begin
        Comm.ComPort := Edit_Comport.Value;
        Comm.Connect;
    end;

    if Comm.Connected then begin
        StatusBar.Panels[0].Text := Format('COM%d - CONNECTED', [Comm.ComPort]);
        Memo.Lines.Clear;
    end
    else
        StatusBar.Panels[0].Text := 'DISCONNECT';
end;

function TFrmKMIComm.CommSend(nAddr, nCmd : Byte; Param : String) : Boolean;
var i, nData, nRet : Integer;
    Str : String;
    Data, CheckSum : Byte;

    bItemExist : Boolean;
    nResponse : Integer;
begin
    Result := False;
    Screen.Cursor := crHourGlass;

    if nAddr < 1 then nAddr := HexToIntDef(Edit_Addr.Text, 1);

    // Send Data ...............................................................
    TxBuff[0] := HexToIntDef(Edit_Header.Text, $55);
    TxBuff[1] := nAddr;
    TxBuff[2] := nCmd;
    TxLen := 4;
    while (Param <> '') do
    begin
        Str := GetToken(Param, ' ');
        nData := HexToIntDef(Str,  -1);
        if nData >= 0 then begin
            TxBuff[TxLen] := Byte(nData);
            Inc(TxLen);
        end;
    end;
    TxBuff[3]   := TxLen - 4;

    CheckSum := 0;
    for i:=0 to TxLen-1 do begin
        CheckSum := CheckSum + TxBuff[i];
    end;
    TxBuff[TxLen] := CheckSum;
    Inc(TxLen);

    Edit_Len.Text := IntToHex( TxBuff[3], 2);
    Edit_CS.Text  := IntToHex( CheckSum, 2);
    Str := MakeHexaString(@TxBuff, TxLen );
    AddMsg( 'TX> ' + Str );

    // 데이터를 전송한다.
    RxLen := 0;
    FillChar( RxBuff, Sizeof(RxBuff), 0);

    if Comm.Connected then
        Comm.SendData(@TxBuff, TxLen);

    nReqRes := RES_NORES;
    // 응답을 기다린다.
    nCheckTime := GetTickCount();
    while (GetTickCount() - nCheckTime < COM_TIME_OUT) do
    begin
        if RxLen > 5 then
        begin
            if (RxBuff[0] = $AA       ) and
               (RxBuff[1] = TxBuff[1] ) and  // Header, ID 검사.
               (RxLen >= RxBuff[3] + 5) then                       // 데이터 길이 비교.
            begin
                if (RxBuff[2] = TxBuff[2] + $80) then   // 정상응답 비교.
                begin
                    nReqRes := RES_SUCCESS;
                    Result := True;
                end
                else  // 비정상응답.
                    nReqRes := RES_ERROR;
                break;
            end;
        end;
        Application.ProcessMessages;
        Sleep(1);
    end;

    // 응답을 화면에 표시
    Str := MakeHexaString(@RxBuff, RxLen );
    AddMsg( 'RX> ' + Str );
    case nReqRes of
        RES_NORES   : AddMsg( '* TIME OUT' );
        RES_SUCCESS : AddMsg( '* SUCCESS' );
        RES_ERROR   : AddMsg( '* ERROR FRAME' );
    end;
    AddMsg('');

    Screen.Cursor := crDefault;
end;


procedure TFrmKMIComm.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var i : Integer;
begin
    for i:=0 to DataSize-1 do
    begin
        RxBuff[RxLen] := Byte( (PChar(DataPtr) + i)^ );
        Inc(RxLen);
        if RxLen >= MAX_BUFF then RxLen := 0;
    end;
end;

// 특정데이터 값을 읽어온다.
function TFrmKMIComm.ReadBit(nStartByte, nStartBit, nBitLen: Integer;
    ExpStr : String) : String;
var Idx, i, Data: Integer;
    fValue : Double;
    bCalcStat : Boolean;
begin
    Result := 'N/A';

    if not (nStartByte in [0..MAX_BUFF]) then exit;
    if not (nStartBit  in [0..7]) then exit;
    if     (nBitLen > nStartBit+1) then exit;

    Data :=  RxBuff[nStartByte + 9];

    fValue := 0;
    Idx := nStartBit - nBitLen + 1;
    bCalcStat := False;
    for i:=0 to nBitLen-1 do
    begin
        if (Data and (1 shl Idx) <> 0) then begin
            fValue := fValue + (1 shl i);
            bCalcStat := True;
        end;
        Inc(Idx);
    end;

    if  ExpStr <> '' then begin
        ExpStr := ReplaceStr(ExpStr, 'DATA', FloatToStr(fValue));
        fValue := ScieCalc.CalcExpression(ExpStr);
    end;
    Result := FormatFloat('0.##', fValue);
end;

{
function TFrmKMIComm.ListReadBit(CanMsg : TCanMssage; nStartByte, nStartBit, nBitLen: Integer;
    ExpStr : String) : String;
var Idx, i, Data: Integer;
    fValue : Double;
    sBits, sData: string;
    iValue: integer;

begin
    Result := 'N/A';

    nStartByte := nStartByte - 1;
    nStartBit := nStartBit;
    if not (nStartByte in [0..MAX_CAN_DATA_LEN]) then exit;
    if not (nStartBit  in [0..7]) then exit;
//    if     (nBitLen > nStartBit+1) then exit;
    if (CanMsg.Len <= 0) then exit;

    Data  := CanMsg.Data[nStartByte];
    sBits := IntToBin(Data, 8);
    sData := Copy(sBits, 9 - nBitLen - nStartBit, nBitLen);

    iValue := BinToIntDef(sData, 8);
    fValue := Round(iValue);

    if  ExpStr <> '' then begin
        ExpStr := ReplaceStr(ExpStr, 'DATA', FloatToStr(fValue));
        fValue := ScieCalc.CalcExpression(ExpStr);
    end;

    Result := FormatFloat('0.##', fValue);
end;
}

function TFrmKMIComm.ReadKwpData(Cmd, Param : String) : String;
var i, Idx, Len, nRetry : Integer;
    Str1, Str2 : String;
    Data : Byte;
    SByte, EByte, SBit, EBit : Integer;
    DataStr, ExpStr : String;
    fValue : Double;

    sBits, sData: string;
    iValue: integer;
begin
    Result := 'N/A';

    CommSend(0, $12, Cmd);

    // Param := 'D1~3:DATA*255/20
    ExpStr := Param;
    DataStr := GetToken(ExpStr, ':');

    Str2 := GetToken(DataStr, '~');
    Str1 := GetToken(Str2, '_');
    GetToken(Str1, 'D');

    SByte := StrToIntDef(Str1,  0);
    SBit  := StrToIntDef(Str2, -1);

    if (SByte < Low(RxBuff)+1) or (SByte > High(RxBuff)) then exit;

    if (SBit < 0) then
    begin // Byte.
        EByte := StrToIntDef(DataStr,  0);
        if (EByte > SByte) and (EByte < High(TxBuff)) then
        begin
            if (ExpStr = '') then begin
                for i:= SByte to EByte do
                    Result := Result + Char(RxBuff[i-1]);
                exit;
            end
            else begin
                fValue := 0;
                for i:= SByte to EByte do begin
                    fValue := (fValue * 256) + RxBuff[i-1];
                end;
            end;
        end else
            fValue := RxBuff[SByte-1];
    end else
    begin
        EBit  := StrToIntDef(DataStr, -1);
        if EBit = -1 then EBit := SBit;

        if (SBit < 0)    or (SBit > 7) then exit;
        if ((EBit - 1) > SBit) then exit;

        // AA 01 92 14 61 01 02 00 00 00 00 00 00 07 00 00 00 00 02 F8 00 00 10 00 C6 
        {
            Data := RxBuff[SByte - 1];
            fValue := 0;
            Idx := SBit;
            for i := 0 to SBit - EBit do
            begin
                if (Data and (1 shl Idx) <> 0) then
                begin
                    fValue := fValue + (1 shl (SBit-EBit-i));
                end;
                Idx := Idx - 1;
            end;
        }
        // BIT : 0 ~ 7
        Data   := RxBuff[SByte + 3];
        sBits  := IntToBin(Data, 8);
        sData  := Copy(sBits, 8 - SBit, EBit);
        iValue := BinToIntDef(sData, 8);
        fValue := iValue;
    end;

    if ExpStr <> '' then
    begin
        ExpStr := ReplaceStr(ExpStr, 'DATA', FloatToStr(fValue));
        fValue := ScieCalc.CalcExpression(ExpStr);
    end;

    Result := FormatFloat('0.###', fValue);
end;

procedure TFrmKMIComm.BtnConnectClick(Sender: TObject);
begin
    CommConnect(not Comm.Connected);
end;

procedure TFrmKMIComm.BtnCloseClick(Sender: TObject);
begin
    Close();
end;

procedure TFrmKMIComm.FormCreate(Sender: TObject);
var FileName : String;
begin
    INI.LoadData;
    FileName := GetAppDir('') + 'KMICOMM.TXT';
    if FileExists(FileName) then
        ComboBox_Cmd.Items.LoadFromFile(FileName);

//    CommConnect(True);
end;

procedure TFrmKMIComm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmKMIComm.BtnSendClick(Sender: TObject);
var nCmd, nAddr : Byte;
    Str : String;
begin
    Str   := ComboBox_Cmd.Text;
    nCmd  := HexToIntDef( GetTokenTrim(Str, ':'), 0);
    nAddr := HexToIntDef(Edit_Addr.Text, Tag);
    CommSend(nAddr, nCmd, Trim(Edit_Data.Text));
end;

procedure TFrmKMIComm.BtnClearClick(Sender: TObject);
begin
    FillChar(RxBuff, sizeOf(RxBuff), 0);
    FillChar(TxBuff, sizeOf(TxBuff), 0);
    CommConnect(True);

    Memo.Clear;
    Memo_KWP.Lines.Clear;
end;


//==============================================================================
procedure TFrmKMIComm.AddKWPLog(Param : String);
begin
    with Memo_KWP do begin
        if Lines.Count > 100 then Lines.Delete(0);
        Lines.Add(Param);
    end;
end;

procedure TFrmKMIComm.BtnKWPConnectClick(Sender: TObject);
var Param : String;
begin
    BtnKWPConnect.Enabled := False;

    // START COMMNUICATION : 80 47 F1 81 3E
    Param := Format('%s %s %s 81 3E', [Edit_Fmt.Text, Edit_Tgt.Text, Edit_Src.Text]);

    AddKWPLog('# Start Commnunication');
    AddKWPLog('> Request  : ' + Param);
    if CommSend(0, $10, Param) then
        AddKWPLog('< Response : ' + MakeHexaString(@RxBuff[4], RxLen-5))
    else
        AddKWPLog('< ERROR');

    AddKWPLog('');

    BtnKWPConnect.Enabled := True;
end;

procedure TFrmKMIComm.BtnKWPDisconnectClick(Sender: TObject);
var Param : String;
begin
    BtnKWPDisconnect.Enabled := False;

    AddKWPLog('# Stop Commnunication');
    AddKWPLog('> Request  : ' + Param);
    if CommSend(0, $11, '82') then
        AddKWPLog('< Response : ' + MakeHexaString(@RxBuff[4], RxLen-5))
    else
        AddKWPLog('< ERROR');
    AddKWPLog('');

    BtnKWPDisconnect.Enabled := True;
end;


procedure TFrmKMIComm.BtnKWPSendClick(Sender: TObject);
var CmdStr, Code, Param, RdStr : String;
    SID : Byte;
    
begin
    BtnKWPSend.Enabled := False;

    Param := Edit_Frame.Text;
    SendKWP(Param);

    BtnKWPSend.Enabled := True;
end;

procedure TFrmKMIComm.FormShow(Sender: TObject);
var FileName : String;
begin
    FileName := GetAppDir('KWP') + 'SIDLIST.txt';
    if FileExists(FileName) then
        ComboBox_SID.Items.LoadFromFile(FileName);

    ComboBox_Param1.Clear;
    ComboBox_Param2.Clear;
end;


procedure TFrmKMIComm.SendKWP(Param : String);
var bOk : Boolean;
    i, idx1, idx2, KWPTxLen, KWPRxLen : Integer;
    KWPTx, KWPRx : array[0..128] of Byte;
    Str, RdStr : String;
begin
    Edit_Frame.Text := Param;
    Memo_KWP.Clear;

    AddKWPLog('> Request  : ' + Param);

    KWPTxLen := 0;
    while (Param <> '') do begin
        KWPTx[KWPTxLen] := HexToIntDef( GetToken(Param, ' '), 0);
        KWPTxLen := KWPTxLen + 1;
    end;

    // SID코드부터만 보낸다. KMI COMM이 그런구조..
    Param := MakeHexaString(@KWPTx[4], KWPTxLen-4);

    // 데이터를 전송. 정상응답인경우.
    if CommSend(0, $12,  Param) then
    begin
        KWPRx[0] := $80;
        KWPRx[1] := HexToIntDef(Edit_Src.Text, 0);
        KWPRx[2] := HexToIntDef(Edit_Tgt.Text, 0);
        KWPRx[3] := 0;
        for i:= 4 to RxLen-1 do begin
            KWPRx[i] := RxBuff[i];
            KWPRx[3] := KWPRx[3] + 1;
        end;
        KWPRxLen := RxLen;
        AddKWPLog('< Response : ' + MakeHexaString(@KWPRx[0], KWPRxLen));

        bOk := True;
    end
    else begin
        bOk := False;
        AddKWPLog('< ERROR');
    end;

    AddKWPLog('');

    if not bOk then exit;


{
#1 Message length = 0x80
#2 Target address = 0xXX
#3 Source address = 0xXX
#4 AdditionalLength = 0x06
#5 Request Id = 0x61
#6 Local Identifier = 0x09
#7 ~ #12 Reserved = 0x00
#8 bit
b0 : CAN Communication limp home mode status with any related node
b1 : P Pos
}

    //==========================================================================
    // 츨력값 표시.
    for i:= 0 to MemoRx.Lines.Count-1 do
    begin
        RdStr := MemoRx.Lines[i];
        if RdStr[1] = '#' then begin
            Str := GetTokenTrim(RdStr, ' ');
            GetToken(Str, '#');
            idx1 := StrToIntDef(Str, 0);
            idx2 := idx1;

            if Pos('#', RdStr) > 0 then
            begin
                GetToken(Str, '#');
                idx2 := StrToIntDef(GetToken(Str, '~'), 0);
            end;
        end;

        // MessageStr을 가져온다.
        Str := GetTokenTrim(RdStr, '=');


        AddKWPLog(RdStr);
    end;
end;


var BaseDir : String;
procedure TFrmKMIComm.BtnOpenClick(Sender: TObject);
var i : Integer;
    Str, RdStr : String;
    StrList : TStringList;
begin
    StrList := TStringList.Create;

    OpenDialog.InitialDir := GetAppDir('CONFIG');
    OpenDialog.Filter := 'ing files(*.ing)|*.ing';

    if OpenDialog.Execute then
    begin
        sConfigFile := OpenDialog.FileName;
        StatusBar.Panels[2].Text := sConfigFile;

        StrList.LoadFromFile(sConfigFile);
        BaseDir := ExtractFilePath(sConfigFile);
        ComboBox_SID.Clear;
        for i:= 1 to StrList.Count-1 do begin
            RdStr := StrList[i];
            Str := GetToken(RdStr, ';');
            ComboBox_SID.Items.Add(Str);
        end;

        ComboBox_Param1.Clear;
        ComboBox_Param2.Clear;
        Edit_Frame.Clear;
    end;

    StrList.Free;
end;

//TStruct

procedure TFrmKMIComm.ComboBox_SIDChange(Sender: TObject);
var i, j, Idx, nMode, MsgNo1, MsgNo2 : Integer;
    Str, RdStr, FileName, MsgName, Param : String;
    MsgStr, ByteStr : String;
begin
    FileName := BaseDir + ComboBox_SID.Text + '.txt';
    if not FileExists(FileName) then exit;

    Idx := 0;
    nMode := 0;
    MemoTx.Lines.Clear;
    MemoRx.Lines.Clear;

    ComboBox_Param1.Clear;

    try
        MemoMsg.Lines.LoadFromFile(FileName);

        MsgStr := '';
        for i:= 0 to MemoMsg.Lines.Count-1 do
        begin
            RdStr := Trim(MemoMsg.Lines[i]);
            if RdStr = '' then continue;

            if RdStr = 'Request Message' then begin
                nMode := 1;
                continue;
            end;

            if RdStr = 'Postive Response Message' then begin
                nMode := 2;
                continue;
            end;

            case nMode of
            1 : begin // #1 Message length = 0x80
                // Byte 번호인경우.
                if RdStr[1] = '#' then // PORT번호.
                begin
                    Str     := GetToken(RdStr, ' '); // Byte Order.
                    MsgName := GetTokenTrim(RdStr, '='); // Byte Order.
                    Param   := Trim(RdStr);

                    MsgNo1 := StrToIntDef( Copy(Str, 2, Length(Str)-1), 0);
                    MsgNo2 := MsgNo1;

                    if Pos('~', MsgName) > 0 then begin
                        GetToken(MsgName, '#');
                        Str := GetToken(MsgName, ' '); // Byte Order.
                        MsgNo2 := StrToIntDef( Str, 0);
                    end;

                    if MsgNo1 = 2 then ByteStr := Edit_Tgt.Text else
                    if MsgNo1 = 3 then ByteStr := Edit_Src.Text else

                    if Copy(Param, 1, 2) = '0x' then // 16진수인경우.
                    begin
                        ByteStr := Copy(Param, 3, Length(Param)-2)
                    end else

                    if (Param = 'XX') then
                    begin
                        if (MsgNo1 = MsgNo2) then Str := Format('#%d : %s', [MsgNo1, MsgName])
                                             else Str := Format('#%d ~ #%d: %s', [MsgNo1, MsgNo2, MsgName]);
                        ComboBox_Param1.Items.Add(Str);

                        if ComboBox_Param1.ItemIndex <> 0 then begin
                            ComboBox_Param1.ItemIndex := 0;
                        end;

                        ByteStr := Param;
                    end else
                        ByteStr := Param;

                    for j := MsgNo1 to MsgNo2 do begin
                        Idx := MemoTx.Lines.Add(ByteStr + ' = ' + MsgName + ' ; ');
                    end;

                end else begin
                    Str     := GetTokenTrim(RdStr, ':'); // Byte Order.
                    MsgName := Trim(RdStr);          // MessageName
                    MemoTx.Lines[Idx] := MemoTx.Lines[Idx] + Format('%s : %s, ', [Str, MsgName]);
                end;
            end;

            2 : begin
                MemoRx.Lines.Add(RdStr)
            end;
            end;
        end; // end for...

        if ComboBox_Param1.ItemIndex = 0 then
            ComboBox_Param1Change(Sender);

        MakeFrame;
    finally
    end;
end;

procedure TFrmKMIComm.ComboBox_Param1Change(Sender: TObject);
var Idx1, Idx2 : Integer;
    Str, RdStr : String;
begin
    ComboBox_Param1.Tag := 0;
    ComboBox_Param2.Clear;

    // #a ~ #b : aaaa
    RdStr := ComboBox_Param1.Text;
    Str := GetTokenTrim(RdStr, ':');

    // 시작번호를 얻고.
    GetToken(Str, '#');
    Idx1 := StrToIntDef(GetTokenTrim(Str, '~'), -1);
    Idx2 := Idx1;

    // 종료번호를 얻고
    if Str <>'' then begin
        GetToken(Str, '#');
        Idx2 := StrToIntDef(GetTokenTrim(Str, ' '), -1);
    end;

    if (Idx1 < 0) or (Idx1 > MemoTx.Lines.Count-1) then exit;
    if (Idx2 < 0) or (Idx2 > MemoTx.Lines.Count-1) then exit;

    ComboBox_Param1.Tag := Idx1;

    RdStr := MemoTx.Lines[Idx1];
    GetToken(RdStr, ';');
    while RdStr <> '' do begin
        Str := GetTokenTrim(RdStr, ',');
        ComboBox_Param2.Items.Add(Str);
        if ComboBox_Param2.ItemIndex <> 0 then
            ComboBox_Param2.ItemIndex := 0;
    end;
    ComboBox_Param2Change(Sender);
end;

procedure TFrmKMIComm.ComboBox_Param2Change(Sender: TObject);
var Idx : Integer;
    Str, RdStr1, RdStr2, Param : String;
begin
    Idx := ComboBox_Param1.Tag;
    if (Idx < 0) or (Idx > MemoTx.Lines.Count-1) then exit;

    RdStr2 := ComboBox_Param2.Text;
    if RdStr2 = '' then exit;

    RdStr1 := MemoTx.Lines[Idx];
    Str := GetTokenTrim(RdStr2, ':');

    if Copy(Str, 1, 2) = '0x' then begin
        Param := Copy(Str, 3, Length(Str)-2);
    end else
        Param := Str;

    GetToken(RdStr1, '=');
    MemoTx.Lines[Idx] :=  Param + ' =' + RdStr1;

    MakeFrame;
end;

procedure TFrmKMIComm.MakeFrame;
var i : Integer;
    RdStr : String;
begin
    Edit_Frame.Text := '';  //ReplaceStr(MemoTx.Lines.Text, CRLF, ' ');
    for i := 0 to MemoTx.Lines.Count-1 do begin
        RdStr := MemoTx.Lines[i];
        Edit_Frame.Text := Edit_Frame.Text + GetTokenTrim(RdStr, '=') + ' ';
    end;
end;

procedure TFrmKMIComm.DecodeReceiveFrame;
begin
    //
end;

procedure TFrmKMIComm.SpeedButton1Click(Sender: TObject);
var FileName : String;
begin
    FileName := ExtractFilePath(sConfigFile) + ComboBox_SID.Text + '.txt';
    if FileExists(FileName) then begin
        if (IDOK <> MessageBox('파일이 존재합니다. 수정할까요',
            '저장확인', MB_OKCANCEL or MB_ICONQUESTION)) then exit;
    end;
    MemoMsg.Lines.SaveToFile(FileName);
end;

end.

