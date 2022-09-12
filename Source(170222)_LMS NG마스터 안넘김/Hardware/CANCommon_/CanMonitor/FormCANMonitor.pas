{===============================================================================

    FormCAN.
    CAN ��������� �� �����������̽��� ���.
    CAN Hardware �� �����ϰ� �����ʿ�.

===============================================================================}

unit FormCANMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Tabs, ImgList, Buttons, StdCtrls, uCanDBC,
  Spin, ZINICtrl, Menus, XiButton, treelist, uCanUnit, AMLed,
  FormCANCom, Global;

const
    WM_UPDATE  = WM_USER + 100;

type
  TFrmCANMonitor = class(TForm)
    Panel1: TPanel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TreeView: TTreeView;
    TreeViewCanDB: TTreeView;
    Panel2: TPanel;
    Label2: TLabel;
    BtnSend: TSpeedButton;
    Edit_CanMsg: TEdit;
    TimerUpdate: TTimer;
    Panel3: TPanel;
    BtnConnect: TXiButton;
    BtnDisConnect: TXiButton;
    SaveDialog: TSaveDialog;
    XiButton1: TXiButton;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Label4: TLabel;
    Edit_Filter: TEdit;
    StartLog: TXiButton;
    StopLog: TXiButton;
    ListBoxLog: TListBox;
    Label_DBCFile: TLabel;
    PopupMenuCanDB: TPopupMenu;
    Send1: TMenuItem;
    Stop1: TMenuItem;
    CreateMessage1: TMenuItem;
    N1: TMenuItem;
    Led_TX: TLed;
    BtnClearMonitor: TSpeedButton;
    Edit_Baudrate: ZIniEdit;
    INI: ZIniData;
    Edit_DBCFile: ZIniEdit;
    Label1: TLabel;
    BtnOpenDBC: TSpeedButton;
    ComboBox_Filter: TComboBox;
    BtnIDAdd: TSpeedButton;
    BtnIDDelete: TSpeedButton;
    N2: TMenuItem;
    FindSignal1: TMenuItem;
    PopupMenuCanMonitor: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    BtnClearDBC: TSpeedButton;
    Led_RX: TLed;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisConnectClick(Sender: TObject);
    procedure StartLogClick(Sender: TObject);
    procedure StopLogClick(Sender: TObject);
    procedure TreeViewCanDBStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure TreeViewCanDBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
    procedure Send1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure CreateMessage1Click(Sender: TObject);
    procedure BtnOpenDBCClick(Sender: TObject);
    procedure TreeViewCanDBCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeViewCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure BtnClearMonitorClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure BtnIDAddClick(Sender: TObject);
    procedure BtnIDDeleteClick(Sender: TObject);
    procedure FindSignal1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BtnClearDBCClick(Sender: TObject);
  private
    { Private declarations }
    CANPort : Integer;
    CANBaudrate : Double;
    SaveLogFile : String;
    DragCANItem : TResItem;

    m_FrmCANCom : TFrmCANCom;
    CANUnit : TCANUnit;

    procedure UpdateTree;
    procedure UpdateMonitor(var Msg : TMessage); message WM_UPDATE;

    procedure UpdateMessageFrame(var Param : TCanMessage);

    procedure CloseMessageFrame;
  public
    { Public declarations }
    m_CanDB : TCanDB;
    sBaseDir : String;
    
    constructor Create(AOwner : TComponent; nPort : Integer; DB : TCanDB; FrCANComm : TFrmCANCom);
    procedure AddCanMsg(Param : TCANMessage);
    procedure OpenDBCFile(FileName: String);
  end;

var
  FrmCANMonitor: TFrmCANMonitor;


implementation


uses
    GenUtils, FrameCaninfo, FormCanMsg, FormMain, uImage;

{$R *.dfm}

