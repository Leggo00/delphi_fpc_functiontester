//------------------------------------------------------------------------------
//
//    KMI CONTROLLER 하드웨어 제어 공용모듈.  
//    Last Update 2009.07.24
//------------------------------------------------------------------------------
unit FormHardware;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, Tabnotbk, ExtCtrls, StdCtrls, Mask, Spin, Buttons, mmSystem,
  inifiles, Zinictrl, DPBLabel, ComDrv32, Math, DWDevice, XiButton, XiPanel,
  PCLDevice, Global, Zpcl818;

const
    MAX_ADCARD    = 10;
    MAX_DOCARD    = 10;
    MAX_DICARD    = 5;
    MAX_DACARD    = 5;
    MAX_ROCARD    = 10;
    MAX_POCARD    = 5;

    MAX_ADCHANNEL = 32;
    MAX_DOCHANNEL = 16;
    MAX_DICHANNEL = 16;
    MAX_DACHANNEL = 8;
    MAX_POCHANNEL = 4;

    AD_MUX_WAIT   = 10;
    INVALID_VALUE = -9999;

type
  TFrmHardware = class(TForm)
    TimerRead: TTimer;
    Page: TPageControl;
    INI: ZIniData;
    INIConfig: ZIniData;
    Comm: TCommPortDriver;
    TabSheet5: TTabSheet;
    GroupBoxIO: TGroupBox;
    BtnAddrChage: TBitBtn;
    CheckBox_EditIOAddr: TCheckBox;
    CheckEditable: TCheckBox;
    XiPanel1: TXiPanel;
    BtnReset: TXiButton;
    BtnSave: TXiButton;
    BtnClose: TXiButton;
    StatusBar: TStatusBar;
    INISetup: ZIniData;
    HeaderDIO: THeader;
    HeaderAD: THeader;
    Label1: TLabel;
    MemoExcept: TMemo;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnResetClick(Sender: TObject);
    procedure CheckEditableClick(Sender: TObject);
    procedure BtnAddrChageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox_EditIOAddrClick(Sender: TObject);
    procedure BtnSetResisterClick(Sender: TObject);
    procedure BtnPOClick(Sender: TObject);
    procedure CommReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure FormShow(Sender: TObject);
    procedure PageChange(Sender: TObject);
  private
    // AD
    DWADdev    : array [1..MAX_ADCARD] of ZDWADdev;
    DWADIO     : array [1..MAX_ADCARD, 1..MAX_ADCHANNEL] of ZPCLADIn;
    // DO
    DWDOdev    : array [1..MAX_DOCARD] of ZDWDOdev;
    DWDOIO     : array [1..MAX_DOCARD, 1..MAX_DOCHANNEL] of ZPCLDigOut;
    // DI
    DWDIdev    : array [1..MAX_DICARD] of ZDWDIdev;
    DWDIIO     : array [1..MAX_DICARD, 1..MAX_DICHANNEL] of ZPCLDigIn;
    // DA
    DWDAdev    : array [1..MAX_DACARD] of ZDWDAdev;
    DWDAIO     : array [1..MAX_DACARD, 1..MAX_DACHANNEL] of ZPCLDAOut;
    // RO
    DWROdev    : array [1..MAX_ROCARD] of ZDWROdev;
    // PO
    DWPOdev    : array [1..MAX_POCARD] of TCommPortDriver;
    nADCount, nDOCount, nDICount, nDACount, nROCount, nPOCount : Integer;

    procedure CreateIOChannel;
    procedure LoadIOConfig (iofile: string);
  public
    procedure ResetIO;
    function  ReadAD (nCard, nChannel: Integer): Double;
    function  ReadDI (nCard, nChannel: Integer): Boolean;
    function  WriteDO(nCard, nChannel: Integer; bOnOff: Boolean) : Boolean;
    function  WriteDA(nCard, nChannel: Integer; fValue : Double) : Boolean;
    function  WritePO(nCard, nChannel: Integer; fFreq, fDuty: double) : boolean;
    function  WriteRO(nCard: Integer; fValue: double) : boolean;

    function  GetIOcontrol (ctlname: String): ZIOChannel;
    function  WriteIOcontrol(ctlname, param : String; tagStr: String = ''): Boolean;
    function  ReadIOcontrol(ctlname, param : String; tagStr: String = ''): String;

    procedure GetIOcontrolList (Strlist: TStrings; ResType : TResType);

  end;

  procedure InitializeDeviceAll();
var
  FrmHardware: TFrmHardware;

implementation

uses
    GenUtils, FormDevice, FormGraph;

{$R *.DFM}

function TFrmHardware.GetIOcontrol (ctlname: String): ZIOChannel;
var i: Integer;
    Compo: TComponent;
begin
    Result := nil;
    for i:=0 to ComponentCount-1 do begin
        Compo := Components[i];
        if (Compo is ZIOChannel) then begin
            if ((Compo as ZIOChannel).Text = ctlname) or
               ((Compo as ZIOChannel).Name = ctlname) then begin
                    Result := Compo as ZIOChannel;
                    exit;
            end;
        end;
    end;
