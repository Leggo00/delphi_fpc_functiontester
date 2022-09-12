object FrmCanDiag: TFrmCanDiag
  Left = 376
  Top = 161
  Width = 580
  Height = 724
  Caption = 'CAN Diagonosis Function'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    564
    686)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 63
    Width = 553
    Height = 89
    Caption = 'CAN DIAG'
    TabOrder = 0
    object Label3: TLabel
      Left = 9
      Top = 34
      Width = 30
      Height = 11
      Caption = 'SEND'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 58
      Width = 31
      Height = 11
      Caption = 'READ'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 45
      Top = 18
      Width = 38
      Height = 11
      Caption = 'CAN ID'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 145
      Top = 18
      Width = 56
      Height = 11
      Caption = 'MESSAGE'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 120
      Top = 18
      Width = 20
      Height = 11
      Caption = 'Len'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object BtnSendCommand: TSpeedButton
      Left = 492
      Top = 29
      Width = 50
      Height = 48
      Caption = 'SEND'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnSendCommandClick
    end
    object Edit_TxID: ZIniEdit
      Left = 41
      Top = 30
      Width = 72
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 0
      Text = '000'
      IniKey = 'ReqCanID'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_RxID: ZIniEdit
      Left = 41
      Top = 54
      Width = 72
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
      Text = '000'
      IniKey = 'ResCanID'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_TxMsg: ZIniEdit
      Left = 144
      Top = 30
      Width = 345
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 2
      MoveCursor = False
    end
    object Edit_RxMsg: ZIniEdit
      Left = 144
      Top = 54
      Width = 345
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      MoveCursor = False
    end
    object Edit_TxLen: ZIniEdit
      Left = 115
      Top = 30
      Width = 28
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '00'
      MoveCursor = False
    end
    object Edit_RxLen: ZIniEdit
      Left = 115
      Top = 54
      Width = 28
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '00'
      MoveCursor = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 665
    Width = 564
    Height = 21
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object PageControl: TPageControl
    Left = 7
    Top = 153
    Width = 555
    Height = 509
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Message Log'
      object Memo: TMemo
        Left = 0
        Top = 25
        Width = 547
        Height = 456
        Align = alClient
        Color = 8404992
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 547
        Height = 25
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object CheckBox_ViewAll: TCheckBox
          Left = 73
          Top = 4
          Width = 105
          Height = 17
          Caption = 'View CAN Data'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox_ViewAllClick
        end
        object Cb_ViewPresent: ZIniCheckBox
          Left = 247
          Top = 4
          Width = 121
          Height = 17
          Caption = 'View Present Code'
          TabOrder = 1
        end
        object Cb_IDFilter: TCheckBox
          Left = 175
          Top = 4
          Width = 66
          Height = 17
          Caption = 'ID Filter'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
          OnClick = Cb_IDFilterClick
        end
        object BtnClear: TXiButton
          Tag = 1
          Left = 2
          Top = 1
          Width = 63
          Height = 22
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
          Caption = 'Clear'
          TabOrder = 3
          OnClick = BtnClearClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configuration'
      ImageIndex = 1
      object SpeedButton1: TSpeedButton
        Left = 7
        Top = 189
        Width = 90
        Height = 28
        Caption = 'CAN'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 529
        Height = 177
        Caption = 'FUNCTION'
        TabOrder = 0
        object Label5: TLabel
          Left = 24
          Top = 28
          Width = 115
          Height = 13
          Caption = 'StartDiagonosticSession'
        end
        object Label6: TLabel
          Left = 24
          Top = 52
          Width = 115
          Height = 13
          Caption = 'StopDiagonosticSession'
        end
        object Label8: TLabel
          Left = 336
          Top = 28
          Width = 57
          Height = 13
          Caption = 'TestPresent'
        end
        object Label9: TLabel
          Left = 288
          Top = 52
          Width = 106
          Height = 13
          Caption = 'TestPresent Interval(s)'
        end
        object Label12: TLabel
          Left = 328
          Top = 92
          Width = 67
          Height = 13
          Caption = 'Security Level'
        end
        object SpeedButton2: TSpeedButton
          Left = 454
          Top = 134
          Width = 59
          Height = 23
          Caption = 'LOG'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object Edit_StartDiag: ZIniEdit
          Left = 148
          Top = 24
          Width = 109
          Height = 23
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 0
          Text = '00 00'
          IniKey = 'StartDiagonosticSession'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_StopDiag: ZIniEdit
          Left = 148
          Top = 48
          Width = 109
          Height = 23
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 1
          Text = '000'
          IniKey = 'StopDiagonosticSession'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_Present: ZIniEdit
          Left = 404
          Top = 24
          Width = 109
          Height = 23
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 2
          Text = '000'
          IniKey = 'TesterPresent'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_PresentInterval: ZIniEdit
          Left = 404
          Top = 48
          Width = 109
          Height = 23
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 3
          Text = '000'
          IniKey = 'TesterPresentInterval'
          IniDataSource = INI
          MoveCursor = False
        end
        object Edit_SecurityLevel: ZIniEdit
          Left = 404
          Top = 88
          Width = 109
          Height = 23
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 4
          Text = '000'
          IniKey = 'SecurityLevel'
          IniDataSource = INI
          MoveCursor = False
        end
        object Cb_UseRandomKey: ZIniCheckBox
          Left = 24
          Top = 104
          Width = 113
          Height = 17
          Caption = 'Use Random Key'
          TabOrder = 5
          IniKey = 'UseRandomKey'
          IniDataSource = INI
        end
        object Ed_LogFileName: ZIniEdit
          Left = 104
          Top = 134
          Width = 345
          Height = 21
          ImeName = 'Microsoft IME 2003'
          ReadOnly = True
          TabOrder = 6
          MoveCursor = False
        end
        object Cb_SaveLog: TCheckBox
          Left = 24
          Top = 136
          Width = 66
          Height = 17
          Caption = 'Save Log'
          TabOrder = 7
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 62
    Align = alTop
    TabOrder = 3
    object BtnStartDiag: TXiButton
      Tag = 1
      Left = 3
      Top = 4
      Width = 81
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
      Caption = 'StartDiag'
      TabOrder = 0
      OnClick = BtnStartDiagClick
    end
    object BtnStopDiag: TXiButton
      Tag = 1
      Left = 83
      Top = 4
      Width = 81
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
      Caption = 'StopDiag'
      TabOrder = 1
      OnClick = BtnStopDiagClick
    end
    object BtnSecurity: TXiButton
      Tag = 1
      Left = 168
      Top = 4
      Width = 81
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
      Caption = 'Security Access'
      TabOrder = 2
      OnClick = BtnSecurityClick
    end
    object BtnTesterPresent: TXiButton
      Tag = 1
      Left = 3
      Top = 28
      Width = 81
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
      Caption = 'TesterPresent'
      TabOrder = 3
      Visible = False
      OnClick = BtnTesterPresentClick
    end
    object BtnDiableNormalMessage: TXiButton
      Tag = 1
      Left = 86
      Top = 28
      Width = 128
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
      Caption = 'DiableNormaMessage'
      TabOrder = 4
      Visible = False
      OnClick = BtnDiableNormalMessageClick
    end
    object XiButton1: TXiButton
      Left = 252
      Top = 4
      Width = 70
      Height = 25
      ColorFace = 13036799
      ColorGrad = 3653375
      ColorDark = 40168
      ColorLight = 12183551
      ColorBorder = 22144
      ColorText = clBlack
      OverColorFace = 11790335
      OverColorGrad = 41968
      OverColorDark = 36562
      OverColorLight = 9820927
      OverColorBorder = 22144
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = 7852799
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = 28838
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 4227327
      ColorScheme = csNeoDesert
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Motor Init'
      ModalResult = 1
      TabOrder = 5
      OnClick = XiButton1Click
    end
    object XiButton2: TXiButton
      Left = 325
      Top = 4
      Width = 70
      Height = 25
      ColorFace = 13036799
      ColorGrad = 3653375
      ColorDark = 40168
      ColorLight = 12183551
      ColorBorder = 22144
      ColorText = clBlack
      OverColorFace = 11790335
      OverColorGrad = 41968
      OverColorDark = 36562
      OverColorLight = 9820927
      OverColorBorder = 22144
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = 7852799
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = 28838
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 4227327
      ColorScheme = csNeoDesert
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Motor (+)'
      ModalResult = 1
      TabOrder = 6
      OnClick = XiButton2Click
    end
    object XiButton3: TXiButton
      Left = 398
      Top = 4
      Width = 70
      Height = 25
      ColorFace = 13036799
      ColorGrad = 3653375
      ColorDark = 40168
      ColorLight = 12183551
      ColorBorder = 22144
      ColorText = clBlack
      OverColorFace = 11790335
      OverColorGrad = 41968
      OverColorDark = 36562
      OverColorLight = 9820927
      OverColorBorder = 22144
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = 7852799
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = 28838
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 4227327
      ColorScheme = csNeoDesert
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Motor (-)'
      ModalResult = 1
      TabOrder = 7
      OnClick = XiButton3Click
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirAbsolute
    IniFileName = 'CONFIG.INI'
    IniSection = 'DIAG'
    Left = 208
    Top = 263
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 248
    Top = 263
  end
  object TimerTestPresent: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerTestPresentTimer
    Left = 296
    Top = 263
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'log'
    Filter = 'Text Log Files(*.log)|*.log|All Files(*.*)|*.*'
    Left = 160
    Top = 263
  end
end
