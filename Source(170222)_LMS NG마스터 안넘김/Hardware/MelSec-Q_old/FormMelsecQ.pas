unit FormMelsecQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ACTETHERLib_TLB, ExtCtrls, ZINICtrl,
  Buttons, GradFill, Spin, ComCtrls;

const
    CONNECT_ERROR = -9999;

type
  TFrmMelsecQ = class(TForm)
    INI: ZIniData;
    pnlBack: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Panel4: TPanel;
    Image6: TImage;
    Image7: TImage;
    Panel1: TPanel;
    GradientFill1: TGradientFill;
    btnConnect: TSpeedButton;
    btnClose: TButton;
    Panel5: TPanel;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Panel6: TPanel;
    Image9: TImage;
    Image10: TImage;
    Image14: TImage;
    GroupBox1: TGroupBox;
    edtHostIP: ZIniEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    pnlReadWriteValue: TPanel;
    Label11: TLabel;
    Button1: TButton;
    edtWriteDeviceName: ZIniEdit;
    SpeedButton1: TSpeedButton;
    Image8: TImage;
    StatusBar1: TStatusBar;
    memoList: TMemo;
    ActQNUDECPUTCP: TActQNUDECPUTCP;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnlReadWriteBlockValue: TPanel;
    Button2: TButton;
    edtWriteBlock: ZIniEdit;
    edtWriteBlockValue: ZIniEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    pnlReadData: TPanel;
    edtReadBlockDeviceName: ZIniEdit;
    Button3: TButton;
    cmbWriteDataType: ZIniComboBox;
    Label7: TLabel;
    cmbReadDataType: ZIniComboBox;
    Label8: TLabel;
    Label12: TLabel;
    edtReadLength: ZIniEdit;
    Button4: TButton;
    cmbWriteValue: ZIniComboBox;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    pnlReadValue: TPanel;
    edtReadDeviceName: ZIniEdit;
    Button5: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure AddList(sParam : string);
  public
    { Public declarations }
    giErrorCode: integer;

    function CommConnect(bConnect : Boolean) : Boolean;

    function SendCommand(sDeviceName: string; nValue: integer; bRead : boolean = False): integer;
    function ReadCommand(sDeviceName: string): integer;

    function ReadBlockCommand(sDeviceName: string; nLength: integer; nDataType: integer = 1): string;
    function SendBlockCommand(sDeviceName: string; sValue: string; nDataType: integer; bRead : boolean = False): string;
  end;

var
  FrmMelsecQ: TFrmMelsecQ;

implementation

uses
    GenUtils;

{$R *.dfm}

procedure TFrmMelsecQ.AddList(sParam : string);
var
    i: Integer;
begin
    if not Visible then exit;
    
    with memoList do
    begin
        if Lines.Count > 45 then
        begin
            Lines.Delete(0);
        end
        else if Lines.Count > 100 then
            Clear;

        Lines.Add(sParam);
    end;
end;

procedure TFrmMelsecQ.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
    CommConnect(False);
end;

function TFrmMelsecQ.CommConnect(bConnect : Boolean) : Boolean;
begin
    with ActQNUDECPUTCP do
    begin
        if edtHostIP.Text = '' then exit;

        giErrorCode := Close;
        StatusBar1.Panels[0].Text := '해제';

        if (bConnect) then
        begin
            ActHostAddress := edtHostIP.Text;
            ActTimeOut     := 1000;

            giErrorCode := Open;

            btnConnect.Down := (giErrorCode = 0);
            if giErrorCode = 0 then
                StatusBar1.Panels[0].Text := '연결'
            else
                MessageBox('PLC 연결안됨', '에러', MB_OK or MB_ICONERROR);
        end;
    end;
end;

procedure TFrmMelsecQ.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    AutoSize := True;
    giErrorCode := -1;
    
    CommConnect(True);
end;