end;

procedure TFrmHardware.LoadIOConfig (iofile: string);

   procedure LoadConfig (dev: ZPCLdevice);
   begin
      dev.ConfigPath := ZConfigPath (dirAbsolute);
      dev.ConfigFile := iofile;
      dev.LoadConfig;
   end;

var Compo: TComponent;
    i: Integer;
begin
    if not FileExists(iofile) then exit;

    INI.IniFileDir  := ZINICtrl.dirAbsolute;
    INI.IniFileName := iofile;
    INI.LoadData;
    INIConfig.LoadData;

    BtnAddrChageClick(self);

    for i:=0 to ComponentCount-1 do begin
        Compo := Components[i];
        if (Compo is ZPCLdevice) then begin
            LoadConfig (Compo as ZPCLdevice);
        end;
    end;
end;

procedure TFrmHardware.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   TimerRead.Enabled := False;
{
   if Action = caHide then begin
      BtnResetClick (self);
   end;
   ResetIO;
}
end;

procedure TFrmHardware.BtnSaveClick(Sender: TObject);
var i: Integer;
begin
   if IDOK = Application.MessageBox ('저장하시겠습니까?', '하드웨어 설정 저장', mb_OkCancel OR MB_ICONQUESTION) then begin
      for i:=0 to ComponentCount-1 do begin
         if (Components[i] is ZPCLdevice) then
            (Components[i] as ZPCLdevice).SaveConfig;
      end;
      INI.SaveData;
      INIConfig.SaveData;
   end;
end;

procedure TFrmHardware.BtnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmHardware.TimerReadTimer(Sender: TObject);
var i: Integer;
    fTime : Double;
begin
   TimerRead.Enabled := false;

   if (Visible) then begin
      fTime := GetTickCountEX;
      for i:=0 to ComponentCount-1 do begin
         if (Components[i] is ZPCLdevice) then
            (Components[i] as ZPCLdevice).ReadDevice;
      end;
      StatusBar.Panels[0].Text := Format('%f ms', [GetTickCountEX - fTime]);
   end;

   TimerRead.Enabled := true;
end;

procedure InitializeDeviceAll();
var
    i: Integer;
begin
    Screen.Cursor := crHourGlass;
    FrmHardware.ResetIO;
    Screen.Cursor := crDefault;
end;

procedure TFrmHardware.BtnResetClick(Sender: TObject);
begin
    InitializeDeviceAll();
end;

procedure TFrmHardware.CheckEditableClick(Sender: TObject);
var i: Integer;
begin
   if CheckEditable.Checked then
      if IDOK <> MessageBox (
        '하드웨어 포트의 이름을 변경할 경우' + #13 +
        '이미 설정해 놓은 테스트 프로젝트 파일이' + #13 +
        '정상적으로 동작하지 않을 수 있습니다.' + #13#13 + '그래도 변경하시겠습니까?',
        '하드웨어 이름 변경', mb_OkCancel OR MB_ICONWARNING) then
      begin
           CheckEditable.Checked := FALSE;
           exit;
      end;

   for i:=0 to ComponentCount-1 do
   begin
      if Components[i] is ZIOChannel then
         (Components[i] as ZIOChannel).EditName := CheckEditable.Checked;
   end;
end;

procedure TFrmHardware.BtnAddrChageClick(Sender: TObject);
var i : Integer;
    Edit : ZIniEdit;
begin
    for i:= 1 to nADCount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_AD%d', [i])));
        DWADdev[i].BaseAddr := Edit.Text;
    end;

    for i:= 1 to nDOCount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_DO%d', [i])));
        DWDOdev[i].BaseAddr := Edit.Text;
    end;

    for i:= 1 to nDICount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_DI%d', [i])));
        DWDIdev[i].BaseAddr := Edit.Text;
    end;

    for i:= 1 to nDACount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_DA%d', [i])));
        DWDAdev[i].BaseAddr := Edit.Text;
    end;

    for i:= 1 to nROCount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_RO%d', [i])));
        DWROdev[i].BaseAddr := Edit.Text;
    end;

    for i:= 1 to nPOCount do begin
        Edit := ZIniEdit(FindComponent(Format('Edit_PO%d', [i])));
        DWPOdev[i].Disconnect;
        DWPOdev[i].ComPort := StrToIntDef(Edit.Text, 0);
        DWPOdev[i].Connect;
    end;
end;

procedure TFrmHardware.FormCreate(Sender: TObject);
var INI : TInifile;
    RdStr, FileName, ctlname : String;
    i, j : Integer;
    Ctrl : ZIOChannel;
