unit FormTos9201;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ZGPIBDev, StdCtrls, Buttons, ExtCtrls, DPBLabel, ComDrv32,
  ComCtrls, GradFill, Spin, RealSpinEdit, Math;

const
    CRLF = #13#10;

type
  TReadMode = (rmVoltage, rmCurrent, rmResistance, rmGeneral);

  TFrmTos9201 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Bevel2: TBevel;
    btnSend: TBitBtn;
    edtCommand: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    INI: ZIniData;
    Comm: TCommPortDriver;
    Label9: TLabel;
    cbPort: ZIniComboBox;
    btnConnect: TSpeedButton;
    StatusBar: TStatusBar;
    btnClose: TButton;
    GradientFill1: TGradientFill;
    memoLog: TMemo;
    Label1: TLabel;
    pcTest: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    listCommand: TListBox;
    btnSendACW: TButton;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ListBox2: TListBox;
    Button4: TButton;
    ListBox3: TListBox;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtACW_Voltage: ZIniSpinEdit;
    edtACW_Frequency: ZIniComboBox;
    cmbACW_LowerOnOff: ZIniComboBox;
    edtACW_Lower: ZIniRealSpinEdit;
    Label4: TLabel;
    edtACW_Upper: ZIniRealSpinEdit;
    Label5: TLabel;
    cmbACW_TimerOnOff: ZIniComboBox;
    edtACW_Timer: ZIniRealSpinEdit;
    Label6: TLabel;
    cmbACW_OffsetOnOff: ZIniComboBox;
    Label10: TLabel;
    edtACW_StartVoltage: ZIniSpinEdit;
    Label12: TLabel;
    edtACW_RiseTime: ZIniRealSpinEdit;
    Label13: TLabel;
    edtACW_FallTime: ZIniRealSpinEdit;
    Label18: TLabel;
    cmbACW_Range: ZIniComboBox;
    Label22: TLabel;
    cmbACW_ResponseSpeed: ZIniComboBox;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    cmbACW_Ground: ZIniComboBox;
    Label24: TLabel;
    cmbACW_ContactCheck: ZIniComboBox;
    ListBox1: TListBox;
    Label11: TLabel;
    Label15: TLabel;
    edtDCW_Voltage: ZIniSpinEdit;
    cmbDCW_LowerOnOff: ZIniComboBox;
    edtDCW_Lower: ZIniRealSpinEdit;
    Label25: TLabel;
    edtDCW_Upper: ZIniRealSpinEdit;
    Label26: TLabel;
    cmbDCW_TimerOnOff: ZIniComboBox;
    edtDCW_Timer: ZIniRealSpinEdit;
    Label28: TLabel;
    edtDCW_StartVoltage: ZIniSpinEdit;
    Label29: TLabel;
    edtDCW_RiseTime: ZIniRealSpinEdit;
    Label30: TLabel;
    edtDCW_WaitTime: ZIniRealSpinEdit;
    Label37: TLabel;
    cmbDCW_Ground: ZIniComboBox;
    Label39: TLabel;
    cmbDCW_ContactCheck: ZIniComboBox;
    Label14: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edtIR_Voltage: ZIniSpinEdit;
    cmbIR_LowerOnOff: ZIniComboBox;
    edtIR_Lower: ZIniRealSpinEdit;
    edtIR_Upper: ZIniRealSpinEdit;
    cmbIR_TimerOnOff: ZIniComboBox;
    edtIR_Timer: ZIniRealSpinEdit;
    edtIR_RiseTime: ZIniRealSpinEdit;
    edtIR_WaitTime: ZIniRealSpinEdit;
    cmbIR_Ground: ZIniComboBox;
    cmbIR_ContactCheck: ZIniComboBox;
    cmbIR_UpperOnOff: ZIniComboBox;
    Button2: TButton;
    dpbLabel1: TdpbLabel;
    lblVoltage: TdpbLabel;
    dpbLabel2: TdpbLabel;
    lblCurrent: TdpbLabel;
    dpbLabel3: TdpbLabel;
    lblResistance: TdpbLabel;
    TimerRead: TTimer;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure listCommandDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    gReadMode: TReadMode;
    giIndex: integer;
    gsReadData: string;
    gbReceiveOk, gbSendOk: boolean;

    gTxBuffer : array [0..$FF] of Byte;
    gRxBuffer : array [0..$FF] of Byte;

    procedure AddStr(sParam : String);

  public
    { Public declarations }    
    function CommConnect(bConnect : Boolean) : Boolean;
    procedure CommClear();

    function CommSend(sCommand: string): boolean;

    function GetVoltage: double;
    function GetCurrent: double;
    function GetResistance: double;
    function CommTestStart(bStartOk : Boolean) : Boolean;
  end;

var
  FrmTos9201: TFrmTos9201;

implementation

{$R *.dfm}

uses
    GenUtils;

// 통신상태를 표시한다.
procedure TFrmTos9201.AddStr(sParam : String);
var
    i: Integer;
begin
    with memoLog do
    begin
        if Lines.Count > 25 then
        begin
            Lines.Delete(0);
//            for i := 0 to Lines.Count - 10 do
//                Lines.Delete(i);
        end
        else if Lines.Count > 100 then
            Clear;

        Lines.Add(sParam);
    end;
end;

procedure TFrmTos9201.Button1Click(Sender: TObject);
begin
    memoLog.Lines.Clear;
