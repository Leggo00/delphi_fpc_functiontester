unit FormCANEmul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZINICtrl, ComDrv32, Buttons, ExtCtrls, ComCtrls,
  DPBLabel, FormDevice, uCanUnit, uCanKMI, XiButton, ImgList;

type
  TFrmCANEmul = class(TFrmDevice)
    INI: ZIniData;
    MemoLog: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Port: ZIniComboBox;
    StatusBar: TStatusBar;
    ListViewTx: TListView;
    BtnInit: TXiButton;
    BtnClose: TXiButton;
    Label4: TLabel;
    Cb_BaudRate: ZIniComboBox;
    Label7: TLabel;
    BtnStop: TXiButton;
    Panel2: TPanel;
    Label3: TLabel;
    BtnSend: TBitBtn;
    Edit_SendMsg: TEdit;
    Cb_ViewProtocol: TCheckBox;
    ImageList1: TImageList;
    Comm: TCommPortDriver;
    procedure FormCreate(Sender: TObject);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure Cb_ViewProtocolClick(Sender: TObject);
  private
    { Private declarations }
    // RS232용 Buff..
    TxBuff, RxBuff : array [0..MAX_BUFF] of Byte;
    TxLen, RxLen  : Integer;

    procedure AddLog(Param : String);
    function  CommSend(Cmd : Byte; Buff : PChar; BuffLen : Integer) : Boolean;
    procedure AddCANMsg(ListView: TListView; CanMsg: TCANMessage; sOption : String);
    function  CANSend(Param: String): Boolean;
    function  CANClear(Param : String) : Boolean;

    function  DevSend_Old(Param: String): Integer;
  public
    { Public declarations }
     function DevOpen(Param : String) : Integer; override;
     function DevClose(Param : String): Integer; override;
     function DevInit(Param : String) : Integer; override;

     function DevSend(Param : String) : Integer; override;
     function DevRead(Param : String) : String;  override;
  end;

var
  FrmCANEmul :  TFrmCANEmul;

implementation

{$R *.dfm}
uses GenUtils;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevOpen(Param: String): Integer;
var nPort : Integer;
    Buff : array [0..1] of Byte;
begin
    MemoLog.Lines.Clear;
     
    Comm.Disconnect;
    Comm.ComPort := ComboBox_Port.ItemIndex + 1;
    Comm.Connect;

    if Comm.Connected then begin
        StatusBar.SimpleText := Format('> COM%d-CONNECTED', [Comm.ComPort]);
        AddLog(StatusBar.SimpleText);

        // 통신연결후 벼젼정보를 읽어서 정상여부를 확인한다.
        Buff[0] := 0;
        if CommSend($39, @Buff[0], 1) then begin
            AddLog(Format('* Firmware Version : 0x%.2x', [RxBuff[5]]));
            DevInit(Param);
        end else
            AddLog('* Board Not Response');
    end else
    begin
        StatusBar.SimpleText := 'DISCONNECT';
        AddLog(StatusBar.SimpleText);
    end;
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevClose(Param: String): Integer;
var Buff : array[0..255] of Byte;
begin
    AddLog('> DevClose');

    Buff[0] := $00;
    CommSend($31, @Buff[0], 1);

    Comm.Disconnect;
    AddLog(StatusBar.SimpleText);
    StatusBar.SimpleText := '> DISCONNECT';
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevInit(Param: String): Integer;
var Buff : array[0..255] of Byte;
begin
    AddLog('> DevInit');

    Comm.FlushBuffers(True, True);
    TxLen := 0;
    RxLen := 0;

    //if Param = '' then
    Param := '500';
    
    // CAN CONNET 500KBps. 우선입력가능하게.. 나중에 확장필요.
    if (Param = '500') then begin
        Buff[0] := $21;
        Buff[1] := $00;
        Buff[2] := $7E;
        Buff[3] := $00;
    end;
    CommSend($30, @Buff[0], 4);
end;
//------------------------------------------------------------------------------
function TFrmCANEmul.DevRead(Param: String): String;
var fValue : Double;
begin
    //
