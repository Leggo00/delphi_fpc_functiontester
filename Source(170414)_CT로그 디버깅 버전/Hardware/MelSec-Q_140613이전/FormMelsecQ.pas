unit FormMelsecQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ACTETHERLib_TLB, ExtCtrls, ZINICtrl,
  Buttons, GradFill, Spin, ComCtrls, IniFiles, Math, SyncObjs;

const
    CONNECT_ERROR = -9999;

type
  TPLCReadThread = class(TThread)
  private
    { Private declarations }
  protected
    sDevName : String;
    nLength     : Integer;

    procedure Execute; override;
  end;

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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    memoList: TMemo;
    memoDeviceList: TMemo;
    Label15: TLabel;
    edtStateDeviceName: ZIniEdit;
    Label16: TLabel;
    edtStateLength: ZIniEdit;
    btnReadStart: TSpeedButton;
    TimerRead: TTimer;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
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
    procedure TimerReadTimer(Sender: TObject);
    procedure btnReadStartClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    PLCReadThread : TPLCReadThread;
    procedure AddList(sParam : string);
  public
    { Public declarations }

    function CommConnect(bConnect : Boolean) : Boolean;

    function SendCommand(sDeviceName: string; nValue: integer; bRead : boolean = False): integer;
    function ReadCommand(sDeviceName: string): integer;

    function ReadCommandEx(sDeviceName: string): integer;

    function ReadBlockCommand(sDeviceName: string; nLength: integer; nDataType: integer = 1): string;
    function SendBlockCommand(sDeviceName: string; sValue: string; nDataType: integer; bRead : boolean = False): string;

    procedure ReadPlcBitStart(bOnOff: boolean);
  end;

var
  FrmMelsecQ: TFrmMelsecQ;
  PLCAccess : TCriticalSection;

  giErrorCode: integer;
  gDeviceList: THashedStringList;

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
    TimerRead.Enabled := False;

    PLCReadThread.Terminate;
    Sleep(100);

    INI.SaveData;
    CommConnect(False);
    gDeviceList.Free;


    PLCReadThread.Free;
    PLCAccess.Free;
end;

function TFrmMelsecQ.CommConnect(bConnect : Boolean) : Boolean;
begin
    with ActQNUDECPUTCP do
    begin
        ReadPlcBitStart(False);
        
        if edtHostIP.Text = '' then exit;

        giErrorCode := Close;
        StatusBar1.Panels[0].Text := '해제';

        if (bConnect) then
        begin
            ActHostAddress := edtHostIP.Text;
            ActTimeOut     := 500;

            giErrorCode := Open;

            btnConnect.Down := (giErrorCode = 0);
            if giErrorCode = 0 then
            begin
                ReadPlcBitStart(True);
                StatusBar1.Panels[0].Text := '연결';
            end;

        end;
    end;
end;

procedure TFrmMelsecQ.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    AutoSize := True;
    giErrorCode := -1;

    gDeviceList := THashedStringList.Create;


    PLCAccess := TCriticalSection.Create;
    PLCReadThread := TPLCReadThread.Create(True);

    CommConnect(True);
    PLCReadThread.Resume;
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
    PLCAccess.Acquire;
    try
        with ActQNUDECPUTCP do
        begin
            GetDevice(sDeviceName, Result);
            if Result > $FFFF then
            begin
                giErrorCode := CONNECT_ERROR;
                Result := 0;
            end;
        end;
    finally
        PLCAccess.Release;
    end;
end;

function TFrmMelsecQ.SendCommand(sDeviceName: string; nValue: integer; bRead : boolean = False): integer;
var fTime : Double;
begin
    if giErrorCode <> 0 then exit;

    Result := 0;
    fTime := GetTickCountEX;

    PLCAccess.Acquire;
    try
        with ActQNUDECPUTCP do
        begin
            SetDevice(sDeviceName, nValue );
            AddList( Format('TX : %s -> %d', [sDeviceName, nValue]) );
            //if bRead then
            //begin
                //Result := ReadCommand(sDeviceName);
                //AddList( Format('RX : %s -> %d', [sDeviceName, Result]) );
            //end;
        end;
    finally
        PLCAccess.Release;
    end;
    caption := FloatToStr(GetTickCountEX - fTime);
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

    PLCAccess.Acquire;
    try
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
                        Result := Result + GetDataChar(Lo(nReadBuffer[i])) + GetDataChar(Hi(nReadBuffer[i]));
                end;
            end;

            Result := Result;
            AddList( Format('RX : %s -> %s', [sDeviceName, Result]) );
        end;
    finally
        PLCAccess.Release;
    end;

end;

function TFrmMelsecQ.SendBlockCommand(sDeviceName: string; sValue: string; nDataType: integer; bRead : boolean = False): string;
var
   nWriteBuffer, nReadBuffer: array[0..$FF] of integer;
   nTempByte: array[0..$FF] of byte;
   i, nLength, nCount, nCount1: integer;