end;

procedure TFrmTos9201.CommClear();
begin
    Comm.FlushBuffers(True, True);
end;

function TFrmTos9201.CommConnect(bConnect : Boolean) : Boolean;
begin
    Comm.Disconnect;

    if (bConnect) then
    begin
        Comm.ComPort := cbPort.ItemIndex + 1;
        Comm.Connect;
    end;
    Result := Comm.Connected;

    if Comm.Connected then
        StatusBar.Panels.Items[0].Text := Format('COM%d-CONNECTED', [Comm.ComPort])
    else
        StatusBar.Panels.Items[0].Text := 'DISCONNECT';

    CommClear;
end;

procedure TFrmTos9201.btnConnectClick(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmTos9201.SpeedButton1Click(Sender: TObject);
begin
    CommConnect(False);
end; 

procedure TFrmTos9201.btnCloseClick(Sender: TObject);
begin
    INI.SaveData;
    Close;
end;

procedure TFrmTos9201.FormCreate(Sender: TObject);
begin
    INI.LoadData;
//    btnConnect.OnClick(nil);
end;

procedure TFrmTos9201.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;    

procedure TFrmTos9201.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    sTemp: string;
begin
    sTemp := StrPas(DataPtr);

    gsReadData := GetToken(sTemp, CRLF);

    if ( Pos('.', gsReadData) > 0 ) and ( Pos('E', gsReadData) > 0 ) then
    begin
        if IsFloat(gsReadData) then
        begin
            case gReadMode of
                rmVoltage    : lblVoltage.Caption    := gsReadData;
                rmCurrent    : lblCurrent.Caption    := gsReadData;
                rmResistance : lblResistance.Caption := gsReadData;
            end;
        end;
    end;

    AddStr('< ' + gsReadData);

    gsReadData := '';
    gbReceiveOk := True;
end;

function TFrmTos9201.CommSend(sCommand: string): boolean;
begin
    Result := False;

    if gbSendOk then exit;
    gbSendOk := True;

    gbReceiveOk := False;    
    if not Comm.Connected then
    begin
        CommConnect(True);
    end
    else begin
        AddStr('>> ' + sCommand);
        Comm.SendString(sCommand + CRLF);
        {
        fTime := GetTickCountEx;
        while (GetTickCountEX - fTime) < 1000 do
        begin
            //if gbTestEndOK then break;

            if gbReceiveOk then
            begin
                Result := True;
                gbReceiveOk := False;
                break;
            end;
            Application.ProcessMessages;
        end;
        }
    end;
    gbSendOk := False;
end;

procedure TFrmTos9201.btnSendClick(Sender: TObject);
begin
   CommSend(edtCommand.text);
end;

procedure TFrmTos9201.BitBtn1Click(Sender: TObject);
var
    sTemp, sCommand: string;
begin
    sTemp := edtCommand.text;
    sCommand := Trim(GetToken(sTemp, ' '));
    CommSend(sCommand + '?');
end;              

procedure TFrmTos9201.listCommandDblClick(Sender: TObject);
var
    sTemp, sCommand: string;
begin
    with (Sender as TListBox) do
    begin
        sTemp := Trim(Items.Strings[ItemIndex]);
        sCommand := Trim(GetToKen(sTemp, ';'));
        edtCommand.Text := sCommand;

        btnSend.Click;
    end;
end;


function GetValue(ValStr : String) : Double;
const
    INVALID_VALUE = -99999;
    
var
    Value : Double;
    sVal, sExp : String;
    nExp : Integer;
begin
    // EX) Param = 0.2122E+00

    // 실수부분.
    sVal  := GetToken( ValStr, 'E');
    Value := StrToFloatDef(sVal, 0);

    // 지수부분.
    if Length(ValStr) >= 3 then
    begin
        sExp := Copy(ValStr, 2, 2);
        nExp := StrToIntDef(sExp, 0);

        if (nExp <> 0) then
            Value := Value * Power(10, nExp);
    end;

    if Value < 0     then Result := 0             else
    if Value > 99999 then Result := INVALID_VALUE else
                          Result := Value;
end;

function TFrmTos9201.GetVoltage: double;
begin
    Result := GetValue(lblVoltage.Caption);
end;

function TFrmTos9201.GetCurrent: double;
begin
    Result := GetValue(lblCurrent.Caption);
end;

function TFrmTos9201.GetResistance: double;
begin
    Result := GetValue(lblResistance.Caption);
end;

procedure TFrmTos9201.TimerReadTimer(Sender: TObject);
begin
    TimerRead.Enabled := False;

    if giIndex > 2 then
        giIndex := 0;

    gReadMode := TReadMode( giIndex );
    case gReadMode of
        rmVoltage    : CommSend( 'VDATA?' );
        rmCurrent    : CommSend( 'IDATA?' );
        rmResistance : CommSend( 'RDATA?' );
    end;

    inc( giIndex );
    TimerRead.Enabled := True;
end;

function TFrmTos9201.CommTestStart(bStartOk : Boolean) : Boolean;
begin
    TimerRead.Enabled := bStartOk;
end;

procedure TFrmTos9201.SpeedButton3Click(Sender: TObject);
begin
    giIndex := 0;
    CommTestStart(True);
end;

procedure TFrmTos9201.SpeedButton2Click(Sender: TObject);
begin
    CommTestStart(False);
end;

end.

