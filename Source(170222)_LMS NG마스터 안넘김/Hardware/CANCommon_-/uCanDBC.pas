{===============================================================================

    uCANDBC
    CAN ���� DB������ �����ϰ� �����Ѵ�.

    2009. 4. 7  Motolora / Intel Type �Ѵ�����
                �޼��� List ����.

===============================================================================}
unit uCanDBC;

interface


uses
  SysUtils, Classes, ImgList, Controls, ComCtrls, uCanUnit, StrUtils;

const
  IMAGE_FOLDER  = 0;
  IMAGE_FOLDERX = 1;
  IMAGE_DOC     = 2;
  IMAGE_ECU     = 3;
  IMAGE_MESSAGE = 4;
  IMAGE_SIGNAL  = 5;

  INVALID_VALUE = -9999;
  
type
  TCanDBCImage = class(TDataModule)
    ImageList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //============================================================================
  // CAN Signal ����
  TCAN_Signal = class(TObject)
  private
      FParent   : TObject;
  public
      SignalName   : String;
      CanID      : Integer;
      StartBit   : Integer;
      BitLen     : Integer;
      sUnit      : String;
      bByteOrder : Boolean;     // 0 = Motolora. StartBit�� MSB��.  1 = Intel
      bSigned    : Boolean;     // Signed/Unsigned
      fScale, fOffset, fMin, fMax : Double;

      constructor Create(Parent : TObject);
      destructor  Destroy; override;

      procedure SetValue(var CanMsg : TCanMessage; fValue: Double);
      function  GetValue(var CanMsg : TCanMessage) : Double;
  end;

  //----------------------------------------------------------------------------
  // CAN Message ����.
  TCAN_Message = class(TObject)
  private      {
      function  GetText : String;
      procedure SetText(Param : String);}
  public
      MessageName, GroupName : String;
      CanID     : Integer;      // CAN ID.
      nLen      : Integer;      // Message Size.
      nCycle    : Integer;      // �����ֱ�
      nType     : Integer;      // ����Type

      CanSignalList : TList;
      constructor Create;
      destructor  Destroy; override;
      procedure   Assign(Param : TCAN_Message);

//    property    Text : String read GetText write SetText;
  end;

  //----------------------------------------------------------------------------
  // CAN DB�� �����Ѵ�.
  TCanDB = class
  private
    function  AddCanMessage(CanMessage: TCAN_Message): Boolean;
    function  SetDBC(StrList : TStringList) : boolean;
  public
    nBaudrate : Integer;
    CanMessageList : TList;
    CanBuff   : TStringList;
    ValTable  : TStringList;

    constructor Create;
    destructor  Destroy; override;
    procedure   Assign(Param : TCanDB);
    procedure   Clear;
    function    FindCanMessage(CanID: Integer): TCAN_Message;
    function    FindCanSignal(sSignalName : String) : TCAN_Signal;

    // File Operation
    function   LoadFromFile(FileName : String) : Boolean;
    function   SaveToFile(FileName : String) : Boolean;

    procedure  AddCanData(Param : String);
    function   GetCanData(CanID : Integer) : String;
    procedure  DisplayCanDB(TreeView : TTreeView; ParentItem : TTreeNode);
    function   GetTblValue(sMsg, sValue : String) : String;
  end;

var
  CanDBCImage: TCanDBCImage;

implementation

{$R *.dfm}

uses GenUtils;


//==============================================================================
{ TCanInfo }

constructor TCAN_Signal.Create(Parent : TObject);
begin
    inherited Create;
    
    CanID      := -1;
    FParent    := Parent;
    SignalName := '';
    StartBit   := 0;
    BitLen     := 0;
    bByteOrder := False;
    bSigned    := False;
    sUnit      := ''
end;

destructor TCAN_Signal.Destroy;
begin
    inherited;
end;

