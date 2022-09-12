unit Global;

interface

uses Classes, Windows, SysUtils, IniFiles, Grids, uCanUnit, uCanDBC;

const
    SW_VERSION = 'Ver.100625';
    SW_NAME    = 'KMI SIMULATOR';

    MAX_UNIT = 1;
    
    TAB_CHAR = '    ';

    ITEM_INPUT    = 0;
    ITEM_OUTPUT   = 1;
    ITEM_ALL      = 2;

    SAVE_ALL      = 0;
    SAVE_GOOD     = 1;
    SAVE_FAIL     = 2;
    SAVE_NONE     = 3;

    INVALID_VALUE = 99999;
type
    TResType  = ( res_AO, res_DO, res_RO, res_PO, res_COMOUT, res_VROUT,
                  res_AD, res_DI, res_COMIN, res_VRIN, res_CAN,
                  res_Cmd, res_None );

    TTestState     = ( ts_None, ts_Ready, ts_Running, ts_Good, ts_Fail, ts_Stop );
    TTestLampState = ( tls_Ready, tls_Running, tls_Error );

var
    ResNameTbl : array[TResType] of String =
        ('AO', 'DO', 'RO', 'PO', 'COMOUT', 'VROUT',
         'AD', 'DI', 'COMIN', 'VRIN', 'CAN',
         'CMD', 'N/A');

    CmdList : array [0..4] of String =
        ('RESET', 'DELAY', 'GRAPH', 'PAUSE', 'MESSAGE' );

type
    TResourceItem = record
        ResName, GroupName : String;    // 자원이름
        ResType   : TResType;           // 자원종류
        IOName    : String;             // IO Name
        tagStr    : String;             // tag String
//        Option    : String;
        Value     : String;             // 측정값저장용.
    end;

    TResItem = class
    private
        function  GetValue: String;
        procedure SetValue(Param: String);
    public
        ResType : TResType;
        ResCode, ResGroup, ResName : String;
        HwInfo, sUnit, Option, Description : String;
        InMin, InMax, OutMin, OutMax : Double;

        Value : String;   // -> 최종값을 기록한다.

        constructor Create();
        destructor  Destroy(); override;
        procedure   Assign(Param : TResItem);
    property
        Text : String read GetValue write SetValue;
    end;

    //--------------------------------------------------------
    // 각 시험스텝구조.
    TTestStep = class
    public
        StepName : String;
        Enabled  : Boolean;
        InputList1, InputList2, OutputList, CheckList, OptionList : TStringList;

        constructor Create();
        destructor  Destroy(); override;
        procedure   Clear();

        procedure   Assign(TestStep : TTestStep);
        procedure   LoadFromStringList(Strlist: TStrings);
        procedure   SaveToStrList(Strlist: TStrings);
    end;
{
    //--------------------------------------------------------
    // GROUP 정보.
    TTestGroup = class
    public
        StepName : String;
        Enabled  : Boolean;

        TestStepList : TList;
        constructor Create();
        destructor  Destroy(); override;
        procedure   Clear();
        procedure   Assign(TestStep : TTestGroup);
    end;
}
    //--------------------------------------------------------
    // 프로젝트 구조.
    TTestProjcet = class
    private
        TestStepList : TList;
    public
        ModelName : String;
        ResList   : array [TResType]  of TStringList;

        CanDB     : array[1..2] of TCanDB; // CAN PORT 두개..

        constructor Create();
        destructor  Destroy(); override;

        // Step Operation.
        function  AddStep(NewStep : TTestStep) : Integer;
        procedure InsertStep(Idx : Integer; NewStep : TTestStep);
        procedure DeleteStep(Idx : Integer);
        procedure ClearStep();
        function  GetStep(Idx : Integer) : TTestStep;
        function  GetStepCount() : Integer;

        // Resource Operation.
        procedure ClearResource();
        function  GetResource(ResType : Integer; ResName : String) : TResourceItem;

        // File Operation.
        function  LoadFromFile(FileName : String) : Boolean;
        function  SaveToFile(FileName : String)   : Boolean;
    end;
    //--------------------------------------------------------

var
    CurrProject : TTestProjcet;

    gBaseDir         : String;
    gLayoutFile      : String;      // 화면배치파일.
    gProjectFileName : String;
    gCanDBFile       : array[1..2] of String;
    gNormPassword    : string;

    gDragResourceItem : TResourceItem;

    DragResourceItem : TResItem;

    UnitInfo : record
        State        : TTestState;
        FailCount    : Integer;
        SetTime, SetCount : Integer;

        bTotalResult : Boolean;  // 전체 판정결과
        bCycleResult : Boolean;  // 한주기 판정결과
        bStepResult  : Boolean;  // 한스텝 판정결과

        StepResult   : TStringList;
        TestResult   : TStringList;
    end;

    procedure ClearGrid(Grid : TStringGrid);

    procedure LoadPassWords;
    procedure ChangeNormPassword (pword: string);

