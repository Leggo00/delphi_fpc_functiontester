unit FormMainStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AMLed, ZINICtrl, ExtCtrls, StdCtrls, AdvGlowButton, XiPanel;

type
  TFrmMainStatus = class(TForm)
    ZIniFormPosition1: ZIniFormPosition;
    INI: ZIniData;
    pnMenu: TPanel;
    PNToolBAR: TXiPanel;
    AdvGlowButton3: TAdvGlowButton;
    cmbModelList: TComboBox;
    EditModel: ZIniEdit;
    LED_Ready: TLed;
    LED_Alive: TLed;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LED_Reset: TLed;
    Label4: TLabel;
    Label5: TLabel;
    LED_PLC_READY: TLed;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainStatus: TFrmMainStatus;

implementation

{$R *.dfm}

procedure TFrmMainStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmMainStatus.FormCreate(Sender: TObject);
begin
    INI.LoadData;
end;

procedure TFrmMainStatus.FormDblClick(Sender: TObject);
begin
    Close;
end;

end.
