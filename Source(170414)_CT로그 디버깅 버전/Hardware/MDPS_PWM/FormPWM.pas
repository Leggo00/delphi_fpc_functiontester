unit FormPWM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, AdvObj,
  Dialogs, ExtCtrls, ComDrv32, Buttons, StdCtrls, DPBLabel, Spin, ZINICtrl,
  ComCtrls, uKMIComm, NumEdit, FormDevice, Grids, BaseGrid, AdvGrid;

type
  TFrmKMIPWM = class(TFrmDevice)
    Panel1: TPanel;
    Edit_Comport: ZIniSpinEdit;
    dpbLabel1: TdpbLabel;
    BtnConnect: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StatusBar: TStatusBar;
    INI: ZIniData;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    BtnReset: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit_Ch1Freq: TNumberEdit;
    Edit_Ch1Duty: TNumberEdit;
    Edit_Ch2Freq: TNumberEdit;
    Edit_Ch2Duty: TNumberEdit;
    GroupBox2: TGroupBox;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    BtnWrite: TSpeedButton;
    BtnRead: TSpeedButton;
    Label7: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label8: TLabel;
    Cb_1: TCheckBox;
    Cb_2: TCheckBox;
    Cb_3: TCheckBox;
    Cb_4: TCheckBox;
    Cb_5: TCheckBox;
    Cb_6: TCheckBox;
    Ed_Index: TSpinEdit;
    Ed_Interval: TSpinEdit;
    Memo: TMemo;
    TabSheet2: TTabSheet;
    Grid: TAdvStringGrid;
    procedure BtnResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SetPWM(Sender: TObject);
    procedure SignalResetClick(Sender: TObject);
    procedure BtnWriteClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
  private
    { Private declarations }
    function  LoadTheta(sFileName : String): boolean;
    procedure MakeGrid;
    //procedure SaveTheta;
    procedure AddLog(Param : String);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure GridGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure SetGrid(nCol, nRow, nStartTheta, nStartDegree,
      nIncDegreeCount: integer);
  public
    { Public declarations }
    sThetaFileName : String; // Theta file name .. for LoadTheta

    KMIComm : TKMIComm;
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
    function DevFileOpen(Param: String): boolean;   override;
  end;

var
  FrmKMIPWM: TFrmKMIPWM;

implementation

{$R *.dfm}

uses
    GenUtils, Math;

function TFrmKMIPWM.DevClose(Param: String): Integer;
begin
    KMIComm.CommClose;
    StatusBar.Panels[0].Text := 'DISCONNECT';
end;

function TFrmKMIPWM.DevInit(Param: String): Integer;
begin
//
end;

function TFrmKMIPWM.DevOpen(Param: String): Integer;
begin
    if KMIComm.CommOpen(Edit_Comport.Value) then
        StatusBar.Panels[0].Text := 'CONNECTED'
    else
        StatusBar.Panels[0].Text := 'DISCONNECT';
end;

function TFrmKMIPWM.DevRead(Param: String): String;
begin
//
end;

function TFrmKMIPWM.DevFileOpen(Param: String): boolean;
begin
    if LoadTheta(Param) then Result := True
                        else Result := False;
end;

function TFrmKMIPWM.DevSend(Param: String): Integer;
var i, nStart, nEnd, nDelay : Integer;
    Cmd, Option, sStart, sEnd, Str : String;
    bUpDn, bAllSend : Boolean;
    nIdx : integer;