begin
    FileName := GetAppDir('') + 'CONFIG.INI';
    INI := TIniFile.Create(FileName);
    try
        nADCount := min(MAX_ADCARD, INI.ReadInteger('HARDWARE', 'ADCount', 0));
        nDOCount := min(MAX_DOCARD, INI.ReadInteger('HARDWARE', 'DOCount', 0));
        nDICount := min(MAX_DICARD, INI.ReadInteger('HARDWARE', 'DICount', 0));
        nDACount := min(MAX_DACARD, INI.ReadInteger('HARDWARE', 'DACount', 0));
        nROCount := min(MAX_ROCARD, INI.ReadInteger('HARDWARE', 'ROCount', 0));
        nPOCount := min(MAX_ROCARD, INI.ReadInteger('HARDWARE', 'POCount', 0));
    finally
        INI.Free;
    end;

    CreateIOChannel;

    FileName := GetAppDir('') + 'IOCONFIG.INI';
    LoadIOConfig(FileName);

    // 초기화하지 말아야할 목록리스트.
    // Tag를 0으로 하면 ResetIO에서 제외됨..
    INI := TIniFile.Create(FileName);
    try
        INI.ReadSectionValues('EXCEPT_RESET', MemoExcept.Lines);
        for i:=0 to MemoExcept.Lines.Count-1 do begin
            RdStr := Trim(MemoExcept.Lines[i]);
            ctlname := GetToken(RdStr, '=');
            Ctrl := GetIOcontrol(ctlname);
            
            if (Ctrl <> nil) then
            begin
                 Ctrl.Tag := StrToIntDef(RdStr, 0);
                 if (Ctrl.Tag <> 0) then
                    Ctrl.Font.Color := clBlue;
            end;
        end;
    finally
        INI.Free;
    end;

    INIConfig.LoadData;
end;

procedure TFrmHardware.FormDestroy(Sender: TObject);
var INI : TInifile;
    FileName : String;
begin
    FileName := GetAppDir('') + 'CONFIG.INI';
    INI := TIniFile.Create(FileName);
    try
        INI.WriteInteger('HARDWARE', 'ADCount', nADCount);
        INI.WriteInteger('HARDWARE', 'DOCount', nDOCount);
        INI.WriteInteger('HARDWARE', 'DICount', nDICount);
        INI.WriteInteger('HARDWARE', 'DACount', nDACount);
        INI.WriteInteger('HARDWARE', 'ROCount', nROCount);
        INI.WriteInteger('HARDWARE', 'POCount', nPOCount);
    finally
        INI.Free;
    end;

    InitializeDeviceAll();
end;

procedure TFrmHardware.CheckBox_EditIOAddrClick(Sender: TObject);
var
   i: integer;
   compo: TComponent;
   Flag : Boolean;
begin
    Flag := CheckBox_EditIOAddr.Checked;

    if (Flag) then
      if IDOK <> MessageBox (
        '하드웨어 IO ADDRESS를 변경할 경우' + #13 +
        '이미 설정해 놓은 테스트 프로젝트 파일이' + #13 +
        '정상적으로 동작하지 않을 수 있습니다.' + #13#13 +
        '그래도 변경하시겠습니까?',
        '하드웨어 IO ADDRESS 변경', mb_OkCancel OR MB_ICONWARNING) then begin
           CheckBox_EditIOAddr.Checked := false;
           exit;
      end;

    for i:=0 to ComponentCount-1 do begin
        compo := Components[i];
        if (compo is ZIniEdit) and ((compo as ZIniEdit).Tag = 100) then
           (compo as ZIniEdit).Enabled := Flag;
    end;
    BtnAddrChage.Enabled := Flag;
end;

procedure TFrmHardware.BtnSetResisterClick(Sender: TObject);
var nChannel : Integer;
    Edit : ZIniEdit;
    fValue : Double;
begin
    nChannel := (Sender as TBitBtn).tag;
    if not (nChannel in [1..MAX_ROCARD]) then exit;

    Edit := ZIniEdit(FindComponent(Format('Edit_RO%d_Value', [nChannel])));
    if (Edit <> nil) then begin
        fValue := StrToFloatDef(Edit.Text, 0);
        WriteRO(nChannel, fValue);
    end;
end;

procedure TFrmHardware.BtnPOClick(Sender: TObject);
var Idx, nCard, nChannel : integer;
    fFreq, fDuty : Double;
    Edit : ZIniEdit;
begin
    Idx := (Sender as TBitBtn).tag;
    nCard    := (Idx div 10);
    nChannel := (Idx mod 10);

    // 주파수를 가져온다.
    Edit := ZIniEdit(FindComponent( Format('Edit_PO%d_%.2d_Freq', [nCard, nChannel])));
    if (Edit = nil) then exit;
    fFreq := StrToFloatDef( Edit.Text, 0);

    // Duty를 가져온다.
    Edit := ZIniEdit(FindComponent( Format('Edit_PO%d_%.2d_Duty', [nCard, nChannel])));
    if (Edit = nil) then exit;
    fDuty := StrToFloatDef( Edit.Text, 0);

    WritePO(nCard, nChannel, fFreq, fDuty);
end;

procedure TFrmHardware.CreateIOChannel;
var i, j, PageNo, nCount : Integer;
    Header : THeader;
    TabSheet : TTabSheet;
    IniEdit : ZIniEdit;
    Lb : TLabel;
    GroupBox : TGroupBox;
    Btn : TBitBtn;
    DevStr : String;
