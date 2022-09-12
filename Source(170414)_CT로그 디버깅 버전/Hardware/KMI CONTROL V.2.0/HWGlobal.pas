unit HWGlobal;

interface

uses
  Classes, Sysutils, SyncObjs;

Const
  MAX_STATION = 4;   // 통시접속 최대 STATION
  MAX_SLOT    = 19;  // KMI 최대 SLOT 갯수.
  MAX_CHANNEL = 32;  // 각 보드 최대 채널.
  MAX_IO_CH   = 32;

  // AD
  KMI_NONE = 0;
  KMI_AD   = 1;
  KMI_DO   = 2;
  KMI_DI   = 3;
  KMI_DA   = 4;
  KMI_RO   = 5;
  KMI_ADE  = 6;

  KMI_DM_CMD     = $0008;  // Dummy Command => 통신이 끊어지는 것을 방지 하기 위해서 주기적으로 통신을 시도해준다.
  KMI_WR_CMD     = $1010;  // Write Command => 32 Ch DO, 2 Ch RO
  KMI_RD_CMD     = $1011;  // Read  Command => 32 Ch DI
  KMI_AD_CMD     = $1012;
  KMI_ADSCAN_CMD = $1013;
  KMI_DA_CMD     = $1014;
  KMI_DO_CMD     = $1015;
  KMI_DI_CMD     = $1016;
  KMI_RO_CMD     = $1017;
  KMI_ADALL_CMD  = $1018;
  KMI_DIALL_CMD  = $1019;

  KMI_ADE_CMD         = $0211;
  KMI_ADE_BUFF_SET    = $0212;
  KMI_ADE_BUFF_READ   = $0216;
  KMI_ADE_BUFF_STATUS = $0218;

  INVALID_VALUE = -9999;

type
  TRdBuff = array of array of Double;
  TSdBuff = array of Byte;

  TBdInfo = Record
    Station   : integer;   // 자신이 속한 STATION
    Slot      : integer;   // STATION 내부의 SLOT 번호
    MaxCh     : integer;   // 해당보드의 MaxChannel 카운트
  end;

  TADScale = record
    Min, Max      : double; // 입력 Range최대/최소
    Scale, offset : Double; // 별도 Scale / Offset값.
    Range : Integer;
    sUnit : String;
  end;

var
    DOCnt, ADCnt, ADECnt, DICnt, DACnt, ROCnt : integer;
    DOCntTmp, DICntTmp, DACntTmp, ADCntTmp, ADECntTmp, ROCntTmp : integer;

    DOTbl    : array of TBdInfo;
    DITbl    : array of TBdInfo;
    DATbl    : array of TBdInfo;
    ADTbl    : array of TBdInfo;
    ROTbl    : array of TBdInfo;

    ValueTbl : array of array of Double;

    bSaveLog : Boolean;

    //DO_MAX_CH, DI_MAX_CH, RO_MAX_CH : Integer;

    function IpEnd(sIp:String):Integer;
    function ParseIp(sIp:String; nSlot:Integer):String;
    function RangeValue(param:String):Integer;
    function SampleRateToHex(sSampling:String):Byte;
    function HexToSampleRate(Param:Byte):Integer;

implementation

uses GenUtils;

// IP 의 맨 뒷자리를 리턴한다. Ex) 111.222.333.444 -> 444
function IpEnd(sIp:String):Integer;
begin
    GetToKen(sIp,'.');
    GetToKen(sIp,'.');
    GetToKen(sIp,'.');
    Result := StrToIntDef(sIp,-1);
end;

// 192.168.0.10, 5 -> 192.168.0.15
function ParseIp(sIp:String; nSlot:Integer):String;
var s1, s2, s3 : String;
begin
    s1 := GetToKen(sIp,'.');
    s2 := GetToKen(sIp,'.');
    s3 := GetToKen(sIp,'.');
    Result := s1+'.'+s2+'.'+s3+'.'+ IntToStr(StrToIntDef(sIp,0) + nSlot);
end;

//Range 값을 받아와 Index 로 리턴한다.
function RangeValue(param:String):Integer;
begin
    if param = '±10V' then Result := 0 else
    if param = '+10V'  then Result := 1 else
    if param = '±20V' then Result := 2 else
    if param = '+20V'  then Result := 3 else
    Result := 0;
end;

//******************************************************************************
// AD Buffer Read 시 Sampling Rate Table
// -----------------------------------------------------------------------------
//         최상위 Bit  |    0     |    1     |    Ch 수 Limit
//   Value             |          |          |    (Khz 단위에만 해당)
//   ------------------|----------|----------|----------------------------------
//           0         |   1Hz    |  1KHz    |    제약없음
//           1         |   2Hz    |  2KHz    |    제약없음
//           2         |   5Hz    |  5KHz    |    제약없음
//           3         |   10Hz   |  10KHz   |    20 ea
//           4         |   20Hz   |  20KHz   |    10 ea
//           5         |   50Hz   |  50KHz   |    4 ea
//           6         |   100Hz  |  100KHz  |    3 ea
//           7         |   200Hz  |  200KHz  |    1 ea
//           8         |   250Hz  |  250KHz  |    1 ea
//           9         |   300Hz  |  300KHz  |    1 ea
//           10        |   500Hz  |  500KHz  |    1 ea
//******************************************************************************

// 100KHz -> 86
function SampleRateToHex(sSampling:String) : Byte;
var sHighBit, sLowBit : String;
    nValue : Integer;
    LowBit, HighBit : Byte;
begin
    sSampling := UpperCase(sSampling);
    if Pos('KHZ',sSampling) > 0 then
    begin
        nValue := StrToIntDef(GetToKen(sSampling,'KHZ'),0);
        HighBit := $8;
    end
    else
    begin
        nValue := StrToIntDef(GetToKen(sSampling,'HZ'),0);
        HighBit := $0;
    end;
    case nValue of
          1  : LowBit := $0;
          2  : LowBit := $1;
          5  : LowBit := $2;
         10  : LowBit := $3;
         20  : LowBit := $4;
         50  : LowBit := $5;
        100  : LowBit := $6;
        200  : LowBit := $7;
        250  : LowBit := $8;
        300  : LowBit := $9;
        500  : LowBit := $A;
    end;
    Result := HighBit*$10 + LowBit;
end;

// 86 -> 100000(100KHz)
function HexToSampleRate(Param:Byte):Integer;
var nValue: Integer;
    xTemp : Byte;
begin
    xTemp := (Param and $0F);
    if xTemp = $0 then nValue := 1
    else if xTemp = $1 then nValue := 2
    else if xTemp = $2 then nValue := 5
    else if xTemp = $3 then nValue := 10
    else if xTemp = $4 then nValue := 20
    else if xTemp = $5 then nValue := 50
    else if xTemp = $6 then nValue := 100
    else if xTemp = $7 then nValue := 200
    else if xTemp = $8 then nValue := 250
    else if xTemp = $9 then nValue := 300
    else if xTemp = $A then nValue := 500;

    xTemp := (Param and $F0) Shr 4;
    if xTemp = $8 then nValue := nValue * 1000;
    Result := nValue;
end;

end.
