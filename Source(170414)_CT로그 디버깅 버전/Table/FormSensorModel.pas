unit FormSensorModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ExtCtrls, FormSensorTable, DPBLabel;

type
  TFrmSensorModel = class(TForm)
    Panel1: TPanel;
    cbKModel: TComboBox;
    edtMd: TEdit;
    edtSnsr: TEdit;
    btnAdd: TButton;
    memoSen: TMemo;
    dpbLabel1: TdpbLabel;
    dpbLabel2: TdpbLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure cbKModelSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSensorModel: TFrmSensorModel;

implementation

uses
    GenUtils, global;

{$R *.dfm}

procedure SaveIniSection(flname: String);
var Ini: TIniFile;
    i, stri: Integer;
    str, strs, itStm: String;
    bools, boolst, TFsec: Bool;
begin
    bools := True;
    boolst:= True;
    TFsec := True;

    if Trim(FrmSensorModel.edtMd.Text) = '' then
      exit;

    IniSensorPT := FrmSensorTable.gTableFolder + FrmSensorModel.edtMd.Text + '.TBL';

    Ini := TIniFile.Create (IniSensorPT);
    try
        strs := INI.ReadString('MAIN_SECTION', 'LIST', '');
        if (strs <> '') then
        begin
            stri:= StrToIntDef(GetToken(strs, ':'), 0);
            str:= IntToStr(stri+1)+ ':' +strs+ ',' + FrmSensorModel.edtSnsr.Text;
            Ini.WriteString('MAIN_SECTION', 'LIST', str);
        end
        else begin
            str := '1:' +  FrmSensorModel.edtSnsr.Text;
            Ini.WriteString('MAIN_SECTION', 'LIST', str);
        end;
    finally
        Ini.Free;
    end;

    FrmSensorTable.FlistBox.Update;
    FrmSensorTable.cmbModel.Items.Clear;
    for i:=0 to FrmSensorTable.FlistBox.Items.Count-1 do
    begin
        itStm := FrmSensorTable.FlistBox.Items[i];
        itStm := GetToken(itStm, '.');

        FrmSensorTable.cmbModel.Items.Add(itStm);
    end;
end;

procedure TFrmSensorModel.cbKModelSelect(Sender: TObject);
var Ini: TIniFile;
    i, stri, j: Integer;
    str, strs, strAdd: String;
begin
    memoSen.Text := '';

    IniSensorPT := FrmSensorTable.gTableFolder + cbKModel.Text + '.TBL';

  	Ini := TIniFile.Create (IniSensorPT);
    try
        Str := INI.ReadString('MAIN_SECTION', 'LIST', '' );
        stri:= StrToIntDef(GetToken(str, ':'), 0);
        for j:=0 to stri-1 do
        begin
            strAdd := GetToken(str, ',');
            memoSen.Lines.Add(strAdd)
        end;
        edtMd.Text := cbKModel.Text;
        edtSnsr.SetFocus;
    finally
        Ini.Free;
    end;
end;

procedure TFrmSensorModel.btnAddClick(Sender: TObject);
begin
    SaveIniSection(IniSensorPT);
    FrmSensorTable.cmbModel.Text := '';
    FrmSensorTable.cmbKos.Text := '';
    Close;
end;

procedure TFrmSensorModel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then Close;
end;

procedure TFrmSensorModel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    edtMd.Text   := '';
    edtSnsr.Text := '';
    memoSen.Text := '';
end;

end.
