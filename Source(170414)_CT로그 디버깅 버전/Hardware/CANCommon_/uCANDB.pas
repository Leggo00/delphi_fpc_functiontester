{===============================================================================

    uCANDB
    CAN 관련 DB정보를 저장하고 관리한다.

    2009. 4. 7  Motolora / Intel Type 둘다지원
                메세지 List 정렬.

===============================================================================}

unit uCANDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Tabs, ImgList, Buttons, StdCtrls;

const
  INVALID_VALUE = -9999;

type
  //----------------------------------------------------------------------------
  // CAN Message의 개별 ID.
  TCanMessage = class
  private
      FParent    : TObject;
      function  GetValue : Double;
      procedure SetValue(Param: Double);
  public
      MsgName   : String;
      CanID     : Integer;
      StartBit  : Integer;
      BitLen    : Integer;
      sUnit     : String;
      bByteOrder : Boolean;         // 0 = Motolora. StartBit가 MSB임.  1 = Intel
      fScale, fOffset, fMin, fMax : Double;

      constructor Create(Parent : TObject);
      destructor  Destroy;
      property Value : Double read GetValue write SetValue;
  end;

  //----------------------------------------------------------------------------
  TCanFrame = class(TObject)
  private
      function  GetText : String;
      procedure SetText(Param : String);
  public
      FrameName, GroupName : String;
      CanID     : Integer;      // CAN ID.
      nLen      : Integer;      // Message Size.
      nCycle    : Integer;      // 전송주기
      Data      : array[0..7] of Byte;
      nType     : Integer;      // 전송Type

      CanMessageList : TList;
      constructor Create;
      destructor  Destroy;
      procedure   Assign(Param : TCanFrame);
      procedure   UpdateCanInfo;

      function    GetValue(StartBit, BitLen : Integer; bMotoType : Boolean = False) : Integer;
      function    SetValue(StartBit, BitLen, Value : Integer ; bMotoType : Boolean = False) : Boolean;

      property    Text : String read GetText write SetText;
  end;

  //----------------------------------------------------------------------------
  // CAN DB를 관리한다.
  TCanDB = class
  private
    function  AddCanFrame(CanFrame: TCANFrame): Boolean;
    function  SetDBC(StrList : TStringList) : boolean;
  public
    CanFrameList : TList;
    CanBuff   : TStringList;
    ValTable  : TStringList;
    
    constructor Create;
    destructor  Destroy;
    procedure   Assign(Param : TCanDB);
    function    FindCanFrame(CanID: Integer): TCanFrame;
    function    FindCanMessage(sMsgName : String) : TCanMessage;

    // File Operation
    function   LoadFromFile(FileName : String) : Boolean;
    function   SaveToFile(FileName : String) : Boolean;

    procedure  AddCanData(Param : String);
    function   GetCanData(CanID : Integer) : String;
    procedure  DisplayCanDB(TreeView : TTreeView; ParentItem : TTreeNode);
    function   GetTblValue(sMsg, sValue : String) : String;

  end;

implementation

uses GenUtils, UnitImage;


//==============================================================================
{ TCanInfo }

constructor TCanMessage.Create(Parent : TObject);
begin
    CanID     := 0;
    FParent   := Parent;
    MsgName   := '';
    StartBit  := 0;
    BitLen    := 0;
    sUnit     := ''
end;

destructor TCanMessage.Destroy;
begin
    //
end;

function TCanMessage.GetValue : Double;
var nValue : Integer;
    CanFrame : TCanFrame;
begin
    // 자신이 속한 Frame에서 해당값을 얻는다.
    Result := INVALID_VALUE;
    if (FParent = nil) then exit;

    try
        CanFrame := TCanFrame(FParent);
        nValue   := CanFrame.GetValue(StartBit, BitLen, bByteOrder);

        if fScale <> 1 then
            Result := (nValue * fScale) + fOffset
        else
            Result := nValue;
    except
    end;
end;

procedure TCanMessage.SetValue(Param: Double);
var
    nValue : Integer;
    CanFrame : TCanFrame;
