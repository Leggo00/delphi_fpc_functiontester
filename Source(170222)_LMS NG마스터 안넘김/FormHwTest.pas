//=============================================================================
//
//  FormHWTest.pas
//
//  이곳에서 하드웨어 관련 중간 Inteface역할을 한다.
//  메인등 다른 폼에서는 하드웨어를 직접 제어하지 않는다.
//
//   하드웨어 전달명령에는 규칙이 있다.
//   XXXN_CC  XXX : 자원종류 3Byte
//                  N  : 카드번호.
//                  CC : 채널번호
//=============================================================================
unit FormHwTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Menus, ScieCalc, ExtCtrls, ComCtrls, ToolWin, ValEdit, Grids, chkgrid,
  StdCtrls, Dialogs, XiButton, Global, FormGraph, FormResEdit,
  FormCANCom, uCanDBC, uCanUnit, DPBLabel, XiPanel;

const
    INVALID_VALUE     = -9999;
    INVALUE_VALUE_STR = 'N/A';

    MAX_CANHW         = 10;    // CAN HARDWARE수

    WM_CAN_UPDATE     = WM_USER + 100;
    WM_AD_UPDATE      = WM_USER + 101;
    WM_SET_TIMESYC    = WM_USEr + 102;

type
  TSweepInfo = record
      sResouceName: string;
      nInterval: integer;
      fMin, fMax, fInc, fValue : double;
      aSweepItems: TStringList;

      sTripPoint: string;
      bResult : boolean;
  end;

  TFrmHwTest = class(TForm)
    TabInput: TTabControl;
    GridInput: TCheckStringGrid;
    TabOutput: TTabControl;
    GridOutput: TCheckStringGrid;
    TimerRead: TTimer;
    ValueList: TValueListEditor;
    Label1: TLabel;
    ScieCalc: TScieCalc;
    TimerSweep: TTimer;
    MainMenu1: TMainMenu;
    MenuReset: TMenuItem;
    MenuCAN: TMenuItem;
    MenuDevice: TMenuItem;
    N1: TMenuItem;
    CAN011: TMenuItem;
    NIHardware1: TMenuItem;
    KMIHardware1: TMenuItem;
    BARCODE1: TMenuItem;
    BARCODE21: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabInputChange(Sender: TObject);
    procedure TabOutputChange(Sender: TObject);
    procedure GridInputSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridInputDblClick(Sender: TObject);
    procedure GridInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnShowCANClick(Sender: TObject);
    procedure TimerSweepTimer(Sender: TObject);
    procedure MenuResetClick(Sender: TObject);
    procedure CanMenuClick(Sender: TObject);
    procedure NIHardware1Click(Sender: TObject);
    procedure KMIHardware1Click(Sender: TObject);
    procedure BARCODE1Click(Sender: TObject);
    procedure BARCODE21Click(Sender: TObject);
  private

    { Private declarations }
    function  FindResType(Param : String) : TResType;
    procedure ClearGrid(Grid: TStringGrid);
    procedure CanDiagMenuClick(Sender: TObject);
    procedure WriteEEPROm(sString : String);
    procedure WriteTrace(sString : String);
    procedure WriteManufacturing(sString : String);
    procedure ECUManufacturing();
    function ReturnIONumber(IOName: String; var BDNum,
      ChNum: Integer): Boolean;
  public
    { Public declarations }
    nCANCount: integer;
    GMYMD    : String;
    CanBuff : array [1..MAX_CANHW] of TStringList;

    procedure OnCANReadEvent(Sender : TObject);

    procedure AddCanMsg(nPort : Integer; Param : String);
    procedure DisplayResource(Idx : TResType; Grid : TStringGrid);
    function TEST(sString: String): String;
    function GetBuffData(Data : array of Byte; nByte, nBit, nBitLen : Integer; Option : Integer = 0) : Integer;

  end;

  // -----------------------------------------
  // 자원이름으로 하드웨어를 제어한다. 모든하드웨어 제어는 이 함수를 통한다.
  procedure ResetIO;
  procedure ReadValueToBuffer;
  function  ReadResNameFromBuffer(ResName : String) : String;

  function  WriteResName(ResourceItem : TResourceItem; Param : String) : Boolean;
  function  ReadResName(ResourceItem : TResourceItem;  Param : String) : String;

var
  FrmHwTest: TFrmHwTest;
  gFrmCANCom : array[1..MAX_CANHW] of TFrmCANCom;

  gSweepInfo: TSweepInfo;
  sTraceString : String;
  nMSelCount : Integer;
  bMotorChange : Boolean;

implementation

uses
    GenUtils, {FormHardware}FormHWMain, FormInput, FormBuff, FormKMIComm,
    DateUtils, Math, FormSensorTable, FormCanDiag,
    FormMain, Form7555, FormFC100, FormSorensen, FormXantrex,
    uCanKMI, FormDevice, FormNIhardware, uCanDiag, FormBarcode,
    FormTable, FormTestOption, FormTempSensor, FormEditModel,FormLN300AG6, FormCANEmul,
  FormLog;

{$R *.dfm}

//------------------------------------------------------------------------------
// 하드웨어 자원을 초기화한다.
procedure ResetIO;
begin
    TFrmSorensen(DeviceManager.DevFormList[1]).SetPowerOff;
    TFrmLN300AG6(DeviceManager.DevFormList[4]).BtnOffClick(nil);
    TFrmCANEmul(DeviceManager.DevFormList[3]).BtnStopClick(nil);
    DelayEx(300,True);

    InitializeDeviceAll;
   
    FrmHWTest.ValueList.Strings.Clear;

    //FrmMain.InitialDesignerForm();
    FrmCanDiag.Cb_SendTestPresent.Checked := False;
end;
//------------------------------------------------------------------------------
// 측정값을 읽어 버퍼에 저장한다.
procedure ReadValueToBuffer;
begin
//
end;
//------------------------------------------------------------------------------
// 버퍼에서 측정값을 읽는다.
function ReadResNameFromBuffer(ResName : String) : String;
begin
    try
        Result := FrmHwTest.ValueList.Values[ResName];
    except
    end;
end;

// CAN Message가 들어오면 이쪽에서 처리한다.
procedure TFrmHwTest.OnCANReadEvent(Sender : TObject);
var
    i : Integer;
begin
    // 메세지를 전달한다.
    for i := 0 to Application.MainForm.MDIChildCount-1 do
        SendMessage(Application.MainForm.MDIChildren[i].Handle, WM_CAN_UPDATE, Integer(Sender), 0);
end;
//------------------------------------------------------------------------------
// 하드웨어를 제어한다.
function WriteResName(ResourceItem : TResourceItem; Param : String) : Boolean;
var
    i, nCard, nCh : integer;
    Str, RdStr, sValue, sExpStr, sItems, sTemp, sResName : String;
    TxID, RxID: Integer;
    fFreq, fDuty : Double;

    nChannel, nMode, nType, nRange : integer;
    CanUnit : TCanUnit;
    Cmd: string;
    CanMessage : TCanMessage;
    nStartBit, nBitLen, nValue, nOption : Integer;
    bInvert : Boolean;
    fBaudrate, fScale, fOffset : Double;
    fValue, fValue1: Double;
    nCANId: integer;
    nParam: integer;
    bIncOk: boolean;
    aResourceItem: TResourceItem;

    sChannels, sOption : String;
    nChannelCount, numSampsPerChan : Integer;
    fSampling : Double;

    sTxID, sRxID : String;
    fAV, fAW : Double;
    nAV, nAW : Integer;
    hAV, hAW, hAVh, hAWh, hAVl, hAWl : String;
    sSendStr : string;
