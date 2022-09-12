unit FrameLoading;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, XiPanel, StdCtrls, DPBLabel, ExtCtrls,
  AMLed, ComCtrls, Spin, ZINICtrl, Buttons, GradientLabel,FormEditModel,
  EllipsLabel, XiButton;

Const ITEMCOUNT = 9;

type
  TtestResult = record
    sSNBarcode : string;
    sFullBarcode : string;
    //--------------------
    bCompareResult : Boolean;
    bVisionResult : Boolean;
    bTotalResult : Boolean;
  end;

  TtestMode = (tmReady, tmRunning, tmEnd);
  TFmeLoading = class(TFrame)
    pnLoading: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    XiPanel19: TXiPanel;
    XiPanel4: TXiPanel;
    lbMessage: TdpbLabel;
    Panel4: TPanel;
    Panel12: TPanel;
    XiPanel16: TXiPanel;
    SpeedButton2: TSpeedButton;
    Count_Fail: ZIniSpinEdit;
    pcStatus: TPageControl;
    TabSheet1: TTabSheet;
    LbOptionModelName: TdpbLabel;
    pnLamp: TXiPanel;
    TabSheet2: TTabSheet;
    MemoLog: TMemo;
    Panel7: TPanel;
    XiPanel1: TXiPanel;
    SpeedButton1: TSpeedButton;
    Count_Pass: ZIniSpinEdit;
    XiPanel2: TXiPanel;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LED_Request: TLed;
    GroupBox3: TGroupBox;
    LED_Trigger: TLed;
    TimerRun: TTimer;
    INI: ZIniData;
    LED_Barcode_OK: TLed;
    LED_Barcode_NG: TLed;
    LED_Vision_OK: TLed;
    LED_Vision_NG: TLed;
    lbStatus: TdpbLabel;
    LED_Barcode_SP: TLed;
    LED_BARCDE_MODEL: TLed;
    XiPanel3: TXiPanel;
    XiButton1: TXiButton;
    GridList: TAdvStringGrid;
    procedure GridListGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure TimerRunTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LED_RequestClick(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
  private
    { Private declarations }
    function MakeDataList:String;
  public
    { Public declarations }
    nStation : integer;
    gtestMode : TtestMode;
    gRetryCount : Integer;
    gPastMessge : String;
    gtestResult : TtestResult;

    procedure DisplayTestStatus(Param : String);
    procedure AddGrid(Step, SubStep, Spec, Value, Result : String);
    procedure GridInit();
    function Addlog(Param : String; bSetMsg : Boolean = FALSE): Boolean;
    function SetMessage(Param : string; aFontColor : TColor) : Boolean;
    function WritePlcModelInfo() : Boolean;
    procedure SaveData(DATETIME : TDateTime);
    
  end;

implementation

{$R *.dfm}

uses GenUtils, FormMelsecQ, FormPLCoption, FormRs232Base,
  FormMain, FormListOption, FormTraceClient, Global;



procedure TFmeLoading.SaveData(DATETIME : TDateTime);
var
    sDir, sFileName, RdStr, sFileName1, sFileName2, sResult : string;
    i : integer;
begin
    sDir := GetAppDir('') + 'DATA\LOADING\' + FormatDateTime('YYYY\MM\DD\',DATETIME);
    if not DirectoryExists(sDir) then
        MakeDir(sDir);

    if gtestResult.bTotalResult then sResult := 'O'
    else sResult := 'X';

    sFileName := sDir + gtestResult.sSNBarcode + '-'+ sResult + '.csv';
    RdStr := sFileName;

    i := 1;
    sFileName1 := GetToken(RdStr,'.csv');
    if FileExists(sFileName) then
    begin
        sFileName2 := sFileName1 + '_' + IntToStr(i) + '.csv';

        while FileExists(sFileName2) do
        begin
            Inc(i);
            sFileName2 := sFileName1 + '_' + IntToStr(i) + '.csv';

            if not FileExists(sFileName2) then
            begin
                sFileName := sFileName2;
                break;
            end;
        end;
    end;

    GridList.SaveToCSV(sFileName);
end;

procedure TFmeLoading.GridListGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vaCenter;
end;

function TFmeLoading.WritePlcModelInfo() : Boolean;
var
    nTemp : integer;
begin
    Result := False;
    FrmMelsecQ.ClearWordAscii(FindAddr(1 ,'PC_BARCODE_WRITE', nTemp), nTemp );
    FrmMelsecQ.SendBlockCommand(FindAddr(1 ,'PC_BARCODE_WRITE', nTemp), gtestResult.sSNBarcode, 1);
    Result := True;
end;
procedure TFmeLoading.TimerRunTimer(Sender: TObject);
var fTime : Double;
    fStartTime : Double;
    sTemp, sSpec, sResult : String;
    nTemp : Integer;
    TestTime : TDateTime;
    nPartNum : integer;
begin

    nPartNum := ListOption[nStation].edtStation.Value;

    if FrmMain.bPause then
    begin
        TimerRun.Enabled := True;
        exit;
    end;

    LED_Request.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_REQUEST', nTemp)) = 1);
    LED_Vision_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_VISION_OK', nTemp)) = 1);
    LED_Vision_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_VISION_NG', nTemp)) = 1);
    LED_Barcode_SP.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_BARCODE_SP', nTemp)) = 1);

    LED_Trigger.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PC_BARCODE_TRIGGER', nTemp)) = 1);
    LED_Barcode_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PC_BCR_OK', nTemp)) = 1);
    LED_Barcode_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PC_BCR_NG', nTemp)) = 1);
    LED_BARCDE_MODEL.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PC_BARCODE_MODEL', nTemp)) = 1);

    case gtestMode of
        tmReady : begin  // 1. PLC 로 부터 Request 신호 대기
            Addlog('SCAN 요청신호 대기중',True);
            if LED_Request.LedOn then
            begin
                fStartTime := GetTickCountEx;
                Addlog('Request ON', True);
                DisplayTestStatus('RUNNING');
                Rs232Base[1].Lb_Msg.Caption := '';
                Rs232Base[1].BtnConnectClick(nil);
                gtestMode := tmRunning;
            end;
        end;
        // 2. 1) PC_BARCODE_TRIGGER  ON
        //    2) VISION 측정결과를 확인
        //    3) RS232 통신으로 FULL 바코드를 취득
        //    4) 실제 자릿수만큼 바코드를 자른다.
        tmRunning : begin
                GridInit();
                FrmMelsecQ.SendCommand(FindAddr(1,'PC_BARCODE_TRIGGER', nTemp), 1);
                Addlog('PC_BARCODE_TRIGGER ON');

                fTime := GetTickCountEx;
                while GetTickCountEx - fTime < 3000 do
                begin
                    if FrmMain.bPause then break;
//DEBUG                    LED_Vision_OK.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_VISION_OK', nTemp)) = 1);
//DEBUG                    LED_Vision_NG.LedOn := (FrmMelsecQ.ReadCommandEx(FindAddr(1,'PLC_VISION_NG', nTemp)) = 1);

                    if LED_Vision_OK.LedOn or LED_Vision_NG.LedOn then
                    begin
                        gtestResult.bVisionResult := LED_Vision_OK.LedOn;
                        if gtestResult.bVisionResult then
                        begin
                            Addlog('VISION OK');
                            AddGrid('SCAN', 'VISION','','', 'PASS');
                        end else begin
                            Addlog('VISION NG');
                            AddGrid('SCAN', 'VISION','','', 'FAIL');
                        end;
//DEBUG
Rs232Base[1].Lb_Msg.Caption := 'ABCDEFGGGGDDDDDDD';
gtestResult.sFullBarcode := 'ABCDEFGGGGDDDDDDD';
                        if Rs232Base[1].Lb_Msg.Caption <> '' then
                        begin
                            Addlog(Format('SCAN OK : %s', [gtestResult.sFullBarcode]), True);
                            AddGrid('SCAN', 'Full Barcode', '', gtestResult.sFullBarcode , 'PASS');

                            //-------------------------Full 바코드에서 Serial Num를 취득한다.
                            gtestResult.sSNBarcode := FindParam(2 ,nPartNum ,1,1, ModelCode, gtestResult.sFullBarcode);
                            if gtestResult.sSNBarcode = '' then
                                gtestResult.sSNBarcode := 'NO READ';
                            AddGrid('SCAN', 'Serial', '', gtestResult.sSNBarcode , 'PASS');

                            //------------------------Serial Num에서 모델 정보를 받아 비교한다.
                            sTemp := FindParam(2 ,nPartNum ,1,2, ModelCode, gtestResult.sSNBarcode);
                            sSpec := FindSpec(2,nPartNum,1,2,ModelCode);

                            gtestResult.bCompareResult := (sTemp = sSpec);

                            if gtestResult.bCompareResult then
                                sResult := 'PASS'
                            else
                                sResult := 'FAIL';

                            AddGrid('SCAN', 'Model', sSpec, sTemp, sResult);
                            break;
                        end else
                        begin
                            Addlog(Format('SCAN NG : %s', ['']), True);
                        end;
                    end;
                    application.ProcessMessages;
                end;

                WritePlcModelInfo;
                FrmMelsecQ.SendCommand(FindAddr(1,'PC_BARCODE_TRIGGER', nTemp), 0);
                Addlog('PC_BARCODE_TRIGGER OFF');


                gtestMode := tmEnd;
        end;
        tmEnd : begin  // 1. PLC 로 부터 Request 신호 대기
                    //AddGrid(gtestResult.sSNBarcode,sResult, gtestResult.bCompareResult, gtestResult.bVisionResult);
            TestTime := Now;

            if gtestResult.bVisionResult and gtestResult.bCompareResult then
            begin
                AddGrid('TOTAL RESULT','','','', 'PASS');
                sResult := 'PASS';
                FrmMelsecQ.SendCommand(FindAddr(1,'PC_BCR_OK', nTemp), 1);
                Addlog('PC_BCR_OK');
                Count_Pass.Value := Count_Pass.Value + 1;
                gtestResult.bTotalResult := True;
            end else
            begin
                AddGrid('TOTAL RESULT','','','', 'FAIL');
                sResult := 'FAIL';
                FrmMelsecQ.SendCommand(FindAddr(1,'PC_BCR_NG', nTemp), 1);
                Addlog('PC_BCR_NG');
                Count_Fail.Value := Count_Fail.Value + 1;
                gtestResult.bTotalResult := False;
            end;
            SaveData(TestTime);
            FrmTraceClient.UploadState(ListOption[1].EditStation.text, gtestResult.sSNBarcode, ModelCode, sResult, TestTime, 0);
            FrmTraceClient.UploadStateAndResult(ListOption[1].EditStation.text,                   // sStation
                                                gtestResult.sSNBarcode,                           // sSerial
                                                sResult,                                          // sResult
                                                TestTime,                                         // TestTime
                                                Round((GetTickCountEx - fStartTime) / 1000),      // nCycleTime
                                                ITEMCOUNT,                                        // nItemCount
                                                MakeDataList());                                  // sDataList


            Addlog(sResult,True);
            DisplayTestStatus(sResult);

            FrmMelsecQ.SendCommand(FindAddr(1,'PLC_REQUEST', nTemp), 0);

            gtestMode := tmReady;
        end;

    end; // end of case gtestMode of

    TimerRun.Enabled := not gClose;

end;



//'STEPNAME:TESTITEM:ITEMTYPE:SPECMIN:SPECMAX:NORVAL:VALUE:UNIT:RESULT'
function TFmeLoading.MakeDataList:String;
var sResult, sStep1, sStep2 : String;
    RdStr, Str : string;
    c, r, nROW : integer;
begin
    Str := '';
    with GridList do
    begin
        nROW := RowCount;
        for r := 1 to nROW-2 do
        begin
            Str := Str + Cells[1,r] + ':';                   //STEPNAME
            Str := Str + Cells[2,r] + ':';                   //TESTITEM

            RdStr := Cells[3,r];

            if Pos('~',RdStr) > 0 then
            begin
                Str := Str + 'V' + ':';                      //ITEMTYPE
                RdStr := Cells[3,r];
                Str := Str + GetToken(RdStr,'~') + ':';      //SPECMIN
                Str := Str + RdStr + ':';                    //SPECMAX
                Str := Str + ':';                            //NORVAL
            end else begin
                Str := Str + 'S' + ':';                      //ITEMTYPE
                Str := Str + ':';                            //SPECMIN
                Str := Str + RdStr + ':';                    //SPECMAX
                Str := Str + ':';                            //NORVAL
            end;

            Str := Str + Cells[4,r] + ':';                   //VALUE
            Str := Str + '' + ':';                           //UNIT
            Str := Str + Cells[5,r] + ':';                   //RESULT
            Str := Str + '|';
        end;

    end;
    if gClose then exit;

    Result := Str;
    Addlog(Result,False);
end;

function TFmeLoading.SetMessage(Param : string; aFontColor : TColor) : Boolean;
begin
    Result := False;
    lbMessage.Caption := Param;
    lbMessage.Font.Color := aFontColor;
    Result := True;
end;

function TFmeLoading.Addlog(Param : String; bSetMsg : Boolean): Boolean;
var
    sTemp, sTemp1 : string;
begin
    Result := False;

    sTemp := Param;
    if sTemp = gPastMessge then exit;

    gPastMessge := sTemp;

    sTemp1 := ReplaceStr(stemp,CRLF,' ');
    if bSetMsg then
        SetMessage(sTemp1,clRed);

    if MemoLog.Lines.Count > 10000 then
        MemoLog.Lines.Delete(0);

    ReplaceStr(sTemp,CRLF,'');

    sTemp := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + ' >> ' + sTemp;
    MemoLog.Lines.Add(sTemp);

    WriteDebugStr(sTemp);

    Result := True;
end;

procedure TFmeLoading.GridInit();
var c,r : integer;
begin

    for c := 1 to GridList.ColCount-1 do
        for r := 1 to GridList.RowCount-1 do
            GridList.Cells[c,r] := '';
    GridList.RowCount := 2;
end;

type
    TMYGrid = class(TstringGrid);

procedure TFmeLoading.AddGrid(Step, SubStep, Spec, Value, Result : String);
var
    aColor : TColor;
    nRowCount : integer;
begin
    with GridList do
    begin
        if cells[1, RowCount -1] <> '' then
            RowCount := RowCount + 1;

        nRowCount := RowCount;

        GridList.FocusCell(1,nRowCount-1);

        cells[1, nRowCount -1] := Step;
        cells[2, nRowCount -1] := SubStep;
        cells[3, nRowCount -1] := Spec;
        cells[4, nRowCount -1] := Value;
        cells[5, nRowCount -1] := Result;

        if (Result = 'GOOD') or
           (Result = 'SKIP') or
           (Result = 'PASS') then
            aColor := clGreen
        else
            aColor := clRed;

        FontColors[5, nRowCount -1] := aColor;
        FontStyles[5, nRowCount -1] := [fsBold];

        if RowCount > ListOption[1].edtListRowCount.Value + 1 then
            GridList.RemoveRows(1,1);
            //TMYGrid(GridList).DeleteRow(1);
        AutoNumberCol(0);
    end;
end;

procedure TFmeLoading.DisplayTestStatus(Param : String);
var
    Str, RdStr : string;
begin

    Param := UpperCase(Param);

    RdStr := '';
    Str := '';
    with pnLamp do
    begin
        if Pos('NONE',Param) > 0 then
        begin
            ColorFace := clBlack;
            ColorGrad := clGray;
        end else if Pos('READY',Param) > 0 then begin

            ColorFace := clGreen;
            ColorGrad := $0000DD00;
        end else if Pos('INIT',Param) > 0 then begin
            ColorFace := clGray;
            ColorGrad := clSilver;
        end else if Pos('RUNNING',Param) > 0 then begin
            ColorFace := clBlue;
            ColorGrad := $00FF6666;
        end else if (Pos('GOOD',Param) > 0) or (Pos('OK', Param) > 0) then begin
            ColorFace := clLime;
            ColorGrad := $0059FF59;
        end else if (Pos('FAIL',Param) > 0) or (Pos('STOP',Param) > 0) or (Pos('NG',Param) > 0)  then begin
            ColorFace := clRed;
            ColorGrad :=$004646FF;
        end;

        lbStatus.Caption := Param ;
    end;
end;


procedure TFmeLoading.SpeedButton1Click(Sender: TObject);
begin
    Count_Pass.Value := 0;
end;

procedure TFmeLoading.SpeedButton2Click(Sender: TObject);
begin
    Count_Fail.Value := 0;
end;


procedure TFmeLoading.LED_RequestClick(Sender: TObject);
begin
    (Sender as TLed).LedOn := not (Sender as TLed).LedOn;
    DelayEx(500,True);
    (Sender as TLed).LedOn := not (Sender as TLed).LedOn;
end;

procedure TFmeLoading.XiButton1Click(Sender: TObject);
begin
    ListOption[1].Show;
end;

end.