begin
    if (FParent = nil) then exit;
    try
        if (Param < fMin) then Param := fMin;
        if (Param > fMax) then Param := fMax;

        if fScale <> 0 then begin
            nValue := Trunc((nValue - fOffset) / fScale);
        end else
            nValue := Trunc(Param);

        CanFrame := TCanFrame(FParent);
        CanFrame.SetValue(StartBit, BitLen, nValue, bByteOrder);
    finally
    end;
end;

//==============================================================================
{ TCANMsg }

constructor TCanFrame.Create;
var i : Integer;
begin
    CanMessageList := TList.Create;

    FrameName := '';
    GroupName := '';
    CanID     := 0;
    nLen      := 0;
    nCycle    := 0;

    for i:= 0 to 7 do Data[i] := 0;
end;

destructor TCanFrame.Destroy;
begin
    CanMessageList.Free;
end;

procedure TCanFrame.UpdateCanInfo;
var i : Integer;
   // Str : String;
   // CanInfo : TCanInfo;
  //  fValue : Double;
begin    {
    for i:= 0 to CanMessageList.Count-1 do
    begin
        // Data를 계산한다.
        CanMessage := TCanMessage(CanMessageList[i]);
        fValue  := CanInfo.Value;
    end;  }
end;


function TCanFrame.GetValue(StartBit, BitLen : Integer; bMotoType : Boolean = False) : Integer;
var i, Idx : Integer;
    nByte, nBit, nInc : Integer;
begin
    // 시작비트로 Byte 위치와 Bit위치 판단.

    nByte := (StartBit div 8);
    nBit  := (StartBit mod 8);
    if (bMotoType) then nInc := -1 else nInc := 1;

    Result := 0;
    for i:= 0 to BitLen-1 do
    begin
        if not (nByte in [0..7]) then break;

        if ((Data[nByte] and (1 shl nBit)) <> 0) then
            Result := Result or (1 shl i);

        nBit := nBit + 1;
        if (nBit > 7) then begin
            nByte := nByte + nInc;
            nBit := 0;
        end;
    end;
end;

function TCanFrame.SetValue(StartBit, BitLen, Value : Integer ; bMotoType : Boolean = False) : Boolean;
var i, Idx : Integer;
    nByte, nBit, nInc : Integer;
    WtStr : String;
begin
    Result := False;
    if CanID < 0 then exit;

    // 시작비트로 Byte 위치와 Bit위치 판단.
    nByte := (StartBit div 8);
    nBit  := (StartBit mod 8);

    if (bMotoType) then nInc := -1 else nInc := 1;

    for i:= 0 to BitLen-1 do
    begin
        if not (nByte in [0..7]) then break;

        if ((Value and (1 shl i)) <> 0) then
            Data[nByte] := Data[nByte] or (1 shl nBit)              // 비트를 1로 Set
        else
            Data[nByte] := Data[nByte] and (not Byte(1 shl nBit));  // 비트를 0으로 Set.

        nBit := nBit + 1;
        if (nBit > 7) then begin
            nByte := nByte + nInc;
            nBit := 0;
        end;
    end;
    Result := True;
end;

procedure TCanFrame.Assign(Param: TCanFrame);
var i: Integer;
begin
    if (Param <> nil) then begin
        FrameName := Param.FrameName;
        GroupName := Param.GroupName;
        CanID     := Param.CanID;
        nLen      := Param.nLen;
        for i:= 0 to 7 do
            Data[i] := Param.Data[i];
        nCycle    := Param.nCycle;
        nType     := Param.nType;

        CanMessageList.Assign(Param.CanMessageList);
    end else
    begin
        FrameName := '';
        GroupName := '';
        CanID     := -1;
        nLen      := 0;
        for i:= 0 to 7 do
            Data[i] := 0;
        nCycle := 0;
        nType  := 0;
        CanMessageList.Clear;
    end;
end;

function TCanFrame.GetText: String;
var Str : String;
begin
    // ID=00 00 00 00 : nCycle [MessageName] GroupName  이런형식.
    if (FrameName = '') then
        Result := Format('%X=%s: %d', [CanID, MakeHexaString(@Data[0], nLen), nCycle])
    else
        Result := Format('%X=%s: %d [%s] %s',
            [CanID, MakeHexaString(@Data[0], nLen), nCycle, FrameName, GroupName]);
