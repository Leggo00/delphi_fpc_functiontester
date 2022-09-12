object FrmTraceClient: TFrmTraceClient
  Left = 304
  Top = 244
  Width = 1083
  Height = 584
  Caption = 'KMI Traceablity Client Module'
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
  DesignSize = (
    1075
    550)
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1075
    Height = 30
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1075
      30)
    object dpbLabel1: TdpbLabel
      Left = 28
      Top = 8
      Width = 50
      Height = 14
      Caption = 'Server IP'
    end
    object dpbLabel2: TdpbLabel
      Left = 359
      Top = 8
      Width = 39
      Height = 14
      Caption = 'Station'
    end
    object Image7: TImage
      Left = 10
      Top = 7
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
      Left = 338
      Top = 8
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
    object Ed_IPAddr: ZIniEdit
      Left = 88
      Top = 4
      Width = 89
      Height = 22
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = '127.0.0.1'
      IniKey = 'IPAddr'
      IniDataSource = INI
      MoveCursor = False
    end
    object Ed_Station: ZIniEdit
      Left = 406
      Top = 5
      Width = 89
      Height = 22
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      IniKey = 'LineCode'
      IniDataSource = INI
      MoveCursor = False
    end
    object BtnConnect: TXiButton
      Left = 179
      Top = 2
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
      TabOrder = 2
      OnClick = BtnConnectClick
    end
    object BtnDisConnect: TXiButton
      Left = 256
      Top = 2
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
      Caption = 'DisConnect'
      TabOrder = 3
      OnClick = BtnDisConnectClick
    end
    object cbAutoConnect: ZIniCheckBox
      Left = 965
      Top = 8
      Width = 98
      Height = 17
      Anchors = [akRight]
      Caption = 'AutoConnect'
      TabOrder = 4
      IniKey = 'AutoConnect'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 531
    Width = 1075
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 300
      end
      item
        Width = 100
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 289
    Height = 488
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Function Test'
    TabOrder = 2
    DesignSize = (
      289
      488)
    object Label2: TLabel
      Left = 8
      Top = 29
      Width = 69
      Height = 14
      Caption = 'Function List'
    end
    object Label1: TLabel
      Left = 10
      Top = 71
      Width = 90
      Height = 14
      Caption = 'Input Parameter'
    end
    object Label3: TLabel
      Left = 8
      Top = 269
      Width = 48
      Height = 14
      Caption = 'OUTPUT'
    end
    object ValueListEditor: TValueListEditor
      Left = 8
      Top = 88
      Width = 273
      Height = 177
      DefaultRowHeight = 16
      TabOrder = 0
      TitleCaptions.Strings = (
        'Item'
        'Value')
      ColWidths = (
        110
        157)
    end
    object Cb_Cmd: TComboBox
      Left = 8
      Top = 48
      Width = 273
      Height = 23
      Style = csDropDownList
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 15
      ParentFont = False
      TabOrder = 1
      OnChange = Cb_CmdChange
      Items.Strings = (
        '01) GetServerTime'
        '02) CheckSNState'
        '03) CheckSNInfo'
        '04) CreateSerial'
        '05) UploadState'
        '06) UploadStateAndResult'
        '07) SetAttributeForSN'
        '08) GetAttributeForSN'
        '09) GetAttributeForVL'
        '10) UploadStationState'
        '11) ChangeSerial'
        '12) GetStationSetup'
        '13) SetWorkOrderPdCount'
        '14) GetWorkOrderPdCount'
        '15) ChangeModelCode')
    end
    object ValueListEditorOut: TValueListEditor
      Left = 8
      Top = 288
      Width = 273
      Height = 192
      Anchors = [akLeft, akTop, akBottom]
      DefaultRowHeight = 16
      TabOrder = 2
      TitleCaptions.Strings = (
        'Item'
        'Value')
      ColWidths = (
        110
        157)
    end
  end
  object BtnSend: TXiButton
    Left = 908
    Top = 38
    Width = 80
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
    Anchors = [akTop, akRight]
    Caption = 'Send'
    TabOrder = 3
    OnClick = BtnSendClick
  end
  object BtnExecute: TXiButton
    Left = 212
    Top = 59
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
    Caption = 'Execute'
    TabOrder = 4
    OnClick = BtnExecuteClick
  end
  object BtnClear: TXiButton
    Left = 988
    Top = 38
    Width = 80
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
    Anchors = [akTop, akRight]
    Caption = 'Clear'
    TabOrder = 5
    OnClick = BtnClearClick
  end
  object ListBoxLog: TListBox
    Left = 304
    Top = 71
    Width = 599
    Height = 451
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2010'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 6
  end
  object Panel2: TPanel
    Left = 910
    Top = 72
    Width = 158
    Height = 449
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 7
    object Label4: TLabel
      Left = 16
      Top = 40
      Width = 56
      Height = 14
      Caption = #51204#49569#44036#44201'  '
    end
    object Label5: TLabel
      Left = 16
      Top = 72
      Width = 83
      Height = 14
      Caption = 'SERIAL '#52488#44592#44050' '
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 129
      Height = 17
      Caption = #51088#46041#51204#49569#53580#49828#53944' '
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object Edit1: TEdit
      Left = 80
      Top = 32
      Width = 50
      Height = 22
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
      Text = '1000'
    end
    object Edit4: TEdit
      Left = 15
      Top = 112
      Width = 119
      Height = 22
      Enabled = False
      ImeName = 'Microsoft IME 2010'
      TabOrder = 2
    end
    object Edit2: ZIniEdit
      Left = 15
      Top = 88
      Width = 38
      Height = 22
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
      IniKey = 'FSerial'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit3: ZIniEdit
      Left = 55
      Top = 88
      Width = 78
      Height = 22
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
      IniKey = 'RSerial'
      IniDataSource = INI
      MoveCursor = False
    end
    object cbFrontCheck: ZIniCheckBox
      Left = 16
      Top = 149
      Width = 129
      Height = 17
      Caption = #51060#51204#44277#51221#52404#53356#47924#49884
      TabOrder = 5
      IniKey = 'FrontCheck'
      IniDataSource = INI
    end
  end
  object EditSendData: TEdit
    Left = 304
    Top = 40
    Width = 595
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    ImeName = 'Microsoft IME 2010'
    TabOrder = 8
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'ANDON_CLIENT'
    Left = 104
    Top = 240
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 5010
    OnConnecting = ClientSocketConnecting
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 144
    Top = 240
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 312
    Top = 80
  end
  object PopupMenu: TPopupMenu
    Left = 312
    Top = 152
    object LOGLISTCLEAR1: TMenuItem
      Caption = 'LOG LIST CLEAR'
      OnClick = LOGLISTCLEAR1Click
    end
  end
  object TimerConnect: TTimer
    Enabled = False
    OnTimer = TimerConnectTimer
    Left = 371
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 800
    Top = 208
  end
end
