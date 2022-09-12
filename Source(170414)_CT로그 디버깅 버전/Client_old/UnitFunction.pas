unit UnitFunction;

interface
uses
  SysUtils, Forms, GenUtils, StdCtrls;


function timenow : String;
function datenow : String;
function TrimCRLF_F(const Value: string): string;
function PasCount_F (const asSource, asDisc: string): longint;
function TokenStr_F (const asSource, asDisc: string; var asTok: array of string; abTrim: boolean = True): longint;
function TokenCount_F (const asSource, asDisc: string): longint;
function TokenString_F (const asSource, asDisc: string; var asTok: array of string; abTrim: boolean): longint;

procedure SaveLogFile_P(AText : String);
procedure WriteFile_P(file_name, S : String);

function MyStrToDateTime(Param : String; var DateTime : TDateTime) : Boolean;
function ModelToFindLineCode(sValue:String):String;
function ModelToFindOperCode(sValue:String):String;
procedure AddOperName(sLine:String; combo : TComboBox; Index :integer; bAllUse : Boolean);
procedure AddModelName(combo : TComboBox; Index :integer; bAllUse : Boolean);
procedure AddLineName(combo : TComboBox; Index :integer; bAllUse : Boolean);
function FindLineCode(sValue : String; Index:Integer):String;
function FindOperCode(sCode, sLine : String; Index:Integer):String;
function FindModelCode(sValue : String; Index:Integer):String;

implementation

uses TraceGrobal;

function timenow : String;
begin
  result := formatdatetime('hh:mm:ss',now);
end;

function datenow : String;
begin
  result := formatdatetime('yyyy-mm-dd',now);
end;