end;

procedure TCanFrame.SetText(Param: String);
var i : Integer;
    Str, RdStr : String;
begin
    // ID=00 00 00 00 : nCycle [MessageName] GroupName  이런형식.
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

    // MessageName이 있는경우에만 이름변경. 
    if (Param <> '') then begin
        FrameName := GetToken(Param, ']');
        GroupName := Trim(Param);
    end;
end;

{ TCanDB }

constructor TCanDB.Create;
begin
    CanFrameList := TList.Create;
    CanBuff  := TStringList.Create;
    ValTable := TStringList.Create;

end;

destructor TCanDB.Destroy;
begin
    CanBuff.Free;
    ValTable.Free;
    CanFrameList.Free;
end;

procedure TCanDB.Assign(Param : TCanDB);
begin
    //
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
// CAN Message 를찾는다.
function TCanDB.AddCanFrame(CanFrame: TCANFrame): Boolean;
begin
    if CanFrame <> nil then begin
        CanFrameList.Add(CanFrame);
        Result := True;
    end else
        Result := False;
end;

//------------------------------------------------------------------------------
// CAN Message를 찾는다.
function TCanDB.FindCanFrame(CanID: Integer): TCanFrame;
var i : Integer;
    CanFrame : TCanFrame;
begin
    Result := nil;
    for i := 0 to CanFrameList.Count-1 do
    begin
        CanFrame := TCANFrame(CanFrameList[i]);
        if (CanFrame.CanID = CanID) then begin
            Result := CanFrame;
            break;
        end;
    end;
end;

//------------------------------------------------------------------------------
// CAN Message를 Name으로 찾는다.
function TCanDB.FindCanMessage(sMsgName : String) : TCanMessage;
var i, j: Integer;
    CanFrame : TCanFrame;
    CanMessage : TCanMessage;
begin
    Result := nil;

    for i := 0 to CanFrameList.Count-1 do
    begin
        CanFrame := TCanFrame(CanFrameList[i]);
        for j:= 0 to CanFrame.CanMessageList.Count-1 do
        begin
            CanMessage := TCanMessage(CanFrame.CanMessageList[j]);
            if (CanMessage.MsgName = sMsgName) then
            begin
                Result := CanMessage;
                exit;
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------
// CAN 정보를 파일에서 읽는다.
function TCanDB.LoadFromFile(FileName: String): Boolean;
var i : Integer;
    StrList : TStringList;
begin
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
// CAN정보를 파일로 저장한다.
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
// 테이블에서 값을 찾아 표시한다.
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
// DBC파일을 분석한다.
function TCanDB.SetDBC(StrList : TStringList) : boolean;
var i, j, k, CanID, nValue, nByte, nBit : Integer;
    Str, Header, RdStr, WtStr : String;
    CanFrame, TempFrame  : TCanFrame;
    CanMessage, TempMessage : TCanMessage;
