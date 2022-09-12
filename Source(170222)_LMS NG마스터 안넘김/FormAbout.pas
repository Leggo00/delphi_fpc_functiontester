unit FormAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Gauges;


type
  TFrmAbout = class(TForm)
    BtnOK: TButton;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label_Ver: TLabel;
    Label5: TLabel;
    Label_Mem1: TLabel;
    GaugeLoad: TGauge;
    Label6: TLabel;
    TimerRead: TTimer;
    Label4: TLabel;
    Label7: TLabel;
    Label_BootTime: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerReadTimer(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayInfo();
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

uses FormMain, Global;

{$R *.dfm}

procedure TFrmAbout.DisplayInfo();
var ms : TMemoryStatus;
    nDay, nHour, nMin, nSec, nTime : Integer;
begin
    GlobalMemoryStatus(ms);

    Label_Mem1.Caption := FormatFloat('#,### KB', ms.dwAvailPhys div 1024) + ' / ' +
                          FormatFloat('#,### KB', ms.dwTotalPhys div 1024);
    GaugeLoad.Progress := Round(ms.dwMemoryLoad);

    // PC부팅시간을 표시한다.
    nTime := (GetTickCount div 1000);
    nSec  := nTime mod 60;

    nTime := nTime div 60;
    nMin  := nTime mod 60;

    nTime  := nTime div 60;
    if nTime < 24 then begin
        nHour  := nTime;
        Label_BootTime.Caption := Format('%d시간 %.2d분 %.2d초', [nHour, nMin, nSec]);
    end else begin
        nHour  := nTime mod 24;
        nDay   := nTime div 24;
        Label_BootTime.Caption := Format('%d일 %d시간 %.2d분 %.2d초', [nDay, nHour, nMin, nSec]);
    end;
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
    Label_Ver.Caption := SW_VERSION;
    
    TimerRead.Enabled := True;
    DisplayInfo();
end;

procedure TFrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TimerRead.Enabled := False;
end;

procedure TFrmAbout.TimerReadTimer(Sender: TObject);
begin
    DisplayInfo();
end;

procedure TFrmAbout.BtnOKClick(Sender: TObject);
begin
    Close;
end;

end.
