object FrmTRClient: TFrmTRClient
  Left = 314
  Top = 158
  BorderStyle = bsDialog
  Caption = 'TRACEABILITY CLIENT'
  ClientHeight = 490
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    598
    490)
  PixelsPerInch = 96
  TextHeight = 12
  object SpeedButton2: TSpeedButton
    Left = -20
    Top = 4
    Width = 89
    Height = 33
    Caption = #49325#51228
  end
  object SpeedButton4: TSpeedButton
    Left = 72
    Top = 4
    Width = 89
    Height = 33
    Caption = #51204#52404' '#49325#51228
    OnClick = SpeedButton4Click
  end
  object Label7: TLabel
    Left = 8
    Top = 298
    Width = 101
    Height = 12
    Caption = #51204#49569' '#45824#44592' '#47700#49464#51648
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnClear: TSpeedButton
    Left = 504
    Top = 292
    Width = 85
    Height = 24
    Caption = #51204#52404#49325#51228
    OnClick = BtnClearClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnConnect: TSpeedButton
      Left = 328
      Top = 4
      Width = 65
      Height = 33
      Caption = #51217#49549
      OnClick = BtnConnectClick
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 47
      Height = 12
      Caption = 'IP ADDR'
    end
    object Label_State: TdpbLabel
      Left = 472
      Top = 4
      Width = 117
      Height = 31
      Alignment = taCenter
      AutoSize = False
      Caption = #45824#44592#51473
      Color = clSilver
      EdgeStyle = desBump
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      ShadowColor = clBlack
      TextStyle = dtsShadow
    end
    object Label2: TLabel
      Left = 188
      Top = 16
      Width = 52
      Height = 12
      Caption = #44277#51221' '#48264#54840
    end
    object SpeedButton1: TSpeedButton
      Left = 392
      Top = 4
      Width = 65
      Height = 33
      Caption = #54644#51228
      OnClick = SpeedButton1Click
    end
    object Edit_IPAddr: ZIniEdit
      Left = 64
      Top = 12
      Width = 113
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = '192.168.1.1'
      IniKey = 'IPAddr'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_WorkNo: ZIniEdit
      Left = 244
      Top = 12
      Width = 77
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Text = 'Edit_WorkNo'
      IniKey = 'WorkNo'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 466
    Width = 598
    Height = 24
    Panels = <
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 200
      end>
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 450
    Width = 582
    Height = 10
    Max = 1000
    Smooth = True
    TabOrder = 2
  end
  object ListBoxLog: TListBox
    Left = 8
    Top = 322
    Width = 582
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
  end
  object ListBoxRx: TListBox
    Left = 8
    Top = 160
    Width = 581
    Height = 117
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
  end
  object Edit_Send: TEdit
    Left = 8
    Top = 128
    Width = 581
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 5
    OnKeyDown = Edit_SendKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 581
    Height = 77
    Caption = 'TEST'
    TabOrder = 6
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 65
      Height = 12
      Caption = 'COMMAND'
    end
    object Label4: TLabel
      Left = 132
      Top = 24
      Width = 68
      Height = 12
      Caption = 'SERIAL NO.'
    end
    object Label5: TLabel
      Left = 264
      Top = 24
      Width = 43
      Height = 12
      Caption = 'PARAM'
    end
    object BtnTest: TSpeedButton
      Left = 508
      Top = 24
      Width = 65
      Height = 37
      Caption = 'SEND'
      OnClick = BtnTestClick
    end
    object Label6: TLabel
      Left = 376
      Top = 24
      Width = 46
      Height = 12
      Caption = 'OPTION'
    end
    object Combo_Command: ZIniComboBox
      Left = 16
      Top = 40
      Width = 109
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        'CHECK'
        'TEST'
        'TIME'
        'STATUS'
        'MODEL')
      SaveItems = False
    end
    object Edit_Serial: TEdit
      Left = 132
      Top = 40
      Width = 125
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object ComboResult: ZIniComboBox
      Left = 264
      Top = 40
      Width = 109
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 2
      Items.Strings = (
        'PASS'
        'FAIL'
        'READY'
        'TEST')
      SaveItems = False
    end
    object Edit_Opt: TEdit
      Left = 376
      Top = 40
      Width = 125
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
    end
  end
  object CheckBox_AutoUpload: ZIniCheckBox
    Left = 130
    Top = 284
    Width = 129
    Height = 17
    Caption = #50672#44208#49884' '#51088#46041' '#50629#47196#46300
    TabOrder = 7
    IniKey = 'AutoUpload'
    IniDataSource = INI
  end
  object CheckBox_AutoConnect: TCheckBox
    Left = 328
    Top = 285
    Width = 121
    Height = 17
    Caption = #51217#49549' '#51088#46041#49884#46020
    TabOrder = 8
  end
  object Cb_UseUnloadFail: ZIniCheckBox
    Left = 130
    Top = 301
    Width = 185
    Height = 17
    Caption = #51204#49569#49892#54056#49884' '#51204#49569#45824#44592#47196' '#51060#46041
    TabOrder = 9
    IniKey = 'UseUploadFail'
    IniDataSource = INI
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'TRACE_CLIENT'
    Left = 96
    Top = 204
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 6010
    OnConnecting = ClientSocketConnecting
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 92
    Top = 348
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerCheckTimer
    Left = 240
    Top = 204
  end
  object TimerConnect: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerConnectTimer
    Left = 304
    Top = 200
  end
end
