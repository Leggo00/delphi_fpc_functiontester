object FrmHwTest: TFrmHwTest
  Left = 433
  Top = 154
  Width = 1024
  Height = 462
  Caption = #49884#48044#47112#51060#53552
  Color = clBtnFace
  Constraints.MaxWidth = 1024
  Constraints.MinWidth = 1024
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    1008
    404)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 761
    Top = 8
    Width = 48
    Height = 12
    Caption = #51077#47141#51312#44148
  end
  object TabInput: TTabControl
    Left = 8
    Top = 8
    Width = 359
    Height = 394
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Tabs.Strings = (
      'AD'
      'DO'
      'DI'
      'RO')
    TabIndex = 0
    OnChange = TabInputChange
    object GridInput: TCheckStringGrid
      Left = 4
      Top = 26
      Width = 351
      Height = 364
      Align = alClient
      ColCount = 3
      DefaultColWidth = 30
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 100
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnDblClick = GridInputDblClick
      OnKeyDown = GridInputKeyDown
      OnSelectCell = GridInputSelectCell
      KyungsangOrder = False
      ColAttribSTr = 'S;S;S'
      ReadOnly = False
      ColWidths = (
        167
        85
        74)
    end
  end
  object TabOutput: TTabControl
    Left = 372
    Top = 8
    Width = 380
    Height = 394
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Tabs.Strings = (
      'AD'
      'DO'
      'DI')
    TabIndex = 0
    OnChange = TabOutputChange
    object GridOutput: TCheckStringGrid
      Left = 4
      Top = 26
      Width = 372
      Height = 364
      Align = alClient
      ColCount = 4
      DefaultColWidth = 30
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 100
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 0
      KyungsangOrder = False
      ColAttribSTr = 'S;S;RIGHT;C'
      ReadOnly = False
      ColWidths = (
        160
        86
        66
        34)
    end
  end
  object ValueList: TValueListEditor
    Left = 761
    Top = 32
    Width = 241
    Height = 367
    Anchors = [akLeft, akTop, akBottom]
    DefaultRowHeight = 16
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
    ParentFont = False
    TabOrder = 2
    TitleCaptions.Strings = (
      'INPUT ITEM'
      'VALUE')
    ColWidths = (
      142
      93)
  end
  object TimerRead: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerReadTimer
    Left = 36
    Top = 106
  end
  object ScieCalc: TScieCalc
    Left = 34
    Top = 202
  end
  object TimerSweep: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerSweepTimer
    Left = 36
    Top = 292
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 104
    Top = 232
    object MenuReset: TMenuItem
      Caption = #52488#44592#54868
      OnClick = MenuResetClick
    end
    object N1: TMenuItem
      Caption = #51452#48320#51109#52824
      object KMIHardware1: TMenuItem
        Caption = 'KMI Hardware'
        OnClick = KMIHardware1Click
      end
      object NIHardware1: TMenuItem
        Caption = 'NI Hardware'
        OnClick = NIHardware1Click
      end
      object MenuCAN: TMenuItem
        Caption = 'CAN'
        object CAN011: TMenuItem
          Caption = 'CAN01'
          OnClick = CanMenuClick
        end
      end
      object MenuDevice: TMenuItem
        Caption = 'DEVICE'
      end
      object BARCODE1: TMenuItem
        Caption = 'BARCODE #1'
        OnClick = BARCODE1Click
      end
      object BARCODE21: TMenuItem
        Caption = 'BARCODE #2'
        OnClick = BARCODE21Click
      end
    end
  end
end