constructor TFrmCANMonitor.Create(AOwner : TComponent; nPort : Integer; DB : TCanDB; FrCANComm : TFrmCANCom);
begin
    inherited Create(AOwner);

    CANPort := nPort;
    m_CanDB := DB;

    m_FrmCANCom := FrCANComm;
    if Assigned(FrCANComm) then
        CanUnit := FrCANComm.CanUnit
    else
        CanUnit := nil;

    Caption := 'CAN' + IntToStr(CANPort);

    INI.IniSection := Caption;
    INI.LoadData;
    sBaseDir := GetAppDir('');
end;

procedure TFrmCANMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerUpdate.Enabled := False;
    INI.SaveData;

    SaveWindowPos(Self);

    if (FormStyle = fsMDIChild) then
    begin
        Action := caFree;
        FrmCANMonitor := nil;
    end;
end;


procedure TFrmCANMonitor.UpdateMessageFrame(var Param : TCanMessage);
var i : Integer;
    SelForm : TForm;
begin
    if Application.MainForm.FormStyle = fsMDIForm then
    begin
        for i := 0 to Application.MainForm.MDIChildCount-1 do
        begin
            SelForm := Application.MainForm.MDIChildren[i];
            if (SelForm is TFrmCanMsg) then begin
               (SelForm as TFrmCanMsg).UpdateValue(Param);
            end;
        end;
    end;
end;

// ����� MessageFrame�� ��� �����Ѵ�.
procedure TFrmCANMonitor.CloseMessageFrame;
var i : Integer;
    SelForm : TForm;
begin
    if Application.MainForm.FormStyle = fsMDIForm then
    begin
        for i := 0 to Application.MainForm.MDIChildCount-1 do
        begin
            SelForm := Application.MainForm.MDIChildren[i];
            if (SelForm is TFrmCanMsg) then begin
                SelForm.Close;
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANMonitor.AddCanMsg(Param : TCANMessage);
var i : Integer;
    Str : String;
    CanMessage : TCAN_Message;
begin
    if PageControl.ActivePageIndex <> 2 then exit;

    with ListBoxLog do // Logâ�� ���� ǥ���Ѵ�.
    begin
        // ���Ͱ� �ִ°�� ����ó��
        for i:= 0 to ComboBox_Filter.Items.Count-1 do begin
            if (HexToIntDef(ComboBox_Filter.Items[i], -1) <> Param.CANId) then exit;
        end;

        // Log List�� ���� ǥ���Ѵ�.
        if (Items.Count > 50) then Items.Delete(0);
        Str := Format('%-3x  %d  %-24s : %10.2f',
            [Param.CANId, Param.DLC, MakeHexaString(@Param.Data[0], Param.DLC), Param.TimeStamp]);

        // DB���� CAN Message�� ã�� MessageName�� GroupName�� ǥ���Ѵ�.
        CanMessage := m_CanDB.FindCanMessage(Param.CANId);
        if CanMessage <> nil then Str := Str + Format('  [%s] %s', [CanMessage.MessageName, CanMessage.GroupName]);

        ItemIndex := Items.Add(Str);
    end;
end;
//------------------------------------------------------------------------------
// CAN Message Tree�� �ֱ������� Update�Ѵ�.
procedure TFrmCANMonitor.UpdateTree;
var
    i, j, SelID, nValue : Integer;
    SelNode, MessageNode, SignalNode : TTreeNode;
    Str, RdStr, sValue, sTblValue, MsgStr : String;
    fValue : Double;

    PCanMsg    : PTCANMessage;
    DBCMessage : TCAN_Message;
    CanSignal  : TCAN_Signal;
