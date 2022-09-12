object FrmSensorTable: TFrmSensorTable
  Left = 442
  Top = 217
  BorderStyle = bsDialog
  Caption = #53580#51060#48660
  ClientHeight = 734
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 40
    Align = alTop
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cmbModel: TComboBox
      Left = 95
      Top = 9
      Width = 118
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnKeyPress = cmbModelKeyPress
      OnSelect = cmbModelSelect
    end
    object cmbKos: TComboBox
      Left = 305
      Top = 8
      Width = 97
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnKeyPress = cmbKosKeyPress
      OnSelect = cmbKosSelect
    end
    object btnSave: TButton
      Left = 497
      Top = 8
      Width = 75
      Height = 25
      Caption = #51200#51109
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnMAdd: TButton
      Left = 417
      Top = 8
      Width = 75
      Height = 25
      Caption = #52628#44032
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnMAddClick
    end
    object btnClose: TButton
      Left = 936
      Top = 8
      Width = 75
      Height = 25
      Caption = 'CLOSE'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnCloseClick
    end
    object btnFind: TButton
      Left = 787
      Top = 8
      Width = 75
      Height = 25
      Caption = 'FIND'
      TabOrder = 5
      OnClick = btnFindClick
    end
    object edtFind: TEdit
      Left = 679
      Top = 8
      Width = 102
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 6
    end
    object Panel6: TPanel
      Left = 596
      Top = 8
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'VALUE'
      TabOrder = 7
    end
    object Panel7: TPanel
      Left = 222
      Top = 8
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #53580#51060#48660' '#51333#47448
      TabOrder = 8
    end
    object Panel8: TPanel
      Left = 12
      Top = 9
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #47784#45944
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 694
    Width = 1016
    Height = 40
    Align = alBottom
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object a: TEdit
      Left = 321
      Top = 8
      Width = 64
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 0
      OnKeyPress = SsorgridTB_1KeyPress
    end
    object s: TEdit
      Left = 475
      Top = 8
      Width = 64
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 1
      OnKeyPress = SsorgridTB_1KeyPress
    end
    object d: TEdit
      Left = 633
      Top = 8
      Width = 64
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 2
      OnKeyPress = SsorgridTB_1KeyPress
    end
    object btnTmpAdd: TButton
      Left = 705
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ADD'
      TabOrder = 3
      OnClick = btnTmpAddClick
    end
    object Panel3: TPanel
      Left = 238
      Top = 8
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Low Value'
      TabOrder = 4
    end
    object Panel4: TPanel
      Left = 392
      Top = 8
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'High Value'
      TabOrder = 5
    end
    object Panel5: TPanel
      Left = 550
      Top = 8
      Width = 82
      Height = 24
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Inc'
      TabOrder = 6
    end
  end
  object FlistBox: TFileListBox
    Left = 2
    Top = 41
    Width = 97
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft Korean IME 2002'
    ItemHeight = 12
    Mask = '*.TBL'
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object CheckStringGrid8: TCheckStringGrid
    Left = 9
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid9: TCheckStringGrid
    Left = 153
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 4
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid10: TCheckStringGrid
    Left = 297
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 5
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid11: TCheckStringGrid
    Left = 440
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 6
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid12: TCheckStringGrid
    Left = 585
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 7
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid13: TCheckStringGrid
    Left = 729
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 8
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
  object CheckStringGrid14: TCheckStringGrid
    Left = 874
    Top = 53
    Width = 133
    Height = 635
    ColCount = 2
    DefaultRowHeight = 14
    FixedCols = 0
    RowCount = 42
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 9
    OnKeyDown = SsorgridTB_1KeyDown
    OnKeyPress = SsorgridTB_1KeyPress
    KyungsangOrder = False
    ColAttribSTr = 'O;S;C'
    ReadOnly = False
    ColWidths = (
      61
      66)
  end
end
