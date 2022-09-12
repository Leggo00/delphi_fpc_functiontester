unit uImage;

interface

uses
  SysUtils, Classes, ImgList, Controls, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvPanel, AdvMenus, AdvMenuStylers,
  AdvToolBar, AdvToolBarStylers, Forms, INIFiles;

const
    // IMAMGE RESOURCE
    IMG_RES = 0;

type
  TuImg = class(TDataModule)
    ImgListRes: TImageList;
    ImgListStep: TImageList;
    ImgListToolbar2: TImageList;
    ImageListToolbar: TImageList;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvMenuOfficeStyler: TAdvMenuOfficeStyler;
    AdvPanelStyler: TAdvPanelStyler;
    AdvOfficeStatusBarOfficeStyler: TAdvOfficeStatusBarOfficeStyler;
    ImageListLog: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uImg: TuImg;

  procedure LoadWindowPos(Form: TForm);
  procedure SaveWindowPos(Form : TForm);

implementation

{$R *.dfm}

uses
    GenUtils;

// 로딩시 Windows위치를 설정한다.
procedure LoadWindowPos(Form : TForm);
var
    INI : TIniFile;
    FileName, RdStr, FormName : String;
    nLeft, nTop, nWidth, nHeight : Integer;
begin
    FormName := Form.Caption;
    if (FormName = '') then exit;

    FileName := GetAppDir('') + 'POSTION.ini';
    if not FileExists(FileName) then Exit;

    INI := TIniFile.Create(FileName);
    try
        RdStr := INI.ReadString('POSITION', Form.Caption, '');
        if (RdStr <> '') then begin
            nLeft   := StrToIntDef( GetToken( RdStr, ','), 0);
            nTop    := StrToIntDef( GetToken( RdStr, ','), 0);
            nWidth  := StrToIntDef( GetToken( RdStr, ','), 800);
            nHeight := StrToIntDef( GetToken( RdStr, ','), 600);

            Form.SetBounds(nLeft, nTop, nWidth, nHeight);
        end;
    finally
        INI.Free;
    end;
end;

// 현재 MDI Child의 Windows Pos을 저장한다.
procedure SaveWindowPos(Form : TForm);
var i : Integer;
    INI : TIniFile;
    FileName, WtStr : String;
begin
    FileName := GetAppDir('') + 'POSTION.ini';

    INI := TIniFile.Create(FileName);
    try
        with Form do
        begin
            WtStr := Format('%d,%d,%d,%d', [Left, Top, Width, Height]);
            INI.WriteString('POSITION', Caption, WtStr);
        end;
    finally
        INI.Free;
    end;
end;
end.
