object FrmBarcode: TFrmBarcode
  Left = 761
  Top = 250
  BorderStyle = bsDialog
  Caption = #48148#53076#46300' '#44288#47532
  ClientHeight = 411
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object BtnClear: TSpeedButton
    Left = 336
    Top = 232
    Width = 65
    Height = 34
    Caption = 'CLEAR'
    OnClick = BtnClearClick
  end
  object Lb_Msg: TdpbLabel
    Left = 8
    Top = 232
    Width = 321
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Color = clBlack
    EdgeStyle = desBump
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object ListBoxRx: TListBox
    Left = 8
    Top = 274
    Width = 393
    Height = 113
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 48
    Width = 393
    Height = 177
    Caption = #48148#53076#46300' '#49444#51221
    TabOrder = 1
    object Label2: TLabel
      Left = 187
      Top = 25
      Width = 9
      Height = 12
      Caption = '~'
    end
    object Label3: TLabel
      Left = 129
      Top = 51
      Width = 56
      Height = 12
      Caption = 'Start Char'
    end
    object Label4: TLabel
      Left = 129
      Top = 75
      Width = 53
      Height = 12
      Caption = 'End Char'
    end
    object Label5: TLabel
      Left = 33
      Top = 147
      Width = 76
      Height = 12
      Caption = #51069#44592' '#49884#44036#51228#54620
    end
    object Label6: TLabel
      Left = 205
      Top = 147
      Width = 18
      Height = 12
      Caption = 'ms'
    end
    object Ed_LenStart: ZIniSpinEdit
      Left = 128
      Top = 21
      Width = 57
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'LenStart'
      IniDataSource = INI
    end
    object Cb_LengthLimit: ZIniCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = #51088#47532#49688' '#51228#54620
      TabOrder = 1
      IniKey = 'LengthLimit'
      IniDataSource = INI
    end
    object Ed_LenEnd: ZIniSpinEdit
      Left = 200
      Top = 21
      Width = 57
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      IniKey = 'LenEnd'
      IniDataSource = INI
    end
    object Cb_UseTrigger: ZIniCheckBox
      Left = 16
      Top = 48
      Width = 97
      Height = 17
      Caption = #53944#47532#44144#49324#50857
      TabOrder = 3
      IniKey = 'UseTrigger'
      IniDataSource = INI
    end
    object Ed_StartChar: ZIniEdit
      Left = 200
      Top = 48
      Width = 65
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
      IniKey = 'StartChar'
      IniDataSource = INI
      MoveCursor = False
    end
    object Ed_EndChar: ZIniEdit
      Left = 200
      Top = 72
      Width = 65
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
      IniKey = 'EndChar'
      IniDataSource = INI
      MoveCursor = False
    end
    object Cb_RemoveDuplicate: ZIniCheckBox
      Left = 16
      Top = 96
      Width = 121
      Height = 17
      Caption = #51473#48373' '#48148#53076#46300' '#49325#51228
      TabOrder = 6
      IniKey = 'RemoveDuplicate'
      IniDataSource = INI
    end
    object Cb_PreRead: ZIniCheckBox
      Left = 16
      Top = 120
      Width = 121
      Height = 17
      Caption = #48120#47532#51069#44592' '#49324#50857
      TabOrder = 7
      IniKey = 'PreRead'
      IniDataSource = INI
    end
    object BtnReadBarcode: TXiButton
      Left = 280
      Top = 128
      Width = 105
      Height = 41
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
      Caption = 'READ'
      TabOrder = 8
      OnClick = BtnReadBarcodeClick
    end
    object Ed_TimeOut: ZIniSpinEdit
      Left = 122
      Top = 141
      Width = 73
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 9
      Value = 0
      IniKey = 'TimeOut'
      IniDataSource = INI
    end
    object ChkCRLF: ZIniCheckBox
      Left = 136
      Top = 96
      Width = 121
      Height = 17
      Caption = 'CRLF '#52628#44032
      TabOrder = 10
      IniKey = 'ChkCRLF'
      IniDataSource = INI
    end
    object ChkChar: ZIniCheckBox
      Left = 17
      Top = 70
      Width = 102
      Height = 17
      Caption = 'CHAR '#49324#50857
      TabOrder = 11
      IniKey = 'ChkChar'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 392
    Width = 407
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object XiPanel1: TXiPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 41
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csSilver
    FillDirection = fdVertical
    Align = alTop
    TabOrder = 3
    UseDockManager = True
    object Label1: TLabel
      Left = 9
      Top = 14
      Width = 48
      Height = 12
      Caption = #53685#49888#49444#51221
      Transparent = True
    end
    object BtnConnect: TXiButton
      Left = 245
      Top = 8
      Width = 73
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
      Caption = #50672#44208
      TabOrder = 0
      OnClick = BtnConnectClick
    end
    object BtnDisConnect: TXiButton
      Left = 317
      Top = 8
      Width = 73
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
      Caption = #54644#51228
      TabOrder = 1
      OnClick = BtnDisConnectClick
    end
    object Ed_PortConfig: ZIniEdit
      Left = 59
      Top = 10
      Width = 177
      Height = 20
      Hint = #50696') COM1-9600-8-N-1'
      ImeName = 'Microsoft IME 2003'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'COM1-9600-8-N-1'
      IniKey = 'PortConfig'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'BARCODE'
    Left = 104
    Top = 328
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 64
    Top = 328
  end
end
