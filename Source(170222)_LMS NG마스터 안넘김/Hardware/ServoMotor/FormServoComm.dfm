object FrmServoComm: TFrmServoComm
  Left = 423
  Top = 115
  BorderStyle = bsDialog
  Caption = 'SERVO CONTROLLER'
  ClientHeight = 445
  ClientWidth = 326
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
  object Label12: TLabel
    Left = 7
    Top = 279
    Width = 72
    Height = 13
    Caption = 'SEND DATA'
  end
  object Label4: TLabel
    Left = 7
    Top = 359
    Width = 90
    Height = 13
    Caption = 'RECEIVE DATA'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 12
      Top = 18
      Width = 52
      Height = 13
      Caption = #53685#49888#54252#53944
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Combo_CommPort: ZIniComboBox
      Left = 76
      Top = 14
      Width = 82
      Height = 21
      Style = csDropDownList
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      TabOrder = 0
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
      IniKey = 'CommPort'
      IniDataSource = INI
    end
    object BtnConnect: TButton
      Left = 164
      Top = 5
      Width = 75
      Height = 38
      Caption = #50672#44208
      TabOrder = 1
      OnClick = BtnConnectClick
    end
    object BtnClose: TButton
      Left = 246
      Top = 5
      Width = 75
      Height = 38
      Caption = #45803#44592
      TabOrder = 2
      OnClick = BtnCloseClick
    end
  end
  object MemoTx: TMemo
    Left = 7
    Top = 292
    Width = 314
    Height = 62
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ParentFont = False
    TabOrder = 1
    WordWrap = False
  end
  object MemoRx: TMemo
    Left = 7
    Top = 372
    Width = 314
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ParentFont = False
    TabOrder = 2
    WordWrap = False
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 168
    Width = 314
    Height = 107
    Caption = #50948#52824#51228#50612
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 18
      Width = 99
      Height = 13
      Caption = 'POSITION (deg)'
    end
    object Label2: TLabel
      Left = 12
      Top = 61
      Width = 43
      Height = 13
      Caption = 'SPEED'
    end
    object Edit_Position: TEdit
      Left = 12
      Top = 34
      Width = 100
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544')'
      ParentFont = False
      TabOrder = 0
      Text = '360'
    end
    object Edit_Speed: TEdit
      Left = 12
      Top = 75
      Width = 100
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544')'
      ParentFont = False
      TabOrder = 1
      Text = '10'
    end
    object BtnSetPos: TButton
      Left = 121
      Top = 11
      Width = 90
      Height = 30
      Caption = 'SET POS'
      TabOrder = 2
      OnClick = BtnSetPosClick
    end
    object BtnGetPos: TButton
      Left = 121
      Top = 41
      Width = 90
      Height = 30
      Caption = 'GET POS'
      TabOrder = 3
      OnClick = BtnGetPosClick
    end
    object SpeedButton4: TButton
      Left = 213
      Top = 11
      Width = 90
      Height = 30
      Caption = 'HOME'
      TabOrder = 4
      OnClick = SpeedButton4Click
    end
    object SpeedButton1: TButton
      Left = 213
      Top = 41
      Width = 90
      Height = 30
      Caption = 'STOP'
      TabOrder = 5
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TButton
      Left = 213
      Top = 71
      Width = 90
      Height = 30
      Caption = 'RESET'
      TabOrder = 6
      OnClick = SpeedButton3Click
    end
  end
  object SpeedButton2: TButton
    Left = 435
    Top = 62
    Width = 90
    Height = 30
    Caption = 'SV ON'
    TabOrder = 4
    Visible = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton6: TButton
    Left = 435
    Top = 92
    Width = 90
    Height = 30
    Caption = 'SV OFF'
    TabOrder = 5
    Visible = False
    OnClick = SpeedButton6Click
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 53
    Width = 314
    Height = 107
    Caption = #49549#46020#51228#50612
    TabOrder = 6
    object Label3: TLabel
      Left = 12
      Top = 18
      Width = 29
      Height = 13
      Caption = 'RPM'
    end
    object Label5: TLabel
      Left = 12
      Top = 61
      Width = 39
      Height = 13
      Caption = 'Factor'
    end
    object Button1: TButton
      Left = 121
      Top = 11
      Width = 90
      Height = 30
      Caption = 'JOG FWD'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 121
      Top = 41
      Width = 90
      Height = 30
      Caption = 'JOG REV'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 120
      Top = 71
      Width = 90
      Height = 30
      Caption = 'STOP'
      TabOrder = 2
      OnClick = SpeedButton1Click
    end
    object edtRpm: ZIniSpinEdit
      Left = 12
      Top = 34
      Width = 100
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      IniKey = 'edtRpm'
      IniDataSource = INI
    end
    object Button4: TButton
      Left = 213
      Top = 11
      Width = 90
      Height = 30
      Caption = 'SV ON'
      TabOrder = 4
      OnClick = SpeedButton2Click
    end
    object Button5: TButton
      Left = 213
      Top = 41
      Width = 90
      Height = 30
      Caption = 'SV OFF'
      TabOrder = 5
      OnClick = SpeedButton6Click
    end
    object edtRpmFactor: ZIniEdit
      Left = 12
      Top = 75
      Width = 100
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 6
      IniKey = 'edtRpmFactor'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object Comm: TCommPortDriver
    ComPortDataBits = db7BITS
    ComPortParity = ptEVEN
    InputTimeout = 100
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 245
    Top = 130
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    Left = 276
    Top = 130
  end
end