begin
      {
      BO_ 398 H_U13: 8 H_U
       SG_ HF_TransferCallStatus : 1|2@0+ (1,0) [0|3] ""  MON
       SG_ HF_TelephoneStatus : 15|3@0+ (1,0) [0|7] ""  MON
       SG_ HF_PairingStatus : 5|2@1+ (1,0) [0|3] ""  MON
      }
    ValTable.Clear;
    CanFrameList.Clear;
    CanFrame := nil;
    for i:= 0 to StrList.Count-1 do begin
        RdStr := Trim(StrList[i]);
        if RdStr = '' then continue;

        Header := GetTokenTrim(RdStr, ' ');

        // CAN Message
        if (Header = 'VAL_TABLE_') then
        begin
            // VAL_TABLE_ C_MUTCheck 1 "ON" 0 "OFF" ;
            WtStr := GetTokenTrim(RdStr, ' ');
            // 구분자로 편하게 하기위해 변경.
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
            // 구분자로 편하게 하기위해 변경.
            if WtStr <> '' then begin
                WtStr := WtStr + '=' + RdStr;// ReplaceStr(RdStr + ' ', '" ', '";');
                ValTable.Add(WtStr);
            end;
        end else

        if (Header = 'BO_') then
        begin
            // BO_ 398 H_U13: 8 H_U
            CanFrame := TCanFrame.Create;
            CanFrame.CanID     := StrToIntDef(GetToken(RdStr, ' '), -1);
            CanFrame.FrameName := GetTokenTrim(RdStr, ':');
            RdStr := Trim(RdStr);
            CanFrame.nLen      := StrToIntDef(GetToken(RdStr, ' '), 8);
            CanFrame.GroupName := GetTokenTrim(RdStr, ' ');

            CanFrameList.Add(CanFrame);
        end else

        // CAN Detail Message
        if (CanFrame <> nil) and (Header = 'SG_') then
        begin
            //  SG_ HF_TelephoneStatus : 15|3@0+ (1,0) [0|7] ""  MON
             // SG_ DATC_PsTemp_Disp_C : 37|6@1- (0.5,17) [17|48.5] "centigrade"  MON,H_U
            //  메세지명               StartBit|Len@Order+ (Scale,Offset) [Min|Max] "단위" RX_UNIT

            CanMessage := TCanMessage.Create(CanFrame);
            CanMessage.CanID     := CanFrame.CanID;
            CanMessage.MsgName   := GetTokenTrim(RdStr , ':');
            CanMessage.StartBit  := StrToIntDef( GetToken(RdStr, '|'), 0);
            CanMessage.BitLen    := StrToIntDef( GetToken(RdStr, '@'), 0);

{
        Intel Type (1)               Motolora Type (0)  모토롤라 타입은 번호가 이렇게 되어있다.
        7  6  5  4  3  2  1  0       0  1  2  3  4  5  6  7
       15 14 13 12 11 10  9  8       8  9 10 11 12 13 14 15
       23 22 21 20 19 18 17 16      16 17 18 19 20 21 22 23
}
            Str := GetToken(RdStr, '(');
            CanMessage.bByteOrder := (Str[1] = '0');

            if (CanMessage.bByteOrder) then
            begin
                // 모토롤라 타입인경우 StartBit가 msb로 표현되어 있다. 프로그램에서는 lsb표현으로 통일한다.
                nByte := (CanMessage.StartBit div 8);
                nBit  := (CanMessage.StartBit mod 8);
                for j := 0 to CanMessage.BitLen-2 do begin  // -2가 맞다..
                    nBit := nBit - 1;
                    if nBit < 0 then begin
                        nBit  := 7;
                        nByte := nByte + 1;
                    end;
                end;
                CanMessage.StartBit := (nByte * 8) + nBit;
                if CanMessage.StartBit > 63 then CanMessage.StartBit := 63;
            end;

            // SCALE, OFFSET
            CanMessage.fScale   := StrToFloatDef( GetToken(RdStr, ','), 1);
            CanMessage.fOffset  := StrToFloatDef( GetToken(RdStr, ')'), 0);

            // 최대 최소값.
            GetToken(RdStr, '[');
            CanMessage.fMin     := StrToFloatDef( GetToken(RdStr, '|'), 0);
            CanMessage.fMax     := StrToFloatDef( GetToken(RdStr, ']'), 0);

            // 최대값이 0인경우에는 Scale, Offset으로 최대 최소를 만든다.
            if (CanMessage.fMin = 0) and (CanMessage.fMax = 0) then
            begin
                CanMessage.fMin := CanMessage.fOffset;
                CanMessage.fMax := (1 shl (CanMessage.BitLen)) - 1;
                CanMessage.fMax := CanMessage.fMax * CanMessage.fScale + CanMessage.fOffset;
            end;

            // 단위값.
            GetToken(RdStr, '"');
            CanMessage.sUnit    := GetToken(RdStr, '"');

            CanFrame.CanMessageList.Add(CanMessage);
        end else
            CanFrame := nil;

        if (Header = 'BA_') then
        begin
            // BA_ "GenMsgSendType" BO_ 848 0;
            // BA_ "GenMsgCycleTime" BO_ 848 200;

            Str := GetTokenTrim(RdStr, ' ');
            if GetTokenTrim(RdStr, ' ') = 'BO_' then
            begin;
                CanID  := StrToIntDef(GetTokenTrim(RdStr, ' '), -1);
                TempFrame := FindCanFrame(CanID);
                if (TempFrame <> nil) then
                begin
                    if (Str = '"GenMsgCycleTime"') then // Cycle Time.
                    begin
                        nValue := StrToIntDef(GetTokenTrim(RdStr, ';'), 0);  // 전송주기 ms
                        TempFrame.nCycle := nValue;
                    end else
                    if (Str = '"GenMsgSendType"') then begin
                        nValue := StrToIntDef(GetTokenTrim(RdStr, ';'), 0);  // 전송Type  Cycle or Event...
                        TempFrame.nType := nValue;
                    end;
                end;
            end;
        end;
    end;

    
    // Message ID 순으로 보기좋게 정렬한다.
    for i := CanFrameList.Count-2 downto 0 do
    begin
        for j := 0 to i do begin
            if TCanFrame(CanFrameList[j]).CanID > TCanFrame(CanFrameList[j+1]).CanID then
                CanFrameList.Exchange(j, j+1);
        end;
    end;

    // Signal List 정렬한다.
    for i := 0 to CanFrameList.Count-1 do
    begin
        CanFrame := CanFrameList[i];
        for j := CanFrame.CanMessageList.Count-2 downto 0 do
        begin
            for k := 0 to j do begin
                if TCanMessage(CanFrame.CanMessageList.Items[k]).StartBit > TCanMessage(CanFrame.CanMessageList.Items[k+1]).StartBit then
                    CanFrame.CanMessageList.Exchange(k, k+1);
            end;
        end;
    end;
