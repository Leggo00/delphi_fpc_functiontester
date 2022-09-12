object FrmRs232Base: TFrmRs232Base
  Left = 320
  Top = 463
  Width = 460
  Height = 312
  Caption = 'RS-232 BASE'
  Color = clMenuBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 40
    Top = 168
    Width = 5
    Height = 17
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lb_Msg: TdpbLabel
    Left = 8
    Top = 98
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
  object ListRx: TListBox
    Left = 8
    Top = 132
    Width = 430
    Height = 118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ImeName = 'Microsoft IME 2010'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 376
    Top = 208
    Width = 41
    Height = 41
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object XiPanel1: TXiPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 40
    ColorFace = clCream
    ColorGrad = 13748680
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 32
      Height = 15
      Caption = 'PORT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 116
      Top = 12
      Width = 65
      Height = 15
      Caption = 'BAUD RATE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object BtnConnect: TXiButton
      Left = 282
      Top = 8
      Width = 75
      Height = 24
      ColorFace = 15658734
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = clSilver
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
      ColorScheme = csCustom
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Connect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnConnectClick
    end
    object BtnDisconnect: TXiButton
      Left = 357
      Top = 8
      Width = 75
      Height = 24
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = clSilver
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
      ColorScheme = csCustom
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'DisConnect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnDisconnectClick
    end
    object Comportbox: ZIniComboBox
      Left = 48
      Top = 8
      Width = 63
      Height = 23
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 15
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
      SaveItems = False
      IniKey = 'COMPORT'
      IniDataSource = INI
    end
    object BaudRatebox: ZIniComboBox
      Left = 188
      Top = 8
      Width = 85
      Height = 23
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 15
      ParentFont = False
      TabOrder = 3
      Items.Strings = (
        '110'
        '300'
        '1200'
        '2400'
        '4800'
        '9600'
        '19200'
        '38400'
        '57600'
        '115200')
      SaveItems = False
      IniKey = 'BAUDRATE'
      IniDataSource = INI
    end
  end
  object btnSend: TXiButton
    Tag = 1
    Left = 356
    Top = 46
    Width = 81
    Height = 24
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = clSilver
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
    ColorScheme = csCustom
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'SEND'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnSendClick
  end
  object edtSend: ZIniEdit
    Left = 96
    Top = 46
    Width = 257
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ImeName = 'Microsoft IME 2010'
    ParentFont = False
    TabOrder = 4
    MoveCursor = False
  end
  object ZIniPanel1: ZIniPanel
    Left = 9
    Top = 48
    Width = 81
    Height = 21
    Caption = 'Send Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object XiPanel3: TXiPanel
    Left = 8
    Top = 77
    Width = 430
    Height = 17
    ColorFace = clCream
    ColorGrad = 13748680
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'Receive Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    UseDockManager = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 259
    Width = 452
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object BtnListClear: TXiButton
    Tag = 1
    Left = 330
    Top = 98
    Width = 109
    Height = 31
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = clSilver
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
    ColorScheme = csCustom
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'LIST CLEAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BtnListClearClick
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'RS-232BASE'
    Left = 40
    Top = 176
  end
  object CommPortDriver1: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 104
    Top = 176
  end
end
