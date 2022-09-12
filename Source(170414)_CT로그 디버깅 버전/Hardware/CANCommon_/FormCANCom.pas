unit FormCANCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ZINICtrl, ComCtrls, uCanUnit,
  XiButton, Spin;

const
    MAX_BUFF = 2047;

    // CAN CARD TYPE..
    VECTOR_CANCASE = 1;
    KMI_CAN        = 2;

type
  TFrmCANCom = class(TForm)
    Panel: TPanel;
    StatusBar: TStatusBar;
    TimerRead: TTimer;
    Label4: TLabel;
    INI: ZIniData;
    ListViewRx1: TListView;
    ListViewTx1: TListView;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Edit_CanId: TEdit;
    Edit_D0: TEdit;
    Edit_D2: TEdit;
    Edit_D1: TEdit;
    Edit_D4: TEdit;
    Edit_D3: TEdit;
    Edit_D5: TEdit;
    Edit_D6: TEdit;
    Edit_D7: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox_dlc: TComboBox;
    BtnSend: TXiButton;
    GroupBox2: TGroupBox;
    Cb_ReadRepeat: ZIniCheckBox;
    BtnRead: TXiButton;
    MemoLog: TMemo;
    Label7: TLabel;
    Cb_BaudRate: ZIniComboBox;
    BtnOpenCAN: TXiButton;
    BtnCloseCAN: TXiButton;
    BtnClearCAN: TXiButton;
    Edit_Interval: ZIniSpinEdit;
    Edit_Port: ZIniSpinEdit;
    LabelType: TLabel;
    BtnOpenDevice: TXiButton;
    BtnCloseDevice: TXiButton;
    Label11: TLabel;
    Edit_Ch: ZIniSpinEdit;
    ComboBox_CanType: ZIniComboBox;
    Cb_Cycle: ZIniComboBox;
    BtnClearCANTx: TXiButton;
    BtnClearCANRx: TXiButton;
    Image7: TImage;
    Image1: TImage;
    Cb_Log: ZIniCheckBox;
    Ed_LogFileName: TEdit;
    SaveDialog: TSaveDialog;
    Ed_Mask: ZIniEdit;
    Label10: TLabel;
    procedure BtnOpenCANClick(Sender: TObject);
    procedure BtnCloseCANClick(Sender: TObject);
    procedure BtnClearCANClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnOpenDeviceClick(Sender: TObject);
    procedure BtnCloseDeviceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cb_ReadRepeatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnClearCANTxClick(Sender: TObject);
    procedure BtnClearCANRxClick(Sender: TObject);
    procedure Cb_LogClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddCANMsg(ListView: TListView; CanMsg: TCANMessage;
      bTxMode: Boolean);
    procedure AddLog(Param: String);
  public
    { Public declarations }
    CANUnit    : TCANUnit;
//    CANManager : TCANManager;
    OnCANReadEvent : procedure(Sender : TObject) of object;
  end;

var
  FrmCANCom: TFrmCANCom;

implementation

uses
    GenUtils, uCanVector, uCanKMI;

{$R *.dfm}

//==============================================================================
{ TFrmCANTest }
procedure TFrmCANCom.BtnOpenCANClick(Sender: TObject);
var fBaudrate, fTime : Double;
    nPort : Integer;
    Param : String;
begin
    if (CANUnit = nil) then exit;

    fTime     := GetTickCountEX;
    fBaudrate := StrToFloatDef(Cb_BaudRate.Text, 500);
    nPort     := Edit_Ch.Value;
    Param     := '';


    if (Ed_Mask.Text <> '') then begin
        Param := 'MASK=' + Ed_Mask.Text;
    end;

    if CANUnit.Open(nPort, fBaudrate, Param) then
    begin
        StatusBar.Panels[0].Text := 'Connect';

        AddLog(Format('> Open CAN(%d) OK. (%f ms)', [nPort, (GetTickCountEX - fTime)]));
    end else
    begin
        StatusBar.Panels[0].Text := 'DisConnect';
        AddLog(Format('> Open CAN(%d) Fail (%f ms).', [nPort, (GetTickCountEX - fTime)]))
    end;
end;

procedure TFrmCANCom.BtnCloseCANClick(Sender: TObject);
begin
    if (CANUnit = nil) then exit;

    Cb_ReadRepeat.Checked := False;
    AddLog('> Close Port');
    CANUnit.Close(Edit_Ch.Value);
    StatusBar.Panels[0].Text := 'Disconnect';
end;

procedure TFrmCANCom.AddCANMsg(ListView : TListView; CanMsg : TCANMessage; bTxMode : Boolean);
var i : Integer;
    IDStr, DataStr, TimeStr : String;
    SelItem : TListItem;
    fCycle : Double;
