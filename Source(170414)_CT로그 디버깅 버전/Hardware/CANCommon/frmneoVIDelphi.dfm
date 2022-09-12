object FrmNeoVI: TFrmNeoVI
  Left = 715
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'neoVI Commnunication Module'
  ClientHeight = 529
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Label1: TLabel
    Left = 11
    Top = 202
    Width = 79
    Height = 12
    Caption = 'Rx Messages'
  end
  object Label2: TLabel
    Left = 314
    Top = 101
    Width = 34
    Height = 12
    Caption = 'Errors'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 46
    Height = 12
    Caption = 'Network'
  end
  object SpeedButton1: TSpeedButton
    Left = 504
    Top = 64
    Width = 73
    Height = 22
    Caption = #51204#49569
    OnClick = SpeedButton1Click
  end
  object Label12: TLabel
    Left = 144
    Top = 48
    Width = 72
    Height = 12
    Caption = 'Tx Message'
  end
  object lstMessages: TListBox
    Left = 0
    Top = 221
    Width = 588
    Height = 289
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
  end
  object lstErrors: TListBox
    Left = 310
    Top = 118
    Width = 273
    Height = 76
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
  end
  object cmdReadErrors: TButton
    Left = 479
    Top = 93
    Width = 107
    Height = 22
    Caption = 'Read Errors'
    TabOrder = 2
    OnClick = cmdReadErrorsClick
  end
  object lstTxNetwork: TComboBox
    Left = 8
    Top = 64
    Width = 129
    Height = 20
    Style = csDropDownList
    DropDownCount = 10
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 3
    Items.Strings = (
      'NETID_HSCAN'
      'NETID_MSCAN'
      'NETID_SWCAN'
      'NETID_LSFTCAN'
      'NETID_FORDSCP'
      'NETID_J1708'
      'NETID_AUX'
      'NETID_JVPW'
      'NETID_ISO')
  end
  object ListBoxBuff: TListBox
    Left = 8
    Top = 96
    Width = 297
    Height = 97
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 4
  end
  object Edit_Tx: TEdit
    Left = 144
    Top = 64
    Width = 353
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    ParentFont = False
    TabOrder = 5
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 510
    Width = 588
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = -488
    Top = 296
    Width = 569
    Height = 121
    TabOrder = 7
    Visible = False
    object Label4: TLabel
      Left = 200
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B1'
    end
    object Label5: TLabel
      Left = 232
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B2'
    end
    object Label6: TLabel
      Left = 272
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B3'
    end
    object Label7: TLabel
      Left = 312
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B4'
    end
    object Label8: TLabel
      Left = 352
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B5'
    end
    object Label9: TLabel
      Left = 384
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B6'
    end
    object Label10: TLabel
      Left = 424
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B7'
    end
    object Label11: TLabel
      Left = 464
      Top = 16
      Width = 14
      Height = 12
      Caption = 'B8'
    end
    object Label13: TLabel
      Left = 72
      Top = 16
      Width = 70
      Height = 12
      Caption = 'Arb ID (Hex)'
    end
    object Label14: TLabel
      Left = 152
      Top = 16
      Width = 33
      Height = 12
      Caption = 'Count'
    end
    object Label15: TLabel
      Left = 200
      Top = 56
      Width = 14
      Height = 12
      Caption = 'H1'
    end
    object Label16: TLabel
      Left = 240
      Top = 56
      Width = 14
      Height = 12
      Caption = 'H2'
    end
    object Label17: TLabel
      Left = 280
      Top = 56
      Width = 14
      Height = 12
      Caption = 'H3'
    end
    object Label18: TLabel
      Left = 152
      Top = 56
      Width = 33
      Height = 12
      Caption = 'Count'
    end
    object Label19: TLabel
      Left = 8
      Top = 72
      Width = 134
      Height = 12
      Caption = 'J1850 Header (Decimal)'
    end
    object Label20: TLabel
      Left = 19
      Top = 103
      Width = 55
      Height = 12
      Caption = 'Port Type'
    end
    object txtTxB1: TEdit
      Left = 192
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object txtTxB2: TEdit
      Left = 224
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object txtTxB3: TEdit
      Left = 264
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
    end
    object txtTxB4: TEdit
      Left = 304
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
    end
    object txtTxB5: TEdit
      Left = 344
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
    end
    object txtTxB6: TEdit
      Left = 376
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
    end
    object txtTxB7: TEdit
      Left = 416
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 6
    end
    object txtTxB8: TEdit
      Left = 456
      Top = 32
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 7
    end
    object txtArbID: TEdit
      Left = 72
      Top = 32
      Width = 44
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 8
      Text = '12'
    end
    object chkXtdID: TCheckBox
      Left = 361
      Top = 61
      Width = 58
      Height = 15
      Caption = 'Xtd'
      TabOrder = 9
    end
    object chkRtm: TCheckBox
      Left = 424
      Top = 61
      Width = 58
      Height = 15
      Caption = 'Rtm'
      TabOrder = 10
    end
    object lstDataBytesCount: TComboBox
      Left = 144
      Top = 32
      Width = 47
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 11
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
    object txtTxH1: TEdit
      Left = 192
      Top = 72
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 12
    end
    object txtTxH2: TEdit
      Left = 232
      Top = 72
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 13
    end
    object txtTxH3: TEdit
      Left = 272
      Top = 72
      Width = 31
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 14
    end
    object lstHeaderByteCount: TComboBox
      Left = 144
      Top = 72
      Width = 47
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 15
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object cmdTransmit: TButton
      Left = 488
      Top = 24
      Width = 70
      Height = 28
      Caption = 'Transmit'
      TabOrder = 16
      OnClick = cmdTransmitClick
    end
    object lstPortType: TComboBox
      Left = 94
      Top = 98
      Width = 99
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 17
      Text = 'RS232'
      Items.Strings = (
        'RS232'
        'USB')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 41
    Align = alTop
    TabOrder = 8
    object Label21: TLabel
      Left = 9
      Top = 15
      Width = 22
      Height = 12
      Caption = 'Port'
    end
    object Edit_Comport: ZIniSpinEdit
      Left = 39
      Top = 9
      Width = 66
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'Comport'
      IniDataSource = INI
    end
    object cmdOpen: TButton
      Left = 112
      Top = 5
      Width = 73
      Height = 30
      Caption = 'OPEN'
      TabOrder = 1
      OnClick = cmdOpenClick
    end
    object cmdClose: TButton
      Left = 185
      Top = 6
      Width = 84
      Height = 29
      Caption = 'CLOSE'
      Enabled = False
      TabOrder = 2
      OnClick = cmdCloseClick
    end
    object Button1: TButton
      Left = 497
      Top = 6
      Width = 84
      Height = 29
      Caption = #45803#44592
      Enabled = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object cmdClear: TButton
      Left = 298
      Top = 9
      Width = 72
      Height = 24
      Caption = 'Clear'
      TabOrder = 4
      OnClick = cmdClearClick
    end
  end
  object tmrReadneoVI: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrReadneoVITimer
    Left = 410
    Top = 17
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'NEOVI'
    Left = 64
    Top = 376
  end
end
