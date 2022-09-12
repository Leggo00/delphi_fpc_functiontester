unit FormWT210;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZINICtrl, ExtCtrls, ComDrv32, ComCtrls,
  ZGPIBDev, DPBLabel, Spin, Math, Grids;

type
  TFrmWT230 = class(TForm)
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
  end;

var
  FrmWT230: TFrmWT230;

implementation

uses
    GenUtils;

{$R *.dfm}

procedure TFrmWT230.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerMeas.Enabled := False;
    INI.SaveData;
end;

function TFrmWT230.CommConnect(bOnOff : Boolean) : Boolean;
begin
    With Comm do
    begin
        if bOnOff then
        begin
            ComPort := CmbComport.ItemIndex + 1;

            ComPortSpeed := 9600;
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


procedure TFrmWT230.BtnSendClick(Sender: TObject);
var
    i : Integer;
    SendMsg : String;
begin
    SendMsg := Trim(UpperCase( Edit_Send.Text ));
    if SendMsg = '' then exit;

    CommSend( SendMsg );
end;

procedure TFrmWT230.SpeedButton1Click(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmWT230.SpeedButton2Click(Sender: TObject);
begin
    CommConnect(False);
end;


procedure TFrmWT230.Edit_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnSendClick(Sender);
        Key := 0;
    end;
end;

procedure TFrmWT230.CommInit();
begin
    MemoRX.Clear;
    CommSend('*RST');
    CommSend(':MEAS:ITEM:PRESET');
    CommSend(':MEAS:ITEM:PF:ALL ON');
    CommSend(':MEAS:ITEM:VHZ:ALL ON');


end;

procedure TFrmWT230.BtnInitClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmWT230.BtnClearClick(Sender: TObject);
begin
    MemoRX.Clear;
end;

procedure TFrmWT230.AddLog(Param : String);
begin
    with MemoRX.Lines do begin
        if Count > 100 then Delete(0);
        Add(Param);
    end;
end;

function TFrmWT230.CommSend( Param : String ) : String;
begin
    TxStr := Param;

    AddLog('> ' + TxStr);
    Comm.SendString(TxStr + CRLF);

    bWaitComm := True;
    RxStr := '';
    ReceiveData := '';
end;

function TFrmWT230.CommWait(nTimeout : Integer = 1000) : Boolean;
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

procedure TFrmWT230.CommReceiveData(Sender: TObject; DataPtr: Pointer;
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


procedure TFrmWT230.SpeedButton3Click(Sender: TObject);
begin
    Close();
end;

procedure TFrmWT230.DecodeData(RdStr : String);
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

procedure TFrmWT230.TimerMeasTimer(Sender: TObject);
begin
    TimerMeas.Enabled := False;
    BtnMeasClick(Sender);
    TimerMeas.Enabled := Cb_Repeat.Checked;
end;





procedure TFrmWT230.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    CommConnect(True);
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
end;

procedure TFrmWT230.BtnMeasClick(Sender: TObject);
begin
    BtnMeas.Enabled := False;

    CommSend(':MEAS:NORMAL:VALUE?');
    CommWait;
    DecodeData(ReceiveData);

    BtnMeas.Enabled := True;
end;

procedure TFrmWT230.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Str : String;
begin
    Str := Grid.Cells[ACol, ARow];

    Grid.Canvas.FillRect(Rect);
    DrawText(Grid.Canvas.Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TFrmWT230.Cb_RepeatClick(Sender: TObject);
begin
    TimerMeas.Enabled := Cb_Repeat.Enabled;
end;

end.