const
    COMPO_WIDTH  = 385;
    COMPO_HEIGHT = 24;

    COMPO_START_LEFT1 = 8;
    COMPO_START_LEFT2 = 416;
    COMPO_START_TOP   = 36;

    function CreateLabel(Parent : TWinControl; Name, Caption : String; Left, Top : Integer) : TLabel;
    begin
        Result := TLabel.Create(Self);
        Result.Name    := Name;
        Result.Caption := Caption;
        Result.Left    := Left;
        Result.Top     := Top;
        Result.Parent  := Parent;
    end;

    function CreateEdit(Parent : TWinControl; Name, Text : String; Left, Top, Width : Integer) : ZIniEdit;
    begin
        Result := ZIniEdit.Create(Self);
        Result.Name     := Name;
        Result.Parent   := Parent;
        Result.Left     := Left;
        Result.Top      := Top;
        Result.Width    := Width;
        Result.Text     := Text;
    end;
begin

    // AD Board만큼 동적으로 생성한다. AD Compoent를 찾는 시간을 줄이기 위해.
    for i:= 1 to nADCount do
    begin
        // TabSheet를 생성.
        TabSheet := TTabSheet.Create(Self);
        TabSheet.Name := Format('PAGE_AD%d', [i]);
        TabSheet.Caption := Format('AD%d', [i]);
        TabSheet.PageControl := Page;

        // AD Device를 생성.
        DWADdev[i] := ZDWADdev.Create(Self);
        DWADdev[i].Name := Format('Dev_AD%d', [i]);
        DWADdev[i].ConfigFile := 'IOCONFIG.INI';
        DWADdev[i].ConfigPath := ZConfigPath(dirExeFile);
        DWADdev[i].MuxWait := AD_MUX_WAIT;

        Header := THeader.Create(Self);
        Header.Name   := Format('HEADER_AD%d_1', [i]);
        Header.Parent := TabSheet;
        Header.Top    := 12;
        Header.Left   := COMPO_START_LEFT1;
        Header.Width  := COMPO_WIDTH;
        Header.Height := 22;
        Header.Sections.Assign(HeaderAD.Sections);

        Header := THeader.Create(Self);
        Header.Name   := Format('HEADER_AD%d_2', [i]);
        Header.Parent := TabSheet;
        Header.Top    := 12;
        Header.Left   := COMPO_START_LEFT2;
        Header.Width  := COMPO_WIDTH;
        Header.Height := 22;
        Header.Sections.Assign(HeaderAD.Sections);

        for j:= 1 to MAX_ADCHANNEL do
        begin
            DWADIO[i, j] := ZPCLADIn.Create(Self);
            DWADIO[i, j].Name    := Format('AD%d_%.2d', [i,j]);
            DWADIO[i, j].Text    := DWADIO[i, j].Name;
            DWADIO[i, j].Parent  := TabSheet;

            if (j <= 16) then begin
                DWADIO[i, j].Left    := COMPO_START_LEFT1;
                DWADIO[i, j].Top     := ((j-1 ) * COMPO_HEIGHT) + COMPO_START_TOP;
            end else
            begin
                DWADIO[i, j].Left    := COMPO_START_LEFT2;
                DWADIO[i, j].Top     := ((j-17) * COMPO_HEIGHT) + COMPO_START_TOP;
            end;
            DWADIO[i,j].Width   := COMPO_WIDTH;
            DWADIO[i,j].Device  := DWADdev[i];
            DWADIO[i,j].PortMin := 1;
            DWADIO[i,j].PortMax := MAX_ADCHANNEL;
            DWADIO[i,j].PortNo  := j;
            DWADIO[i,j].VALmin  := 0;
            DWADIO[i,j].VALmax  := 30;
            DWADIO[i,j].Show;
        end;
    end;

    //--------------------------------------------------------------------------
    for i:= 1 to nDOCount do
    begin
        // TabSheet를 생성. 5개 단위로 하나씩 묶는다.
        if ((i-1) mod 5) = 0 then
        begin
            PageNo := ((i-1) div 5)+1;
            TabSheet := TTabSheet.Create(Self);
            TabSheet.Name := Format('PAGE_DO%d', [PageNo]);
            TabSheet.Caption := Format('DO%d', [PageNo]);
            TabSheet.PageControl := Page;
        end;

        // AD Device를 생성.
        DWDOdev[i] := ZDWDOdev.Create(Self);
        DWDOdev[i].Name := Format('Dev_DO_%d', [i]);
        DWDOdev[i].ConfigFile := 'IOCONFIG.INI';
        DWDOdev[i].ConfigPath := ZConfigPath(dirExeFile);

        Header := THeader.Create(Self);
        Header.Parent := TabSheet;
        Header.Top    := COMPO_START_TOP - 22;
        Header.Left   := ((i-1) mod 5) * (152+10) + COMPO_START_LEFT1;
        Header.Width  := 152;
        Header.Height := 20;
        Header.Sections.Text := HeaderDIO.Sections.Text;

        for j:= 1 to MAX_DOCHANNEL do
        begin
            DWDOIO[i,j] := ZPCLDigOut.Create(Self);
            DWDOIO[i,j].Name    := Format('DO%d_%.2d', [i,j]);
            DWDOIO[i,j].Text    := DWDOIO[i, j].Name;
            DWDOIO[i,j].Parent  := TabSheet;
            DWDOIO[i,j].Left    := ((i-1) mod 5)* (152+10) + COMPO_START_LEFT1;
            DWDOIO[i,j].Top     := (j-1) * COMPO_HEIGHT    + COMPO_START_TOP;
            DWDOIO[i,j].Width   := 152;
            DWDOIO[i,j].Device  := DWDOdev[i];
            DWDOIO[i,j].PortMin := 1;
            DWDOIO[i,j].PortMax := MAX_DOCHANNEL;
            DWDOIO[i,j].PortNo  := j;
            DWDOIO[i,j].Show;
        end;
    end;

    //--------------------------------------------------------------------------
    for i:= 1 to nDICount do
    begin
        // TabSheet를 생성. 5개 단위로 하나씩 묶는다.
        if ((i-1) mod 5) = 0 then
        begin
            PageNo := ((i-1) div 5)+1;
            TabSheet := TTabSheet.Create(Self);
            TabSheet.Name := Format('PAGE_DI%d', [PageNo]);
            TabSheet.Caption := Format('DI%d', [PageNo]);
            TabSheet.PageControl := Page;
        end;

        // DI Device를 생성.
        DWDIdev[i] := ZDWDIdev.Create(Self);
        DWDIdev[i].Name := Format('Dev_DI_%d', [i]);
        DWDIdev[i].ConfigFile := 'IOCONFIG.INI';
        DWDIdev[i].ConfigPath := ZConfigPath(dirExeFile);

        Header := THeader.Create(Self);
        Header.Parent := TabSheet;
        Header.Top    := COMPO_START_TOP - 22;
        Header.Left   := ((i-1) mod 5) * (152+10) + COMPO_START_LEFT1;
        Header.Width  := 152;
        Header.Height := 20;
        Header.Sections.Text := HeaderDIO.Sections.Text;

        for j:= 1 to MAX_DICHANNEL do
        begin
            DWDIIO[i,j] := ZPCLDigIn.Create(Self);
            DWDIIO[i,j].Name    := Format('DI%d_%.2d', [i,j]);
            DWDIIO[i,j].Text    := DWDIIO[i, j].Name;
            DWDIIO[i,j].Parent  := TabSheet;
            DWDIIO[i,j].Left    := ((i-1) mod 5)* (152+10) + COMPO_START_LEFT1;
            DWDIIO[i,j].Top     := (j-1) * COMPO_HEIGHT    + COMPO_START_TOP;
            DWDIIO[i,j].Width   := 152;
            DWDIIO[i,j].Device  := DWDIdev[i];
            DWDIIO[i,j].PortMin := 1;
            DWDIIO[i,j].PortMax := MAX_DICHANNEL;
            DWDIIO[i,j].PortNo  := j;
            DWDIIO[i,j].Show;
        end;
    end;

    //--------------------------------------------------------------------------
    for i:= 1 to nDACount do
    begin
        // TabSheet를 생성.
        TabSheet := TTabSheet.Create(Self);
        TabSheet.Name := Format('PAGE_DA%d', [i]);
        TabSheet.Caption := Format('DA%d', [i]);
        TabSheet.PageControl := Page;

        // AD Device를 생성.
        DWDAdev[i] := ZDWDAdev.Create(Self);
        DWDAdev[i].Name := Format('Dev_DA%d', [i]);
        DWDAdev[i].ConfigFile := 'IOCONFIG.INI';
        DWDAdev[i].ConfigPath := ZConfigPath(dirExeFile);

        Header := THeader.Create(Self);
        Header.Name   := Format('HEADER_DA%d_1', [i]);
        Header.Parent := TabSheet;
        Header.Top    := 12;
        Header.Left   := COMPO_START_LEFT1;  // 416;
        Header.Width  := COMPO_WIDTH;
        Header.Height := 22;
        Header.Sections.Assign(HeaderAD.Sections);

        for j:= 1 to MAX_DACHANNEL do
        begin
            DWDAIO[i,j] := ZPCLDAOut.Create(Self);
            DWDAIO[i,j].Name    := Format('DA%d_%.2d', [i,j]);
            DWDAIO[i,j].Text    := DWDAIO[i, j].Name;
            DWDAIO[i,j].Parent  := TabSheet;
            DWDAIO[i,j].Left    := COMPO_START_LEFT1;
            DWDAIO[i,j].Top     := ((j-1 ) * COMPO_HEIGHT) + COMPO_START_TOP;
            DWDAIO[i,j].Width   := COMPO_WIDTH;
            DWDAIO[i,j].Device  := DWDAdev[i];
            DWDAIO[i,j].PortMin := 1;
            DWDAIO[i,j].PortMax := MAX_DACHANNEL;
            DWDAIO[i,j].PortNo  := j;
            DWDAIO[i,j].VALmin  := 0;
            DWDAIO[i,j].VALmax  := 10;
            DWDAIO[i,j].Show;
        end;
    end;

    //--------------------------------------------------------------------------
    // RO 자원생성.
    for i:= 1 to nROCount do
    begin
        if (i = 1) then
        begin
            // TabSheet를 생성.
            TabSheet := TTabSheet.Create(Self);
            TabSheet.Name := Format('PAGE_RO%d', [i]);
            TabSheet.Caption := 'RO';
            TabSheet.PageControl := Page;

            // Group Box 생성.
            GroupBox := TGroupBox.Create(Self);
            GroupBox.Name   := 'GroupBoxRO';
            GroupBox.Parent := TabSheet;
            GroupBox.Left   := 10;
            GroupBox.top    := 14;
            GroupBox.Width  := 400-8;
            GroupBox.Height := 267;
            GroupBox.Caption := 'RESISTOR OUTPUT';
        end;

        // RO Device를 생성.
        DWROdev[i] := ZDWROdev.Create(Self);
        DWROdev[i].Name := Format('Dev_RO%d', [i]);
        DWROdev[i].ConfigFile := 'IOCONFIG.INI';
        DWROdev[i].ConfigPath := ZConfigPath(dirExeFile);

        // TEST용.
        IniEdit := CreateEdit (GroupBox, Format('Edit_RO%d_Value', [i]), '0', 128,  40 + (i-1)* 32, 64);
        Lb      := CreateLabel(GroupBox, Format('Label_RO%dValue', [i]), Format('RO%d OUTPUT(㏀)', [i]), 25,  IniEdit.Top + 4);

        Btn := TBitBtn.Create(Self);
        Btn.Name    := Format('Btn_RO%d', [i]);
        Btn.Left    := 240;
        Btn.Top     := IniEdit.Top;
        Btn.Parent  := GroupBox;
        Btn.Caption := 'Output';
        Btn.Tag     := i;
        Btn.OnClick := BtnSetResisterClick;
    end;


    //--------------------------------------------------------------------------
    // PO 자원생성.
    for i:= 1 to nPOCount do
    begin
        if (i = 1) then
        begin
            // TabSheet를 생성.
            TabSheet := TTabSheet.Create(Self);
            TabSheet.Name := Format('PAGE_PO%d', [i]);
            TabSheet.Caption := 'PO';
            TabSheet.PageControl := Page;
        end;

        // RO Device를 생성 CommPort
        DWPOdev[i] := TCommPortDriver.Create(Self);
        DWPOdev[i].Name := Format('Dev_PO%d', [i]);
        DWPOdev[i].OnReceiveData := CommReceiveData;
        DWPOdev[i].Tag := i;
        
        // Group Box 생성.
        GroupBox := TGroupBox.Create(Self);
        GroupBox.Name    := Format('GroupBoxPO%d', [i]);
        GroupBox.Parent  := TabSheet;
        GroupBox.Left    := 10 + (i-1) * 400;
        GroupBox.top     := 14;
        GroupBox.Width   := 400-8;
        GroupBox.Height  := 267;
        GroupBox.Caption := Format('PULSE OUTPUT %d', [i]);

        // TEST용.
        Lb := CreateLabel(GroupBox, Format('Label_POFreq%d', [i]), 'FREQ(Hz)', 80,   20);
        Lb := CreateLabel(GroupBox, Format('Label_PODuty%d', [i]), 'DUTY(%)',  160,  20);
        for j := 1 to MAX_POCHANNEL do begin
            Lb      := CreateLabel(GroupBox, Format('Label_POValue%d_%.2d', [i, j]), Format('PO%d_%.2d', [i,j]), 25, 40+(j-1)*30 + 4);
            IniEdit := CreateEdit(GroupBox, Format('Edit_PO%d_%.2d_Freq',   [i, j]), '0', 80,  40+(j-1)*30, 64);
            IniEdit := CreateEdit(GroupBox, Format('Edit_PO%d_%.2d_Duty',   [i, j]), '0', 160, 40+(j-1)*30, 64);

            Btn := TBitBtn.Create(Self);
            Btn.Name    := Format('Btn_PO%d_%.2d', [i, j]);
            Btn.Left    := 240;
            Btn.Top     := IniEdit.Top;
            Btn.Height  := IniEdit.Height;
            Btn.Parent  := GroupBox;
            Btn.Caption := 'Output';
            Btn.Tag     := i*10 + j;
            Btn.OnClick := BtnPOClick;
        end;
    end;


    //==========================================================================
    // Address 설정용 Edit 동적생성.
    for i := 1 to 6 do begin
        case i of
            1 : begin DevStr := 'AD'; nCount := nADCount; end;
            2 : begin DevStr := 'DO'; nCount := nDOCount; end;
            3 : begin DevStr := 'DI'; nCount := nDICount; end;
            4 : begin DevStr := 'DA'; nCount := nDACount; end;
            5 : begin DevStr := 'RO'; nCount := nROCount; end;
            6 : begin DevStr := 'PO'; nCount := nPOCount; end;
        end;

        //
        for j:= 1 to nCount do
        begin
            // Address 설정 Edit Box동적생성.
            IniEdit := CreateEdit(GroupBoxIO, Format('Edit_%s%d', [DevStr, j]), '', i*120 - 60,  40+(j-1)*24, 64);
            IniEdit.Font.Name := 'Courier New';
            IniEdit.IniKey := Format('%s%d_ADDR', [DevStr, j]);
            IniEdit.IniDataSource := INIConfig;
            IniEdit.Enabled := False;
            IniEdit.Tag     := 100;

            Lb := CreateLabel(GroupBoxIO, Format('Label_%s%d', [DevStr, j]), Format('%s%d', [DevStr, j]), IniEdit.Left-32,  IniEdit.Top+4);
        end;
    end;

    Page.ActivePageIndex := 0;
