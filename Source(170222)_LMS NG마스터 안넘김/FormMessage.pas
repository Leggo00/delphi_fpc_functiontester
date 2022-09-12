unit FormMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DPBLabel, ExtCtrls, Buttons, ZINICtrl, XiProgressBar,
  GradFill;

type
  TFrmMessage = class(TForm)
    Panel1: TPanel;
    TimerClose: TTimer;
    Label_Msg: TdpbLabel;
    GradientFill: TGradientFill;
    procedure TimerCloseTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fStartTime : Double;
  public
    { Public declarations }
    function ShowTestMessaage(Msg : String; CloseTime : Integer = 0) : Boolean;
  end;
var
    FrmMessage: TFrmMessage;


implementation

uses Global, GenUtils;

{$R *.dfm}

function TFrmMessage.ShowTestMessaage(Msg : String; CloseTime : Integer = 0) : Boolean;
begin
    Label_Msg.Caption := Msg;
    Top := 30;
    Width := 700;
    Position := poDesktopCenter;

    if (CloseTime <= 0) then begin
        Caption := '사용자 메세지 : 확인후 아무키나 누르세요.';
        Show;
    end else
    begin
        Caption := Format('사용자 메세지 : %s초후 자동진행', [FormatFloat('0.##', CloseTime/1000)]);
        TimerClose.Interval := CloseTime;
        TimerClose.Enabled  := True;
        Show;
    end;
end;

procedure TFrmMessage.TimerCloseTimer(Sender: TObject);
begin
    TimerClose.Enabled  := False;
    Close;
end;

procedure TFrmMessage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerClose.Enabled := False;
    if (Self.FormStyle = fsMDIChild) then begin
        FrmMessage := nil;
        Action     := caFree;
    end;

end;

procedure TFrmMessage.FormShow(Sender: TObject);
begin
    fStartTime := GetTickCountEX;
end;

procedure TFrmMessage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//    Close;
end;

end.