begin
    Param  := Uppercase(Param);
    Result := False;

    if (ResourceItem.ResName = 'RESET') then
    begin
        FrmHWTest.MenuReset.Click;
        Result := True;
    end
    else if (ResourceItem.ResName <> '') then
    begin
        case ResourceItem.ResType of
            res_DO,
            res_AO : begin // 하드웨어 자원인경우 전달.
                FrmHWMain.WriteIOControl( ResourceItem.IOName, Uppercase(Param), ResourceItem.tagStr);
            end;

            res_RO : begin
                RdStr   := ResourceItem.IOName;
                GetToken(RdStr, 'RO');
                nCh     := StrToIntDef( RdStr, -1);
                RdStr   := ResourceItem.tagStr;

                fValue  := StrToFloatDef(Param, 0);
                //FrmHWMain.WriteRO(nCh, fValue);
            end;
            //------------------------------------------------------------------
            // CAN Message전송.
            res_CAN : begin
                RdStr    := ResourceItem.IOName;
                GetToken(RdStr, 'CAN');
                nCard    := StrToIntDef( GetToken(RdStr, '_'), -1);
                nChannel := StrToIntDef( RdStr, 1 ); // CAN1_01

                if not (nCard in [1..FrmHwTest.nCANCount]) then exit;
                CanUnit := gFrmCANCom[nCard].CanUnit;

                RdStr := ResourceItem.tagStr;
                Cmd := GetTokenTrim(RdStr, ':');
                // Cmd = 'CONNECT:500,MASK=1234', 'SEND:123=00 00 00 00:100', 'SET=123,0,8,
                //--------------------------------
                if (Cmd = 'CONNECT') then begin
                    fBaudrate := StrToFloatDef(GetToken(RdStr, ','), 500);
                    if (Param = 'ON') or (Param = '1') then
                        CanUnit.Open(nChannel, fBaudrate, RdStr)
                    else
                        CanUnit.Close(nChannel);
                end else
                //--------------------------------
                if (Cmd = 'POLLING') then begin
                    if (Param = 'ON') or (Param = '1') or (Param = 'CONNECT') then
                        CanUnit.ContinueReadPolling
                    else
                        CanUnit.PauseReadPolling;
                end else
                if (Cmd = 'DISCONNECT') then begin
                    CanUnit.Close(nChannel);
                end else
                //--------------------------------
                if (Cmd = 'CLEAR') then begin
                    // // EX) 'CLEAR:123'
                    nCANId := HexToIntDef(GetToken(RdStr, '='), -1);
                    CanUnit.Clear(nChannel, True, True, nCANId);
                end else
                //--------------------------------
                if (Cmd = 'SEND') then begin
                    // EX) 'SEND:123=00 00 00 00:100'
                    CANMessage := StrToCanMsg(RdStr);
                    if CanMessage.CANId >= 0 then begin
                        if (Param = 'ON') or (Param = '1') or (Param = 'TRUE') or (Param = 'O') then
                            CanUnit.Send(nChannel, CANMessage)
                        else
                            CanUnit.Clear(nChannel, False, False, CanMessage.CANId);
                    end;
                end else
                //--------------------------------
                if (Cmd = 'SET') then begin
                    // EX) 'SET:123=10,2:1,0:1'
                    CANMessage.CANId := HexToIntDef(GetToken(RdStr, '='), -1);
                    CANMessage.DLC := $FF;

                    CanUnit.Lock;
                    try
                        for i:= 0 to CanUnit.TxCount-1 do
                        begin
                            if (CanUnit.TxMessages[i].CANId = CANMessage.CANId) then
                            begin
                                CANMessage := CanUnit.TxMessages[i];
                                break;
                            end;
                        end;
                    finally
                        CanUnit.UnLock;
                    end;

                    if (CANMessage.DLC = $FF) then
                    begin
                        CANMessage.DLC := 8;
                        for i := 0 to 7 do
                            CANMessage.Data[i] := 0;

                        CANMessage.nCycle := 0;
                    end;

                    nStartBit := StrToIntDef( GetToken(RdStr, ','), 0);
                    nBitLen   := StrToIntDef( GetToken(RdStr, ':'), 0);
                    fScale    := StrToFloatDef( GetToken(RdStr, ','), 1);
                    fOffset   := StrToFloatDef( GetToken(RdStr, ':'), 0);
                    sOption   := GetToken(RdStr, ':');;

                    nOption := 0;
                    if Pos('M', sOption) > 0 then nOption := nOption + 1;
                    if Pos('S', sOption) > 0 then nOption := nOption + 2;

                    if (Param = 'ON') or (Param = '1') or (Param = 'TRUE') or (Param = 'O') then
                        fValue := 1
                    else
                        fValue := StrToFloatDef( Param, 0 );

                    // 값을 계산한다  y = scale * x + offset -->  x = (y - Offset)/ Scale
                    nValue            := Round((fValue - fOffset) / fScale);

                    if SetCANValue(CANMessage, nStartBit, nBitLen, nValue, nOption) then
                    begin
                        CanUnit.Send(nChannel, CANMessage);
                        Result := True;
                    end
                end
                else if (Cmd = 'DIAG') then   // DIAG  | SEND:00 00 00,   READ:3,1
                begin
                    // RdStr := Uppercase(ResourceItem.Tag);
                    Str   := GetTokenTrim(RdStr, ':');
                    sTxID := GetTokenTrim(RdStr, ',');
                    sRxID := GetTokenTrim(RdStr, ',');

                    with FrmCanDiag do
                    begin
                        if (Str = 'START') then begin
                            Edit_TxID.Text := sTxID;
                            Edit_RxID.Text := sRxID;
                            StartDiag;
                        end else
                        if (Str = 'STOP')  then begin
                            StopDiag;
                        end else
                        if (Str = 'SEND')  then begin
                            if SendDiag(sTxID) = 1 then
                            begin
                                //
                            end;
                        end;

                    end;
                end;
            end;

            
            // Frequence자원
            res_PO : begin
                // 채널번호를 가져온다.
                RdStr := ResourceItem.IOName; // PO1_1;
                GetToken(RdStr, 'P');
                nCard := StrToIntDef( GetToken(RdStr, '_'), -1);
                nCh   := StrToIntDef(RdStr, 0);

                //tagStr=[FREQ:50],[DUTY:1000]:DATA*10;
                RdStr   := ResourceItem.tagStr;
                Str     := GetToken(RdStr, ':');
                sValue  := GetToken(RdStr, ':');
                sExpStr := GetToken(RdStr, ':');

                fValue1 := StrToFloatDef(Param, 0);
                // 수식이 있는경우 값을 변경한다.
                if sExpStr <> '' then begin
                    sExpStr := ReplaceStr(sExpStr, 'DATA', FloatToStr(fValue1));
                    fValue1 := FrmHWTest.ScieCalc.CalcExpression(sExpStr);
                end;

                if (Str = 'DUTY') then begin
                    fFreq := StrToFloatDef(sValue, 1000);
                    fDuty := fValue1;
                end else
                //if (Str = 'FREQ') then
                begin
                    fFreq := fValue1;
                    fDuty := StrToFloatDef(sValue, 50);
                end;
                FrmHWMain.WritePO(nCard, nCh, fFreq, fDuty);
            end;

            res_COMOUT : begin
               // 외부 Device장치인경우..
               if Copy(ResourceItem.IOName, 1, 3) = 'DEV' then
               begin
                    DeviceManager.WriteDevice(ResourceItem, Param);
               end else
               // CAN DIAGONOSIS...
               if (ResourceItem.IOName = 'CANDIAG') then
               begin
                    RdStr := ResourceItem.tagStr;
                    Str := GetToken(RdStr, ':');
                    if (Str = 'START') or (Str = 'CONNECT') then
                    begin
                        if (Param = 'ON') or (Param = '1') then
                            FrmCanDiag.StartDiag
                        else
                           FrmCanDiag.StopDiag;
                    end else
                    if (Str = 'STOP') then begin
                           FrmCanDiag.StopDiag;
                    end else
                    if (Str = 'SEND') then begin
                        if RdStr = '' then RdStr := Param;

                        // RdStr = '00 00 00 00 00' or '$01$02$03$04$05'
                        if Pos('$', RdStr) > 0 then begin
                            RdStr := Trim( ReplaceChar(RdStr, '$', ' '));
                        end;
                        FrmCanDiag.SendDiag(RdStr);
                    end else
                    if (Str = 'SETID') then begin
                        TxID := HexToIntDef( GetToken(RdStr, ','), -1);
                        RxID := HexToIntDef( GetToken(RdStr, ','), -1);
                        FrmCanDiag.SetID(TxID, RxID);
                    end else
                    if (Str = 'WRITE') then begin
                        if (Param = 'ON') or (Param = '1') then
                        begin
                            FrmHwTest.WriteEEPROm(RdStr);
                        end;
                    end else
                    //BtnGmvSecClick
                    if (Str = 'SecurityAccess') then begin
                        if (Param = 'ON') or (Param = '1') then
                        begin
                            FrmCanDiag.SecurityAccess(1)
                        end;
                    end else
                    if (Str = 'TESTPRESENT') then begin
                        if (Param = 'ON') or (Param = '1') then
                        begin
                            WITH FrmCanDiag DO
                            begin
                                sSendStr := GetToken(RdStr,',');
                                Edit_Present.Text := sSendStr;
                                //SendDiag(sSendStr);
                                CanDiag.SendPRESENT(sSendStr);
                                Timer.Interval := StrToIntDef(RdStr, 1) * 1000;
                                Timer.Enabled := True;
                                bConnected    := True;
                                ConnectTime   := Now;
                                fLastSendTime := GetTickCountEX;
                                Cb_SendTestPresent.Checked := True;
                            end;
                        end else begin
                            WITH FrmCanDiag DO
                            begin
                                Timer.Enabled := False;
                                bConnected    := False;
                                Cb_SendTestPresent.Checked := False;
                            end;
                        end;
                    end else  
                    if (Str = 'TRACEWRITE') then begin
                        if (Param = 'ON') or (Param = '1') then
                        begin
                            RdStr := FrmMain.vl_Table.Values['WRITE_REQ_MSG'];
                            FrmHwTest.WriteManufacturing(RdStr);
                        end;
                    end else
                    if (Str = 'ECUManufacturingDate') then begin
                        if (Param = 'ON') or (Param = '1') then
                        begin
                            FrmHwTest.ECUManufacturing();
                        end;
                    end else
                    if (Str = 'SENDAVW') then
                    begin                       
                        //if (Param = 'ON') or (Param = '1') then
                        //begin
                            //if RdStr = '' then RdStr := Param;
                            fAV := StrToFloatDef(GetToken(Param, ','), 0);
                            fAW := StrToFloatDef(Param, 0);

                            nAV := Floor(fAV * 1024);
                            nAW := Floor(fAW * 1024);

                            hAV := IntToHex(nAV, 4);
                            hAW := IntToHex(nAW, 4);

                            hAVh := copy(hAV, 1, 2);
                            hAVl := copy(hAV, 3, 2);
                            hAWh := copy(hAW, 1, 2);
                            hAWl := copy(hAW, 3, 2);

                            RdStr := '3B 30' + ' ' + hAVh + ' ' + hAVl + ' ' + hAWh + ' ' + hAWl;

                            FrmCanDiag.SendDiag(RdStr);
                        //end;
                    end;
                end;
            end;

            res_VROUT : begin
                RdStr    := ResourceItem.IOName;
                if (RdStr = 'RESETIO') then begin
                    FrmHwTest.MenuResetClick(nil);
                end else

                if (RdStr = 'GRAPH') then begin
                    RdStr    := ResourceItem.tagStr;
                    Str := GetToken(RdStr, ':');

                    try
                        if FrmGraph <> nil then
                            FrmGraph.RunCommand(RdStr);
                    except
                    end;
                    
                end else

                // SCOPE 파형을 읽는다.
                if (RdStr = 'NISCOPE') then begin
                    RdStr    := ResourceItem.tagStr;
                    // RdStr = 'Dev1/ai0,Dev1/ai1:2,1000,1000
                    if (FrmGraph <> nil) then
                    begin
                        sChannels        := GetToken(RdStr, ':');
                        nChannelCount    := StrToIntDef(   GetToken(RdStr, ','), -1);
                        numSampsPerChan  := StrToIntDef(   GetToken(RdStr, ','), -1);
                        fSampling        := StrToFloatDef( GetToken(RdStr, ','), -1);

                        try
                            while True do
                            begin
                                FrmNI_Hardware.ReadWave(FrmGraph.Graph, sChannels, nChannelCount, numSampsPerChan, fSampling, 0);
                                break;
                            end;
                        Except
                           FrmLog.AddMessage('read wave check!!!');
                        end
                    end;
                end;
            end;
        end;

        FrmBuff.Add(ResourceItem.ResName, Param);
        FrmHwTest.ValueList.Values[ResourceItem.ResName] := Param;
        Result := True;
    end;