begin
    IDStr   := Format('%x', [CanMsg.CanID]);
    DataStr := Trim(MakeHexaString(@CanMsg.Data[0], CanMsg.DLC));

    if bTxMode then
        TimeStr := ''
    else
        TimeStr := Format('%f', [CanMsg.TimeStamp]);

    SelItem := nil;
    for i:= 0 to ListView.Items.Count-1 do begin
        if (ListView.Items[i].Caption = IDStr) then begin
            SelItem := ListView.Items[i];
            break;
        end;
    end;

    if (SelItem = nil) then
    begin
        SelItem := ListView.Items.Add;
        SelItem.Caption := IDStr;
        SelItem.SubItems.Add(DataStr);
        SelItem.SubItems.Add(IntToStr(CanMsg.nCycle));
        SelItem.SubItems.Add(TimeStr);
        SelItem.SubItems.Add(IntToStr(CanMsg.nChannel));
    end else begin
        SelItem.SubItems[0] := DataStr;
        SelItem.SubItems[1] := IntToStr(CanMsg.nCycle);
        SelItem.SubItems[2] := TimeStr;
        SelItem.SubItems[3] := IntToStr(CanMsg.nChannel);
    end;
end;

procedure TFrmCANCom.BtnReadClick(Sender: TObject);
var fTime : Double;
    i : Integer;
    Str : String;
    PCANMsg : PTCANMessage;
begin
    if (CANUnit = nil) then exit;

    MemoLog.Lines.BeginUpdate;
    MemoLog.Lines.Clear;
    fTime := GetTickCountEX;
    if (CANUnit.Read(Edit_Ch.Value) > 0) then
    begin
        if (Visible) then
        begin
            // RX의 마지막 Buff의 내용을 TreeView에 표시

            CANUnit.Lock;
            MemoLog.Lines.Add(Format('Read Count : %3d (%f ms)', [CANUnit.BuffCount, GetTickCountEX - fTime]));
            try
                for i := 0 to CANUnit.RxCount-1 do
                    AddCANMsg(ListViewRx1, CANUnit.RxMessages[i], False);

                // 버퍼의 내용을 Log에 남긴다.
                for i := 0 to CANUnit.BuffCount-1 do begin
                    with CANUnit.BuffMessage[i] do begin
                        Str := Format('%3x  %d  %-25s: %10.2f', [CANId, DLC, MakeHexaString(@Data[0], DLC), TimeStamp]);
                        AddLog(Str);

                        // 측정데이터 Log를 기록한다.  2011.08.30 추가..
                        if Cb_Log.Checked then begin
                            WriteDebugStr(Str, Ed_LogFileName.Text);
                        end;
                    end;
                end;
            finally
                CANUnit.UnLock;
            end;
        end;
    end else
        AddLog(Format('Read Count : 0 (%f ms)', [GetTickCountEX - fTime]));
    MemoLog.Lines.EndUpdate;
end;


procedure TFrmCANCom.BtnClearCANClick(Sender: TObject);
begin
    if (CANUnit = nil) then exit;

    ListViewTx1.Items.Clear;
    ListViewRx1.Items.Clear;

    CANUnit.Clear(Edit_Ch.Value, True, True);
    AddLog('> Clear CAN Tx/Rx');
end;

procedure TFrmCANCom.FormCreate(Sender: TObject);
var i : Integer;
    nMode : Integer;
begin
    OnCANReadEvent := nil;

    INI.LoadData;

    nMode := ComboBox_CanType.ItemIndex;
    case nMode of
        0 : begin
            CANUnit := TKmiCAN.Create;
            // CANUnit.PauseReadPolling;
            
            LabelType.Caption := 'Port';
        end;
        1 : begin
            CANUnit := TVectorCAN.Create;
            LabelType.Caption := 'Type';

            CANUnit.ContinueSendPolling;
            CANUnit.ContinueReadPolling;
        end;
    end;

    BtnOpenDeviceClick(Sender);

    if (CANUnit <> nil) then
        CANUnit.OnMessageRead := OnCANReadEvent;
    
    StatusBar.Panels[1].Text := ComboBox_CanType.Text;
end;

procedure TFrmCANCom.FormDestroy(Sender: TObject);
begin
    BtnCloseDeviceClick(Sender);

    CANUnit.Free;
    CANUnit := nil;
    Sleep(10);
end;


procedure TFrmCANCom.TimerReadTimer(Sender: TObject);
var nInterval : Integer;
begin
    TimerRead.Enabled := False;

    BtnReadClick(BtnRead);

    nInterval := Edit_Interval.Value;
    if (nInterval < 100) then nInterval  := 100;
    if (nInterval > 3000) then nInterval := 3000;

    TimerRead.Interval := nInterval;
    TimerRead.Enabled := Cb_ReadRepeat.Checked;
end;


procedure TFrmCANCom.BtnSendClick(Sender: TObject);
var fTime : Double;
    Value : TCanMessage;
