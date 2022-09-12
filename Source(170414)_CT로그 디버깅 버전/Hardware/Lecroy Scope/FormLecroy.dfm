object FrmLecroy: TFrmLecroy
  Left = 342
  Top = 132
  BorderStyle = bsDialog
  Caption = 'Lecroy Scope Test'
  ClientHeight = 628
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object BtnSend: TSpeedButton
    Left = 698
    Top = 104
    Width = 55
    Height = 22
    Caption = 'SEND'
    OnClick = BtnSendClick
  end
  object BtnSetup: TSpeedButton
    Left = 8
    Top = 184
    Width = 185
    Height = 22
    Caption = #49444#51221
    OnClick = BtnSetupClick
  end
  object Label2: TLabel
    Left = 208
    Top = 56
    Width = 60
    Height = 12
    Caption = #52488#44592#47749#47161#50612
  end
  object btnInitial: TSpeedButton
    Left = 328
    Top = 48
    Width = 81
    Height = 22
    Caption = #51204#49569
    OnClick = btnInitialClick
  end
  object Label3: TLabel
    Left = 8
    Top = 165
    Width = 96
    Height = 12
    Caption = 'Trigger Level (V)'
  end
  object btnReadValue: TSpeedButton
    Left = 640
    Top = 48
    Width = 105
    Height = 31
    Caption = #44050#51069#44592
    OnClick = btnReadValueClick
  end
  object Lb_Value: TdpbLabel
    Left = 416
    Top = 48
    Width = 217
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = '0.00'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object MemoLog: TMemo
    Left = 416
    Top = 128
    Width = 337
    Height = 113
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 609
    Width = 762
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 37
      Height = 12
      Caption = 'IPAddr'
    end
    object BtnConnect: TSpeedButton
      Left = 132
      Top = 5
      Width = 73
      Height = 33
      Caption = #50672#44208
      OnClick = BtnConnectClick
    end
    object BtnDisConnect: TSpeedButton
      Left = 206
      Top = 5
      Width = 73
      Height = 33
      Caption = #50672#44208#54644#51228
      OnClick = BtnDisConnectClick
    end
    object BtnAbout: TSpeedButton
      Left = 683
      Top = 4
      Width = 73
      Height = 33
      Caption = 'About'
      OnClick = BtnAboutClick
    end
    object Edit_IPAddr: ZIniEdit
      Left = 5
      Top = 17
      Width = 121
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      IniKey = 'IPAddr'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object Edit_Send: TEdit
    Left = 416
    Top = 104
    Width = 281
    Height = 21
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 3
    Text = '*IDN?'
  end
  object Rg_TrigMode: TRadioGroup
    Left = 8
    Top = 48
    Width = 185
    Height = 105
    Caption = 'Trigger Mode'
    ItemIndex = 0
    Items.Strings = (
      'STOP'
      'SINGLE'
      'NORMAL'
      'AUTO')
    TabOrder = 4
  end
  object MemoInit: TMemo
    Left = 208
    Top = 72
    Width = 201
    Height = 169
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      '*RST'
      'MSIZ 500'
      'TRMD AUTO'
      'TDIV 1ms'
      'C1:VDIV 200mV'
      'C1:OFFSET 0mV')
    ParentFont = False
    TabOrder = 5
    WordWrap = False
  end
  object Edit_TriggerLevel: TEdit
    Left = 128
    Top = 160
    Width = 65
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 6
    Text = '1'
  end
  object Chart: TChart
    Left = 8
    Top = 248
    Width = 745
    Height = 353
    Legend.Title.Visible = False
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Axis.Width = 1
    BottomAxis.Grid.SmallDots = True
    BottomAxis.Grid.SmallSpace = 5
    BottomAxis.MinorTickCount = 4
    BottomAxis.MinorTickLength = 4
    BottomAxis.MinorTicks.Color = clBlack
    BottomAxis.TickLength = 8
    BottomAxis.Ticks.Color = clBlack
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Axis.Width = 1
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Color = clSilver
    LeftAxis.Grid.SmallDots = True
    LeftAxis.Grid.SmallSpace = 5
    LeftAxis.Increment = 1.000000000000000000
    LeftAxis.Maximum = 5.000000000000000000
    LeftAxis.Minimum = -5.000000000000000000
    LeftAxis.MinorTickCount = 4
    LeftAxis.MinorTickLength = 4
    LeftAxis.MinorTicks.Color = clBlack
    LeftAxis.TickLength = 9
    LeftAxis.Ticks.Color = clBlack
    LeftAxis.Title.Caption = 'VOLT (V)'
    View3D = False
    BevelOuter = bvLowered
    TabOrder = 7
    PrintMargins = (
      25
      15
      25
      15)
    ColorPaletteIndex = 13
    object BtnReadScope: TSpeedButton
      Left = 658
      Top = 4
      Width = 73
      Height = 33
      Caption = #54028#54805#51069#44592
      OnClick = BtnReadScopeClick
    end
    object Series1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object cmbMode: ZIniComboBox
    Left = 642
    Top = 82
    Width = 101
    Height = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 8
    Text = 'cmbMode'
    Items.Strings = (
      'Peak To Peak'
      'Peak')
    SaveItems = False
    IniKey = 'cmbMode'
    IniDataSource = INI
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'LecroyScope'
    Left = 352
    Top = 144
  end
end
