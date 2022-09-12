unit FrameModelChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, BaseGrid, AdvGrid, XiPanel, StdCtrls, DPBLabel, ExtCtrls,
  AMLed, ComCtrls, Spin, ZINICtrl, Buttons, XiButton;

type
  TFmeModelChange = class(TFrame)
    pnLoading: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    XiPanel19: TXiPanel;
    XiPanel4: TXiPanel;
    lbMessage: TdpbLabel;
    Panel4: TPanel;
    XiPanel2: TXiPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LED_Request: TLed;
    GroupBox3: TGroupBox;
    LED_OK: TLed;
    LED_NG: TLed;
    TimerRun: TTimer;
    Led1: TLed;
    x: TPanel;
    XiPanel1: TXiPanel;
    SpeedButton1: TSpeedButton;
    Count_Pass: ZIniSpinEdit;
    pcStatus: TPageControl;
    TabSheet1: TTabSheet;
    LbOptionModelName: TdpbLabel;
    pnLamp: TXiPanel;
    TabSheet2: TTabSheet;
    MemoLog: TMemo;
    XiButton1: TXiButton;
    procedure LoadingGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure TimerRunTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gPastMessge : String;
    procedure DisplayTestStatus(Param : String);
    function Addlog(Param : String; bSetMsg : Boolean): Boolean;
    function SetMessage(Param : string; aFontColor : TColor) : Boolean;    
  end;

implementation

{$R *.dfm}

uses GenUtils, FormMain;

procedure TFmeModelChange.LoadingGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFmeModelChange.TimerRunTimer(Sender: TObject);
begin
    TimerRun.Enabled := False;
    TimerRun.Enabled := True;
end;


function TFmeModelChange.SetMessage(Param : string; aFontColor : TColor) : Boolean;
begin
    Result := False;
    lbMessage.Caption := Param;
    lbMessage.Font.Color := aFontColor;
    Result := True;
end;

function TFmeModelChange.Addlog(Param : String; bSetMsg : Boolean): Boolean;
var
    sTemp : string;
begin
    Result := False;

    sTemp := Param;
    if sTemp = gPastMessge then exit;

    gPastMessge := sTemp;
    
    if bSetMsg then
        SetMessage(sTemp,clRed);

    if MemoLog.Lines.Count > 10000 then
        MemoLog.Lines.Delete(0);

    sTemp := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + ' >> ' + sTemp;
    MemoLog.Lines.Add(sTemp);

    WriteDebugStr(sTemp);

    Result := True;
end;

procedure TFmeModelChange.DisplayTestStatus(Param : String);
begin
//TLamp = (ts_None, ts_Ready, ts_Init, ts_Idle, ts_Running, ts_Good, ts_Fail, ts_Stop);
    Param := UpperCase(Param);

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
        Caption := Param;
    end;
end;





procedure TFmeModelChange.Button2Click(Sender: TObject);
var
    sDemoBarcode : string;
begin
    DisplayTestStatus('READY');

    LED_Request.LedOn := True;
    DelayEx(200,True);
    LED_Request.LedOn := False;

    Addlog('Read Barcode',True);
    DelayEx(200,True);
    DisplayTestStatus('RUNNING');
    DelayEx(200,True);
    sDemoBarcode := FormatDateTime('YYMMDDHHNNSS', Now);
    DelayEx(200,True);
    Addlog('Barcode : ' + sDemoBarcode,True);
    DelayEx(200,True);
    Addlog('Barcode Read OK',True);
    DelayEx(200,True);
    DelayEx(200,True);
    Addlog('GOOD',True);
    DelayEx(200,True);
    DisplayTestStatus('GOOD');
    DelayEx(200,True);
end;

procedure TFmeModelChange.SpeedButton1Click(Sender: TObject);
begin
    Count_Pass.Value := 0;
end;

procedure TFmeModelChange.XiButton1Click(Sender: TObject);
begin
    ListOption[2].Show;
end;

end.
