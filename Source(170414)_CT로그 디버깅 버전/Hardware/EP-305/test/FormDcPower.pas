unit FormDcPower;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DPBLabel, Buttons, ZINICtrl, ComDrv32, ComCtrls, ToolWin,
  ExtCtrls;

type
  TFrmDcPower = class(TForm)
    INI: ZIniData;
    Comm: TCommPortDriver;
    PnlBackground: TPanel;
    Image3: TImage;
    Image4: TImage;
    Panel57: TPanel;
    Image125: TImage;
    Image127: TImage;
    Image132: TImage;
    Panel58: TPanel;
    Image134: TImage;
    Image7: TImage;
    Image65: TImage;
    Panel4: TPanel;
    Image1: TImage;
    Image2: TImage;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    btnConnect: TToolButton;
    Panel2: TPanel;
    Image5: TImage;
    Image6: TImage;
    Image8: TImage;
    Panel1: TPanel;
    ListRx: TListBox;
    Label7: TLabel;
    Label6: TLabel;
    ComboBox_Comport: ZIniComboBox;
    BtnSend: TBitBtn;
    BtnClear: TBitBtn;
    Label1: TLabel;
    cmbSend: ZIniComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConnectClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    IsReceiveCommOk : Boolean;

    procedure CommConnect( bConnect : Boolean; nPort: integer );
    procedure CommClose();
    procedure CommInit();
    procedure CommSend(DataStr : String);
    function  CommRead(Param : String) : String;
  end;

var
  FrmDcPower: TFrmDcPower;

implementation

uses
    GenUtils;//, FormVacuumModulator;
{$R *.DFM}

procedure TFrmDcPower.FormCreate(Sender: TObject);
begin
    AutoSize := True;
    INI.LoadData;

    btnConnect.Click;
end;

procedure TFrmDcPower.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmDcPower.CommInit();
begin
    ListRx.Clear;
    Comm.FlushBuffers(true, true);
end;

procedure TFrmDcPower.CommSend(DataStr : String);
begin
    DataStr := DataStr + LF;
    Comm.SendString(DataStr);
end;

procedure TFrmDcPower.BtnSendClick(Sender: TObject);
begin
    CommSend(cmbSend.Text);
end;

procedure TFrmDcPower.BtnClearClick(Sender: TObject);
begin
    CommInit();
end;

procedure TFrmDcPower.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    ListRx.Items.Text := StrPas(DataPtr);
end;

procedure TFrmDcPower.ComboBox_SendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        BtnSendClick(Sender);
end;

function TFrmDcPower.CommRead(Param : String) : String;
const TIME_OUT = 1000;
var nTime : Integer;
    rdStr, Str : String;
begin
    // EX) SPEED:00 01 02
    rdStr := GetTokenTrim (Param, ':');

    if Param <> '' then begin
        IsReceiveCommOk := False;
        CommSend(Param);
        nTime := GetTickCount;
        while ( (GetTickCount - nTime) < TIME_OUT ) do begin
            if IsReceiveCommOk then Break;
            Application.ProcessMessages;
        end;
    end;

    Str := ListRx.Items.Values[rdStr];
    Result := GetToken(Str, ' ');
end;

procedure TFrmDcPower.CommConnect( bConnect : Boolean; nPort: integer );
begin
    if bConnect then
    begin
        Comm.Disconnect;

        if nPort = 0 then nPort := ComboBox_Comport.ItemIndex + 1;
        Comm.ComPort := nPort;
        Comm.Connect;

        if not Comm.Connected then exit;

        Comm.FlushBuffers(true, true);

        btnConnect.Down := True;
        btnConnect.Caption := '해제';
    end else
    begin
        Comm.Disconnect;

        btnConnect.Down := False;
        btnConnect.Caption := '연결';
    end;
end;

procedure TFrmDcPower.CommClose();
begin
    Comm.Disconnect;

    btnConnect.Down := False;
    btnConnect.Caption := '연결';
end;

procedure TFrmDcPower.btnConnectClick(Sender: TObject);
begin
    if btnConnect.Caption = '연결' then
    begin
        CommConnect(True, ComboBox_Comport.ItemIndex + 1);
    end else
    begin
        CommConnect(False, 0);
    end;
end;

procedure TFrmDcPower.ToolButton2Click(Sender: TObject);
begin
    Close;
end;

end.
