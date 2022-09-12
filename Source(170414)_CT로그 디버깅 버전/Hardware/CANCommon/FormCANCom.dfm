object FrmCANCom: TFrmCANCom
  Left = 896
  Top = 350
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CAN Commnunication'
  ClientHeight = 512
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 30
    Top = 238
    Width = 107
    Height = 15
    Caption = 'RECEIVE MESSAGE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 30
    Top = 53
    Width = 118
    Height = 15
    Caption = 'TRANSMIT MESSAGE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image7: TImage
    Left = 9
    Top = 52
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9CE7C629C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A59CE7C6FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A57BE7C6DEEFE7ADEFFF7BE7C6
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A5DEEFE7FFFFFFFFFFFFDEEFE729C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A5DEEFE7FFFFFFFFFFFFDEEFE7
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A57BE7C6DEEFE7DEEFE77BE7C629C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF9CE7C629C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A59CE7C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Transparent = True
  end
  object Image1: TImage
    Left = 9
    Top = 237
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9CE7C629C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A59CE7C6FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A57BE7C6DEEFE7ADEFFF7BE7C6
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A5DEEFE7FFFFFFFFFFFFDEEFE729C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A5DEEFE7FFFFFFFFFFFFDEEFE7
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A57BE7C6DEEFE7DEEFE77BE7C629C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF29C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A529C6A5FFFFFFFFFFFFFFFFFFFFFFFF29C6A529C6A529C6
      A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A529C6A5FFFFFFFF
      FFFFFFFFFFFFFFFF9CE7C629C6A529C6A529C6A529C6A529C6A529C6A529C6A5
      29C6A529C6A529C6A59CE7C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Transparent = True
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 7
      Width = 73
      Height = 13
      Caption = 'Hardware Type'
    end
    object Label7: TLabel
      Left = 378
      Top = 6
      Width = 74
      Height = 13
      Caption = 'Baudrate(KBps)'
    end
    object LabelType: TLabel
      Left = 108
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Port/Type'
    end
    object Label11: TLabel
      Left = 331
      Top = 6
      Width = 39
      Height = 13
      Caption = 'Channel'
    end
    object Label10: TLabel
      Left = 460
      Top = 6
      Width = 26
      Height = 13
      Caption = 'Mask'
    end
    object Cb_BaudRate: ZIniComboBox
      Left = 376
      Top = 20
      Width = 73
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = '33.3'
      Items.Strings = (
        '33.3'
        '50'
        '83.3'
        '100'
        '125'
        '250'
        '500')
      SaveItems = False
      IniKey = 'BaudRate'
      IniDataSource = INI
    end
    object BtnOpenCAN: TXiButton
      Tag = 1
      Left = 544
      Top = 16
      Width = 65
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
      Caption = 'Open'
      TabOrder = 1
      OnClick = BtnOpenCANClick
    end
    object BtnCloseCAN: TXiButton
      Tag = 1
      Left = 608
      Top = 16
      Width = 65
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
      Caption = 'Close'
      TabOrder = 2
      OnClick = BtnCloseCANClick
    end
    object BtnClearCAN: TXiButton
      Left = 672
      Top = 16
      Width = 65
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
      Caption = 'Clear'
      TabOrder = 3
      OnClick = BtnClearCANClick
    end
    object Edit_Port: ZIniSpinEdit
      Left = 108
      Top = 22
      Width = 53
      Height = 22
      MaxValue = 999
      MinValue = 0
      TabOrder = 4
      Value = 1
      IniKey = 'Port'
      IniDataSource = INI
    end
    object BtnOpenDevice: TXiButton
      Tag = 1
      Left = 163
      Top = 16
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
      Caption = 'OpenDevice'
      TabOrder = 5
      OnClick = BtnOpenDeviceClick
    end
    object BtnCloseDevice: TXiButton
      Tag = 1
      Left = 245
      Top = 16
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
      Caption = 'CloseDevice'
      TabOrder = 6
      OnClick = BtnCloseDeviceClick
    end
    object Edit_Ch: ZIniSpinEdit
      Left = 331
      Top = 20
      Width = 45
      Height = 22
      MaxValue = 999
      MinValue = 0
      TabOrder = 7
      Value = 1
      IniKey = 'Channel'
      IniDataSource = INI
    end
    object ComboBox_CanType: ZIniComboBox
      Left = 8
      Top = 22
      Width = 97
      Height = 21
      Style = csDropDownList
      Enabled = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = 'KMI CAN'
      Items.Strings = (
        'KMI CAN'
        'VECTOR CAN')
      SaveItems = False
      IniKey = 'HwType'
      IniDataSource = INI
    end
    object Ed_Mask: ZIniEdit
      Left = 458
      Top = 20
      Width = 79
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 9
      IniKey = 'Mask'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 493
    Width = 782
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Disconnect'
        Width = 120
      end
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object ListViewRx1: TListView
    Left = 8
    Top = 256
    Width = 393
    Height = 232
    Columns = <
      item
        Caption = 'ID'
        Width = 60
      end
      item
        Caption = 'DATA'
        Width = 150
      end
      item
        Alignment = taRightJustify
        Caption = 'Cycle'
        Width = 55
      end
      item
        Alignment = taRightJustify
        Caption = 'Time (ms)'
        Width = 80
      end
      item
        Caption = 'Ch'
        Width = 30
      end>
    ColumnClick = False
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
  end
  object ListViewTx1: TListView
    Left = 8
    Top = 71
    Width = 393
    Height = 162
    Columns = <
      item
        Caption = 'ID'
        Width = 60
      end
      item
        Caption = 'DATA'
        Width = 150
      end
      item
        Alignment = taRightJustify
        Caption = 'Cycle'
        Width = 55
      end
      item
        Alignment = taRightJustify
        Caption = 'Time (ms)'
        Width = 80
      end
      item
        Caption = 'CH'
        Width = 30
      end>
    ColumnClick = False
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    SortType = stText
    TabOrder = 3
    ViewStyle = vsReport
  end
  object GroupBox1: TGroupBox
    Left = 408
    Top = 64
    Width = 369
    Height = 97
    Caption = 'SEND'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 36
      Height = 13
      Caption = 'CAN ID'
    end
    object Label3: TLabel
      Left = 66
      Top = 40
      Width = 21
      Height = 13
      Caption = 'DLC'
    end
    object Label5: TLabel
      Left = 112
      Top = 40
      Width = 178
      Height = 13
      Caption = 'D0    D1   D2   D3   D4   D5   D6   D7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 304
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Cycle (ms)'
    end
    object Edit_CanId: TEdit
      Left = 8
      Top = 56
      Width = 55
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 0
      Text = '100'
    end
    object Edit_D0: TEdit
      Left = 107
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      Text = '00'
    end
    object Edit_D2: TEdit
      Left = 155
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      Text = '00'
    end
    object Edit_D1: TEdit
      Left = 131
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      Text = '00'
    end
    object Edit_D4: TEdit
      Left = 203
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 4
      Text = '00'
    end
    object Edit_D3: TEdit
      Left = 179
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
      Text = '00'
    end
    object Edit_D5: TEdit
      Left = 227
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 6
      Text = '00'
    end
    object Edit_D6: TEdit
      Left = 251
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      Text = '00'
    end
    object Edit_D7: TEdit
      Left = 275
      Top = 56
      Width = 23
      Height = 21
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 2
      ParentFont = False
      TabOrder = 8
      Text = '00'
    end
    object ComboBox_dlc: TComboBox
      Left = 66
      Top = 56
      Width = 36
      Height = 21
      Style = csDropDownList
      DropDownCount = 9
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      ItemIndex = 8
      TabOrder = 9
      Text = '8'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
    end
    object BtnSend: TXiButton
      Left = 280
      Top = 11
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
      Caption = 'SEND'
      TabOrder = 10
      OnClick = BtnSendClick
    end
    object Cb_Cycle: ZIniComboBox
      Left = 303
      Top = 55
      Width = 57
      Height = 21
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = '0'
      Items.Strings = (
        '0'
        '10'
        '50'
        '100'
        '1000')
      SaveItems = False
      IniKey = 'CANSpeed'
      IniDataSource = INI
    end
  end
  object GroupBox2: TGroupBox
    Left = 408
    Top = 168
    Width = 369
    Height = 321
    Caption = 'READ'
    TabOrder = 5
    object Cb_ReadRepeat: ZIniCheckBox
      Left = 123
      Top = 22
      Width = 89
      Height = 17
      Caption = 'Read Repeat'
      TabOrder = 0
      OnClick = Cb_ReadRepeatClick
    end
    object BtnRead: TXiButton
      Tag = 1
      Left = 288
      Top = 16
      Width = 65
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
      Caption = 'Read'
      TabOrder = 1
      OnClick = BtnReadClick
    end
    object MemoLog: TMemo
      Left = 8
      Top = 72
      Width = 353
      Height = 241
      Color = 8404992
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      WordWrap = False
    end
    object Edit_Interval: ZIniSpinEdit
      Left = 216
      Top = 18
      Width = 65
      Height = 22
      MaxValue = 3000
      MinValue = 100
      TabOrder = 3
      Value = 100
      IniKey = 'ReadInterval'
      IniDataSource = INI
    end
    object Cb_Log: ZIniCheckBox
      Left = 10
      Top = 48
      Width = 79
      Height = 19
      Caption = 'Save Log'
      TabOrder = 4
      OnClick = Cb_LogClick
    end
    object Ed_LogFileName: TEdit
      Left = 82
      Top = 48
      Width = 279
      Height = 21
      Color = clBtnFace
      ImeName = 'Microsoft IME 2010'
      ReadOnly = True
      TabOrder = 5
    end
  end
  object BtnClearCANTx: TXiButton
    Tag = 1
    Left = 335
    Top = 51
    Width = 65
    Height = 18
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
    TabOrder = 6
    OnClick = BtnClearCANTxClick
  end
  object BtnClearCANRx: TXiButton
    Tag = 2
    Left = 335
    Top = 236
    Width = 65
    Height = 18
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
    TabOrder = 7
    OnClick = BtnClearCANRxClick
  end
  object TimerRead: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerReadTimer
    Left = 48
    Top = 144
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CAN'
    Left = 104
    Top = 144
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text Files(*.txt)|*.txt'
    Left = 512
    Top = 304
  end
end
