unit FormWT330;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  ZGPIBDev, DPBLabel, Spin, Math, Grids, FormDevice;

type
  TFrmWT330 = class(TFrmDevice)
    Panel1: TPanel;
    INI: ZIniData;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StatusBar: TStatusBar;
    Panel2: TPanel;
    BtnInit: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Comm: TCommPortDriver;
    Label2: TLabel;
    CmbComport: ZIniComboBox;
    TimerMeas: TTimer;
    Grid: TStringGrid;
    Cb_Repeat: TCheckBox;
    BtnMeas: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BtnClear: TSpeedButton;
    BtnSend: TBitBtn;
    Edit_Send: ZIniEdit;
    MemoRX: TMemo;
    TabSheet2: TTabSheet;
    MemoInit: TMemo;
    dpbLabel1: TdpbLabel;
    EdtScale: ZIniEdit;
    Ed_Interval: ZIniSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure TimerMeasTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMeasClick(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Cb_RepeatClick(Sender: TObject);
  private
    { Private declarations }
    TxStr, RxStr : String;
    ReceiveData : String;
    bWaitComm : Boolean;

    procedure AddLog(Param : String);
    procedure DecodeData(RdStr: String);
    function  CommWait(nTimeout : Integer = 1000) : Boolean;
  public
    { Public declarations }
    function  CommConnect(bOnOff : Boolean) : Boolean;
    procedure CommInit();
    function  CommSend( Param : String ) : String;
    
    //------------------------------------------------------------
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;
  end;

var
  FrmWT330: TFrmWT330;

implementation

uses
    GenUtils;

{$R *.dfm}

procedure TFrmWT330.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerMeas.Enabled := False;
    INI.SaveData;
end;

function TFrmWT330.CommConnect(bOnOff : Boolean) : Boolean;
begin
    With Comm do
    begin
        if bOnOff then
        begin
            ComPort := CmbComport.ItemIndex + 1;

            ComPortSpeed := 57600;
            ComPortDataBits := db8BITS;
            ComPortParity := ptNONE;
            ComPortStopBits := sb1BITS;
            ComPortSwHandshaking := shNONE;

            Connect;

            if Connected then 
            begin
                StatusBar.Panels[0].Text := Format('COM%d-CONNECT', [ComPort]);
                Result := True;
            end;
        end else
        begin
            Disconnect;
            Result := False;
            StatusBar.Panels[0].Text := 'DISCONNECT';
        end;
    end;
    AddLog(StatusBar.Panels[0].Text);
end;


procedure TFrmWT330.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := UpperCase( Edit_Send.Text );
    if SendMsg = '' then exit;

    CommSend( SendMsg );
end;

procedure TFrmWT330.SpeedButton1Click(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmWT330.SpeedButton2Click(Sender: TObject);
begin
    CommConnect(False);
end;


procedure TFrmWT330.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;

procedure TFrmWT330.CommInit();
begin
    MemoRX.Clear;
    CommSend('*RST');
    DelayEx(3000, True);
    //CommSend(':MEAS:ITEM:PRESET');
    //1~4번 전압 설정
    CommSend(':NUMERIC:NORMAL:ITEM1 U,1');
    CommSend(':NUMERIC:NORMAL:ITEM2 U,2');
    CommSend(':NUMERIC:NORMAL:ITEM3 U,3');
    CommSend(':NUMERIC:NORMAL:ITEM4 U,SIGM');
    DelayEx(20, True);
    //1~4번 전류 설정
    CommSend(':NUMERIC:NORMAL:ITEM5 I,1');
    CommSend(':NUMERIC:NORMAL:ITEM6 I,2');
    CommSend(':NUMERIC:NORMAL:ITEM7 I,3');
    CommSend(':NUMERIC:NORMAL:ITEM8 I,SIGM');  
    DelayEx(20, True);
    //1~4번 W설정
    CommSend(':NUMERIC:NORMAL:ITEM9 P,1');
    CommSend(':NUMERIC:NORMAL:ITEM10 P,2');
    CommSend(':NUMERIC:NORMAL:ITEM11 P,3');
    CommSend(':NUMERIC:NORMAL:ITEM12 P,SIGM'); 
    DelayEx(20, True);
    //1~4번 PF 설정
    CommSend(':NUMERIC:NORMAL:ITEM13 LAMBda,1');
    CommSend(':NUMERIC:NORMAL:ITEM14 LAMBda,2');
    CommSend(':NUMERIC:NORMAL:ITEM15 LAMBda,3');
    CommSend(':NUMERIC:NORMAL:ITEM16 LAMBda,SIGM'); 
    DelayEx(20, True);
    //1~4번 VHz 설정
    CommSend(':NUMERIC:NORMAL:ITEM17 FU,1');
    CommSend(':NUMERIC:NORMAL:ITEM18 FU,2');
    CommSend(':NUMERIC:NORMAL:ITEM19 FU,3');
    CommSend(':NUMERIC:NORMAL:ITEM20 FU,SIGM');   
    DelayEx(20, True);
    //가져올 ITEM 갯수 설정
    CommSend(':NUMERIC:NORMAL:NUMBER 20');     
    DelayEx(20, True);
    //DISPLAY 설정
    CommSend(':DISPLAY:NORMAL:ITEM1 I,1');
    CommSend(':DISPLAY:NORMAL:ITEM2 I,2');
    CommSend(':DISPLAY:NORMAL:ITEM3 I,3');
    CommSend(':DISPLAY:NORMAL:ITEM4 I,SIGM');    
    DelayEx(20, True);
    //input MODE DC
    CommSend(':INPUT:MODE DC');               
    DelayEx(20, True);
    //D/A Output
    CommSend(':AOUTPUT:NORMAL:CHANNEL1 I,1');
    CommSend(':AOUTPUT:NORMAL:CHANNEL2 I,2');
    CommSend(':AOUTPUT:NORMAL:CHANNEL3 I,3');    
    DelayEx(20, True);
    //current range setting
//    :INPUT:CFACTOR 6
//    0.25
    commsend(':INPUT:CFACTOR 6');            
    DelayEx(20, True);
    commsend(':INPUT:CURRENT:RANGE 0.25');
    DelayEx(20, True);
    //input scale state on
    CommSend(':INPUT:SCALING:STATE ON');
    DelayEx(20, True);
    //input scale 2000 (ct current)
    CommSend(':INPUT:SCALING:CT:ALL 2000');
    DelayEx(20, True);

    //CommSend(':MEAS:ITEM:PF:ALL ON');
end;

procedure TFrmWT330.BtnInitClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmWT330.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrmWT330.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrmWT330.CommSend( Param : String ) : String;
var
    fWaitTime, fTime : Double;
    bRTS : Boolean;
begin
    TxStr := Param + CRLF;

    AddLog('> ' + TxStr);
    {Comm.SendString(TxStr + CRLF);  }

    // Toggle시간을 계산한다.
    fWaitTime := Length(TxStr) / ( Comm.ComPortSpeed / 10 ) * 1000 + 2;

    Comm.ToggleRTS(True);

    fTime := GetTickCountEX;
    Comm.SendData( PChar(TxStr), Length(TxStr) );

    while (GetTickCountEX - fTime < fWaitTime) do; // 전송완료까지 대기.
    Comm.ToggleRTS(False);

    bRTS := False;

    bWaitComm := True;
    RxStr := '';
    ReceiveData := '';
end;

function TFrmWT330.CommWait(nTimeout : Integer = 1000) : Boolean;
var nTime : Integer;
begin
    nTime := GetTickCount;
    while (GetTickCount - nTime < nTimeOut) do begin
        if (not bWaitComm) then begin
            Result := True;
            exit;
        end;
        Application.ProcessMessages;
    end;
end;

function GetValue(ValStr : String) : Double;
var
    Value : Double;
    sVal, sExp : String;
    nExp : Integer;
begin
    if not TryStrToFloat(ValStr, Result) then
        Result := 0;
end;

procedure TFrmWT330.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    RxStr := RxStr + StrPas(DataPtr);

    if Pos(CRLF, RxStr ) > 0 then
    begin
        ReceiveData := GetToken(RxStr, CRLF);
        AddLog('< ' + ReceiveData);

        //if (ReceiveData = 'MEAS
        //DecodeData(ReceiveData);

        bWaitComm := False;
    end;
end;


procedure TFrmWT330.SpeedButton3Click(Sender: TObject);
begin
    Close();
end;

procedure TFrmWT330.DecodeData(RdStr : String);
var
    i, nCol, nRow : Integer;
    fValue : Double;
    Str, sData : String;
begin
    nCol := 1;
    nRow := 1;
    while (RdStr <> '') do begin
        Str := GetToken(RdStr, ',');
        Grid.Cells[nCol, nRow] := FloatToStr( StrToFloatDef(Str, -9999) );
        Inc(nCol);
        if nCol > 4 then begin
            nCol := 1;
            Inc(nRow);
        end;
    end;
end;

procedure TFrmWT330.TimerMeasTimer(Sender: TObject);
begin
    TimerMeas.Enabled := False;
    BtnMeasClick(Sender);
    
    TimerMeas.Interval := Ed_Interval.Value;
    TimerMeas.Enabled := Cb_Repeat.Checked;
end;

procedure TFrmWT330.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    CommConnect(True);
    DelayEx(1000, True);
    CommInit();

    with Grid do begin
        Cells[1, 0] := 'ELEMENT 1';
        Cells[2, 0] := 'ELEMENT 2';
        Cells[3, 0] := 'ELEMENT 3';
        Cells[4, 0] := 'SIGMA';

        Cells[0, 1] := 'V';
        Cells[0, 2] := 'A';
        Cells[0, 3] := 'W';
        Cells[0, 4] := 'PF';
        Cells[0, 5] := 'HZ';
    end;

    TimerMeas.Interval := Ed_Interval.Value;
    TimerMeas.Enabled := Cb_Repeat.Checked;
end;

procedure TFrmWT330.BtnMeasClick(Sender: TObject);
begin
    BtnMeas.Enabled := False;

    CommSend(':NUMERIC:NORMAL:VALUE?');
    CommWait;
    DecodeData(ReceiveData);

    BtnMeas.Enabled := True;
end;

procedure TFrmWT330.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Str : String;
begin
    Str := Grid.Cells[ACol, ARow];

    Grid.Canvas.FillRect(Rect);
    DrawText(Grid.Canvas.Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TFrmWT330.Cb_RepeatClick(Sender: TObject);
begin
    TimerMeas.Interval := Ed_Interval.Value;
    TimerMeas.Enabled := Cb_Repeat.Checked;
end;

              

//------------------------------------------------------------------------------
function TFrmWT330.DevOpen(Param: String): Integer;
begin
    Comm.Disconnect;
    Comm.ComPort := CmbComport.ItemIndex + 1;
    Comm.ComPortSpeed := 57600;
    Comm.Connect;

    if Comm.Connected then
        StatusBar.SimpleText := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.SimpleText := 'DISCONNECT';

    AddLog(StatusBar.SimpleText);
    DevInit('');
end;
//------------------------------------------------------------------------------
function TFrmWT330.DevClose(Param: String): Integer;
begin
    Comm.Disconnect;
    StatusBar.SimpleText := 'DISCONNECT';
    AddLog(StatusBar.SimpleText);
end;
//------------------------------------------------------------------------------
function TFrmWT330.DevInit(Param: String): Integer;
begin
    bWaitComm := False;
    Comm.FlushBuffers(True, True);

    CommInit();
   // DevSend('*RST');
    {DevSend(':MEAS:ITEM:PRESET');
    DevSend(':MEAS:ITEM:PF:ALL ON');
    DevSend(':MEAS:ITEM:VHZ:ALL ON');  }
end;
//------------------------------------------------------------------------------
function TFrmWT330.DevRead(Param: String): String;
var fValue, fTime  : Double;
    nCol, nRow : Integer;
begin
    Result := 'N/A';

    {DevSend(':NUMERIC:NORMAL:VALUE?');
    fTime := GetTickCountEX;
    while (GetTickCountEX - fTime < 1000) do begin
        if not bWaitComm then break;
        Application.ProcessMessages;
        Sleep(1);
    end;     }

    BtnMeasClick(Self);

    //if (not bWaitComm) then
    //begin
        nCol := StrToIntDef( GetToken(Param, ','), 0);
        nRow := StrToIntDef( GetToken(Param, ','), 0);

        if (nCol < 1) or (nCol >= Grid.ColCount) then exit;
        if (nRow < 1) or (nRow >= Grid.RowCount) then exit;

        fValue := StrToFloatDef(Grid.Cells[nCol, nRow], -9999);
        Result := FormatFloat('0.####', fValue);
    //end;
    bWaitComm := False;
end;

//------------------------------------------------------------------------------
function TFrmWT330.DevSend(Param: String): Integer;
begin
    if (not Comm.Connected) then exit;

    CommSend(Param);
    {TxStr := Param;
    RxStr := '';

    if Comm.Connected then
    begin
        MemoRX.Lines.Add('> ' + TxStr);
        Comm.SendString(TxStr + CRLF);

        if Pos('?', TxStr) > 0 then begin
            bWaitComm := True;
            TimerOut.Enabled := True;
        end;
    end;    }
end;



end.