end;

//------------------------------------------------------------------------------
// 자원을 모두 초기화 한다.
procedure TFrmHardware.ResetIO;
var i, j : Integer;
begin
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].Tag <> 0 then continue;
        {
        if (Components[i] is ZPCLdevice) then
        (Components[i] as ZPCLdevice).Initialize ([]);
        }

        if (Components[i] is ZPCLDigOut) then
            ZPCLDigOut(Components[i]).OnOff := false;

        if (Components[i] is ZPCLDAOut) then
            ZPCLDAOut(Components[i]).Value := 0;
    end;

    // PO 초기화;
    for i:= 1 to nPOCount do begin
        for j:= 1 to 4 do begin
            WritePO(i, j, 0, 0);
        end;
    end;
end;

//------------------------------------------------------------------------------
function TFrmHardware.ReadAD(nCard, nChannel : Integer) : Double;
begin
    Result := INVALID_VALUE;
    if (nCard < 1)    or (nCard > nADCount) then exit;
    if (nChannel < 1) or (nChannel > MAX_ADCHANNEL) then exit;

    Result := DWADIO[nCard, nChannel].Value;
end;

function TFrmHardware.ReadDI(nCard, nChannel: Integer): Boolean;
begin
    Result := False;
    if (nCard < 1)    or (nCard    > nDICount) then exit;
    if (nChannel < 1) or (nChannel > MAX_DICHANNEL) then exit;

    Result := DWDIIO[nCard, nChannel].OnOff;
