unit FormSent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AIDC, StdCtrls, ExtCtrls, ZINICtrl, FormDevice;

type
  TFrmSent = class(TFrmDevice)
    Panel1: TPanel;
    EdtListDevice: TEdit;
    CmdOpen: TComboBox;
    BtnListDevice: TButton;
    BtnOpen: TButton;
    BtnClose: TButton;
    BtnRxInit: TButton;
    BtnTxInit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnTx: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BtnRx: TButton;
    Edit17: TEdit;
    Edit18: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit19: TEdit;
    Label13: TLabel;
    Edit20: TEdit;
    Label14: TLabel;
    Edit21: TEdit;
    Label15: TLabel;
    Edit22: TEdit;
    EdtRxLen: ZIniEdit;
    EdtRxCRC: ZIniEdit;
    EdtRxTunit: ZIniEdit;
    EdtRxDiag: ZIniEdit;
    EdtRxSpec: ZIniEdit;
    EdtTxLen: ZIniEdit;
    EdtTxCRC: ZIniEdit;
    EdtTxTunit: ZIniEdit;
    EdtTxDiag: ZIniEdit;
    EdtTxSpec: ZIniEdit;
    EdtSyncLow: ZIniEdit;
    EdtSyncHigh: ZIniEdit;
    EdtTxCh1: ZIniEdit;
    EdtTxCyclic1: ZIniEdit;
    EdtTXData1: ZIniEdit;
    KsentINI: ZIniData;
    Memo1: TMemo;
    EdtTxCh2: ZIniEdit;
    EdtTxCyclic2: ZIniEdit;
    EdtTXData2: ZIniEdit;
    Button1: TButton;
    EdtCRC1: ZIniEdit;
    Label16: TLabel;
    EdtCRC2: ZIniEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnListDeviceClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnTxClick(Sender: TObject);
    procedure BtnTxInitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    bConnect : Boolean;
    { Private declarations }
    function SendTxMess(nChanel : Integer; sData : String) : Integer;
    function SetDegValue(fDeg : Double; var Sent1, Sent2  : String) : Boolean;
    procedure AddLog(Param: String);

  public
    { Public declarations }

    //------------------------------------------------------------
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;

  end;

var
  FrmSent: TFrmSent;

implementation

uses  GenUtils;
{$R *.dfm}

procedure TFrmSent.FormCreate(Sender: TObject);
begin
    KsentINI.LoadData;
    DevOpen('');
end;

procedure TFrmSent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    KsentINI.SaveData;
end;

procedure TFrmSent.BtnListDeviceClick(Sender: TObject);
var nResult : Integer;
begin
    nResult :=  FT_ListDevices;
    AddLog(Format('FT_ListDevices : %d', [nResult]));

    EdtListDevice.Text := IntToStr(nResult);
end;

procedure TFrmSent.BtnOpenClick(Sender: TObject);
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

procedure TFrmSent.BtnCloseClick(Sender: TObject);
var nResult : Integer;
begin
    nResult := FT_Close;
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


function TFrmSent.SendTxMess(nChanel : Integer; sData: String): Integer;
var
    i : integer;
    TxData : Array [0..7] of byte;
    nCyclic  : integer;
    sTemp, sTemp2, sStr : String;
    nLen  : Integer;
    Ret : Integer;
    nCRCTemp, nChecksum : Byte;
begin
    // 1,2,3,4,5,6,7,8
    nChecksum := 0;

    if sData = '' then
        Exit;
    sTemp := sData;
    // SetLength

    // input Data
    sTemp2 := sData;

    // CHECK SUM을 계산한다.
    nCheckSum := 5;
    for i := 0 to 6 do
    begin
        sStr := GetToken(sTemp2, ',');
        TxData[i] := HexToIntDef(sStr, 0) ;
        // Check Sum은 Data nibble 만 계산.
        if (i > 0) then begin
            nCRCTemp := Byte( TxData[i] + (nCheckSum * 16) );
            nChecksum := CRCTable[nCRCTemp];
        end;
    end;
    // CheckSum with an Extra '0' Value
    nCRCTemp := nChecksum * 16;
    nChecksum := CRCTable[nCRCTemp];

    TxData[7] := nChecksum;

    if nChanel = 0 then
        EdtCRC1.text :=  IntToStr(nCheckSum)
    else
        EdtCRC2.text :=  IntToStr(nCheckSum);

    // Send data
    nCyclic := 12825;   // 12825*40ns = 513us.
    Ret := KSENT_TX(nChanel, PChar(@TxData[0]), nCyclic);
    AddLog(format('KSENT_TX%d (%d) : %S',[nChanel, Ret, MakeHexaString(@TxData[0], 8)]));
end;

procedure TFrmSent.AddLog(Param : String);
begin
    if Memo1.Lines.Count > 100 then
       Memo1.Lines.Delete(0);
    Memo1.Lines.Add(Param);
