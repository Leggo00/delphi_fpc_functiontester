unit FormHeight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, XiButton, ExtCtrls, XiPanel, ComDrv32,
  ComCtrls, DPBLabel, FormMain;

type
  TFrmHeight = class(TForm)
    CommHeight: TCommPortDriver;
    XiPanel1: TXiPanel;
    Label1: TLabel;
    BtnConnect: TXiButton;
    BtnDisConnect: TXiButton;
    Ed_PortConfig: ZIniEdit;
    EdtSendData: ZIniEdit;
    XiButton1: TXiButton;
    HeightINI: ZIniData;
    ComMemo: TMemo;
    StatusBar: TStatusBar;
    LabValue1: TdpbLabel;
    LabValue2: TdpbLabel;
    LabValue3: TdpbLabel;
    LabValue4: TdpbLabel;
    LabValue5: TdpbLabel;
    XiPanel6: TXiPanel;
    XiPanel2: TXiPanel;
    XiPanel3: TXiPanel;
    XiPanel4: TXiPanel;
    XiPanel5: TXiPanel;
    BtnGetValue: TXiButton;
    XiButton2: TXiButton;
    btnTrigger: TXiButton;
    edtTrigger: ZIniEdit;
    EditRead: TEdit;
    btnMemoClear: TXiButton;
    XiButton3: TXiButton;
    edtZero: ZIniEdit;
    EdtJIGZero1: ZIniEdit;
    EdtJIGZero2: ZIniEdit;
    EdtJIGZero3: ZIniEdit;
    EdtJIGZero4: ZIniEdit;
    EdtJIGZero5: ZIniEdit;
    btnJigMaster: TXiButton;
    LbJIGResult1: TdpbLabel;
    LbJIGResult2: TdpbLabel;
    LbJIGResult3: TdpbLabel;
    LbJIGResult4: TdpbLabel;
    LbJIGResult5: TdpbLabel;
    XiPanel12: TXiPanel;
    XiPanel13: TXiPanel;
    XiPanel14: TXiPanel;
    XiPanel15: TXiPanel;
    XiPanel16: TXiPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    btnProductCompare: TXiButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LbResult1: TdpbLabel;
    LbResult2: TdpbLabel;
    LbResult3: TdpbLabel;
    LbResult4: TdpbLabel;
    LbResult5: TdpbLabel;
    Label9: TLabel;
    XiPanel7: TXiPanel;
    XiPanel8: TXiPanel;
    XiPanel9: TXiPanel;
    XiPanel10: TXiPanel;
    XiPanel11: TXiPanel;
    btnResult: TXiButton;
    EdtZero1: ZIniEdit;
    EdtZero2: ZIniEdit;
    EdtZero3: ZIniEdit;
    EdtZero4: ZIniEdit;
    EdtZero5: ZIniEdit;
    BtnMaster: TXiButton;
    Label7: TLabel;
    Label11: TLabel;
    EdtZero2_1: ZIniEdit;
    EdtZero2_2: ZIniEdit;
    EdtZero2_3: ZIniEdit;
    EdtZero2_4: ZIniEdit;
    EdtZero2_5: ZIniEdit;
    XiButton4: TXiButton;
    procedure XiButton1Click(Sender: TObject);
    procedure CommHeightReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure BtnGetValueClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure XiButton2Click(Sender: TObject);
    procedure BtnMasterClick(Sender: TObject);
    procedure btnResultValueClick(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
    procedure btnTriggerClick(Sender: TObject);
    procedure btnMemoClearClick(Sender: TObject);
    procedure XiButton3Click(Sender: TObject);
    procedure btnJigMasterClick(Sender: TObject);
    procedure btnProductCompareClick(Sender: TObject);
    procedure XiButton4Click(Sender: TObject);
  private
    { Private declarations }
    RxStr  : String;
    gsString : String;

    function DisConnect(): Boolean;
    procedure Addlog(sParam: String);

    procedure SaveLog( WtStr : string);
  public
    { Public declarations }
    bReceive : Boolean;
    function Connect(Param : String) : Boolean;

    function GetHeight(nIndex: integer=0) : Boolean;
    function SetResultValue(nPLCMODEL : integer) : String;
    function SetJIGResultValue() : String;


    procedure DisplayValue(sValue: String);
    procedure SetZeroHeight(sStr : String);
//    procedure ParsingValue(sData : string);
  end;

var
  FrmHeight: TFrmHeight;

implementation

uses
    GenUtils, FormMelsecQ;

{$R *.dfm}

procedure TFrmHeight.Addlog(sParam: String);
begin
    if not Visible then exit;

    with ComMemo.Lines do
    begin
        if Count  < 99 then
            Add(sParam)
        else
        begin
            Delete(0);
            Add(sParam);
        end;
    end;
end;

function TFrmHeight.Connect(Param : String) : Boolean;
var Str : String;

begin
    DisConnect;

    // 통신포트 설정부분.
    // Param = COM1-9600-8-N-1
    with CommHeight do
    begin
        // 통신포트 설정부분.
        // Param = COM1-9600
        Param := UpperCase(Param);
        Str := GetToken(Param, '-');
        GetToken(Str, 'COM');

       // // SET COMPORT
       // Str := GetToken(Param, '-');
        Comport      := StrToIntDef( GetToken(Str, '-') , 1);

        // SET PORTSPEED
        ComPortSpeed := StrToIntDef( GetToken(Param, '-'), 9600);

        // SET DATABITS
        Str := GetToken(Param, '-');
        if Str = '5' then ComPortDataBits := db5BITS else
        if Str = '6' then ComPortDataBits := db6BITS else
        if Str = '7' then ComPortDataBits := db7BITS else
                          ComPortDataBits := db8BITS;

        // SET PARITY
        Str := GetToken(Param, '-');
        if Str = 'EVEN'  then ComPortParity := ptEVEN  else
        if Str = 'ODD'   then ComPortParity := ptODD   else
        if Str = 'MARK'  then ComPortParity := ptMARK  else
        if Str = 'SPACE' then ComPortParity := ptSPACE else
                              ComPortParity := ptNONE;

        // SET STOPBITS
        Str := GetToken(Param, '-');
        if Str = '2'   then ComPortStopBits := sb2BITS     else
        if Str = '1.5' then ComPortStopBits := sb1HALFBITS else
                            ComPortStopBits := sb1BITS;

        // SET STOPBITS
        Str := GetToken(Param, '-');
        if Str = 'XON/XOFF'   then ComPortSwHandshaking := shXONXOFF else
                                   ComPortSwHandshaking := shNONE;

    end;
    CommHeight.Connect;

    CommHeight.ToggleRTS(True);
    if CommHeight.Connected then
        StatusBar.Panels[0].Text := Format('COM%d CONNECTED', [CommHeight.ComPort])
    else
        ;//MessageBox(Format('바코드 통신포트(COM%d)를 OPEN할 수 없습니다.', [CommHeight.ComPort]), '에러', MB_OK or MB_ICONERROR);
end;
function TFrmHeight.DisConnect: Boolean;
begin
    CommHeight.Disconnect;
    StatusBar.Panels[0].Text := 'DISCONNECT';

end;

procedure TFrmHeight.XiButton1Click(Sender: TObject);
begin
    CommHeight.SendString(EdtSendData.text + CRLF);
end;

procedure TFrmHeight.CommHeightReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Cardinal);
begin
    gsString := '';
    RxStr := RxStr + StrPas(DataPtr);

    if Pos(CRLF, RxStr) > 0 then
    begin
        gsString := GetToken(RxStr, CRLF);
        AddLog('<<' + gsString);
        bReceive := True;
    end;