procedure TCAN_Signal.SetValue(var CanMsg : TCanMessage; fValue: Double);
var nValue, nOption : Integer;
begin
    try
        nOption := 0;
        if (bbyteOrder) then nOption := nOption + 1;
        if (bSigned)    then nOption := nOption + 2;

        if (fValue < fMin) then fValue := fMin;
        if (fValue > fMax) then fValue := fMax;

        if fScale <> 0 then begin
            nValue := Trunc((fValue - fOffset) / fScale);
        end else
            nValue := Trunc(fValue);

        SetCANValue(CanMsg, StartBit, BitLen, nValue,  nOption);
    except
    end;
end;

function TCAN_Signal.GetValue(var CanMsg : TCanMessage) : Double;
var nValue, nOption : Integer;
begin
    try
        nOption := 0;
        if (bbyteOrder) then nOption := nOption + 1;
        if (bSigned)    then nOption := nOption + 2;

        nValue := GetCANValue(CanMsg, StartBit, BitLen, nOption);
        Result := (nValue * fScale) + fOffset;
    except
    end;
end;

//==============================================================================
{ TCANMsg }

constructor  TCAN_Message.Create;
begin
    inherited;

    CanSignalList := TList.Create;

    MessageName := '';
    GroupName   := '';
    CanID       := -1;
    nLen        := 0;
    nCycle      := 0;
end;

destructor  TCAN_Message.Destroy;
begin
    CanSignalList.Free;

    inherited;
end;

procedure  TCAN_Message.Assign(Param:  TCAN_Message);
begin
    if (Param <> nil) then begin
        MessageName := Param.MessageName;
        GroupName := Param.GroupName;
        CanID     := Param.CanID;
        nLen      := Param.nLen;
        nCycle    := Param.nCycle;
        nType     := Param.nType;

        CanSignalList.Assign(Param.CanSignalList);
    end else
    begin
        MessageName := '';
        GroupName := '';
        CanID     := -1;
        nLen      := 0;
        nCycle    := 0;
        nType     := 0;
        
        CanSignalList.Clear;
    end;
end;
{
function  TCAN_Message.GetText: String;
var Str : String;
begin
    // ID=00 00 00 00 : nCycle [MessageName] GroupName  �̷�����.
    if (MessageName = '') then
        Result := Format('%.3X=%-25s: %d', [CanID, MakeHexaString(@Data[0], nLen), nCycle])
    else
        Result := Format('%.3X=%-25s: %d [%s] %s',
            [CanID, MakeHexaString(@Data[0], nLen), nCycle, MessageName, GroupName]);
end;

procedure  TCAN_Message.SetText(Param: String);
var i : Integer;
    Str, RdStr : String;
begin
    // ID=00 00 00 00 : nCycle [MessageName] GroupName  �̷�����.
    CanID := HexToIntDef( GetToken(Param, '='), -1);

    RdStr := GetTokenTrim(Param, ':');
    nLen := 0;
    while (RdStr <> '') and (nLen < 8) do begin
        Str := GetTokenTrim(RdStr, ' ');
        if Str = '' then continue;
        
        Data[nLen] := HexToIntDef(Str, 0);
        Inc(nLen);
    end;
    nCycle := StrToIntDef( GetTokenTrim(Param, '['), 0);

    // MessageName�� �ִ°�쿡�� �̸�����. 
    if (Param <> '') then begin
        MessageName := GetToken(Param, ']');
        GroupName := Trim(Param);
    end;
end;}

{ TCanDB }

constructor TCanDB.Create;
begin
    inherited;

    CanMessageList := TList.Create;
    CanBuff  := TStringList.Create;
    ValTable := TStringList.Create;
end;

destructor TCanDB.Destroy;
begin
    CanBuff.Free;
    ValTable.Free;
    CanMessageList.Free;

    inherited;
end;

procedure TCanDB.Assign(Param : TCanDB);
begin
    //
end;


procedure TCanDB.Clear;
var i, j : Integer;
    CanMessage : TCan_Message;
    CanSignal  : TCAN_Signal;
begin
    try
        for i := CanMessageList.Count-1 downto 0 do
        begin
            CanMessage :=  TCAN_Message(CanMessageList[i]);
            for j:= CanMessage.CanSignalList.Count-1 downto 0 do
            begin
                CanSignal := TCAN_Signal(CanMessage.CanSignalList[j]);
                CanSignal.Free;
            end;
            CanMessage.Free;
        end;
        CanMessageList.Clear;

        CanBuff.Clear;
        ValTable.Clear;
    finally
    end;