begin
    // ���۸�Ͽ� �ִ� CAN DATA�� Tree���·� Update�Ѵ�.
    CanUnit.Lock;
    try
        for i:= 0 to CanUnit.RxCount-1 do
        begin
            UpdateMessageFrame(CanUnit.RxMessages[i]);

            // ȭ��ǥ�ð� Monitor Tab���� �Ǿ��������� Update�Ѵ�. �ӵ������ ���ؼ� 2010.03.06
            if (PageControl.ActivePageIndex <> 0) then continue;

            // 1. DBC���� �ش� DB�� ã�´�.
            PCanMsg := @CanUnit.RxMessages[i];
            if PCanMsg = nil then exit;

            DBCMessage := m_CanDB.FindCanMessage( PCanMsg^.CANId );

            // 2. LIST���� MsgNode�� ã�´�. ������ �����.
            MessageNode := nil;
            if TreeView.Items.Count > 0 then
            begin
                SelNode := TreeView.Items[0];
                while (SelNode <> nil) do begin
                    RdStr := SelNode.Text;
                    SelID := HexToIntDef( GetTokenTrim(RdStr, '='), -1);
                    if (SelID = PCanMsg^.CanID) then begin
                        MessageNode := SelNode;
                        break;
                    end;
                    SelNode := SelNode.GetNext;
                end;
            end;

            // 3. Tree Item�� ���°�쿡�� ���� �����Ѵ�.
            if (MessageNode = nil) then
            begin
                MessageNode := TreeView.Items.Add(nil, '' );
                MessageNode.ImageIndex    := IMAGE_MESSAGE;
                MessageNode.SelectedIndex := IMAGE_MESSAGE;
                if DBCMessage <> nil then begin
                    for j := 0 to  DBCMessage.CanSignalList.Count-1 do
                    begin
                        SignalNode := TreeView.Items.AddChild( MessageNode, '');
                        SignalNode.ImageIndex    := IMAGE_SIGNAL;
                        SignalNode.SelectedIndex := IMAGE_SIGNAL;
                    end;
                end;
            end;


            with PCanMsg^ do
                RdStr := Format('%.3x=%-24s:%4d %9.1f', [ CANId, MakeHexaString(@Data[0], DLC), nCycle, TimeStamp ]);

            // DBC������ �ִ°��.
            if (DBCMessage <> nil) then
            begin
                RdStr := RdStr + Format(' [%s] %s', [DBCMessage.MessageName, DBCMessage.GroupName]);
                MessageNode.Text := RdStr;

                SignalNode := MessageNode.getFirstChild;
                // Message������ ��� Update�Ѵ�.
                for j := 0 to DBCMessage.CanSignalList.Count-1 do
                begin
                    CanSignal := TCAN_Signal( DBCMessage.CanSignalList[j] );
                    if SignalNode <> nil then begin
                        Str := Format('%-26s : ', [CanSignal.SignalName]);

                        // ���̺��� ���� ��´�.
                        sValue := FormatFloat('0.###', CanSignal.GetValue(PCanMsg^) );
                        sTblValue := m_CanDB.GetTblValue(CanSignal.SignalName, sValue);
                        if (sTblValue = '') then
                            sValue := Trim(sValue + ' ' + CanSignal.sUnit)
                        else
                            sValue := Format('%s %s', [sValue, sTblValue]);

                        SignalNode.Text := Str + sValue;
                    end;
                    SignalNode := SignalNode.GetNext;
                end;
            end else begin
                MessageNode.Text := RdStr;
            end;
        end;
    finally
        CanUnit.UnLock;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCANMonitor.OpenDBCFile(FileName : String);
begin
    if FileExists(FileName) then
    begin
        m_CanDB.LoadFromFile(FileName);
        m_CanDB.DisplayCanDB(TreeViewCanDB, nil);

        Label_DBCFile.Caption := Format('%s : %skbps', [ExtractFileName(FileName), FormatFloat('0.##', m_CanDB.nBaudrate / 1000 )]);
        //Edit_Baudrate.Text := FormatFloat('0.###', CanDB.nBaudrate / 1000 );
    end;
end;

procedure TFrmCANMonitor.BtnSendClick(Sender: TObject);
var RdStr : String;
    CANMessage : TCANMessage;
begin
    RdStr := Trim(Edit_CanMsg.Text);
    CANMessage := StrToCanMsg(RdStr);

    CanUnit.Send(CANPort, CANMessage);
end;

