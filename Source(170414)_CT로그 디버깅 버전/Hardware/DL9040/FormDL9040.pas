unit FormDL9040;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ExtCtrls,
  UnitTmControl, Grids, chkgrid, ComCtrls, ToolWin, dxCore, dxButtons,
  GradFill, ValEdit, Spin, RealSpinEdit, DPBLabel;

type
  TTestMode = (tmEfficiency, tmOrderUV, tmOrderUW, tmOrderVW);

  TFrmDL9040 = class(TForm)
    INI: ZIniData;
    pnlBack: TPanel;
    Image37: TImage;
    Image8: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel4: TPanel;
    Image5: TImage;
    Image6: TImage;
    Panel17: TPanel;
    Image39: TImage;
    Image38: TImage;
    Image191: TImage;
    Panel7: TPanel;
    Image7: TImage;
    Image9: TImage;
    Image10: TImage;
    Panel1: TPanel;
    GradientFill1: TGradientFill;
    Label1: TLabel;
    btnInitial: TdxButton;
    btnConnect: TdxButton;
    btnDisconnect: TdxButton;
    BtnClose: TdxButton;
    edtSerialNo: ZIniEdit;
    Panel3: TPanel;
    StatusBar: TStatusBar;
    TimerReadValue: TTimer;
    memoReceive: TMemo;
    edtLastCommand: ZIniEdit;
    btnSend: TdxButton;
    dxButton1: TdxButton;
    dxButton3: TdxButton;
    dxButton4: TdxButton;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cmbChSelect: ZIniComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cmbChBandWidth: ZIniComboBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cmbTriggerMode: ZIniComboBox;
    Label8: TLabel;
    cmbChScale: ZIniComboBox;
    cmbTimebase: ZIniComboBox;
    cmbTriggerLevel: ZIniComboBox;
    cmbChCoupling: ZIniComboBox;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    lblValue: TdpbLabel;
    Label2: TLabel;
    btnRead: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxButton1Click(Sender: TObject);
    procedure dxButton3Click(Sender: TObject);
    procedure dxButton4Click(Sender: TObject);
    procedure TimerReadValueTimer(Sender: TObject);
    procedure btnInitialClick(Sender: TObject);
    procedure cmbChSelectChange(Sender: TObject);
    procedure cmbChBandWidthChange(Sender: TObject);
    procedure cmbChScaleChange(Sender: TObject);
    procedure cmbTimebaseChange(Sender: TObject);
    procedure cmbTriggerModeChange(Sender: TObject);
    procedure cmbTriggerLevelChange(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure cmbChCouplingChange(Sender: TObject);
  private
    { Private declarations }
    gsCommandFile: string;

    procedure AddCommandList(sCommand: string);
  public
    { Public declarations }
    gTmControl: TTmControl;

    function ReadData() : string;

    procedure MeasureStart(bOnOff: boolean);

    procedure SendCommand(sCommand: string);

    procedure SetTimebase(sValue: string);
    
    procedure SetChScale(sValue: string; nChannel: integer = 1);
    procedure SetChBandWidth(sValue: string; nChannel: integer = 1);
    procedure SetChCoupling(sValue: string; nChannel: integer = 1);
    procedure SetMeasureParam(sParam, sValue: string; nChannel: integer = 1 );

    procedure SetTriggerMode(sValue: string);
    procedure SetTriggerLevel(sValue: string; nChannel: integer = 1 );
  end;

var
  FrmDL9040: TFrmDL9040;

implementation

uses
    GenUtils, TMCTL;

{$R *.dfm}

procedure TFrmDL9040.FormCreate(Sender: TObject);
begin
    AutoSize := True;
    INI.LoadData;

    gTmControl      := TTmControl.Create(self);
    gTmControl.Memo := memoReceive;       

    btnConnect.Click;
end;

procedure TFrmDL9040.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
    gTmControl.Free;
end;

procedure TFrmDL9040.btnConnectClick(Sender: TObject);
var
    fTime : double;
begin
    fTime := GetTickCountEx;
    with gTmControl do
    begin
        Address := edtSerialNo.Text;
        if Connect(WIRE_USBTMC) then
        begin
            statusbar.Panels[0].Text := 'CONNECT';
            //btnInitial.Click;
        end
        else
            statusbar.Panels[0].Text := 'DISCONNECT';
            
         AddLog(Format('Time : %f ms', [ GetTickCountEx - fTime ]));
    end;
end;

procedure TFrmDL9040.btnDisconnectClick(Sender: TObject);
begin
    with gTmControl do
    begin
        Disconnect;
        statusbar.Panels[0].Text := 'DISCONNECT';
    end;
end;

procedure TFrmDL9040.AddCommandList(sCommand: string);
var
    i: integer;
    bFindOk: boolean;
begin
{
    bFindOk := False;

    with listCommand do
    begin
        for i := 0 to Items.Count - 1 do
        begin
             if Items[i] = sCommand then
             begin
                 bFindOk := True;
                 Break;
             end;
        end;

        if not bFindOk then
            Items.Add( sCommand );
    end;
}
end;

procedure TFrmDL9040.SendCommand(sCommand: string);
var
    sReturn: string;
begin
    edtLastCommand.Text := sCommand;
    sReturn := gTmControl.SendCommand(sCommand);
    AddCommandList( sCommand );
end;

procedure TFrmDL9040.btnSendClick(Sender: TObject);
begin
    SendCommand( edtLastCommand.Text );
end;

procedure TFrmDL9040.BtnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmDL9040.FormShow(Sender: TObject);
begin
    gsCommandFile := Format('%sCommand.Txt', [ GetAppDir('') ] );
end;

procedure TFrmDL9040.dxButton1Click(Sender: TObject);
begin
    gTmControl.Memo.Lines.Clear;
end;

function TFrmDL9040.ReadData() : string;
var
    i : Integer;
    fTime, fValue : Double;
    sResult : String;
begin
    fTime := GetTickCountEx;

    with gTmControl do
    begin
        if not gTmControl.Connected then
            btnConnect.Click;

        Memo.Clear;
        Memo.Lines.BeginUpdate;

        // 채널값을 요청.
        sResult := SendCommand(':MEASURE:TRACE1:AREA1:PTOPEAK:VALUE?');

        if sResult = '' then exit;

        if Pos(' ', sResult ) > 0 then
            GetToken(sResult, ' ');
            
        fValue := StrToFloatDef( sResult, 0) * 1000;
        lblValue.Caption := FloatToStr(fValue);
        //ListBox1.Items := gStringList;

        Memo.Lines.EndUpdate;

        AddLog(Format('Time : %f ms', [ GetTickCountEx - fTime ]));

    end;
end;      

procedure TFrmDL9040.MeasureStart(bOnOff: boolean);
begin
    TimerReadValue.Enabled := bOnOff;
end;

procedure TFrmDL9040.dxButton3Click(Sender: TObject);
begin
    MeasureStart(True);
end;

procedure TFrmDL9040.dxButton4Click(Sender: TObject);
begin
    MeasureStart(False);
end;

procedure TFrmDL9040.TimerReadValueTimer(Sender: TObject);
begin
    TimerReadValue.Enabled := False;

    ReadData;

    TimerReadValue.Enabled := True;
end;    

procedure TFrmDL9040.btnInitialClick(Sender: TObject);
begin
    SendCommand('*RST');

    SendCommand(':CHANnel1:DISPlay ON');
    SendCommand(':CHANnel2:DISPlay OFF');
    SendCommand(':CHANnel3:DISPlay OFF');
    SendCommand(':CHANnel4:DISPlay OFF');

    cmbChSelect.OnChange(nil);
    cmbChBandWidth.OnChange(nil);
    cmbChScale.OnChange(nil);
    cmbChCoupling.OnChange(nil);
    cmbTimebase.OnChange(nil);
    SendCommand(':MEASURE:TRACE1:AREA1:PTOPEAK:STATE ON');
    SendCommand(':MEASure:DISPlay ON');

end;

procedure TFrmDL9040.cmbChSelectChange(Sender: TObject);
var
    sCommand: string;
begin
    sCommand := Format(':Channel%d?', [ cmbChSelect.ItemIndex + 1 ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetChBandWidth(sValue: string; nChannel: integer = 1 );
var
    sCommand: string;
begin
    sCommand := Format(':Channel%d:BWID %s', [ nChannel, sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetChScale(sValue: string; nChannel: integer = 1 );
var
    sCommand: string;
begin
    sCommand := Format(':CHANNEL%d:VDIV %s', [ nChannel, sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetChCoupling(sValue: string; nChannel: integer = 1 );
var
    sCommand: string;
begin
    sCommand := Format(':CHANNEL%d:COUPLING %s', [ nChannel, sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetMeasureParam(sParam, sValue: string; nChannel: integer = 1 );
var
    sCommand: string;
begin
    sCommand := Format(':MEASURE:TRACE%d:AREA%d:%s:State %s', [ nChannel, nChannel, sParam, sValue ]);
    SendCommand(sCommand);
end;


procedure TFrmDL9040.SetTimebase(sValue: string);
var
    sCommand: string;
begin
    sCommand := Format(':TIMebase:TDIV %s', [ sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetTriggerMode(sValue: string);
var
    sCommand: string;
begin
    sCommand := Format(':TRIGger:MODE %s', [ sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.SetTriggerLevel(sValue: string; nChannel: integer = 1 );
var
    sCommand: string;
begin
    sCommand := Format(':TRIGger:SOURce:CHANnel%d:LEVel %s', [ nChannel, sValue ]);
    SendCommand(sCommand);
end;

procedure TFrmDL9040.cmbChBandWidthChange(Sender: TObject);
begin
    SetChBandWidth(cmbChBandWidth.Text, cmbChSelect.ItemIndex + 1 );
end;

procedure TFrmDL9040.cmbChScaleChange(Sender: TObject);
var
    sCommand: string;
    sTemp, sValue: string;
begin
    sTemp  := cmbChScale.Text;
    sValue := GetToken(sTemp, '/');
    SetChScale( sValue, cmbChSelect.ItemIndex + 1  );
end;

procedure TFrmDL9040.cmbTimebaseChange(Sender: TObject);
var
    sCommand: string;
    sTemp, sValue: string;
begin
    sTemp    := cmbTimebase.Text;
    sValue   := GetToken(sTemp, '/');
    SetTimebase(sValue);
end;     

procedure TFrmDL9040.cmbTriggerModeChange(Sender: TObject);
begin
    SetTriggerMode(cmbTriggerMode.Text);
end;

procedure TFrmDL9040.cmbTriggerLevelChange(Sender: TObject);
var
    sCommand: string;
    sTemp, sValue: string;
begin
    sTemp  := cmbTriggerLevel.Text;
    sValue := GetToken(sTemp, '/');
    SetTriggerLevel(sValue, cmbChSelect.ItemIndex + 1);
end;

procedure TFrmDL9040.btnReadClick(Sender: TObject);
begin
    ReadData;
end;

procedure TFrmDL9040.cmbChCouplingChange(Sender: TObject);
var
    sCommand: string;
begin
    sCommand  := cmbChCoupling.Text;
    SetChCoupling(sCommand, cmbChSelect.ItemIndex + 1);
end;

end.


{
:MEASURE:TRACE1:AREA1:PTOPEAK:VALUE?
:MEASURE:TRACE1:AREA1:PTOPEAK:MEAN?

:COMM:REM ON
:INITialize:EXECute
:CHANNEL2:MODE OFF
:DISPlAY:FORMAT SINGLE
:ASETup:EXECute
:ACQUIRE:RLENGTH 1000
:TIMEBASE:TDIV 0.00002
:TRIGGER:POSITION 14
:TRIGGER:SOURCE:CHANNEL1:LEVEL -0.182
:MEASURE:MODE ON
:MEASURE:CHANNEL1:RMS:STATE ON
:WAVEFORM:FORMAT ASCII

:WAVEFORM:SEND?
:MEASURE:CHANNEL1:RMS:VALUE?
}

