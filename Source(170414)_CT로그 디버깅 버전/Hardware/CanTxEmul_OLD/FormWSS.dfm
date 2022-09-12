object FrmCANEmul: TFrmCANEmul
  Left = 539
  Top = 290
  BorderStyle = bsDialog
  Caption = 'CAN EMULATOR'
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
  object Comm: TCommPortDriver
    ComPortSpeed = 19200
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 264
    Top = 8
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'XFR_POWER'
    Left = 296
    Top = 8
  end
  object TimerStart: TTimer
    Enabled = False
    Left = 120
    Top = 224
  end
end
