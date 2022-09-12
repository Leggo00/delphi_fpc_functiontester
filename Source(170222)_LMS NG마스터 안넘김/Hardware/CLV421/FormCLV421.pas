unit FormCLV421;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ZGPIBDev, StdCtrls, Buttons, ExtCtrls, DPBLabel, ComDrv32,
  ComCtrls, GradFill, Spin;

type
  TFrmCLV421 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Bevel2: TBevel;
    btnSend: TBitBtn;
    edtCommand: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    iniMarking: ZIniData;
    Comm: TCommPortDriver;
    Label9: TLabel;
    cbPort: ZIniComboBox;
    btnConnect: TSpeedButton;
    StatusBar: TStatusBar;
    btnClose: TButton;
    GradientFill1: TGradientFill;
    memoLog: TMemo;
    Label1: TLabel;
    lbl1: TLabel;
    listCommand: TListBox;
    edtBarcode: TEdit;
    lbl2: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure listCommandDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    giRxCount: integer;
    gbReceiveOk, gbSendOk: boolean;

    gRxBuffer : array [0..31] of Byte;

    procedure AddStr(sParam : String);
  public
    { Public declarations }
    function CommConnect(bConnect : Boolean) : Boolean;
    procedure CommClear();

    function CommSend(sCommand: string): string;
  end;

const
     _STX = 2;
     _ETX = 3;

var
  FrmCLV421: TFrmCLV421;

implementation

{$R *.dfm}

uses
    GenUtils, FormStart;

// 통신상태를 표시한다.
procedure TFrmCLV421.AddStr(sParam : String);
var
    i: Integer;
begin
    with memoLog do
    begin
        if Lines.Count > 100 then
        begin
            for i := 0 to Lines.Count - 50 do
                Lines.Delete(i);
        end
        else if Lines.Count > 100 then
            Clear;

        Lines.Add(sParam);
    end;
end;

procedure TFrmCLV421.Button1Click(Sender: TObject);
begin
    memoLog.Lines.Clear;
end;


procedure TFrmCLV421.CommClear();
begin
    Comm.FlushBuffers(True, True);
end;

function TFrmCLV421.CommConnect(bConnect : Boolean) : Boolean;
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

procedure TFrmCLV421.btnConnectClick(Sender: TObject);
begin
    CommConnect(not Comm.Connected);
end;

procedure TFrmCLV421.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCLV421.FormCreate(Sender: TObject);
begin
    iniMarking.LoadData;
//    btnConnect.OnClick(nil);
end;

procedure TFrmCLV421.FormDestroy(Sender: TObject);
begin
    iniMarking.SaveData;
end;

procedure TFrmCLV421.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    i : Integer;
    sData: string;
begin
    FillChar(gRxBuffer, SizeOf(gRxBuffer), 0);
    edtBarcode.Text := '';
    for i := 0 to DataSize - 1 do
    begin
        if giRxCount > High(giRxCount) then exit;

        if giRxCount >= 0 then
            gRxBuffer[giRxCount] := Byte((PChar(DataPtr) + i)^);

        Inc(giRxCount);
    end;

    edtBarcode.Text := '';
    sData := '';
    for i := 0 to giRxCount - 1 do
        sData := Trim(Format('%s%s', [sData, Char(gRxBuffer[i])]));

    if (giRxCount > 4) and
       (gRxBuffer[0] = _STX) and (gRxBuffer[giRxCount - 1] = _ETX) then
    begin
        gbReceiveOk := True;
        edtBarcode.Text := sData;
    end;

    giRxCount := 0;
    AddStr('<< ' + sData);
end;

function TFrmCLV421.CommSend(sCommand: string): string;

    function HexStrToStr(param : String) : String;
    var
        TempStr : String;
    begin
        Result := '';
        while (param <> '' ) do
        begin
            TempStr := GetTokenTrim(param, ' ');
            if Length(TempStr) < 3 then
                Result := Result + Char(HexToIntDef(TempStr, 0));
        end;
    end;

var
    nStartTime: integer;
    i, nRetryCount: integer;
    sTemp : string;
begin
    Result := '';

    if gbSendOk then exit;
    gbSendOk := True;

    gbReceiveOk := False;

    if Comm.Connected then
    begin
        sTemp := '';
        for i := 1 to Length(sCommand) do
            sTemp := Trim(Format('%s %s', [sTemp, IntToHex(Ord(sCommand[i]), 2)]));

        sCommand := Format('%.2d %s %.2d', [_STX, sTemp, _ETX]);

        AddStr('>> ' + sCommand);
        sCommand := HexStrToStr(sCommand);
        Comm.SendData(PChar(sCommand), Length(sCommand));

        nStartTime := GetTickCount;
        while True do
        begin
            if GetTickCount - nStartTime >= 500 then
            begin
                Break;
            end;

            if gbReceiveOk then
            begin
                gbReceiveOk := False;
                Result := edtBarcode.Text;
                edtBarcode.Text := '';
                break;
            end;
            Application.ProcessMessages;
        end;

    end;
    gbSendOk := False;
end;

procedure TFrmCLV421.btnSendClick(Sender: TObject);
begin
    CommSend(edtCommand.text);
end;

procedure TFrmCLV421.listCommandDblClick(Sender: TObject);
var
    i: integer;
    sTemp: string;
begin
    sTemp := Trim(listCommand.Items.Strings[listCommand.ItemIndex]);
    edtCommand.Text := Trim(GetToKen(sTemp, ':'));
    btnSend.Click;
end;

end.
