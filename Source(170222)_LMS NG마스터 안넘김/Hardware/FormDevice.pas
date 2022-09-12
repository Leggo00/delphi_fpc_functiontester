//------------------------------------------------------------------------------
// �ֺ���ġ�� �����ϴ� Form.
// �̰����� �������� Form�� �����ϰ� �����Ѵ�....
//------------------------------------------------------------------------------
unit FormDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Global;

const
    MAX_DEVCOUNT = 10;
    TempDevNo = 2;
type
  //----------------------------------------------------------------------------
  // ��Ű��õ� �ܺ� ��ġ���� �����ϱ� ���� Ŭ����..
  TDeviceManager = class
  public
    DevFormList : array[1..MAX_DEVCOUNT] of TForm;
    procedure DeviceMenuClick(Sender: TObject);
  public
    constructor Create;
    destructor  Destroy; override;

    procedure CreateDeviceMenu(ParentMenu : TMenuItem);
    procedure CloseAllDevice;

    function  WriteDevice(ResourceItem : TResourceItem; Param : String) : String;
    function  ReadDevice(ResourceItem : TResourceItem;  Param : String) : String;
  end;

  //----------------------------------------------------------------------------
  TFrmDevice = class(TForm)
  protected
    //
  private
    { Private declarations }
  public
    { Public declarations }
    // �ֺ���ġ ����� ��ƾ..
    function DevOpen(Param : String) : Integer; virtual;
    function DevClose(Param : String): Integer; virtual;
    function DevInit(Param : String) : Integer; virtual;

    function DevSend(Param : String) : Integer; virtual;
    function DevRead(Param : String) : String;  virtual;
    function DevFileOpen(Param: String): boolean; virtual;
  end;


var
  DeviceManager : TDeviceManager;

  FrmDevice: TFrmDevice;

implementation

uses FormCANCom, FormFC100, Form7555, FormSorensen, FormXantrex, GenUtils,
  FormCANEmul, FormWT330, ZINICtrl, FormTempSensor,  FormPWM, FormKMISent, FormMBCOPWM,
  FormLN300AG6, FormTDKLambda;

{$R *.dfm}

//------------------------------------------------------------------------------
function TDeviceManager.WriteDevice(ResourceItem : TResourceItem; Param : String) : String;
var Idx : Integer;
    Str, RdStr : String;
begin
    Result := 'N/A';

    RdStr := ResourceItem.IOName; // DEV_01;
    Str := GetToken(RdStr, '_');
    if Str <> 'DEV' then exit;
    
    Idx := StrToIntDef(RdStr, -1);
    if (not (Idx in [1..MAX_DEVCOUNT])) or (not Assigned(DevFormList[Idx])) then exit;

    // ������ �ڿ�..
    if ResourceItem.tagStr = '' then RdStr := Param
                                else RdStr := ResourceItem.tagstr;

    // �����⿡ �޼����� �����Ѵ�.
    while (RdStr <> '') do begin
        Str := GetTokenTrim(RdStr, '|');
        Str := ReplaceStr(Str, '%PARAM%', Param);

        try                                      
            if (Idx = 6) then Idx := 8;
            TFrmDevice(DevFormList[Idx]).DevSend(Str);       // 7555 DMM
        except
        end;
    end;
    Result := 'TRUE';
end;

//------------------------------------------------------------------------------
function TDeviceManager.ReadDevice(ResourceItem : TResourceItem;  Param : String) : String;
var Idx : Integer;
    Str, RdStr : String;
begin
    Result := 'N/A';

    RdStr := ResourceItem.IOName; // DEV_01;
    Str := GetToken(RdStr, '_');
    if Str <> 'DEV' then exit;

    Idx := StrToIntDef(RdStr, -1);
    if (not (Idx in [1..MAX_DEVCOUNT])) or (not Assigned(DevFormList[Idx])) then exit;

    // ������ �ڿ�..
    if ResourceItem.tagStr = '' then RdStr := Param
                                else RdStr := ResourceItem.tagstr;

    try
        if (Idx = 6) then Idx := 8;
        Result := TFrmDevice(DevFormList[Idx]).DevRead(RdStr);
    except
    end;