end;

function TFrmHardware.WriteDA(nCard, nChannel: Integer; fValue : Double) : Boolean;
begin
    if (nCard < 1)    or (nCard    > nDACount) then exit;
    if (nChannel < 1) or (nChannel > MAX_DACHANNEL) then exit;

    try
        DWDAIO[nCard, nChannel].DAOutput(fValue);
        Result := True;
    except
    end;
end;

function TFrmHardware.WriteDO(nCard, nChannel: Integer; bOnOff: Boolean) : Boolean;
begin
    Result := False;
    if (nCard < 1)    or (nCard    > nDOCount) then exit;
    if (nChannel < 1) or (nChannel > MAX_DOCHANNEL) then exit;

    try
        DWDOIO[nCard, nChannel].OnOff := bOnOff;
        Result := True;
    except
    end;
end;

//------------------------------------------------------------------------------
// KMI 주파수 보드를 제어
function TFrmHardware.WritePO(nCard, nChannel: Integer; fFreq, fDuty: double) : boolean;
var Val, nPort : Integer;
    Str : string;
begin
    Result := false;

    if not (nCard in [1..MAX_POCARD]) then exit;
    
    if (DWPOdev[nCard].Connected) then
    begin
        Str := Format('CH%d,%d,%d%s', [nChannel, Round(fFreq * 10), 1000 - Round(fDuty * 10), CRLF]);  // Duty가 뒤집혀서 반전함.
        DWPOdev[nCard].SendString(Str);
        Result := True;
    end;
