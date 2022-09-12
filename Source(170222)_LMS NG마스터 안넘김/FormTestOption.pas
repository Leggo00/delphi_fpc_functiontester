unit FormTestOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ZINICtrl, Spin, ComCtrls, XiButton,
  Grids, ValEdit, INIFiles, DPBLabel, RealSpinEdit;

type
  TFrmTestOption = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox_TestCount: ZIniCheckBox;
    Edit_TestCount: ZIniSpinEdit;
    CheckBox_TestTime: ZIniCheckBox;
    Edit_TestHour: ZIniSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Radio_DataSave: ZIniRadioGroup;
    BtnClose: TBitBtn;
    Radio_GraghSave: ZIniRadioGroup;
    Edit_TestMin: ZIniSpinEdit;
    Label8: TLabel;
    INI: ZIniData;
    gbx2: TGroupBox;
    chkNgStop: ZIniCheckBox;
    Cb_UseBarcode: ZIniCheckBox;
    Cb_PrevCheck: ZIniCheckBox;
    BitBtn2: TBitBtn;
    Cb_AutoModelChange: ZIniCheckBox;
    Cb_UseITAC: ZIniCheckBox;
    Cb_AutoNGStop_: ZIniCheckBox;
    Ed_NgStopCount_: ZIniSpinEdit;
    Cb_CounterAutoReset: ZIniCheckBox;
    DateTimePicker: TDateTimePicker;
    Cb_JigModelCheck: ZIniCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Ed_MasterSerial: TEdit;
    Ed_MasterModelCode: TEdit;
    Label4: TLabel;
    BtnMasterAdd: TSpeedButton;
    BtnMasterDelete: TSpeedButton;
    Panel1: TPanel;
    BtnLoadDefault: TXiButton;
    BtnLoadMaster: TXiButton;
    BtnSaveDefault: TXiButton;
    BtnSaveMaster: TXiButton;
    VList_Master: TValueListEditor;
    Lb_Status: TdpbLabel;
    Label5: TLabel;
    cb_TempSpec: ZIniCheckBox;
    TraceINI: ZIniData;
    Edit_OldDate: ZIniEdit;
    edt_TempLowSpec: ZIniRealSpinEdit;
    edt_TempMaxSpec: ZIniRealSpinEdit;
    Edt_StartDiag: ZIniEdit;
    Label7: TLabel;
    cbCPuse: ZIniCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    cb_TempConn: ZIniCheckBox;
    cb_TempSpec2: ZIniCheckBox;
    edt_TempLowSpec2: ZIniRealSpinEdit;
    edt_TempMaxSpec2: ZIniRealSpinEdit;
    cbAutoReset: ZIniCheckBox;
    edtAutoReset: ZIniEdit;
    cb_PCBcheck: ZIniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Radio_DataSaveClick(Sender: TObject);
    procedure BtnMasterAddClick(Sender: TObject);
    procedure BtnMasterDeleteClick(Sender: TObject);
    procedure BtnSaveDefaultClick(Sender: TObject);
    procedure BtnLoadDefaultClick(Sender: TObject);
    procedure BtnLoadMasterClick(Sender: TObject);
    procedure BtnSaveMasterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function FindMasterSerial(sSerial: String): String;
    function Execute() : Boolean;
  end;

var
  FrmTestOption: TFrmTestOption;

implementation

uses Global, GenUtils;

{$R *.dfm}

function TFrmTestOption.Execute() : Boolean;
begin
    Radio_DataSaveClick(nil);
    if (ShowModal() = mrOk) then
    begin
        Result := True;                              
    end
    else
        Result := False;
end;

procedure TFrmTestOption.FormCreate(Sender: TObject);
var INIF : TIniFile;
begin
    BtnLoadDefaultClick(Sender);

    // MASTER BARCODE 설정을 읽는다.
    INIF := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try
        INIF.ReadSectionValues('MASTER_BARCODE', VList_Master.Strings);
    finally
        INIF.Free;
    end;

    TraceINI.LoadData;
end;

procedure TFrmTestOption.Radio_DataSaveClick(Sender: TObject);
begin
    Radio_GraghSave.Enabled := (Radio_DataSave.ItemIndex <> 3);
end;

procedure TFrmTestOption.BtnMasterAddClick(Sender: TObject);
var sSerial, sModelCode, sOldModelCode : String;
begin
    sSerial    := Trim(Ed_MasterSerial.Text);
    sModelCode := Trim(Ed_MasterModelCode.Text);

    if (sSerial = '') then begin
        MessageBox('Input Master SerialNo.', 'Confirm', MB_ICONINFORMATION or MB_OK);
        exit;
    end;
    if (sModelCode = '') then begin
        MessageBox('Input Master ModelCode.', 'Confirm', MB_ICONINFORMATION or MB_OK);
        exit;
    end;

    VList_Master.Strings.Values[sSerial] := sModelCode;
end;

// 마스터 바코드의 모델코드를 얻는다.
function TFrmTestOption.FindMasterSerial(sSerial : String) : String;
begin
    Result := VList_Master.Strings.Values[sSerial];
end;

procedure TFrmTestOption.BtnMasterDeleteClick(Sender: TObject);
var Idx : Integer;
begin
    Idx := VList_Master.Row-1;
    if (Idx >=0) and (Idx < VList_Master.Strings.Count) then begin
        VList_Master.Strings.Delete(Idx);
        VList_Master.Update;
    end;
end;

procedure TFrmTestOption.BtnLoadDefaultClick(Sender: TObject);
begin
    Lb_Status.Caption := 'NORMAL';
    Lb_Status.Color   := clTeal;

    INI.IniSection := 'STARTOPTION';
    INI.LoadData;
end;

procedure TFrmTestOption.BtnLoadMasterClick(Sender: TObject);
begin
    Lb_Status.Caption := 'MASTER';
    Lb_Status.Color   := clBlue;

    INI.IniSection := 'MASTEROPTION';
    INI.LoadData;
end;

procedure TFrmTestOption.BtnSaveDefaultClick(Sender: TObject);
begin
    INI.IniSection := 'STARTOPTION';
    INI.SaveData;

    BtnLoadDefaultClick(Sender);
end;

procedure TFrmTestOption.BtnSaveMasterClick(Sender: TObject);
begin
    INI.IniSection := 'MASTEROPTION';
    INI.SaveData;
    
    BtnLoadMasterClick(Sender);
end;

procedure TFrmTestOption.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i : Integer;
    INIF : TIniFile;
    Str, RdStr : String;
begin
    // MASTER BARCODE 설정을 읽는다.
    INIF := TIniFile.Create(GetAppDir('') + 'CONFIG.INI');
    try

        INIF.EraseSection('MASTER_BARCODE');
        for i:= 0 to VList_Master.Strings.Count-1 do begin
            RdStr := VList_Master.Strings[i];
            Str := GetToken(RdStr, '=');

            if (Str <> '') then
                INIF.WriteString('MASTER_BARCODE', Str, RdStr);
        end;
    finally
        INIF.Free;
    end;

//    INI.SaveData;
end;

end.
