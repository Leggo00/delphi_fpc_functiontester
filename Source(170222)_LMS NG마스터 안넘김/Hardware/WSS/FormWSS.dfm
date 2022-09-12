object FrmWSS: TFrmWSS
  Left = 362
  Top = 337
  BorderStyle = bsDialog
  Caption = 'WSS SIMULATOR'
  ClientHeight = 324
  ClientWidth = 329
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object MemoRX: TMemo
    Left = 8
    Top = 226
    Width = 313
    Height = 73
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 152
      Top = 8
      Width = 73
      Height = 25
      Caption = #50672#44208
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 224
      Top = 8
      Width = 73
      Height = 25
      Caption = #54644#51228
      OnClick = SpeedButton2Click
    end
    object ComboBox_Port: ZIniComboBox
      Left = 64
      Top = 10
      Width = 81
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
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
        'COM20')
      SaveItems = False
      IniKey = 'COMBOBOX'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 305
    Width = 329
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Edt_Send: ZIniEdit
    Left = 4
    Top = 51
    Width = 231
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 3
    IniKey = 'Edt_Send'
    IniDataSource = INI
    MoveCursor = False
  end
  object BitBtn2: TBitBtn
    Left = 243
    Top = 51
    Width = 70
    Height = 22
    Caption = 'SEND'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 313
    Height = 137
    Caption = 'TEST'
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 224
      Top = 64
      Width = 73
      Height = 25
      Caption = #52488#44592#54868
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 224
      Top = 96
      Width = 73
      Height = 25
      Caption = #49444#51221
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object Rg_SmartMode: TRadioGroup
      Left = 24
      Top = 16
      Width = 81
      Height = 113
      Caption = 'Smart Mode'
      ItemIndex = 0
      Items.Strings = (
        '45us'
        '90us'
        '180us'
        '360us'
        '720us')
      TabOrder = 2
    end
    object Cb_SmartEnable: TCheckBox
      Left = 120
      Top = 24
      Width = 129
      Height = 17
      Caption = 'SMART MODE ON'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Cb_FL: TCheckBox
      Left = 120
      Top = 48
      Width = 63
      Height = 17
      Caption = 'FL'
      TabOrder = 4
    end
    object Cb_FR: TCheckBox
      Left = 120
      Top = 64
      Width = 63
      Height = 17
      Caption = 'FR'
      TabOrder = 5
    end
    object Cb_RL: TCheckBox
      Left = 120
      Top = 80
      Width = 63
      Height = 17
      Caption = 'RL'
      TabOrder = 6
    end
    object Cb_RR: TCheckBox
      Left = 120
      Top = 96
      Width = 63
      Height = 17
      Caption = 'RR'
      TabOrder = 7
    end
  end
  object Comm: TCommPortDriver
    ComPortSpeed = 115200
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 88
    Top = 248
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'WSS_Sim'
    Left = 120
    Top = 248
  end
end