end;

procedure TFrmHardware.CommReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
begin
    // COM
end;


function TFrmHardware.WriteRO(nCard: Integer; fValue: double): boolean;
begin
    Result := False;
    if (nCard < 1)    or (nCard > nROCount) then exit;
    try
        DWROdev[nCard].ResisterOut(fValue);
        Result := True;
    except
    end;
end;


procedure TFrmHardware.FormShow(Sender: TObject);
var
   i: integer;
   compo: TComponent;
begin
//    SetupFormPosition (self); -> 이걸왜하는지..
//    InitializeDeviceAll();

   for i:=0 to ComponentCount-1 do begin
      compo := Components[i];
      if compo is ZPCLDigOut then
         (compo as ZPCLDigOut).OnOff := (compo as ZPCLDigOut).OnOff;
      if compo is ZPCLDAOut then
         (compo as ZPCLDAOut).Value  := (compo as ZPCLDAOut).Value;
   end;
   TimerRead.Enabled := True;
end;


procedure TFrmHardware.PageChange(Sender: TObject);
begin
    TimerReadTimer(Sender);
end;

function TFrmHardware.WriteIOcontrol(ctlname, param : String; tagStr: String = ''): Boolean;
var
    Ctrl : ZIOChannel;
    fValue, fScale, fOffset : Double;
    OptionBuff : TStringList;

    function CheckOn(str : String) : Boolean;
    begin;
        Result := (param = '1') or (param = 'TRUE') or
                  (param = 'T') or (param = 'ON');
    end;
