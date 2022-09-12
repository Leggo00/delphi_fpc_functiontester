object FrmUDPComm: TFrmUDPComm
  Left = 235
  Top = 241
  Width = 524
  Height = 389
  Caption = #53685#49888#47784#45768#53552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 65
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 438
      Top = 12
      Width = 73
      Height = 24
      Caption = 'Clear'
      OnClick = SpeedButton1Click
    end
    object BtnSend: TSpeedButton
      Left = 366
      Top = 12
      Width = 73
      Height = 24
      Caption = 'TEST'
      OnClick = BtnSendClick
    end
    object Label1: TLabel
      Left = 5
      Top = 2
      Width = 47
      Height = 12
      Caption = 'IP ADDR'
    end
    object Label2: TLabel
      Left = 125
      Top = 2
      Width = 60
      Height = 12
      Caption = 'MESAAGE'
    end
    object Edit_Send: TEdit
      Left = 128
      Top = 15
      Width = 234
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object Ed_IPAddr: ZIniEdit
      Left = 4
      Top = 16
      Width = 117
      Height = 20
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 1
      Text = '127.0.0.1'
      IniKey = 'IPAddr'
      IniDataSource = INI
      MoveCursor = False
    end
    object Cb_UseMessage: ZIniCheckBox
      Left = 8
      Top = 40
      Width = 145
      Height = 17
      Caption = #49436#48260' '#51204#49569#44592#45733' '#49324#50857
      TabOrder = 2
      IniKey = 'UseMessage'
      IniDataSource = INI
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 332
    Width = 508
    Height = 19
    Panels = <>
  end
  object MemoLog: TMemo
    Left = 0
    Top = 65
    Width = 508
    Height = 267
    Align = alClient
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 2
    WordWrap = False
  end
  object IdUDPServer: TIdUDPServer
    OnStatus = IdUDPServerStatus
    Active = True
    Bindings = <>
    DefaultPort = 5555
    OnUDPRead = IdUDPServerUDPRead
    Left = 56
    Top = 152
  end
  object IdUDPClient: TIdUDPClient
    OnStatus = IdUDPClientStatus
    Active = True
    BufferSize = 0
    Host = '127.0.0.1'
    Port = 5556
    Left = 56
    Top = 104
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'UPDMSG'
    Left = 56
    Top = 208
  end
end
