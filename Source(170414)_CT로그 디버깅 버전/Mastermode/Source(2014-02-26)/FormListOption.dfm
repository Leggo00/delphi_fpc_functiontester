object FrmListOption: TFrmListOption
  Left = 571
  Top = 266
  Width = 267
  Height = 308
  Caption = 'List Option'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object gbListOption: TGroupBox
    Left = 0
    Top = 85
    Width = 259
    Height = 57
    Align = alTop
    Caption = 'List Option'
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 32
      Width = 218
      Height = 14
      Caption = 'Grid '#46972#51064' '#44079#49688' :                                         '#51460' '
    end
    object edtListRowCount: ZIniSpinEdit
      Left = 96
      Top = 27
      Width = 115
      Height = 23
      MaxValue = 99999
      MinValue = 1
      TabOrder = 0
      Value = 1
      IniKey = 'edtListRowCount'
      IniDataSource = INI
    end
  end
  object PNToolBAR: TXiPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 28
    ColorFace = clWhite
    ColorGrad = 15456207
    ColorLight = clCream
    ColorDark = clBtnFace
    ColorScheme = csCustom
    FillDirection = fdVertical
    Align = alTop
    TabOrder = 1
    UseDockManager = True
    object btnModelSelect: TAdvGlowButton
      Left = 5
      Top = 4
      Width = 62
      Height = 19
      Caption = 'SAVE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 0
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnModelSelectClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object AdvGlowButton1: TAdvGlowButton
      Left = 183
      Top = 4
      Width = 62
      Height = 21
      Caption = 'EXIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 1
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = AdvGlowButton1Click
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object gbLineSet: TGroupBox
    Left = 0
    Top = 28
    Width = 259
    Height = 57
    Align = alTop
    Caption = 'Line Set'
    TabOrder = 2
    object Label2: TLabel
      Left = 11
      Top = 24
      Width = 84
      Height = 14
      Caption = #44277#51221#53076#46300'          : '
    end
    object EditStation: ZIniEdit
      Left = 96
      Top = 21
      Width = 115
      Height = 22
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      IniKey = 'Station'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object gbBox: TGroupBox
    Left = 0
    Top = 142
    Width = 259
    Height = 85
    Align = alTop
    Caption = 'Box '
    TabOrder = 3
    object Label3: TLabel
      Left = 11
      Top = 24
      Width = 132
      Height = 14
      Caption = #48149#49828#45817' '#48512#54408#44079#49688' :           : '
    end
    object Label4: TLabel
      Left = 11
      Top = 56
      Width = 132
      Height = 14
      Caption = #44160#49324#45817' '#49548#47784' '#48512#54408' '#44079#49688'   : '
    end
    object edtPartsCountMax: ZIniSpinEdit
      Left = 145
      Top = 22
      Width = 83
      Height = 23
      MaxValue = 99999
      MinValue = 1
      TabOrder = 0
      Value = 1
      IniKey = 'PartsCountMax'
      IniDataSource = INI
    end
    object edtPartsCount: ZIniSpinEdit
      Left = 145
      Top = 54
      Width = 83
      Height = 23
      MaxValue = 99999
      MinValue = 1
      TabOrder = 1
      Value = 1
      IniKey = 'PartsCountMax'
      IniDataSource = INI
    end
  end
  object gbStation: TGroupBox
    Left = 0
    Top = 227
    Width = 259
    Height = 43
    Align = alTop
    Caption = 'Barcode '
    DragMode = dmAutomatic
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 14
      Caption = 'StationNum   : '
    end
    object edtStation: ZIniSpinEdit
      Left = 81
      Top = 12
      Width = 83
      Height = 23
      MaxValue = 99999
      MinValue = 1
      TabOrder = 0
      Value = 1
      IniKey = 'BarcodeStation'
      IniDataSource = INI
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'ListOption'
    Left = 104
    Top = 8
  end
end
