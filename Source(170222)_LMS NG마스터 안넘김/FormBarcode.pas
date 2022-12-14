unit FormBarcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, ExtCtrls, StdCtrls, Buttons, ComDrv32, Spin, ComCtrls,
  XiButton, DPBLabel, XiPanel;

type
  TFrmBarcode = class(TForm)
    ListBoxRx: TListBox;
    INI: ZIniData;
    Comm: TCommPortDriver;
    GroupBox1: TGroupBox;
    BtnClear: TSpeedButton;
    Ed_LenStart: ZIniSpinEdit;
    Cb_LengthLimit: ZIniCheckBox;
    Ed_LenEnd: ZIniSpinEdit;
    Label2: TLabel;
    Cb_UseTrigger: ZIniCheckBox;
    Ed_StartChar: ZIniEdit;
    Label3: TLabel;
    Label4: TLabel;
    Ed_EndChar: ZIniEdit;
    StatusBar: TStatusBar;
    Cb_RemoveDuplicate: ZIniCheckBox;
    Cb_PreRead: ZIniCheckBox;
    BtnReadBarcode: TXiButton;
    Ed_TimeOut: ZIniSpinEdit;
    Lb_Msg: TdpbLabel;
    Label5: TLabel;
    Label6: TLabel;
    XiPanel1: TXiPanel;
    BtnConnect: TXiButton;
    BtnDisConnect: TXiButton;
    Label1: TLabel;
    Ed_PortConfig: ZIniEdit;
    ChkCRLF: ZIniCheckBox;
    ChkChar: ZIniCheckBox;
    btn100: TButton;
    btunStop: TButton;
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure BtnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnReadBarcodeClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisConnectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn100Click(Sender: TObject);
    procedure btunStopClick(Sender: TObject);
  private
    { Private declarations }
    RxStr : String;
  public
    { Public declarations }
    nIdx : integer;
    gsBarcode: string;
    function CommConnect(Param: String): Boolean;
    function CommDisConnect: Boolean;

    function GetBarcode() : String;
    procedure GetBarcodeEx();
    procedure Addlog(Param : string);
  end;

//var
//  FrmBarcode: TFrmBarcode;

implementation

uses
    GenUtils, StrUtils;



{$R *.dfm}

function HexStrToStr(param : String) : String;
var TempStr : String;
begin
    Result := '';
    while (param <> '' ) do begin
        TempStr := GetTokenTrim(param, ' ');
        if Length(TempStr) < 3 then
            Result := Result + Char(HexToIntDef(TempStr, 0));
    end;
end;


procedure TFrmBarcode.GetBarcodeEx();
var fTime : Double;
    OldCursor : TCursor;
    sCommand: string;
begin
    gsBarcode := '';
    Lb_Msg.Caption := '?????? SCAN??...';

    // START CHARACTER ????.
    if Cb_UseTrigger.Checked then
    begin
        sCommand := Ed_StartChar.Text;
        sCommand := HexStrToStr(sCommand);
        Comm.SendString(sCommand);
    end;

    if not Cb_PreRead.Checked then
        BtnClearClick(nil);
end;



function TFrmBarcode.GetBarcode() : String;
var fTime : Double;
    OldCursor : TCursor;
    sCommand: string;
    i : integer;
begin
    Result := '';

    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
        Lb_Msg.Caption := '?????? SCAN??...';

        if not Cb_PreRead.Checked then
            BtnClearClick(nil);

        // START CHARACTER ????.
        if Cb_UseTrigger.Checked then
        begin
            sCommand := Ed_StartChar.Text;
            if not ChkChar.Checked then
            begin
                if not ChkCRLF.Checked then
                    sCommand := HexStrToStr(sCommand)
                else
                    sCommand := sCommand + CRLF;
            end;

            Comm.SendString(sCommand);
            //DelayEx(100,True);
        end;

 {
//        fTime := GetTickCountEx;
        for i  := 0 to 1000000 do
        begin
            if ListBoxRx.Count > 0 then begin
                Result := ListBoxRx.Items[0];
                break;
                if Cb_PreRead.Checked  then
                    ListBoxRx.Items.Delete(0);
                if Result <> '' then
                break;
            end;
            Application.ProcessMessages;
        end;
        //until (GetTickCountEX - fTime < Ed_TimeOut .Value);
          }


        fTime := GetTickCountEx;
        while (GetTickCountEX - fTime < Ed_TimeOut .Value) do
        begin
            Application.ProcessMessages;
            if ListBoxRx.Count > 0 then begin
                Result := ListBoxRx.Items[0];

                if Cb_PreRead.Checked  then
                    ListBoxRx.Items.Delete(0);
                break;
            end;
            Application.ProcessMessages;
        end;

        if Result = '' then
            Lb_Msg.Caption := '?????? ????.';

        // END CHARACTER ????.
        if Cb_UseTrigger.Checked then
        begin
            sCommand := Ed_EndChar.Text;
            sCommand := HexStrToStr(sCommand);
            Comm.SendString(sCommand);
        end;
    finally
        Screen.Cursor := OldCursor;// crDefault;
    end;
end;