implementation

uses
    GenUtils, FormHwTest;

procedure ClearGrid(Grid : TStringGrid);
var nCol, nRow : Integer;
begin
    with Grid do
    begin
        for nRow := FixedRows to RowCount-1 do
        for nCol := 0 {FixedCols} to ColCount-1 do
            Cells[nCol, nRow] := '';

        RowCount := 2;
    end;
end;

//==============================================================================
// TEST PROJECT CLASS.

constructor TTestStep.Create();
begin
    inherited;

    InputList1 := TStringList.Create;
    InputList2 := TStringList.Create;
    OutputList := TStringList.Create;
    CheckList  := TStringList.Create;
    OptionList := TStringList.Create;
end;

destructor  TTestStep.Destroy();
begin
    InputList1.Free;
    InputList2.Free;
    OutputList.Free;
    CheckList.Free;
    OptionList.Free;

    inherited;
end;

procedure TTestStep.Clear();
begin
    InputList1.Clear;
    InputList2.Clear;
    OutputList.Clear;
    CheckList.Clear;
    OptionList.Clear;
end;

procedure TTestStep.Assign(TestStep : TTestStep);
begin
    StepName := TestStep.StepName;
    Enabled  := TestStep.Enabled;

    InputList1.Assign(TestStep.InputList1);
    InputList2.Assign(TestStep.InputList2);
    OutputList.Assign(TestStep.OutputList);
    CheckList.Assign(TestStep.CheckList);
    OptionList.Assign(TestStep.OptionList);
end;

procedure TTestStep.LoadFromStringList(Strlist: TStrings);
var i, Idx : Integer;
    RdStr : String;
begin
    InputList1.Clear;
    InputList2.Clear;
    OutputList.Clear;
    CheckList.Clear;
    OptionList.Clear;
    
    Idx := 0;
    StepName := StrList.Values['Name'];
    Enabled  := (StrList.Values['Enabled'] = '1');
    
    for i:=0 to StrList.Count-1 do begin
        RdStr := StrList[i];
        if RdStr = '$INPUT'  then Idx:= 1 else
        if RdStr = '$OUTPUT' then Idx:= 2 else
        if RdStr = '$CHECK'  then Idx:= 3 else
        if RdStr = '$OPTION' then Idx:= 4 else
        if RdStr = '$INPUT2' then Idx:= 5 else
        begin
            case Idx of
                1 : InputList1.Add(RdStr);
                2 : OutputList.Add(RdStr);
                3 : CheckList.Add(RdStr);
                4 : OptionList.Add(RdStr);
                5 : InputList2.Add(RdStr);
            end;
        end;
    end;
end;

procedure TTestStep.SaveToStrList(Strlist: TStrings);
var i : Integer;
begin
    Strlist.Clear;
    Strlist.Add('Name=' + StepName);

    if Enabled then Strlist.Add('Enabled=' + '1')
               else Strlist.Add('Enabled=' + '0');

    Strlist.Add('$INPUT');
    for i:=0 to InputList1.Count-1 do
        Strlist.Add(TAB_CHAR + InputList1[i]);

    Strlist.Add('$INPUT2');
    for i:=0 to InputList2.Count-1 do
        Strlist.Add(TAB_CHAR + InputList2[i]);

    Strlist.Add('$OUTPUT');
    for i:=0 to OutputList.Count-1 do
        Strlist.Add(TAB_CHAR + OutputList[i]);

    Strlist.Add('$CHECK');
    for i:=0 to CheckList.Count-1 do
        Strlist.Add(TAB_CHAR + CheckList[i]);

    Strlist.Add('$OPTION');
    for i:=0 to OptionList.Count-1 do
        Strlist.Add(TAB_CHAR + OptionList[i]);
end;

//==============================================================================
// TEST PROJECT CLASS.

constructor TTestProjcet.Create();
var Idx : TResType;
begin
    inherited;

    TestStepList := TList.Create;
    CanDB[1]     := TCanDB.Create;
    CanDB[2]     := TCanDB.Create;

    for Idx := Low(TResType) to High(TResType) do
        ResList[Idx] := TStringList.Create;
end;

destructor  TTestProjcet.Destroy();
var Idx   : TResType;
begin
    for Idx := Low(TResType) to High(TResType) do
        ResList[Idx].Free;

    CanDB[1].Free;
    CanDB[2].Free;

    TestStepList.Free;

    inherited;
end;

