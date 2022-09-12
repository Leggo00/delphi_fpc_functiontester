unit FormReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, FileCtrl, Buttons, DPBLabel, ComCtrls,
  ShellCtrls, shellapi, XiButton, ImgList;

type
  TFrmReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    DirectoryListBox: TDirectoryListBox;
    DriveComboBox: TDriveComboBox;
    RadioGroup_Type: TRadioGroup;
    BtnOpenData: TSpeedButton;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    SpeedButton2: TSpeedButton;
    ImageList: TImageList;
    SpeedButton3: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label_Count: TLabel;
    Label1: TLabel;
    Edit_Mask1: TEdit;
    BtnUpdate: TXiButton;
    MemoLog: TMemo;
    ListView: TListView;
    Splitter1: TSplitter;
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit_Mask1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup_TypeClick(Sender: TObject);
    procedure BtnOpenDataClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure ListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    ColumnToSort: Integer;
    procedure ViewFileList(DirName: String);
    { Private declarations }
  public
    { Public declarations }

    procedure Run(sDir: string);
  end;

var
  FrmReport: TFrmReport;


implementation

uses
    GenUtils, FormCalcCP, FormMain, Global;
//  FormMain, Math;

{$R *.dfm}

procedure TFrmReport.Run(sDir: string);
var
    sDirName: string;
begin
    if not DirectoryExists(sDir) then begin
        sDir := GetAppDir('DATA');
        MakeDir(sDir);
    end;

    try
        DirectoryListBox.Directory := sDir;
        DirectoryListBox.Update;
    except
    end;
    ShowModal;
end;

procedure TFrmReport.SpeedButton4Click(Sender: TObject);
begin
    Close();
end;

procedure TFrmReport.Edit_Mask1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then begin
        BtnUpdateClick(Sender);
        Key := 0;
    end;
end;

procedure TFrmReport.RadioGroup_TypeClick(Sender: TObject);
begin
    case RadioGroup_Type.ItemIndex of
        0 : begin
            Edit_Mask1.Text := '*.CSV';
        end;

        1 : begin
            Edit_Mask1.Text := '*-O.CSV';
        end;

        2 : begin
            Edit_Mask1.Text := '*-X.CSV';
        end;
    end;
    BtnUpdateClick(Sender);
end;


procedure TFrmReport.BtnOpenDataClick(Sender: TObject);
var FileName : String;
begin
    if ListView.Selected <> nil  then
    begin
        FileName := DirectoryListBox.Directory + '\' + ListView.Selected.Caption;
        if not FileExists(FileName) then exit;

        ShellExecute(Application.Handle, 'open', PChar(FileName), nil, nil, SW_NORMAL);
    end;
end;

procedure TFrmReport.SpeedButton1Click(Sender: TObject);
var
    sCpDataFile: string;
begin
    sCpDataFile := Format('%sCP_DATA\%s\', [GetAppDir('DATA'), gModelCode]); //gProjectFileName1

    FrmCalcCP := TFrmCalcCP.Create(self);
  	FrmCalcCP.Run(sCpDataFile);
    FrmCalcCP.Free;

end;

procedure TFrmReport.SpeedButton2Click(Sender: TObject);
var Path : String;
begin
    Path := DirectoryListBox.Directory;
    ShellExecute(handle, 'explore', PChar(Path), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmReport.BtnUpdateClick(Sender: TObject);
begin
    ViewFileList(DirectoryListBox.Directory);
end;

procedure TFrmReport.ViewFileList(DirName : String);
var
    Status: Integer;
    SearchRec: TSearchRec;
    ListItem : TListItem;
    FileAttrs : Integer;
    nTotal, nGood, nFail : Integer;
begin
    ListView.Items.BeginUpdate;
    ListView.Items.Clear;

    nTotal :=0;
    nGood  :=0;
    nFail  :=0;

    FileAttrs := faArchive;
    Status := FindFirst(DirName + '\' + Edit_Mask1.Text, FileAttrs, SearchRec);
    try
        while Status = 0 do
        begin
         if (SearchRec.Attr and FileAttrs) = FileAttrs then
          begin
              if
               (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
              begin
                  ListItem := ListView.Items.Add;
                  ListItem.Caption := SearchRec.Name;
                  ListItem.SubItems.Add(FormatFloat('###,###,##0', SearchRec.Size) + ' Byte');
                  ListItem.SubItems.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', FileDateToDateTime(SearchRec.Time)));

                  // 양품..
                  if Pos('-O.', SearchRec.Name) > 0 then begin
                    ListItem.ImageIndex := 0;
                    Inc(nGood);
                  end;
                  if Pos('-X.', SearchRec.Name) > 0 then begin
                    ListItem.ImageIndex := 1;
                    Inc(nFail);
                  end;
                  Inc(nTotal);
              end;
          end;
          Status := FindNext(SearchRec);
          end;
          Label_Count.Caption := Format('전체 : %d, 양품 : %d, 불량 : %d', [ nTotal, nGood, nFail ]);
    finally
        ListView.Items.EndUpdate;
        FindClose(SearchRec);
    end;
end;


procedure TFrmReport.FormCreate(Sender: TObject);
begin

    ColumnToSort := 2;
end;

procedure TFrmReport.ListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
    ColumnToSort := Column.Index;
    (Sender as TCustomListView).AlphaSort;
end;

procedure TFrmReport.ListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
    i: Integer;
begin
    if ColumnToSort = 0 then
        Compare := CompareText(Item1.Caption,Item2.Caption)
    else begin
       i := ColumnToSort - 1;
       Compare := CompareText(Item1.SubItems[i],Item2.SubItems[i]);
      end;
end;

procedure TFrmReport.SpeedButton3Click(Sender: TObject);
var i, j : Integer;
    Str, FileName : String;
    StrList : TStringList;
begin
    MemoLog.Lines.Clear;

    StrList := TStringList.Create;
    try
        for i:= 0 to ListView.Items.Count-1 do begin
            FileName := ListView.Items[i].Caption;
            if Pos('-X.', FileName) = 0 then continue;

            FileName := DirectoryListBox.Directory + '\' + FileName;
            if not FileExists(FileName) then continue;

            StrList.LoadFromFile(FileName);

            MemoLog.Lines.Add('# ' + ExtractFileName(FileName));
            for j:=0 to StrList.Count-1 do begin
                if (Pos(',"NG"', StrList[j]) > 0) or (Pos(',"FAIL"', StrList[j]) > 0) then
                    MemoLog.Lines.Add('    ' + StrList[j]);
            end;
            MemoLog.Lines.Add('');
        end;
    finally
        StrList.Free;
    end;
end;

end.