end;

{ TDeviceManager }
//------------------------------------------------------------------------------
constructor TDeviceManager.Create;
var i : Integer;
begin
    // �̰��� ���� Device �׸���� �Է��ϰ� ���������Ѵ�.
    for i:= 1 to MAX_DEVCOUNT do begin
        case i of
        1: begin
            DevFormList[i] := TFrmTDKLamda.Create(Application.MainForm);
        end;
        2: begin
            DevFormList[i] := TFrmTempSensor.Create(Application.MainForm);
            //TempDevNo = 2;
        end;
        3: DevFormList[i] := TFrmCANEmul.Create(Application.MainForm);
        4: DevFormList[i] := TFrmLN300AG6.Create(Application.MainForm);
        else
            DevFormList[i] := nil;
        end;
    end;
end;
//------------------------------------------------------------------------------
destructor TDeviceManager.Destroy;
var Idx : Integer;
begin
    // ȭ�鿡 ������ Device Form���� �޸� �����Ѵ�.
    for Idx := MAX_DEVCOUNT downto 1 do begin
        try
            if Assigned( DevFormList[Idx] ) then
                DevFormList[Idx].Free;
        except
        end;
    end;

    inherited;
end;

//------------------------------------------------------------------------------
// ���������� ��ġ���� �޴��� �����Ѵ�.
procedure TDeviceManager.CreateDeviceMenu(ParentMenu: TMenuItem);
var i : Integer;
    MenuItem : TMenuItem;
begin
    if (ParentMenu = nil) then exit;

    ParentMenu.Clear;
    for i:= 1 to MAX_DEVCOUNT do
    begin
        if (DevFormList[i] <> nil) then
        begin
            MenuItem := TMenuItem.Create(Application.MainForm);
            MenuItem.Tag := i;
            MenuItem.Caption := Format('DEV%.2d : %s', [i, DevFormList[i].Caption]);
            MenuItem.OnClick := DeviceMenuClick;
            ParentMenu.Add(MenuItem);
        end;
    end;
end;

//------------------------------------------------------------------------------
// ���������� ��ġ���� �޴��� ���õǾ�����..
procedure TDeviceManager.DeviceMenuClick(Sender: TObject);
var Idx : Integer;
begin
    Idx := (Sender as TMenuItem).Tag;
    if Idx < 1 then exit;

    try
        if Assigned( DevFormList[Idx] ) then
//            DevFormList[Idx].ShowModal;
            DevFormList[Idx].Show;
    except
    end;
end;

//------------------------------------------------------------------------------
// ���������� ��ġ���� ��� Close�Ѵ�.
procedure TDeviceManager.CloseAllDevice;
var Idx : Integer;
begin
    // ȭ�鿡 ������ Device Form���� �����Ѵ�.
    try
        for Idx := 1 to MAX_DEVCOUNT do begin
            if Assigned( DevFormList[Idx] ) then
                if DevFormList[Idx].Visible then DevFormList[Idx].Close;
        end;
    except
    end;
end;

//==============================================================================
{ TFrmDevice }

function TFrmDevice.DevOpen(Param: String): Integer;   begin end;
function TFrmDevice.DevClose(Param: String): Integer;  begin end;
function TFrmDevice.DevInit(Param: String): Integer;   begin end;
function TFrmDevice.DevRead(Param: String): String;    begin end;
function TFrmDevice.DevSend(Param: String): Integer;   begin end;
function TFrmDevice.DevFileOpen(Param: String): boolean;   begin end;

initialization
    DeviceManager := TDeviceManager.Create;

finalization
    DeviceManager.Free;

end.