end;

//------------------------------------------------------------------------------
const
    CAN_MOTOROLA = $01;
    CAN_SIGNED   = $02;

function TFrmHwTest.GetBuffData(Data : array of Byte; nByte, nBit, nBitLen : Integer; Option : Integer = 0) : Integer;
var
    i : Integer;
    nInc : Integer;
    bSigned, bInvert : Boolean;
begin
    bSigned := (Option and CAN_SIGNED  ) <> 0;
    bInvert := (Option and CAN_MOTOROLA) <> 0;

    if (bInvert) then nInc := -1 else nInc := 1;

    Result := 0;
    for i:= 0 to nBitLen-1 do
    begin
        if not (nByte in [Low(Data)..High(Data)]) then break;

        if ((Data[nByte] and (1 shl nBit)) <> 0) then
            Result := Result or (1 shl i);

        nBit := nBit + 1;
        if (nBit > 7) then begin
            nByte := nByte + nInc;
            nBit := 0;
        end;        
    end;

    // 부호가 있는경우 (-)값 계산.
    if (bSigned) and (nBitLen > 1) then
    begin
        if Result > (1 shl (nBitLen-1)) then
            Result := Result - (1 shl nBitLen);
    end;
end;

procedure TFrmHwTest.TimerSweepTimer(Sender: TObject);
var
    aResourceItem: TResourceItem;
    i: integer;
    sResourceItem, sItems, sResourceValue, sValue: string;
begin
    TimerSweep.Enabled := False;

    with gSweepInfo do
    begin
        if fInc > 0 then
        begin
            if fMax <= fValue then
            begin
                bResult    := False;
                sTripPoint := 'N/A';
                exit;
            end;
        end
        else begin
            if fMax >= fValue then
            begin
                bResult    := False;
                sTripPoint := 'N/A';
                exit;
            end;
        end;

        fValue        := fValue + fInc;
        aResourceItem := CurrProject.GetResource(0, sResouceName);

        WriteResName(aResourceItem, FloatToStr(fValue) );
        with aSweepItems do
        begin
            if Count > 0 then
            begin
                for i := 0 to Count - 1 do
                begin
                    sItems         := aSweepItems[i];
                    sResourceItem  := GetToken(sItems, '=');
                    sResourceValue := GetToken(sItems, '=');

                    FillChar(aResourceItem, SizeOf(aResourceItem), 0);
                    aResourceItem := CurrProject.GetResource(0, sResourceItem);
                    sValue        := ReadResName( aResourceItem, '' );
                    if sResourceValue = sValue then
                    begin
                        sTripPoint := FloatToStr(fValue);
                        bResult    := True;
                        exit;
                    end
                    else
                        Break;
                end;
            end;
        end;
    end;

    TimerSweep.Enabled := True;
end;


