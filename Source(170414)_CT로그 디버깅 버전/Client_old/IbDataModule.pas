unit IbDataModule;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, Dialogs;

type
  TIbDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    Query1: TIBQuery;
  private
    { Private declarations }
  public
    function DBConnect(ServerIP, DBFile: String): Boolean;
    function DisConnectDB: Boolean;  
    procedure MakeLineInfo;
    procedure MakeModelInfo;
    procedure MakeOperInfo;
    { Public declarations }
  end;

var
  IbDM: TIbDM;

implementation

uses TraceGrobal;

{$R *.dfm}

function TIbDM.DBConnect(ServerIP,DBFile : String):Boolean;
begin
    with IBDatabase do
    begin
        if Connected then DisConnectDB;
        try
            DataBaseName := ServerIP + ':' + DBFile;
            Connected := True;
            Result := True;
        except
            Result := False;
        end;
    end;

end;

//------------------------------------------------------------------------------
function TIbDM.DisConnectDB() : Boolean;
begin
    IBDatabase.Connected := False;
end;


// 라인정보를 배열에 담는다.
procedure TIbDM.MakeLineInfo;
var nRow : integer;
begin
    if not IBTransaction.InTransaction then
        IBTransaction.StartTransaction;
    try
        with Query1 do
        begin
            Close;
            Sql.Clear;
            Sql.Add(' Select linecode, linename ');
            Sql.Add('   from tb_Line ');
            Open;
            SetLength(LineInfo,0);
            nRow := 1;
            while not Eof do
            begin
                SetLength(LineInfo,nRow);
                LineInfo[nRow-1].code  := FieldByName('linecode').AsString;
                LineInfo[nRow-1].name  := FieldByName('linename').AsString;
                Next;
                Inc(nRow);
            end;
        end;
        IBTransaction.Commit;
    except
        on E : Exception do
        SaveLogFile('Error... '+' '+E.Message);
    end;

end;



// 모델정보를 배열에 담는다.
procedure TIbDM.MakeModelInfo;
var nRow : integer;
begin
    if not IBTransaction.InTransaction then
        IBTransaction.StartTransaction;
    try
        with Query1 do
        begin
            Close;
            Sql.Clear;
            Sql.Add(' Select model_code, model_name, model_desc, test_order ');
            Sql.Add('   from tb_model ');
            Open;
            SetLength(ModelInfo,0);
            nRow := 1;
            while not Eof do
            begin
                SetLength(ModelInfo,nRow);
                ModelInfo[nRow-1].code      := FieldByName('model_code').AsString;
                ModelInfo[nRow-1].name      := FieldByName('model_name').AsString;
                ModelInfo[nRow-1].mtype     := FieldByName('model_desc').AsString;
                ModelInfo[nRow-1].Oper      := FieldByName('test_order').AsString;
                ModelInfo[nRow-1].Final     := ModelToFindOperCode(ModelInfo[nRow-1].Oper);
                Next;
                Inc(nRow);
            end;
        end;
        IBTransaction.Commit;
    except
        on E : Exception do
        SaveLogFile('Error... '+' '+E.Message);
    end;

end;


// 공정정보를 배열에 담는다.
procedure TIbDM.MakeOperInfo;
var nRow : integer;
begin
    if not IBTransaction.InTransaction then
        IBTransaction.StartTransaction;
    try
        with Query1 do
        begin
            Close;
            Sql.Clear;
            Sql.Add(' Select opercode, linecode, opername, notused ');
            Sql.Add('   from tb_Oper ');
            Open;
            SetLength(OperInfo,0);
            nRow := 1;
            while not Eof do
            begin
                SetLength(OperInfo,nRow);
                OperInfo[nRow-1].code      := FieldByName('opercode').AsString;
                OperInfo[nRow-1].line      := FieldByName('linecode').AsString;
                OperInfo[nRow-1].name      := FieldByName('opername').AsString;
                OperInfo[nRow-1].used      := FieldByName('notused').AsInteger;
                Next;
                Inc(nRow);
            end;
        end;
        IBTransaction.Commit;
    except
        on E : Exception do
        SaveLogFile('Error... '+' '+E.Message);
    end;

end;

end.