end;

const
    nMaxValue : integer = 4094;
    nTValue   : Integer = 2047;
    nFValue   : Integer = 2;

function TFrmSent.SetDegValue(fDeg: Double; var Sent1, Sent2 : String): Boolean;
var f40Divi, f20Dive : Double;
    f40Value, f20Value : Double;
    f40Result, f20Result : Double;
    s40Value1, s20Value1, s40Value2, s20Value2 : String;
    n40Value, n20Value : Integer;
    sTValue1, sFValue1, sTValue2, sFValue2 : String;
begin
    f40Divi := 102.3;
    f20Dive := 204.6;

    f40Value :=  f40Divi * fDeg;
    if  f40Value >= 0 then
        f40Result :=  nFValue + f40Value
    else
        f40Result :=  nMaxValue + f40Value;

    f20Value  :=  0; //f20Dive * nDeg;  // -> Torsion을 주기위해 20정보는 0도로 고정하고 40정보만 변경한다.
    f20Result :=  nTValue + f20Value;

    n40Value :=  Round(f40Result);
    n20Value :=  Round(f20Result);
    AddLog( Format('Deg %f  =>  40:%d(0x%.3x) 20:%d(0x%.3x)', [fDeg, n40Value, n40Value, n20Value, n20Value]));

    s40Value1 := IntToHex(n40Value, 3);
    s20Value1 := IntToHex(n20Value, 3);

    s40Value2 := IntToHex(4095 - n40Value, 3);
    s20Value2 := IntToHex(4095 - n20Value, 3);

    sFValue1 :=  format('%s,%s,%s',[s40Value1[1], s40Value1[2], s40Value1[3] ]);
    sTValue1 :=  format('%s,%s,%s',[s20Value1[3], s20Value1[2], s20Value1[1] ]);

    sFValue2 :=  format('%s,%s,%s',[s40Value2[1], s40Value2[2], s40Value2[3] ]);
    sTValue2 :=  format('%s,%s,%s',[s20Value2[3], s20Value2[2], s20Value2[1] ]);

    Sent1 := '0,' + sFValue1 +','+ sTvalue1;
    Sent2 := '0,' + sFValue2 +','+ sTvalue2;

    EdtTXData1.Text := Sent1;
    EdtTXData2.Text := Sent2;

    Result := True;
end;

procedure TFrmSent.BtnTxClick(Sender: TObject);
var sTemp : String;
begin
    sTemp := EdtTXData1.Text;
    SendTxMess(0, sTemp);
end;

procedure TFrmSent.BtnTxInitClick(Sender: TObject);
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


procedure TFrmSent.Button1Click(Sender: TObject);
var sTemp : String;
begin
    sTemp := EdtTXData2.Text;
    SendTxMess(1, sTemp);
end;

function TFrmSent.DevClose(Param: String): Integer;
begin
    FT_Close;
end;

function TFrmSent.DevInit(Param: String): Integer;
var nResult : Integer;
begin
    nResult := KSENT_RXInit(
        8,      // Len
        0,      // CRC
        42,     // timeUnit;   42*40ns = 1.68us.    MAS제품사양은 93us/56tick = 1.66us/tick
        0,      // diagComm
        0);     //
    AddLog(format('KSENT_RXInit : %d',[nResult]));

    nResult := KSENT_TXInit(
        42,     // timeUnit;   42*40ns = 1.68us.    MAS제품사양은 93us/56tick = 1.66us/tick
        250,    // SyncLow     250*40ns  = 10us.
        2075,   // SyncHigh    2075*40ns = 83us.  Low(10) + High(83) = 93us
        8,      // Len
        0,      // CRC
        0,      // diagComm
        0);     //
    AddLog(format('KSENT_TXInit : %d',[nResult]));
end;

function TFrmSent.DevOpen(Param: String): Integer;
var nResult : Integer;
begin
    BtnOpenClick(nil);
    DevInit('');
end;

function TFrmSent.DevRead(Param: String): String;
begin
//
end;

function TFrmSent.DevSend(Param: String): Integer;
var Str, sTValue, sFValue : String;
    fDeg : Double;
begin
    Str := GetToken(Param, ':');

    if Param = 'INIT' then
    begin
        DevInit(Param);
    end else begin
        Result := 0;

        if Str = '' then
            Exit;

        if not bConnect then
        begin
            AddLog('Device Not Found');
            Exit;
        end;
        fDeg := StrToFloatDef(Str, 0);
        SetDegValue(fDeg, sTValue, sFValue);

        SendTxMess(0, sTValue);
        Sleep(5);
        SendTxMess(1, sFValue);
        Sleep(10);
        
        AddLog('');
    end;
end;

procedure TFrmSent.FormDestroy(Sender: TObject);
begin
  inherited;
    DevClose('');
end;

end.