begin
    if (CANUnit = nil) then exit;

    Value.CANId   := HexToIntDef(Edit_CanId.Text, 0);
    Value.DLC     := ComboBox_dlc.ItemIndex;
    Value.Data[0] := HexToIntDef(Edit_D0.Text, 0);
    Value.Data[1] := HexToIntDef(Edit_D1.Text, 0);
    Value.Data[2] := HexToIntDef(Edit_D2.Text, 0);
    Value.Data[3] := HexToIntDef(Edit_D3.Text, 0);
    Value.Data[4] := HexToIntDef(Edit_D4.Text, 0);
    Value.Data[5] := HexToIntDef(Edit_D5.Text, 0);
    Value.Data[6] := HexToIntDef(Edit_D6.Text, 0);
    Value.Data[7] := HexToIntDef(Edit_D7.Text, 0);
    Value.nCycle  := StrToIntDef(Cb_Cycle.Text, 0);


    fTime := GetTickCountEx;
    if CANUnit.Send(Edit_Ch.Value, Value) then begin
        AddCANMsg(ListViewTx1, Value, True);
        AddLog(Format('Send CanID=%x (%f ms)', [Value.CANId, GetTickCountEX - fTime]));
    end;
end;

procedure TFrmCANCom.BtnOpenDeviceClick(Sender: TObject);
var i : Integer;
begin
    if (CANUnit = nil) then exit;

    MemoLog.Lines.Clear;
    if CANUnit.OpenDevice(Edit_Port.Value, 1) then
    begin
        AddLog('> Open Device Success.');
        MemoLog.Lines.AddStrings(CANUnit.HWInfo);

    end else begin
        AddLog('> Open Device Fail.');
    end;
end;

procedure TFrmCANCom.BtnCloseDeviceClick(Sender: TObject);
begin
    if (CANUnit = nil) then exit;

    Cb_ReadRepeat.Checked := False;

    if CANUnit.CloseDevice then
        AddLog('> Close Device.')
    else
        AddLog('> Close Device Fail.');
end;

procedure TFrmCANCom.AddLog(Param : String);
begin
    if (Visible) then
    begin
        if MemoLog.Lines.Count > 200 then
            MemoLog.Lines.Delete(0);
        MemoLog.Lines.Add(Param);
    end;
end;

procedure TFrmCANCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerRead.Enabled := False;
    if Cb_ReadRepeat.Checked then begin
        CanUnit.ContinueReadPolling;
    end;
    Cb_ReadRepeat.Checked := False;

    INI.SaveData;
end;

procedure TFrmCANCom.Cb_ReadRepeatClick(Sender: TObject);
begin
    TimerRead.Enabled := Cb_ReadRepeat.Checked;

    // 타이머가 작동하면  Read Polling중지한다.
    if Cb_ReadRepeat.Checked then begin
        CanUnit.PauseReadPolling
    end else begin
        CanUnit.ContinueReadPolling;
    end;
end;

procedure TFrmCANCom.FormShow(Sender: TObject);
var i : Integer;
    TxMessage : TCANMessage;
begin
    Cb_ReadRepeat.Checked := False;

    // Form Show시에 전송중인 메세지를 함께 표시한다.
    ListViewTx1.Items.Clear;
    CanUnit.Lock;
    try
        for i:= 0 to CanUnit.TxCount-1 do begin
            TxMessage := CanUnit.TxMessages[i];
            if TxMessage.nCycle > 0 then
                AddCANMsg(ListViewTx1, TxMessage, True);
        end;
    finally
        CanUnit.UnLock;
    end;
end;

procedure TFrmCANCom.BtnClearCANTxClick(Sender: TObject);
begin
    if (CANUnit = nil) then exit;

    ListViewTx1.Items.Clear;
    CANUnit.Clear(Edit_Ch.Value, True, False);
    AddLog('> Clear CAN Tx');
end;

procedure TFrmCANCom.BtnClearCANRxClick(Sender: TObject);
begin
    if (CANUnit = nil) then exit;

    ListViewRx1.Items.Clear;
    CANUnit.Clear(Edit_Ch.Value, False, True);
    AddLog('> Clear CAN Rx');
end;

procedure TFrmCANCom.Cb_LogClick(Sender: TObject);
begin
    Ed_LogFileName.Text := '';

    if Cb_Log.Checked then
    begin
        if SaveDialog.Execute then begin
            if FileExists(SaveDialog.FileName) then
            begin
                if MessageBox('File Exist. Append it?', 'Confirm', MB_OK or MB_ICONINFORMATION) <> IDOK then
                begin
                    Cb_Log.Checked := False;
                end;
            end;
        end else
            Cb_Log.Checked := False;
    end;

    // 저장옵션 완료..
    if Cb_Log.Checked then begin
        Cb_Log.Font.Color := clRed;
        Ed_LogFileName.Text :=  SaveDialog.FileName;
    end else begin
        Cb_Log.Font.Color := clBlack;
    end;
end;

end.
