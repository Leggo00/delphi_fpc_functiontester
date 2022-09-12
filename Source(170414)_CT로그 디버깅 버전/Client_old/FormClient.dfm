object FrmClient: TFrmClient
  Left = 176
  Top = 217
  Width = 927
  Height = 485
  Caption = #53364#46972#51060#50616#53944
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 432
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 274
      Height = 422
      Align = alLeft
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object dpbLabel7: TdpbLabel
        Left = 14
        Top = 58
        Width = 131
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #9670' '#51204#49569#47700#49464#51648' '#51221#48372
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel3: TdpbLabel
        Left = 24
        Top = 108
        Width = 59
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #44277#51221#51221#48372
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel4: TdpbLabel
        Left = 71
        Top = 21
        Width = 60
        Height = 14
        Visible = False
        Alignment = taCenter
        AutoSize = False
        Caption = #47784#45944#51221#48372
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel5: TdpbLabel
        Left = 21
        Top = 156
        Width = 64
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #52769#51221#49884#44036
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel2: TdpbLabel
        Left = 23
        Top = 204
        Width = 60
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #52769#51221#44208#44284
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel11: TdpbLabel
        Left = 136
        Top = 156
        Width = 30
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = '['#52488']'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dpbLabel10: TdpbLabel
        Left = 17
        Top = 180
        Width = 71
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #51228#54408' '#49884#47532#50620
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lbLine: TdpbLabel
        Left = 24
        Top = 86
        Width = 59
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #46972#51064#51221#48372
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LedPass: TLed
        Left = 183
        Top = 310
        Width = 66
        Height = 13
        Alignment = laLeft
        Caption = 'PASS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LedWidth = 20
        OffColor = clBlack
      end
      object LedFail: TLed
        Left = 183
        Top = 323
        Width = 66
        Height = 13
        Alignment = laLeft
        Caption = 'FAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LedWidth = 20
        OffColor = clBlack
        OnColor = clRed
      end
      object LedACK: TLed
        Left = 183
        Top = 274
        Width = 53
        Height = 13
        Alignment = laLeft
        Caption = 'ACK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LedWidth = 20
        OffColor = clBlack
      end
      object LedNAK: TLed
        Left = 183
        Top = 287
        Width = 53
        Height = 13
        Alignment = laLeft
        Caption = 'NAK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LedWidth = 20
        OffColor = clBlack
        OnColor = clRed
      end
      object dpbLabel6: TdpbLabel
        Left = 24
        Top = 131
        Width = 59
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = #47784#45944#51221#48372
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object edtTacTime: TEdit
        Left = 90
        Top = 151
        Width = 43
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
        Text = '0'
      end
      object rbPass: TRadioButton
        Left = 91
        Top = 202
        Width = 50
        Height = 17
        Caption = 'PASS'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbFail: TRadioButton
        Left = 148
        Top = 202
        Width = 45
        Height = 17
        Caption = 'FAIL'
        TabOrder = 2
      end
      object edtSerial: TEdit
        Left = 90
        Top = 176
        Width = 160
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = '1234567890'
      end
      object Button4: TButton
        Left = 28
        Top = 241
        Width = 219
        Height = 27
        Hint = #46972#51064#51221#48372','#44277#51221#51221#48372','#47784#45944#51221#48372#44032' '#51200#51109#46121#45768#45796'.'
        Caption = #51221#48372#51200#51109
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Button4Click
      end
      object cbLineInfo: ZIniComboBox
        Left = 90
        Top = 81
        Width = 160
        Height = 21
        Style = csDropDownList
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        TabOrder = 5
        OnChange = cbLineInfoChange
        SaveItems = False
        IniKey = 'LineInfo'
        IniDataSource = INI
      end
      object cbOperInfo: ZIniComboBox
        Left = 90
        Top = 104
        Width = 160
        Height = 21
        Style = csDropDownList
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        TabOrder = 6
        SaveItems = False
        IniKey = 'OperInfo'
        IniDataSource = INI
      end
      object cbModelInfo: ZIniComboBox
        Left = 90
        Top = 128
        Width = 160
        Height = 21
        Style = csDropDownList
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        TabOrder = 7
        SaveItems = False
        IniKey = 'ModelInfo'
        IniDataSource = INI
      end
      object Button3: TButton
        Tag = 99
        Left = 28
        Top = 348
        Width = 221
        Height = 27
        Caption = #47784#45944#51221#48372#50836#52397
        TabOrder = 8
        OnClick = Button3Click
      end
      object edtModelResult: TEdit
        Left = 28
        Top = 379
        Width = 221
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 9
      end
      object Panel4: TPanel
        Left = 5
        Top = 5
        Width = 264
        Height = 41
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 10
        object btnConnect: TButton
          Left = 7
          Top = 7
          Width = 83
          Height = 25
          Caption = #50672#44208
          TabOrder = 0
          OnClick = btnConnectClick
        end
        object btnDisConnect: TButton
          Left = 90
          Top = 7
          Width = 83
          Height = 25
          Caption = #54644#51228
          TabOrder = 1
          OnClick = btnDisConnectClick
        end
        object btnDBSet: TButton
          Left = 173
          Top = 7
          Width = 83
          Height = 25
          Caption = 'DB'#49444#51221
          TabOrder = 2
          OnClick = btnDBSetClick
        end
      end
      object Button2: TButton
        Tag = 99
        Left = 28
        Top = 274
        Width = 145
        Height = 27
        Caption = #53580#49828#53944#44208#44284#51204#49569
        TabOrder = 11
        OnClick = Button2Click
      end
      object Button1: TButton
        Tag = 99
        Left = 28
        Top = 310
        Width = 145
        Height = 27
        Caption = #51060#51204#44277#51221' '#52404#53356
        TabOrder = 12
        OnClick = Button1Click
      end
      object cbSendModel: ZIniCheckBox
        Left = 26
        Top = 222
        Width = 79
        Height = 17
        Caption = #47784#45944#51204#49569
        TabOrder = 13
        IniKey = 'SendModel'
        IniDataSource = INI
      end
    end
    object Panel1: TPanel
      Left = 279
      Top = 5
      Width = 635
      Height = 422
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 633
        Height = 30
        Align = alTop
        TabOrder = 0
        object dpbLabel1: TdpbLabel
          Left = 9
          Top = 9
          Width = 131
          Height = 14
          AutoSize = False
          Caption = #9670' '#47700#49464#51648
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object btnClear: TButton
          Left = 532
          Top = 0
          Width = 101
          Height = 29
          Caption = #47700#49464#51648' '#53364#47532#50612
          TabOrder = 0
          OnClick = btnClearClick
        end
      end
      object lbProcesses: TListBox
        Left = 1
        Top = 31
        Width = 633
        Height = 390
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 919
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Alignment = taRightJustify
        Width = 120
      end
      item
        Alignment = taCenter
        Width = 300
      end
      item
        Alignment = taRightJustify
        Width = 100
      end>
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'Socket'
    Left = 445
    Top = 221
  end
  object IdTCPClient: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdTCPClientDisconnected
    OnConnected = IdTCPClientConnected
    Port = 0
    Left = 396
    Top = 228
  end
end
