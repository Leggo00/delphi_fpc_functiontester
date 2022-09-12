unit UnitTmControl;

interface

uses
    TMCTL, SysUtils, StdCtrls, Classes, Messages, Windows;

const
    MAX_BUFFER = 8091;

type
  TTmControl = class
  private
      FId : LongInt;
      FAddress: string;
      FUserName: string;
      FPassword: string;
      FBuffer : array [0..MAX_BUFFER] of Char;
      FMemo: TMemo;
      FConnected: boolean;

      procedure SetConnectParam(Index: Integer; sValue: string);
  public
      property Address  : string index 1 read FAddress  write SetConnectParam;
      property UserName : string index 2 read FUserName write SetConnectParam;
      property Password : string index 3 read FPassword write SetConnectParam;
      property Memo : TMemo read FMemo write FMemo;
      property Connected : boolean read FConnected;

      constructor Create(AOwner: TComponent);
      destructor Destroy; override;

      function SendCommand(sCommand: string): string;
      function Connect(nWire: integer) : Boolean;
      procedure Disconnect();
      procedure AddLog(sParam : string);
  end;

implementation

constructor TTmControl.Create(AOwner: TComponent);
begin
    FConnected := False;

    FAddress  := '192.168.0.10';
    FUserName := 'anonymous';
    FPassword := '';

    FMemo := TMemo.Create(AOwner);
end;

destructor TTmControl.Destroy;
begin
    FMemo.Free;
end;

procedure TTmControl.SetConnectParam(Index: Integer; sValue: string);
begin
    case Index of
       1: FAddress  := sValue;
       2: FUserName := sValue;
       3: FPassword := sValue;
       else
          exit;
    end;
end;

procedure TTmControl.AddLog(sParam : string);
begin
    with FMemo.Lines do
    begin
        if Count > 50 then
            Delete(0);

        Add( Format('[%s] %s', [FormatDateTime('YY-MM-DD HH:NN:SS', Now), sParam]) );
    end;
end;

function TTmControl.SendCommand(sCommand: string): string;
var
    nLen: LongInt;
begin
    Result := 'N/A';

    if not FConnected then exit;

    TmSend(FId, sCommand);
    AddLog('SEND > ' + sCommand);
    if Pos('?', sCommand) > 0 then
    begin
        FillChar(FBuffer, SizeOf(FBuffer), ' ');
        TmReceive(FId, FBuffer[0], SizeOf(FBuffer), nLen);

        Result := Trim(FBuffer);
        AddLog('READ < ' + Result);
    end;
end;

function TTmControl.Connect(nWire: integer) : Boolean;
var
    sParam: string;
    nResult: LongInt;
begin
    Result := False;  //   Disconnect();
    case nWire of
        WIRE_ETHERNET : sParam := Format('%s,%s,%s', [FAddress, FUserName, FPassword]);
        WIRE_USBTMC   : sParam := Format('%s', [FAddress]);
    end;

    nResult := TmInitialize(nWire, sParam, FId);
    if nResult = 0 then
    begin
        TmSetTerm( FId, TERM_LF, 1 );
		 	  TmSetTimeout( FId, 300 ); // 30s
		 	  TmSetRen( FId, 1 );

        if SendCommand('*IDN?') <> '' then
        begin
            FConnected := True;
            Result := True;
        end;
    end;
end;

procedure TTmControl.Disconnect();
begin
    TmFinish(FId);
    FConnected := False;
end;

end.


