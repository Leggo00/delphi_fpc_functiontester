unit FormKMISent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ZINICtrl, FormDevice, ComCtrls, Spin,
  Buttons, DPBLabel, ComDrv32, uKMIComm;

type
  TFrmKMISent = class(TFrmDevice)
    Panel1: TPanel;
    Panel2: TPanel;
    dpbLabel1: TdpbLabel;
    BtnConnect: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit_Comport: ZIniSpinEdit;
    Label9: TLabel;
    Memo: TMemo;
    StatusBar: TStatusBar;
    EdtSendData: ZIniEdit;
    Label1: TLabel;
    BtnSenddata: TButton;
    INI: ZIniData;
    BtnSentEn: TButton;
    Button2: TButton;
    EdtDeg: ZIniEdit;
    Label2: TLabel;
    BtnSetDeg: TButton;
    Label3: TLabel;
    Button3: TButton;
    EdtCycle1: ZIniEdit;
    Label4: TLabel;
    EdtCycle2: ZIniEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure BtnListDeviceClick(Sender: TObject);
//    procedure BtnOpenClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
//    procedure BtnTxClick(Sender: TObject);
    procedure BtnTxInitClick(Sender: TObject);
//    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnSetDegClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnSentEnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    bConnect : Boolean;

    Comm : TCommPortDriver;


    { Private declarations }
    function SendTxMess(nChanel : Integer; sData : String) : Integer;
    function SetDegValue(fDeg : Double; var Sent1, Sent2  : String) : Boolean;
    function SetDataValue(s20V1, s40V1, s20V2, s40V2 : String; var Sent1, Sent2 : String): Boolean;
    procedure AddLog(Param: String);

  public
    { Public declarations }
    KMISentComm  : TKMIComm;

    //------------------------------------------------------------
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;

  end;

var
  FrmKMISent: TFrmKMISent;

implementation

uses  GenUtils;
{$R *.dfm}

procedure TFrmKMISent.FormCreate(Sender: TObject);
begin
    KMISentComm := TKMIComm.Create;
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmKMISent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //KsentINI.SaveData;
    INI.SaveData;
end;