function GetGMLanDTC(CanUnit : TCanUnit; Param : String) : String;
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
        //CanUnit.Clear(1, True, True);
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
                    sDTCCode := Format('%.2x%.2x', [
                        CanUnit.BuffMessage[i].Data[1],
                        CanUnit.BuffMessage[i].Data[2] ]);

                    if sDTCCode = '0000' then break;
                    StrList.Add(sDTCCode);
                end;
            end;
            if sDTCCode = '0000' then break;
        end;

        Result := IntToStr(StrList.Count) + ',' + ReplaceStr( StrList.Text, CRLF, ',');
        Result := Copy(Result, 1, Length(Result)-1);
    finally
        CanUnit.ContinueReadPolling;
        StrList.Free;
    end;
end;

// 하드웨어 값을 읽는다.
function ReadResName(ResourceItem : TResourceItem; Param : String) : String;
var
    fValue, fVolt, fCurr : Double;
    Str, RdStr, sTemp, sDevice : String;
    nCard, nCh : Integer;
    sCmd, sTag: string;
    Cmd, DevName : String;
    i, nType, nMode, nChannel, nIndex : Integer;
    // CAN 관련 변수들.
    CanUnit : TCanUnit;
    CANId, nStartBit, nByte, nByteLength, nBit, nBitLen, nValue, nOption, nStart, nlen : Integer;
    bInvert, bTripPoint : Boolean;
    fScale, fOffset : Double;
    sReadMode, sValue, sByte: string;
    sExpStr: string;
    fValue1: double;
    nLength: integer;
    sReturn : String;
    nRetryCount : Integer;
    sCommType : string;

    fStartTime: double;
    nTimeout, nTestMode: integer;
    sInputSrcRes, sInputGraphRes, sOutputAdRes, sInputValue: string;
    fInputInc, fOutputResult, fReadValue, fMinMax, fPrevInput, fCheckDelayms: double;
    aResourceItem : TResourceItem;

