unit FormHD9022;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComDrv32, StdCtrls, ZINICtrl, ExtCtrls, DPBLabel, Buttons,
  ComCtrls;

type
  TFrmHD9022 = class(TForm)
    Panel1: TPanel;
    INI: ZIniData;
    ComboBox_Port: ZIniComboBox;
    Label1: TLabel;
    Comm: TCommPortDriver;
    TimerRead: TTimer;
    Label_Temp: TdpbLabel;
    Label2: TLabel;
    StatusBar: TStatusBar;
    BtnConnect: TSpeedButton;
    MemoRX: TMemo;
    Edit_TX: TEdit;
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure TimerReadTimer(Sender: TObject);
    procedure ComboBox_PortChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure Edit_TXKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CommConnect(Flag : Boolean);
    function  GetTemp() : Double;
  end;

var
  FrmHD9022: TFrmHD9022;

implementation

uses GenUtils, FormMain;

{$R *.dfm}
const
    STX = #$02;
    ETX = #$03;

    INVALID_VALUE = -9999;

procedure TFrmHD9022.CommConnect(Flag : Boolean);
begin
    Comm.Disconnect;
    if Flag then begin
        Comm.ComPort := ComboBox_Port.ItemIndex + 1;
        Comm.Connect;
    end;

    if Comm.Connected then begin
        StatusBar.Panels[0].Text := Format('COM-%d CONNECT', [Comm.Comport]);
        BtnConnect.Down          := True;
        TimerRead.Enabled        := True;

        FrmMain.pnlTemp.Visible  := True;
    end else begin
        StatusBar.Panels[0].Text := 'DISCONNECT';
        BtnConnect.Down          := False;
        TimerRead.Enabled        := False;

        FrmMain.pnlTemp.Visible  := False;
    end;
end;

function TFrmHD9022.GetTemp() : Double;
begin
    Result := StrToFloatDef( Label_Temp.Caption, INVALID_VALUE );
end;

procedure TFrmHD9022.TimerReadTimer(Sender: TObject);
begin
    Comm.SendString( STX + 'M1' + ETX);
end;

procedure TFrmHD9022.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
    fValue : Double;
    Str, RdStr : String;
begin
    // <STX><SP>024.6<ETX>
    RdStr := StrPas(DataPtr);
    MemoRX.Text := RdStr;
    if (Pos(STX, RdStr) > 0) and (Pos(ETX, RdStr) > 0) then
    begin
        GetToken(RdStr, STX);
        Str := GetToken(RdStr, ETX);
        fValue := StrToFloatDef(Str, 0);
        Label_Temp.Caption := FormatFloat('0.0', fValue);
        FrmMain.lblTemp.Caption  := FormatFloat('0.0', fValue);
    end;
end;

procedure TFrmHD9022.ComboBox_PortChange(Sender: TObject);
begin
    CommConnect(True);
end;

procedure TFrmHD9022.FormCreate(Sender: TObject);
begin
    INI.LoadData;
    CommConnect(True);
end;

procedure TFrmHD9022.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
    CommConnect(False);
end;

procedure TFrmHD9022.BtnConnectClick(Sender: TObject);
begin
    CommConnect(BtnConnect.Down);
end;

procedure TFrmHD9022.Edit_TXKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Comm.SendString(Edit_TX.Text);
        Edit_TX.SelectAll;
    end;
end;

end.
