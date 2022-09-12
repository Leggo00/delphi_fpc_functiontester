unit FormHWLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XiButton;

type
  TFrmHWLog = class(TForm)
    Panel1: TPanel;
    MemoLog: TMemo;
    cbLogSave: TCheckBox;
    BtnClear: TXiButton;
    cbDisplaylog: TCheckBox;
    procedure BtnClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AddLog(Msg: String);
    { Public declarations }
  end;

var
  FrmHWLog: TFrmHWLog;

implementation

{$R *.dfm}

procedure TFrmHWLog.BtnClearClick(Sender: TObject);
begin
    MemoLog.Clear;
end;

procedure TFrmHWLog.AddLog(Msg : String);
begin
    if Not cbDisplaylog.Checked then exit;

    if MemoLog.Lines.Count > 100 then
    begin
        FrmHWLog.MemoLog.Lines.Delete(0);
        FrmHWLog.MemoLog.Lines.Delete(0);
        FrmHWLog.MemoLog.Lines.Delete(0);
        FrmHWLog.MemoLog.Lines.Delete(0);
        FrmHWLog.MemoLog.Lines.Delete(0);
    end;
    MemoLog.Lines.add(Msg);
end;

procedure TFrmHWLog.FormDestroy(Sender: TObject);
begin
    FrmHWLog := nil;
end;

end.
