object FrmCANMonitor: TFrmCANMonitor
  Left = 148
  Top = 437
  Width = 418
  Height = 565
  Caption = 'CAN Monitor'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 29
    Align = alTop
    TabOrder = 0
    object Led_TX: TLed
      Left = 264
      Top = 2
      Width = 33
      Height = 12
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'TX'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      LedWidth = 12
      OffColor = clMaroon
      OnColor = clRed
    end
    object Label1: TLabel
      Left = 5
      Top = 7
      Width = 44
      Height = 13
      Caption = 'Baudrate'
    end
    object Led_RX: TLed
      Left = 264
      Top = 14
      Width = 33
      Height = 12
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'RX'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      LedWidth = 12
      OffColor = 16384
    end
    object BtnConnect: TXiButton
      Left = 92
      Top = 2
      Width = 62
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
    object BtnDisConnect: TXiButton
      Left = 153
      Top = 2
      Width = 62
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
      OnClick = BtnDisConnectClick
    end
    object XiButton1: TXiButton
      Left = 216
      Top = 2
      Width = 48
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
      Caption = 'H/W'
      TabOrder = 2
      OnClick = XiButton1Click
    end
    object Edit_Baudrate: ZIniEdit
      Left = 51
      Top = 3
      Width = 39
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
      Text = '500'
      IniKey = 'monitorBaudrate'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 402
    Height = 498
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    OnChange = PageControlChange
    object TabSheet1: TTabSheet
      Caption = 'Monitor'
      object TreeView: TTreeView
        Left = 0
        Top = 26
        Width = 394
        Height = 444
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        Indent = 19
        ParentFont = False
        PopupMenu = PopupMenuCanMonitor
        ReadOnly = True
        TabOrder = 0
        OnCustomDrawItem = TreeViewCustomDrawItem
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 394
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 5
          Top = 5
          Width = 66
          Height = 13
          Caption = 'CAN Message'
        end
        object BtnSend: TSpeedButton
          Left = 267
          Top = 3
          Width = 54
          Height = 22
          Caption = 'Send'
          OnClick = BtnSendClick
        end
        object BtnClearMonitor: TSpeedButton
          Left = 320
          Top = 3
          Width = 54
          Height = 22
          Caption = 'Clear'
          OnClick = BtnClearMonitorClick
        end
        object Edit_CanMsg: TEdit
          Left = 74
          Top = 3
          Width = 191
          Height = 21
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
        end
      end
      object Edit_DBCFile: ZIniEdit
        Left = 18
        Top = 36
        Width = 167
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
        Visible = False
        IniKey = 'DBC'
        IniDataSource = INI
        MoveCursor = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'CAN DB'
      ImageIndex = 1
      object TreeViewCanDB: TTreeView
        Left = 0
        Top = 26
        Width = 394
        Height = 444
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        HideSelection = False
        Indent = 19
        ParentFont = False
        PopupMenu = PopupMenuCanDB
        ReadOnly = True
        TabOrder = 0
        OnCustomDrawItem = TreeViewCanDBCustomDrawItem
        OnMouseDown = TreeViewCanDBMouseDown
        OnStartDrag = TreeViewCanDBStartDrag
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 394
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label_DBCFile: TLabel
          Left = 153
          Top = 7
          Width = 65
          Height = 13
          Caption = 'DBC Filename'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BtnOpenDBC: TSpeedButton
          Left = 4
          Top = 3
          Width = 78
          Height = 22
          Caption = 'OpenDBC'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF111FF111FFFFFFFF991FF991FFFFFFFF991FF991
            FFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7FFFFFF77777777777777FFFF7FFFF7FFF
            F7FFFFF7FFFF7FFFF7FFFF111FF111FF111FFF991FF991FF991FFF991FF991FF
            991FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = BtnOpenDBCClick
        end
        object BtnClearDBC: TSpeedButton
          Left = 82
          Top = 3
          Width = 63
          Height = 22
          Caption = 'ClearDBC'
          OnClick = BtnClearDBCClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Message Log'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 7
          Top = 6
          Width = 38
          Height = 13
          Caption = 'ID Filter'
        end
        object BtnIDAdd: TSpeedButton
          Tag = 1
          Left = 177
          Top = 2
          Width = 24
          Height = 24
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777777777777777777700000777777777770A220777777777770A22077
            7777777770A220777777700000A22000007770A222222222207770A222222222
            207770AAAAA22AAAA077700000A220000077777770A220777777777770A22077
            7777777770AAA077777777777000007777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnIDAddClick
        end
        object BtnIDDelete: TSpeedButton
          Tag = 2
          Left = 201
          Top = 2
          Width = 24
          Height = 24
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777770000000000000777091111111111077709111111111
            1077709999999999907770000000000000777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnIDDeleteClick
        end
        object Edit_Filter: TEdit
          Left = 128
          Top = 2
          Width = 48
          Height = 21
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
        end
        object StartLog: TXiButton
          Left = 255
          Top = 2
          Width = 66
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
          Caption = #44592#47197#49884#51089
          TabOrder = 1
          Visible = False
          OnClick = StartLogClick
        end
        object StopLog: TXiButton
          Left = 329
          Top = 2
          Width = 66
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
          Caption = #44592#47197#51473#51648
          TabOrder = 2
          Visible = False
          OnClick = StopLogClick
        end
        object ComboBox_Filter: TComboBox
          Left = 49
          Top = 2
          Width = 77
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 0
          TabOrder = 3
        end
      end
      object ListBoxLog: TListBox
        Left = 0
        Top = 26
        Width = 394
        Height = 444
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object TimerUpdate: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerUpdateTimer
    Left = 174
    Top = 96
  end
  object SaveDialog: TSaveDialog
    Left = 84
    Top = 149
  end
  object PopupMenuCanDB: TPopupMenu
    Left = 86
    Top = 205
    object CreateMessage1: TMenuItem
      Caption = 'Create Message'
      OnClick = CreateMessage1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Send1: TMenuItem
      Caption = 'Send Messages'
      OnClick = Send1Click
    end
    object Stop1: TMenuItem
      Caption = 'Stop Messsages'
      OnClick = Stop1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object FindSignal1: TMenuItem
      Caption = 'Find Signal'
      OnClick = FindSignal1Click
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CAN1'
    Left = 84
    Top = 269
  end
  object PopupMenuCanMonitor: TPopupMenu
    Left = 84
    Top = 93
    object MenuItem1: TMenuItem
      Caption = 'Create Message'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = 'Send Messages'
    end
    object MenuItem4: TMenuItem
      Caption = 'Stop Messsages'
    end
  end
end
