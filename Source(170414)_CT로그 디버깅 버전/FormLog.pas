unit FormLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TFrmLog = class(TForm)
    Panel1: TPanel;
    ListBoxLog: TListBox;
    BtnClear: TSpeedButton;
    procedure BtnClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadLogData();
    procedure SaveLogData();
  public
    { Public declarations }
    procedure AddMessage(Param : String);
  end;

var
  FrmLog: TFrmLog;
  procedure AddLog(Param : String);

implementation

uses GenUtils;
{$R *.dfm}

const LOG_FILENAME = 'LOG.TXT';

procedure AddLog(Param : String);
begin
    WriteDebugStr(Param);

    if FrmLog <> nil then begin
        try
            FrmLog.AddMessage(Param);
        except
        end;
    end;
end;

procedure TFrmLog.AddMessage(Param : String);
begin
    Param := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now()) + ' - ' + Param;

    if ListBoxLog.Items.Count > 500 then
        ListBoxLog.Items.Delete(0);
    ListBoxLog.ItemIndex := ListBoxLog.Items.Add(Param);
end;

procedure TFrmLog.BtnClearClick(Sender: TObject);
begin
    ListBoxLog.Clear;
    SaveLogData();
end;

procedure TFrmLog.LoadLogData();
var FileName : String;
begin     {
    FileName := GetAppDir('') + LOG_FILENAME;
    if FileExists(FileName) then begin
        ListBoxLog.Items.LoadFromFile(FileName);
    end; }
end;

procedure TFrmLog.SaveLogData();
var FileName : String;
begin  {
    FileName := GetAppDir('') + LOG_FILENAME;
    try
        ListBoxLog.Items.SaveToFile(FileName);
    except
    end;}
end;

procedure TFrmLog.FormCreate(Sender: TObject);
begin
    LoadLogData();
end;

procedure TFrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SaveLogData();
    Action := caFree;
    FrmLog := nil;
end;

end.