// Step Operation.
function  TTestProjcet.AddStep(NewStep : TTestStep) : Integer;
begin
    if NewStep <> nil then
        Result := TestStepList.Add(NewStep)
    else
        Result := -1;
end;

procedure TTestProjcet.InsertStep(Idx : Integer; NewStep : TTestStep);
begin
    if (Idx >=0) and (Idx <TestStepList.Count) then
        TestStepList.Insert(Idx, NewStep);
end;

procedure TTestProjcet.DeleteStep(Idx : Integer);
begin
    if (Idx >=0) and (Idx <TestStepList.Count) then
        TestStepList.Delete(Idx);
end;

procedure TTestProjcet.ClearStep();
begin
    TestStepList.Clear;
end;

function  TTestProjcet.GetStep(Idx : Integer) : TTestStep;
begin
    if (Idx >=0) and (Idx <TestStepList.Count) then
        Result := TestStepList[Idx]
    else
        Result := nil;
end;

function  TTestProjcet.GetStepCount() : Integer;
begin
    Result := TestStepList.Count;
end;

// Resource Operation.
procedure TTestProjcet.ClearResource();
var Idx : TResType;
    i : Integer;
begin
    for Idx := Low(TResType) to High(TResType) do
        ResList[Idx].Clear;

    for i:= Low(CmdList) to High(CmdList) do begin
        ResList[res_Cmd].Add(CmdList[i]);
    end;
end;      

function TTestProjcet.GetResource(ResType : Integer; ResName : String) : TResourceItem;
var i, j : Integer;
    Idx, SIdx, EIdx  : TResType;
    RdStr, Str : String;
    StrList : TStringList;
    aCAN_Signal : TCAN_Signal;
begin
    for Idx := Low(ResList) to High(ResList) do
    begin
        StrList := ResList[Idx];

        for i := 0 to StrList.Count - 1 do
        begin
            RdStr := StrList.Strings[i];

            Result.ResName := GetToken(RdStr, ';');
            if (ResName = Result.ResName) then
            begin
                Result.ResType   := Idx;
                Result.IOName    := GetToken(RdStr, ';');
                Result.tagStr    := GetToken(RdStr, ';');
                Result.GroupName := GetToken(RdStr, ';');
                exit;
            end;
        end;
    end;

    // 데이터를 못찾았을경우 CAN DB에서 찾는다.
    FillChar(Result, SizeOf(Result), 0);
    for i := 1 to 2 do
    begin
        aCAN_Signal := CanDB[i].FindCanSignal(ResName);
        if aCAN_Signal <> nil then
        begin
            Result.ResName   := aCAN_Signal.SignalName;
            Result.IOName    := Format('CAN%.2d_01', [i]);
            Result.ResType   := res_CAN;
            Result.tagStr    := Format('SET:%X=%d,%d:%f,%f',
                                [ aCAN_Signal.CanID,
                                  aCAN_Signal.StartBit,
                                  aCAN_Signal.BitLen,
                                  aCAN_Signal.fScale,
                                  aCAN_Signal.fOffset   ]);
            Result.GroupName := '';
            Break;
        end;
    end;
end;             

// File Operation.
function  TTestProjcet.LoadFromFile(FileName : String) : Boolean;
var i, nReadMode : Integer;
    Idx   : TResType;
    RdStr, HeaderStr : String;
    f: TextFile;
    TestStep : TTestStep;
    StrList : TStringList;
begin
    Result := False;
    ClearResource();
    ClearStep();
    
    gProjectFileName := '';
    if not FileExists (FileName) then exit;

    nReadMode := 0;

    StrList := TStringList.Create;
    AssignFile (f, FileName);
    try
        Reset(f);

        while not Eof(f) do begin
            ReadLn(F, RdStr);
            RdStr := Trim(RdStr);
            if RdStr = '' then continue;

            if (RdStr[1] = '#') then begin

                HeaderStr := GetToken(RdStr, '_');
                if (StrList.Count > 0) then begin
                    case nReadMode of
                        1: begin // STEP.
                            TestStep := TTestStep.Create;
                            TestStep.LoadFromStringList(StrList);
                            AddStep(TestStep);
                        end;
                    end;

                    // Input Resource
                    if (nReadMode >= 100)  then begin
                        Idx := TResType(nReadMode - 100);

                        for i:=0 to StrList.Count-1 do
                            ResList[Idx].Add(StrList[i]);
                    end;
                end;

                // STEP.
                if (HeaderStr = '#STEP') then begin
                    nReadMode := 1;
                end else

                // RESOURCE.
                if (HeaderStr = '#RES') then begin
                    for Idx := Low(ResNameTbl) to High(ResNameTbl) do begin
                        if (RdStr = ResNameTbl[Idx]) then begin
                            nReadMode := Ord(Idx) + 100;
                            break;
                        end;
                    end;
                end;
                StrList.Clear;
            end else
                StrList.Add(RdStr);
        end;
        gProjectFileName := ExtractFileName(FileName);
        Result := True;
    finally
        CloseFile (f);
        StrList.Free;
    end;
