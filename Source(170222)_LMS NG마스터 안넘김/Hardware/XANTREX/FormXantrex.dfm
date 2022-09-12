object FrmXantrex: TFrmXantrex
  Left = 539
  Top = 290
  BorderStyle = bsDialog
  Caption = 'XANTREX Power'
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
  object Label_Current: TdpbLabel
    Left = 208
    Top = 170
    Width = 110
    Height = 24
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0 mA '
    EdgeStyle = desSunken
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    Layout = tlCenter
    ParentFont = False
  end
  object Bitinitsend: TBitBtn
    Left = 209
    Top = 48
    Width = 110
    Height = 24
    Caption = #52488#44592'SETTING'
    TabOrder = 0
    OnClick = BitinitsendClick
  end
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
    TabOrder = 1
  end
  object BtnReset: TBitBtn
    Left = 208
    Top = 76
    Width = 110
    Height = 24
    Caption = 'RESET'
    TabOrder = 2
  end
  object BtnLocal: TBitBtn
    Left = 209
    Top = 107
    Width = 110
    Height = 24
    Caption = 'LOCAL MODE'
    TabOrder = 3
    OnClick = BtnLocalClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 41
    Align = alTop
    TabOrder = 4
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
  object GroupBox1: TGroupBox
    Left = 4
    Top = 48
    Width = 189
    Height = 145
    Caption = #52636#47141#51228#50612
    TabOrder = 5
    object Label2: TLabel
      Left = 43
      Top = 36
      Width = 24
      Height = 12
      Caption = #51204#50517
      Transparent = True
    end
    object Label3: TLabel
      Left = 43
      Top = 68
      Width = 24
      Height = 12
      Caption = #51204#47448
      Transparent = True
    end
    object BtnOn: TBitBtn
      Left = 16
      Top = 112
      Width = 73
      Height = 25
      Caption = 'ON'
      TabOrder = 0
      OnClick = BtnOnClick
    end
    object inputedit: ZIniEdit
      Left = 72
      Top = 32
      Width = 80
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Text = '0'
      IniKey = 'inputedit'
      IniDataSource = INI
      MoveCursor = False
    end
    object inputCURR: ZIniEdit
      Left = 72
      Top = 64
      Width = 80
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
      Text = '0'
      IniKey = 'inputCURR'
      IniDataSource = INI
      MoveCursor = False
    end
    object BtnOff: TBitBtn
      Left = 88
      Top = 112
      Width = 73
      Height = 25
      Caption = 'OFF'
      TabOrder = 3
      OnClick = BtnOffClick
    end
  end
  object BitBtn3: TBitBtn
    Left = 209
    Top = 139
    Width = 110
    Height = 24
    Caption = 'READ'
    TabOrder = 6
    OnClick = BitBtn3Click
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
    Left = 10
    Top = 201
    Width = 231
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 8
    IniKey = 'Edt_Send'
    IniDataSource = INI
    MoveCursor = False
  end
  object BitBtn2: TBitBtn
    Left = 249
    Top = 201
    Width = 70
    Height = 22
    Caption = 'SEND'
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 264
    Top = 8
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'XANTREX'
    Left = 296
    Top = 8
  end
  object TimerStart: TTimer
    Enabled = False
    Left = 120
    Top = 224
  end
end
