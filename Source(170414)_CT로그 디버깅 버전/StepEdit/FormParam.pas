unit FormParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZINICtrl, Buttons, ExtCtrls, StdCtrls, GradFill, Spin, ComCtrls,
  DPBLabel, RealSpinEdit;

type
  TFrmParam = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pageParam: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    dpbLabel1: TdpbLabel;
    edtResName: ZIniEdit;
    cmbPowerMeterType: ZIniComboBox;
    cmbPowerSupplyType: ZIniComboBox;
    dpbLabel5: TdpbLabel;
    dpbLabel4: TdpbLabel;
    pagePowerMeter: TPageControl;
    TabSheet8: TTabSheet;
    cmbPowerMeterItems: ZIniComboBox;
    Label2: TLabel;
    dpbLabel10: TdpbLabel;
    edtPowerSupplyCurrent: ZIniRealSpinEdit;
    TabSheet10: TTabSheet;
    cmbRoModel: ZIniComboBox;
    dpbLabel14: TdpbLabel;
    cmbRoTable: ZIniComboBox;
    dpbLabel12: TdpbLabel;
    Label5: TLabel;
    cmbPowerMeterIndex: ZIniComboBox;
    Label8: TLabel;
    cmbPowerMeterOffset: ZIniRealSpinEdit;
    TabSheet22: TTabSheet;
    Label9: TLabel;
    cmbPowerMeteSendMode: ZIniComboBox;
    procedure cmbPowerMeterTypeChange(Sender: TObject);
    procedure cmbRoModelSelect(Sender: TObject);
  private
    { Private declarations }
    procedure ParamTabVisible(aPageControl: TPageControl; nIndex: integer);
  public
    { Public declarations }
    function Execute(var sResName: string; sIoName, sParam: string): string;
  end;

var
  FrmParam: TFrmParam;

implementation

uses
    GenUtils, FormHWMain, FormSensorModel, FormSensorTable, FormResource,
  FormSelInput;

{$R *.dfm}

procedure TFrmParam.ParamTabVisible(aPageControl: TPageControl; nIndex: integer);
var
    i: integer;
begin
    with aPageControl do
    begin
        for i := 0 to PageCount - 1 do
        begin
            if nIndex = i then
                Pages[i].TabVisible := True
            else
                Pages[i].TabVisible := False;  
        end;
    end;
end;

function TFrmParam.Execute(var sResName: string; sIoName, sParam: string): string;
var
    sResult, sBuffer, sItems, sTemp: string;
    i: integer;
    bResourceOk: boolean;
begin      {
    Result          := '';
    sIoName         := UpperCase(sIoName);
    edtResName.Text := Trim(sResName);
    sBuffer         := sParam;
    bResourceOk     := True;

    if sIoName = POWER_SUPPLY_SEND then
    begin
        ParamTabVisible(pageParam, 1);

        cmbPowerSupplyType.ItemIndex := StrToIntDef( GetToKen(sParam, ','), -1 );
        edtPowerSupplyCurrent.Value  := StrToFloatDef( GetToKen(sParam, ','), 0 );
    end
    else if sIoName = POWER_METER_READ then
    begin
        ParamTabVisible(pageParam,      2);
        ParamTabVisible(pagePowerMeter, 0);

        cmbPowerMeterType.ItemIndex  := StrToIntDef( GetToKen(sParam, ','), -1 );
        cmbPowerMeterType.OnChange(nil);
        cmbPowerMeterItems.ItemIndex := StrToIntDef( GetToKen(sParam, ','), -1 );
        cmbPowerMeterIndex.ItemIndex := StrToIntDef( GetToKen(sParam, ','), -1 );
        cmbPowerMeterOffset.Value    := StrToFloatDef( GetToKen(sParam, ','), 0 );
    end
    else if sIoName = POWER_METER_SEND then
    begin
        ParamTabVisible(pageParam,      2);
        ParamTabVisible(pagePowerMeter, 1);

        cmbPowerMeterType.ItemIndex    := StrToIntDef( GetToKen(sParam, ','), -1 );
        cmbPowerMeteSendMode.ItemIndex := StrToIntDef( GetToKen(sParam, ','), -1 );
    end
    else
        bResourceOk := False;

    if not bResourceOk then
    begin  // 파라메타 편집에 없는 자원
        Result := sBuffer;
        exit;
    end;

    // 확인이후 인수 정리.
    if ShowModal = mrOK then
    begin
        if sIoName = POWER_SUPPLY_SEND then
            sResult := Format('%d,%.1f', [ cmbPowerSupplyType.ItemIndex, edtPowerSupplyCurrent.Value ])
        else if sIoName = POWER_METER_READ then
            sResult := Format('%d,%d,%d,%.1f', [ cmbPowerMeterType.ItemIndex, cmbPowerMeterItems.ItemIndex, cmbPowerMeterIndex.ItemIndex,  cmbPowerMeterOffset.Value ])
        else if sIoName = POWER_METER_SEND then
            sResult := Format('%d,%d', [ cmbPowerMeterType.ItemIndex, cmbPowerMeteSendMode.ItemIndex ])
        else
        sResName := Trim( edtResName.Text );

        Result := sResult;
    end else
        Result := sBuffer;   }
end;

procedure TFrmParam.cmbPowerMeterTypeChange(Sender: TObject);
var
    i: integer;
begin    {
    cmbPowerMeterItems.Items.Clear;

    case cmbPowerMeterType.ItemIndex of
        0: for i := Low(WT230_ITEMS) to High(WT230_ITEMS) do
               cmbPowerMeterItems.Items.Add( WT230_ITEMS[i] );
        1, 2: for i := Low(WT3000_ITEMS) to High(WT3000_ITEMS) do
               cmbPowerMeterItems.Items.Add( WT3000_ITEMS[i] );
    end;  }
end;

procedure TFrmParam.cmbRoModelSelect(Sender: TObject);
begin
    SelectModel(cmbRoModel, cmbRoTable);
end;

end.
