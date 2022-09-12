object FrmFC110: TFrmFC110
  Left = 333
  Top = 335
  BorderStyle = bsDialog
  Caption = 'FC110 Function Generation'
  ClientHeight = 288
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object BtnSend: TSpeedButton
    Left = 262
    Top = 148
    Width = 57
    Height = 25
    Caption = #51204#49569
    OnClick = BtnSendClick
  end
  object BtnRead: TSpeedButton
    Left = 318
    Top = 148
    Width = 57
    Height = 25
    Caption = #51069#44592
    OnClick = BtnReadClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 369
    Height = 97
    Caption = #49444#51221' '#50741#49496
    TabOrder = 0
    object BtnOutputON: TSpeedButton
      Left = 264
      Top = 16
      Width = 89
      Height = 33
      Caption = 'OUTPUT ON'
      OnClick = BtnOutputONClick
    end
    object BtnOutputOFF: TSpeedButton
      Left = 264
      Top = 48
      Width = 89
      Height = 33
      Caption = 'OUTPUT OFF'
      OnClick = BtnOutputOFFClick
    end
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 12
      Caption = 'FREQ'
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 32
      Height = 12
      Caption = 'DUTY'
    end
    object Ed_Freq: TEdit
      Left = 56
      Top = 19
      Width = 65
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = '0'
    end
    object Ed_Duty: TEdit
      Left = 56
      Top = 43
      Width = 65
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Text = '50'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 41
    Align = alTop
    TabOrder = 1
    object BtnConnect: TSpeedButton
      Left = 65
      Top = 3
      Width = 57
      Height = 34
      Caption = #50672#44208
      OnClick = BtnConnectClick
    end
    object BtnDisconnect: TSpeedButton
      Left = 121
      Top = 3
      Width = 57
      Height = 34
      Caption = #50672#44208#54644#51228
      OnClick = BtnDisconnectClick
    end
    object Label1: TLabel
      Left = 7
      Top = 3
      Width = 32
      Height = 12
      Caption = 'ADDR'
    end
    object Ed_Addr: ZIniSpinEdit
      Left = 4
      Top = 16
      Width = 58
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'Addr'
      IniDataSource = INI
    end
  end
  object MemoLog: TMemo
    Left = 8
    Top = 176
    Width = 369
    Height = 89
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
    Top = 269
    Width = 387
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object Edit_Send: TEdit
    Left = 8
    Top = 152
    Width = 249
    Height = 21
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 4
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'FC110'
    Left = 208
    Top = 8
  end
  object GPIBdev: ZGPIBdevice
    GPIBaddr = 1
    DeviceName = 'DEV1'
    BufferSize = 10240
    Connected = False
    TimeOut = '1s'
    Left = 40
    Top = 192
  end
end