begin
    Cmd := GetToken(Param, ':');
    Option := Param;

    if (Cmd = 'PWM') then begin
        Edit_Ch1Freq.Text := GetToken(Option, ',');
        Edit_Ch1Duty.Text := GetToken(Option, ',');
        //Edit_Ch2Freq.Text := GetToken(Option, ',');
        //Edit_Ch2Duty.Text := GetToken(Option, ',');

        SetPWM(SpeedButton1);

    end else
    if (Cmd = 'ENCODER') then begin

        if Length(Option) = 6 then begin
            Cb_1.Checked := (Option[1] = 'H');
            Cb_2.Checked := (Option[2] = 'H');
            Cb_3.Checked := (Option[3] = 'H');
            Cb_4.Checked := (Option[4] = 'H');
            Cb_5.Checked := (Option[5] = 'H');
            Cb_6.Checked := (Option[6] = 'H');

            BtnWriteClick(nil);
        end;
    end else
    if (Cmd = 'MBCO') then
    begin
        Edit_Ch1Freq.Text := GetToken(Option, ',');
        Edit_Ch1Duty.Text := GetToken(Option, ',');
        Edit_Ch2Freq.Text := GetToken(Option, ',');
        Edit_Ch2Duty.Text := GetToken(Option, ',');

        SetPWM(SpeedButton1);
        SetPWM(SpeedButton3);

        if Length(Option) = 6 then begin
            Cb_1.Checked := (Option[1] = 'H');
            Cb_2.Checked := (Option[2] = 'H');
            Cb_3.Checked := (Option[3] = 'H');
            Cb_4.Checked := (Option[4] = 'H');
            Cb_5.Checked := (Option[5] = 'H');
            Cb_6.Checked := (Option[6] = 'H');

            BtnWriteClick(nil);
        end;
    end else
    if (Cmd = 'THETA') then begin
        with Grid do
        begin
            for i:=1 to RowCount-1 do
            begin
                if Cells[0,i] = Option then
                begin
                    Cb_1.Checked := (Cells[2,i] = '1');
                    Cb_2.Checked := (Cells[3,i] = '1');
                    Cb_3.Checked := (Cells[4,i] = '1');
                    Cb_4.Checked := (Cells[5,i] = '1');
                    Cb_5.Checked := (Cells[6,i] = '1');
                    Cb_6.Checked := True;

                    BtnWriteClick(nil);
                    break;
                end;
            end;
        end;
    end else
    if (Cmd = 'SWEEP') then begin
        // Option -> START,END,Up or Down,Delay(s)
        with Grid do
        begin
            sStart := GetToKen(Option,',');
            sEnd   := GetToKen(Option,',');
            Str    := GetToKen(Option,',');
            bUpDn  := (Str = 'UP') or (Str = 'U');
            nDelay := Round(StrToFloatDef(GetToKen(Option,','),1)*1000);
            for i:=1 to RowCount-1 do
            begin
                if Cells[0,i] = sStart then
                begin
                    nStart := i;
                    break;
                end;
            end;

            for i:=1 to RowCount-1 do
            begin
                if Cells[0,i] = sEnd then
                begin
                    nEnd := i;
                    break;
                end;
            end;

            bAllSend := False;
            if bUpDn then  // 상승일경우
            begin
                for i:=nStart to RowCount-1 do
                begin
                    Cb_1.Checked := (Cells[2,i] = '1');
                    Cb_2.Checked := (Cells[3,i] = '1');
                    Cb_3.Checked := (Cells[4,i] = '1');
                    Cb_4.Checked := (Cells[5,i] = '1');
                    Cb_5.Checked := (Cells[6,i] = '1');
                    Cb_6.Checked := True;

                    BtnWriteClick(nil);      
                                              
                    //nIdx := i;
                    //AddLog(Format('THETA_%d=%s %s %s %s %s',[nIdx-46, Cells[2,i], Cells[3,i], Cells[4,i], Cells[5,i], Cells[6,i]]));

                    bAllSend := (i = nEnd);
                    if bAllSend then break;

                    DelayEx(nDelay,True);
                end;

                if bAllSend then exit;

                // 상승연속시
                for i:=1 to RowCount-1 do
                begin
                    Cb_1.Checked := (Cells[2,i] = '1');
                    Cb_2.Checked := (Cells[3,i] = '1');
                    Cb_3.Checked := (Cells[4,i] = '1');
                    Cb_4.Checked := (Cells[5,i] = '1');
                    Cb_5.Checked := (Cells[6,i] = '1');
                    Cb_6.Checked := True;

                    BtnWriteClick(nil);

                    bAllSend := (i = nEnd);
                    if bAllSend then break;

                    DelayEx(nDelay,True);
                end;

            end else
            begin    // 하강일경우
                for i:=nStart downto 1 do
                begin
                    Cb_1.Checked := (Cells[2,i] = '1');
                    Cb_2.Checked := (Cells[3,i] = '1');
                    Cb_3.Checked := (Cells[4,i] = '1');
                    Cb_4.Checked := (Cells[5,i] = '1');
                    Cb_5.Checked := (Cells[6,i] = '1');
                    Cb_6.Checked := True;

                    BtnWriteClick(nil);

                    //nIdx := i;
                    //AddLog(Format('THETA_%d=%s %s %s %s %s',[nIdx-46, Cells[2,i], Cells[3,i], Cells[4,i], Cells[5,i], Cells[6,i]]));

                    bAllSend := (i = nEnd);
                    if bAllSend then break;

                    DelayEx(nDelay,True);
                end;

                if bAllSend then exit;

                // 하강연속시
                for i:=RowCount-1 downto 1 do
                begin
                    Cb_1.Checked := (Cells[2,i] = '1');
                    Cb_2.Checked := (Cells[3,i] = '1');
                    Cb_3.Checked := (Cells[4,i] = '1');
                    Cb_4.Checked := (Cells[5,i] = '1');
                    Cb_5.Checked := (Cells[6,i] = '1');
                    Cb_6.Checked := True;

                    BtnWriteClick(nil);

                    bAllSend := (i = nEnd);
                    if bAllSend then break;

                    DelayEx(nDelay,True);
                end;

            end;
        end;
    end;