begin
    Result := 'N/A';
    {if (ResourceItem.ResType = res_AD) then
    begin
        // 1. Option을 확인한다.
        sTemp := ResourceItem.tagStr;  // ex) tagStr = COMMTYPE:1,2
        sCommType := GetToken(sTemp, ':');

        if sCommType = 'COMMTYPE' then
        begin
            ResourceItem.ResType := res_COMIN;
            ResourceItem.IOName  := 'DEV_04';
            GetToken(ResourceItem.tagStr, ':');
        end;
    end;     }

    if (ResourceItem.ResName <> '') then
    begin
        case ResourceItem.ResType of

            // 측정값은 하드웨어 자원에서 직접가져온다.
            res_AD : begin
            {
                RdStr := ResourceItem.IOName;
                sTag  := ResourceItem.tagStr;

                GetToken(RdStr, 'AD');
                nCard  := StrToIntDef( GetToken(RdStr, '_'), -1);
                nCh    := StrToIntDef( RdStr, -1);
                fValue := FrmHardware.ReadAD(nCard, nCh);



                if fValue <= 30 then
                    Result := FormatFloat('0.##', fValue);
            }
                Result := FrmHWMain.ReadIOcontrol(ResourceItem.IOName, '', ResourceItem.tagStr);
                if Result <> 'N/A' then begin
                    Result := FormatFloat('0.##', StrToFloatDef(Result, 0));
                end;
            end;

            res_DI : begin
                Result := FrmHWMain.ReadIOControl(ResourceItem.IOName, Param, ResourceItem.tagStr);
                if Result = 'TRUE' then
                    Result := 'ON'
                else
                    Result := 'OFF';
            end;

            // 출력자원은 버퍼에서 가져온다.
            res_DO, res_PO, res_AO, res_RO : begin
                Result := FrmHWTest.ValueList.Values[ResourceItem.ResName];
            end;

            res_VRIN : begin
                RdStr    := ResourceItem.IOName;
                if (RdStr = 'GRAPH') then begin
                    RdStr := ResourceItem.tagStr;
                    Result := MeasGraphValue(FrmMain.Graph, RdStr);
                end else
                if (RdStr = 'SWEEP_READ') then begin
                    sTag := ResourceItem.tagStr;
                    // InputPowerRes,InputStartValue,InputGraphRes,outputGraphRes,OutputResult,nTimeOut,CheckDelayms
                    sInputSrcRes   := GetToken(sTag, ',');
                    sInputValue    := GetToken(sTag, ',');
                    sInputGraphRes := GetToken(sTag, ',');
                    sOutputAdRes   := GetToken(sTag, ',');
                    fOutputResult  := StrToFloatDef(GetToken(sTag, ','), 10);
                    nTimeout       := StrToIntDef(GetToken(sTag, ','), 20);
                    fCheckDelayms  := StrToFloatDef(GetToken(sTag, ','), 500);
                    fStartTime     := GetTickCountEx;
                    fInputInc := 0.1;
                    nTestMode := 0;
                    fStartTime := GetTickCountEx();
                    aResourceItem := CurrProject.GetResource(0, sInputGraphRes);
                    WriteResName(aResourceItem, 'ON');
                    aResourceItem := CurrProject.GetResource(0, sOutputAdRes);
                    //DelayEx(200, True);
                    fReadValue := StrToFloatDef( ReadResName(aResourceItem, ''), 0) * 10;
                    if (fReadValue <> fOutputResult) then
                    begin
                        while (GetTickCountEx - fStartTime) <= (nTimeout * 1000) do
                        begin
                            if (not  FrmMain.gbRunning) then break;

                            aResourceItem := CurrProject.GetResource(0, sInputSrcRes);
                            WriteResName(aResourceItem, sInputValue);
                            FrmMain.vl_Variable.Strings.Values['CHECKVOLTAGE']  := sInputValue;
                            DelayEx(fCheckDelayms, True);
                            aResourceItem := CurrProject.GetResource(0, sInputGraphRes);
                            WriteResName(aResourceItem, 'ON');
                            //DelayEx(100, True);
                            aResourceItem := CurrProject.GetResource(0, sOutputAdRes);
                            fReadValue := StrToFloatDef( ReadResName(aResourceItem, ''), 0) * 10;
                            AddLog(Format('input value >>%s',[sInputValue]));
                            AddLog(Format('READ value >>%f',[fReadValue]));

                            if (fReadValue = fOutputResult) then begin
                                break;
                            end else if (fReadValue < fOutputResult) then begin
                                sInputValue := FloatToStr( StrToFloatDef(sInputValue, 0) + fInputInc)
                            end else if (fReadValue > fOutputResult) then begin
                                if ((fInputInc*100) = 10) then
                                begin
                                    fPrevInput := fPrevInput - 0.1;
                                    fInputInc  := 0.05;
                                end else if ((fInputInc*100) = 5) then begin
                                    fPrevInput := fPrevInput - 0.05;
                                    fInputInc := 0.01;
                                end;
                                sInputValue := FloatToStr(fPrevInput + fInputInc);
                            end;
                            fPrevInput := StrToFloatDef(sInputValue,0);
                            AddLog(Format('Inc >>%s',[sInputValue]));
                            //Application.ProcessMessages;
                            if (StrToFloatDef(sInputValue,0) > 15) then
                                break;
                        end;
                    end;
                    Result := FloatToStr(fReadValue);
                    AddLog(Format('END %s',[sInputValue]));
                end;
            end;

            res_CAN : begin
                RdStr    := ResourceItem.IOName;
                GetToken(RdStr, 'CAN');
                nCard    := StrToIntDef( GetToken(RdStr, '_'), -1);
                nChannel := StrToIntDef( RdStr, 1 ); // CAN_01

                if not (nCard in [1..FrmHwTest.nCANCount]) then exit;
                CanUnit := gFrmCANCom[nCard].CanUnit;

                RdStr := ResourceItem.tagStr;
                Cmd := GetTokenTrim(RdStr, ':');
                //--------------------------------
                if (Cmd = 'READ') then
                begin    
                    CANId := HexToIntDef(GetToken(RdStr, '='), -1);

                    CanUnit.Lock;
                    try
                        for i:= 0 to CanUnit.RxCount-1 do
                        begin
                            if (CanUnit.RxMessages[i].CANId    = CANId) and
                               (CanUnit.RxMessages[i].nChannel = nChannel        ) then
                            begin
                                Result := MakeHexaString(
                                    @CanUnit.RxMessages[i].Data[0], CanUnit.RxMessages[i].DLC );
                                break;
                            end;
                        end;
                    finally
                        CanUnit.UnLock;
                    end;
                end else

                if (Cmd = 'SET') then begin
                    // EX) 'READ:123=10,2,1,0:1'
                    CANId := HexToIntDef(GetToken(RdStr, '='), -1);

                    CanUnit.Lock;
                    try
                        for i:= 0 to CanUnit.RxCount-1 do
                        begin
                            if (CanUnit.RxMessages[i].CANId    = CANId) and
                               (CanUnit.RxMessages[i].nChannel = nChannel        ) then
                            begin
                                Str := GetToken(RdStr, ':');

                                nStartBit := StrToIntDef( GetToken(Str, ','), 0);
                                nBitLen   := StrToIntDef( GetToken(Str, ','), 0);
                                fScale    := StrToFloatDef( GetToken(Str, ','), 1);
                                fOffset   := StrToFloatDef( GetToken(Str, ','), 0);
                                bInvert   := False;
                                nValue    := GetCANValue(CanUnit.RxMessages[i], nStartBit, nBitLen, 0);
                                fValue    := nValue * fScale + fOffset;

                                if (RdStr = 'BIN') then begin
                                    Result := IntToBin(Trunc(fValue), nBitLen);

                                end else
                                if (RdStr = 'HEX') then begin
                                    Result := IntToHex(Trunc(fValue), 2);
                                end else
                                    Result    := FormatFloat('0.####', fValue);
                                break;
                            end;
                        end;
                    finally
                        CanUnit.UnLock;
                    end;
                end
            end;

            res_COMIN : begin
                // 외부 Device장치인경우..
                if Copy(ResourceItem.IOName, 1, 3) = 'DEV' then
                begin
                    Result := DeviceManager.ReadDevice(ResourceItem, Param);
                   { if sCommType = 'COMMTYPE' then
                    begin
                        Result := FloatToStr(StrToFloatDef(Result, 0)/60);
                    end;            }
                end else

               // CAN READ DIAGONOSIS...
                if (ResourceItem.IOName = 'CANDIAG') then
                begin
                    RdStr := ResourceItem.tagStr;
                    Str := GetToken(RdStr, ':');
                    if (Str = 'READ') then begin
                        nByte     := StrToIntDef(GetToken(RdStr, ','), -1);
                        nBit      := StrToIntDef(GetToken(RdStr, ','), -1);
                        nBitLen   := StrToIntDef(GetToken(RdStr, ','), -1);
                        sReadMode := GetToken(RdStr, ':');

                        nOption   := 0;
                        if Pos('M', sReadMode) > 0 then nOption := nOption + CAN_MOTOROLA;
                        if Pos('S', sReadMode) > 0 then nOption := nOption + CAN_SIGNED;

                        // nByte는 '0'부터 시작한다...
                        nValue := FrmHwtest.GetBuffData(FrmCanDiag.CanDiag.RxBuff, nByte, nBit, nBitLen, nOption);

                        if Pos('DATA', RdStr ) > 0 then
                        begin
                            sExpStr := ReplaceStr(RdStr, 'DATA', FloatToStr(nValue));
                            fValue1 := FrmHWTest.ScieCalc.CalcExpression(sExpStr);
                            Result  := FormatFloat('0.##', fValue1);
                        end
                        else
                            Result := FormatFloat('0.##', nValue);

                        // Result := FormatFloat
                    end else
                    if (Str = 'READSTR') then begin
                        nStart := StrToIntDef(GetToken(RdStr, ','), 1);
                        nLen   := StrToIntDef(GetToken(RdStr, ','), 9999);
                        sReadMode := RdStr;
                        Result := FrmCanDiag.CanDiag.GetRxStr(sm_Ascii , nStart, nLen);
                        if sReadMode = 'ATTRIBUTE1' then
                            FrmHwTest.GMYMD :=  Result;

                    end else
                    if (Str = 'READHEX') then begin
                        // if RdStr = '' then
                        // 수신된 메세지를 통째로 리턴한다.
                        nStart := StrToIntDef(GetToken(RdStr, ','), 1);
                        nLen   := StrToIntDef(GetToken(RdStr, ','), 9999);

                        Result := FrmCanDiag.CanDiag.GetRxStr(sm_Hex , nStart, nLen);
                    end;
                    // GM LAN 처리하기 위한 루틴. 2010.10.01.
                    if (Str = 'READDTC') then
                    begin
                        Result := GetGMLanDTC(FrmCanDiag.CanDiag.CanUnit, RdStr);
                    end;

                    if (Str = 'READTRACE') then
                    begin
                        nStart := StrToIntDef(GetToken(RdStr, ','), 1);
                        nLen   := StrToIntDef(GetToken(RdStr, ','), 9999);

                        sReturn := FrmCanDiag.CanDiag.GetRxStr(sm_Hex , nStart, nLen);
                        if Pos(sTraceString, sReturn) > 0 then
                            Result := '1'
                        else
                            Result := '0';
                    end;

                    {if (Str = 'GM_SEEDWRITE') then begin
                        Result := FrmCanDiag.SeedWrite;
                    end;
                    }
                    if (Str = 'START') then begin
                        nRetryCount := StrToIntDef(FrmTestOption.Edt_StartDiag.Text, 0);

                        for i := 0 to nRetryCount do
                        begin
                            FrmCanDiag.CanDiag.Send('10 60');
                            Delayex(100, true);
                            Result := FrmCanDiag.CanDiag.GetRxStr(sm_Hex , 1, 10);
                            if Result <> '' then
                            begin
                                break;
                            {end else //3차 에서 제거 2차엔 들어가 있음
                            begin
                                FrmHWMain.WriteDO(1,7, False);
                                Delay(500, True);
                                FrmHWMain.WriteDO(1,7, True);     }
                            end;
                        end;
                    end;
                    //
                end;
                if  (ResourceItem.IOName = 'TEMP') then
                begin
                    if FrmTestOption.cb_TempSpec.Checked then
                        Result := FrmMain.sTemperature
                    else
                        Result := TFrmTempSensor(DeviceManager.DevFormList[7]).DevRead('?T');
                end;
            end;
        end;
    end;
end;



procedure TFrmHwTest.FormCreate(Sender: TObject);
var
    i: integer;
    Idx : TResType;
    INI : TInifile;
    FileName : String;
    MenuItem : TMenuItem;