procedure TFrmCANMonitor.TimerUpdateTimer(Sender: TObject);
begin
    TimerUpdate.Enabled := False;

    // Update������ ������ ȭ�� Update.
    if (Led_RX.LedOn) then begin
        UpdateTree;
        Led_RX.LedOn := False;
    end;


    // ���۸޼����� �������  Led�� Blinkó���Ѵ�.
    if (CanUnit.TxCount > 0) then
        Led_Tx.LedOn := not Led_Tx.LedOn
    else
        Led_Tx.LedOn := False;

    TimerUpdate.Enabled := True;
end;

procedure TFrmCANMonitor.FormShow(Sender: TObject);
begin
    LoadWindowPos(Self);

    TreeView.Images := CanDBCImage.ImageList;
    TimerUpdate.Enabled := True;
end;

procedure TFrmCANMonitor.BtnConnectClick(Sender: TObject);
var BaudRate : Double;
    Str, RdStr : String;
    fBaudrate : Double;
begin
    fBaudrate := StrToFloatDef(Edit_Baudrate.Text, 500);

    // CAN OPEN..
    //CANUnit.Open(CANPort, fBaudrate, '');
    CANUnit.Open(1, fBaudrate, '');

    TreeView.Items.Clear;
    ListBoxLog.Clear;
end;

procedure TFrmCANMonitor.BtnDisConnectClick(Sender: TObject);
begin
    // CAN CLOSE.
    CANUnit.Close(CANPort);

    TreeView.Items.Clear;
    ListBoxLog.Clear;
end;

procedure TFrmCANMonitor.StartLogClick(Sender: TObject);
var SaveDialog : TSaveDialog;
begin
    SaveDialog := TSaveDialog.Create(Self);
    try
        SaveDialog.DefaultExt := 'txt';
        if SaveDialog.Execute then begin
            SaveLogFile := SaveDialog.FileName;
        end;
    finally
        SaveDialog.Free;
    end;
end;

procedure TFrmCANMonitor.StopLogClick(Sender: TObject);
begin
    SaveLogFile := '';
end;

procedure TFrmCANMonitor.TreeViewCanDBMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {  TreeViewCanDB.DragMode := dmManual;
    if TreeViewCanDB.Selected = nil then exit;

    if (TreeViewCanDB.Selected.ImageIndex = IMAGE_MESSAGE) then
        TreeViewCanDB.DragMode := dmAutomatic;  }
end;


procedure TFrmCANMonitor.TreeViewCanDBStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var i, Order, nPort, CANID : Integer;
    Str, ResName, RdStr : String;
    CanMessage : TCAN_Message;
    CANSignal : TCAN_Signal;
begin
    // �ڿ���Ͽ��� Drag�����ҋ�.
    DragResourceItem := nil;
    if TreeViewCanDB.Selected = nil then exit;

    // CAN SIGNAL�� ������ ���.
    if (TreeViewCanDB.Selected.ImageIndex = IMAGE_SIGNAL) then
    begin
        // CAN ID�� �����´�.  CANMSG : [0x001];
        RdStr   := TreeViewCanDB.Selected.Parent.Text;
        GetToken(RdStr, '[0x');
        CANID := HexToIntDef( GetToken(RdStr, ']'), -1);
        CanMessage := m_CanDB.FindCanMessage(CANID);
        if CanMessage = nil then exit;

        RdStr   := TreeViewCanDB.Selected.Text;
        ResName := GetTokenTrim(RdStr, ':');

        // CAN Signal�� ã�´�.
        CANSignal := nil;
        for i:= 0 to CanMessage.CanSignalList.Count-1 do begin
            if (ResName = TCAN_Signal(CanMessage.CanSignalList[i]).SignalName) then
            begin
                CanSignal := CanMessage.CanSignalList[i];
                break;
            end;
        end;


        if (CanSignal <> nil) then
        begin
            DragCANItem.ResType  := res_CAN; //res_Input;
            DragCANItem.ResCode  := CanSignal.SignalName;
            DragCANItem.ResGroup := CanMessage.MessageName;
            DragCANItem.ResName  := CanSignal.SignalName;
            DragCANItem.HwInfo   := Format('CAN%.2d_01', [CANPort]);
            DragCANItem.Option   := Format('SET:%X=%d,%d:%s,%s',
                [ CanMessage.CanID, CanSignal.StartBit, CanSignal.BitLen,
                  FormatFloat('0.###',CanSignal.fScale), FormatFloat('0.###',CanSignal.fOffset) ]);
            DragCANItem.InMin  := 0;
            DragCANItem.InMax  := (1 shl (CanSignal.BitLen-1));
            DragCANItem.OutMin := CanSignal.fMin;
            DragCANItem.OutMax := CanSignal.fMax;
            DragCANItem.sUnit  := CANSignal.sUnit;

            DragResourceItem := DragCANItem;
        end;
    end;
