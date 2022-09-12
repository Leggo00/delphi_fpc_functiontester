object FrmHWMain: TFrmHWMain
  Left = -44
  Top = 279
  Width = 922
  Height = 657
  Caption = 'KMI System Gen2 Controller'
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 619
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object PageControl: TPageControl
      Left = 2
      Top = 43
      Width = 902
      Height = 555
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'STATION CONFIGURATION'
        object XiButton1: TXiButton
          Left = 8
          Top = 352
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
          Caption = 'LoadConfig'
          TabOrder = 0
        end
        object XiButton2: TXiButton
          Left = 88
          Top = 352
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
          Caption = 'SaveConfig'
          TabOrder = 1
        end
        object GridCfg: TAdvStringGrid
          Left = 0
          Top = 41
          Width = 692
          Height = 485
          Cursor = crDefault
          Align = alClient
          ColCount = 2
          DefaultColWidth = 100
          DefaultRowHeight = 20
          Enabled = False
          RowCount = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 2
          OnGetCellColor = GridCfgGetCellColor
          OnGetAlignment = GridCfgGetAlignment
          OnGetEditorType = GridCfgGetEditorType
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          Bands.PrimaryLength = 8
          Bands.SecondaryLength = 8
          ControlLook.FixedGradientHoverFrom = clGray
          ControlLook.FixedGradientHoverTo = clWhite
          ControlLook.FixedGradientDownFrom = clGray
          ControlLook.FixedGradientDownTo = clSilver
          ControlLook.DropDownAlwaysVisible = True
          Filter = <>
          FixedColWidth = 100
          FixedRowHeight = 20
          FixedFont.Charset = ANSI_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -12
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          MouseActions.DirectComboClose = True
          MouseActions.DirectComboDrop = True
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
          ShowSelection = False
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 894
          Height = 41
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 3
          object Label1: TLabel
            Left = 6
            Top = 13
            Width = 100
            Height = 14
            Caption = 'STATION COUNT '
          end
          object cbSetting: TCheckBox
            Left = 280
            Top = 11
            Width = 112
            Height = 17
            Caption = 'Change Setting'
            TabOrder = 0
            OnClick = cbSettingClick
          end
          object cbDebug: TCheckBox
            Left = 788
            Top = 14
            Width = 61
            Height = 14
            Caption = 'Debug'
            Checked = True
            State = cbChecked
            TabOrder = 1
            Visible = False
          end
          object Cb_AutoConnect: ZIniCheckBox
            Left = 392
            Top = 11
            Width = 129
            Height = 17
            Caption = 'Auto Reconnect'
            TabOrder = 2
            OnClick = Cb_AutoConnectClick
            IniKey = 'AutoReconnect'
            IniDataSource = INI
          end
          object cmbStationCount: ZIniComboBox
            Left = 108
            Top = 9
            Width = 71
            Height = 22
            Style = csDropDownList
            Enabled = False
            ImeName = 'Microsoft IME 2010'
            ItemHeight = 14
            TabOrder = 3
            OnChange = cmbStationCountChange
            Items.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4')
            SaveItems = False
            IniKey = 'StationCount'
            IniDataSource = INI
          end
          object BtnSetStation: TXiButton
            Left = 182
            Top = 7
            Width = 92
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
            Caption = 'Set Station'
            Enabled = False
            TabOrder = 4
            OnClick = BtnSetStationClick
          end
        end
        object Panel5: TPanel
          Left = 692
          Top = 41
          Width = 202
          Height = 485
          Align = alRight
          TabOrder = 4
          object Panel6: TPanel
            Left = 1
            Top = 1
            Width = 200
            Height = 29
            Align = alTop
            TabOrder = 0
            object Label12: TLabel
              Left = 16
              Top = 8
              Width = 161
              Height = 14
              Caption = 'Initialize the list of exceptions'
            end
          end
          object MemoExcept: TMemo
            Left = 1
            Top = 30
            Width = 200
            Height = 454
            Align = alClient
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ImeName = 'Microsoft Office IME 2007'
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'DATA DISPLAY / CONTROL'
        ImageIndex = 1
        object GridVal: TAdvStringGrid
          Left = 0
          Top = 41
          Width = 894
          Height = 485
          Cursor = crDefault
          Align = alClient
          ColCount = 20
          DefaultRowHeight = 18
          RowCount = 33
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          ParentFont = False
          ScrollBars = ssHorizontal
          TabOrder = 0
          OnMouseMove = GridValMouseMove
          OnGetCellColor = GridValGetCellColor
          OnGetAlignment = GridCfgGetAlignment
          OnDblClickCell = GridValDblClickCell
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          Bands.Active = True
          Bands.PrimaryLength = 8
          Bands.SecondaryColor = 11337211
          Bands.SecondaryLength = 8
          ControlLook.FixedGradientHoverFrom = clGray
          ControlLook.FixedGradientHoverTo = clWhite
          ControlLook.FixedGradientDownFrom = clGray
          ControlLook.FixedGradientDownTo = clSilver
          Filter = <>
          FixedRowHeight = 34
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
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
          ShowSelection = False
          RowHeights = (
            34
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
          object plScale: TPanel
            Left = 120
            Top = 224
            Width = 152
            Height = 225
            BevelInner = bvRaised
            Color = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = False
            object Label2: TLabel
              Left = 35
              Top = 70
              Width = 21
              Height = 14
              Alignment = taRightJustify
              Caption = 'MIN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clAqua
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 32
              Top = 95
              Width = 24
              Height = 14
              Alignment = taRightJustify
              Caption = 'MAX'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clAqua
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 28
              Top = 119
              Width = 28
              Height = 14
              Alignment = taRightJustify
              Caption = 'UNIT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clAqua
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 13
              Top = 167
              Width = 43
              Height = 14
              Alignment = taRightJustify
              Caption = 'OFFSET'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clAqua
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 21
              Top = 143
              Width = 35
              Height = 14
              Alignment = taRightJustify
              Caption = 'SCALE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clAqua
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 46
              Top = 26
              Width = 62
              Height = 14
              Alignment = taRightJustify
              Caption = 'Board No : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 34
              Top = 44
              Width = 74
              Height = 14
              Alignment = taRightJustify
              Caption = 'Channel No : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbBdNo: TLabel
              Left = 109
              Top = 26
              Width = 7
              Height = 14
              Alignment = taRightJustify
              Caption = '1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbChNo: TLabel
              Left = 109
              Top = 43
              Width = 7
              Height = 14
              Alignment = taRightJustify
              Caption = '1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 38
              Top = 8
              Width = 70
              Height = 14
              Alignment = taRightJustify
              Caption = 'Station No : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object LbSTNo: TLabel
              Left = 109
              Top = 8
              Width = 7
              Height = 14
              Alignment = taRightJustify
              Caption = '1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object LbADEBdNo: TLabel
              Left = 117
              Top = 73
              Width = 7
              Height = 14
              Alignment = taRightJustify
              Caption = '1'
              Visible = False
            end
            object BtnScaleOK: TButton
              Left = 6
              Top = 194
              Width = 70
              Height = 25
              Caption = 'OK'
              TabOrder = 0
              OnClick = BtnScaleOKClick
            end
            object BtnScaleClose: TButton
              Left = 76
              Top = 194
              Width = 70
              Height = 25
              Caption = 'CANCEL'
              TabOrder = 1
              OnClick = BtnScaleCloseClick
            end
            object EditMin: TEdit
              Left = 64
              Top = 67
              Width = 77
              Height = 22
              ImeName = 'Microsoft IME 2010'
              TabOrder = 2
            end
            object EditMax: TEdit
              Left = 64
              Top = 91
              Width = 77
              Height = 22
              ImeName = 'Microsoft IME 2010'
              TabOrder = 3
            end
            object EditUnit: TEdit
              Left = 64
              Top = 115
              Width = 77
              Height = 22
              ImeName = 'Microsoft IME 2010'
              TabOrder = 4
            end
            object EditOffset: TEdit
              Left = 64
              Top = 163
              Width = 77
              Height = 22
              ImeName = 'Microsoft IME 2010'
              TabOrder = 5
            end
            object EditScale: TEdit
              Left = 64
              Top = 139
              Width = 77
              Height = 22
              ImeName = 'Microsoft IME 2010'
              TabOrder = 6
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 894
          Height = 41
          Align = alTop
          TabOrder = 1
          object Label11: TLabel
            Left = 400
            Top = 16
            Width = 91
            Height = 14
            Caption = 'Update rate(ms)'
          end
          object Rg_Display: TRadioGroup
            Left = 3
            Top = 3
            Width = 289
            Height = 32
            Caption = 'Display Item'
            Columns = 5
            ItemIndex = 0
            Items.Strings = (
              'Value'
              'Min'
              'Max'
              'Scale'
              'Offset')
            TabOrder = 0
          end
          object BtnSetScale: TXiButton
            Left = 296
            Top = 8
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
            Caption = 'Set Scale'
            TabOrder = 1
            OnClick = BtnSetScaleClick
          end
          object Ed_UpdateRate: ZIniSpinEdit
            Left = 496
            Top = 11
            Width = 65
            Height = 23
            MaxValue = 99999
            MinValue = 10
            TabOrder = 2
            Value = 10
            IniKey = 'UpdateRate'
            IniDataSource = INI
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'LOG'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 894
          Height = 33
          Align = alTop
          TabOrder = 0
          object Label10: TLabel
            Left = 640
            Top = 3
            Width = 45
            Height = 14
            Caption = 'IGN OFF'
          end
          object edtIGNResource: ZIniEdit
            Left = 696
            Top = 3
            Width = 121
            Height = 22
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 0
            Text = 'edtIGNResource'
            IniKey = 'edtIGNResource'
            IniDataSource = INI
            MoveCursor = False
          end
          object BtnClearLog: TXiButton
            Left = 2
            Top = 4
            Width = 92
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
            Caption = 'Clear Log'
            TabOrder = 1
            OnClick = BtnClearLogClick
          end
          object cbLogSave: TCheckBox
            Left = 103
            Top = 7
            Width = 70
            Height = 17
            Caption = 'Save Log '
            TabOrder = 2
            OnClick = cbLogSaveClick
          end
        end
        object MemoLog: TMemo
          Left = 0
          Top = 33
          Width = 894
          Height = 493
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
    object XiPanel1: TXiPanel
      Left = 2
      Top = 2
      Width = 902
      Height = 41
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csSilver
      FillDirection = fdVertical
      Align = alTop
      TabOrder = 1
      UseDockManager = True
      object BtnConnect: TXiButton
        Left = 8
        Top = 8
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
        Caption = 'Connect'
        TabOrder = 0
        OnClick = BtnConnectClick
      end
      object BtnDisconnect: TXiButton
        Left = 80
        Top = 8
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
        Caption = 'Disconnect'
        TabOrder = 1
        OnClick = BtnDisconnectClick
      end
      object BtnInitial: TXiButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
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
        Caption = 'Initialize'
        TabOrder = 2
        OnClick = BtnInitialClick
      end
      object BtnADBuff: TXiButton
        Left = 328
        Top = 8
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
        Caption = 'ADBuffer'
        TabOrder = 3
        OnClick = BtnADBuffClick
      end
      object Button1: TButton
        Left = 544
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 4
        Visible = False
      end
    end
    object StatusBar: TStatusBar
      Left = 2
      Top = 598
      Width = 902
      Height = 19
      Panels = <
        item
          Alignment = taCenter
          Width = 100
        end
        item
          Alignment = taCenter
          Width = 100
        end
        item
          Alignment = taCenter
          Width = 100
        end
        item
          Alignment = taCenter
          Width = 100
        end
        item
          Alignment = taCenter
          Width = 100
        end>
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'HW_MAIN'
    Left = 118
    Top = 149
  end
  object TimerDisplay: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerDisplayTimer
    Left = 236
    Top = 185
  end
  object TimerConnect: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerConnectTimer
    Left = 310
    Top = 187
  end
end
