unit FormCalcCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls, Buttons, FileCtrl, Hutil32, Zinictrl, IniFiles,
  ComCtrls;

type
  TFrmCalcCP = class(TForm)
    FileListBoxCP: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Edit1: TEdit;
    BtnLoad: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Date_From: TDateTimePicker;
    Date_To: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
     procedure Run(sCpDir: string);
   	 procedure WriteDataCP (sFileName: string; testitemstr, resultstr: string);
  end;

var
  FrmCalcCP: TFrmCalcCP;

implementation

uses GenUtils, FormCpViewer, Global;

{$R *.DFM}


procedure TFrmCalcCP.Run(sCpDir: string);
begin
    if not DirectoryExists(sCpDir) then begin
        MessageBox('CP 데이터가 없습니다.', '데이터 확인', MB_OK or MB_ICONINFORMATION );
        // sCpDir := GetAppDir('DATA');
//         sCpDir := DATA_FOLDER;
        exit;
    end;
    Date_From.DateTime := Now;
    Date_To.DateTime   := Now;

    try
        DirectoryListBox1.Directory := sCpDir;
        FileListBoxCp.Update;
    except
    end;

    ShowModal;
end;

{
 CP file format

 [Info]
 Name = test name
 Min  = 1
 Max  = 10

 [Data]
 "test date" "test value"

}
                                  //저장파일명    bat전류 = MIN 1 MIX 5 CP
procedure TFrmCalcCP.WriteDataCP (sFileName: string; testitemstr, resultstr: string);
var
    wrstr, str, rdstr, minstr, maxstr: string;
    text: TextFile;
    buf: array[0..1024] of char;
    ini: TIniFile;
    sDirName: string;
begin
    sDirName := ExtractFileDir(sFileName);
    ForceDirectories(sDirName);

    if not FileExists(sFileName) then
    begin
        str := GetValidStr3 (testitemstr, rdstr, [' ']);
        StrPCopy (buf, str);
        ini := TIniFile.Create (sFileName);

        with ini do
        begin
            WriteString ('Info', 'Name', rdstr);
            minstr := GetValueFromMask (buf, '%1'); //최소값
            maxstr := GetValueFromMask (buf, '%2'); //최대값
            WriteString ('Info', 'Min', minstr);
            WriteString ('Info', 'Max', maxstr);
            WriteString ('Data', '-- Date --', '-- Value --');
        end;
        ini.Free;
        AssignFile (text, sFileName);
        try
            Append (text);
        except
            exit;
        end;

    end else
    begin
        AssignFile (text, sFileName);
        try
            Append (text);
        except
            exit;
        end;
    end;

    wrstr := '"' + DateToStr (Date) + '" "' + resultstr + '"';    //    wrstr := '"' + FormatDateTime('YYYY-MM-DD_HH:MM:SS', Now) + '" "' + resultstr + '"';
    WriteLn (text, wrstr);
    CloseFile (text);
end;


procedure TFrmCalcCP.BitBtn4Click(Sender: TObject);
var
   msg: array[0..255] of char;
begin
   StrPCopy (msg, '이 파일을 "' + FileListBoxCP.FileName + '" 을 삭제 하시겠습니까?');
   if IDOK = Application.MessageBox (msg, '알림', mb_OkCancel or mb_defbutton1 or mb_iconquestion) then begin
      DeleteFile (FileListBoxCp.FileName);
      FileListBoxCp.Update;
   end;
end;

procedure TFrmCalcCP.BtnLoadClick(Sender: TObject);
begin
    if FileListBoxCp.ItemIndex >= 0 then
    begin
        StatExecute(Date_From.Date, Date_To.Date, FileListBoxCp.FileName);
    end;
end;

procedure TFrmCalcCP.SpeedButton1Click(Sender: TObject);
var nYear, nMon, nDay : Word;
    SelDate : TDateTime;
begin
    SelDate := Date_From.DateTime;
    DecodeDate(SelDate, nYear, nMon, nDay);

    Date_From.Date := EncodeDate(nYear, nMon, 1);

    Inc(nMon);
    if (nMon > 12) then begin
        Inc(nYear);
        nMon := 1;
    end;
    Date_To.Date   := EncodeDate(nYear, nMon, 1) - 1;

end;

end.