end;

procedure TFrmCANMonitor.FormCreate(Sender: TObject);
begin
    m_CanDB := TCanDB.Create;
    DragCANItem := TResItem.Create;
end;

procedure TFrmCANMonitor.FormDestroy(Sender: TObject);
begin
    m_CanDB.Free;
    DragCANItem.Free;
end;

procedure TFrmCANMonitor.XiButton1Click(Sender: TObject);
begin
    if Assigned(m_FrmCANCom) then
        m_FrmCANCom.Show;
end;

procedure TFrmCANMonitor.UpdateMonitor(var Msg : TMessage);
var fTime : Double;
    i : Integer;
    Str, RdStr : String;
begin
    if ((Msg.WParam) <> Integer(CANUnit)) then exit;

    // Message Log�� ����Ѵ�.
    CANUNit.Lock;
    ListBoxLog.Items.BeginUpdate;
    try
        for i := 0 to CANUnit.BuffCount-1 do begin
            AddCanMsg(CANUnit.BuffMessage[i]);
        end;
    finally
        ListBoxLog.Items.EndUpdate;
        CANUNit.UnLock;
    end;

    // �޼����� ���ͼ� RX LED�� ON�Ѵ�.
    Led_RX.LedOn := True;
end;

function CAN_MessageToCanMsg(Param : TCAN_Message) : TCANMessage;
var i : Integer;
begin
    if (Param <> nil) then begin
        Result.CANId     := Param.CanID;
        Result.DLC       := Param.nLen;
        Result.nCycle    := Param.nCycle;
    end else begin
        Result.CANId     := -1;
        Result.DLC       := 0;
        Result.nCycle    := 0;
    end;
    Result.TimeStamp := 0;
    Result.nChannel  := 0;

    for i:= 0 to 7 do Result.Data[i] := 0;
end;

procedure TFrmCANMonitor.Send1Click(Sender: TObject);
var Str, RdStr, GroupName : String;
    Param : TCAN_Message;
    i, CanID : Integer;
    CanMsg : TCANMessage;
begin
    
    // �ش�޼����� ������.
    if (TreeViewCanDB.Selected = nil) then exit;
    RdStr := TreeViewCanDB.Selected.Text;

    case TreeViewCanDB.Selected.Level of
    0: begin
        // CPU�� �����Ѱ�� ���� Message�� ��� ������.
        for i := 0 to m_CanDB.CanMessageList.Count-1 do begin
            Param := TCAN_Message(m_CanDB.CanMessageList[i]);

            // Cycle Message�ΰ�츸.
            if (Param.GroupName = RdStr) and (Param.nType = 0) then
            begin
                CanMsg := CAN_MessageToCanMsg(Param);
                CanUnit.Send(CANPort, CanMsg);
            end;
        end;

    end;
    1: begin
        // ������ Message�� �����Ѵ�.
        GetToken(RdStr, '0x');
        Str := GetTokenTrim(RdStr, ']');

        CanID := HexToIntDef(Str, -1);
        if (CanID >= 0) then
        begin
            Param := m_CanDB.FindCanMessage(CanID);
            // Cycle Message�ΰ�츸.
            if (Param.nType = 0) then begin
                CanMsg := CAN_MessageToCanMsg(Param);
                CanUnit.Send(CANPort, CanMsg);
            end;
        end;
    end;
    end;
    TreeViewCanDB.Invalidate;
