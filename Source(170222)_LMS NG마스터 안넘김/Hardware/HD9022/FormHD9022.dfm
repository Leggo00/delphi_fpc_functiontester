object FrmHD9022: TFrmHD9022
  Left = 551
  Top = 193
  BorderStyle = bsDialog
  Caption = 'HD 9022 Communication'
  ClientHeight = 233
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Temp: TdpbLabel
    Left = 72
    Top = 48
    Width = 209
    Height = 57
    Alignment = taCenter
    AutoSize = False
    Caption = '0.0'
    Color = clBlack
    EdgeStyle = desSunkenHeavy
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 4227327
    Font.Height = -48
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 70
    Width = 52
    Height = 13
    Caption = #54788#51116#50728#46020
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 285
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = #53685#49888#54252#53944
    end
    object BtnConnect: TSpeedButton
      Left = 160
      Top = 6
      Width = 79
      Height = 30
      AllowAllUp = True
      GroupIndex = 1
      Caption = #50672#44208
      OnClick = BtnConnectClick
    end
    object ComboBox_Port: ZIniComboBox
      Left = 66
      Top = 11
      Width = 90
      Height = 21
      Style = csDropDownList
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox_PortChange
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
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 214
    Width = 285
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object MemoRX: TMemo
    Left = 8
    Top = 144
    Width = 273
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    ParentFont = False
    TabOrder = 2
  end
  object Edit_TX: TEdit
    Left = 8
    Top = 112
    Width = 273
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    ParentFont = False
    TabOrder = 3
    OnKeyDown = Edit_TXKeyDown
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'HD9022'
    Left = 80
    Top = 168
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 40
    Top = 168
  end
  object TimerRead: TTimer
    Enabled = False
    OnTimer = TimerReadTimer
    Left = 120
    Top = 168
  end
end