end;

function  TTestProjcet.SaveToFile(FileName : String) : Boolean;
var i, j : Integer;
    Idx   : TResType;
    WtStr : String;
    f: TextFile;
    TestStep : TTestStep;
    StrList : TStringList;
begin
    Result := False;
    if FileName = '' then exit;
    
    gProjectFileName := '';
    if FileExists (FileName) then DeleteFile(FileName);

    StrList := TStringList.Create;
    
    AssignFile (f, FileName);
    try
        ReWrite(f);

        // SAVE STEP LIST.
        for i:=0 to TestStepList.Count-1 do begin
            TestStep := TestStepList[i];
            TestStep.SaveToStrList(StrList);

            WriteLn (f, Format('#STEP_%d', [i]));
            for j := 0 to StrList.Count-1 do
                WriteLn (f, TAB_CHAR + StrList[j]);
            WriteLn (f, '');
        end;

        // SAVE RESOURCE LIST.
        for i := Ord(Low(TResType)) to Ord(High(TResType))-2 do
        begin
            Idx := TResType(i);
            WriteLn (f, Format('#RES_%s', [ResNameTbl[Idx]]));
            for j := 0 to ResList[Idx].Count-1 do begin
                WtStr := ResList[Idx].Strings[j];
                WriteLn (f, TAB_CHAR + WtStr);
            end;
            WriteLn (f, '');
        end;
        WriteLn (f, '#END');

        Flush (f);
        gProjectFileName := ExtractFileName(FileName);
        Result := True;
    finally
        CloseFile (f);
        StrList.Free;
    end;
end;

//==============================================================================
{ TResourceItem }

constructor TResItem.Create;
begin
    inherited;
end;

destructor TResItem.Destroy;
begin
    inherited;
end;

procedure TResItem.Assign(Param: TResItem);
begin
    if (Param = nil) then exit;

    Self.ResType       := Param.ResType;
    Self.ResCode       := Param.ResCode;
    Self.ResGroup      := Param.ResGroup;
    Self.ResName       := Param.ResName;
    Self.HwInfo        := Param.HwInfo;
    Self.sUnit         := Param.sUnit;
    Self.Option        := Param.Option;
    Self.Description   := Param.Description;

    Self.InMin         := Param.InMin;
    Self.InMax         := Param.InMin;
    Self.OutMin        := Param.OutMin;
    Self.OutMax        := Param.OutMax;
end;

function TResItem.GetValue : String;
begin
    Result := Format('%d;%s;%s;%s;%s;%s;%s;%s;%f;%f;%f;%f;',
        [Ord(ResType), ResCode, ResGroup, ResName,  HwInfo, sUnit, Option, Description,
         InMin, InMax, OutMin, OutMax ]);
end;

procedure TResItem.SetValue(Param : String);
begin
    Self.ResType     := TResType( StrToIntDef(GetToken(Param, ';'), 0) );
    Self.ResCode     := GetToken(Param, ';');
    Self.ResGroup    := GetToken(Param, ';');
    Self.ResName     := GetToken(Param, ';');
    Self.HwInfo      := GetToken(Param, ';');
    Self.sUnit       := GetToken(Param, ';');
    Self.Option      := GetToken(Param, ';');
    Self.Description := GetToken(Param, ';');
    Self.InMin       := StrToFloatDef(GetToken(Param, ';'), 0);
    Self.InMax       := StrToFloatDef(GetToken(Param, ';'), 1);
    Self.OutMin      := StrToFloatDef(GetToken(Param, ';'), 0);
    Self.OutMax      := StrToFloatDef(GetToken(Param, ';'), 1);
end;

procedure LoadPassWords;
var
   ini: TIniFile;
begin
   ini := TIniFile.Create (GetAppDir('') + 'Config.ini');
   with ini do begin
      gNormPassword := ReadString ('MAIN', 'password1', '');
    //  SpecPassword := ReadString ('MAIN', 'password2', '');
   end;
   ini.Free;
end;       

procedure ChangeNormPassword (pword: string);
var
   ini: TIniFile;
begin
   ini := TIniFile.Create (GetAppDir('') + 'Config.ini');
   with ini do begin
      gNormPassword := pword;
      WriteString ('MAIN', 'password1', gNormPassWord);
   end;
   ini.Free;
end;



end.