begin
    Width  := 1024;
    Height := 768;

    FileName := GetAppDir('') + 'CONFIG.INI';
    INI := TIniFile.Create(FileName);
    try
        nCANCount := min(MAX_CANHW, INI.ReadInteger('HARDWARE', 'CANCount', 0));
    finally
        INI.Free;
    end;

    TabInput.Tabs.Clear;
    TabOutput.Tabs.Clear;

    for Idx:= Low(TResType) to High(TResType) do
    begin
        if (Idx in [res_AO, res_DO, res_PO, res_RO, res_COMOUT, res_VROUT, res_CAN]) then
            TabInput.Tabs.Add(ResNameTbl[Idx]);

        if (Idx in [res_AD, res_DI, res_COMIN, res_VRIN]) then
            TabOutput.Tabs.Add(ResNameTbl[Idx]);
    end;

    with GridInput do
    begin
        Cells[0,0] := 'INPUT ITEM';
        Cells[1,0] := 'IONAME';
        Cells[2,0] := 'VALUE';
    end;

    with GridOutput do
    begin
        Cells[0,0] := 'OUTPUT ITEM';
        Cells[1,0] := 'IONAME';
        Cells[2,0] := 'VALUE';
        Cells[3,0] := 'USE';
    end;

    // CAN MODULE을 생성한다.
    MenuCAN.Clear;
    for i := 1 to nCANCount do
    begin
        gFrmCANCom[i] := TFrmCanCom.Create(Self);
        gFrmCANCom[i].INI.IniSection := Format('CAN%d', [i]);
        gFrmCANCom[i].INI.LoadData;
        gFrmCANCom[i].CANUnit := TKmiCAN.Create;
        gFrmCANCom[i].LabelType.Caption := 'Port';

        gFrmCANCom[i].BtnOpenDevice.OnClick(Self);

        if (gFrmCANCom[i].CANUnit <> nil) then
            gFrmCANCom[i].CANUnit.OnMessageRead := OnCANReadEvent;

        gFrmCANCom[i].CANUnit.ContinueReadPolling;

        gFrmCANCom[i].CANUnit.OnMessageRead := OnCANReadEvent;
        gFrmCANCom[i].CANUnit.ContinueReadPolling;

        CanBuff[i] := TStringList.Create;

        MenuItem := TMenuItem.Create(Self);
        MenuItem.Tag := i;
        MenuItem.Caption := Format('CAN%.2d', [i]);
        MenuItem.OnClick := CanMenuClick;
        MenuCAN.Add(MenuItem);
    end;

    // CAN DIAG을 생성한다.
    if (nCANCount > 0 ) then
    begin
        FrmCanDiag := TFrmCanDiag.Create(Self);
        FrmCanDiag.CanDiag.CanUnit := gFrmCANCom[1].CANUnit;

        MenuItem := TMenuItem.Create(Self);
        MenuItem.Tag := i;
        MenuItem.Caption := 'CAN Diagonosis';
        MenuItem.OnClick := CanDiagMenuClick;
        MenuCAN.Add(MenuItem);
    end;

    bMotorChange := True;
end;

//procedure TFrmHwTest.MakeDeviceMenu(

procedure TFrmHwTest.FormDestroy(Sender: TObject);
var
    i : Integer;
    INI : TInifile;
    FileName : String;
begin
    FileName := GetAppDir('') + 'CONFIG.INI';
    INI := TIniFile.Create(FileName);
    try
        INI.WriteInteger('HARDWARE', 'CANCount', nCANCount);
    finally
        INI.Free;
    end;

    if Assigned(FrmCanDiag) then
    begin
        FrmCanDiag.Timer.Enabled := False;
        FrmCanDiag.Free;
        FrmCanDiag := nil;
    end;

    // CAN MODULE을 소멸한다.
    for i:= 1 to nCANCount do
    begin
        if gFrmCANCom[i] <> nil then
        begin
            gFrmCANCom[i].CANUnit.PauseReadPolling;
            gFrmCANCom[i].CANUnit.PauseSendPolling;

            gFrmCANCom[i].Close;
            gFrmCANCom[i].CANUnit.CloseDevice;
            gFrmCANCom[i].INI.SaveData;
            gFrmCANCom[i].TimerRead.Enabled := False;
            gFrmCANCom[i].OnCANReadEvent := nil;

            gFrmCANCom[i].BtnClearCAN.OnClick(nil);
            gFrmCANCom[i].Free;
            //gFrmCANCom[i] := nil;

            CanBuff[i].Free;
        end;
    end;
end;

procedure TFrmHwTest.TimerReadTimer(Sender: TObject);
var i: Integer;
    Str, ResName, ResParam, RdStr: String;
    ResType : TResType;
    ResourceItem : TResourceItem;
begin
    TimerRead.Enabled := False;

    Str := TabOutput.Tabs[ TabOutput.TabIndex ];
    ResType := FindResType(Str);

    with GridOutput do
    begin
        for i:=1 to RowCount-1 do
        begin
            ResName := Cells[0,i];
            if (ResName <> '') and (Cells[3,i] = 'T') then
            begin
                ResourceItem := CurrProject.GetResource(0, ResName);
                RdStr := ReadResName(ResourceItem, ResParam);
                Cells[2, i] := RdStr;
            end else
                Cells[2, i] := '';
        end;
    end;
    TimerRead.Enabled := True;
end;


procedure TFrmHwTest.FormShow(Sender: TObject);
begin
    TimerRead.Enabled := True;

    DeviceManager.CreateDeviceMenu(MenuDevice);

    TabInputChange(Sender);
    TabOutputChange(Sender);
end;

procedure TFrmHwTest.FormClose(Sender: TObject;
  var Action: TCloseAction);
var Idx : Integer;
begin
    TimerRead.Enabled := False;
end;

procedure TFrmHwTest.DisplayResource(Idx : TResType; Grid : TStringGrid);
var i, nCount: Integer;
    RdStr : String;
    ResName, IOName, ResParam : String;
begin
    nCount := CurrProject.ResList[Idx].Count;

    if nCount > 0 then Grid.RowCount := nCount+1
                  else Grid.RowCount := 2;

    for i:=0 to CurrProject.ResList[Idx].Count-1 do
    begin
        RdStr    := CurrProject.ResList[Idx].Strings[i];
        ResName  := GetToken(RdStr, ';');
        IOName   := GetToken(RdStr, ';');
        ResParam := ValueList.Values[ResName];
         
        Grid.Cells[0,i+1] := ResName;
        Grid.Cells[1,i+1] := IOName;
        Grid.Cells[2,i+1] := ResParam;
    end;
end;


function TFrmHwTest.FindResType(Param : String) : TResType;
var
    Idx : TResType;
begin
    Result := res_None; 
    for Idx := Low(TResType) to High(TResType) do
    begin
        if Param = ResNameTbl[Idx] then begin
            Result := Idx;
            break;
        end;
    end;
end;

procedure TFrmHwTest.ClearGrid(Grid : TStringGrid);
var nCol, nRow : Integer;
begin
    with Grid do
    begin
        for nRow := FixedRows to RowCount-1 do
        for nCol := 0 {FixedCols} to ColCount-1 do
            Cells[nCol, nRow] := '';

        RowCount := 2;
    end;
end;


procedure TFrmHwTest.TabInputChange(Sender: TObject);
var
    Idx : TResType;
    Str : String;
begin
    Str := TabInput.Tabs[ TabInput.TabIndex ];

    ClearGrid(GridInput);

    Idx := FindResType(Str);
    if (Idx <> res_None) then DisplayResource(Idx, GridInput);
end;

procedure TFrmHwTest.TabOutputChange(Sender: TObject);
var
    Idx : TResType;
    Str : String;
begin
    Str := TabOutput.Tabs[ TabOutput.TabIndex ];

    ClearGrid(GridOutput);

    Idx := FindResType(Str);
    if (Idx <> res_None) then DisplayResource(Idx, GridOutput);
end;

procedure TFrmHwTest.GridInputSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    CanSelect := (ACol = 2);
end;

procedure TFrmHwTest.GridInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) and (GridInput.Col = 2) then begin
        Key := 0;
        GridInputDblClick(Sender);
    end;
end;

procedure TFrmHwTest.GridInputDblClick(Sender: TObject);
var
    ResName, ResParam : String;
    nRow, Idx : Integer;
    ResourceItem : TResourceItem;
begin
    nRow := GridInput.Row;
    ResName := GridInput.Cells[0,nRow];

    if ResName = '' then exit;
    ResParam := ValueList.Values[ResName];

    Idx := TabInput.TabIndex;
    case TResType(Idx) of
        res_DO : begin
            if ResParam <> 'ON' then ResParam := 'ON'
                                else ResParam := 'OFF';
        end;
        else begin
            if not FrmInput.Execute(ResParam) then exit;
        end;
    end;

    ResourceItem := CurrProject.GetResource(0, ResName);
    if WriteResName(ResourceItem, ResParam) then
    begin
        GridInput.Cells[2,nRow]   := ResParam;
    end;
