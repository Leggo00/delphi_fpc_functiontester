unit FormCanMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XiButton, StdCtrls, ExtCtrls, uCanDBC, FrameCaninfo, AMLed,
  Menus, FormCANCom, uCanUnit, Buttons;

type
  TFrmCanMsg = class(TForm)
    Panel_Caption: TPanel;
    Label_Caption: TLabel;
    Led_Send: TLed;
    BtnSend: TXiButton;
    Label_Cycle: TLabel;
    BtnStop: TXiButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    // Frame정보 관리용.
    bViewSelect : Boolean;
    FrameCount  : Integer;
    FrameList   : array of TFrCanInfo;

    CanMessage : TCAN_Message;
  public
    { Public declarations }
    nPort : Integer;
    CANUnit    : TCANUnit;

    procedure UpdateValue(var Param : TCANMessage);
    procedure CheckMessage;
    procedure MakeInfoFrame;
  end;

    function CreateCanFrameWindow(nPort : Integer; CANUnit : TCANUnit; Param : TCAN_Message) : TFrmCanMsg;

implementation

uses GenUtils;

{$R *.dfm}


//------------------------------------------------------------------------------
function CreateCanFrameWindow(nPort : Integer; CANUnit : TCANUnit; Param : TCAN_Message) : TFrmCanMsg;
var i : Integer;
    Caption : String;
    FrmCanMsg: TFrmCanMsg;
    FrmStyle : TFormStyle;
begin
    if (CANUnit = nil) or (Param = nil) then exit;

    Caption := Format('%s [0x%X]', [Param.MessageName, Param.CanID]);
    if (Application.MainForm.FormStyle = fsMDIForm) then
    begin
        // 기존에 생성된 파일이 있는지 확인.
        for i:= 0 to Application.MainForm.MDIChildCount-1 do begin
            if (Caption = Application.MainForm.MDIChildren[i].Caption) then begin
                Application.MainForm.MDIChildren[i].Show;
                exit;
            end;
        end;
        FrmStyle := fsMDIChild;
    end else
        FrmStyle := fsNormal;


    // 동적으로 생성한다.
    FrmCanMsg := TFrmCanMsg.Create(Application.MainForm);
    FrmCanMsg.FormStyle := FrmStyle;
    FrmCanMsg.Caption := Format('CAN%d : %s', [nPort, Caption]);
    FrmCanMsg.nPort := nPort;
    FrmCanMsg.Label_Caption.Caption := Param.MessageName;
    FrmCanMsg.CanMessage.Assign(Param);
    FrmCanMsg.MakeInfoFrame;
    FrmCanMsg.CANUnit := CANUnit;
    FrmCanMsg.CheckMessage;

    Result := FrmCanMsg;
end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.MakeInfoFrame;
var i, nHeight : Integer;
    SelCanSignal : TCAN_Signal;
const
    FRAME_WIDTH = 340;
    FRAME_HEIGHT = 20;
begin
    if (CanMessage = nil) or (FrameCount <> 0) then exit;

    FrameCount := CanMessage.CanSignalList.Count;
    SetLength(FrameList, FrameCount);

    Width  :=  FRAME_WIDTH;
    Height := Panel_Caption.Height + (FRAME_HEIGHT*FrameCount) + 38;

    Label_Cycle.Caption := Format('Cycle : %dms', [CanMessage.nCycle]);
    for i:= 0 to CanMessage.CanSignalList.Count-1 do
    begin
        SelCanSignal := TCAN_Signal(CanMessage.CanSignalList[i]);

        FrameList[i] := TFrCanInfo.Create(Self);
        FrameList[i].Parent := Self;
        FrameList[i].Name   := Format('Frame%s_%d', [SelCanSignal.SignalName, i]);
        FrameList[i].Top    := nHeight;
        FrameList[i].Height := FRAME_HEIGHT;
        FrameList[i].Label_MsgName.Caption := SelCanSignal.SignalName;
        if (SelCanSignal.sUnit <> '') then
            FrameList[i].Label_Info.Caption    := SelCanSignal.sUnit
        else
           FrameList[i].Label_Info.Caption    := Format('[%s~%s]',
                 [FormatFloat('0.###', SelCanSignal.fMin), FormatFloat('0.###', SelCanSignal.fMax)]);
        FrameList[i].fScale  := SelCanSignal.fScale;
        FrameList[i].fOffset := SelCanSignal.fOffset;
        FrameList[i].fMin    := SelCanSignal.fMin;
        FrameList[i].fMax    := SelCanSignal.fMax;

        FrameList[i].Align := alTop;
    end;

end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.CheckMessage;
var i : Integer;
    PCanMsg : PTCANMessage;
begin
    Led_Send.LedOn := False;

    CANUNit.Lock;
    try
        for i:= 0 to CANUnit.TxCount-1 do begin
            if (CanUnit.TxMessages[i].CANId = CanMessage.CanID) then
            begin
                UpdateValue(CanUnit.TxMessages[i]);
                Led_Send.LedOn := True;
                break;
            end;
        end;
    finally
        CANUnit.UnLock;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.FormCreate(Sender: TObject);
begin
    CanMessage := TCAN_Message.Create;
    FrameCount := 0;
end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.FormDestroy(Sender: TObject);
var i: Integer;
begin
    CanMessage.Free;
end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.FormShow(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TFrmCanMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    // 항상 동적으로 생성하며 종료시 Free한다.
    Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFrmCanMsg.UpdateValue(var Param : TCANMessage);
var i, nVal : Integer;
    fValue : Double;
    FrCanInfo : TFrCanInfo;

    CanSignal : TCAN_Signal;
    CanMsg : TCanMessage;
begin
    // 자신의 ID값이면 Frame값을 Update한다.
    if (Param.CanID <> CanMessage.CanID) then exit;

    // 보내기인경우도 Update를 안한다.
    if (Led_Send.LedOn) then exit;

    try
        for i:= 0 to CanMessage.CanSignalList.Count-1 do
        begin
            CanSignal := TCAN_Signal(CanMessage.CanSignalList[i]);
            fValue := CanSignal.GetValue(Param);
            FrameList[i].UpdateValue( fValue );
        end;
    except
    end;
end;
//------------------------------------------------------------------------------
procedure TFrmCanMsg.BtnSendClick(Sender: TObject);
var fValue : Double;
    i : Integer;
    CanSignal : TCAN_Signal;
    CanMsg : TCanMessage;
begin
    // Editor의 값을 취합하여 Message를 생성.
    try
        // 메세지를 초기화 하고.
        CanMsg.CANId  := CanMessage.CanID;
        CanMsg.DLC    := CanMessage.nLen;
        for i:= 0 to 7 do CanMsg.Data[i] := 0;

        if CanMessage.nType = 0 then
            CanMsg.nCycle := CanMessage.nCycle
        else
            CanMsg.nCycle := 0;

        for i:= 0 to CanMessage.CanSignalList.Count-1 do
        begin
            CanSignal := TCAN_Signal(CanMessage.CanSignalList[i]);
            fValue := StrToIntDef(FrameList[i].Edit_Value.Text, 0);

            CanSignal.SetValue(CanMsg, fValue);
        end;
        CANUnit.Send(nPort, CanMsg);
        CheckMessage;
    except
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmCanMsg.BtnStopClick(Sender: TObject);
begin
    CANUnit.Clear(nPort, True, False, CanMessage.CanID);
    CheckMessage;
end;



end.
