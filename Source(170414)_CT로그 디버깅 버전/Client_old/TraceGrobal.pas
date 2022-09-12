unit TraceGrobal;

interface

uses Messages, IniFiles, SysUtils, forms, StdCtrls;


const
  MAX_WORK_COUNT = 50;
  DELIN_CHAR = ':';

  SERVER_PORT = 6010;
  CLIENT_PORT = 6020;

  CHECK_FAIL = 0;
  CEHCK_PASS = 1;
  CHECK_REWO = 2;
  CHECK_NEWD = 3;  // �ű� �ø��� ����
  CHECK_UPDA = 4;  // �ø��� ���� ������Ʈ

  CRLF=#13#10;
  CR=#13;
  STX  = #2;
  SI  = #15;
  ETX  = #3;
  EOT  = #4;
  ENQ  = #5;
  ACK  = #6;
  NAK  = #21;
  FS   = #28;
  SYN  = #22;
  ENC  = #32;
  NULL = #0;
  ZERO = #48;
  ONE  = #49;
  OC   = #12;

  LQUOTE = '(';
  RQUOTE = ')';
  QUOTE = '"';
  SQUOTE = '''';
  COMMA = ',';

  SUBJECT = 'DB_SERVER';

  SHEETLINE = '--------------------';
  LONGLINE = SHEETLINE + SHEETLINE;

  WP_TREATMSG   = WM_USER +  101; // TSERVER
  WP_VIEWTREATMSG = WM_USER +  105; // TSERVER
  WM_APPSTARTUP = WM_USER +  110;
  AUTORUN_KEY = 'Software\Microsoft\Windows\CurrentVersion\run';

type
  TTestInfo = record
    TestTime : Tdatetime;     // �۾��ð�.
    sWorkNo   : String;       // �۾�����.
    sSerialNo : String;       // SERIAL NO.

    Endtime : Tdatetime;
    sTactime : Integer;

    sTestResult : String;     // �������.
    sOption1  : String;       // �����ɼ�1
    sOption2  : String;       // �����ɼ�2
    sOption3  : String;       // �����ɼ�3
    sOption4  : String;       // �����ɼ�4
    sOption5  : String;       // �����ɼ�5
    sOption6  : String;       // �����ɼ�6
    sOption7  : String;       // �����ɼ�7
    sOption8  : String;       // �����ɼ�8
    sOption9  : String;       // �����ɼ�9
  end;

  TTestWork = Record
    sWorkcode : String;
    sState    : String;
  end;

  TConfig = Record
    Database  : String;
    HostName  : String;
    Port      : String;
    UserID : String;
    password  : String;
  end;

  TNGInfo = record
    code : String;
    oper : String;
    desc : String;
  end;

  TReworkInfo = record
    code, desc : String;
    //idx : String;
    //date : Tdatetime;
    //serial : String;
    //opercode : String;
    //ngcode : String;
    //result : String;
    //operDe : String;
    //ngDe : String;
    //memo : String;
  end;

  TOrderInfo = record
    orderdate : String;
    //date : DateTime;
    model : String;
    line : String;
    TestCount : integer;
    ShipCount : integer;
    isOrder   : boolean;
  end;

  // �۾� ���� ����.
  TWorkInfo = record
    LineNo        : String;    // LINE ��ȣ.
    WorkNo        : String;    // ������ȣ
    WorkName      : String;    // �����̸�.
    WorkIP        : String;    // ���� IP
    PrevWorkCode1 : String;    // ���������ڵ�1
    PrevWorkCode2 : String;    // ���������ڵ�2

    bOnLine  : Boolean;
    sStatus  : String;
    SerialNo : String;
    nGoodCount, nFailCount : Integer;
    bVisible : Boolean;
  end;

  TModelInfo = record
    code     : String;
    name     : String;
    mtype    : String;
    Oper     : String;
    Final    : String; // �ش���� ��������
  end;

  TLineInfo = record
    code  : String;
    name  : String;
    Final : Integer;  // ����ȿ���� ����� ���� ���ʵ����͸� ��ȸ�� ���κ� ���������� �迭 Index �� �־�δ� ����
  end;

  TOperInfo = record
     code : String;
     name : String;
     line : String;
     used : Integer;
  end;

  TEfficInfo = record
     date : String;
     line : String;
     ctime : String;
     am   : String;
     pm   : String;
  end;

  TLostInfo = record
    code  : String;
    name  : String;
  end;


var
    //NgList_AR : Array of TNGInfo;
    TestInfo : TTestInfo;
    TestWork : Array of TTestWorK;
    ReworkList_AR : Array of TReworkInfo;
    ModelList_S : String;
    ModelInfo : Array of TModelInfo;
    LineInfo : Array of TLineInfo;
    OperInfo : Array of TOperInfo;
    NgInfo : Array of TNgInfo;
    OrderInfo : Array of TOrderInfo;
    ReworkInfo : Array of TReworkInfo;
    EfficInfo : Array of TEfficInfo;
    LostInfo : Array of TLostInfo;
    DBconfig : TCONFIG;

    // �۾����� ���.
    WorkInfoList : array [1..MAX_WORK_COUNT] of TWorkInfo;
    nWorkCount   : Integer;
    // (08:30 ~ ���� 08:00 �������)
    // ����ð��� ���� 07:00 ��� �ϸ� �۾����� ���ڴ� TodayDate �� �����ڸ� �Է��Ѵ�.
    TestDate, TodayDate, nextDate : String;  // �ɼ��� �۾����� �ð��� �������� ���ó��ڸ� �Ǻ��Ѵ�.

    AmStartTime, AmEndTime, PmStartTime, PmEndTime : String;


  Procedure LoadDBINI;
  procedure SaveDBINI(sHostName, sDataBase,  sPort, sUserID, sPassWord : String);
  function MyStrToDateTime(Param : String; var DateTime : TDateTime) : Boolean;
  function ModelToFindLineCode(sValue:String):String;
  function ModelToFindOperCode(sValue:String):String;
  procedure SaveLogFile(AText : String);
  procedure WriteFile(FileName, msg : String);
  procedure AddMsg(ListBox:TListBox; Msg : String);

implementation

uses GenUtils;

// DB ���� ������ �ε��Ѵ�.
Procedure LoadDBINI;
var  TempINI: TIniFile;
begin
    TempINI := TIniFile.Create(ExtractFilePath (Application.ExeName)+ 'config.ini');
    DBconfig.HOSTNAME :=TempINI.ReadString(SUBJECT,'HOSTNAME','127.0.0.1');
    DBconfig.Database :=TempINI.ReadString(SUBJECT,'Database','TestDB');
    DBconfig.port     :=TempINI.ReadString(SUBJECT,'port','6010');
    DBconfig.UserID   :=TempINI.ReadString(SUBJECT,'UserID','sysdba');
    DBconfig.password :=TempINI.ReadString(SUBJECT,'password','masterkey');

    TempINI.Free;
end;


// DB ���� ������ INI �������Ѵ�.
procedure SaveDBINI(sHostName, sDataBase,  sPort, sUserID, sPassWord : String);
var TempINI: TIniFile;
begin
    TempINI := TIniFile.Create (ExtractFilePath (Application.ExeName)+ 'config.ini');
    TempINI.WriteString (SUBJECT, 'UserID', sUserID);
    TempINI.WriteString (SUBJECT, 'password', sPassWord);
    TempINI.WriteString (SUBJECT, 'port', sPort);
    TempINI.WriteString (SUBJECT, 'HOSTNAME', sHostName);
    TempINI.WriteString (SUBJECT, 'Database', sDataBase);

    TempINI.Free;
end;


function MyStrToDateTime(Param : String; var DateTime : TDateTime) : Boolean;
var nYear, nMon, nDay, nHour, nMin, nSec : Word;
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

// ���ڵ带 �޾ƿ��� �� ���� ���Ǵ� ���� ������ Ȯ���Ͽ� �����Ѵ�.
// EX ���ڵ� TD100 �� �޾ƿ���
// ���������� H2100,H2200,H2300,H2400,H2500,H3100,H4100 �̶��
// ���� H4100 �� �ι�° �ڸ��� 4 ��� ���� ���ι�ȣ�� �Ǹ� �̰��� �����Ѵ�.
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

// ���ڵ带 �޾ƿ��� �� ���� ���Ǵ� ���� ������ Ȯ���Ͽ� �����Ѵ�.
// EX ���ڵ� TD100 �� �޾ƿ���
// ���������� H2100,H2200,H2300,H2400,H2500,H3100,H4100 �̶��
// ���� H4100 ������ ����
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


// �α�����
procedure SaveLogFile(AText : String);
var
    LogFile, Str : String;
begin
    LogFile := ExtractfileName( Application.ExeName );
    LogFile := copy(LogFile, 1, Length(LogFile)-4);
    LogFile := GetAppDir('LOG') + LogFile + '\' + DatetoStr(Date) + '.log';
    Str := LQUOTE + formatDatetime('yy/mm/dd hh:mm:ss.zzz',now) + RQUOTE + #9 + AText + CR + LONGLINE + SHEETLINE;

    WriteFile(LogFile, Str);
end;

// ��������
procedure WriteFile(FileName, msg : String);
var tFile : TextFile;
begin
    if not DirectoryExists(ExtractFilePath(FileName)) then ForceDirectories(ExtractFilePath(FileName));
    assignFile( tFile, FileName );
    try
        if not FileExists(FileName) then
            reWrite(tFile)
        else Append(tFile);

        WriteLn(tFile,msg);
    finally
        Closefile(tFile);
    end;
end;

procedure AddMsg(ListBox:TListBox; Msg : String);
var i : Integer;
begin
    if ListBox.Items.Count > 100 then
    begin
        for i := 1 to 20 do
            ListBox.Items.Delete(0);
    end;
    ListBox.ItemIndex := ListBox.Items.Add('['+FormatDateTime('HH:NN:SS.ZZZ',now)+']  '+Msg);
    SaveLogFile(Msg);
//    ListBox.Perform(EM_LineScroll, 0, ListBox.Items.Count);

end;


end.
