//------------------------------------------------------------------------------
//
//   CAN DIAG MODULE
//
//
//------------------------------------------------------------------------------
unit FormCanDiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, Buttons, ExtCtrls, ComCtrls, uCanUnit, SyncObjs,
  uCanDiag;
const
    POSITIVE_RES =  1;
    NEGATIVE_RES =  0;
    NO_RESPONSE  = -1;

type
  TFrmCanDiag = class(TForm)
    GroupBox1: TGroupBox;
    Edit_TxID: ZIniEdit;
    Edit_RxID: ZIniEdit;
    Label3: TLabel;
    Edit_TxMsg: ZIniEdit;
    Label4: TLabel;
    Edit_RxMsg: ZIniEdit;
    Label1: TLabel;
    Label2: TLabel;
    INI: ZIniData;
    Timer: TTimer;
    GroupBox2: TGroupBox;
    BtnStartDiag: TSpeedButton;
    BtnTesterPresent: TSpeedButton;
    StatusBar: TStatusBar;
    Edit_TxLen: ZIniEdit;
    Edit_RxLen: ZIniEdit;
    Label7: TLabel;
    BtnStopDiag: TSpeedButton;
    BtnSendCommand: TSpeedButton;
    CheckBox_VIewAll: TCheckBox;
    Edit_StartDiag: ZIniEdit;
    Edit_StopDiag: ZIniEdit;
    Edit_Present: ZIniEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo: TMemo;
    BtnSecurity: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Edit_ReadID: ZIniEdit;
    Cb_SendTestPresent: ZIniCheckBox;
    OpenDialog1: TOpenDialog;
    btnTest: TButton;
    Cb_SaveLog: TCheckBox;
    Ed_LogFileName: ZIniEdit;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendCommandClick(Sender: TObject);
    procedure BtnStartDiagClick(Sender: TObject);
    procedure BtnTesterPresentClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnStopDiagClick(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnGmvSecClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_85SecurityClick(Sender: TObject);
    procedure CheckBox_VIewAllClick(Sender: TObject);
    procedure btn_LMFLSecurityClick(Sender: TObject);
    procedure btn_NL1KSecurityClick(Sender: TObject);
    procedure Cb_SendTestPresentClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private


    procedure AddLog(Msg: String);
    { Private declarations }
  public
    { Public declarations }
    bConnected  : Boolean;
    ConnectTime : TDateTime;
    fLastSendTime : Double;

    CanDiag : TCanDiag;
    bTestPresent : Boolean;
    function  StartDiag : Boolean;
    function  StopDiag  : Boolean;
    function  SendDiag(Param : String) : Integer;
    function  SetID(TxID, RxID : Integer) : Boolean;
    function  SeedWrite(): String;
    function  SecurityAccess(nLevel : Integer) : Boolean;
    function  MakeSeedKey(aKey : string): string;
    function TestPreset():Boolean;
  end;

var
  FrmCanDiag: TFrmCanDiag;

implementation

uses
    GenUtils, FormKeyTable, FormHwTest, FormTable, StrUtils;
{$R *.dfm}

{
function TFrmCanDiag.MakeSeedKey(aKey : string): string;
var
    Seed,Seed1, Seed2 : Int64;
    Mask : Int64;
    Key  : Int64;
    Temp : Int64;
    i,j : integer;
    sResult, skey : string;
    nTemp : Int64;
begin
    Result := '';
    Seed := HexToIntDef(aKey, 10);
    AddLog(FloatToStr(Seed));

    for i := 1 to 5 do
    begin
        Temp := 0;
        Temp := Seed;
        Temp := Seed and $80000000;

        if (Temp = 1) then
        begin
            Seed := Seed shl    1;
            Seed := Seed or     $01;
            Seed := Seed +      $22272514;
            Seed := Seed xor    $1D825439;
        end else begin
            Seed := Seed shl    1;
        end;
    end;
    AddLog(FloatToStr(Seed));
    AddLog(IntToHex(Seed,20));
    skey := IntToHex(Seed, 12);

    AddLog(skey);
    skey := COPY(skey, 5, 8);

    AddLog(skey);
    { //앞자리부터
    AddLog(IntToHex(Seed,20));
    skey := IntToHex(Seed, 8);

    AddLog(skey);
    skey := COPY(skey, 0, 8);
    AddLog(skey);
    sResult := '';
    j := 0;
    for i := 0 to Length(skey)-1 do
    begin
        Inc(j);
        sResult := sResult + copy(skey,i+1,1);
        if (j mod 2) = 0 then
            sResult := sResult + ' ';
    end;

    Result := sResult;
end;
}


function TFrmCanDiag.MakeSeedKey(aKey : string): string;
var
    Seed,Seed1, Seed2 : longword;
    Mask : Int64;
    Key  : Int64;
    Temp : Int64;
    i,j : integer;
    sResult, skey : string;
    nTemp : Int64;
begin
    Result := '';
//aKey := '222031FF';
    Seed := HexToIntDef(aKey, 10);
    AddLog('SEED > ' + FloatToStr(Seed));

    for j := 1 to 5 do
    begin
        Temp := 0;
        Temp := Seed;
        Temp := Seed and $80000000;
        AddLog('AND RESULT  > ' + IntToHex(Temp, 20));
//        Temp := Seed and $100000000;
//        if (Temp = 1) then
        if (Temp = 2147483648) then
        begin
            Seed := Seed shl    1;   //OVER FLOW버림
            skey := IntToHex(Seed, 12);
            skey := COPY(skey, 5, 8);
            Seed := HexToIntDef(sKey, 10);

            Seed := Seed or     $01;
            Seed := Seed +      $22272514;
            Seed := Seed xor    $1D825439;
            //Seed := Seed shl    1;
        end else begin
            Seed := Seed shl    1;
        end;
       AddLog('STEP SHL ' + IntToStr(j) + '> ' + IntToHex(Seed,20));
    end;
    //AddLog(FloatToStr(Seed));
    AddLog(IntToHex(Seed,20));
    skey := IntToHex(Seed, 12);
    AddLog(skey);
    skey := COPY(skey, 5, 8);

    AddLog(skey);
    { //앞자리부터
    AddLog(IntToHex(Seed,20));
    skey := IntToHex(Seed, 8);

    AddLog(skey);
    skey := COPY(skey, 0, 8);
}
//  AddLog(skey);
    sResult := '';
    j := 0;
    for i := 0 to Length(skey)-1 do
    begin
        Inc(j);
        sResult := sResult + copy(skey,i+1,1);
        if (j mod 2) = 0 then
            sResult := sResult + ' ';
    end;

    Result := sResult;
end;

function TFrmCanDiag.SecurityAccess(nLevel : Integer) : Boolean;
var
    Seed : array[1..4] of Byte;
    Mask : array[1..4] of Byte;
    Key  : array[1..4] of Byte;
    Temp : Byte;
    i : integer;
    sStr, sRdStr, skey : string;
    nTemp : integer;

    nSeed : integer;
    sTemp, Str, WtStr, sSeedKey, sMaskKey, sSendKey : String;
    Seed1, Seed2, Seed3 : Byte;

begin
    Result := False;

    WtStr := '10 03';// Extended Mode
    if SendDiag(WtStr) <> 1 then exit;
    //------------------------------------------------------------------SEED KEY 요청
    {// Step1) Security Seed를 요청.  Level값이이면 INI에서 읽은Default 값으로 접근.
    if nLevel <= 0 then
        nLevel   := HexToIntDef('1', $01);  // Security Level 3
    }
    WtStr := Format('27 %.2x', [1]);
    if SendDiag(WtStr) <> 1 then EXIT;
    //------------------------------------------------------------------MAKE KEY
    sSeedKey := Format('%.2X%.2X%.2X%.2X', [CanDiag.RxBuff[2], CanDiag.RxBuff[3],CanDiag.RxBuff[4], CanDiag.RxBuff[5]]);
    sSendKey := MakeSeedKey(sSeedKey);
    //------------------------------------------------------------------SEND KEY
    // Step2) Key값을 보낸다.
    WtStr := Format('27 %.2X %s', [2, sSendKey]);
    if SendDiag(WtStr) <> 1 then exit;

    sSeedKey := Format('%.2X %.2X', [CanDiag.RxBuff[2], CanDiag.RxBuff[3]]);
    AddLog('* Security Access Service');
    AddLog(Format('- Seed : %s', [ sSeedKey ]));
    AddLog(Format('- Key  : %s', [ sSendKey ]));
    AddLog('');

    Result := True;
end;

function TFrmCanDiag.StartDiag() : Boolean;
var MsgStr : String;
begin
    Result := False;

    CanDiag.TxID := HexToIntDef(Edit_TxID.Text, 0);
    CanDiag.RxID := HexToIntDef(Edit_RxID.Text, 0);

    if (Visible) then Memo.Lines.Clear;

    if SendDiag(Edit_StartDiag.Text) > 0 then
    begin
//        Timer.Enabled := True;
        bConnected    := True;
//        ConnectTime   := Now;
//        fLastSendTime := GetTickCountEX;
        //Cb_SendTestPresent.Checked := True;
        Result := True;
    end else
    begin
        Timer.Enabled := False;
        bConnected := False;
        Result := False;
    end;
end;

//------------------------------------------------------------------------------
// Request, Response ID변경시 필요.
function TFrmCanDiag.SetID(TxID, RxID : Integer) : Boolean;

begin
    if (TxID < 0) or (RxID < 0) then exit;

    CanDiag.TxID := TxID;
    CanDiag.RxID := RxID;

    Edit_TxID.Text := Format('%x', [TxID]);
    Edit_RxID.Text := Format('%x', [RxID]);

    Result := True;
end;

function TFrmCanDiag.StopDiag() : Boolean;
begin
    Timer.Enabled := False;
    StatusBar.Panels[0].Text := 'DISCONNECT';
    StatusBar.Panels[1].Text := '';
    bConnected := False;

    Result := (SendDiag(Edit_StopDiag.Text) > 0);
end;


procedure TFrmCanDiag.FormCreate(Sender: TObject);
begin
    CanDiag := TCanDiag.Create;
    bTestPresent := False;
    INI.LoadData;

    CanDiag.TxID := HexToIntDef(Edit_TxID.Text, 0);
    CanDiag.RxID := HexToIntDef(Edit_RxID.Text, 0);

end;

procedure TFrmCanDiag.FormDestroy(Sender: TObject);
begin
    CanDiag.Free;
end;




procedure TFrmCanDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    BtnStopDiagClick(Sender);

    INI.SaveData;
end;

procedure TFrmCanDiag.AddLog(Msg : String);
var WtStr : String;
    List  : TStrings;
begin
    IF (Cb_SaveLog.Checked) THEN
        WriteDebugStr(Msg, Ed_LogFileName.Text);
    if (Visible)then      // and (Timer.Tag = 0) 
    begin
        if Memo.Lines.Count > 1000 then Memo.Lines.Delete(0);
        Memo.Lines.Add(Msg);
    end;
end;

//------------------------------------------------------------------------------
function TFrmCanDiag.SendDiag(Param : String) : Integer;
var nRetry : Integer;
begin
    fLastSendTime := GetTickCountEX;

    // 3회 반복하여..
    for nRetry := 1 to 3 do
    begin
        Result := CanDiag.Send(Param);

        if (Visible) then
        begin
            AddLog(CanDiag.FResultStr.Text);
            //Memo.Lines.Append(  );
        end;

        if Result >= 0 then break;
    end;
end;


procedure TFrmCanDiag.BtnSendCommandClick(Sender: TObject);
begin
    SendDiag(Edit_TxMsg.Text);
end;

procedure TFrmCanDiag.BtnStartDiagClick(Sender: TObject);
begin
    BtnStartDiag.Enabled := False;
    StartDiag();
    BtnStartDiag.Enabled := True;
end;

procedure TFrmCanDiag.BtnStopDiagClick(Sender: TObject);
begin
    BtnStopDiag.Enabled := False;
    StopDiag();
    BtnStopDiag.Enabled := True;
end;

procedure TFrmCanDiag.BtnTesterPresentClick(Sender: TObject);
begin
    Timer.Enabled := True;
    bConnected    := True;
    ConnectTime   := Now;
    fLastSendTime := GetTickCountEX;
    Cb_SendTestPresent.Checked := True;
    TestPreset();
end;


procedure TFrmCanDiag.TimerTimer(Sender: TObject);
const
    PRESENT_INTERVAL = 2000;

var fElapseTime : Double;
begin
    Timer.Enabled := False;

    if bConnected then begin
        fElapseTime := GetTickCountEX - fLastSendTime;
        StatusBar.Panels[1].Text := Format('%3.1f / %3.1f', [ fElapseTime / 1000, PRESENT_INTERVAL / 1000 ]);
        if (fElapseTime > PRESENT_INTERVAL) and (Cb_SendTestPresent.Checked) then
        begin
            fLastSendTime := GetTickCountEX();
            TestPreset();
        end;
        StatusBar.Panels[0].Text := 'CONNECTED';
        StatusBar.Panels[2].Text := MakeElapseTimeStr(ConnectTime,  Now);
    end else
        StatusBar.Panels[0].Text := 'DISCONNECT';

    Timer.Enabled := bConnected;
end;

procedure TFrmCanDiag.BtnSecurityClick(Sender: TObject);
begin
    SecurityAccess(1);
end;

procedure TFrmCanDiag.SpeedButton1Click(Sender: TObject);
begin
    Memo.Lines.Clear;
    SendDiag(Edit_ReadID.Text);
end;

procedure TFrmCanDiag.BtnGmvSecClick(Sender: TObject);
var sData,sGetdata : String;
    fGetData, fKey : Double;
    nKey : Integer;
    sSeed, sSeed1, sSeed2, sKey, sTemp, sKey1, sKey2 : String;
begin
    //SendDiag('27 ');
    //SendDiag('27 04 ED CB A9 87');
    SendDiag('27 FB');
    sData :=  FrmCanDiag.CanDiag.GetRxStr(sm_Hex , 1, 5);
    //Edit1.Text := sData;
    GetToken(sdata, ' ');
    GetToken(sdata, ' ');
    sSeed1 := GetToken(sdata, ' ');
    sSeed2 := sData;

    sSeed    := sSeed1 + sSeed2;
    fGetData := HexToIntDef(sSeed, 0);
    fKey     := (fGetData/ 20) + 3;
    nKey     := Trunc(fKey);

    sTemp  := IntToHex(nKey, 4);
    //Edit2.Text := sTemp;
    sKey1 := Copy(sTemp, 1,2);
    sKey2 := Copy(sTemp, 3,2);
    sKey  := sKey1 + ' ' + sKey2;
    //Edit3.Text := skey;
    Delay(50, True);
    SendDiag('27 FC ' + skey );
end;

procedure TFrmCanDiag.SpeedButton2Click(Sender: TObject);
begin
    FrmKeyTable.show;
end;


{
function TFrmCanDiag.HexToInt(Data : String): String;'
var
    i, j : integer;
begin
    i := Length(Data);
    if j:=0 to 15 do
    begin
        if i = j then
            Copy(sTemp, 1, 2);
    end;

    FrmTable.FindCodeName()

end;   }


    {if rdHexbtn.Checked then
    begin
        nValue := HexToIntDef(EdtSeed2.text, 0);

        nMod  :=  nValue mod 6;
        nDiv  :=  nValue div 6;

        sTemp := IntToHex(nValue, 4);
    end else
    begin
        nValue := StrToIntDef(EdtSeed.text, 0);

        nMod  :=  nValue mod 6;
        nDiv  :=  nValue div 6;

        sTemp := IntToHex(nValue, 4);
    end;

    {

   }

procedure TFrmCanDiag.btnTestClick(Sender: TObject);
begin
    MakeSeedKey('')

end;

function TFrmCanDiag.SeedWrite: String;
var i, nValue, nMod, nDiv : integer;
    sStr, sSeed1, sSeed2, sTemp  : String;
begin
    for i := 0 to 10 do
    begin
        nValue := Random(65532);
        if nValue <> 0 then
            Break;
    end;

    nMod  :=  nValue mod 8;
    nDiv  :=  nValue div 8;

    sTemp := IntToHex(nValue, 4);

    sSeed1 := Copy(sTemp, 1, 2);
    sSeed2 := Copy(sTemp, 3, 2);

    sStr := FrmKeyTable.Grid_KEY.Cells[ nMod+ 1, nDiv + 1];

    //Write Seed Data
    SendDiag('3B 6B ' + sSeed1 + ' ' + sSeed2 + ' ' +sStr);

    Result := sSeed1 + ' ' + sSeed2 + ' ' +sStr;

end;


procedure TFrmCanDiag.FormShow(Sender: TObject);
begin
    {if rdDecbtn.Checked then
    begin
        rdHexbtn.Checked := False;
        EdtSeed2.Enabled := False;
        rdDecbtn.Checked := True;
        EdtSeed.Enabled := True;
    end
    else if rdHexbtn.Checked then
    begin
        rdDecbtn.Checked := False;
        EdtSeed.Enabled := False;
        rdHexbtn.Checked := True;
        EdtSeed2.Enabled := True;
    end;
    }
end;
            
procedure TFrmCanDiag.btn_85SecurityClick(Sender: TObject);
var  i : Integer;
     Cal, Seed, Key : array[0..3] of Byte;
     Str : String;
begin
    // 27 01
    // 67 01 XX XX XX XX
    for i := 0 to 2 do
    begin
        if SendDiag('27 01') <> 1 then Continue; // END 해서 SEED 받기

        Seed[3] := FrmCanDiag.CanDiag.RxBuff[2];
        Seed[2] := FrmCanDiag.CanDiag.RxBuff[3];
        Seed[1] := FrmCanDiag.CanDiag.RxBuff[4];
        Seed[0] := FrmCanDiag.CanDiag.RxBuff[5];

        Cal[0] := Seed[3] xor $C1;
        Cal[1] := Seed[2] xor $1C;
        Cal[2] := Seed[1] xor $12;
        Cal[3] := Seed[0] xor $81;

        Key[3] := ((Cal[3] and $0F) shl 4) or ((cal[3] and $F0)      );
        Key[2] := ((Cal[1] and $0F) shl 4) or ((cal[0] and $F0) shr 4);
        Key[1] := ((Cal[1] and $F0)      ) or ((cal[2] and $F0) shr 4);
        Key[0] := ((Cal[0] and $0F) shl 4) or ((cal[2] and $0F)      );

        Str := Format('27 02 %.2x %.2x %.2x %.2x', [Key[3], Key[2], Key[1], Key[0] ]);

        if SendDiag(Str) <> 1 then
            Continue // END 해서 SEED 받기
        else
            break;

    end;
end;

procedure TFrmCanDiag.CheckBox_VIewAllClick(Sender: TObject);
begin
    CanDiag.bViewAllMsg := CheckBox_VIewAll.Checked;

end;

procedure TFrmCanDiag.btn_LMFLSecurityClick(Sender: TObject);
begin
    SendDiag('27 01');
    SendDiag('27 02 00 B8');
end;

procedure TFrmCanDiag.btn_NL1KSecurityClick(Sender: TObject);
var  i : Integer;
     Cal, Seed, Key : array[0..3] of Byte;
     Str : String;
begin
    // 27 01
    // 67 01 XX XX XX XX
    for i := 0 to 2 do
    begin
        //if
        SendDiag('10 90');// <> 1 then Continue;

        if SendDiag('27 01') <> 1 then Continue; // END 해서 SEED 받기

        Seed[3] := FrmCanDiag.CanDiag.RxBuff[2];
        Seed[2] := FrmCanDiag.CanDiag.RxBuff[3];
        Seed[1] := FrmCanDiag.CanDiag.RxBuff[4];
        Seed[0] := FrmCanDiag.CanDiag.RxBuff[5];

        Cal[0] := Seed[3] xor $E9;
        Cal[1] := Seed[2] xor $4A;
        Cal[2] := Seed[1] xor $22;
        Cal[3] := Seed[0] xor $91;

        Key[3] := ((Cal[3] and $0F) shl 4) or ((cal[3] and $F0)      );
        Key[2] := ((Cal[1] and $0F) shl 4) or ((cal[0] and $F0) shr 4);
        Key[1] := ((Cal[1] and $F0)      ) or ((cal[2] and $F0) shr 4);
        Key[0] := ((Cal[0] and $0F) shl 4) or ((cal[2] and $0F)      );

        Str := Format('27 02 %.2x %.2x %.2x %.2x', [Key[3], Key[2], Key[1], Key[0] ]);

        if SendDiag(Str) <> 1 then
            Continue // END 해서 SEED 받기
        else
            break;

    end;
end;

function TFrmCanDiag.TestPreset: Boolean;
var nRetry : Integer;
    SendStr : String;
begin
   // if not Cb_ViewTestPresent.Checked then Timer.Tag := 1;
   Timer.Tag := 1;

    SendStr := Trim(Edit_Present.Text);
    if SendStr <> '' then
    begin
        // 통신 에러에 대비하여 2번 시도한다.
//        for nRetry := 1 to 2 do begin
//            bConnected := ( >= 0);
        CanDiag.SendPRESENT(SendStr);

        AddLog(CanDiag.FResultStr.Text);
        //Memo.Lines.Append( CanDiag.FResultStr.Text );
//            if bConnected then break;
//        end;

        {// 응답이 안된경우.
        if not bConnected then begin
            StatusBar.Panels[0].Text := 'DISCONNECT';

            Timer.Enabled := False;
        end; }
        //Cb_SendTestPresent.Checked := False;
    end;
    Timer.Tag := 0;

end;

procedure TFrmCanDiag.Cb_SendTestPresentClick(Sender: TObject);
begin
    if (not Cb_SendTestPresent.Checked) then
    begin
        Timer.Enabled := False;
        bConnected    := False;
        Cb_SendTestPresent.Checked := False;
    end;
end;

procedure TFrmCanDiag.Button1Click(Sender: TObject);
begin
    if SaveDialog1.Execute then begin
        Ed_LogFileName.Text := SaveDialog1.FileName;
    end;
end;

end.