end;


//------------------------------------------------------------------------------
// CAN DB정보를 Tree형태로 표시한다.
procedure TCanDB.DisplayCanDB(TreeView : TTreeView; ParentItem : TTreeNode);
var i, j : Integer;
    CanFrame   : TCanFrame;
    CanMessage : TCanMessage;
    Str : String;
    GroupNode, FrameNode, MessageNode : TTreeNode;

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

            if (ParentItem = nil) then
                Items.Clear;                  

            for i:= 0 to CanFrameList.Count-1 do
            begin
                CanFrame := TCanFrame(CanFrameList[i]);

                // Group Node
                GroupNode := FindGroupNode(CanFrame.GroupName);
                if (GroupNode = nil) then begin

                    if (ParentItem = nil) then
                        GroupNode := Items.Add(nil, CanFrame.GroupName )
                    else
                        GroupNode := Items.AddChild(ParentItem, CanFrame.GroupName );

                    GroupNode.ImageIndex    := IMAGE_ECU;
                    GroupNode.SelectedIndex := IMAGE_ECU;
                end;

                if (CanFrame.nCycle > 0) then begin
                    Str := Format('%-15s : [0x%x] Cycle:%d', [CanFrame.FrameName, CanFrame.CanID, CanFrame.nCycle, CanFrame.nType]);
                end else
                    Str := Format('%-15s : [0x%x]', [CanFrame.FrameName, CanFrame.CanID]);

                FrameNode := Items.AddChild( GroupNode, Str );
                FrameNode.ImageIndex    := IMAGE_FRAME;
                FrameNode.SelectedIndex := IMAGE_FRAME;

                // Item Node.
                for j:= 0 to CanFrame.CanMessageList.Count-1 do
                begin
                    CanMessage := TCanMessage( CanFrame.CanMessageList[j] );
                    if (CanMessage.fScale = 1) and (CanMessage.fOffset = 0) then begin
                        Str := Format('%-20s : [%2d,%2d]',
                            [CanMessage.MsgName, CanMessage.StartBit, CanMessage.BitLen]);
                    end else begin
                        Str := Format('%-20s : [%2d,%2d] (%s,%s)',
                            [CanMessage.MsgName, CanMessage.StartBit, CanMessage.BitLen,
                             FormatFloat('0.###', CanMessage.fScale), FormatFloat('0.###', CanMessage.fOffset)]);
                    end;

                    MessageNode := Items.AddChild( FrameNode, Str );
                    MessageNode.ImageIndex    := IMAGE_MESSAGE;
                    MessageNode.SelectedIndex := IMAGE_MESSAGE;
                end;
            end;
            Items.EndUpdate;
        end;
    except
    end;
end;


end.
