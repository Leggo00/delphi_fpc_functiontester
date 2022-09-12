object FrmHWLog: TFrmHWLog
  Left = 376
  Top = 245
  Width = 892
  Height = 519
  Caption = 'KMI HW LOG'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object cbLogSave: TCheckBox
      Left = 801
      Top = 12
      Width = 73
      Height = 17
      Caption = 'Log Save'
      TabOrder = 0
    end
    object BtnClear: TXiButton
      Left = 888
      Top = 8
      Width = 99
      Height = 25
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = 6447714
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 10921638
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 7697781
      OverColorText = clBlack
      DownColorFace = 13290186
      DownColorGrad = 14342874
      DownColorDark = 15329769
      DownColorLight = 8158332
      DownColorBorder = 5131854
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 11382189
      ColorScheme = csNeoSilver
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'CLEAR'
      TabOrder = 1
      OnClick = BtnClearClick
    end
    object cbDisplaylog: TCheckBox
      Left = 713
      Top = 12
      Width = 88
      Height = 17
      Caption = 'Display Log'
      TabOrder = 2
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 41
    Width = 884
    Height = 444
    Align = alClient
    Color = 13762046
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2010'
    ParentFont = False
    TabOrder = 1
  end
end
