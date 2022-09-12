object FrmNI_Hardware: TFrmNI_Hardware
  Left = 191
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'NI BOARD HARDWARE TEST'
  ClientHeight = 699
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object XiPanel18: TXiPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 48
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csSilver
    FillDirection = fdVertical
    Align = alTop
    TabOrder = 0
    UseDockManager = True
    DesignSize = (
      1015
      48)
    object dpbLabel1: TdpbLabel
      Left = 849
      Top = 3
      Width = 157
      Height = 22
      Anchors = [akTop, akRight]
      Alignment = taRightJustify
      Caption = 'NI Hardware Test'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextStyle = dtsSunken
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 823
      Top = 26
      Width = 184
      Height = 6
      Anchors = [akTop, akRight]
      Shape = bsTopLine
    end
    object BtnFindHardware: TXiButton
      Left = 8
      Top = 7
      Width = 81
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
      Caption = #44160#49353
      TabOrder = 0
      Visible = False
      OnClick = BtnFindHardwareClick
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 56
    Width = 505
    Height = 329
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'ANALOG INPUT'
      object Label20: TLabel
        Left = 271
        Top = 2
        Width = 48
        Height = 12
        Caption = #52292#45328#47785#47197
      end
      object Label18: TLabel
        Left = 369
        Top = 106
        Width = 48
        Height = 12
        Caption = #48260#54140#45236#50857
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 13
        Width = 257
        Height = 276
        Caption = 'AI '#51077#47141' '#53580#49828#53944' (PCI-6071E)'
        TabOrder = 0
        object Label8: TLabel
          Left = 18
          Top = 25
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #51077#47141#52292#45328
        end
        object Label9: TLabel
          Left = 30
          Top = 51
          Width = 36
          Height = 12
          Alignment = taRightJustify
          Caption = #52292#45328#49688
        end
        object Label10: TLabel
          Left = 18
          Top = 75
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #45936#51060#53552#49688
        end
        object Label11: TLabel
          Left = 6
          Top = 101
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #49368#54540#47553#51452#44592
        end
        object Label12: TLabel
          Left = 159
          Top = 101
          Width = 23
          Height = 12
          Caption = 'KHz'
        end
        object Label14: TLabel
          Left = 6
          Top = 124
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #53944#47532#44144#49548#49828
        end
        object Label15: TLabel
          Left = 6
          Top = 148
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #53944#47532#44144#47112#48296
        end
        object Label2: TLabel
          Left = 6
          Top = 172
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #53944#47532#44144#47784#46300
        end
        object Label13: TLabel
          Left = 152
          Top = 49
          Width = 88
          Height = 12
          Caption = 'EX) Dev2/ao0:7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          ParentFont = False
        end
        object Edit_Dev2: ZIniEdit
          Left = 72
          Top = 24
          Width = 137
          Height = 20
          BiDiMode = bdLeftToRight
          ImeName = 'Microsoft IME 2003'
          ParentBiDiMode = False
          TabOrder = 0
          Text = 'Dev2/ai0:7'
          IniKey = 'Dev2'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_AI_Sampling: ZIniEdit
          Left = 72
          Top = 96
          Width = 81
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          Text = '1000'
          IniKey = 'Sampling2'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_AI_Channel: ZIniSpinEdit
          Left = 72
          Top = 48
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
          IniKey = 'ChNum2'
          IniDataSource = INI
        end
        object Edit_AI_DataCount: ZIniSpinEdit
          Left = 72
          Top = 72
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          IniKey = 'DataCount2'
          IniDataSource = INI
        end
        object Edit_Dev2Trigger: ZIniEdit
          Left = 72
          Top = 120
          Width = 81
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 4
          Text = 'ZIniEdit1'
          IniKey = 'TriggerSource2'
          IniDataSource = INI
          MoveCursor = False
        end
        object Rg_Trigger2: ZIniRadioGroup
          Left = 72
          Top = 168
          Width = 105
          Height = 57
          ItemIndex = 0
          Items.Strings = (
            'SOFT'
            'RISE'
            'FALL')
          TabOrder = 5
          IniKey = 'TriggerType'
          IniDataSource = INI
        end
        object Edit_TriggerLevel2: ZIniEdit
          Left = 72
          Top = 144
          Width = 81
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 6
          Text = '1000'
          IniKey = 'TriggerLevel2'
          IniDataSource = INI
          MoveCursor = False
        end
        object BtnReadAd: TXiButton
          Left = 64
          Top = 232
          Width = 81
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
          Caption = 'START'
          TabOrder = 7
          OnClick = BtnReadAdClick
        end
        object XiButton1: TXiButton
          Left = 24
          Top = 200
          Width = 81
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
          TabOrder = 8
          Visible = False
          OnClick = XiButton1Click
        end
        object Button1: TButton
          Left = 184
          Top = 120
          Width = 61
          Height = 25
          Caption = 'Button1'
          TabOrder = 9
          Visible = False
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 184
          Top = 144
          Width = 61
          Height = 25
          Caption = 'Button2'
          TabOrder = 10
          Visible = False
          OnClick = Button2Click
        end
        object BtnAdChReset: TBitBtn
          Left = 160
          Top = 230
          Width = 90
          Height = 18
          Caption = #52488#44592#54868
          TabOrder = 11
          OnClick = BtnAdChResetClick
        end
      end
      object CheckListBoxAD: TCheckListBox
        Left = 271
        Top = 16
        Width = 90
        Height = 273
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        Items.Strings = (
          'CH1'
          'CH2'
          'CH3'
          'CH4'
          'CH5')
        TabOrder = 1
        OnClick = CheckListBoxADClick
      end
      object MemoVal: TMemo
        Left = 368
        Top = 120
        Width = 121
        Height = 169
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        Lines.Strings = (
          '0 : 10.23'
          '1 :10.23'
          '2 :10.24')
        ParentFont = False
        TabOrder = 2
      end
      object ListBoxBuff: TListBox
        Left = 368
        Top = 16
        Width = 121
        Height = 81
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'ANALOG OUTPUT'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 8
        Top = 13
        Width = 497
        Height = 284
        Caption = 'AO '#52636#47141' '#53580#49828#53944' (PCI-6733)'
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 120
          Top = 19
          Width = 97
          Height = 26
          Caption = #53580#49828#53944' '#54028#54805
        end
        object Label4: TLabel
          Left = 26
          Top = 60
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #52636#47141#52292#45328
        end
        object Label5: TLabel
          Left = 38
          Top = 82
          Width = 36
          Height = 12
          Alignment = taRightJustify
          Caption = #52292#45328#49688
        end
        object Label6: TLabel
          Left = 26
          Top = 106
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #45936#51060#53552#49688
        end
        object Label7: TLabel
          Left = 14
          Top = 132
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #49368#54540#47553#51452#44592
        end
        object Label1: TLabel
          Left = 14
          Top = 156
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #53944#47532#44144#49548#49548
        end
        object Label16: TLabel
          Left = 14
          Top = 180
          Width = 60
          Height = 12
          Alignment = taRightJustify
          Caption = #53944#47532#44144#47112#48296
        end
        object Led1: TWolfImage
          Left = 355
          Top = 129
          Width = 16
          Height = 16
          UseOnOff = True
          ImageList = ImageList_Led
          ImageIndex = 1
          Interval = 0
          OnOff = False
          IndexOn = 1
          IndexOff = 0
        end
        object Label17: TLabel
          Left = 378
          Top = 132
          Width = 55
          Height = 12
          Caption = 'RUNNING'
        end
        object Label3: TLabel
          Left = 191
          Top = 133
          Width = 15
          Height = 12
          Caption = 'Hz'
        end
        object Edit_Dev1: ZIniEdit
          Left = 80
          Top = 56
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          Text = 'Edit_Dev1'
          IniKey = 'Dev1'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_Timing: ZIniEdit
          Left = 80
          Top = 128
          Width = 105
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          Text = '1000'
          IniKey = 'Sampling1'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_AOChCount: ZIniSpinEdit
          Left = 80
          Top = 80
          Width = 105
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 1
          IniKey = 'ChNum1'
          IniDataSource = INI
        end
        object Edit_AODataCount: ZIniSpinEdit
          Left = 80
          Top = 104
          Width = 105
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          IniKey = 'DataCount1'
          IniDataSource = INI
        end
        object RadioGroup1: TRadioGroup
          Left = 192
          Top = 200
          Width = 105
          Height = 73
          Caption = #52636#47141#54805#53468
          ItemIndex = 0
          Items.Strings = (
            #54620#48264
            #50672#49549)
          TabOrder = 4
        end
        object Edit_Dev1Trgger: ZIniEdit
          Left = 80
          Top = 152
          Width = 105
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 5
          Text = 'Edit_Dev1'
          IniKey = 'Dev1Trigger'
          IniDataSource = INI
          MoveCursor = False
        end
        object Rg_Trigger1: ZIniRadioGroup
          Left = 80
          Top = 200
          Width = 105
          Height = 73
          Caption = #53944#47532#44144#47784#46300
          ItemIndex = 0
          Items.Strings = (
            'SOFT'
            'RISE'
            'FALL')
          TabOrder = 6
          IniKey = 'TriggerType'
          IniDataSource = INI
        end
        object Edit_TriggerLevel1: ZIniEdit
          Left = 80
          Top = 176
          Width = 105
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 7
          Text = '1000'
          IniKey = 'TriggerLevel1'
          IniDataSource = INI
          MoveCursor = False
        end
        object ZIniEdit1: ZIniEdit
          Left = 192
          Top = 88
          Width = 273
          Height = 20
          BiDiMode = bdLeftToRight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = [fsBold]
          ImeName = 'Microsoft IME 2003'
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          MoveCursor = False
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'DIGITAL INPUT / OUTPUT'
      ImageIndex = 2
    end
  end
  object PageControl2: TPageControl
    Left = 520
    Top = 56
    Width = 489
    Height = 305
    ActivePage = TabSheet4
    TabOrder = 2
    object TabSheet4: TTabSheet
      Caption = 'GRAPH'
      object PaintBoxGraph: TWolfPaintBox
        Left = 0
        Top = 0
        Width = 481
        Height = 278
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548
        Font.Style = []
        Color = clGray
        ParentColor = False
        ParentFont = False
        OnPaint = PaintBoxGraphPaint
        DrawBackGround = False
      end
    end
  end
  object MemoDebug: TMemo
    Left = 8
    Top = 392
    Width = 505
    Height = 297
    Color = 8404992
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    ParentFont = False
    TabOrder = 3
  end
  object ChartAD: TChart
    Left = 520
    Top = 400
    Width = 489
    Height = 289
    BackWall.Brush.Color = clWhite
    BackWall.Color = clWhite
    Border.Visible = True
    Gradient.EndColor = clWhite
    Gradient.StartColor = 16765136
    LeftWall.Color = clWhite
    Legend.Alignment = laTop
    Legend.CheckBoxes = True
    Legend.ColorWidth = 15
    Legend.LegendStyle = lsSeries
    Legend.Symbol.Width = 15
    Legend.TopPos = 0
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 3
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'REVIEW')
    Title.Visible = False
    BottomAxis.ExactDateTime = False
    BottomAxis.Grid.Color = clSilver
    BottomAxis.Grid.SmallDots = True
    BottomAxis.Title.Caption = 'Time ['#13234']'
    BottomAxis.Title.Font.Charset = ANSI_CHARSET
    BottomAxis.Title.Font.Height = -12
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Color = clSilver
    LeftAxis.Grid.SmallDots = True
    LeftAxis.Maximum = 10.000000000000000000
    LeftAxis.Minimum = -10.000000000000000000
    LeftAxis.Title.Caption = 'Volt [V]'
    LeftAxis.Title.Font.Charset = ANSI_CHARSET
    LeftAxis.Title.Font.Height = -12
    LeftAxis.Title.Font.Style = [fsBold]
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    RightAxis.ExactDateTime = False
    RightAxis.Grid.Color = clWhite
    RightAxis.Grid.Visible = False
    RightAxis.Increment = 20.000000000000000000
    RightAxis.Maximum = 200.000000000000000000
    RightAxis.Title.Caption = #50728#46020' ('#8451')'
    RightAxis.Title.Font.Charset = HANGEUL_CHARSET
    RightAxis.Title.Font.Height = -12
    RightAxis.Title.Font.Name = #44404#47548
    View3D = False
    BevelOuter = bvNone
    Color = 14211288
    TabOrder = 4
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = clRed
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 520
    Top = 365
    Width = 489
    Height = 28
    TabOrder = 5
    object Label19: TLabel
      Left = 196
      Top = 9
      Width = 9
      Height = 12
      Caption = '~'
    end
    object edtFactor: ZIniEdit
      Left = 56
      Top = 5
      Width = 53
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      IniKey = 'edtFactor'
      IniDataSource = INI
      MoveCursor = False
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 8
      Width = 49
      Height = 17
      Caption = 'Filter'
      TabOrder = 1
    end
    object edtMin: ZIniEdit
      Left = 114
      Top = 5
      Width = 79
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
      IniKey = 'edtMin'
      IniDataSource = INI
      MoveCursor = False
    end
    object edtMax: ZIniEdit
      Left = 210
      Top = 5
      Width = 79
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      IniKey = 'edtMax'
      IniDataSource = INI
      MoveCursor = False
    end
    object Button3: TButton
      Left = 292
      Top = 4
      Width = 76
      Height = 20
      Caption = 'Yrange'
      TabOrder = 4
      OnClick = Button3Click
    end
    object cbData: TCheckBox
      Left = 376
      Top = 3
      Width = 49
      Height = 17
      Caption = 'data'
      TabOrder = 5
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'NI_TEST'
    Left = 208
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Left = 64
    Top = 448
  end
  object ImageList_Led: TImageList
    BlendColor = clBlack
    Left = 57
    Top = 585
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000040800000408000004080000040800000408000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004080
      FF004080FF004080FF004080FF004080FF004080FF0000408000004080000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF000040
      8000004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004080FF004080FF004080FF004080FF004080FF00004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF0000008400000084000000
      84000000840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      840000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000084840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000840000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000084848400848484008484
      8400C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00008484000084840000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00008484000084840000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000000000000848484008484
      8400C6C6C600C6C6C60084848400848484008484840084848400848484008484
      840084848400000000000000000000000000000000000000000000FF000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000840000000000000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000084000000000000000000000000000000000000FFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      0000008400000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      84000000840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F000000000000F81FF81FF81FF81FE007E007E007E007
      C003C003C003C003800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001800180018001800180018001C003C003C003C003
      E007E007E007E007F81FF81FF81FF81F00000000000000000000000000000000
      000000000000}
  end
end