end;

procedure TFrmCANMonitor.Stop1Click(Sender: TObject);
var Str, RdStr : String;
    Param : TCAN_Message;
    i, CanID : Integer;
    CanMsg : TCANMessage;


    function GetCanID(RdStr : String) : Integer;
    begin
        GetToken(RdStr, '0x');
        Str := GetTokenTrim(RdStr, ']');
        Result := HexToIntDef(Str, -1);
    end;
begin
    // �ش�޼����� ������.
    if (TreeViewCanDB.Selected = nil) then exit;

    case TreeViewCanDB.Selected.Level of
    0: begin
        RdStr := TreeViewCanDB.Selected.Text;

        // CPU�� �����Ѱ�� ���� Message�� ��� ������.
        for i := 0 to m_CanDB.CanMessageList.Count-1 do begin
            Param := TCAN_Message(m_CanDB.CanMessageList[i]);
            if Param.GroupName = RdStr then begin
                CanUnit.Clear(CANPort, False, True, Param.CanID);
            end;
        end;

    end;
    1: begin
        GetCanID(TreeViewCanDB.Selected.Text);
        CanUnit.Clear(CANPort, False, True, CanID);
    end;
    end;
    TreeViewCanDB.Invalidate;
end;

procedure TFrmCANMonitor.CreateMessage1Click(Sender: TObject);
var Str, RdStr : String;
    Param : TCAN_Message;
    i, CanID : Integer;
begin
    if (TreeViewCanDB.Selected = nil) then exit;


    case TreeViewCanDB.Selected.Level of
    0: begin
        RdStr := TreeViewCanDB.Selected.Text;

        // CPU�� �����Ѱ�� ���� Message�� ��� ������.
        for i := 0 to m_CanDB.CanMessageList.Count-1 do begin
            Param := TCAN_Message(m_CanDB.CanMessageList[i]);
            if Param.GroupName = RdStr then begin
                CreateCanFrameWindow(CANPort, CanUnit, Param);
            end;
        end;

    end;
    1: begin
        RdStr := TreeViewCanDB.Selected.Text;
        GetToken(RdStr, '0x');
        Str := GetTokenTrim(RdStr, ']');

        CanID := HexToIntDef(Str, -1);
        if CanID >= 0 then
        begin
            Param := m_CanDB.FindCanMessage(CanID);
            if (Param <> nil) then
                CreateCanFrameWindow(CANPort, CanUnit, Param);
        end;
    end;
    end;
end;

procedure TFrmCANMonitor.BtnOpenDBCClick(Sender: TObject);
var OpenDialog : TOpenDialog;
begin
    OpenDialog := TOpenDialog.Create(Self);
    try
        OpenDialog.DefaultExt := 'dbc';
        OpenDialog.Filter := 'CAN DB Files(*.dbc)|*.dbc';
        OpenDialog.InitialDir := sBaseDir;
        if OpenDialog.Execute then
        begin
            OpenDBCFile(OpenDialog.FileName);
            TreeView.Items.Clear;

            Edit_DBCFile.Text := ExtractFileName(OpenDialog.FileName);
        end;
    finally
        OpenDialog.Free;
    end;
end;

procedure TFrmCANMonitor.BtnClearDBCClick(Sender: TObject);
begin
    Edit_DBCFile.Text := ''
end;      

procedure TFrmCANMonitor.TreeViewCanDBCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var i, CANId : Integer;
    Str, RdStr : String;
begin
    // �������� �޼����� �Ķ������� ǥ���Ѵ�.
    if (CanUnit <> nil) and (Node.Level = 1) then
    begin
        Str := Node.Text;
        GetToken(Str, '0x');
        CANId := HexToIntDef( GetToken(Str, ']'), -1);

        CanUnit.Lock;
        try
            for i:= 0 to CanUnit.TxCount-1 do begin
                if CanUnit.TxMessages[i].CANId = CanId then begin
                    Sender.Canvas.Font.Color := clBlue;
                    break;
                end;
            end;
        finally
            CanUnit.UnLock;
        end
    end;
    DefaultDraw := True;