end;

function TFrmHeight.GetHeight(nIndex: integer=0): Boolean;
var fCount : double;
    sTemp, sStr, sResult, sNo, sValue, sValue1 : String;
    i, j,  nLen : Integer;
    fValue : Double;
    nPosition: integer;
begin

   Result := False;
    LabValue1.Caption := '---';
    LabValue2.Caption := '---';
    LabValue3.Caption := '---';
    LabValue4.Caption := '---';

    EditRead.Text := '';

    if not CommHeight.Connected then
    begin
        FrmMain.FrmeMotorEcu.Addlog('계측기 통신연결을 확인하세요.');
        Exit;
    end;


    //PLC를 통해 Trigger 신호를 날린다.
    btnTriggerClick(nil);

    fCount := GetTickCountEx;

    While True do
    begin
        Application.ProcessMessages;
        if bReceive then
        begin
            sTemp := gsString;
//sTemp := '<<01,04,-4091,-4092,-4093,-4094@@';

            sResult := '';
            sStr := GetToken(sTemp, ',');// ',' 두번 잘라내면 해당값


            sStr := GetToken(sTemp, ',');
            sStr := GetToken(sTemp, #03);

            if sStr = '' then
                continue;

            nLen := Length(sStr);

            sValue1 := sStr;//Copy(sStr, 3, nLen -1 );
            AddLog(sValue1);
            EditRead.Text := sValue1;

            sTemp := sValue1;
            for j := 1 to 4 do
            begin

                sStr := GetToken(sTemp, ',');
                sValue1 := sStr;
                fValue := StrToFloatDef(sValue1, -9999);
                sValue :=  FloatToStr(fValue / 1000);

                Case j - 1 of
                    0: LabValue1.Caption := sValue;
                    1: LabValue2.Caption := sValue;
                    2: LabValue3.Caption := sValue;
                    3: LabValue4.Caption := sValue;
                end;
            end;
            bReceive := False;
            break;
        end;

        Application.ProcessMessages;
    end;
//    SetResultValue();
//    Result := Format('%s,%s,%s,%s',[LabValue1.Caption, LabValue2.Caption, LabValue3.Caption, LabValue4.Caption]);
    Result := True;
//    Result := Format('%s,%s,%s,%s',[LbResult1.Caption, LbResult2.Caption, LbResult3.Caption, LbResult4.Caption]);
end;

procedure TFrmHeight.DisplayValue(sValue: String);
var sTemp, sNO, sVal : String;
    i, nPosition : integer;
    fValue : Double;
begin
    if  sValue = '' then Exit;
    //sValue :  sPosion:sValue,sPosion:sValue,sPosion:sValue,sPosion:sValue

    for i := 1 to 4 do
    begin
        sTemp := GetToken(sValue, ',');
        sNO := GetToken(sValue, ':');
    end;
end;

procedure TFrmHeight.BtnGetValueClick(Sender: TObject);
begin
    GetHeight();
end;

procedure TFrmHeight.BtnConnectClick(Sender: TObject);
begin
    Connect(Ed_PortConfig.Text);
end;

procedure TFrmHeight.BtnDisConnectClick(Sender: TObject);
begin
    DisConnect;
end;

procedure TFrmHeight.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    HeightINI.SaveData;
end;

procedure TFrmHeight.FormCreate(Sender: TObject);
begin
    Connect(Ed_PortConfig.Text);

end;

procedure TFrmHeight.XiButton2Click(Sender: TObject);
begin
    CommHeight.SendString('RES'+ CRLF);
end;

procedure TFrmHeight.BtnMasterClick(Sender: TObject);
var sTemp, sMaster1, sMaster2,sMaster3, sMaster4, sMaster5 : String;
begin
    if (MessageBox('마스터 값을 변경 하시 겠습니까?','경고', MB_OKCANCEL or MB_ICONWARNING) <> ID_OK) then
        exit;


    //sTemp := GetHeight(-1);
    sTemp := LabValue1.Caption + ',' + LabValue2.Caption + ',' + LabValue3.Caption + ','
            + LabValue4.Caption + ',' + LabValue5.Caption;

    sMaster1 := GetToken(sTemp, ',');
    //GetToken(sMaster1, ':');
    EdtZero1.Text := sMaster1;

    sMaster2 := GetToken(sTemp, ',');
    //GetToken(sMaster2, ':');
    EdtZero2.Text := sMaster2;

    sMaster3 := GetToken(sTemp, ',');
    //GetToken(sMaster3, ':');
    EdtZero3.Text := sMaster3;

    sMaster4 := GetToken(sTemp, ',');
    //GetToken(sMaster4, ':');
    EdtZero4.Text := sMaster4;

    sMaster5 := GetToken(sTemp, ',');
    //GetToken(sMaster5, ':');
    EdtZero5.Text := sMaster5;

end;

procedure TFrmHeight.SetZeroHeight(sStr: String);
begin
    CommHeight.SendString(sStr+ CRLF);
end;

procedure TFrmHeight.btnResultValueClick(Sender: TObject);
begin
    //
end;

function TFrmHeight.SetResultValue(nPLCMODEL : integer) : string;
var
    fZero1, fZero2, fZero3, fZero4, fZero5 : Double;
    fValue1, fValue2, fValue3, fValue4, fValue5 : Double;
    fResult1, fResult2, fResult3, fResult4, fResult5 : Double;
begin
    Result := '';

    LbResult1.Caption := '---';
    LbResult2.Caption := '---';
    LbResult3.Caption := '---';
    LbResult4.Caption := '---';
    LbResult5.Caption := '---';

    case nPLCMODEL of
        1 : begin
            fZero1 := StrToFloatDef(EdtZero1.Text, 0);
            fZero2 := StrToFloatDef(EdtZero2.Text, 0);
            fZero3 := StrToFloatDef(EdtZero3.Text, 0);
            fZero4 := StrToFloatDef(EdtZero4.Text, 0);
            fZero5 := StrToFloatDef(EdtZero5.Text, 0);
        end;
        2 : begin
            fZero1 := StrToFloatDef(EdtZero2_1.Text, 0);
            fZero2 := StrToFloatDef(EdtZero2_2.Text, 0);
            fZero3 := StrToFloatDef(EdtZero2_3.Text, 0);
            fZero4 := StrToFloatDef(EdtZero2_4.Text, 0);
            fZero5 := StrToFloatDef(EdtZero2_5.Text, 0);
        end;
    end;
    fValue1 := StrToFloatDef(LabValue1.Caption, 0);
    fValue2 := StrToFloatDef(LabValue2.Caption, 0);
    fValue3 := StrToFloatDef(LabValue3.Caption, 0);
    fValue4 := StrToFloatDef(LabValue4.Caption, 0);
    fValue5 := StrToFloatDef(LabValue5.Caption, 0);

    fResult1 := fZero1 - fValue1;
    fResult2 := fZero2 - fValue2;
    fResult3 := fZero3 - fValue3;
    fResult4 := fZero4 - fValue4;
    fResult5 := fZero5 - fValue5;


    LbResult1.Caption := Format('%.3f',[fResult1]);
    LbResult2.Caption := Format('%.3f',[fResult2]);
    LbResult3.Caption := Format('%.3f',[fResult3]);
    LbResult4.Caption := Format('%.3f',[fResult4]);
    LbResult5.Caption := Format('%.3f',[fResult5]);

    Result := Format('%s,%s,%s,%s',[LbResult1.Caption, LbResult2.Caption, LbResult3.Caption, LbResult4.Caption]);
end;

procedure TFrmHeight.btnResultClick(Sender: TObject);
begin
    SetResultValue(StrToIntDef(FrmMain.gModelInfo.PLCJigNum,0));
end;

Procedure TFrmHeight.SaveLog( WtStr : string);
var
    FileName: string;
    f: TextFile;
begin
    FileName := GetAppDir('Height Log Data') + FormatDateTime('YYYY-MM', Now) + '\' + FormatDateTime('MM-DD', Now) + '\'+'Height' +'\';
    MakeDir(FileName);

    FileName := FileName + 'Heightlog.text';

    AssignFile (f, filename);

    if FileExists (filename) then begin
        Append (f);
    end else
    begin
        ReWrite(f);
        WriteLn (f, 'Height Log');
    end;

    WriteLn (f, WtStr);
    Flush (f); { ensures that the text was actually written to file }
               { insert code here that would require a Flush before closing the file }
    CloseFile (f);
end;

procedure TFrmHeight.btnTriggerClick(Sender: TObject);
begin
    FrmMelsecQ.SendCommand(edtTrigger.Text, 1);
    DelayEx(300,True);
    FrmMelsecQ.SendCommand(edtTrigger.Text, 0);
end;

procedure TFrmHeight.btnMemoClearClick(Sender: TObject);
begin
    ComMemo.Clear;
end;

procedure TFrmHeight.XiButton3Click(Sender: TObject);
begin
    FrmMelsecQ.SendCommand(edtZero.Text, 1);
    DelayEx(300,True);
    FrmMelsecQ.SendCommand(edtZero.Text, 0);
end;

procedure TFrmHeight.btnJigMasterClick(Sender: TObject);
var sTemp, sMaster1, sMaster2,sMaster3, sMaster4, sMaster5 : String;
begin
    if (MessageBox('마스터 값을 변경 하시 겠습니까?','경고', MB_OKCANCEL or MB_ICONWARNING) <> ID_OK) then
        exit;

    //sTemp := GetHeight(-1);
    sTemp := LabValue1.Caption + ',' + LabValue2.Caption + ',' + LabValue3.Caption + ','
            + LabValue4.Caption + ',' + LabValue5.Caption;

    sMaster1 := GetToken(sTemp, ',');
    //GetToken(sMaster1, ':');
    EdtJIGZero1.Text := sMaster1;

    sMaster2 := GetToken(sTemp, ',');
    //GetToken(sMaster2, ':');
    EdtJIGZero2.Text := sMaster2;

    sMaster3 := GetToken(sTemp, ',');
    //GetToken(sMaster3, ':');
    EdtJIGZero3.Text := sMaster3;

    sMaster4 := GetToken(sTemp, ',');
    //GetToken(sMaster4, ':');
    EdtJIGZero4.Text := sMaster4;

    sMaster5 := GetToken(sTemp, ',');
    //GetToken(sMaster5, ':');
    EdtJIGZero5.Text := sMaster5;
end;

function TFrmHeight.SetJIGResultValue(): String;
var
    fZero1, fZero2, fZero3, fZero4, fZero5 : Double;
    fValue1, fValue2, fValue3, fValue4, fValue5 : Double;
    fResult1, fResult2, fResult3, fResult4, fResult5 : Double;
begin
    Result := '';

    LbJIGResult1.Caption := '---';
    LbJIGResult2.Caption := '---';
    LbJIGResult3.Caption := '---';
    LbJIGResult4.Caption := '---';
    LbJIGResult5.Caption := '---';


    fZero1 := StrToFloatDef(EdtJIGZero1.Text, 0);
    fZero2 := StrToFloatDef(EdtJIGZero2.Text, 0);
    fZero3 := StrToFloatDef(EdtJIGZero3.Text, 0);
    fZero4 := StrToFloatDef(EdtJIGZero4.Text, 0);
    fZero5 := StrToFloatDef(EdtJIGZero5.Text, 0);

    fValue1 := StrToFloatDef(LabValue1.Caption, 0);
    fValue2 := StrToFloatDef(LabValue2.Caption, 0);
    fValue3 := StrToFloatDef(LabValue3.Caption, 0);
    fValue4 := StrToFloatDef(LabValue4.Caption, 0);
    fValue5 := StrToFloatDef(LabValue5.Caption, 0);

    fResult1 := fZero1 - fValue1;
    fResult2 := fZero2 - fValue2;
    fResult3 := fZero3 - fValue3;
    fResult4 := fZero4 - fValue4;
    fResult5 := fZero5 - fValue5;

    LbJIGResult1.Caption := Format('%.3f',[fResult1]);
    LbJIGResult2.Caption := Format('%.3f',[fResult2]);
    LbJIGResult3.Caption := Format('%.3f',[fResult3]);
    LbJIGResult4.Caption := Format('%.3f',[fResult4]);
    LbJIGResult5.Caption := Format('%.3f',[fResult5]);

    Result := Format('%s,%s,%s,%s',[LbJIGResult1.Caption, LbJIGResult2.Caption, LbJIGResult3.Caption, LbJIGResult4.Caption]);
end;

procedure TFrmHeight.btnProductCompareClick(Sender: TObject);
begin
    SetJIGResultValue();
end;

procedure TFrmHeight.XiButton4Click(Sender: TObject);
var sTemp, sMaster1, sMaster2,sMaster3, sMaster4, sMaster5 : String;
begin
    if (MessageBox('마스터 값을 변경 하시 겠습니까?','경고', MB_OKCANCEL or MB_ICONWARNING) <> ID_OK) then
        exit;


    //sTemp := GetHeight(-1);
    sTemp := LabValue1.Caption + ',' + LabValue2.Caption + ',' + LabValue3.Caption + ','
            + LabValue4.Caption + ',' + LabValue5.Caption;

    sMaster1 := GetToken(sTemp, ',');
    //GetToken(sMaster1, ':');
    EdtZero2_1.Text := sMaster1;

    sMaster2 := GetToken(sTemp, ',');
    //GetToken(sMaster2, ':');
    EdtZero2_2.Text := sMaster2;

    sMaster3 := GetToken(sTemp, ',');
    //GetToken(sMaster3, ':');
    EdtZero2_3.Text := sMaster3;

    sMaster4 := GetToken(sTemp, ',');
    //GetToken(sMaster4, ':');
    EdtZero2_4.Text := sMaster4;

    sMaster5 := GetToken(sTemp, ',');
    //GetToken(sMaster5, ':');
    EdtZero2_5.Text := sMaster5;

end;

end.


COM2-115200-8-NONE-1