end;
//------------------------------------------------------------------------------

procedure TFrmKMIPWM.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    KMIComm := TKMIComm.Create;
    DevOpen('');
    MakeGrid;
    //LoadTheta();
end;

procedure TFrmKMIPWM.FormDestroy(Sender: TObject);
begin
    KMIComm.Free;
end;

procedure TFrmKMIPWM.BtnConnectClick(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmKMIPWM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //SaveTheta;
    INI.SaveData;
end;

procedure TFrmKMIPWM.SpeedButton2Click(Sender: TObject);
begin
    DevClose('');
end;

procedure TFrmKMIPWM.BtnResetClick(Sender: TObject);
var Str : String;
begin
    // Reset.
    KMIComm.CommSend($03, []);

    with Memo.Lines do begin
        Add('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
        Add('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
        Add('');
    end;
end;


procedure TFrmKMIPWM.SetPWM(Sender: TObject);
var Idx, nValue : Integer;
    fTime, fFreq1, fFreq2, fDuty1, fDuty2 : Double;
    Str : String;
    Buff : array of Byte;

    function GetDigit(nValue, nDigit : Integer) : Integer;
    begin
        nDigit := Trunc(Power(10, nDigit));
        if nDigit > 0 then
            Result := (nValue div nDigit) mod 10; // 1234 -> 3
    end;

    procedure MakeBCD( StartIdx, nValue1, nValue2 : Integer);
    begin
        Buff[StartIdx+0] := GetDigit(nValue1, 5) * 16 + GetDigit(nValue1, 4);
        Buff[StartIdx+1] := GetDigit(nValue1, 3) * 16 + GetDigit(nValue1, 2);
        Buff[StartIdx+2] := GetDigit(nValue1, 1) * 16 + GetDigit(nValue1, 0);

        Buff[StartIdx+3] := GetDigit(nValue2, 5) * 16 + GetDigit(nValue2, 4);
        Buff[StartIdx+4] := GetDigit(nValue2, 3) * 16 + GetDigit(nValue2, 2);
        Buff[StartIdx+5] := GetDigit(nValue2, 1) * 16 + GetDigit(nValue2, 0);
    end;

begin
    fTime := GetTickCountEX;

    fFreq1 := StrToFloatdef(Edit_Ch1Freq.text, 0);
    fFreq2 := StrToFloatdef(Edit_Ch2Freq.text, 0);
    fDuty1 := StrToFloatdef(Edit_Ch1Duty.text, 0);
    fDuty2 := StrToFloatdef(Edit_Ch2Duty.text, 0);

    Idx := (Sender as TSpeedButton).Tag;//만도제품은 pwm을 수동으로 날릴수 있게해줘야 하나 mhe꺼는
                                             //스텝상 13만 타면 되서 임시로 수정
    case Idx of
        11: begin  // Freq Set
            SetLength(Buff, 6);
            MakeBCD(0, Round(fFreq1 * 100), Round(fFreq2 * 100));
            KMIComm.CommSend($11, Buff);
        end;

        12: begin // Freq Set
            SetLength(Buff, 6);
            MakeBCD(0, Round(fDuty1 * 1000), Round(fDuty2 * 1000));
            KMIComm.CommSend($12, Buff);

        end;

        13: begin // CH1, Freq, Duty.
            SetLength(Buff, 7);
            Buff[0] := 1;
            MakeBCD(1, Round(fFreq1 * 100), Round(fDuty1 * 1000));
            KMIComm.CommSend($13, Buff);
        end;

        14: begin
            SetLength(Buff, 7);
            Buff[0] := 2;
            MakeBCD(1, Round(fFreq2 * 100), Round(fDuty2 * 1000));
            KMIComm.CommSend($13, Buff);
        end;
    end;

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
    AddLog('');
end;

procedure TFrmKMIPWM.AddLog(Param: String);
begin
    with Memo.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

procedure TFrmKMIPWM.SignalResetClick(Sender: TObject);
var fTime : Double;
begin
    fTime := GetTickCountEX;
    case (Sender as TSpeedButton).Tag of
        0 : KMIComm.CommSend($20, [0]); // All Low
        1 : KMIComm.CommSend($20, [1]); // Default
        2 : KMIComm.CommSend($20, [2]); // All High
    end;

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
    AddLog('');
end;

procedure TFrmKMIPWM.BtnWriteClick(Sender: TObject);
var nData : Byte;
    fTime : Double;
begin
    nData := 0;
    if Cb_1.Checked then nData := nData or $01;
    if Cb_2.Checked then nData := nData or $02;
    if Cb_3.Checked then nData := nData or $04;
    if Cb_4.Checked then nData := nData or $08;
    if Cb_5.Checked then nData := nData or $10;
    if Cb_6.Checked then nData := nData or $20;

    fTime := GetTickCountEX;
    KMIComm.CommSend($21, [nData]);

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
    AddLog('');
end;

procedure TFrmKMIPWM.BtnReadClick(Sender: TObject);
var nData : Byte;
    fTime : Double;
begin
    fTime := GetTickCountEX;
    KMIComm.CommSend($29, []);

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
end;


procedure TFrmKMIPWM.SpeedButton9Click(Sender: TObject);
var nData : Byte;
    fTime : Double;
begin
    fTime := GetTickCountEX;

    nData := Ed_Index.Value;
    KMIComm.CommSend($22, [nData]); // All Low

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
    AddLog('');
end;

procedure TFrmKMIPWM.SpeedButton10Click(Sender: TObject);
var nData : Byte;
    nInterval : Word;
    fTime : Double;
    Buff : array[0..2] of Byte;
begin
    fTime := GetTickCountEX;

    nData     := Ed_Index.Value;
    nInterval := Ed_Interval.Value;
    
    Buff[0] := nData;
    Buff[1] := HI(nInterval);
    Buff[2] := LO(nInterval);
    
    KMIComm.CommSend($23, Buff);

    AddLog('> ' + MakeHexaString(@KMIComm.TxBuff[0], KMIComm.TxLen));
    AddLog('< ' + MakeHexaString(@KMIComm.RxBuff[0], KMIComm.RxLen));
    AddLog(Format('* Time  %f ms ', [GetTickCountEX - fTime]));
    AddLog('');

end;

procedure TFrmKMIPWM.MakeGrid;
var nCol, nRow, nDegree : Integer;
begin
    {with Grid do
    begin
        Clear;
        Colcount := 8;
        RowCount := 91;
        DefaultRowHeight := 18;

        nCol := 0;
        Cells[nCol,0] := 'Theta';          ColWidths[nCol] := 50;   Inc(nCol);
        Cells[nCol,0] := 'Degree';         ColWidths[nCol] := 50;   Inc(nCol);
        Cells[nCol,0] := 'U';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'V';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'W';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'A';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'B';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'Current Peak';   ColWidths[nCol] := 210;

        nDegree := -178;
        For nRow:=1 to RowCount-1 do
        begin
            Cells[0, nRow] := Format('%d', [nRow-46]);
            Cells[1, nRow] := Format('%d', [nDegree]);
            nDegree := nDegree + 4;
        end;
    end;}


    // col = 고정...
    // row = stringlistcount 만큼...
    // StartTheta = theta의 시작 번호...
    // StartDegree = Degree의 시작 번호...
    // IncDegreeCount = Degree의 순차적 차이
    //  ex) -30 -> -26 -> -22 >>>>> IncDegreeCount = 4!!!!!!!!

    SetGrid(8, 91, 0, 0, 0);
end;

// nIncThetaCount = theta가 일정 간격으로 증가하는 범위...
procedure TFrmKMIPWM.SetGrid(nCol, nRow, nStartTheta, nStartDegree, nIncDegreeCount: integer);
var
    nDeg : integer;
    nStartIdx : integer;
begin
    with Grid do
    begin
        Clear;
        Colcount := nCol;
        RowCount := nRow;
        DefaultRowHeight := 18;

        nCol := 0;
        Cells[nCol,0] := 'Theta';          ColWidths[nCol] := 50;   Inc(nCol);
        Cells[nCol,0] := 'Degree';         ColWidths[nCol] := 50;   Inc(nCol);
        Cells[nCol,0] := 'U';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'V';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'W';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'A';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'B';              ColWidths[nCol] := 40;   Inc(nCol);
        Cells[nCol,0] := 'Current Peak';   ColWidths[nCol] := 210;

        if (nStartTheta = 0) or (nStartDegree = 0) or (nIncDegreeCount = 0) then exit;

        nDeg := nStartDegree;
        nStartIdx := nStartTheta - 1;
        For nRow:=1 to RowCount-1 do
        begin
            Cells[0, nRow] := Format('%d', [nRow-nStartIdx]);
            Cells[1, nRow] := Format('%d', [nDeg]);
            nDeg := nDeg + nIncDegreeCount;
        end;
    end;
end;

Function TFrmKMIPWM.LoadTheta(sFileName : String): boolean;
var StrList : TStringList;
    Str : String;
    i : Integer;
    sDirName : String;
    nListCount : integer;
begin
    Result := False;

    sDirName := ExtractFileDir(sFileName);
    if Not DirectoryExists(sDirName) then MakeDir(sDirName);

    if Not FileExists(sFileName) then exit;

    StrList := TStringList.Create;
    StrList.LoadFromFile(sFileName);

    nListCount := StrList.Count + 1;
    SetGrid(8, nListCount, 0, 0, 0);

    try
        for i:= 1 to StrList.Count do
        begin
            Str := StrList.Strings[i-1];
            Grid.Cells[0,i] := GetToKen(Str,'=');
            Grid.Cells[1,i] := GetToKen(Str,',');
            Grid.Cells[2,i] := GetToKen(Str,',');
            Grid.Cells[3,i] := GetToKen(Str,',');
            Grid.Cells[4,i] := GetToKen(Str,',');
            Grid.Cells[5,i] := GetToKen(Str,',');
            Grid.Cells[6,i] := GetToKen(Str,',');
            Grid.Cells[7,i] := Str;
        end;

    finally
        Result := True;
        StrList.Free;
    end;
end;
{
procedure TFrmKMIPWM.SaveTheta;
var i : Integer;
    StrList : TStringList;
begin
    StrList := TStringList.Create;
    try
        for i:=1 to Grid.RowCount-1 do
        begin
            StrList.Add(Format('%s=%s,%s,%s,%s,%s,%s,%s',[Grid.Cells[0,i],
                                                          Grid.Cells[1,i],
                                                          Grid.Cells[2,i],
                                                          Grid.Cells[3,i],
                                                          Grid.Cells[4,i],
                                                          Grid.Cells[5,i],
                                                          Grid.Cells[6,i],
                                                          Grid.Cells[7,i]]));

        end;
        //StrList.SaveToFile(GetAppDir('')+'THETA.INI');
        StrList.SaveToFile(gBaseDir + 'PROJECT\THETA\' + gThetaFileName);
    finally
        StrList.Free;
    end;

end;
}
procedure TFrmKMIPWM.GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
end;

procedure TFrmKMIPWM.GridGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var nDegree : Integer;
begin
    // 30, 90, 150, 210, 270 ,330
    nDegree := StrToIntDef(Grid.Cells[1,ARow],0);
    if (nDegree = 30) or (nDegree = 90) or (nDegree = 150) or
       (nDegree = 210) or (nDegree = 270) or (nDegree = 330) then
    begin
        ABrush.Color :=  $0045D8A0;
    end;

end;

end.
