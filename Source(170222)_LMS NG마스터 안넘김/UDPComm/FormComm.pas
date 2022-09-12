unit FormComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, IdUDPClient, IdBaseComponent, IdComponent, IdUDPBase,
  StdCtrls, Buttons, IdUDPServer, ComCtrls, ExtCtrls, IdSocketHandle, Math,
  ZINICtrl;

type
  TFrmComm = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    MemoLog: TMemo;
    IdUDPServer: TIdUDPServer;
    SpeedButton1: TSpeedButton;
    IdUDPClient: TIdUDPClient;
    Edit_Send: TEdit;
    BtnSend: TSpeedButton;
    Ed_IPAddr: ZIniEdit;
    INI: ZIniData;
    Label1: TLabel;
    Label2: TLabel;
    procedure IdUDPServerStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdUDPServerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure SpeedButton1Click(Sender: TObject);
    procedure IdUDPClientStatus(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddLog(Param: String);
    { Private declarations }
  public
    { Public declarations }
    function SendUDP(IPAddr, Param : String) : Boolean;
  end;

var
  FrmComm: TFrmComm;

implementation

uses FormMain;

{$R *.dfm}

procedure TFrmComm.AddLog(Param : String);
begin
    if (Visible) then begin
        if MemoLog.Lines.Count > 100 then
            MemoLog.Lines.Delete(0);
        MemoLog.Lines.Add('[' + FormatDateTime('HH:NN:SS', Now) + '] ' + Param);
    end;
end;

procedure TFrmComm.IdUDPServerStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
    AddLog(AStatusText);
end;

procedure TFrmComm.IdUDPServerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var RdStr : String;
    nSize : Integer;
    Buff : array [0..10240] of Char;
begin
    // 최대 Buff Size만큼 읽고 마지막 Char는 NULL처리한다.
    nSize := MIN( AData.Size, High(Buff)-1 );
    Adata.Read(Buff, nSize );
    Buff[nSize] := #0;
    RdStr := StrPas(Buff);
    AddLog('> ' + RdStr);

//    FrmMain.ReadMessage(RdStr);
end;

procedure TFrmComm.SpeedButton1Click(Sender: TObject);
begin
    MemoLog.Clear;
end;

procedure TFrmComm.IdUDPClientStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
    AddLog(AStatusText);
end;

procedure TFrmComm.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    IdUDPServer.Active := True;
end;

procedure TFrmComm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmComm.FormDestroy(Sender: TObject);
begin
    IdUDPServer.Active := False;
end;

function TFrmComm.SendUDP(IPAddr, Param : String) : Boolean;
begin
    try
        IdUDPClient.Active := True;
        IdUDPClient.Send(IPAddr, 5556, Param);
        Result := True;
    finally
        IdUDPClient.Active := False;
    end;
end;

procedure TFrmComm.BtnSendClick(Sender: TObject);
begin
    SendUDP(Ed_IPAddr.Text, Edit_Send.Text );
end;


end.