begin
    if giErrorCode <> 0 then exit;

    result := '';
    PLCAccess.Acquire;
    try
        with actqnudecputcp do
        begin
            nlength := length(svalue);
            fillchar(nwritebuffer, sizeof(nwritebuffer), 0);
            fillchar(ntempbyte, sizeof(ntempbyte), #0);


            case ndatatype of
                0: begin // integer
                    nwritebuffer[0] := strtointdef(svalue, 0);
                end;
                1: begin // ascii
                    for i := 0 to nlength - 1 do
                        ntempbyte[i] := ord( svalue[i+1] );

                    for i := 0 to nlength - 1 do
                        nwritebuffer[i] := pinteger(@ntempbyte[(i * 2)])^;
                end;
            end;
            writedeviceblock(sdevicename, nlength, nwritebuffer[0]);

            addlist( format('tx : %s -> %s', [sdevicename, svalue]) );
            if bread then
                result := readblockcommand(sdevicename, (nlength div 2) + 1, ndatatype);
        end;
    finally
        PLCAccess.Release;
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

function Dec2Bin(Value: Longint): string;
const
    BITSIZE = 16;
var
    sBuffer: string;
    i, nLoop, nPos, nCount: Integer;
    nValue, nTemp: Extended;
begin
    sBuffer := '';
    for i := 1 to BITSIZE do
        sBuffer := sBuffer + '0';

    nValue  := Value;

    for nLoop := BITSIZE downto 1 do
    begin
        nTemp := Power(2, nLoop - 1);

        if nValue >= nTemp then
        begin
            nValue := nValue - nTemp;
            sBuffer[(BITSIZE + 1) - nLoop] := '1';
        end
    end;

    nPos := Pos('1', sBuffer);

    nCount := Length(sBuffer) mod 4;

    if nCount > 0 then
    begin
        nCount := 4 - nCount;

        for nLoop := 1 to nCount do
            sBuffer := '0' + sBuffer;
    end;

    Result := sBuffer;
end;

procedure TFrmMelsecQ.TimerReadTimer(Sender: TObject);
var
   nReadBuffer: array[0..$FF] of integer;
   i, j, nLength, nDevice: integer;
   sDeviceName, sValue: string;
begin
    TimerRead.Enabled := False;
      {
    if giErrorCode <> 0 then exit;

    with ActQNUDECPUTCP do
    begin
        FillChar(nReadBuffer, SizeOf(nReadBuffer), 0);
        sDeviceName := edtStateDeviceName.Text;
        nLength := StrToIntDef(edtStateLength.Text, 1);
        ReadDeviceBlock(sDeviceName, nLength, nReadBuffer[0]);

        GetToken(sDeviceName, 'L');
        nDevice := StrToIntDef(sDeviceName, 0);
        for i := 1 to nLength do
        begin
             sValue := Dec2Bin( nReadBuffer[i - 1] );
             for j := 1 to 16 do
             begin // Bit
                 sDeviceName := IntToStr(nDevice);
                 gDeviceList.Values[ Format('L%s', [ sDeviceName ]) ] := sValue[17-j];
                 Inc(nDevice);
             end;
        end;
    end;
        }
    PLCAccess.Acquire;
    if Visible then begin
        memoDeviceList.Lines.BeginUpdate;
        memoDeviceList.Lines := gDeviceList;
        memoDeviceList.Lines.EndUpdate;
    end;
    PLCAccess.Release;

         {
    TimerRead.Tag := (TimerRead.Tag + 1) mod 2;
    SendCommand('L998', TimerRead.Tag);
          }
    TimerRead.Enabled := True;
end;

function TFrmMelsecQ.ReadCommandEx(sDeviceName: string): integer;
begin
    Result := -1;
    if giErrorCode <> 0 then exit;
    if gDeviceList.Count <= 0 then exit;

    PLCAccess.Acquire;
    Result := StrToIntDef(gDeviceList.Values[sDeviceName], -1);
    PLCAccess.Release;
end;

procedure TFrmMelsecQ.ReadPlcBitStart(bOnOff: boolean);
begin
    if edtStateDeviceName.Text = '' then exit;

    gDeviceList.Clear;
    TimerRead.Enabled := bOnOff;

    if (bOnOff) then begin
        PLCReadThread.sDevName := edtStateDeviceName.Text;
        PLCReadThread.nLength  := StrToIntDef(edtStateLength.Text, 1);
//        PLCReadThread.Resume;
    end else begin
//        PLCReadThread.Suspend;
    end;
end;

procedure TFrmMelsecQ.btnReadStartClick(Sender: TObject);
begin
    ReadPlcBitStart(True);
end;

procedure TFrmMelsecQ.SpeedButton3Click(Sender: TObject);
begin
    ReadPlcBitStart(False);
end;

{ TPLCReadThread }

procedure TPLCReadThread.Execute;
var
   nReadBuffer: array[0..$FF] of integer;
   i, j, nDevice: integer;
   sDeviceName, sValue: string;
begin
    inherited;

    // 쓰레드가 주기적으로 돌면서 
    while not Terminated do
    begin
        if giErrorCode = 0 then
        begin
            PLCAccess.Acquire;

            sDeviceName := sDevName;

            FillChar(nReadBuffer, SizeOf(nReadBuffer), 0);

            FrmMelsecQ.ActQNUDECPUTCP.ReadDeviceBlock(sDeviceName, nLength, nReadBuffer[0]);

            GetToken(sDeviceName, 'B');
            nDevice := StrToIntDef(sDeviceName, 0);
            for i := 1 to nLength do
            begin
                 sValue := Dec2Bin( nReadBuffer[i - 1] );
                 for j := 1 to 16 do
                 begin // Bit
                     sDeviceName := IntToHex(nDevice, 3);
                     gDeviceList.Values[ Format('B%s', [ sDeviceName ]) ] := sValue[17-j];
                     Inc(nDevice);
                 end;
            end;
            PLCAccess.Release;
        end;
        Sleep(100);
    end;
end;

end.
