object FrmLN300AG6: TFrmLN300AG6
  Left = 384
  Top = 213
  BorderStyle = bsDialog
  Caption = 'LN-300A-G6'
  ClientHeight = 511
  ClientWidth = 772
  Color = 15790320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 250
    Top = 54
    Width = 517
    Height = 47
    Caption = 'Command Send'
    TabOrder = 0
    object edtSend: ZIniEdit
      Left = 10
      Top = 18
      Width = 247
      Height = 23
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      IniKey = 'edtSend'
      IniDataSource = INI
      MoveCursor = False
    end
    object BtnSend: TXiButton
      Left = 263
      Top = 15
      Width = 75
      Height = 26
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
      Caption = #51204#49569
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnSendClick
    end
    object BtnOff: TXiButton
      Left = 434
      Top = 13
      Width = 75
      Height = 26
      ColorFace = 15263999
      ColorGrad = 9803263
      ColorDark = 8553215
      ColorLight = 14540287
      ColorBorder = 157
      ColorText = clBlack
      OverColorFace = 14671871
      OverColorGrad = 7829503
      OverColorDark = 6974207
      OverColorLight = 14145535
      OverColorBorder = 157
      OverColorText = clBlack
      DownColorFace = 10921727
      DownColorGrad = 12171775
      DownColorDark = 13553407
      DownColorLight = 6184703
      DownColorBorder = 157
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 6184703
      ColorScheme = csNeoRose
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = #51204#50896' OFF'
      TabOrder = 2
      OnClick = BtnOffClick
    end
    object BtnOn: TXiButton
      Left = 358
      Top = 13
      Width = 75
      Height = 26
      ColorFace = 14547432
      ColorGrad = 6217614
      ColorDark = 2406748
      ColorLight = 13366747
      ColorBorder = 1404727
      ColorText = clBlack
      OverColorFace = 12579538
      OverColorGrad = 4053111
      OverColorDark = 2339929
      OverColorLight = 11923659
      OverColorBorder = 1538365
      OverColorText = clBlack
      DownColorFace = 5168259
      DownColorGrad = 8447654
      DownColorDark = 9037740
      DownColorLight = 1539390
      DownColorBorder = 1471545
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 2406748
      ColorScheme = csNeoGrass
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = #51204#50896' ON'
      TabOrder = 3
      OnClick = BtnOnClick
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 48
    Align = alTop
    TabOrder = 1
    DesignSize = (
      772
      48)
    object GradientFill2: TGradientFill
      Left = 1
      Top = 1
      Width = 770
      Height = 46
      ColorBegin = 15724527
      ColorEnd = 14013909
      ColorNum = 2
      Align = alClient
    end
    object LabelType: TLabel
      Left = 10
      Top = 3
      Width = 38
      Height = 15
      Caption = 'DEVno'
      Transparent = True
    end
    object XiButton2: TXiButton
      Tag = 1
      Left = 691
      Top = 11
      Width = 75
      Height = 26
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
      Anchors = [akTop, akRight]
      Caption = 'Clear'
      TabOrder = 0
      OnClick = BtnClearClick
    end
    object edtDevNo: ZIniSpinEdit
      Left = 10
      Top = 18
      Width = 70
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      MaxValue = 999
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 0
      IniKey = 'Port'
      IniDataSource = INI
    end
    object btnInitial: TXiButton
      Tag = 1
      Left = 89
      Top = 11
      Width = 75
      Height = 26
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
      Anchors = [akTop, akRight]
      Caption = 'Initial'
      TabOrder = 2
      OnClick = btnInitialClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 54
    Width = 239
    Height = 395
    Caption = 'Command List'
    TabOrder = 2
    object lbCommendList: ZIniListBox
      Left = 2
      Top = 17
      Width = 235
      Height = 376
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 15
      Items.Strings = (
        #51204#50896#51064#44032' : SW 1'
        #51204#50896#54644#51228' : SW 0'
        ''
        #51221#51204#47448' [A] : CC'
        #51221#51200#54637' ['#8486'] : CR'
        #51221#51204#50517' [V] : CV'
        #51221#51204#47141' [W] : CP'
        ''
        #51221#51204#47448' [A] : CC 0'
        ''
        #51204#47448' Range Auto : RC 0'
        #51204#47448' Range H : RC 1'
        #51204#47448' Range M : RC 2'
        #51204#47448' Range L : RC 3'
        ''
        #51204#50517' Range Auto : RV 0'
        #51204#50517' Range H : RV 1'
        #51204#50517' Range M : RV 2'
        #51204#50517' Range L: RV 3')
      ParentFont = False
      TabOrder = 0
      OnDblClick = lbCommendListDblClick
      SaveItems = True
    end
    object XiButton1: TXiButton
      Left = 187
      Top = 1
      Width = 48
      Height = 14
      ColorFace = 15658734
      ColorGrad = 14342874
      ColorDark = 13816530
      ColorLight = clWhite
      ColorBorder = clGray
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 13079678
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 13079678
      OverColorText = clBlack
      DownColorFace = 15987699
      DownColorGrad = 13079678
      DownColorDark = 13079678
      DownColorLight = 16250871
      DownColorBorder = clSilver
      DownColorText = clBlack
      DisabledColorFace = 15987699
      DisabledColorGrad = 13079678
      DisabledColorDark = 13079678
      DisabledColorLight = 16250871
      DisabledColorBorder = clSilver
      DisabledColorText = clBlack
      ColorFocusRect = 11382189
      ColorScheme = csCustom
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Edit'
      TabOrder = 1
      Visible = False
    end
  end
  object XiPanel1: TXiPanel
    Left = 6
    Top = 452
    Width = 761
    Height = 55
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csSilver
    FillDirection = fdVertical
    TabOrder = 3
    UseDockManager = True
    object XiButton3: TXiButton
      Left = 92
      Top = 18
      Width = 75
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
      Caption = #51204#47448#49483#54021
      TabOrder = 0
      OnClick = XiButton3Click
    end
    object edtCurrent: ZIniRealSpinEdit
      Left = 12
      Top = 18
      Width = 77
      Height = 24
      Increment = 1.000000000000000000
      TabOrder = 1
      IniKey = 'edtCurrent'
      IniDataSource = INI
    end
    object XiButton4: TXiButton
      Left = 596
      Top = 18
      Width = 75
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
      Caption = 'READ'
      TabOrder = 2
      OnClick = XiButton4Click
    end
    object pnlValue: TXiPanel
      Left = 674
      Top = 18
      Width = 75
      Height = 25
      ColorFace = clWhite
      ColorGrad = 10805759
      ColorLight = 36821
      ColorDark = 27035
      ColorScheme = csDesert
      FillDirection = fdVertical
      TabOrder = 3
      UseDockManager = True
    end
    object edtOhm: ZIniRealSpinEdit
      Left = 172
      Top = 18
      Width = 77
      Height = 24
      Increment = 1.000000000000000000
      TabOrder = 4
      IniKey = 'edtOhm'
      IniDataSource = INI
    end
    object XiButton5: TXiButton
      Left = 252
      Top = 18
      Width = 75
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
      Caption = #51200#54637#49483#54021
      TabOrder = 5
      OnClick = XiButton5Click
    end
  end
  object PageControl1: TPageControl
    Left = 248
    Top = 104
    Width = 521
    Height = 345
    ActivePage = TabSheet1
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'LOG'
      object MemoLog: TMemo
        Left = 0
        Top = 0
        Width = 513
        Height = 315
        Align = alClient
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'LIMIT SETTING'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 56
        Height = 15
        Caption = #51200#54637' LIMIT'
      end
      object Label2: TLabel
        Left = 208
        Top = 9
        Width = 7
        Height = 15
        Caption = '~'
      end
      object edtLIMIT_OHM_MIn: ZIniEdit
        Left = 80
        Top = 5
        Width = 121
        Height = 23
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
        IniKey = 'LIMIT_OHM_MIN'
        IniDataSource = INI
        MoveCursor = False
      end
      object edtLIMIT_OHM_Max: ZIniEdit
        Left = 224
        Top = 5
        Width = 121
        Height = 23
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
        IniKey = 'LIMIT_OHM_MAX'
        IniDataSource = INI
        MoveCursor = False
      end
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'LN-300A-G6'
    Left = 346
    Top = 3
  end
  object ZGPIBdevice: ZGPIBdevice
    GPIBaddr = 1
    DeviceName = 'DEV1'
    BufferSize = 10240
    Connected = False
    TimeOut = '0.5s'
    Left = 426
    Top = 196
  end
end