{procedure TFrmKMISent.BtnListDeviceClick(Sender: TObject);
var nResult : Integer;
begin
    nResult :=  FT_ListDevices;
    AddLog(Format('FT_ListDevices : %d', [nResult]));

    EdtListDevice.Text := IntToStr(nResult);
end;

{procedure TFrmKMISent.BtnOpenClick(Sender: TObject);
var nResult : Integer;
    nHigh, nLow : Byte;
    sSwString : Byte;
begin
    if FT_Open = 0 then
        bConnect := True
    else
        bConnect := False;

    nResult := KDLL_Info(nHigh, nLow);
    AddLog(Format('Result : %d, DLL Version %d.%d', [nResult, nHigh, nLow]));

    //nResult := KAISoftware_String(sSwString);
    //Memo1.Lines.Add(Format('Result : %d, HW Version %d', [nResult, sSwString]));
end;
}
procedure TFrmKMISent.BtnCloseClick(Sender: TObject);
var nResult : Integer;
begin
  //  nResult := FT_Close;
    AddLog(Format('FT_Close : %d', [nResult]));
end;

Const
    CRCTable : Array [0..255] of integer =
               (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,    // 16
                13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2,   // 32
                7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8,   // 48
                10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5,   // 64
                14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1,   // 80
                3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12,   // 96
                9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6,   // 112
                4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11,   // 128
                1,0,3,2,5,4,7,6,9,8,11,10,13,12,15,14,   // 144
                12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3,   // 160
                6,7,4,5,2,3,0,1,14,15,12,13,10,11,8,9,   // 176
                11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4,   // 192
                15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,   // 208
                2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13,   // 224
                8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7,   // 240
                5,4,7,6,1,0,3,2,13,12,15,14,9,8,11,10) ;  // 256


function TFrmKMISent.SendTxMess(nChanel : Integer; sData: String): Integer;
var
    i : integer;
    TxData : Array [0..8] of byte;
    nCyclic  : integer;
    sTemp, sTemp2, sStr : String;
    nLen  : Integer;
    Ret : Boolean;
    nCRCTemp, nChecksum : Byte;
begin

    // 1,2,3,4,5,6,7,8,9
    nChecksum := 0;

    if sData = '' then
        Exit;
    sTemp := sData;
    // SetLength

    // input Data
    sTemp2 := sData;

    // CHECK SUM을 계산한다.
    nCheckSum := 5;

    TxData[0] := nChanel;

    for i := 1 to 7 do
    begin
        sStr := GetToken(sTemp2, ',');
        TxData[i] := HexToIntDef(sStr, 0) ;

        // Check Sum은 Data nibble 만 계산.
        if (i > 1) then begin
            nCRCTemp := Byte( TxData[i] + (nCheckSum * 16) );
            nChecksum := CRCTable[nCRCTemp];
        end;
    end;
    // CheckSum with an Extra '0' Value
    nCRCTemp := nChecksum * 16;

    nChecksum := CRCTable[nCRCTemp];

    TxData[8] := nChecksum;

    Ret := KMISentComm.CommSend($12, TxData);
    //AddLog('> ' + format('KMISENT_TX %d : %S',[nChanel,  MakeHexaString(@TxData[0], 11)]));
    AddLog('TX> ' + MakeHexaString(@KMISentComm.TxBuff[0], KMISentComm.TxLen));
    AddLog('RX> ' + MakeHexaString(@KMISentComm.RxBuff[0], KMISentComm.RxLen));
    AddLog('');
end;

procedure TFrmKMISent.AddLog(Param : String);
begin
    with Memo.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

const
    nMaxValue : integer = 4094;
    nTValue   : Integer = 2047;
    nFValue   : Integer = 2;

function TFrmKMISent.SetDegValue(fDeg: Double; var Sent1, Sent2 : String): Boolean;
var f40Divi, f20Dive : Double;
    f40Value, f20Value, f40Value2,  f20Value2: Double;
    f40Result, f20Result, f40Result2, f20Result2 : Double;
    s40Value1, s20Value1, s40Value2, s20Value2 : String;
    n40Value, n20Value, n40Value2, n20Value2 : Integer;
    sTValue1, sFValue1, sTValue2, sFValue2 : String;
begin
    f40Divi := 102.3;
    f20Dive := 204.6;
    //--------------------------------------------------------------------------
    f40Value :=  (f40Divi * fDeg) + 2047;
    f40Result :=  f40Value;

    f20Value  :=  0 ; //f20Dive * nDeg;  // -> Torsion을 주기위해 20정보는 0도로 고정하고 40정보만 변경한다.
    f20Result :=  nTValue - f20Value;

    n40Value :=  Trunc(f40Result) ;
    n20Value :=  Trunc(f20Result);
    AddLog( Format('Deg %f  =>  40:%d(0x%.3x) 20:%d(0x%.3x)', [fDeg, n40Value, n40Value, n20Value, n20Value]));

    s40Value1 := IntToHex(n40Value, 3);
    s20Value1 := IntToHex(n20Value, 3);
    //--------------------------------------------------------------------------

    f40Value2 :=  2047 - (f40Divi * fDeg);
    f40Result2 :=  f40Value2; //nFValue + f40Value;

    f20Value2  :=  0  ; //f20Dive * nDeg;  // -> Torsion을 주기위해 20정보는 0도로 고정하고 40정보만 변경한다.
    f20Result2 :=  nTValue - f20Value2;

    n40Value2 :=  Trunc(f40Result2) ;
    n20Value2 :=  Trunc(f20Result2);
   // AddLog( Format('Deg %f  =>  40:%d(0x%.3x) 20:%d(0x%.3x)', [fDeg, n40Value, n40Value, n20Value, n20Value]));

    s40Value2 := IntToHex(n40Value2, 3);
    s20Value2 := IntToHex(n20Value2, 3);
    //--------------------------------------------------------------------------

  //  s40Value2 := IntToHex(4095 - n40Value, 3);
  //  s20Value2 := IntToHex(4095 - n20Value, 3);

    sFValue1 :=  format('%s,%s,%s',[s40Value1[1], s40Value1[2], s40Value1[3] ]);
    sTValue1 :=  format('%s,%s,%s',[s20Value1[3], s20Value1[2], s20Value1[1] ]);

    sFValue2 :=  format('%s,%s,%s',[s40Value2[1], s40Value2[2], s40Value2[3] ]);
    sTValue2 :=  format('%s,%s,%s',[s20Value2[3], s20Value2[2], s20Value2[1] ]);

    Sent1 := '0,' + sFValue1 +','+ sTvalue1;
    Sent2 := '0,' + sFValue2 +','+ sTvalue2;

   // EdtTXData1.Text := Sent1;
   // EdtTXData2.Text := Sent2;

    Result := True;
end;


procedure TFrmKMISent.BtnTxInitClick(Sender: TObject);
var nLen, nCRC,nDiag, nSpec, nCyc : Byte;
    nTUnit, nSLow, nSHigh : Word;
    nResult : Integer;
begin
    DevInit('')

  //  FT_ResetDevice();
{
    nLen    := StrToIntDef(EdtTxLen.Text, 0);
    nCRC    := StrToIntDef(EdtTxCRC.Text, 0);
    nTUnit  := StrToIntDef(EdtTxTunit.Text, 0);
    nDiag   := StrToIntDef(EdtTxDiag.Text, 0);
    nSpec   := StrToIntDef(EdtTxSpec.Text, 0);
    nSLow   := StrToIntDef(EdtSyncLow.Text, 0);
    nSHigh  := StrToIntDef(EdtSyncHigh.Text, 0);

//     KSENT_TXInit(nTUnit, nSLow, nSHigh, nLen, nCRC, nDiag, nSpec);
    nResult := KSENT_TXInit(43, 250, 2075, 8, 1, 0, 0);
    AddLog(format('KSENT_TXInit : %d',[nResult]));
}
end;


function TFrmKMISent.DevClose(Param: String): Integer;
begin
    KMISentComm.CommClose;
    StatusBar.Panels[0].Text := 'DISCONNECT';
end;

function TFrmKMISent.DevInit(Param: String): Integer;
var nResult : Integer;
    TxData : Array of byte;
begin
    SetLength(TxData, 1);

    TxData[0] := 0;
    KMISentComm.CommSend($03, TxData);

    SetLength(TxData, 0);
end;

function TFrmKMISent.DevOpen(Param: String): Integer;
var nResult : Integer;
begin
    if KMISentComm.CommOpen(Edit_Comport.Value) then
    begin
        StatusBar.Panels[0].Text := 'CONNECTED';
        bConnect := True;

        BtnSetDegClick(self);
        BtnSentEnClick(self);
    end else
    begin
        StatusBar.Panels[0].Text := 'DISCONNECT';
        bConnect := False;
    end;
end;

function TFrmKMISent.DevRead(Param: String): String;
begin
//
end;

function TFrmKMISent.DevSend(Param: String): Integer;
var Str, sTValue, sFValue : String;
    fDeg : Double;
    s20V1, s40V1, s20V2, s40V2 : String;
    sStart, sEnd : string;
    bUpDn, bAllSend : Boolean;
    nDelay, nCount, i : integer;
    fValue : Double;
begin
    Str := GetToken(Param, ':');

    Result := 0;

    if Str = '' then
        Exit;

    if not bConnect then
    begin
        DevOpen('');
    end;

    if Pos('ENABLE', Str) > 0 then
    begin
        BtnSentEnClick(Self);
        Exit;
    end;

    if Pos('INT', Str) > 0 then
    begin
        Button1Click(Self);
        Exit;
    end;

    if Pos('DATA', Str) > 0 then
    begin

        s20V1 := GetToken(Param, ',');
        s40V1 := GetToken(Param, ',');
        s20V2 := GetToken(Param, ',');
        s40V2 := Param;

        SetDataValue(s20V1, s40V1, s20V2, s40V2, sTValue, sFValue);

    end else
    begin
        fDeg := StrToFloatDef(Str, 0);
        SetDegValue(fDeg, sTValue, sFValue);
    end;

    if Pos('SWEEP', Str) > 0  then
    begin
        // Option -> START,END,Up or Down,Delay(s)
        sStart := GetToKen(Param,',');
        sEnd   := GetToKen(Param,',');
        Str    := GetToKen(Param,',');
        bUpDn  := (Str = 'UP') or (Str = 'U');
        nDelay := Round(StrToFloatDef(GetToKen(Param,','),1)*1000);
        nCount := StrToIntDef(GetToKen(Param,','), 4);
        fDeg   := StrToFloat(sStart);

        if (sEnd = '0') then
        begin
            fValue := (StrToFloat(sStart)) / nCount;
            if bUpDn then
                fValue := -fValue;
        end else
        begin
            fValue := (StrToFloat(sEnd)) / nCount;
            if not bUpDn then
                fValue := -fValue;
        end;

        bAllSend := False;

        if bUpDn then  // 상승일경우
        begin
            for i := 1 to nCount do
            begin
                fDeg := fDeg + fValue;
                SetDegValue(fDeg, sTValue, sFValue);

                SendTxMess(0, sTValue);
                SendTxMess(1, sFValue);
                Sleep(10);

                bAllSend := (i = nCount);

                if bAllSend then Exit;//break;

                DelayEx(nDelay,True);
            end;
        end else
        begin    // 하강일경우
            for i := 1 to nCount do
            begin
                fDeg := fDeg - fValue;
                SetDegValue(fDeg, sTValue, sFValue);

                SendTxMess(0, sTValue);
                SendTxMess(1, sFValue);
                Sleep(10);

                bAllSend := (i = nCount);

                if bAllSend then Exit;//break;

                DelayEx(nDelay,True);
            end;
        end;
        Exit;
    end;

    SendTxMess(0, sTValue);
    Sleep(100);
    SendTxMess(1, sFValue);


end;

procedure TFrmKMISent.FormDestroy(Sender: TObject);
begin
  inherited;
   DevClose('');
   KMISentComm.Free;
end;

procedure TFrmKMISent.Button3Click(Sender: TObject);
begin
  inherited;
    DevInit('');
end;

procedure TFrmKMISent.BtnConnectClick(Sender: TObject);
begin
  inherited;
    DevOpen('');
end;

procedure TFrmKMISent.BtnSetDegClick(Sender: TObject);
var fDeg : Double;
    sTValue, sFValue : String;
begin

  inherited;

    fDeg := StrToFloatDef(EdtDeg.Text, 0);
    SetDegValue(fDeg, sTValue, sFValue);

    SendTxMess(0, sTValue);
    SendTxMess(1, sFValue);
    Sleep(10);

//    BtnSentEnClick(Self);
end;

procedure TFrmKMISent.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    DevClose('');
end;

procedure TFrmKMISent.BtnSentEnClick(Sender: TObject);
var    TxData : Array of byte;
begin
    inherited;
    SetLength(TxData, 1);

    TxData[0] := 3;
    KMISentComm.CommSend($10, TxData);

    AddLog('TX> ' + MakeHexaString(@KMISentComm.TxBuff[0], KMISentComm.TxLen));
    AddLog('RX> ' + MakeHexaString(@KMISentComm.RxBuff[0], KMISentComm.RxLen));
    AddLog('');
end;

procedure TFrmKMISent.Button1Click(Sender: TObject);
var    TxData : Array of byte;
begin
    inherited;

    SetLength(TxData, 5);
    //00 64  06  03  E8
    TxData[0] := 0;
    TxData[1] := 53;
    TxData[2] := 6;
    TxData[3] := 2;
    TxData[4] := 1;

    KMISentComm.CommSend($11, TxData);

    AddLog('> ' + 'KMISENT_RX ' + MakeHexaString(@KMISentComm.TxBuff[0], KMISentComm.TxLen));
    AddLog('< ' + 'KMISENT_RX ' + MakeHexaString(@KMISentComm.RxBuff[0], KMISentComm.RxLen));

end;

function TFrmKMISent.SetDataValue(s20V1, s40V1, s20V2, s40V2: String; var Sent1, Sent2 : String): Boolean;
var f40Divi, f20Dive : Double;
    f40Value, f20Value, f40Value2,  f20Value2: Double;
    f40Result, f20Result, f40Result2, f20Result2 : Double;
    s40Value1, s20Value1, s40Value2, s20Value2 : String;
    n40Value, n20Value, n40Value2, n20Value2 : Integer;
    sTValue1, sFValue1, sTValue2, sFValue2 : String;
begin

    n20Value :=  StrToIntDef(s20V1, 0) ;
    n40Value :=  StrToIntDef(s40V1, 0) ;

    s40Value1 := IntToHex(n40Value, 3);
    s20Value1 := IntToHex(n20Value, 3);
    //--------------------------------------------------------------------------

    n40Value2 :=  StrToIntDef(s40V2, 0) ;
    n20Value2 :=  StrToIntDef(s20V2, 0) ;

    s40Value2 := IntToHex(n40Value2, 3);
    s20Value2 := IntToHex(n20Value2, 3);
    //--------------------------------------------------------------------------

    sFValue1 :=  format('%s,%s,%s',[s40Value1[1], s40Value1[2], s40Value1[3] ]);
    sTValue1 :=  format('%s,%s,%s',[s20Value1[3], s20Value1[2], s20Value1[1] ]);

    sFValue2 :=  format('%s,%s,%s',[s40Value2[1], s40Value2[2], s40Value2[3] ]);
    sTValue2 :=  format('%s,%s,%s',[s20Value2[3], s20Value2[2], s20Value2[1] ]);

    Sent1 := '0,' + sFValue1 +','+ sTvalue1;
    Sent2 := '0,' + sFValue2 +','+ sTvalue2;

    Result := True;

end;

end.