end;

procedure TCanDB.AddCanData(Param : String);
var CanID, DataStr : String;
begin
    // Param = 123 00 00... :0
    CanID := GetToken(Param, ' ');
    CanBuff.Values[CanID] := Param;
end;

function TCanDB.GetCanData(CanID : Integer) : String;
var Str, DataStr : String;
begin
    Str := Format('%X', [CanID]);
    Result := Str + ' ' + CanBuff.Values[Str];
end;

//------------------------------------------------------------------------------
// CAN Message ��ã�´�.
function TCanDB.AddCanMessage(CanMessage:  TCAN_Message): Boolean;
begin
    if CanMessage <> nil then begin
        CanMessageList.Add(CanMessage);
        Result := True;
    end else
        Result := False;
end;

//------------------------------------------------------------------------------
// CAN Message�� ã�´�.
function TCanDB.FindCanMessage(CanID: Integer):  TCAN_Message;
var i : Integer;
    CanMessage :  TCAN_Message;
begin
    Result := nil;
    for i := 0 to CanMessageList.Count-1 do
    begin
        CanMessage :=  TCAN_Message(CanMessageList[i]);
        if (CanMessage.CanID = CanID) then begin
            Result := CanMessage;
            break;
        end;
    end;
end;

//------------------------------------------------------------------------------
// CAN Message�� Name���� ã�´�.
function TCanDB.FindCanSignal(sSignalName : String) : TCAN_Signal;
var i, j: Integer;
    CanMessage :  TCAN_Message;
    CanSignal : TCAN_Signal;
begin
    Result := nil;

    for i := 0 to CanMessageList.Count-1 do
    begin
        CanMessage :=  TCAN_Message(CanMessageList[i]);
        for j:= 0 to CanMessage.CanSignalList.Count-1 do
        begin
            CanSignal := TCAN_Signal(CanMessage.CanSignalList[j]);
            if (CanSignal.SignalName = sSignalName) then
            begin
                Result := CanSignal;
                exit;
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
// CAN ������ ���Ͽ��� �д´�.
function TCanDB.LoadFromFile(FileName: String): Boolean;
var i : Integer;
    StrList : TStringList;
begin
    Clear;
    
    Result := False;
    if not FileExists(FileName) then exit;
    
    StrList := TStringList.Create;
    try
        StrList.LoadFromFile(FileName);
        SetDBC(StrList);
        Result := True;
    finally
        StrList.Free;
    end;
end;

//------------------------------------------------------------------------------
// CAN������ ���Ϸ� �����Ѵ�.
function TCanDB.SaveToFile(FileName: String): Boolean;
var i : Integer;
    StrList : TStringList;
begin
{    StrList := TStringList.Create;
    try
        for i := 0 to CanList.Count-1 do
        begin

        end;
        StrList.SaveToFile(FileName);
    finally
        StrList.Free;
    end;
}
end;

//------------------------------------------------------------------------------
// ���̺��� ���� ã�� ǥ���Ѵ�.
function TCanDB.GetTblValue(sMsg, sValue : String) : String;
var RdStr : String;
    sVal, sParam : String;
begin
    Result := '';
    RdStr  := ValTable.Values[sMsg];

    // RdStr = 1 "ON" 0 "OFF" ;
    while (RdStr <> '') do
    begin
        RdStr := Trim(RdStr);
        sVal   := GetToken(RdStr, ' ');

        GetToken(RdStr, '"');
        sParam := GetToken(RdStr, '"');
        
        if (sVal = sValue) then begin
            Result := sParam;
            break;
        end;
    end;
end;
//------------------------------------------------------------------------------
// DBC������ �м��Ѵ�.
function TCanDB.SetDBC(StrList : TStringList) : boolean;
var i, j, k, CanID, nValue, nByte, nBit : Integer;
    Str, Header, RdStr, WtStr : String;
    CanMessage, TempMessage  :  TCAN_Message;
    CanSignal, TempSignal : TCAN_Signal;
