unit FormTerminate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TlHelp32, ZINICtrl, ExtCtrls, Buttons, GradFill, Menus,
  INIFiles;

type
  TFrmTerminate = class(TForm)
    iniTerminate: ZIniData;
    Panel18: TPanel;
    GradientFill20: TGradientFill;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Image7: TImage;
    lblListCount: TLabel;
    listApplication: TListBox;
    btnSearch: TButton;
    PopupMenu1: TPopupMenu;
    memuTerminate: TMenuItem;
    btnAutoTerminate: TButton;
    edtFileName: ZIniEdit;
    Label1: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure btnAutoTerminateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure memuTerminateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function TerminateApplication(AObject: TObject) : boolean;
  public
    { Public declarations }
  end;

var
  FrmTerminate: TFrmTerminate;

implementation

uses
    GenUtils;
    
{$R *.dfm}

// kernel32.dll을 사용하여 현재 떠있는 process를 읽어온다
procedure Process32List(Slist: TStrings);
var
    Process32: TProcessEntry32;
    SHandle:   THandle;  // the handle of the Windows object
    Next:      BOOL;
begin
    Process32.dwSize := SizeOf(TProcessEntry32);
    SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

    if Process32First(SHandle, Process32) then
    begin
        // 실행화일명과 process object 저장
        Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
        repeat
            Next := Process32Next(SHandle, Process32);
            if Next then
                Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
        until not Next;
    end;
    CloseHandle(SHandle);  // closes an open object handle
end;

procedure TFrmTerminate.btnSearchClick(Sender: TObject);
begin
    // 현재 실행중인 process를 검색
    listApplication.Items.Clear;
    Process32List(listApplication.Items);

    lblListCount.Caption := Format('PROCESS LIST : %d', [listApplication.Items.Count]);
end;

function TFrmTerminate.TerminateApplication(AObject: TObject) : boolean;
var
    hProcess: THandle;
    ProcId:   DWORD;
    TermSucc: BOOL;
begin
    // 현재 실행중인 process를 kill
    ProcId := DWORD(AObject);
    // 존재하는 process object의 handle을 return한다
    hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
//    if hProcess = NULL then
//        ShowMessage('OpenProcess error !');

    // 명시한 process를 강제 종료시킨다
    Result := TerminateProcess(hProcess, 0);

    {
    if Result = FALSE then
        ShowMessage('TerminateProcess error !')
    else
        ShowMessage(Format('Process# %x terminated successfully !', [ProcId]));
    }
end;

procedure TFrmTerminate.btnAutoTerminateClick(Sender: TObject);
var
    i: integer;
begin
    btnSearch.Click;
    if listApplication.Items.Count < 0 then exit;

    for i := 0 to listApplication.Items.Count - 1 do
        if Uppercase(edtFileName.Text) = Uppercase(listApplication.Items[i]) then
            TerminateApplication(listApplication.Items.Objects[i]);

    btnSearch.Click;
end;

procedure TFrmTerminate.FormCreate(Sender: TObject);
begin
    iniTerminate.LoadData;
end;

procedure TFrmTerminate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    iniTerminate.SaveData;
end;

procedure TFrmTerminate.SpeedButton1Click(Sender: TObject);
begin
    iniTerminate.SaveData;
    Close;
end;

procedure TFrmTerminate.memuTerminateClick(Sender: TObject);
begin
    // 현재 실행중인 process를 kill
    TerminateApplication(listApplication.Items.Objects[listApplication.ItemIndex]);
end;

procedure TFrmTerminate.FormShow(Sender: TObject);
begin
    iniTerminate.LoadData;
    btnSearch.Click;
end;

end.
