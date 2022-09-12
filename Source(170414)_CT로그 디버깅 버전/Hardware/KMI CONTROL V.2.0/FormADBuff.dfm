object FrmADBuff: TFrmADBuff
  Left = 265
  Top = 50
  Width = 900
  Height = 702
  Caption = 'KMI GEN2 AD(E) TEST'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel10: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 664
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 882
      Height = 60
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label16: TLabel
        Left = 201
        Top = 13
        Width = 68
        Height = 14
        Caption = 'SampleRate '
      end
      object Label18: TLabel
        Left = 200
        Top = 37
        Width = 75
        Height = 14
        Caption = 'RecordCount '
      end
      object Label2: TLabel
        Left = 6
        Top = 13
        Width = 62
        Height = 14
        Caption = 'AD(E) Slot '
      end
      object Label1: TLabel
        Left = 380
        Top = 12
        Width = 41
        Height = 14
        Caption = 'Interval'
      end
      object Label3: TLabel
        Left = 18
        Top = 34
        Width = 43
        Height = 14
        Caption = 'Channel'
      end
      object Label5: TLabel
        Left = 364
        Top = 36
        Width = 56
        Height = 14
        Caption = 'Y Min/Max'
      end
      object Label6: TLabel
        Left = 460
        Top = 36
        Width = 9
        Height = 14
        Caption = '~'
      end
      object edtRecordCount: TEdit
        Left = 279
        Top = 33
        Width = 79
        Height = 22
        Color = 8404992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 0
        Text = '1000'
      end
      object cbBuffADSlot: ZIniComboBox
        Left = 66
        Top = 8
        Width = 127
        Height = 21
        Style = csDropDownList
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        SaveItems = False
        IniKey = 'ADESlot'
        IniDataSource = INI
      end
      object cbAutoRead: TCheckBox
        Left = 581
        Top = 4
        Width = 100
        Height = 17
        Caption = 'Continue Read'
        TabOrder = 2
        OnClick = cbAutoReadClick
      end
      object btnBuffRead: TXiButton
        Left = 581
        Top = 21
        Width = 97
        Height = 33
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
        TabOrder = 3
        OnClick = btnBuffReadClick
      end
      object edtSampleRate: TEdit
        Left = 279
        Top = 10
        Width = 79
        Height = 22
        Color = 8404992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 4
        Text = '100000'
      end
      object cbInterval: ZIniComboBox
        Left = 423
        Top = 9
        Width = 82
        Height = 22
        Style = csDropDownList
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 14
        TabOrder = 5
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10')
        SaveItems = False
        IniKey = 'Interval'
        IniDataSource = INI
      end
      object EditChannel: TEdit
        Left = 66
        Top = 32
        Width = 127
        Height = 22
        Color = 8404992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 6
        Text = '14,15,16'
      end
      object Ed_YMin: ZIniEdit
        Left = 423
        Top = 33
        Width = 34
        Height = 22
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 7
        Text = '-10'
        MoveCursor = False
      end
      object Ed_YMax: ZIniEdit
        Left = 472
        Top = 32
        Width = 34
        Height = 22
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 8
        Text = '10'
        MoveCursor = False
      end
      object BtnSetAxis: TXiButton
        Left = 509
        Top = 8
        Width = 52
        Height = 44
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
        Caption = 'SET'
        TabOrder = 9
        OnClick = BtnSetAxisClick
      end
    end
    object GraphBuf: TChart
      Left = 1
      Top = 61
      Width = 658
      Height = 583
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Color = clWhite
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Font.Height = -12
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Sampling 100K/s, RecordCount 1000')
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Grid.SmallDots = True
      BottomAxis.Maximum = 24.000000000000000000
      BottomAxis.MinorTickCount = 1
      BottomAxis.MinorTickLength = 3
      BottomAxis.TickLength = 7
      BottomAxis.Title.Caption = 'TIME [ms]'
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Grid.SmallDots = True
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      LeftAxis.MinorTickCount = 4
      LeftAxis.MinorTickLength = 5
      LeftAxis.TickLength = 10
      LeftAxis.Title.Caption = 'Level [V]'
      View3D = False
      Align = alClient
      BevelInner = bvLowered
      Color = clWhite
      TabOrder = 1
      PrintMargins = (
        15
        8
        15
        8)
      ColorPaletteIndex = 13
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
      object Series2: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 644
      Width = 882
      Height = 19
      Panels = <
        item
          Alignment = taCenter
          Width = 200
        end
        item
          Width = 100
        end>
    end
    object Panel1: TPanel
      Left = 659
      Top = 61
      Width = 224
      Height = 583
      Align = alRight
      TabOrder = 3
      DesignSize = (
        224
        583)
      object ValueListEditor: TValueListEditor
        Left = 8
        Top = 32
        Width = 209
        Height = 544
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        TitleCaptions.Strings = (
          'Items'
          'Value')
        ColWidths = (
          113
          90)
      end
      object BtnMeasure: TXiButton
        Left = 9
        Top = 6
        Width = 76
        Height = 24
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
        Caption = 'Measure'
        TabOrder = 1
        OnClick = BtnMeasureClick
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 450
    Top = 189
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'ADBUFF'
    Left = 410
    Top = 189
  end
end