end;


//------------------------------------------------------------------------------
procedure TFrmCANEmul.AddCANMsg(ListView : TListView; CanMsg : TCANMessage; sOption : String);
var i, Idx : Integer;
    IDStr, DataStr, TimeStr : String;
    SelItem : TListItem;
    fCycle : Double;

    SelNode, MessageNode : TTreeNode;
    SelID : Integer;
    RdStr : String;
begin
//    Node := TreeViewTx.Items.AddChild()
{
      MessageNode := nil;
      if TreeView.Items.Count > 0 then
      begin
          SelNode := TreeView.Items[0];
          while (SelNode <> nil) do begin
              RdStr := SelNode.Text;
              SelID := HexToIntDef( GetTokenTrim(RdStr, '='), -1);
              if (SelID = CanMsg.CanID) then begin
                  MessageNode := SelNode;
                  break;
              end;
              SelNode := SelNode.GetNext;
          end;
      end;

      // 3. Tree Item이 없는경우에는 새로 생성한다.
      if (MessageNode = nil) then
      begin
          MessageNode := TreeView.Items.Add(nil, '' );
         // MessageNode.ImageIndex    := IMAGE_MESSAGE;
         // MessageNode.SelectedIndex := IMAGE_MESSAGE;
       {   if DBCMessage <> nil then begin
              for j := 0 to  DBCMessage.CanSignalList.Count-1 do
              begin
                  SignalNode := TreeView.Items.AddChild( MessageNode, '');
                 // SignalNode.ImageIndex    := IMAGE_SIGNAL;
                 // SignalNode.SelectedIndex := IMAGE_SIGNAL;
              end;
          end;

      end

      IDStr   := Format('%x', [CanMsg.CanID]);
      DataStr := Trim(MakeHexaString(@CanMsg.Data[0], CanMsg.DLC));

      MessageNode.Text := Format('%s=%s:%d', [IDStr, DataStr, CanMsg.nCycle ]);
}

    IDStr   := Format('%x', [CanMsg.CanID]);
    DataStr := Trim(MakeHexaString(@CanMsg.Data[0], CanMsg.DLC));

    // ListView의 해당메세지 항목을 찾아 표시한다.
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
        SelItem.SubItems.Add(sOption);
    end else begin
        SelItem.SubItems[0] := DataStr;
        SelItem.SubItems[1] := IntToStr(CanMsg.nCycle);
        SelItem.SubItems[2] := sOption;
    end;
end;

//------------------------------------------------------------------------------
// String을 Integer Value값으로 변경한다.
function StrToValueDef(RdStr : string; defValue : Integer) : Integer;
begin
    RdStr := UpperCase(RdStr);

    // HEX Value인경우.
    if Copy(RdStr, 1, 2) = '0X' then begin
        RdStr := Copy(RdStr, 3, Length(RdStr)-2);
        Result := HexToIntdef(RdStr, Trunc(defValue));
    end else
    if Copy(RdStr, 1, 1) = '$' then begin
        RdStr := Copy(RdStr, 2, Length(RdStr)-1);
        Result := HexToIntdef(RdStr, Trunc(defValue));
    end else
    // FLOAT값인경우.
    begin
        Result := StrToIntDef(RdStr, defValue);
    end;
end;

//------------------------------------------------------------------------------
function TFrmCANEmul.CANSend(Param : String) : Boolean;
var Cmd, Str, sOption : String;
    nCmd, nMode : Byte;
    CanMsg : TCanMessage;
    i, j, Idx, BuffLen, Count, nValue : Integer;
    Buff : array[0..1024] of Byte;
    CanID : Cardinal;

    nParameter, nStartBit, nBitLen, nStartVal, nTargetVal, nIncVal : Integer;
    nPos1, nPos2, nLen1, nLen2 : Integer;
    Data : Byte;
begin
    CanMsg := StrToCanMsg(GetTokenTrim(Param, '>'));

    // 1) Tx Information
    Buff[0] := $02;  // TX Information..

    // 2) CAN ID.
    CanID := CanMsg.CANId;
    Buff[1] := Byte((CanID and $FF000000) shr 24);
    Buff[2] := Byte((CanID and $00FF0000) shr 16);
    Buff[3] := Byte((CanID and $0000FF00) shr 8 );
    Buff[4] := Byte((CanID and $000000FF));

    // 3) DLC
    Buff[5] := CanMsg.DLC;

    // 4) DATA
    BuffLen := 6;
    for i:= 0 to CanMsg.DLC-1 do begin
        Buff[BuffLen] := CanMsg.Data[i];
        Inc(BuffLen);
    end;

    // 5) Cycle Time
    Buff[BuffLen  ] := (CanMsg.nCycle div 256);
    Buff[BuffLen+1] := (CanMsg.nCycle mod 256);
    BuffLen := BuffLen + 2;
{
    // 추가옵션 Parameter가 있는경우.
    if (Param <> '') then begin
        Idx := BuffLen;
        Buff[Idx] := 0;  // Parameter Count;

        BuffLen := BuffLen + 1;
        nCmd := $42;
    end else
        nCmd := $41;
        //nCmd := $42;
}
//----------------------------------
// 임시모드 $41 Command를 보내면 안됨... $42Command로 사용...
// $41커멘드로 보낼경우 이전의 $42 커멘드의 메세지가 초기화가 안되어 메세지 섞임.
        Idx := BuffLen;
        Buff[Idx] := 0;  // Parameter Count;

        BuffLen := BuffLen + 1;
        nCmd := $42;
//----------------------------------

    sOption := Trim(Param);

    // 6) Sweep Option..
    while (Param <> '') do
    begin
        Str := GetTokenTrim(Param, '>');
        // 123=00 00 00 00 00 00 00 00:10 > $C2,$30,4,$0,$F,$1 > ...
        // Str = $C2,0,8,$00,$FF,$1   <- 이런형식..
        {-------------------------------------------------------------------
        // Parameter Option..
            Bit7   : Sweep value Change Flag -> 0이면 기존값 유지..
            Bit6   : 1=Little Endian Mode(Byte Index increase),
                     0=big Endian Mode (Motorola Type)
            Bit5,4 : dont'care
            Bit3~0 : Sweep Function
                0x01 : Normal Sweep Function -> Start부터 TargetValue까지 증가or감소.
                0x02 : RingCount Function    -> Start부터 TargetValue까지 증가후 0부터 계속 반복.
                0x04 : CheckSum Function     -> D0부터 Data부분을 모두 더하여 특정 Data영역에 CheckSum표시
                0x05 : GM Protection value   -> Protection = NOT(Pos1 + Pos2) + 1;
                0x06 : GM Checksum           -> CheckSum영역을 제외한 부분을 모두 더하고 ID /8 에대하여 Offset.
        -------------------------------------------------------------------}
        nParameter := StrToValueDef(GetToken(Str, ','), 0);
        nStartBit  := StrToValueDef(GetToken(Str, ','), 0);
        nBitLen    := StrToValueDef(GetToken(Str, ','), 0);

        Buff[BuffLen+0] := nParameter;  // Parameter Option;
        Buff[BuffLen+1] := nStartBit;   // StartBit 0~7;
        Buff[BuffLen+2] := nBitLen;     // Bit Length

        nMode := (nParameter and $0F);
        case nMode of
        //--------------------------------------------------
        1 : begin
            nStartVal  := StrToValueDef(GetToken(Str, ','), 0);
            nTargetVal := StrToValueDef(GetToken(Str, ','), 0);
            nIncVal    := StrToValueDef(GetToken(Str, ','), 0);

            Buff[BuffLen+3] := (nStartVal  div $100);  // StartValue    ($00~$FF)
            Buff[BuffLen+4] := (nStartVal  mod $100);
            Buff[BuffLen+5] := (nTargetVal div $100);  // TargetValue   ($00~$FF)
            Buff[BuffLen+6] := (nTargetVal mod $100);
            Buff[BuffLen+7] := (nIncVal    div $100);  // IncreaseValue ($00~$FF)
            Buff[BuffLen+8] := (nIncVal    mod $100);

            BuffLen := BuffLen + 9;
        end;

        //--------------------------------------------------
        2 : begin
            nStartVal  := StrToValueDef(GetToken(Str, ','), 0);
            nTargetVal := StrToValueDef(GetToken(Str, ','), 0);
            nIncVal    := StrToValueDef(GetToken(Str, ','), 0);

            if (nTargetVal = 0) then nTargetVal := (1 shl nBitLen)-1;
            if (nIncVal    = 0) then nIncVal    := 1;

            Buff[BuffLen+3] := (nStartVal  div $100);  // StartValue    ($00~$FF)
            Buff[BuffLen+4] := (nStartVal  mod $100);
            Buff[BuffLen+5] := (nTargetVal div $100);  // TargetValue   ($00~$FF)
            Buff[BuffLen+6] := (nTargetVal mod $100);
            Buff[BuffLen+7] := (nIncVal    div $100);  // IncreaseValue ($00~$FF)
            Buff[BuffLen+8] := (nIncVal    mod $100);

            BuffLen := BuffLen + 9;
        end;

        //--------------------------------------------------
        4, 6: begin // CheckSum or GM Checksum.
            Buff[BuffLen+3] := 0;     // Don't care
            Buff[BuffLen+4] := 0;     // Don't care
            Buff[BuffLen+5] := 0;     // Don't care
            Buff[BuffLen+6] := 0;     // Don't care
            Buff[BuffLen+7] := 0;     // Don't care
            Buff[BuffLen+8] := 0;     // Don't care

            BuffLen := BuffLen + 9;
        end;
        //--------------------------------------------------
        5: begin // GM Protection Value.
            nPos1  := StrToValueDef(GetToken(Str, ','), 0);
            nLen1  := StrToValueDef(GetToken(Str, ','), 0);
            nPos2  := StrToValueDef(GetToken(Str, ','), 0);
            nLen2  := StrToValueDef(GetToken(Str, ','), 0);

            Buff[BuffLen+3] := 0;     // Don't care
            Buff[BuffLen+4] := 0;     // Don't care
            Buff[BuffLen+5] := nPos1; // Bit Postion 1
            Buff[BuffLen+6] := nLen1; // Bit Length 1
            Buff[BuffLen+7] := nPos2; // Bit Postion 2
            Buff[BuffLen+8] := nLen2; // Bit Length 2

            BuffLen := BuffLen + 9;
        end;
        //--------------------------------------------------
        7: begin // Data Sweep
            // EX) Str = StartByte, DataLen, DataStr...
            // EX) 0,4,00,55,AA,FF

            nLen1 := nBitLen;   // Bit Length를 Data길이로 사용.

            Buff[BuffLen+1] := nStartBit * 8;   // StartBit 0~7;
            Buff[BuffLen+2] := 8;     // Bit Length


            Buff[BuffLen+3] := 0; // Start Value (Hi)
            Buff[BuffLen+4] := 0; // Start Value (Lo)

            Buff[BuffLen+5] := 0;
            Buff[BuffLen+6] := nLen1; // No of Data.

            Buff[BuffLen+7] := 0;
            Buff[BuffLen+8] := 0; // Dummy Byte.

            for j := 0 to nLen1-1 do begin
                Data := Byte(StrToValueDef(GetToken(Str, ','), 0));
                Buff[BuffLen+9+j] := Data;

                if (j=0) then
                    Buff[BuffLen+4] := Data; // 초기데이터를 StartValue
            end;
            BuffLen := BuffLen + 9 + nLen1;
        end;

        end;

        // Parameter수 증가..
        Buff[Idx] := Buff[Idx] + 1;
        if Buff[Idx] >= 8 then break; // 최대 8개...
    end;

    if CommSend(nCmd, @Buff[0], BuffLen) then
    begin
        AddCANMsg(ListViewTx, CanMsg, sOption);
    end;
end;

//------------------------------------------------------------------------------
// 현재 CAN Clear명령어가 별도로 준비되지 않아  해당 CAN Message의 Cycle을 0으로
// 전송하여 전송중인 메세지를 초기화 한다.

function TFrmCANEmul.CANClear(Param : String) : Boolean;
var Cmd, Str, sOption, IDStr : String;
    nCmd, nMode : Byte;
    CanMsg : TCanMessage;
    i, Idx, BuffLen, Count, nValue : Integer;
    Buff : array[0..1024] of Byte;
    CanID : Cardinal;
begin
    CanMsg := StrToCanMsg(GetTokenTrim(Param, '>'));

    // 1) Tx Information
    Buff[0] := $02;  // TX Information..

    // 2) CAN ID.
    CanID := CanMsg.CANId;
    Buff[1] := Byte((CanID and $FF000000) shr 24);
    Buff[2] := Byte((CanID and $00FF0000) shr 16);
    Buff[3] := Byte((CanID and $0000FF00) shr 8 );
    Buff[4] := Byte((CanID and $000000FF));

    // 3) DLC
    Buff[5] := CanMsg.DLC;

    // 4) DATA
    BuffLen := 6;
    for i:= 0 to CanMsg.DLC-1 do begin
        Buff[BuffLen] := CanMsg.Data[i];
        Inc(BuffLen);
    end;

    // 5) Cycle Time
    Buff[BuffLen  ] := 0;
    Buff[BuffLen+1] := 0;
    BuffLen := BuffLen + 2;

    // 6) Parameter Count
    Buff[BuffLen] := 0;
    BuffLen := BuffLen + 1;

    if CommSend($42, @Buff[0], BuffLen) then
    begin
        for i:= 0 to ListViewTx.Items.Count-1 do begin
            if (HexToIntDef(ListViewTx.Items[i].Caption, -1) = CanMsg.CANId) then begin
                ListViewTx.Items[i].Delete;
                break;
            end;
        end;
    end;
end;

function TFrmCANEmul.DevSend_Old(Param: String): Integer;
var Cmd : String;
    nCmd : Byte;
    Value : TCanMessage;
    i, nLen, nRetry : Integer;
    Buff : array[0..1024] of Byte;
begin
    AddLog('> DevSend : ' + Param);
    Cmd := GetToken(Param, ':');

    // 메세지를 통째로 보낸다.
    // ex) Param = COMMAND:12=00 00 00 00 00
    if (Cmd = 'CMD') then
    begin
        nCmd := HexToIntDef( GetToken(Param, '='), 0);
        nLen := 0;
        while (Param <> '') do begin
            Buff[nLen] := HexToIntDef( GetToken(Param, ' '), 0);
            Inc(nLen);
        end;

        if (nLen > 0) then
        begin
            for nRetry := 1 to 2 do
            begin
                if CommSend(nCmd, @Buff[0], nLen) then begin
                    AddLog('> DevSend : OK');
                    exit;
                end else begin
                    AddLog('> DevSend : FAIL');
                end;
            end;
        end;
    end else
        AddLog('> DevSend : FAIL');
end;

//------------------------------------------------------------------------------
function TFrmCANEmul.DevSend(Param: String): Integer;
var Cmd, Str, sCanMsg, sOption, RdStr, sValue : String;
    nCmd : Byte;
    CanMsg : TCanMessage;
    i, Idx, BuffLen, Count, nValue : Integer;
    Buff : array[0..1024] of Byte;
    CanID : Cardinal;

    nParameter, nStartBit, nBitLen, nStartVal, nTargetVal, nIncVal : Integer;
    fScale, fOffset, fValue : Double;
    nOption : Integer;
    ListItem : TListItem;
begin
    AddLog('> DevSend : ' + Param);
    sValue := GetToken(Param, ':');

    //-----------------------------------------
    // 기존코드와 호환성을 맞추기 위해 DevSend_Old 함수 호출.
    // 기존 MGH2,3 의 Step이 CMD형태로 스텝이 구성되어 있다..

    if (sValue = 'CMD') then begin
        Result := DevSend_Old('CMD:' + Param);
        exit;
    end;
    //-----------------------------------------


    Cmd    := GetToken(Param, ':');
    //--------------------------------------------------------------------------
    if (Cmd = 'CONNECT') then
    begin
        if (sValue = 'ON' ) then DevOpen(Param)  else
        if (sValue = 'OFF') then DevClose(Param);
    end;

    //--------------------------------------------------------------------------
    if (Cmd = 'SEND') then
    begin
        if (sValue = 'ON'  ) then CANSend(Param);
        if (sValue = 'OFF' ) then CANClear(Param);
    end else

    //--------------------------------------------------------------------------
    // 특정비트값만 변경한다.
    if (Cmd = 'SET') then
    begin
        // EX) 'SET:123=10,2:1,0:1'
        RdStr := Param;
        CanID := HexToIntDef(GetToken(RdStr, '='), -1);

        // ListView에서 CAN ID를 찾는다.
        sCanMsg := '';
        for i := 0 to ListViewTx.Items.Count-1 do begin
            ListItem := ListViewTx.Items[i];

            if CanID = HexToIntDef(ListItem.Caption, -9999) then
            begin
                sCanMsg := Format('%x=%s:%s', [ CanID, ListItem.SubItems[0], ListItem.SubItems[1] ]);
                sOption := ListItem.SubItems[2];

                CanMsg := StrToCanMsg(sCanMsg);
                break;
            end;
        end;

        if (sCanMsg = '') then
        begin
            CanMsg.CANId := CanID;
            CanMsg.DLC   := 8;
            for i := 0 to 7 do CanMsg.Data[i] := 0;
            CanMsg.nCycle := 0;
        end;

        nStartBit := StrToIntDef( GetToken(RdStr, ','), 0);
        nBitLen   := StrToIntDef( GetToken(RdStr, ':'), 0);
        fScale    := StrToFloatDef( GetToken(RdStr, ','), 1);
        fOffset   := StrToFloatDef( GetToken(RdStr, ':'), 0);

        nOption   := 0;
        if Pos('M', RdStr) > 0 then nOption := nOption + CAN_MOTOROLA;
        if Pos('S', RdStr) > 0 then nOption := nOption + CAN_SIGNED;
        
        if (sValue = 'ON') or (sValue = '1') or (sValue = 'TRUE') or (sValue = 'O') then
            fValue := 1
        else
            fValue := StrToFloatDef( sValue, 0 );

        // 값을 계산한다  y = scale * x + offset -->  x = (y - Offset)/ Scale
        nValue := Round((fValue - fOffset) / fScale);
        if SetCANValue(CanMsg, nStartBit, nBitLen, nValue, nOption) then
        begin
            CANSend( CanMsgToStr(CanMsg) + '>' + sOption);
        end
    end;

    //--------------------------------------------------------------------------
    // 전송중지
    if (Cmd = 'CLEAR') then begin
        Buff[0] := $06;
        if CommSend($31, @Buff[0], 1) then
        begin
            ListViewTx.Items.Clear;
            AddLog('* Response OK');
        end else begin
            AddLog('* Response Fail');
        end;
    end;
end;

//==============================================================================
// 여기까지 기본 BASE CLASS 구조...
//==============================================================================

procedure TFrmCANEmul.AddLog(Param : String);
begin
    if MemoLog.Lines.Count > 50 then
        MemoLog.Lines.Delete(0); 

    MemoLog.Lines.Add(Param);
end;

procedure TFrmCANEmul.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    DevOpen('');
end;

procedure TFrmCANEmul.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmCANEmul.BtnInitClick(Sender: TObject);
begin
    DevOpen('');
end;

procedure TFrmCANEmul.BtnCloseClick(Sender: TObject);
begin
    DevClose('');
end;

procedure TFrmCANEmul.BtnStopClick(Sender: TObject);
begin
    if not Comm.Connected then exit;
    DevSend(':CLEAR');
end;

procedure TFrmCANEmul.BtnSendClick(Sender: TObject);
begin
    inherited;

    DevSend('ON:SEND:' + Edit_SendMsg.Text);
end;

function TFrmCANEmul.CommSend(Cmd : Byte; Buff : PChar; BuffLen : Integer) : Boolean;
var i, nCount, nReadCount : Integer;
    CheckSum : Byte;
    DataPtr : pchar;
    fTime, fFrameTime : Double;
begin
    Result := False;
    if not Comm.Connected then exit;

    try
        DataPtr := @RxBuff[0];

        TxBuff[0] := KMI_FRAME_HEADER;    // HEADER.
        TxBuff[1] := 1;                   // Card ID
        TxBuff[2] := Cmd;                 // Command.

        nCount := 4;
        for i:= 0 to BuffLen-1 do begin
            TxBuff[nCount] := Byte(Buff[i]);
            Inc(nCount);
            if nCount > High(TxBuff)-2 then break;
        end;
        TxBuff[3] := nCount - 4;         // DataLen;

        // CHECK SUM을 계산한다.
        CheckSum := 0;
        for i:= 0 to nCount-1 do
            CheckSum := Byte(CheckSum + TxBuff[i]);

        TxBuff[nCount] := CheckSum;
        Inc(nCount);
        TxLen := nCount;

        if Cb_ViewProtocol.Checked then
            AddLog('TX> ' +MakeHexaString(@TxBuff[0], TxLen));

        Comm.FlushBuffers(True, True);
        //================================
        // 전송부분 RTS Control/
        fFrameTime := TxLen * (10000 / Comm.ComPortSpeed);   // 전송시간을 계산한다.
        fTime := GetTickCountEX;  // <- 전송시작시간.

        //    Comm.ToggleRTS(True);
        Comm.SendData(@TxBuff[0], TxLen);
        //    while (GetTickCountEx - fTime <= fSendTime) do;
        //    Comm.ToggleRTS(False);
        //================================

        RxLen := 0;
        // 전송시간동안은 대기해서 CPU부하를 줄인다.  2010.03.06. 정성일
        while (GetTickCountEx - fTime <= (fFrameTime * 2)) do Sleep(1);

        //  헤더부분문 읽는다.
        nReadCount := 5; // Heder(1) + ID(1) + Cmd(1) + Len(2);

        Comm.InputTimeout := 100;  // Input Timeout 10ms..
        nCount := Comm.ReadData(DataPtr, nReadCount);

        // 헤더가 틀린경우
        if (nCount    <> nReadCount      ) or
           (RxBuff[0] <> KMI_FRAME_HEADER) or
           (RxBuff[1] <> TxBuff[1]       ) then
        begin
            exit;
        end;

        RxLen   := RxLen + nCount;
        DataPtr := DataPtr + nCount;

        //  CAN READ인경우 DataLength가 2Byte 나머지 데이터를 읽는다.
        nReadCount := RxBuff[3]*256 + RxBuff[4] + 1;

        nCount := Comm.ReadData(DataPtr, nReadCount);
        RxLen := RxLen + nCount;

        if Cb_ViewProtocol.Checked then
            AddLog('RX> ' +MakeHexaString(@RxBuff[0], RxLen));

        // 데이터  Size정상.
        if (nCount >= nReadCount) then begin
            // CheckSum을 확인한다.
            CheckSum := 0;
            for i:= 0 to RxLen-2 do
                CheckSum := Byte(CheckSum + RxBuff[i]);

            if CheckSum <> RxBuff[RxLen-1] then begin
                WriteDebugStr('* CheckSum Error');
                exit;
            end else
                Result := True;
        end;
    finally
    end;
end;


procedure TFrmCANEmul.Cb_ViewProtocolClick(Sender: TObject);
begin
  inherited;
    MemoLog.Visible := Cb_ViewProtocol.Checked;
end;

end.


