unit FormPLZ1004W;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ZGPIBDev, StdCtrls, Buttons, ExtCtrls, DPBLabel, ComDrv32,
  ComCtrls, GradFill, Spin, RealSpinEdit, Math;

const
    CRLF = #13#10;

type
  TReadMode = (rmVoltage, rmCurrent, rmWatt, rmGeneral);

  TFrmPLZ1004W = class(TForm)
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
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    rdoLoadOnOff: ZIniRadioGroup;
    rdoMode: ZIniRadioGroup;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    edtCurrent: ZIniRealSpinEdit;
    edtVoltage: ZIniRealSpinEdit;
    dpbLabel1: TdpbLabel;
    lblCurrent: TdpbLabel;
    dpbLabel4: TdpbLabel;
    lblVoltage: TdpbLabel;
    dpbLabel7: TdpbLabel;
    lblWatt: TdpbLabel;
    TimerRead: TTimer;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    procedure rdoLoadOnOffClick(Sender: TObject);
    procedure edtVoltageChange(Sender: TObject);
    procedure edtCurrentChange(Sender: TObject);
    procedure rdoModeClick(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    gReadMode: TReadMode;
    giIndex : integer;
    gsReadData: string;

    giRxCount: integer;
    gbReceiveOk, gbSendOk: boolean;

    gTxBuffer : array [0..$FF] of Byte;
    gRxBuffer : array [0..$FF] of Byte;

    procedure AddStr(sParam : String);
    procedure IsCommand(sCommand: string);

  public
    { Public declarations }
    function CommConnect(bConnect : Boolean) : Boolean;
    procedure CommClear();

    function CommSend(sCommand: string): boolean;

    function GetVoltage: double;
    function GetCurrent: double;
    function GetWatt: double;
    function CommTestStart(bStartOk : Boolean) : Boolean;
  end;

var
  FrmPLZ1004W: TFrmPLZ1004W;

implementation

{$R *.dfm}

uses
    GenUtils;

// 통신상태를 표시한다.
procedure TFrmPLZ1004W.AddStr(sParam : String);
var
    i: Integer;
begin
    with memoLog do
    begin
        if Lines.Count > 25 then
        begin
            Lines.Delete(0);
            //for i := 0 to Lines.Count - 10 do
            //    Lines.Delete(i);
        end
        else if Lines.Count > 100 then
            Clear;

        Lines.Add(sParam);
    end;
end;

procedure TFrmPLZ1004W.Button1Click(Sender: TObject);
begin
    memoLog.Lines.Clear;
end;

procedure TFrmPLZ1004W.CommClear();
begin
    Comm.FlushBuffers(True, True);
end;

function TFrmPLZ1004W.CommConnect(bConnect : Boolean) : Boolean;
begin
    Comm.Disconnect;

    if (bConnect) then
    begin
        Comm.ComPort := cbPort.ItemIndex + 1;
        Comm.Connect;
    end;
    Result := Comm.Connected;

    if Comm.Connected then
    begin
        Comm.SendString('FUNC CC' + CRLF);
        StatusBar.Panels.Items[0].Text := Format('COM%d-CONNECTED', [Comm.ComPort]);
    end
    else
        StatusBar.Panels.Items[0].Text := 'DISCONNECT';

    CommClear;
end;

procedure TFrmPLZ1004W.btnConnectClick(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmPLZ1004W.SpeedButton1Click(Sender: TObject);
begin
    CommConnect(False);
end; 

procedure TFrmPLZ1004W.btnCloseClick(Sender: TObject);
begin
    INI.SaveData;
    Close;
end;

procedure TFrmPLZ1004W.FormCreate(Sender: TObject);
begin
    INI.LoadData;
 //   btnConnect.OnClick(nil);
end;

procedure TFrmPLZ1004W.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
end;


procedure TFrmPLZ1004W.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    i : Integer;
    sReadData: string;
begin
    for i := 0 to DataSize - 1 do
    begin
        if giRxCount > High(giRxCount) then exit;

        if giRxCount >= 0 then
            gRxBuffer[giRxCount] := Byte((PChar(DataPtr) + i)^);

        Inc(giRxCount);
    end;

    gsReadData := '';
    for i := 0 to giRxCount - 1 do
        gsReadData := Trim(Format('%s%s', [gsReadData, Char(gRxBuffer[i])]));

    if IsFloat(gsReadData) then
    begin
        case gReadMode of
            rmVoltage : lblVoltage.Caption := gsReadData;
            rmCurrent : lblCurrent.Caption := gsReadData;
            rmWatt    : lblWatt.Caption    := gsReadData;
        end;
    end;                                  

    AddStr('<< ' + gsReadData);

    giRxCount := 0;
    gbReceiveOk := True;
end;

function TFrmPLZ1004W.CommSend(sCommand: string): boolean;
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
    end;
    gbSendOk := False;
end;

procedure TFrmPLZ1004W.btnSendClick(Sender: TObject);
begin
   CommSend(edtCommand.text);
end;

procedure TFrmPLZ1004W.BitBtn1Click(Sender: TObject);
var
    sTemp, sCommand: string;
begin
    sTemp := edtCommand.text;
    sCommand := Trim(GetToken(sTemp, ' '));
    CommSend(sCommand + '?');
end;              

procedure TFrmPLZ1004W.listCommandDblClick(Sender: TObject);
var
    i: integer;
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

procedure TFrmPLZ1004W.IsCommand(sCommand: string);
begin
   if Trim(sCommand) = '' then exit;
   CommSend(sCommand);
end;     

procedure TFrmPLZ1004W.rdoLoadOnOffClick(Sender: TObject);
begin
    CommSend( rdoLoadOnOff.Items[ rdoLoadOnOff.ItemIndex ] );
end;

procedure TFrmPLZ1004W.edtVoltageChange(Sender: TObject);
begin
    CommSend( Format('VOLT %f', [edtVoltage.Value] ) );
end;

procedure TFrmPLZ1004W.edtCurrentChange(Sender: TObject);
begin
    CommSend( Format('CURR %f', [edtCurrent.Value] ) );
end;

procedure TFrmPLZ1004W.rdoModeClick(Sender: TObject);
begin
    CommSend( Format('FUNC %s', [ rdoMode.Items[rdoMode.ItemIndex] ] ) );
end;

procedure TFrmPLZ1004W.TimerReadTimer(Sender: TObject);
begin
    TimerRead.Enabled := False;

    if giIndex > 2 then
        giIndex := 0;

    gReadMode := TReadMode( giIndex );
    case gReadMode of
        rmVoltage : CommSend( 'MEAS:VOLT?' );
        rmCurrent : CommSend( 'MEAS:CURR?' );
        rmWatt    : CommSend( 'MEAS:POW?'  );
    end;

    inc( giIndex );

    TimerRead.Enabled := True;
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

function TFrmPLZ1004W.GetVoltage: double;
begin
    Result := GetValue(lblVoltage.Caption);
end;

function TFrmPLZ1004W.GetCurrent: double;
begin
    Result := GetValue(lblCurrent.Caption);
end;

function TFrmPLZ1004W.GetWatt: double;
begin          
    Result := GetValue(lblWatt.Caption);
end;

function TFrmPLZ1004W.CommTestStart(bStartOk : Boolean) : Boolean;
begin
    giIndex := 0;
    TimerRead.Enabled := bStartOk;
end;

procedure TFrmPLZ1004W.SpeedButton3Click(Sender: TObject);
begin
    CommTestStart(True);
end;

procedure TFrmPLZ1004W.SpeedButton2Click(Sender: TObject);
begin
    CommTestStart(False);
end;

end.