begin
    Ctrl := GetIOcontrol(ctlname);
    if (Ctrl <> nil) then begin
        Result := True;
        //---------------------------
        // DO
        if (Ctrl is ZPCLDigOut) then begin
           (Ctrl as ZPCLDigOut).OnOff := (param = '1') or (param = 'TRUE') or
                                         (param = 'T') or (param = 'ON');
        end else
        //---------------------------
        // DA
        if (Ctrl is ZPCLDAOut) then begin
            fValue := StrToFloatDef (param, 0);

            OptionBuff := TStringList.Create;
            try
                OptionBuff.Text := ReplaceStr(tagStr, ',', CRLF);
                fScale  := StrToFloatDef(OptionBuff.Values['SCALE'],  1);
                fOffset := StrToFloatDef(OptionBuff.Values['OFFSET'], 0);

                fValue := (fValue * fScale) + fOffset;
                (Ctrl as ZPCLDAOut).Value := fValue;
            finally
                OptionBuff.Free;
            end;
        end
        else Result := False;
    end;
end;


function TFrmHardware.ReadIOcontrol(ctlname, param : String; tagStr: String = ''): String;
var Ctrl: ZIOChannel;
    Val: Double;
begin
    Result := 'N/A';
    Ctrl := GetIOcontrol (ctlname);

    //------------------------------------
    if (Ctrl <> nil) then
    begin
        // DO
        if (Ctrl is ZPCLDigOut) then begin
            if (Ctrl as ZPCLDigOut).OnOff then Result := 'TRUE'
            else                               Result := 'FALSE';
        end else
        // DI
        if (Ctrl is ZPCLDigIn) then begin
            if (Ctrl as ZPCLDigIn).OnOff then Result := 'TRUE'
            else                              Result := 'FALSE';
        end else

        // AD
        if (Ctrl is ZPCLADIn) then
        begin
            Val := (Ctrl as ZPCLADIn).Value;
            Result := FloatToStr(Val);
        end;
    end;
end;


procedure TFrmHardware.GetIOcontrolList (Strlist: TStrings; ResType : TResType);
var i: Integer;
    Compo: TComponent;
begin
    Strlist.Clear;
    case ResType of
        res_AO : begin
            for i:=0 to ComponentCount-1 do begin
                Compo := Components[i];
                if (Compo is ZPCLDAOut) then
                    Strlist.Add ((Compo as ZPCLDAOut).Name);
            end;
        end;

        res_DO : begin
            for i:=0 to ComponentCount-1 do begin
                Compo := Components[i];
                if (Compo is ZPCLDigOut) and (Pos('RO', (Compo as ZPCLDigOut).Name)<=0) then
                    Strlist.Add ((Compo as ZPCLDigOut).Name);
            end;
        end;

        res_RO : begin
            Strlist.Add ('DevRO1');
            Strlist.Add ('DevRO2');
            Strlist.Add ('DevRO3');
        end;

        res_PO : begin
            Strlist.Add ('PO1_01');
            Strlist.Add ('PO1_02');
            Strlist.Add ('PO1_03');
            Strlist.Add ('PO1_04');
            Strlist.Add ('PO2_01');
            Strlist.Add ('PO2_02');
            Strlist.Add ('PO2_03');
            Strlist.Add ('PO2_04');
        end;

        res_COMIN : begin
           Strlist.Add ('CANDIAG');
           Strlist.Add ('KLINE');
           Strlist.Add ('TEMP');
           
           for i:= 1 to MAX_DEVCOUNT do Strlist.Add (Format('DEV_%.2d', [i]));
        end;

        res_VRIN : begin // Read
            Strlist.Add ('GRAPH');
        end;

        res_AD : begin
            for i:=0 to ComponentCount-1 do begin
                Compo := Components[i];
                if (Compo is ZPCLADIn) then
                    Strlist.Add ((Compo as ZPCLADIn).Name);
            end;
        end;

        res_DI : begin
            for i:=0 to ComponentCount-1 do begin
                Compo := Components[i];
                if (Compo is ZPCLDigIn) then
                    Strlist.Add ((Compo as ZPCLDigIn).Name);
            end;
        end;

        res_COMOUT : begin
            for i:= 1 to MAX_DEVCOUNT do Strlist.Add (Format('DEV_%.2d', [i]));
            Strlist.Add ('CANDIAG');
            Strlist.Add ('KLINE');
        end;

        res_VROUT : begin  // Write
            Strlist.Add ('RESETIO');
            Strlist.Add ('NISCOPE');
            Strlist.Add ('GRAPH');
        end;

        res_CAN : begin
            Strlist.Add ('CAN1_01');
            Strlist.Add ('CAN2_01');
        end;
    end;
end;

initialization
    OpenIOPortNT;

finalization
    CloseIOPortNT;

end.