end;

procedure TFrmHwTest.BtnShowCANClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
// CAN 관련처리.
procedure TFrmHWTest.AddCanMsg(nPort : Integer; Param : String);
var
    IDStr: String;
begin
    {
    // CAN MODULE 이 있으면 전달.
    for i:= 0 to Application.MainForm.MDIChildCount-1 do begin
        Form := Application.MainForm.MDIChildren[i];

        Str := Format('CAN%d', [nPort]);
        RdStr := Form.Caption;
        Str2  := GetTokenTrim(RdStr, ':');

        // CAN Frame에 Message를 전달한다.
        if (Form.ClassName = 'TFrmCAN') and (Str = Str2) then
            TFrmCAN(Form).AddCanMsg(Param);
    end;
    }

    // Update 버퍼에 값을 넣는다.
    IDStr := GetToken(Param, '=');
    if IDStr <> '' then begin
        CanBuff[nPort].Values[IDStr] := Param;
    end;
end;

procedure TFrmHwTest.MenuResetClick(Sender: TObject);
var i : Integer;
begin
    ResetIO;

    for i:=1 to GridInput.RowCount-1 do
    begin
        GridInput.Cells[2,i] := '';
    end;

    for i:=1 to GridOutput.RowCount-1 do
    begin
        GridOutput.Cells[2,i] := '';
        GridOutput.Cells[3,i] := 'F';
    end;

    for i:= 1 to nCANCount do
    begin
        if gFrmCANCom[i] <> nil then
        begin
            CanBuff[i].Clear;
        end;
    end;
end;

procedure TFrmHwTest.CanMenuClick(Sender: TObject);
var Idx : Integer;
begin
    Idx := (Sender as TMenuItem).Tag;
    gFrmCANCom[Idx].Show;
end;

procedure TFrmHwTest.CanDiagMenuClick(Sender: TObject);
begin
    try
        if Assigned(FrmCanDiag) then
            FrmCanDiag.Show;    
    finally
    end;
end;

procedure TFrmHwTest.NIHardware1Click(Sender: TObject);
begin
    FrmNI_Hardware.ShowModal;
end;

procedure TFrmHwTest.KMIHardware1Click(Sender: TObject);
begin
    FrmHWMain.ShowModal;
end;

procedure TFrmHwTest.BARCODE1Click(Sender: TObject);
begin
    FrmBarcode[1].ShowModal;
end;

procedure TFrmHwTest.WriteEEPROm(sString: String);
var sIdent, sproject, svarient, sIndex, sHWver : String;
    sYear, sMon, sday, sCountHI, sCountLo : String;
    nDay, nYear, nMon : word;
    sSendStr : String;
begin
    //IDENT:04,PROJECT:31,VARIENT:50,INDEX:01,HWVer:08,
    sSendStr := '3D 03 08 00 0C ';

    GetToken(sString, ':');
    sIdent := GetToken(sString, ',');
    GetToken(sString, ':');
    sproject := GetToken(sString, ',');
    GetToken(sString, ':');
    svarient := GetToken(sString, ',');
    GetToken(sString, ':');
    sIndex := GetToken(sString, ',');
    GetToken(sString, ':');
    sHWver := GetToken(sString, ',');

                      // 오늘
    DecodeDate(Now,  nYear, nMon, nDay);
    sYear  := Format('%.2x', [nYear mod 100]);
    sMon := Format('%.2x', [nMon]);
    sDay  := Format('%.2x', [nDay]);
    sCountHI := Format('%.2x', [FrmMain.edtGood.value div 256]);
    sCountLo := Format('%.2x', [FrmMain.edtGood.value mod 256]);

    sSendStr :=  sSendStr + sIdent + ' '+ sYear +' ' + sMon+ ' '+ sDay +' '+ sCountHI+ ' '+  sCountLo + ' ';

    sSendStr :=  sSendStr + sproject+ ' '+ svarient+ ' '+sIndex+ ' '+ sHWver + ' FF FF';

    // 3D 03 08 00 0C ff ff ff ff ff ff ff ff ff ff ff ff ff
    FrmCanDiag.SendDiag(sSendStr);
end;


procedure TFrmHwTest.WriteTrace(sString: String);
var sCOMPID, sPN, sSUP, sLine, sProduct : String;
    sYear, sMon, sday, sCountHI, sCountLo : String;
    nDay, nYear, nMon : word;
    nTemp : Integer;
    sSendStr : String;
    sCount, sCou1, sCou2,sCou3, stestNo : string;
    cCou1, cCou2, cCou3, cTestNo : word;
    arr, arrDay : String;
    cYear, cMon, cDay, cLine : word;
    Ini : TIniFile;
    nTesterNo : Integer;
    nGoodCount : Integer;
begin
    arr := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    arrDay := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';
    //COMPID:42 4C,PN/BC:05 B1 19 BC,SUP:4D,LINE:1,PART:33 31

    sSendStr := '3B B4 ';

    GetToken(sString, ':');
    sCOMPID := GetToken(sString, ',');
    GetToken(sString, ':');
    sPN := GetToken(sString, ',');
    GetToken(sString, ':');
    sSUP := GetToken(sString, ',');
    GetToken(sString, ':');
    sLine := GetToken(sString, ',');
    GetToken(sString, ':');
    sProduct := sString;

                      // 오늘
    DecodeDate(Now,  nYear, nMon, nDay);
    //nTemp := nYear mod 100;
    sYear := arr[nYear mod 100];
    cYear := FrmTable.FindCodeName(sYear);
    sMon  :=   arr[nMon+1];
    cMon  := FrmTable.FindCodeName(sMon);
    sDay  :=  arrDay[nDay];
    cDay  := FrmTable.FindCodeName(sDay);
    //cLine := FrmTable.FindCodeName(sLine);

    nGoodCount := FrmMain.edtGood.value + 1;
    sCount := format('%.3d', [nGoodCount]);
    sCou1  := copy(sCount, 1,1);
    cCou1  := FrmTable.FindCodeName(sCou1);
    sCou2  := copy(sCount, 2,1);
    cCou2  := FrmTable.FindCodeName(sCou2);
    sCou3  := copy(sCount, 3,1);
    cCou3  := FrmTable.FindCodeName(sCou3);

    Ini := TIniFile.Create(GetAppDir('') + 'PLCINFO.ini' );
    try
        nTesterNo   := Ini.ReadInteger('CONFIG', 'TESTER_NO',    1);
        stestNo := IntToStr(nTesterNo);
        cTestNo  := FrmTable.FindCodeName(stestNo);
    finally
        Ini.Free;
    end;


    sSendStr :=  sSendStr + sCOMPID + ' '+ sPN +' ' + sSUP+ ' '+ sProduct+ ' '+
                format('%.2x', [cyear])+ ' '+  format('%.2x', [cMon])
                + ' '+ format('%.2x', [cDay])+ ' '+ format('%.2x', [cTestNo])
                + ' ' + format('%.2x', [cCou1]) + ' ' + format('%.2x', [cCou2])
                + ' ' + format('%.2x', [cCou3]);

    sTraceString := sCOMPID + ' '+ sPN +' ' + sSUP+ ' '+ sProduct+ ' '+
                format('%.2x', [cyear])+ ' '+  format('%.2x', [cMon])
                + ' '+ format('%.2x', [cDay])+ ' '+ format('%.2x', [cTestNo])
                + ' ' + format('%.2x', [cCou1]) + ' ' + format('%.2x', [cCou2])
                + ' ' + format('%.2x', [cCou3]);

    //ShowMessage(sSendStr);
    // 3D 03 08 00 0C ff ff ff ff ff ff ff ff ff ff ff ff ff

    With FrmTable do
    begin
    GMYMD :=     FindASCII(sProduct)
                + FindASCII(format('%.2x', [cyear]))
                + FindASCII(format('%.2x', [cMon]))
                + FindASCII(format('%.2x', [cDay]))
                + FindASCII(format('%.2x', [cTestNo]))
                + FindASCII(format('%.2x', [cCou1]))
                + FindASCII(format('%.2x', [cCou2]))
                + FindASCII(format('%.2x', [cCou3]));
    end;

    FrmCanDiag.SendDiag(sSendStr);

