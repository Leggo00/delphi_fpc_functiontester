unit FormTable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids;

type
  TFrmTable = class(TForm)
    Grid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FindCodeNum(Data : Byte) : String;
    function FindCodeName(Data : String) : word;
    function FindASCII(Data : String) : String;

  end;

var
  FrmTable: TFrmTable;

implementation

{$R *.DFM}

uses GenUtils;

function TFrmTable.FindCodeNum(Data : Byte) : String;
var Row : Integer;
begin
    Row := Data;
    
    Result := '';
    if Row < Grid.RowCount then;
        Result := Grid.Cells[3, Row+1];
end;

function TFrmTable.FindCodeName(Data : String) : word;
var i: Integer;
    Str : String;
begin
    Result := 0;
    for i:=0 to 255 do begin
        Str := Grid.Cells[2, i+1];
        if (Str = Data) then begin
            Result := i;
            break;
        end;
    end;
end;

function TFrmTable.FindASCII(Data : String) : String;
var i: Integer;
    Str, sTempData, sTokenStr : String;
begin
    Result := '';
    While Pos(' ', Data) > 0 do
    begin
        sTokenStr := Gettoken(Data, ' ');
        for i:=0 to 255 do begin
        Str := Grid.Cells[1, i+1];
            if Pos(sTokenStr, Str) > 0 then
            begin
                sTempData := Grid.Cells[2, i+1];
                Result := Result + sTempData;
                break;
            end;
        end;
    end;

    for i:=0 to 255 do begin
    Str := Grid.Cells[1, i+1];
        if Pos(Data, Str) > 0 then
        begin
            sTempData := Grid.Cells[2, i+1];
            Result := Result + sTempData;
            break;
        end;
    end;

end;



procedure TFrmTable.FormCreate(Sender: TObject);
var i: Integer;
    ASCIIName : String;
begin
    ASCIIName := 'NUL,SOH,STX,ETX,EOT,ENQ,ACK,BEL,BS,HT,LF,VT,FF,CR,SO,SI,DLE,' +
        'DC1,DC2,DC3,DC4,NAK,SYN,ETB,CAN,EM,SUB,ESC,FS,GS,RS,US,SP';

    with Grid do begin

        Cells[0,0] := 'No.';
        Cells[1,0] := 'HEX';
        Cells[2,0] := 'CHAR';
        Cells[3,0] := 'NAME';

        for i:= 0 to 255 do begin
            Cells[0,i+1] := IntToStr(i);
            Cells[1,i+1] := '0x' + IntToHex(i,2);
            Cells[2,i+1] := Char(i);
            if ASCIIName <> '' then
                Cells[3,i+1] := GetToken(ASCIIName, ',');
        end;
    end;
end;

procedure TFrmTable.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Str : String;
begin
    Str := Grid.Cells[ACol, ARow];
    With Grid.Canvas do begin
        FillRect(Rect);
        DrawText(Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE );
    end;

end;

procedure TFrmTable.FormShow(Sender: TObject);
begin
    Left := 0;
    Top  := 0;
end;

end.