procedure TFrmMelsecQ.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMelsecQ.btnConnectClick(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmMelsecQ.SpeedButton1Click(Sender: TObject);
begin
    CommConnect(False);
end;

function TFrmMelsecQ.ReadCommand(sDeviceName: string): integer;
begin
    if giErrorCode <> 0 then exit;

    Result := 0;
    with ActQNUDECPUTCP do
    begin
        GetDevice(sDeviceName, Result);
        if Result > $FFFF then
        begin
            giErrorCode := CONNECT_ERROR;
            Result := 0;
        end;
    end;
end;

function TFrmMelsecQ.SendCommand(sDeviceName: string; nValue: integer; bRead : boolean = False): integer;
begin
    if giErrorCode <> 0 then exit;

    Result := 0;
    with ActQNUDECPUTCP do
    begin
        SetDevice(sDeviceName, nValue );
        AddList( Format('TX : %s -> %d', [sDeviceName, nValue]) );
        if bRead then
        begin
            Result := ReadCommand(sDeviceName);
            AddList( Format('RX : %s -> %d', [sDeviceName, Result]) );
        end;
    end;
end;

procedure TFrmMelsecQ.Button1Click(Sender: TObject);
var
    nValue: integer;
begin
    nValue := SendCommand(edtWriteDeviceName.Text, cmbWriteValue.ItemIndex, True);
    pnlReadWriteValue.Caption := IntToStr(nValue);
end;

procedure TFrmMelsecQ.Button4Click(Sender: TObject);
begin
    memoList.Lines.Clear;
end;

procedure TFrmMelsecQ.Button5Click(Sender: TObject);
var
    nValue: integer;
begin
    nValue := ReadCommand(edtReadDeviceName.Text);
    pnlReadValue.Caption := Format('%X', [nValue]);
end;

function GetDataChar(nValue: integer): string;
begin
    if (nValue >= 32 ) then
        Result := Format('%s', [Chr( nValue )])
    else
        Result := '';
end;

function TFrmMelsecQ.ReadBlockCommand(sDeviceName: string; nLength: integer; nDataType: integer = 1): string;
var
   nWriteBuffer, nReadBuffer: array[0..$FF] of integer;
   i: integer;
begin
    if giErrorCode <> 0 then exit;

    Result := '';
    with ActQNUDECPUTCP do
    begin

        FillChar(nReadBuffer, SizeOf(nReadBuffer), 0);
        ReadDeviceBlock(sDeviceName, nLength, nReadBuffer[0]);

        case nDataType of
            0: begin  // Integer
                Result := IntToStr(nReadBuffer[0]);
            end;
            1: begin // Ascii
                for i := 0 to nLength - 1 do
                begin
                    // Result := Result + Char( Lo(nReadBuffer[i]) ) + Char( Hi(nReadBuffer[i]) );

                    Result := Result + GetDataChar(Lo(nReadBuffer[i])) + GetDataChar(Hi(nReadBuffer[i]));
                end;
            end;
        end;

        Result := Trim(Result);
        AddList( Format('RX : %s -> %s', [sDeviceName, Result]) );
    end;
end;

function TFrmMelsecQ.SendBlockCommand(sDeviceName: string; sValue: string; nDataType: integer; bRead : boolean = False): string;
var
   nWriteBuffer, nReadBuffer: array[0..$FF] of integer;
   i, nLength: integer;
begin
    if giErrorCode <> 0 then exit;

    Result := '';
    with ActQNUDECPUTCP do
    begin
        nLength := Length(sValue);
        FillChar(nWriteBuffer, SizeOf(nWriteBuffer), 0);

        case nDataType of
            0: begin // Integer
                nWriteBuffer[0] := StrToIntDef(sValue, 0);
            end;
            1: begin // Ascii
                for i := 0 to nLength - 1 do
                    nWriteBuffer[i] := Ord( sValue[i+1] );
            end;
        end;
        WriteDeviceBlock(sDeviceName, nLength, nWriteBuffer[0]);

        AddList( Format('TX : %s -> %s', [sDeviceName, sValue]) );
        if bRead then
            Result := ReadBlockCommand(sDeviceName, nLength, nDataType);
    end;
end;

procedure TFrmMelsecQ.Button2Click(Sender: TObject);
begin
    pnlReadWriteBlockValue.Caption := SendBlockCommand(edtWriteBlock.Text,
                                                       edtWriteBlockValue.Text,
                                                       cmbWriteDataType.ItemIndex,
                                                       True);
end;

procedure TFrmMelsecQ.Button3Click(Sender: TObject);
begin
    pnlReadData.Caption := ReadBlockCommand(edtReadBlockDeviceName.Text,
                                            StrToIntDef(edtReadLength.Text, 1),
                                            cmbReadDataType.ItemIndex );
end;


end.