begin
      {
      BO_ 398 H_U13: 8 H_U
       SG_ HF_TransferCallStatus : 1|2@0+ (1,0) [0|3] ""  MON
       SG_ HF_TelephoneStatus : 15|3@0+ (1,0) [0|7] ""  MON
       SG_ HF_PairingStatus : 5|2@1+ (1,0) [0|3] ""  MON
      }
    ValTable.Clear;
    CanMessageList.Clear;
    CanMessage := nil;
    for i:= 0 to StrList.Count-1 do begin
        RdStr := Trim(StrList[i]);
        if RdStr = '' then continue;

        Header := GetTokenTrim(RdStr, ' ');

        // CAN Message
        if (Header = 'VAL_TABLE_') then
        begin
            // VAL_TABLE_ C_MUTCheck 1 "ON" 0 "OFF" ;
            WtStr := GetTokenTrim(RdStr, ' ');
            // �����ڷ� ���ϰ� �ϱ����� ����.
            if WtStr <> '' then begin
                WtStr := WtStr + '=' + RdStr;// ReplaceStr(RdStr + ' ', '" ', '";');
                ValTable.Add(WtStr);
            end;
        end else

        if (Header = 'VAL_') then
        begin
            // VAL_ 449 DATC_AmbTemp_Disp_F 255 "invalid" 0 "Off" ;
            GetTokenTrim(RdStr, ' ');
            WtStr := GetTokenTrim(RdStr, ' ');
            // �����ڷ� ���ϰ� �ϱ����� ����.
            if WtStr <> '' then begin
                WtStr := WtStr + '=' + RdStr;// ReplaceStr(RdStr + ' ', '" ', '";');
                ValTable.Add(WtStr);
            end;
        end else

        if (Header = 'BO_') then
        begin
            // BO_ 398 H_U13: 8 H_U
            CanMessage :=  TCAN_Message.Create;
            CanMessage.CanID     := StrToIntDef(GetToken(RdStr, ' '), -1);
            CanMessage.MessageName := GetTokenTrim(RdStr, ':');
            RdStr := Trim(RdStr);
            CanMessage.nLen      := StrToIntDef(GetToken(RdStr, ' '), 8);
            CanMessage.GroupName := GetTokenTrim(RdStr, ' ');

            CanMessageList.Add(CanMessage);
        end else

        // CAN Detail Message
        if (CanMessage <> nil) and (Header = 'SG_') then
        begin
            //  SG_ HF_TelephoneStatus : 15|3@0+ (1,0) [0|7] ""  MON
             // SG_ DATC_PsTemp_Disp_C : 37|6@1- (0.5,17) [17|48.5] "centigrade"  MON,H_U
            //  �޼�����               StartBit|Len@Order+ (Scale,Offset) [Min|Max] "����" RX_UNIT

            CanSignal := TCAN_Signal.Create(CanMessage);
            CanSignal.CanID       := CanMessage.CanID;
            CanSignal.SignalName  := GetTokenTrim(RdStr , ':');
            CanSignal.StartBit    := StrToIntDef( GetToken(RdStr, '|'), 0);
            CanSignal.BitLen      := StrToIntDef( GetToken(RdStr, '@'), 0);

             {------------------------------------------------------------------
              Intel Type (1)               Motolora Type (0)  ����Ѷ� Ÿ���� ��ȣ�� �̷��� �Ǿ��ִ�.
              7  6  5  4  3  2  1  0       0  1  2  3  4  5  6  7
             15 14 13 12 11 10  9  8       8  9 10 11 12 13 14 15
             23 22 21 20 19 18 17 16      16 17 18 19 20 21 22 23
             ------------------------------------------------------------------}
            Str := GetToken(RdStr, '(');
            CanSignal.bByteOrder := (Str[1] = '0');   // Motorola��. Bit������.
            CanSignal.bSigned    := (Str[2] = '-');   // Signed.
            

            if (CanSignal.bByteOrder) then
            begin
                // ����Ѷ� Ÿ���ΰ�� StartBit�� msb�� ǥ���Ǿ� �ִ�. ���α׷������� lsbǥ������ �����Ѵ�.
                nByte := (CanSignal.StartBit div 8);
                nBit  := (CanSignal.StartBit mod 8);
                for j := 0 to CanSignal.BitLen-2 do begin  // -2�� �´�..
                    nBit := nBit - 1;
                    if nBit < 0 then begin
                        nBit  := 7;
                        nByte := nByte + 1;
                    end;
                end;
                CanSignal.StartBit := (nByte * 8) + nBit;
                if CanSignal.StartBit > 63 then CanSignal.StartBit := 63;
            end;

            // SCALE, OFFSET
            CanSignal.fScale   := StrToFloatDef( GetToken(RdStr, ','), 1);
            CanSignal.fOffset  := StrToFloatDef( GetToken(RdStr, ')'), 0);

            // �ִ� �ּҰ�.
            GetToken(RdStr, '[');
            CanSignal.fMin     := StrToFloatDef( GetToken(RdStr, '|'), 0);
            CanSignal.fMax     := StrToFloatDef( GetToken(RdStr, ']'), 0);

            // �ִ밪�� 0�ΰ�쿡�� Scale, Offset���� �ִ� �ּҸ� �����.
            if (CanSignal.fMin = 0) and (CanSignal.fMax = 0) then
            begin
                CanSignal.fMin := CanSignal.fOffset;
                CanSignal.fMax := (1 shl (CanSignal.BitLen)) - 1;
                CanSignal.fMax := CanSignal.fMax * CanSignal.fScale + CanSignal.fOffset;
            end;

            // ������.
            GetToken(RdStr, '"');
            CanSignal.sUnit    := GetToken(RdStr, '"');

            CanMessage.CanSignalList.Add(CanSignal);
        end else
            CanMessage := nil;

        //-----------------------------------------------
        if (Header = 'BA_DEF_DEF_') then begin
            Str := GetTokenTrim(RdStr, ' ');

            if (Str = '"Baudrate"') then
            begin
                // BA_DEF_DEF_  "Baudrate" 100000;
                Str := GetTokenTrim(RdStr, ';');
                nBaudrate := StrToIntDef(Str, 500000);
            end else

            if (Str = '"GenMsgCycleTime"') then
            begin
                // BA_DEF_DEF_  "GenMsgCycleTime" 200;

                Str := GetTokenTrim(RdStr, ';');
                nValue := StrToIntDef(Str, 0);

                // �⺻ �����ֱ⸦ �����Ѵ�.
                for j := 0 to CanMessageList.Count-1 do begin
                    TCAN_Message(CanMessageList[j]).nCycle := nValue;
                end;
            end;
            if (Str = '"GenSigSendType"') then
            begin
                nValue := 6;
                for j := 0 to CanMessageList.Count-1 do begin
                    TCAN_Message(CanMessageList[j]).nType := nValue;
                end;
            end;
        end;
        //-----------------------------------------------
        if (Header = 'BA_') then
        begin
            // BA_ "GenMsgSendType" BO_ 848 0;
            // BA_ "GenMsgCycleTime" BO_ 848 200;

            Str := GetTokenTrim(RdStr, ' ');
            if GetTokenTrim(RdStr, ' ') = 'BO_' then
            begin;
                CanID  := StrToIntDef(GetTokenTrim(RdStr, ' '), -1);
                TempMessage := FindCanMessage(CanID);
                if (TempMessage <> nil) then
                begin
                    if (Str = '"GenMsgCycleTime"') then // Cycle Time.
                    begin
                        nValue := StrToIntDef(GetTokenTrim(RdStr, ';'), 0);  // �����ֱ� ms
                        TempMessage.nCycle := nValue;
                    end else
                    if (Str = '"GenMsgSendType"') then begin
                        nValue := StrToIntDef(GetTokenTrim(RdStr, ';'), 0);  // ����Type  Cycle or Event...
                        TempMessage.nType := nValue;
                    end;
                end;
            end;
        end;
    end;

    // Message ID ������ �������� �����Ѵ�.
    for i := CanMessageList.Count-2 downto 0 do
    begin
        for j := 0 to i do begin
            if  TCAN_Message(CanMessageList[j]).CanID >  TCAN_Message(CanMessageList[j+1]).CanID then
                CanMessageList.Exchange(j, j+1);
        end;
    end;

    // Signal List �����Ѵ�.
    for i := 0 to CanMessageList.Count-1 do
    begin
        CanMessage := CanMessageList[i];
        for j := CanMessage.CanSignalList.Count-2 downto 0 do
        begin
            for k := 0 to j do begin
                if TCAN_Signal(CanMessage.CanSignalList.Items[k]).StartBit > TCAN_Signal(CanMessage.CanSignalList.Items[k+1]).StartBit then
                    CanMessage.CanSignalList.Exchange(k, k+1);
            end;
        end;
    end;
