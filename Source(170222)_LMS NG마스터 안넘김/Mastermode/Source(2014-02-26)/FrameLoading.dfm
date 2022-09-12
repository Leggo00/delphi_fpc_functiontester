object FmeLoading: TFmeLoading
  Left = 0
  Top = 0
  Width = 628
  Height = 841
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnLoading: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 841
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BevelWidth = 2
    Caption = 'd'
    Color = 15987699
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 62
      Width = 620
      Height = 412
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 10
      BorderWidth = 2
      Caption = '`'
      Color = 15987699
      TabOrder = 0
      object GridList: TAdvStringGrid
        Left = 2
        Top = 2
        Width = 616
        Height = 408
        Cursor = crDefault
        Align = alClient
        ColCount = 6
        DefaultColWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        GridFixedLineColor = 13947601
        OnGetAlignment = GridListGetAlignment
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clBtnFace
        ActiveCellColorTo = clBtnFace
        ColumnHeaders.Strings = (
          'No.'
          'Step'
          'SubStep'
          'Spec'
          'Value'
          'Result')
        ControlLook.FixedGradientMirrorFrom = 16447735
        ControlLook.FixedGradientMirrorTo = 16052977
        ControlLook.FixedGradientHoverFrom = 16775139
        ControlLook.FixedGradientHoverTo = 16775139
        ControlLook.FixedGradientHoverMirrorFrom = 16772541
        ControlLook.FixedGradientHoverMirrorTo = 16508855
        ControlLook.FixedGradientDownFrom = 16377020
        ControlLook.FixedGradientDownTo = 16377020
        ControlLook.FixedGradientDownMirrorFrom = 16242317
        ControlLook.FixedGradientDownMirrorTo = 16109962
        ControlLook.FixedGradientDownBorder = 11440207
        Filter = <>
        FixedColWidth = 30
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        Look = glVista
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollBarAlways = saVert
        SearchFooter.Color = clBtnFace
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SelectionTextColor = clWhite
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        ColWidths = (
          30
          104
          161
          125
          109
          70)
        RowHeights = (
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22)
      end
    end
    object Panel5: TPanel
      Left = 4
      Top = 638
      Width = 620
      Height = 199
      Align = alBottom
      BevelOuter = bvNone
      Color = 15987699
      TabOrder = 1
      object pcStatus: TPageControl
        Left = 289
        Top = 0
        Width = 331
        Height = 199
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Status'
          DesignSize = (
            323
            170)
          object LbOptionModelName: TdpbLabel
            Left = 0
            Top = 0
            Width = 323
            Height = 170
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Color = clWhite
            EdgeStyle = desFlat
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #45208#45588#44256#46357' ExtraBold'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentColor = False
            ParentFont = False
          end
          object pnLamp: TXiPanel
            Left = 5
            Top = 4
            Width = 313
            Height = 162
            ColorFace = clGreen
            ColorGrad = 56576
            ColorLight = clSilver
            ColorDark = clSilver
            ColorScheme = csCustom
            FillDirection = fdVertical
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -40
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            UseDockManager = True
            object lbStatus: TdpbLabel
              Left = -7
              Top = -15
              Width = 328
              Height = 177
              Alignment = taCenter
              AutoSize = False
              Caption = 'READY'
              Color = clBlack
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Log'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object MemoLog: TMemo
            Left = 0
            Top = 0
            Width = 331
            Height = 170
            Align = alClient
            ImeName = 'Microsoft IME 2010'
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 289
        Height = 199
        Align = alLeft
        BevelOuter = bvNone
        Color = 15987699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 579
      Width = 620
      Height = 59
      Align = alClient
      BevelOuter = bvNone
      Color = 15987699
      TabOrder = 2
      object Panel4: TPanel
        Left = 290
        Top = 0
        Width = 337
        Height = 62
        BevelOuter = bvNone
        BevelWidth = 10
        TabOrder = 0
        object Panel12: TPanel
          Left = 169
          Top = 0
          Width = 169
          Height = 62
          Align = alLeft
          BevelInner = bvSpace
          BevelOuter = bvSpace
          TabOrder = 0
          object XiPanel16: TXiPanel
            Left = 2
            Top = 2
            Width = 165
            Height = 27
            ColorFace = clWhite
            ColorGrad = clSilver
            ColorLight = clSilver
            ColorDark = clSilver
            ColorScheme = csCustom
            FillDirection = fdVertical
            Align = alTop
            Caption = 'FAIL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            UseDockManager = True
            object SpeedButton2: TSpeedButton
              Left = 2
              Top = 3
              Width = 162
              Height = 23
              Flat = True
              OnClick = SpeedButton2Click
            end
          end
          object Count_Fail: ZIniSpinEdit
            Left = 1
            Top = 28
            Width = 166
            Height = 34
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxValue = 10000
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
            IniKey = 'TotalFail'
            IniDataSource = INI
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 169
          Height = 62
          Align = alLeft
          BevelInner = bvSpace
          BevelOuter = bvSpace
          TabOrder = 1
          object XiPanel1: TXiPanel
            Left = 2
            Top = 2
            Width = 165
            Height = 27
            ColorFace = clWhite
            ColorGrad = clSilver
            ColorLight = clSilver
            ColorDark = clSilver
            ColorScheme = csCustom
            FillDirection = fdVertical
            Align = alTop
            Caption = 'PASS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            UseDockManager = True
            object SpeedButton1: TSpeedButton
              Left = 2
              Top = 3
              Width = 162
              Height = 23
              Flat = True
              OnClick = SpeedButton1Click
            end
          end
          object Count_Pass: ZIniSpinEdit
            Left = 2
            Top = 28
            Width = 166
            Height = 34
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxValue = 10000
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
            IniKey = 'TotalPass'
            IniDataSource = INI
          end
        end
      end
    end
    object XiPanel19: TXiPanel
      Left = 4
      Top = 474
      Width = 620
      Height = 23
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' MESSAGE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      UseDockManager = True
    end
    object XiPanel4: TXiPanel
      Left = 4
      Top = 497
      Width = 620
      Height = 82
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csSilver
      FillDirection = fdVertical
      Align = alTop
      Caption = '`'
      TabOrder = 4
      UseDockManager = True
      DesignSize = (
        620
        82)
      object lbMessage: TdpbLabel
        Left = 4
        Top = 4
        Width = 612
        Height = 74
        Anchors = [akLeft, akRight]
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        EdgeStyle = desFlat
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowDepth = 0
        ShowAccelChar = False
        TextStyle = dtsShadow
      end
    end
    object XiPanel2: TXiPanel
      Left = 4
      Top = 4
      Width = 620
      Height = 35
      ColorFace = clSilver
      ColorGrad = 13001472
      ColorLight = 16757606
      ColorDark = 16757606
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Caption = 'Loading'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      UseDockManager = True
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 579
      Width = 283
      Height = 259
      Caption = 'IO Control'
      TabOrder = 6
      object GroupBox2: TGroupBox
        Left = 3
        Top = 13
        Width = 138
        Height = 244
        Caption = 'PLC => PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LED_Request: TLed
          Tag = 2
          Left = 10
          Top = 16
          Width = 121
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Scan Request'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_Vision_OK: TLed
          Tag = 2
          Left = 9
          Top = 42
          Width = 121
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Vision OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_Vision_NG: TLed
          Tag = 2
          Left = 9
          Top = 68
          Width = 121
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Vision NG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_Barcode_SP: TLed
          Tag = 2
          Left = 9
          Top = 92
          Width = 121
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Barcode SP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 142
        Top = 12
        Width = 138
        Height = 244
        Caption = 'PC => PLC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object LED_Trigger: TLed
          Tag = 2
          Left = 10
          Top = 17
          Width = 120
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Trigger'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_Barcode_OK: TLed
          Tag = 2
          Left = 10
          Top = 43
          Width = 120
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Barcode OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_Barcode_NG: TLed
          Tag = 2
          Left = 10
          Top = 69
          Width = 120
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Barcode NG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
        object LED_BARCDE_MODEL: TLed
          Tag = 2
          Left = 10
          Top = 93
          Width = 120
          Height = 23
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Caption = 'Barcode Model'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 15
          LedWidth = 15
          Margin = 4
          OffColor = 2510080
          PhongSize = 4
          OnClick = LED_RequestClick
        end
      end
    end
    object XiPanel3: TXiPanel
      Left = 4
      Top = 39
      Width = 620
      Height = 23
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' TEST DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      UseDockManager = True
      object XiButton1: TXiButton
        Left = 81
        Top = 3
        Width = 42
        Height = 16
        ColorFace = 16772829
        ColorGrad = 16758380
        ColorDark = 16754769
        ColorLight = 16772313
        ColorBorder = 11753728
        ColorText = clBlack
        OverColorFace = 16772055
        OverColorGrad = 16753478
        OverColorDark = 16752190
        OverColorLight = 16770250
        OverColorBorder = 11753728
        OverColorText = clBlack
        DownColorFace = 16757606
        DownColorGrad = 16764573
        DownColorDark = 16765864
        DownColorLight = 16752190
        DownColorBorder = 11753728
        DownColorText = clBlack
        DisabledColorFace = 15658734
        DisabledColorGrad = clWhite
        DisabledColorDark = 13816530
        DisabledColorLight = clWhite
        DisabledColorBorder = clGray
        DisabledColorText = clGray
        ColorFocusRect = 16755027
        ColorScheme = csNeoSky
        Layout = blGlyphLeft
        Spacing = 4
        TransparentGlyph = True
        Gradient = True
        HotTrack = True
        Caption = 'Edit'
        TabOrder = 0
        OnClick = XiButton1Click
      end
    end
  end
  object TimerRun: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerRunTimer
    Left = 90
    Top = 384
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'LOADING'
    Left = 80
    Top = 336
  end
end
