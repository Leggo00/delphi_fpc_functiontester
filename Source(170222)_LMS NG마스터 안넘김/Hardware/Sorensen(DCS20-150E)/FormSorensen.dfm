object FrmSorensen: TFrmSorensen
  Left = 445
  Top = 348
  BorderStyle = bsDialog
  Caption = 'SORENSEN'
  ClientHeight = 370
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 5
    Top = 77
    Width = 90
    Height = 13
    Caption = 'RECEIVE DATA'
  end
  object Label6: TLabel
    Left = 5
    Top = 33
    Width = 72
    Height = 13
    Caption = 'SEND DATA'
  end
  object Label1: TLabel
    Left = 378
    Top = 4
    Width = 98
    Height = 13
    Caption = 'COMMAND LIST'
  end
  object Label2: TLabel
    Left = 376
    Top = 255
    Width = 59
    Height = 13
    Caption = 'VOLTAGE'
  end
  object Label3: TLabel
    Left = 376
    Top = 284
    Width = 61
    Height = 13
    Caption = 'CURRENT'
  end
  object SpeedButton1: TSpeedButton
    Left = 7
    Top = 315
    Width = 80
    Height = 32
    Caption = #49884#51089
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 87
    Top = 315
    Width = 80
    Height = 32
    Caption = #51221#51648
    OnClick = SpeedButton2Click
  end
  object dpbLabel2: TdpbLabel
    Left = 409
    Top = 318
    Width = 96
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'VOLTAGE'
    Color = 16744576
    EdgeStyle = desBump
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object dpbLabel1: TdpbLabel
    Left = 185
    Top = 318
    Width = 96
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'CURRENT'
    Color = 16744576
    EdgeStyle = desBump
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object lblCurrent: TdpbLabel
    Left = 279
    Top = 318
    Width = 120
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '0.000'
    Color = clWhite
    EdgeStyle = desSunkenHeavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object lblVoltage: TdpbLabel
    Left = 503
    Top = 318
    Width = 120
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '0.000'
    Color = clWhite
    EdgeStyle = desSunkenHeavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object chkConnectOnOff: TCheckBox
    Left = 109
    Top = 7
    Width = 87
    Height = 17
    Caption = 'CONNECT'
    TabOrder = 0
    OnClick = chkConnectOnOffClick
  end
  object cmbComPort: ZIniComboBox
    Left = 5
    Top = 5
    Width = 99
    Height = 23
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11'
      'COM12'
      'COM13'
      'COM14'
      'COM15'
      'COM16'
      'COM17'
      'COM18'
      'COM19'
      'COM20'
      'COM20'
      'COM21'
      'COM22'
      'COM23'
      'COM24'
      'COM25'
      'COM26'
      'COM27'
      'COM28'
      'COM29'
      'COM30')
    SaveItems = False
    IniKey = 'COMPORT'
    IniDataSource = INI
  end
  object BtnSend: TBitBtn
    Left = 296
    Top = 46
    Width = 74
    Height = 29
    Caption = #51204#49569
    TabOrder = 2
    OnClick = BtnSendClick
  end
  object BtnClear: TBitBtn
    Left = 296
    Top = 14
    Width = 74
    Height = 29
    Caption = #52488#44592#54868
    TabOrder = 3
    OnClick = BtnClearClick
  end
  object ListRx: TListBox
    Left = 5
    Top = 93
    Width = 365
    Height = 212
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 4
  end
  object edtSend: TEdit
    Left = 5
    Top = 49
    Width = 284
    Height = 21
    ImeName = #54620#44397#50612'('#54620#44544')'
    TabOrder = 5
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 351
    Width = 665
    Height = 19
    Panels = <>
  end
  object BitBtn1: TBitBtn
    Left = 583
    Top = 246
    Width = 74
    Height = 30
    Caption = #51204#50896'ON'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object edtVoltage: ZIniEdit
    Left = 443
    Top = 252
    Width = 136
    Height = 21
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 8
    IniKey = 'edtVoltage'
    IniDataSource = INI
    MoveCursor = False
  end
  object edtCurrent: ZIniEdit
    Left = 443
    Top = 281
    Width = 136
    Height = 21
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 9
    IniKey = 'edtCurrent'
    IniDataSource = INI
    MoveCursor = False
  end
  object edtCmdList: TListBox
    Left = 376
    Top = 19
    Width = 281
    Height = 222
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    ItemHeight = 13
    Items.Strings = (
      '*IDN?'
      'SYST:REM:STAT REM'
      'OUTP:PON:STAT ON'
      'OUTP:PON:STAT OFF'
      'OUTP ON'
      'OUTP OFF'
      ''
      'SYST:REM:SOUR {AVOL|ACUR|AVC}'
      'SOUR:VOLT 13.5'
      'SOUR:CURR 50'
      'SOUR:POW <power>'
      'SOUR:VOLT?'
      'SOUR:CURR?')
    TabOrder = 10
    OnDblClick = edtCmdListDblClick
  end
  object BitBtn2: TBitBtn
    Left = 583
    Top = 277
    Width = 74
    Height = 30
    Caption = #51204#50896'OFF'
    TabOrder = 11
    OnClick = BitBtn2Click
  end
  object Button1: TButton
    Left = 232
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 12
    OnClick = Button1Click
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'SORENSEN'
    Left = 11
    Top = 112
  end
  object Comm: TCommPortDriver
    ComPortSpeed = 19200
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 39
    Top = 112
  end
  object TimerRead: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerReadTimer
    Left = 67
    Top = 112
  end
end