end;


//------------------------------------------------------------------------------
// CAN DB������ Tree���·� ǥ���Ѵ�.
procedure TCanDB.DisplayCanDB(TreeView : TTreeView; ParentItem : TTreeNode);
var i, j : Integer;
    CanMessage   :  TCAN_Message;
    CanSignal    : TCAN_Signal;
    Str : String;
    GroupNode, MessageNode, SignalNode : TTreeNode;

    function FindGroupNode(GroupName : String) : TTreeNode;
    var i : Integer;
        SelNode : TTreeNode;
    begin
        Result := nil;

        if ParentItem = nil then
            SelNode := TreeView.TopItem
        else
            SelNode := ParentItem.getFirstChild;
            
        while (SelNode <> nil) do begin
            if (SelNode.Text = GroupName) then begin
                Result := SelNode;
                break;
            end;
            SelNode := SelNode.GetNext;
        end;
    end;

begin
    try
        with TreeView do begin
            Items.BeginUpdate;
            Images := CanDBCImage.ImageList;
            if (ParentItem = nil) then
                Items.Clear;                  

            for i:= 0 to CanMessageList.Count-1 do
            begin
                CanMessage :=  TCAN_Message(CanMessageList[i]);

                // Group Node
                GroupNode := FindGroupNode(CanMessage.GroupName);
                if (GroupNode = nil) then begin

                    if (ParentItem = nil) then
                        GroupNode := Items.Add(nil, CanMessage.GroupName )
                    else
                        GroupNode := Items.AddChild(ParentItem, CanMessage.GroupName );

                    GroupNode.ImageIndex    := IMAGE_ECU;
                    GroupNode.SelectedIndex := IMAGE_ECU;
                end;

                Str := Format('%-15s : [0x%.3x]  %4d',
                    [CanMessage.MessageName,
                     CanMessage.CanID, CanMessage.nCycle ]);

                // Type�� 0�ΰ�츸 Cycle Message
                if CanMessage.nType = 0 then Str := Str + ' Cycle';

                MessageNode := Items.AddChild( GroupNode, Str );
                MessageNode.ImageIndex    := IMAGE_MESSAGE;
                MessageNode.SelectedIndex := IMAGE_MESSAGE;

                // Item Node.
                for j:= 0 to CanMessage.CanSignalList.Count-1 do
                begin
                    CanSignal := TCAN_Signal( CanMessage.CanSignalList[j] );

                    Str := Format('%-25s : [%2d,%2d]%s%s',
                        [CanSignal.SignalName, CanSignal.StartBit, CanSignal.BitLen,
                         IfThen(CanSignal.bByteOrder, 'M', 'I'), IfThen(CanSignal.bSigned, 'S', 'U') ]);
                         
                    if (CanSignal.fScale <> 1) or (CanSignal.fOffset <> 0) then begin
                        Str := Str + Format(' (%s,%s)',
                            [FormatFloat('0.###', CanSignal.fScale), FormatFloat('0.###', CanSignal.fOffset)]);
                    end;

                    SignalNode := Items.AddChild( MessageNode, Str );
                    SignalNode.ImageIndex    := IMAGE_SIGNAL;
                    SignalNode.SelectedIndex := IMAGE_SIGNAL;
                end;
            end;
            Items.EndUpdate;
        end;
    except
    end;
end;

end.
