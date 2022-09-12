unit FormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls, Menus, ZINICtrl,
  AdvOfficePager, AdvToolBar, AdvMenus, AdvToolBarStylers, AdvSmoothGauge,
  AdvAppStyler, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvMenuStylers,
  AdvGlowButton, AdvOfficeSelectors, AdvSmoothButton,
  DsnSubMl, DsnSubGr, DsnSubDp, DsnProp, DsnUnit, DsnSpctr, DsnPanel, TypInfo,
  ExtDlgs, ImgList, ActnList, Grids, TeEngine, Series, TeeProcs, Chart, TeeEdit,
  Math, VrControls, VrLcd, Magnetic, DPBLabel,
  VrMatrix, XiButton, AMLed, Spin, AdvTrackBar, VrButtons, VrSwitch,
  RealSpinEdit;

type
  TPlayStatus = (psNone, psPreRun, psRun, psPause, psStop, psInitial);

  TAlignControl = (acTop, acBottom, acLeft, acRight, acCenter, acMiddle,
                   acHorizontal, acVertical, acCenterHorizontal, acCenterVertical);

  TFrmDesigner = class(TForm)
    pnlToolBar: TAdvDockPanel;
    AdvToolBar1: TAdvToolBar;
    DsnPanel: TDsnPanel;
    AdvToolBar2: TAdvToolBar;
    DsnSwitch: TDsnSwitch;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    ArrowButton: TArrowButton;
    btnLabel: TDsnButton;
    btnEdit: TDsnButton;
    DsnDpRegister: TDsnDpRegister;
    DsnStage: TDsnStage;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    StatusBar: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler: TAdvOfficeStatusBarOfficeStyler;
    AdvFormStyler: TAdvFormStyler;
    AdvAppStyler: TAdvAppStyler;
    AdvMainMenu: TAdvMainMenu;
    AdvMenuOfficeStyler: TAdvMenuOfficeStyler;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    DsnDpstPanel: TPanel;
    Dpst_TLabel: TLabel;
    Dpst_TEdit: TEdit;
    AdvToolBar4: TAdvToolBar;
    ImageList: TImageList;
    btnNew: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    btnOpen: TAdvToolBarButton;
    btnClose: TAdvToolBarButton;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    ActionList: TActionList;
    actOpen: TAction;
    actClose: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actNew: TAction;
    OpenPictureDialog: TOpenPictureDialog;
    mnuEdit: TMenuItem;
    mnuPaste: TMenuItem;
    mnuCopy: TMenuItem;
    actCopy: TAction;
    actPaste: TAction;
    AdvToolBar3: TAdvToolBar;
    AdvToolBarButton6: TAdvToolBarButton;
    AdvToolBarButton7: TAdvToolBarButton;
    actCut: TAction;
    AdvToolBarButton1: TAdvToolBarButton;
    mnuCut: TMenuItem;
    mnuBringToFront: TMenuItem;
    Dpst_TPanel: TPanel;
    btnPanel: TDsnButton;
    mnuDesign: TMenuItem;
    mnuDesignMode: TMenuItem;
    actDesignMode: TAction;
    mnuFile: TMenuItem;
    mnuNew: TMenuItem;
    mnuOpen: TMenuItem;
    mnuSpace2: TMenuItem;
    mnuSaveAs: TMenuItem;
    mnuSave: TMenuItem;
    mnuSpace3: TMenuItem;
    mnuExit: TMenuItem;
    actDelete: TAction;
    mnuDelete: TMenuItem;
    AdvPopupMenu: TAdvPopupMenu;
    mnuControl1: TMenuItem;
    mnuSendToBack1: TMenuItem;
    mnuBringToFront1: TMenuItem;
    actBringToFront: TAction;
    actSendToBack: TAction;
    mnuSendToBack: TMenuItem;
    mnuEdit1: TMenuItem;
    mnuCopy1: TMenuItem;
    mnuCut1: TMenuItem;
    mnuDelete1: TMenuItem;
    mnuPaste1: TMenuItem;
    Dpst_TChart: TChart;
    DsnButton1: TDsnButton;
    ChartEditor: TChartEditor;
    Series1: TFastLineSeries;
    actAlignBottom: TAction;
    actAlignLeft: TAction;
    actAlignRight: TAction;
    actAlignTop: TAction;
    AdvToolBar5: TAdvToolBar;
    AdvToolBarButton10: TAdvToolBarButton;
    AdvToolBarButton12: TAdvToolBarButton;
    AdvToolBarButton13: TAdvToolBarButton;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarButton14: TAdvToolBarButton;
    AdvToolBarButton15: TAdvToolBarButton;
    mnuAlign: TMenuItem;
    mnuSpace1: TMenuItem;
    mnuAlignLeft: TMenuItem;
    mnuAlignRight: TMenuItem;
    mnuAlignBottom: TMenuItem;
    mnuAlignTop: TMenuItem;
    mnuAlign1: TMenuItem;
    mnuAlignBottom1: TMenuItem;
    mnuAlignLeft1: TMenuItem;
    mnuAlignRight1: TMenuItem;
    mnuAlignTop1: TMenuItem;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarButton5: TAdvToolBarButton;
    actAlignCenter: TAction;
    actAlignMiddle: TAction;
    mnuAlignCenter: TMenuItem;
    mnuAlignMiddle: TMenuItem;
    mnuAlignCenter1: TMenuItem;
    mnuAlignMiddle1: TMenuItem;
    AdvToolBarButton9: TAdvToolBarButton;
    Dpst_TImage: TImage;
    DsnButton2: TDsnButton;
    actOption: TAction;
    mnuOption: TMenuItem;
    N2: TMenuItem;
    AdvToolBarButton8: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    actVertical: TAction;
    actHorizontal: TAction;
    btnHorizontal: TAdvToolBarButton;
    AdvToolBarButton17: TAdvToolBarButton;
    mnuHorizontal: TMenuItem;
    mnuVertical: TMenuItem;
    mnuHorizontal1: TMenuItem;
    mnuVertical1: TMenuItem;
    DsnInspector: TDsnInspector;
    actAbout: TAction;
    N1: TMenuItem;
    N3: TMenuItem;
    actCenterHorizontal: TAction;
    actCenterVertical: TAction;
    btnCenterVertical: TAdvToolBarButton;
    btnVertical: TAdvToolBarButton;
    btnCenterHorizontal: TAdvToolBarButton;
    mnuCenterHorizontal: TMenuItem;
    mnuCenterVertical: TMenuItem;
    mnuCenterHorizontal1: TMenuItem;
    mnuCenterVertical1: TMenuItem;
    AdvToolBar6: TAdvToolBar;
    actMenuShow: TAction;
    actMenuHide: TAction;
    AdvToolBarButton11: TAdvToolBarButton;
    mnuMenu1: TMenuItem;
    mnuMenuShow1: TMenuItem;
    mnuMenuHide1: TMenuItem;
    Dpst_TVrMatrix: TVrMatrix;
    DsnButton4: TDsnButton;
    pnlPlay: TAdvDockPanel;
    AdvToolBar9: TAdvToolBar;
    btnStart: TAdvToolBarButton;
    btnStop: TAdvToolBarButton;
    actStart: TAction;
    actStop: TAction;
    actPause: TAction;
    btnPause: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    btnMenuShow: TAdvToolBarButton;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    lblStatus: TdpbLabel;
    Dpst_TAdvSmoothGauge: TAdvSmoothGauge;
    DsnButton3: TDsnButton;
    Dpst_TXiButton: TXiButton;
    DsnButton5: TDsnButton;
    Dpst_TLed: TLed;
    DsnButton6: TDsnButton;
    DsnButton7: TDsnButton;
    Dpst_TAdvTrackBar: TAdvTrackBar;
    DsnButton8: TDsnButton;
    Dpst_TVrPowerButton: TVrPowerButton;
    DsnButton9: TDsnButton;
    Dpst_TVrSwitch: TVrSwitch;
    DsnButton10: TDsnButton;
    Dpst_ZIniRealSpinEdit: ZIniRealSpinEdit;
    DsnButton11: TDsnButton;
    Dpst_ZIniSpinEdit: ZIniSpinEdit;
    TimerScan: TTimer;
    TimerRead: TTimer;
    procedure DsnInspectorBtnClick(Sender: TObject;
      Targets: TSelectedComponents; PropName: String; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actDesignModeExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actBringToFrontExecute(Sender: TObject);
    procedure actSendToBackExecute(Sender: TObject);
    procedure actAlignLeftExecute(Sender: TObject);
    procedure actAlignRightExecute(Sender: TObject);
    procedure actAlignTopExecute(Sender: TObject);
    procedure actAlignBottomExecute(Sender: TObject);
    procedure actAlignCenterExecute(Sender: TObject);
    procedure actAlignMiddleExecute(Sender: TObject);
    procedure actOptionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actHorizontalExecute(Sender: TObject);
    procedure actVerticalExecute(Sender: TObject);
    procedure DsnSwitchMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actAboutExecute(Sender: TObject);
    procedure actCenterHorizontalExecute(Sender: TObject);
    procedure actCenterVerticalExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsnStageDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure actMenuShowExecute(Sender: TObject);
    procedure actMenuHideExecute(Sender: TObject);
    procedure DsnSwitchClick(Sender: TObject);
    procedure actStartExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure actPauseExecute(Sender: TObject);
    procedure Dpst_TEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerScanTimer(Sender: TObject);
    procedure Dpst_TVrPowerButtonClick(Sender: TObject);
    procedure TimerReadTimer(Sender: TObject);
  private
    { Private declarations }
//    MagneticWndProc : TSubClass_Proc;
//    dummyHandled : boolean;
    gPlayStatus: TPlayStatus;
    gThreadList: TThreadList;

    procedure SetOrderControl(bOnOff: boolean);
    procedure SetAlignControl(aAlignControl: TAlignControl);

    procedure WriteCommand(Sender: TObject);
  public
    { Public declarations }
    procedure OpenFile(sFileName: string);
    procedure InitialControl();
{
    procedure WMEnterSizeMove(var Msg: TMessage); message WM_ENTERSIZEMOVE;
    procedure WMSizing(var Msg: TMessage); message WM_SIZING;
    procedure WMMoving(var Msg: TMessage); message WM_MOVING;
    procedure WMExitSizeMove(var Msg: TMessage); message WM_EXITSIZEMOVE;
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure WMCommand(var Msg: TMessage); message WM_COMMAND;
}
  end;

var
  FrmDesigner: TFrmDesigner;

implementation

uses
    GenUtils, FormResource, FormOption, FormAbout, Global, FormHwTest,
  FormResEdit, FormChartParam, UnitThreadDisplay, UnitThreadChart,
  FormMain;

{$R *.dfm}

//---------------------- Custom Message Handling procedures ----------------------
// These procedures shold be placed per every forms which we want to give magnetic
//  effect.

{
procedure TFrmDesigner.WMEnterSizeMove(var Msg: TMessage);
begin
   inherited;

   if Assigned(MagneticWndProc) then
      MagneticWndProc(Self.Handle, WM_ENTERSIZEMOVE, Msg, dummyHandled);
end;

procedure TFrmDesigner.WMSizing(var Msg: TMessage);
var
   bHandled: Boolean;
begin
   if not Assigned(MagneticWndProc) then
      inherited
   else
      if MagneticWndProc(Self.Handle, WM_SIZING, Msg, bHandled) then
         if not bHandled then
            inherited;
end;

procedure TFrmDesigner.WMMoving(var Msg: TMessage);
var
   bHandled: Boolean;
begin
   if not Assigned(MagneticWndProc) then
      inherited
   else
      if MagneticWndProc(Self.Handle, WM_MOVING, Msg, bHandled) then
         if not bHandled then
            inherited;
end;

procedure TFrmDesigner.WMExitSizeMove(var Msg: TMessage);
begin
   inherited;

   if Assigned(MagneticWndProc) then
      MagneticWndProc(Self.Handle, WM_EXITSIZEMOVE, Msg, dummyHandled);
end;

procedure TFrmDesigner.WMSysCommand(var Msg: TMessage);
begin
   inherited;

   if Assigned(MagneticWndProc) then
      MagneticWndProc(Self.Handle, WM_SYSCOMMAND, Msg, dummyHandled);
end;

procedure TFrmDesigner.WMCommand(var Msg: TMessage);
begin
   inherited;

   if Assigned(MagneticWndProc) then
      MagneticWndProc(Self.Handle, WM_COMMAND, Msg, dummyHandled);
end;
}
//------------------- end of Custom Message Handling procedures -----------------
procedure TFrmDesigner.FormDestroy(Sender: TObject);
begin
    gThreadList.Free;
//    MagneticWnd.Free;
end;

procedure DisplayPlayStatus(aLabel: TdpbLabel; aPlayStatus: TPlayStatus);
begin
    with aLabel do
    begin
        case aPlayStatus of
            psNone : begin
                Color   := clBlack;
                Caption := 'NONE';
            end;
            psRun : begin
                Color   := clLime;
                Caption := 'RUN';
            end;
            psPause : begin
                Color   := clYellow;
                Caption := 'PAUSE';
            end;
            psStop : begin
                Color   := clRed;
                Caption := 'STOP';
            end;
            psInitial : begin
                Color   := clBlue;
                Caption := 'INITIAL';
            end;
        end;
    end;
end;    

procedure TFrmDesigner.FormCreate(Sender: TObject);
begin
    MagneticWnd := TMagnetic.Create;
    DsnStage.Align := alClient;

    gThreadList := TThreadList.Create;
end;

procedure TFrmDesigner.actOpenExecute(Sender: TObject);
begin
    OpenDialog.InitialDir := gBaseDir + 'SIMULATOR\'; // GetAppDir('Simulator');
    if OpenDialog.Execute then
    begin
        DsnStage.LoadFromFile(OpenDialog.FileName);
        StatusBar.Panels[0].Text := OpenDialog.FileName;
        Caption := ExtractFileName( OpenDialog.FileName );
    end;
end;

procedure TFrmDesigner.actSaveAsExecute(Sender: TObject);
begin
    if DsnStage.ControlCount <= 0 then exit;

    SaveDialog.InitialDir := gBaseDir + 'SIMULATOR\'; // GetAppDir('Simulator');
    if SaveDialog.Execute then
    begin
        DsnStage.SaveToFile(SaveDialog.FileName);
        StatusBar.Panels[0].Text := SaveDialog.FileName;
        Caption := ExtractFileName(SaveDialog.FileName);
    end;
end;

procedure TFrmDesigner.actSaveExecute(Sender: TObject);
var
    sFileName: string;
begin
    if DsnStage.ControlCount <= 0 then exit;

    sFileName := StatusBar.Panels[0].Text;
    if FileExists( sFileName ) then
        DsnStage.SaveToFile( sFileName )
    else
        mnuSaveAs.Click;
end;

procedure TFrmDesigner.actCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TFrmDesigner.actNewExecute(Sender: TObject);
var
    i: integer;
begin
    for i := DsnStage.ControlCount - 1 downto 0 do
        DsnStage.Controls[i].Destroy;

    StatusBar.Panels[0].Text := '';
end;


procedure TFrmDesigner.actPasteExecute(Sender: TObject);
begin
    DsnStage.Paste;
end;

procedure TFrmDesigner.actCopyExecute(Sender: TObject);
begin
    DsnStage.Copy;
end;

procedure TFrmDesigner.actCutExecute(Sender: TObject);
begin
    DsnStage.Cut;
end;

procedure TFrmDesigner.actDeleteExecute(Sender: TObject);
begin
    DsnStage.Delete;
end;

procedure TFrmDesigner.actDesignModeExecute(Sender: TObject);
begin
    actDesignMode.Checked := not actDesignMode.Checked;
    if actDesignMode.Checked then
        DsnSwitch.DesignOn
    else
        DsnSwitch.DesignOff;
end;

procedure TFrmDesigner.SetOrderControl(bOnOff: boolean);
var
    i: integer;
begin
    for i := 0 to DsnStage.TargetsCount - 1 do
    begin
        if bOnOff then
            DsnStage.Targets[i].BringToFront
        else
            DsnStage.Targets[i].SendToBack;
    end;
end;

procedure TFrmDesigner.actBringToFrontExecute(Sender: TObject);
begin
    SetOrderControl(True);
end;

procedure TFrmDesigner.actSendToBackExecute(Sender: TObject);
begin
    SetOrderControl(False);
end;

procedure TFrmDesigner.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    i: integer;
begin
    with DsnStage do
    begin
        if (Shift = [ssShift]) then
        begin
            case Key of
                VK_DOWN : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Height := Targets[i].Height + 1;
                end;
                VK_UP : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Height := Targets[i].Height - 1;
                end;
                VK_LEFT : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Width := Targets[i].Width - 1;
                end;
                VK_RIGHT : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Width := Targets[i].Width + 1;
                end;
            end;
        end
        else if (Shift = [ssCtrl]) then
        begin
            case Key of
                VK_DOWN : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Top := Targets[i].Top + 1;
                end;
                VK_UP : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Top := Targets[i].Top - 1;
                end;
                VK_LEFT : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Left := Targets[i].Left - 1;
                end;
                VK_RIGHT : begin
                    for i := 0 to DsnStage.TargetsCount - 1 do
                        Targets[i].Left := Targets[i].Left + 1;
                end;
            end;
        end;

        UpdateControl;
    end;
end;

procedure TFrmDesigner.SetAlignControl(aAlignControl: TAlignControl);
var
    i: integer;
    nSetValue, nIndex, nCenter : integer;
    nMax, nMin: integer;
    aStringList: TStringList;
    sIndex: string;
begin
    with DsnStage do
    begin
        nMax := -9999;
        nMin := 9999;

        aStringList := TStringList.Create;

        for i := 0 to DsnStage.TargetsCount - 1 do
        begin
            if i = 0 then
            begin
                case aAlignControl of
                    acTop    : nSetValue := Targets[i].Top;
                    acBottom : nSetValue := Targets[i].Top  + Targets[i].Height;
                    acMiddle : nSetValue := Targets[i].Top  + (Targets[i].Height div 2);
                    acLeft   : nSetValue := Targets[i].Left;
                    acRight  : nSetValue := Targets[i].Left + Targets[i].Width;
                    acCenter : nSetValue := Targets[i].Left + (Targets[i].Width div 2);
                end;
            end
            else begin
                case aAlignControl of
                    acTop    : Targets[i].Top  := nSetValue;
                    acBottom : Targets[i].Top  := nSetValue - Targets[i].Height;
                    acMiddle : Targets[i].Top  := nSetValue - (Targets[i].Height div 2);
                    acLeft   : Targets[i].Left := nSetValue;
                    acRight  : Targets[i].Left := nSetValue - Targets[i].Width;
                    acCenter : Targets[i].Left := nSetValue - (Targets[i].Width div 2);
                end;
            end; // if i = 0 then

            case aAlignControl of
                acHorizontal : begin
                    nMax := Max(nMax, Targets[i].Left);
                    nMin := Min(nMin, Targets[i].Left);
                    aStringList.Add( Format('%.4d=%.4d', [Targets[i].Left, i]) );
                end;
                acVertical : begin
                    nMax := Max(nMax, Targets[i].Top);
                    nMin := Min(nMin, Targets[i].Top);
                    aStringList.Add( Format('%.4d=%.4d', [Targets[i].Top, i]) );
                end;
                acCenterHorizontal : begin
                    nMax := Max(nMax, Targets[i].Left + Targets[i].Width);
                    nMin := Min(nMin, Targets[i].Left);
                    nCenter := DsnStage.Width div 2;
                    aStringList.Add( Format('%.4d=%.4d', [Targets[i].Left, i]) );
                end;
                acCenterVertical : begin
                    nMax := Max(nMax, Targets[i].Top + Targets[i].Height);
                    nMin := Min(nMin, Targets[i].Top);
                    nCenter := DsnStage.Height div 2;
                    aStringList.Add( Format('%.4d=%.4d', [Targets[i].Top, i]) );
                end;
            end; // case aAlignControl of
        end; // for i := 0 to DsnStage.TargetsCount - 1 do

        //  acHorizontal, acVertical, acCenterHorizontal, acCenterVertical
        if aStringList.Count > 0 then
        begin
            case aAlignControl of
                acHorizontal, acVertical : begin
                    nSetValue := Round( (nMax - nMin) / (DsnStage.TargetsCount - 1) );
                    aStringList.Sort;

                    // 최소값과 최대값은 제외
                    for i := 1 to aStringList.Count - 2 do
                    begin
                        sIndex := aStringList[i];
                        GetToken(sIndex, '=');
                        nIndex := StrToIntDef( sIndex, 0 );

                        if aAlignControl = acHorizontal then
                            Targets[nIndex].Left := nMin + (nSetValue * i);

                        if aAlignControl = acVertical then
                            Targets[nIndex].Top := nMin + (nSetValue * i);
                    end;
                end;
                acCenterHorizontal, acCenterVertical : begin
                    nSetValue := nCenter - Round( (nMax + nMin) / 2 );

                    for i := 0 to aStringList.Count - 1 do
                    begin
                        sIndex := aStringList[i];
                        GetToken(sIndex, '=');
                        nIndex := StrToIntDef( sIndex, 0 );

                        if aAlignControl = acCenterHorizontal then
                            Targets[nIndex].Left := Targets[nIndex].Left + nSetValue;

                        if aAlignControl = acCenterVertical then
                            Targets[nIndex].Top := Targets[nIndex].Top + nSetValue;
                    end; 
                end;
            end; // case aAlignControl of
        end;
        
        aStringList.Free;
    end; // with DsnStage do
end;

procedure TFrmDesigner.actAlignLeftExecute(Sender: TObject);
begin
    SetAlignControl(acLeft);
end;

procedure TFrmDesigner.actAlignRightExecute(Sender: TObject);
begin
    SetAlignControl(acRight);
end;

procedure TFrmDesigner.actAlignTopExecute(Sender: TObject);
begin
    SetAlignControl(acTop);
end;

procedure TFrmDesigner.actAlignBottomExecute(Sender: TObject);
begin
    SetAlignControl(acBottom);
end;

procedure TFrmDesigner.actAlignCenterExecute(Sender: TObject);
begin
    SetAlignControl(acCenter);
end;

procedure TFrmDesigner.actAlignMiddleExecute(Sender: TObject);
begin
    SetAlignControl(acMiddle);
end;

procedure TFrmDesigner.actHorizontalExecute(Sender: TObject);
begin
    SetAlignControl(acHorizontal);
end;

procedure TFrmDesigner.actVerticalExecute(Sender: TObject);
begin
    SetAlignControl(acVertical);
end;

procedure TFrmDesigner.actCenterHorizontalExecute(Sender: TObject);
begin
    SetAlignControl(acCenterHorizontal);
end;

procedure TFrmDesigner.actCenterVerticalExecute(Sender: TObject);
begin
    SetAlignControl(acCenterVertical);
end;

procedure TFrmDesigner.actAboutExecute(Sender: TObject);
begin
    FrmAbout.ShowModal;
end;

procedure TFrmDesigner.actOptionExecute(Sender: TObject);
begin
    FrmOption.GetOptionValue;

    FrmOption.ShowModal;

    FrmOption.SetOptionValue;
end;

procedure DisplayValue(aComponent: TComponent; sValue: string);
begin
    if (aComponent is TLabel) then
        (aComponent as TLabel).Caption := sValue
    else if (aComponent is TPanel) then
        (aComponent as TPanel).Caption := sValue
    else if (aComponent is TVrMatrix) then
        (aComponent as TVrMatrix).Text := sValue
    else if (aComponent is TXiButton) then
        (aComponent as TXiButton).Caption := sValue
    else if (aComponent is TVrPowerButton) then
        (aComponent as TVrPowerButton).Caption := sValue
    else if (aComponent is TAdvSmoothGauge) then
        (aComponent as TAdvSmoothGauge).Value := StrToFloatDef(sValue, 0)
    else if (aComponent is TLed) then
        (aComponent as TLed).LedOn := (Uppercase(sValue) = 'TRUE') or
                                      (Uppercase(sValue) = 'ON') or
                                      (Uppercase(sValue) = '1');
end;

procedure TFrmDesigner.InitialControl();

    procedure SetDefaultValue(aComponent: TComponent);
    begin
        if (aComponent is ZIniSpinEdit) then
            (aComponent as ZIniSpinEdit).Value := (aComponent as ZIniSpinEdit).MinValue
        else if (aComponent is ZIniRealSpinEdit) then
            (aComponent as ZIniRealSpinEdit).Value := (aComponent as ZIniRealSpinEdit).MinValue
        else if (aComponent is TVrPowerButton) then
            (aComponent as TVrPowerButton).Active := False
        else if (aComponent is TAdvTrackBar) then
            (aComponent as TAdvTrackBar).Position := (aComponent as TAdvTrackBar).Min
        else if (aComponent is TEdit) then
            (aComponent as TEdit).Text := ''
        else if (aComponent is TVrSwitch) then
            (aComponent as TVrSwitch).Offset := 0
    end;

var
    i, j: integer;
begin
    if not DsnSwitch.Down then
    begin
        for i := 0 to DsnStage.ControlCount - 1 do
        begin
            if (DsnStage.Controls[i] is TPanel) then
            begin
                with (DsnStage.Controls[i] as TPanel) do
                begin
                    for j := 0 to ControlCount - 1 do
                    begin
                        if Controls[j].Hint <> '' then
                            SetDefaultValue(Controls[j]);
                    end;
                end;
            end
            else begin
                if DsnStage.Controls[i].Hint <> '' then
                    SetDefaultValue(DsnStage.Controls[i]);
            end;
        end;
    end;
end;

procedure TFrmDesigner.DsnSwitchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    nLeft, i, j: integer;
begin
    nLeft := Left - DsnInspector.Position.Width + FrmMain.PanelProject.Width;
    if nLeft <= 0 then
        nLeft := 0;

    DsnInspector.Position.Left   := nLeft;
    DsnInspector.Position.Top    := FrmMain.pnlMenu.Height + 48 + Top;
    DsnInspector.Position.Height := Height;

    if not DsnSwitch.Down then
    begin
        for i := 0 to DsnStage.ControlCount - 1 do
        begin
            if (DsnStage.Controls[i] is TPanel) then
            begin
                with (DsnStage.Controls[i] as TPanel) do
                begin
                    if ControlCount > 0 then
                    begin
                        for j := 0 to ControlCount - 1 do
                        begin
                            if Controls[j].Hint <> '' then
                                DisplayValue(Controls[j], Controls[j].Hint);
                        end;
                    end
                    else begin
                        if (DsnStage.Controls[i] as TPanel).Hint <> '' then
                            DisplayValue(DsnStage.Controls[i], DsnStage.Controls[i].Hint);
                    end;
                end;
            end
            else begin
                if DsnStage.Controls[i].Hint <> '' then
                    DisplayValue(DsnStage.Controls[i], DsnStage.Controls[i].Hint);
            end;
        end;
    end;
end;

procedure TFrmDesigner.OpenFile(sFileName: string);
begin
    pnlPlay.Visible    := False;
    if not FileExists(sFileName) then exit;

    DsnStage.LoadFromFile(sFileName);
    StatusBar.Panels[0].Text := sFileName;
    Caption := ExtractFileName(sFileName);

    pnlToolBar.Visible := False;
    StatusBar.Visible  := False;
    //pnlPlay.Visible    := True;
end;

procedure TFrmDesigner.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TimerScan.Enabled := False;
    actStop.OnExecute(nil);
    Action := caFree;

end;

procedure TFrmDesigner.DsnStageDblClick(Sender: TObject);
begin
    pnlToolBar.Visible := not pnlToolBar.Visible;
    StatusBar.Visible  := not StatusBar.Visible;
//  pnlPlay.Visible  := not pnlToolBar.Visible;

    DsnStage.Visible := False; 
    if pnlToolBar.Visible then
    begin
        actStop.OnExecute(nil);
        Height := Height + pnlToolBar.Height + StatusBar.Height;
    end
    else begin
        actStart.OnExecute(nil);
        Height := Height - pnlToolBar.Height - StatusBar.Height;
    end;
    DsnStage.Visible := True;
end;

procedure TFrmDesigner.actMenuShowExecute(Sender: TObject);
begin
    actStop.OnExecute(nil);

    pnlToolBar.Visible := True;
    StatusBar.Visible  := True;
{
    pnlPlay.Visible    := False;
    Height := Height + pnlToolBar.Height + StatusBar.Height - pnlPlay.Height;
}
end;

procedure TFrmDesigner.actMenuHideExecute(Sender: TObject);
begin
    DsnSwitch.DesignOff;
    DsnStage.OnDblClick(nil);
{
    pnlToolBar.Visible := False;
    StatusBar.Visible  := False;
    pnlPlay.Visible    := True;
    Height := Height - pnlToolBar.Height - StatusBar.Height + pnlPlay.Height;
}
end;

procedure TFrmDesigner.DsnSwitchClick(Sender: TObject);
begin
    actSave.OnExecute(nil);
end;

procedure TFrmDesigner.FormShow(Sender: TObject);
begin
    DsnPanel.AutoSize := True;
    FrmOption.SetOptionValue;

    TimerScan.Enabled := True;
{
    ScreenSnap := True;
    SnapBuffer := 10;

    if Assigned(MagneticWnd) then
    begin
        DsnInspector.SnapWidth := FrmOption.edtSnapWidth.Value;
        MagneticWnd.SnapWidth  := FrmOption.edtSnapWidth.Value;
        MagneticWnd.AddWindow(Self.Handle, 0, MagneticWndProc);
    end;
}
    actStop.OnExecute(nil);
end;

procedure TFrmDesigner.DsnInspectorBtnClick(Sender: TObject;
  Targets: TSelectedComponents; PropName: string; var Value: String);
var
    PropInfo: PPropInfo; // TypInfo.pas
    aFont:TFont;
    aPicture: TPicture;
    i:integer;
    aComponent: TComponent;
begin
    if PropName = 'Hint' then // -> Resource
    begin
        aComponent := Targets[0];
        if (aComponent is TChart) then
        begin
            Value := FrmChartParam.Execute(Value, (aComponent as TChart));
        end
        else begin
            Value := FrmResouce.Execute( Value,
                                         DsnInspector.Position.Left + DsnInspector.Position.Width,
                                         DsnInspector.Position.Top );

            DisplayValue(aComponent, Value);
        end;
    end;

    if PropName = 'LeftAxis' then  // -> GraphEdit
    begin
        aComponent := Targets[0];
        if (aComponent is TChart) then
        begin
            ChartEditor.Chart := (aComponent as TChart);
            ChartEditor.Execute;
        end;
    end;

    if PropName = 'Picture' then
    begin
        if OpenPictureDialog.Execute then
        begin
            aPicture := TPicture.Create;
            try
                aPicture.LoadFromFile(OpenPictureDialog.FileName);
                aComponent:= Targets[0];
                if (aComponent is TImage) then
                    (aComponent as TImage).Picture.Assign(aPicture);
            finally
                aPicture.Free;
            end;
        end;
    end;

    if (PropName = 'Color') or (PropName = 'OnColor') or (PropName = 'OffColor') then
    begin
        if ColorDialog.Execute then
            Value := IntToStr( ColorDialog.Color );
    end;

    if PropName = 'Font' then
    begin
        aComponent:= Targets[0];
        PropInfo:= GetPropInfo(aComponent.ClassInfo, PropName);
        aFont:=TFont(GetOrdProp(aComponent, PropInfo));
        FontDialog.Font.Assign(aFont);
        if FontDialog.Execute then
        begin
            for i:= 0 to Targets.Count -1 do
            begin
                aComponent:= Targets[i];
                PropInfo:= GetPropInfo(aComponent.ClassInfo, PropName);
                aFont:=TFont(GetOrdProp(aComponent, PropInfo));
                aFont.Assign(FontDialog.Font);
            end;
        end;
    end;
end;

procedure TFrmDesigner.actStartExecute(Sender: TObject);
var
    i: integer;
    aComponent: TComponent;
    aThreadDisplay: TThreadDisplay;
    aThreadChart: TThreadChart;
begin
{
    if gPlayStatus = psStop then
    begin
        for i := 0 to ComponentCount - 1 do
        begin
            aComponent := Components[i];
            if (aComponent is TLabel)          or
               (aComponent is TVrMatrix)       or
               (aComponent is TAdvSmoothGauge) or
               (aComponent is TPanel)          then
            begin
                if (aComponent as TControl).Hint <> '' then
                begin
                    aThreadDisplay := TThreadDisplay.Create(True);
                    try
                    aThreadDisplay.FreeOnTerminate := True;
                        gThreadList.LockList.Add(aThreadDisplay);
                    finally
                        gThreadList.UnlockList;
                    end;
                    aThreadDisplay.FComponent := aComponent;
                    aThreadDisplay.Resume;
                end;
            end
            else if (aComponent is TChart) then
            begin
                if (aComponent as TChart).Hint <> '' then
                begin
                    aThreadChart := nil;
                    aThreadChart := TThreadChart.Create(True);
                    try
                        gThreadList.LockList.Add(aThreadChart);
                    finally
                        gThreadList.UnlockList;
                    end;

                    aThreadChart.FChart := (aComponent as TChart);
                    aThreadChart.Resume;
                end;
            end; // if (aComponent is TLabel) then
        end; //  for i := 0 to ComponentCount-1 do
    end
    else if gPlayStatus = psPause then
    begin
        try
            for i := gThreadList.LockList.Count - 1 downto 0 do
                TThread(gThreadList.LockList.Items[i]).Resume;
        finally
            gThreadList.UnlockList;
        end;
    end;
}

    gPlayStatus := psRun;
    DisplayPlayStatus(lblStatus, gPlayStatus);

    {
    btnStart.Enabled    := False;
    btnPause.Enabled    := True;
    btnStop.Enabled     := True;
    }
    btnMenuShow.Enabled := True;    
    TimerRead.Enabled := True;
end;

procedure TFrmDesigner.actPauseExecute(Sender: TObject);
var
    i: integer;       
begin
    gPlayStatus := psPause;
    DisplayPlayStatus(lblStatus, gPlayStatus);

    try
        for i := gThreadList.LockList.Count - 1 downto 0 do
        begin
            with TThread(gThreadList.LockList.Items[i]) do
            begin
                Suspend;
            end;    
        end;
    finally
        gThreadList.UnlockList;
    end;

    btnStart.Enabled    := True;
    btnPause.Enabled    := False;
    btnStop.Enabled     := True;
    btnMenuShow.Enabled := False;
end;

procedure TFrmDesigner.actStopExecute(Sender: TObject);
var
    i: integer;
begin
    gPlayStatus := psStop;
    DisplayPlayStatus(lblStatus, gPlayStatus);
{
    try
        for i := gThreadList.LockList.Count - 1 downto 0 do  // TThread(gThreadList.LockList.Last).Terminate;
        begin
            with TThread(gThreadList.LockList.Items[i]) do
            begin
                if Suspended then
                    Resume;

                Terminate;
                //WaitFor;
                gThreadList.LockList.Items[i] := nil;
            end;

            gThreadList.LockList.Delete(i);
        end;
    finally
        gThreadList.UnlockList;
    end;
}
    {
    btnStart.Enabled    := True;
    btnPause.Enabled    := False;
    btnStop.Enabled     := False;
    }

    btnMenuShow.Enabled := True;
    TimerRead.Enabled   := False;
end;

procedure TFrmDesigner.WriteCommand(Sender: TObject);
var
    sResource, sValue: string;
    aResourceItem: TResourceItem;
begin
    if not (FrmMain.gbRunning) then

    if (Sender is TEdit) then
    begin
        sResource := (Sender as TEdit).Hint;
        sValue    := (Sender as TEdit).Text;
    end
    else if (Sender is TSpinEdit) then
    begin
        sResource := (Sender as TSpinEdit).Hint;

        if (Sender as TSpinEdit).Text <> '' then
            sValue := Format('%d', [ (Sender as TSpinEdit).Value ] );
    end
    else if (Sender is ZIniRealSpinEdit) then
    begin
        sResource := (Sender as ZIniRealSpinEdit).Hint;

        if (Sender as ZIniRealSpinEdit).Text <> '' then
            sValue    := Format('%f', [ (Sender as ZIniRealSpinEdit).Value] );
    end
    else if (Sender is TAdvTrackBar) then
    begin
        sResource := (Sender as TAdvTrackBar).Hint;
        sValue    := Format('%d', [ (Sender as TAdvTrackBar).Position] );
    end
    else if (Sender is TXiButton) then
    begin
        sResource := (Sender as TXiButton).Hint;
        sValue    := 'ON';
    end
    else if (Sender is TVrPowerButton) then
    begin
        sResource := (Sender as TVrPowerButton).Hint;
        if (Sender as TVrPowerButton).Active then
            sValue := 'ON'
        else
            sValue := 'OFF';
    end
    else if (Sender is TVrSwitch) then
    begin
        sResource := (Sender as TVrSwitch).Hint;
        sValue    := Format('%d', [ (Sender as TVrSwitch).Offset] );
    end;

    if sResource <> '' then
    begin
        aResourceItem := CurrProject.GetResource(0, sResource);
        WriteResName(aResourceItem, sValue);
    end;

end;

procedure TFrmDesigner.Dpst_TEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        WriteCommand(Sender);
end;

procedure TFrmDesigner.TimerScanTimer(Sender: TObject);

    function ReadValue(aComponent: TComponent): string;
    begin
        if (aComponent is ZIniSpinEdit) or
           (aComponent is ZIniRealSpinEdit) or
           (aComponent is TVrPowerButton) or
           (aComponent is TAdvTrackBar) or
           (aComponent is TEdit) or
           (aComponent is TVrSwitch) then
        begin
            Result := ReadResNameFromBuffer( (aComponent as TControl).Hint );
        end;

    end;

    procedure SetValue(aComponent: TComponent; sValue: string);
    var
        fValue: double;
    begin
        if IsFloat(sValue) then
            fValue := StrToFloatDef(sValue, 0)
        else if (sValue = 'ON') or (sValue = '1') or (sValue = 'TRUE') then
            fValue := 1
        else
            fValue := 0;

        if (aComponent is ZIniSpinEdit) then
            (aComponent as ZIniSpinEdit).Value := Round(fValue)
        else if (aComponent is ZIniRealSpinEdit) then
            (aComponent as ZIniRealSpinEdit).Value := fValue
        else if (aComponent is TVrPowerButton) then
            (aComponent as TVrPowerButton).Active := (fValue = 1)
        else if (aComponent is TAdvTrackBar) then
            (aComponent as TAdvTrackBar).Position := Round(fValue)
        else if (aComponent is TEdit) then
            (aComponent as TEdit).Text := sValue
        else if (aComponent is TVrSwitch) then
            (aComponent as TVrSwitch).Offset := Round(fValue)
    end;

var
    i, j: integer;
    sValue : string;
begin
    TimerScan.Enabled := False;

    if (FrmMain.gbRunning) and (not DsnSwitch.Down) then
    begin
        for i := 0 to DsnStage.ControlCount - 1 do
        begin
            if (DsnStage.Controls[i] is TPanel) then
            begin
                with (DsnStage.Controls[i] as TPanel) do
                begin
                    for j := 0 to ControlCount - 1 do
                    begin
                        if Controls[j].Hint <> '' then
                        begin
                            sValue := ReadValue( Controls[j] );
                            SetValue(Controls[j], sValue);
                        end;
                    end;
                end;
            end
            else begin
                if DsnStage.Controls[i].Hint <> '' then
                begin
                    sValue := ReadValue( DsnStage.Controls[i] );
                    SetValue(DsnStage.Controls[i], sValue);
                end;
            end;
            Application.ProcessMessages;
        end;
    end;

    TimerScan.Enabled := True;
end;

procedure TFrmDesigner.Dpst_TVrPowerButtonClick(Sender: TObject);
begin
    WriteCommand(Sender);
end;

procedure TFrmDesigner.TimerReadTimer(Sender: TObject);
var
    i: integer;
    aComponent: TComponent;
    sResourceItems, sValue: string;
    aResourceItem: TResourceItem;
begin
    TimerRead.Enabled := False;

    for i := 0 to ComponentCount - 1 do
    begin
        aComponent := Components[i];
        if (aComponent is TLabel)          or
           (aComponent is TVrMatrix)       or
           (aComponent is TAdvSmoothGauge) or
           (aComponent is TLed)            or
           (aComponent is TPanel)          then
        begin
            sResourceItems := (aComponent as TControl).Hint;
            if sResourceItems <> '' then
            begin
                aResourceItem := CurrProject.GetResource(0, sResourceItems);
                sValue := ReadResName(aResourceItem, '');
                DisplayValue(aComponent, sValue);
            end;
        end;

        Application.ProcessMessages;
    end;
    
    TimerRead.Enabled := True;
end;

end.