end;

procedure TFrmCANMonitor.TreeViewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
    // �������� �޼����� �Ķ������� ǥ���Ѵ�.
    if (Node.Level = 0) and (TreeView.Selected <> Node) then
        Sender.Canvas.Font.Color := clBlue;
    DefaultDraw := True;
end;

procedure TFrmCANMonitor.BtnClearMonitorClick(Sender: TObject);
begin
    // ���� �޼����� �ʱ�ȭ �Ѵ�.
    TreeView.Items.Clear;
    CanUnit.Clear(CANPort, False, True);
end;

procedure TFrmCANMonitor.PageControlChange(Sender: TObject);
begin
    case PageControl.ActivePageIndex of
        0: UpdateTree;
        1: ;
        2: ListBoxLog.Items.Clear;
    end;
end;

procedure TFrmCANMonitor.BtnIDAddClick(Sender: TObject);
var Idx, CanID : Integer;
    Str : String;
begin
    // ���͸� �߰��Ѵ�.
    CanID := HexToIntDef(Edit_Filter.Text, -1);
    if CanID < 0 then exit;

    Str := Format('%x', [CanID]);
    Idx := ComboBox_Filter.Items.IndexOf(Str);
    if Idx < 0 then
        ComboBox_Filter.ItemIndex := ComboBox_Filter.Items.Add(Str);
end;

procedure TFrmCANMonitor.BtnIDDeleteClick(Sender: TObject);
var Idx, CanID : Integer;
    Str : String;
begin
    // ���͸� �����Ѵ�.
    CanID := HexToIntDef(Edit_Filter.Text, -1);
    if CanID < 0 then exit;

    Str := Format('%x', [CanID]);
    Idx := ComboBox_Filter.Items.IndexOf(Str);
    if Idx >= 0 then begin
        ComboBox_Filter.Items.Delete(Idx);
        if ComboBox_Filter.Items.Count >= 0 then
            ComboBox_Filter.ItemIndex := 0;
    end;
end;

procedure TFrmCANMonitor.FindSignal1Click(Sender: TObject);
var i : Integer;
    Str, RdStr, SignalName : String;
    TreeNode : TTreeNode;
begin
    SignalName := InputBox('Find Signal', 'Enter the signal name.',  '');
    if SignalName = '' then exit;

    TreeViewCanDB.Selected := nil;
    for i:= 0 to TreeViewCanDB.Items.Count-1 do begin
        TreeNode := TreeViewCanDB.Items[i];
        RdStr := TreeNode.Text;
        Str := GetTokenTrim(RdStr, ':');
        if Pos(SignalName, Str) > 0 then begin
            TreeViewCanDB.Selected := TreeNode;
            if MessageBox(Format('[%s]Found the presence of a signal.. Are you sure you want to add a search?', [SignalName]), 'Check the signal', MB_YESNO) <> ID_YES then
                break;
        end;
    end;

    if (TreeViewCanDB.Selected = nil) then
        MessageBox('Can not searched the signal names.', 'Confirmation', MB_OK or MB_ICONWARNING);
end;

procedure TFrmCANMonitor.MenuItem1Click(Sender: TObject);
var Str, RdStr : String;
    Param : TCAN_Message;
    i, CanID : Integer;
begin
    if (TreeView.Selected = nil) then exit;
    if (TreeView.Selected.Level <> 0) then exit;

    RdStr := TreeView.Selected.Text;
    CanID := HexToIntDef(GetToken(RdStr, '='), -1);
    if CanID >= 0 then
    begin
        Param := m_CanDB.FindCanMessage(CanID);
        if (Param <> nil) then
            CreateCanFrameWindow(CANPort, CanUnit, Param);
    end;
end;

end.
                                                                         `
