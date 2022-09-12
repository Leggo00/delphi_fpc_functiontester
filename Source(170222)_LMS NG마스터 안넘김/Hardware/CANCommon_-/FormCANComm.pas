//------------------------------------------------------------------------------
//
//  KMI CAN 수정버젼 09.06.29.
//
//------------------------------------------------------------------------------
unit FormCANComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, ZINICtrl, Driver, ImgList,
  ScieCalc, ComDrv32, Spin, DPBLabel, ZComm, AMLed, uCanUnit, Menus, uCanKMI;

const
  KMI_FRAME_HEADER = $55;
  MAX_FRAME_COUNT  = 16;
  MAX_BUFF         = 512;

  CAN_VERSION      = 'V090624';

type
  //----------------------------------------------------------------------------
  TFrmCANComm = class(TForm)
    V: TPanel;
    BtnClose: TSpeedButton;
    StatusBar: TStatusBar;
    INI: ZIniData;
    Label6: TLabel;
    ComboPort: ZIniComboBox;
    Label9: TLabel;
    ScieCalc: TScieCalc;
    BtnCommConnect: TSpeedButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label1: TLabel;
    BtnConnect1: TSpeedButton;
    BtnDisConnect1: TSpeedButton;
    BtnClear1: TSpeedButton;
    GroupBox2: TGroupBox;
    BtnConnect2: TSpeedButton;
    BtnDisConnect2: TSpeedButton;
    BtnClear2: TSpeedButton;
    Edit_Data1: TEdit;
    BtnSend1: TSpeedButton;
    Edit_Data2: TEdit;
    BtnSend2: TSpeedButton;
    BtnCommDisconnect: TSpeedButton;
    Label8: TLabel;
    Edit_CardID: ZIniSpinEdit;
    BtnCodeClear: TSpeedButton;
    BtnRead: TSpeedButton;
    RadioType1: ZIniRadioGroup;
    RadioType2: ZIniRadioGroup;
    ListViewTx1: TListView;
    ListViewRx1: TListView;
    ListViewTx2: TListView;
    ListViewRx2: TListView;
    TimerCANRead: TTimer;
    Led_CAN1: TLed;
    Led_CAN2: TLed;
    Label2: TLabel;
    Cb_BaudRate1: ZIniComboBox;
    Cb_BaudRate2: ZIniComboBox;
    Label3: TLabel;
    SaveDialog: TSaveDialog;
    GroupBox3: TGroupBox;
    MemoLog: TMemo;
    CheckBoxRead: TCheckBox;
    Edit_Interval: ZIniSpinEdit;
    CheckBox_Log: TCheckBox;
    CheckBox_AutoType: TCheckBox;
    CheckBoxSave: TCheckBox;
    LedRun: TLed;
    CheckBox_Change: TCheckBox;
    CommPortDriver1: TCommPortDriver;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerCANReadTimer(Sender: TObject);
    procedure BtnCommConnectClick(Sender: TObject);
    procedure BtnCommDisconnectClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCodeClearClick(Sender: TObject);
    procedure CheckBox_ChangeClick(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure CheckBoxSaveClick(Sender: TObject);
    procedure CheckBoxReadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    nCommMode  : Integer;
    fStartTime : Double;

    CanConnected : array[1..2] of Boolean;
    SaveFile : String;

    procedure AddStr(Param : String);
    procedure AddCANMsg(ListView : TListView; CanMsg : TCANMessage; bTxMode : Boolean);
  public
    { Public declarations }
    CanUnit : TCanUnit;

    procedure CommCreate(Sender: TObject);

    function  OpenCAN (nPort: Integer; fBaudRate: Double; nType : Integer = 0) : Boolean;
    procedure CloseCAN(nPort: Integer);
    procedure ClearCAN(nPort: Integer);
    function  ReadCAN (nPort: Integer; SpcID : Integer = -1) : Integer;
    procedure SendCAN (nPort: Integer; Param : String; bOnOff : Boolean = True);

    // 2009.4.20일 추가.
    function  FindMsg(nPort : Integer; CanID : Integer): TCANMessage;
  end;

var
   FrmCANComm : TFrmCANComm;

implementation

uses GenUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
// CAN PORT를 OPEN 한다.
function  TFrmCANComm.OpenCAN(nPort: Integer; fBaudRate: Double; nType : Integer = 0) : Boolean;
var Buff : array of Byte;
    BTR0, BTR1 : Byte;
    iTemp: Integer;
    Str : String;
    CbBaud : ZIniComboBox;
    RGType   : ZIniRadioGroup;
    nBaudRata: integer;
    i: integer;
    fTime : Double;
    Led : TLed;
begin
    Result := False;
    if CanUnit = nil then exit;

    fTime := GetTickCountEX;

    case nPort of
        1 : begin
            CbBaud   := Cb_BaudRate1;
            RGType   := RadioType1;
            Led      := Led_CAN1;

            ListViewTx1.Clear;
            ListViewRx1.Clear;
        end;
        2: begin
            CbBaud   := Cb_BaudRate2;
            RGType   := RadioType2;
            Led      := Led_CAN2;

            ListViewTx2.Clear;
            ListViewRx2.Clear;
        end;
        else
            exit;
    end;
    // Baudrate설정.

    CbBaud.Text := FormatFloat('0.##', fBaudRate);
    for i := 0 to CbBaud.Items.Count - 1 do
        if fBaudRate = StrToFloatDef( CbBaud.Items.Strings[i], 500) then
        begin
            CbBaud.ItemIndex := i;
            Break;
        end;

    // CAN TYPE 설정.HIGH/LOW.
    case nType of
        0: begin
            // 0 이면 화면상에서 선택한 Speed을 따름.
            if CheckBox_AutoType.Checked then begin
                if  fBaudRate > 125 then RGType.ItemIndex := 0
                                    else RGType.ItemIndex := 1;
            end;
        end;
        1: RGType.ItemIndex := 0; // High.
        2: RGType.ItemIndex := 1; // Low.
    end;

    CanConnected[nPort] := CanUnit.Open(nPort, fBaudRate, '');
    if CanConnected[nPort] then
        Str := Format('CAN%d Open', [nPort])
    else
        Str := Format('CAN%d Open Fail!!', [nPort]);

    StatusBar.panels[nPort].Text := Str;

    Result := CanConnected[nPort];
    Led.LedOn := Result;

    fTime := GetTickCountEX - fTime;
    AddStr(Format('%s (%f ms)', [Str, fTime]));
end;

//------------------------------------------------------------------------------
// CAN PORT를 CLOSE 한다.
procedure TFrmCANComm.CloseCAN(nPort: Integer);
var Ret : Boolean;
    Str : String;
    fTime : Double;
begin
    if (CanUnit = nil) then exit;

    fTime := GetTickCountEX;

    Ret := CanUnit.Close(nPort);
    StatusBar.panels[nPort].Text := 'DISCONNECT';

    CanConnected[nPort] := False;
    case nPort of
        1 : Led_CAN1.LedOn := False;
        2 : Led_CAN2.LedOn := False;
    end;

    if Ret then Str := Format('CAN%d Close', [nPort])
           else Str := Format('CAN%d Close Fail!!', [nPort]);
           
    fTime := GetTickCountEX - fTime;
    AddStr(Format('%s (%f ms)', [Str, fTime]));
end;

//------------------------------------------------------------------------------
// CAN PORT를 CLEAR 한다.
procedure TFrmCANComm.ClearCAN(nPort: Integer);
begin
    if (CanUnit = nil) then exit;
    CanUnit.Clear(nPort);

    case nPort of
        1: begin
            ListViewTx1.Clear;
            ListViewRx1.Clear;
        end;
        2: begin
            ListViewTx2.Clear;
            ListViewRx2.Clear;
        end;
    end;
end;

//------------------------------------------------------------------------------
function TFrmCANComm.FindMsg(nPort : Integer; CanID : Integer): TCANMessage;
var i, j : Integer;
    RdStr : String;
    SelItem: TListItem;
    ListView : array [1..2] of TListView;
begin
    Result.CanID := -1;

    case nPort of
        1: begin ListView[1] := ListViewTx1; ListView[2] := ListViewRx1; end;
        2: begin ListView[1] := ListViewTx2; ListView[2] := ListViewRx2; end;
        else
            exit;
    end;

    // TX & RX 메세지에서 데이터를 찾는다.
    for j:= 1 to 2 do
    begin
        for i := 0 to ListView[j].Items.Count - 1 do
        begin
            SelItem := ListView[j].Items[i];
            if (CanID = HexToIntDef(SelItem.Caption, 0) ) then
            begin
                RdStr := Format('%x=%s:%s', [CanId, SelItem.SubItems[0], SelItem.SubItems[1]]);
                Result := StrToCanMsg(RdStr);
                exit;
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
// CAN Message를 전송한다.
procedure TFrmCANComm.SendCAN(nPort: Integer; Param : String; bOnOff : Boolean = True);
var fTime : Double;
    CanMsg  : TCANMessage;
begin
    if (CanUnit = nil) or (not (nPort in [1,2])) then exit;


    // EX) Param := '4B0=87 01:0'
    fTime := GetTickCountEX;
    try
        CanMsg := StrToCanMsg(Param);
    except
        ShowMessage('Error');
    end;
    AddStr(Format('CAN%d Send (%f ms)', [nPort, GetTickCountEx-fTime ]));
    
    CanUnit.Send(nPort, CanMsg);

    case nPort of
        1 : AddCANMsg(ListViewTx1, CanMsg, True);
        2 : AddCANMsg(ListViewTx2, CanMsg, True);
    end;
end;

//------------------------------------------------------------------------------
function TFrmCANComm.ReadCAN(nPort: Integer; SpcID : Integer = -1) : Integer;
var Buff : array of Byte;
    i, idx, nCount : Integer;
    ListBox : TListBox;
    Str : String;
    CanMsg : TCANMessage;
    fTime : Double;
    WtStr : String;
    f: TextFile;
begin
    Result := 0;
    if (CanUnit = nil) or (not (nPort in [1,2])) then exit;

    fTime := GetTickCountEx;

    nCount := CanUnit.Read(nPort);

    AddStr(Format('CAN%d Read : %d (%f ms)', [nPort, nCount, GetTickCountEx-fTime ]));
    StatusBar.Panels[2 + nPort].Text := 'READ : ' + IntToStr(nCount);


    // 메세지를 화면에 표시한다.
    for i:= 0 to CanUnit.RxCount-1 do
    begin
        AddCANMsg(ListViewRx1, CanUnit.RxMessages[i], False);

        // File Save...
        if (CheckBoxSave.Checked) and (SaveFile <> '') then
        begin
            AssignFile (f, SaveFile);
            try
                if FileExists (SaveFile) then Append (f)
                                         else ReWrite(f);

                with CanUnit.RxMessages[i] do
                    WtStr := Format('%x,%s,%f', [CanID, MakeHexaString(@Data[0], DLC), TimeStamp]);
                WriteLn (f, WtStr);
                Flush (f);
            finally
                CloseFile (f);
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.AddCANMsg(ListView : TListView; CanMsg : TCANMessage; bTxMode : Boolean);
var i, nCycle : Integer;
    IDStr, DataStr, CycleStr, TimeStr : String;
    SelItem : TListItem;
    fOldTime : Double;
begin
    IDStr   := Format('%x', [CanMsg.CanID]);
    DataStr := Trim(MakeHexaString(@CanMsg.Data[0], CanMsg.DLC));
    TimeStr := Format('%f', [CanMsg.TimeStamp]);

    SelItem := nil;
    for i:= 0 to ListView.Items.Count-1 do begin
        if (ListView.Items[i].Caption = IDStr) then begin
            SelItem := ListView.Items[i];
            break;
        end;
    end;

    if (SelItem = nil) then begin
        SelItem := ListView.Items.Add;
        SelItem.Caption := IDStr;
        SelItem.SubItems.Add(DataStr);
        SelItem.SubItems.Add(IntToStr(CanMsg.nCycle));
        SelItem.SubItems.Add(TimeStr);
    end else begin
        SelItem.Caption := IDStr;
        SelItem.SubItems[0] := DataStr;

        if (bTxMode) then begin
            SelItem.SubItems[1] := IntToStr(CanMsg.nCycle);
        end else begin
            fOldTime := StrToFloatDef(SelItem.SubItems[2], 0);
            nCycle := Round(CanMsg.TimeStamp - fOldTime);
//            if (nCycle >= 0) and (nCycle < 5000) then
                SelItem.SubItems[1] := IntToStr(nCycle)
//            else
//                SelItem.SubItems[1] := '0';
        end;
        
        //SelItem.SubItems[1] := IntToStr(CanMsg.nCycle);
        SelItem.SubItems[2] := TimeStr;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnCloseClick(Sender: TObject);
begin
    Close();
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.CommCreate(Sender: TObject);
var i : Integer;
begin
    CheckBox_Change.Checked := False;
    CheckBox_ChangeClick(Sender);

    BtnCommConnectClick(Sender);

    Caption := Caption + ' ' + CAN_VERSION;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.FormCreate(Sender: TObject);
var i : Integer;
begin
    CanUnit := TKmiCAN.Create;


    ComboPort.Clear;

    for i:= 1 to 32 do
        ComboPort.Items.Add( Format('COM%d', [i]));
    INI.LoadData;

    CheckBox_Change.Checked := False;
    CheckBox_ChangeClick(Sender);

    Caption := Caption + ' ' + CAN_VERSION;

    BtnCommConnectClick(Sender);
end;

procedure TFrmCANComm.FormDestroy(Sender: TObject);
begin
    CanUnit.Free;
    CanUnit := nil;
end;

procedure TFrmCANComm.TimerCANReadTimer(Sender: TObject);
begin
    TimerCANRead.Enabled := False;

    LedRun.LedOn := not LedRun.LedOn;
    
    if CheckBoxRead.Checked then
        BtnReadClick(Sender);


    TimerCANRead.Interval := Edit_Interval.Value;
    TimerCANRead.Enabled  := CheckBoxRead.Checked;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnCommConnectClick(Sender: TObject);
var nPort : Integer;
    Str : String;
begin
    if (CanUnit <> nil) then begin
        nPort := ComboPort.ItemIndex + 1;
        if CanUnit.OpenDevice(nPort, Edit_CardID.Value, 0) then
        begin
            Str := Format('COM%d - Connected', [nPort]);
        end else begin
            Str := 'DISCONNECT';
        end;
        StatusBar.panels[0].Text := Str;
        AddStr(Str);
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnCommDisconnectClick(Sender: TObject);
begin
    StatusBar.panels[0].Text := 'DISCONNECT';
    AddStr('DISCONNECT');

    if (CanUnit <> nil) then
    begin
        CanUnit.Close(1);
        CanUnit.Close(2);

        CanUnit.CloseDevice;
    end;
end;

//------------------------------------------------------------------------------
// 통신상태를 표시한다.
procedure TFrmCANComm.AddStr(Param : String);
begin
    if (CheckBox_Log.Checked) and (Visible) then
    begin
        if MemoLog.Lines.Count > 30 then
            MemoLog.Lines.Delete(0);
        MemoLog.Lines.Add('[' + FormatDateTime('HH:NN:SS.ZZZ', Now) + '] ' + Param);
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnConnectClick(Sender: TObject);
var fBaudrate : Double;
begin
    if (Sender is TComponent) then
    begin
        case (Sender as TComponent).tag of
            1: begin
                fBaudrate := StrToFloatDef(Cb_BaudRate1.Text, 500);
                OpenCAN(1, fBaudrate);
            end;
            2: begin
                fBaudrate := StrToFloatDef(Cb_BaudRate2.Text, 500);
                OpenCAN(2, fBaudrate);
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnDisConnectClick(Sender: TObject);
var fBaudrate : Double;
begin
    if (Sender is TComponent) then
    begin
        case (Sender as TComponent).tag of
            1: begin CloseCAN(1); end;
            2: begin CloseCAN(2); end;
        end;
    end;
end;
//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnClearClick(Sender: TObject);
begin
//    TKmiCAN(CanUnit).ResetTime(1);// KmiCAN.ClearTime(nChannel : Integer) : Integer;

    if (Sender is TComponent) then
        ClearCAN( (Sender as TComponent).tag );
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnSendClick(Sender: TObject);
var Idx : Integer;
begin
    if (Sender is TComponent) then
    begin
        case (Sender as TComponent).tag of
            1: SendCAN(1, Edit_Data1.Text);
            2: SendCAN(2, Edit_Data2.Text);
        end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

//------------------------------------------------------------------------------
procedure TFrmCANComm.BtnCodeClearClick(Sender: TObject);
begin
    MemoLog.Clear;
end;
//------------------------------------------------------------------------------
procedure TFrmCANComm.CheckBox_ChangeClick(Sender: TObject);
var bEnabled : Boolean;
begin
    bEnabled := CheckBox_Change.Checked;

    ComboPort.Enabled      := bEnabled;
    Edit_CardID.Enabled    := bEnabled;
    Cb_BaudRate1.Enabled   := bEnabled;
    Cb_BaudRate2.Enabled   := bEnabled;
    RadioType1.Enabled     := bEnabled;
    RadioType2.Enabled     := bEnabled;
end;

procedure TFrmCANComm.BtnReadClick(Sender: TObject);
var i, id : Integer;
begin
 //   if CheckBox_Log.Checked then MemoLog.Clear;

    // 특정 CAN ID가 있는경우에는 특정ID만 읽는다.
    //id := HexToIntDef( Edit1.Text, -1);
    id := $188;
    if CanConnected[1] then ReadCAN(1, id);
    if CanConnected[2] then ReadCAN(2, id);
end;

procedure TFrmCANComm.CheckBoxSaveClick(Sender: TObject);
begin
    SaveFile := '';
    CheckBoxSave.Font.Color := clBlack;

    if CheckBoxSave.Checked then
    begin
        SaveDialog.FileName := '';
        if SaveDialog.Execute then begin
            SaveFile := SaveDialog.FileName;
            CheckBoxSave.Font.Color := clRed;
        end
        else
            CheckBoxSave.Checked := False;
    end;
end;

procedure TFrmCANComm.CheckBoxReadClick(Sender: TObject);
begin
    TimerCANRead.Enabled := CheckBoxRead.Checked;
end;


end.