function TrimCRLF_F(const Value: string): string;
begin
   Result:= Value;
   while (Length(Result) > 0) and
              (Result[Length(Result)] in [#13, #10]) do
    begin
       Result := Copy(Result, 1, Length(Result) - 1);
    end;
end;

function PasCount_F (const asSource, asDisc: string): longint;
var
  sBuf: string;
  lPos, lDiscLen: longInt;
  i: longint;
begin
  result := 0;
  if asSource = '' then exit;

  lDiscLen := length (asDisc);
  if lDiscLen <= 0 then exit;

  lPos := 0; i := 0;
  sBuf := asSource + asDisc;
  while True do
  begin
    if lPos > 0 then
      Delete (sBuf, 1, lPos);
    lPos := pos (asDisc, sBuf);
    if lPos = 0 then break;  {Not Found...}

    inc (i);
    lPos := lPos + lDiscLen - 1;
  end;

  result := i;
end;

function TokenString_F (const asSource, asDisc: string; var asTok: array of string; abTrim: boolean): longint;
var
  sBuf, sFld: string;
  lPos, lDiscLen: longInt;
  i, k: longint;
begin
  result := 0;
  if asSource = '' then exit;

  lDiscLen := length (asDisc);
  if lDiscLen <= 0 then exit;

  lPos := 0; i := 0; k := low (asTok);
  sBuf := asSource + asDisc;
  while True do
  begin
    if k > high (asTok) then break;

    if lPos > 0 then
      Delete (sBuf, 1, lPos);
    lPos := pos (asDisc, sBuf);
    if lPos = 0 then break;  {Not Found...}

    if abTrim then
      sFld := trim (Copy (sBuf, 1, lPos - 1))
    else
      sFld := Copy (sBuf, 1, lPos - 1);
    asTok[k] := sFld;
    inc (k);
    inc (i);
    lPos := lPos + lDiscLen - 1;
  end;

  result := i;
end;

function TokenCount_F (const asSource, asDisc: string): longint;
var
  sBuf: string;
  lPos, lDiscLen: longInt;
  i: longint;
begin
  result := 0;
  if asSource = '' then exit; 

  lDiscLen := length (asDisc); 
  if lDiscLen <= 0 then exit; 

  lPos := 0; i := 0; 
  sBuf := asSource + asDisc; 
  while True do 
  begin
    if lPos > 0 then 
      Delete (sBuf, 1, lPos); 
    lPos := pos (asDisc, sBuf); 
    if lPos = 0 then break;  {Not Found...} 

    inc (i);
    lPos := lPos + lDiscLen - 1;
  end; 

  Result := i;
end;

function TokenStr_F (const asSource, asDisc: string; var asTok: array of string; abTrim: boolean = True): longint;
var
  sBuf, sFld: string; 
  lPos, lDiscLen: longInt; 
  i, k: longint; 
begin 
  result := 0; 
  if asSource = '' then exit; 

  lDiscLen := length (asDisc); 
  if lDiscLen <= 0 then exit; 

  lPos := 0; i := 0; k := low (asTok); 
  sBuf := asSource + asDisc;
  while True do 
  begin 
    if k > high (asTok) then break; 

    if lPos > 0 then 
      Delete (sBuf, 1, lPos); 
    lPos := pos (asDisc, sBuf); 
    if lPos = 0 then break;  {Not Found...} 

    if abTrim then 
      sFld := trim (Copy (sBuf, 1, lPos - 1)) 
    else 
      sFld := Copy (sBuf, 1, lPos - 1);
    asTok[k] := sFld; 
    inc (k); 
    inc (i); 
    lPos := lPos + lDiscLen - 1; 
  end; 

  Result := i; 
end;

procedure SaveLogFile_P(AText : String);
var
  LogFile_S, Text_s : String;
begin

  LogFile_s := ExtractfileName( Application.ExeName );
  LogFile_s := copy(LogFile_s, 1, Length(LogFile_s)-4);
  LogFile_s := GetAppDir('LOG') + LogFile_s + '\' + DatetoStr(Date) + '.log';

  Text_s := LQUOTE + formatDatetime('yy/mm/dd hh:mm:ss.zzz',now) + RQUOTE + #9
           + AText + CR + LONGLINE + SHEETLINE;
  WriteFile_P(LogFile_s, Text_s);
end;

procedure WriteFile_P(file_name, S : String);
var
  F : TextFile;
begin
  if not DirectoryExists(ExtractFilePath(file_name)) then
    ForceDirectories(ExtractFilePath(file_name));
  assignFile( F, File_name );
  try
    if not FileExists(file_name) then
      reWrite(F)
    else Append(F);

    WriteLn(F,s);
  finally
    Closefile(F);
  end;
end;

function MyStrToDateTime(Param : String; var DateTime : TDateTime) : Boolean;
var
    nYear, nMon, nDay, nHour, nMin, nSec : Word;
begin
    // 12345678901234
    // 20060102123456
    Result := False;

    if Length(Param) = 14 then begin   //yyyymmddhhmmss
      try
          nYear := StrToIntDef( Copy(Param, 1,  4), 2000);
          nMon  := StrToIntDef( Copy(Param, 5,  2), 1);
          nDay  := StrToIntDef( Copy(Param, 7,  2), 1);
          nHour := StrToIntDef( Copy(Param, 9,  2), 1);
          nMin  := StrToIntDef( Copy(Param, 11, 2), 1);
          nSec  := StrToIntDef( Copy(Param, 13, 2), 1);

          DateTime := EncodeDate(nYear, nMon, nDay) + EncodeTime(nHour, nMin, nSec, 0);

          Result := True;
      except
      end;
    end
    else if Length(Param) = 12 then begin //yymmddhhmmss
      try
          nYear := 2000+StrToIntDef( Copy(Param, 1,  2), 00);
          nMon  := StrToIntDef( Copy(Param, 3,  2), 1);
          nDay  := StrToIntDef( Copy(Param, 5,  2), 1);
          nHour := StrToIntDef( Copy(Param, 7,  2), 1);
          nMin  := StrToIntDef( Copy(Param, 9, 2), 1);
          nSec  := StrToIntDef( Copy(Param, 11, 2), 1);

          DateTime := EncodeDate(nYear, nMon, nDay) + EncodeTime(nHour, nMin, nSec, 0);

          Result := True;
      except
      end;
    end;
end;

// 모델코드를 받아오면 그 모델이 양산되는 최종 라인을 확인하여 리턴한다.
// EX 모델코드 TD100 을 받아오면
// 측정공정이 H2100,H2200,H2300,H2400,H2500,H3100,H4100 이라면
// 최종 H4100 의 두번째 자리인 4 라는 값이 라인번호가 되며 이값을 리턴한다.
function ModelToFindLineCode(sValue:String):String;
var sCompare, sTemp, sOper : String;
    i, nCnt : integer;
begin
    Result := '';
    sTemp := sValue;
    while pos(',',sTemp) > 0 do
    begin
        GetToKen(sTemp,',');
    end;

    if sTemp <> '' then sTemp := '000'+Copy(sTemp,2,1);
    Result := sTemp;

end;

// 모델코드를 받아오면 그 모델이 양산되는 최종 공정을 확인하여 리턴한다.
// EX 모델코드 TD100 을 받아오면
// 측정공정이 H2100,H2200,H2300,H2400,H2500,H3100,H4100 이라면
// 최종 H4100 공정을 리턴
function ModelToFindOperCode(sValue:String):String;
var sCompare, sTemp, sOper : String;
    i, nCnt : integer;
begin
    Result := '';
    sTemp := sValue;
    while pos(',',sTemp) > 0 do
    begin
        GetToKen(sTemp,',');
    end;

    if sTemp <> '' then Result := sTemp;

end;


// 받아온 콤보박스에 라인네임을 넣는다.
// Index -> Add 후의 ItemIndex 위치
// bAllUse : 전체 적용여부
procedure AddLineName(combo : TComboBox; Index :integer; bAllUse : Boolean);
var i : Integer;
begin
    combo.clear;
    for i:=Low(LineInfo) to High(LineInfo) do
    begin
        combo.Items.add(LineInfo[i].name);
    end;
    if bAllUse then
    begin
        combo.Items.add('ALL');
        combo.ItemIndex := combo.Items.Count-1;
    end
    else combo.ItemIndex := Index;

end;



// 받아온 콤보박스에 공정네임을 넣는다.
// Index -> Add 후의 ItemIndex 위치
// bAllUse : 전체 적용여부
procedure AddOperName(sLine:String; combo : TComboBox; Index :integer; bAllUse : Boolean);
var i : Integer;
begin
    combo.clear;
    for i:=Low(operInfo) to High(operInfo) do
    begin
        if operInfo[i].line = sLine then  combo.Items.add(operInfo[i].name);
    end;
    if bAllUse then
    begin
        combo.Items.add('ALL');
        combo.ItemIndex := combo.Items.Count-1;
    end
    else combo.ItemIndex := Index;

end;


// 받아온 콤보박스에 모델네임을 넣는다.
// Index -> Add 후의 ItemIndex 위치
// bAllUse : 전체 적용여부
procedure AddModelName(combo : TComboBox; Index :integer; bAllUse : Boolean);
var i : Integer;
begin
    combo.clear;
    for i:=Low(ModelInfo) to High(ModelInfo) do
    begin
        combo.Items.add(ModelInfo[i].name);
    end;
    if bAllUse then
    begin
        combo.Items.add('ALL');
        combo.ItemIndex := combo.Items.Count-1;
    end
    else combo.ItemIndex := Index;

end;


// 라인정보를 받아와 라인코드를 리턴
// sValue : 비교값
// Index  : 비교필드
function FindLineCode(sValue : String; Index:Integer):String;
var sCompare : String;
    i : integer;
begin
    Result := '';
    for i:=Low(LineInfo) to High(LineInfo) do
    begin
        case Index of
           0 : sCompare := LineInfo[i].code;    // 라인코드
           1 : sCompare := LineInfo[i].name;    // 라인네임
           else  sCompare := LineInfo[i].name;
        end;

        if sCompare = sValue then
        begin
            if Index = 0 then Result := LineInfo[i].name      // Return 값을 name
            else if Index = 4 then Result := Inttostr(i)      // 배열의 인덱스를 리턴
            else Result := LineInfo[i].code;                  // Return 값을 code
            break;
        end;
    end;

end;



// 공정정보를 받아와 공정코드를 리턴
// sValue : 비교값
// Index  : 비교필드
function FindOperCode(sCode, sLine : String; Index:Integer):String;
var sCompare1, sCompare2 : String;
    i : integer;
begin
    Result := '';

    ////////////////////////////////////////////////////////////////////// 경신   Start
    // 리워크
    if sCode = 'H0100' then
    begin
        if Index = 0 then Result := '리워크'
        else Result := 'H0100';
        exit;
    end;

    // 폐기
    if sCode = 'H0200' then
    begin
        if Index = 0 then Result := '폐기'
        else Result := 'H0200';
        exit;
    end;

    // 포장  패킹
    if sCode = 'H0300' then
    begin
        if Index = 0 then Result := '포장'
        else Result := 'H0300';
        exit;
    end;

    // 출하
    if sCode = 'H0400' then
    begin
        if Index = 0 then Result := '출하'
        else Result := 'H0400';
        exit;
    end;
    ////////////////////////////////////////////////////////////////////// 경신  End

    for i:=Low(OperInfo) to High(OperInfo) do
    begin
        if sLine <> '' then sCompare2 := OperInfo[i].line;  // 라인코드를 받아왔을떄만 사용
        case Index of
           0 : sCompare1 := OperInfo[i].code;    // 공정코드
           1 : sCompare1 := OperInfo[i].name;    // 공정네임
           else sCompare1 := OperInfo[i].code;    // 공정코드
        end;

        if (sCompare1 = sCode) and  (sCompare2 = sLine) then
        begin
            if Index = 0 then Result := OperInfo[i].name      // Return 값을 name
            else if Index = 4 then Result := Inttostr(i)      // 배열의 인덱스를 리턴
            else Result := OperInfo[i].code;                  // Return 값을 code
            break;
        end;
    end;

end;


// 모델정보를 받아와 모델코드를 리턴
// sValue : 비교값
// Index  : 비교필드
function FindModelCode(sValue : String; Index:Integer):String;
var sCompare : String;
    i : integer;
begin
    Result := '';
    for i:=Low(ModelInfo) to High(ModelInfo) do
    begin
        case Index of
           0,5 : sCompare := ModelInfo[i].code;  // 모델코드
           1 : sCompare := ModelInfo[i].name;    // 모델네임
           2 : sCompare := ModelInfo[i].mtype;   // DESCRIPTION
           3 : sCompare := ModelInfo[i].Oper;    // test_order
           else  sCompare := ModelInfo[i].name;
        end;

        if sCompare = sValue then
        begin
            if Index = 0 then Result := ModelInfo[i].name      // Return 값을 name
            else if Index = 4 then Result := Inttostr(i)       // 배열의 인덱스를 리턴
            else if Index = 5 then Result := ModelInfo[i].Oper // 모델의 공정을 리턴
            else Result := ModelInfo[i].code;                  // Return 값을 code
            break;
        end;
    end;

end;




end.