function TFrmBarcode.CommConnect(Param : String) : Boolean;
var Str : String;
begin
    CommDisConnect;

    // ???????? ????????.
    // Param = COM1-9600-8-N-1
    with Comm do
    begin
        // ???????? ????????.
        // Param = COM1-9600
        Param := UpperCase(Param);
        Str := GetToken(Param, '-');
        GetToken(Str, 'COM');

       // // SET COMPORT
       // Str := GetToken(Param, '-');
        Comport      := StrToIntDef( GetToken(Str, '-') , 1);

        // SET PORTSPEED
        ComPortSpeed := StrToIntDef( GetToken(Param, '-'), 9600);

        // SET DATABITS
        Str := GetToken(Param, '-');
        if Str = '5' then ComPortDataBits := db5BITS else
        if Str = '6' then ComPortDataBits := db6BITS else
        if Str = '7' then ComPortDataBits := db7BITS else
                          ComPortDataBits := db8BITS;

        // SET PARITY
        Str := GetToken(Param, '-');
        if Str = 'EVEN'  then ComPortParity := ptEVEN  else
        if Str = 'ODD'   then ComPortParity := ptODD   else
        if Str = 'MARK'  then ComPortParity := ptMARK  else
        if Str = 'SPACE' then ComPortParity := ptSPACE else
                              ComPortParity := ptNONE;

        // SET STOPBITS
        Str := GetToken(Param, '-');
        if Str = '2'   then ComPortStopBits := sb2BITS     else
        if Str = '1.5' then ComPortStopBits := sb1HALFBITS else
                            ComPortStopBits := sb1BITS;

        // SET STOPBITS
        Str := GetToken(Param, '-');
        if Str = 'XON/XOFF'   then ComPortSwHandshaking := shXONXOFF else
                                   ComPortSwHandshaking := shNONE;

    end;

    Comm.Connect;
    if Comm.Connected then
        StatusBar.Panels[0].Text := Format('COM%d CONNECTED', [Comm.ComPort])
    else
        MessageBox(Format('?????? ????????(COM%d)?? OPEN?? ?? ????????.', [Comm.ComPort]), '????', MB_OK or MB_ICONERROR);
end;

function TFrmBarcode.CommDisConnect() : Boolean;
begin
    Comm.Disconnect;
    StatusBar.Panels[0].Text := 'DISCONNECT';
end;

procedure TFrmBarcode.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    sBarcode : String;
begin
    RxStr :='';
    RxStr := RxStr + StrPas(DataPtr);

    //FrmMain.FScrew.gsBarcode := '';

    while Pos(CRLF, RxStr) > 0 do
    begin
        sBarcode := '';
        sBarcode := GetToken(RxStr, CRLF);
        if sBarcode = '' then continue;

        // ?????? ?????? ????.
        if Cb_LengthLimit.Checked then begin
            if (Length(sBarcode) < Ed_LenStart.Value) or
               (Length(sBarcode) < Ed_LenStart.Value) then
            begin
                Lb_Msg.Caption := '???????????? ???? [' + sBarcode + ']';
                continue;
            end;
        end;

        // ?????????? ????
        if Cb_RemoveDuplicate.Checked then begin
            if ListBoxRx.Items.IndexOf(sBarcode) >=0 then begin
                Lb_Msg.Caption := '?????????? [' + sBarcode + ']';
                continue;
            end;
        end;

        // ?????? ????.
        ListBoxRx.ItemIndex := ListBoxRx.Items.Add(sBarcode);
        Lb_Msg.Caption := Format('?????? ???? [%s]', [sBarcode]);
        gsBarcode := sBarcode;

//        FrmMain.FScrew.gsBarcode := '';
    end;
end;

procedure TFrmBarcode.BtnClearClick(Sender: TObject);
begin
    RxStr := '';
    ListBoxRx.Items.Clear;
end;

procedure TFrmBarcode.FormCreate(Sender: TObject);
begin
//    INI.LoadData;
//    BtnConnectClick(Sender);
end;

procedure TFrmBarcode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmBarcode.BtnReadBarcodeClick(Sender: TObject);
begin
    Caption := GetBarcode;
end;

procedure TFrmBarcode.BtnConnectClick(Sender: TObject);
begin
    CommConnect(Ed_PortConfig.Text);
end;

procedure TFrmBarcode.BtnDisConnectClick(Sender: TObject);
begin
    CommDisConnect;
end;

procedure TFrmBarcode.FormDestroy(Sender: TObject);
begin
    //INI.SaveData;
end;

procedure TFrmBarcode.btn100Click(Sender: TObject);
var
    i : integer;
    fTime : double;
    sString : string;
    bResult : Boolean;
begin
    btn100.Enabled := False;
    bResult := True;
    Addlog('========================================== TEST START ==========================================');
    Addlog('================================================================================================');
    for i :=  1 to 100 do
    begin
        fTime := GetTickCountEx;
        sString := GetBarcode;
        if (not btunStop.Enabled) then
        begin
            btn100.Enabled   := True;
            btunStop.Enabled := True;
            Addlog('?????????? ????????');
            exit;
        end;

        DelayEx(100,True);
        if (sString = '') then sString := GetBarcode;
        if (sString = '') then sString := GetBarcode;
        if (sString = '') then
        begin
                bResult := False;
                sString := 'NOREAD';
        end;
        Addlog(IntToStr(i) + ' : ' + sString);

        //Addlog(FloatToStr((GetTickCountEx - fTime)));
    end;

    ShowMessage(IfThen(bResult , 'GOOD', 'FAIL'));
    Addlog('================================================================================================');
    btn100.Enabled := True;
end;

procedure TFrmBarcode.Addlog(Param : string);
var Str, filename : string;
begin
    if (ListBoxRx.Items.Count > 100) then
        ListBoxRx.Items.Delete(0);

    ListBoxRx.Items.Add(Param);
    filename := GetAppDir('LOG')+ 'BARCODE\' + FormatDateTime('YY-MM', Now) + '\Debug' +
                    FormatDateTime('YYMMDD', Now) + '.txt';


    WriteDebugStr(Param, filename);
end;

procedure TFrmBarcode.btunStopClick(Sender: TObject);
begin
        if (not btn100.Enabled) then
                btunStop.Enabled := False;
end;

end.
