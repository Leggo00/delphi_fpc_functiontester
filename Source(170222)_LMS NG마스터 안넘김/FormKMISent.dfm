object FrmKMISent: TFrmKMISent
  Left = 523
  Top = 238
  BorderStyle = bsDialog
  Caption = 'KSENT Simulator'
  ClientHeight = 502
  ClientWidth = 544
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
  object Label9: TLabel
    Left = 8
    Top = 232
    Width = 60
    Height = 12
    Caption = #53685#49888#47784#45768#53552
  end
  object Label1: TLabel
    Left = 8
    Top = 208
    Width = 81
    Height = 12
    Caption = 'SEND DATA : '
  end
  object Label2: TLabel
    Left = 8
    Top = 106
    Width = 72
    Height = 12
    Caption = 'SET DATA : '
  end
  object Label3: TLabel
    Left = 240
    Top = 106
    Width = 21
    Height = 12
    Caption = 'deg'
  end
  object Label4: TLabel
    Left = 8
    Top = 138
    Width = 73
    Height = 12
    Caption = 'SET Cycle : '
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 41
    Align = alTop
    Caption = 'KSENT SIMULATION'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Narkisim'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 544
    Height = 48
    Align = alTop
    TabOrder = 1
    object dpbLabel1: TdpbLabel
      Left = 9
      Top = 3
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object BtnConnect: TSpeedButton
      Left = 108
      Top = 5
      Width = 73
      Height = 33
      Caption = #50672#44208
      OnClick = BtnConnectClick
    end
    object SpeedButton2: TSpeedButton
      Left = 188
      Top = 5
      Width = 73
      Height = 33
      Caption = #54644#51228
      OnClick = SpeedButton2Click
    end
    object Edit_Comport: ZIniSpinEdit
      Left = 8
      Top = 16
      Width = 65
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'Comport'
      IniDataSource = INI
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 263
    Width = 544
    Height = 220
    Align = alBottom
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 2
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 483
    Width = 544
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object EdtSendData: ZIniEdit
    Left = 104
    Top = 203
    Width = 257
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 4
    MoveCursor = False
  end
  object BtnSenddata: TButton
    Left = 272
    Top = 232
    Width = 75
    Height = 25
    Caption = 'SEND'
    TabOrder = 5
  end
  object BtnSentEn: TButton
    Left = 392
    Top = 99
    Width = 121
    Height = 25
    Caption = 'SENT ENABLE'
    TabOrder = 6
    OnClick = BtnSentEnClick
  end
  object Button2: TButton
    Left = 392
    Top = 128
    Width = 121
    Height = 25
    Caption = 'SENT DISABLE'
    TabOrder = 7
  end
  object EdtDeg: ZIniEdit
    Left = 104
    Top = 102
    Width = 121
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 8
    IniKey = 'EdtDeg'
    IniDataSource = INI
    MoveCursor = False
  end
  object BtnSetDeg: TButton
    Left = 272
    Top = 101
    Width = 75
    Height = 23
    Caption = 'SET'
    TabOrder = 9
    OnClick = BtnSetDegClick
  end
  object Button3: TButton
    Left = 392
    Top = 158
    Width = 121
    Height = 25
    Caption = 'SENT RESET'
    TabOrder = 10
    OnClick = Button3Click
  end
  object EdtCycle1: ZIniEdit
    Left = 104
    Top = 134
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 11
    IniKey = 'EdtCycle1'
    IniDataSource = INI
    MoveCursor = False
  end
  object EdtCycle2: ZIniEdit
    Left = 160
    Top = 134
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 12
    IniKey = 'EdtCycle2'
    IniDataSource = INI
    MoveCursor = False
  end
  object Button1: TButton
    Left = 392
    Top = 187
    Width = 121
    Height = 25
    Caption = 'SENT INIT'
    TabOrder = 13
    OnClick = Button1Click
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'config.ini'
    IniSection = 'KMISENT'
    Left = 480
    Top = 32
  end
end
