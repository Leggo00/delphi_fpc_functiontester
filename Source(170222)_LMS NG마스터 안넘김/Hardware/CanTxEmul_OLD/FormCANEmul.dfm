object FrmCANEmul: TFrmCANEmul
  Left = 539
  Top = 290
  BorderStyle = bsDialog
  Caption = 'CAN Emulator'
  ClientHeight = 416
  ClientWidth = 446
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
  PixelsPerInch = 96
  TextHeight = 12
  object MemoLog: TMemo
    Left = 8
    Top = 280
    Width = 433
    Height = 105
    Color = clBackground
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 446
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
    object BtnInit: TSpeedButton
      Left = 152
      Top = 8
      Width = 73
      Height = 25
      Caption = #50672#44208
      OnClick = BtnInitClick
    end
    object BtnClose: TSpeedButton
      Left = 224
      Top = 8
      Width = 73
      Height = 25
      Caption = #54644#51228
      OnClick = BtnCloseClick
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
    Top = 397
    Width = 446
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object BtnStop: TBitBtn
    Left = 83
    Top = 51
    Width = 70
    Height = 22
    Caption = 'STOP'
    TabOrder = 3
    OnClick = BtnStopClick
  end
  object BtnSend: TBitBtn
    Left = 11
    Top = 51
    Width = 70
    Height = 22
    Caption = 'SEND'
    TabOrder = 4
    OnClick = BtnSendClick
  end
  object MemoTx: TMemo
    Left = 8
    Top = 80
    Width = 433
    Height = 193
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      'CMD:31=06'
      'CMD:30=21 00 7E 00'
      'CMD:41=02 00 00 03 16 08 00 00 40 1F 1F 00 00 00 00 0A'
      'CMD:41=02 00 00 03 29 08 40 00 00 00 00 66 00 00 00 0A'
      'CMD:41=02 00 00 04 3F 08 00 05 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 02 00 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 02 01 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 02 02 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 02 03 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 01 60 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 02 91 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 04 33 08 00 00 00 00 00 00 00 00 00 0A'
      'CMD:41=02 00 00 01 65 08 00 00 00 00 00 00 00 00 00 0A'
      
        'CMD:42=02 00 00 01 65 08 00 00 00 00 00 00 00 00 00 0A 02 C2 30 ' +
        '04 00 00 00 0f 00 01 C4 38 08 00 00 00 00 00 00')
    ParentFont = False
    TabOrder = 5
    WordWrap = False
  end
  object Comm: TCommPortDriver
    ComPortSpeed = 115200
    LPTMode = False
    Left = 32
    Top = 240
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CAN_EMUL'
    Left = 64
    Top = 240
  end
  object TimerStart: TTimer
    Enabled = False
    Left = 112
    Top = 240
  end
end