end;

procedure TFrmHwTest.WriteManufacturing(sString: String);
var sCOMPID, sProject, sVariant, sIndex : String;
    sYear, sMon, sday, sCountHI, sCountLo : String;
    nDay, nYear, nMon : word;
    nTemp : Integer;
    sSendStr : String;
    sCount, sCou1, sCou2,sCou3, stestNo : string;
    cCou1, cCou2, cCou3, cTestNo : word;
    arr, arrDay : String;
    nGoodCount : Integer;
    nSetMonth : Integer;
    sLowSerial, sHighSerial : String;
begin
    // sSTring = <WRITE_REQ_MSG> = ex) 2E F1 F0
    arr := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    arrDay := '123456789ABCDEFGHJKLMNPQRSTUVWXYZ';
    //COMPID:42 4C,PN/BC:05 B1 19 BC,SUP:4D,LINE:1,PART:33 31

    //sSendStr := '2E F1 F0 ';
    sSendStr := sString + ' ';
    if sString = '' then sSendStr := '2E F1 F0 ';

    sCOMPID   := FrmEditModel.GetItemByName(gModelCode, 'ManufacID');
    sProject  := FrmEditModel.GetItemByName(gModelCode, 'Project');
    sVariant := FrmEditModel.GetItemByName(gModelCode, 'Variant');
    sIndex    := FrmEditModel.GetItemByName(gModelCode, 'Index');

                      // 오늘
    DecodeDate(Now,  nYear, nMon, nDay);

    nYear :=  nYear - 2010;
    nSetMonth := (nYear shl 4) + nMon ;

    sMon := IntToHex(nSetMonth, 2);
    sday := IntToHex(nDay, 2);

    nGoodCount := FrmMain.edtGood.value + 1;

    sLowSerial := IntToHex(Lo(nGoodCount), 2);
    sHighSerial := IntToHex(Hi(nGoodCount), 2);

    sSendStr :=  sSendStr + sCOMPID + ' '+ sMon +' ' + sday+ ' '+ sHighSerial + ' ' + sLowSerial + ' '
                +  sProject + ' '+ sVariant +' ' + sIndex;

    //2E F1 F0 + sSendStr//
    //ShowMessage(sSendStr);
    FrmCanDiag.SendDiag(sSendStr);

end;

procedure TFrmHwTest.ECUManufacturing();
var
    sSendStr, sDate : String;
    nYear, nMon, nDay : Word;
begin
    sSendStr := '2E F1 8B';
    // 오늘
    DecodeDate(Now,  nYear, nMon, nDay);
    sDate := FormatDateTime('DD MM YY', now);

    sSendStr :=  sSendStr + ' ' + sDate;

    FrmCanDiag.SendDiag(sSendStr);
end;

function TFrmHwTest.TEST(sString: String): String;
var sCOMPID, sPN, sSUP, sLine, sProduct : String;
    sYear, sMon, sday, sCountHI, sCountLo : String;
    nDay, nYear, nMon : word;
    nTemp : Integer;
    sSendStr : String;
    sCount, sCou1, sCou2,sCou3, stestNo : string;
    cCou1, cCou2, cCou3, cTestNo : word;
    arr, arrDay : String;
    cYear, cMon, cDay, cLine : word;
    Ini : TIniFile;
    nTesterNo : Integer;
    nGoodCount : Integer;
begin
     arr := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    arrDay := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';

                      // 오늘
    DecodeDate(Now,  nYear, nMon, nDay);
    //nTemp := nYear mod 100;
    sYear := arr[nYear mod 100];
    cYear := FrmTable.FindCodeName(sYear);
    sMon  :=   arr[nMon+1];
    cMon  := FrmTable.FindCodeName(sMon);
    sDay  :=  arrDay[nDay];
    cDay  := FrmTable.FindCodeName(sDay);
    //cLine := FrmTable.FindCodeName(sLine);

    nGoodCount := FrmMain.edtGood.value + 1;
    sCount := format('%.3d', [nGoodCount]);
    sCou1  := copy(sCount, 1,1);
    cCou1  := FrmTable.FindCodeName(sCou1);
    sCou2  := copy(sCount, 2,1);
    cCou2  := FrmTable.FindCodeName(sCou2);
    sCou3  := copy(sCount, 3,1);
    cCou3  := FrmTable.FindCodeName(sCou3);

    Ini := TIniFile.Create(GetAppDir('') + 'PLCINFO.ini' );
    try
        nTesterNo   := Ini.ReadInteger('CONFIG', 'TESTER_NO',    1);
        stestNo := IntToStr(nTesterNo);
        cTestNo  := FrmTable.FindCodeName(stestNo);
    finally
        Ini.Free;
    end;


    sSendStr :=  sSendStr + sCOMPID + ' '+ sPN +' ' + sSUP+ ' '+ sProduct+ ' '+
                format('%.2x', [cyear])+ ' '+  format('%.2x', [cMon])
                + ' '+ format('%.2x', [cDay])+ ' '+ format('%.2x', [cTestNo])
                + ' ' + format('%.2x', [cCou1]) + ' ' + format('%.2x', [cCou2])
                + ' ' + format('%.2x', [cCou3]);

    sTraceString := sCOMPID + ' '+ sPN +' ' + sSUP+ ' '+ sProduct+ ' '+
                format('%.2x', [cyear])+ ' '+  format('%.2x', [cMon])
                + ' '+ format('%.2x', [cDay])+ ' '+ format('%.2x', [cTestNo])
                + ' ' + format('%.2x', [cCou1]) + ' ' + format('%.2x', [cCou2])
                + ' ' + format('%.2x', [cCou3]);

    //ShowMessage(sSendStr);
    // 3D 03 08 00 0C ff ff ff ff ff ff ff ff ff ff ff ff ff

    With FrmTable do
    begin
    GMYMD :=     FindASCII(sProduct)
                + FindASCII(format('%.2x', [cyear]))
                + FindASCII(format('%.2x', [cMon]))
                + FindASCII(format('%.2x', [cDay]))
                + FindASCII(format('%.2x', [cTestNo]))
                + FindASCII(format('%.2x', [cCou1]))
                + FindASCII(format('%.2x', [cCou2]))
                + FindASCII(format('%.2x', [cCou3]));
    end;

    Result := GMYMD;

end;

function TFrmHwTest.ReturnIONumber(IOName:String; var BDNum, ChNum : Integer):Boolean;
var sParseStr : String;
begin
    Result := True;
    if Pos('DO',IOName) > 0 then  sParseStr := 'DO';
    if Pos('DA',IOName) > 0 then  sParseStr := 'DA';
    if Pos('DI',IOName) > 0 then  sParseStr := 'DI';
    if Pos('AD',IOName) > 0 then  sParseStr := 'AD';
    if Pos('RO',IOName) > 0 then  sParseStr := 'RO';

    GetToKen(IOName, sParseStr);
    BDNum := StrToIntDef(GetToKen(IOName,'_'),0);
    ChNum := StrToIntDef(IOName,0);

    if (BDNum = 0) or (ChNum = 0) then Result := False;

end;


procedure TFrmHwTest.BARCODE21Click(Sender: TObject);
begin
    FrmBarcode[2].ShowModal;
end;

end.

