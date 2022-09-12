object FrmTempSensor: TFrmTempSensor
  Left = 732
  Top = 259
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Temperature Sensor'
  ClientHeight = 270
  ClientWidth = 454
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object BtnClear: TSpeedButton
    Left = 377
    Top = 103
    Width = 59
    Height = 27
    Caption = 'CLEAR'
    OnClick = BtnClearClick
  end
  object Lb_Temp: TdpbLabel
    Left = 139
    Top = 57
    Width = 129
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = '0.00'
    Color = clWhite
    EdgeStyle = desSunken
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 41
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 136
      Top = 6
      Width = 73
      Height = 27
      Caption = #50672#44208
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 208
      Top = 6
      Width = 73
      Height = 27
      Caption = #50672#44208#54644#51228
      OnClick = SpeedButton2Click
    end
    object BtnInit: TSpeedButton
      Left = 288
      Top = 6
      Width = 73
      Height = 27
      Caption = #52488#44592#54868
      OnClick = BtnInitClick
    end
    object SpeedButton3: TSpeedButton
      Left = 376
      Top = 5
      Width = 73
      Height = 27
      Caption = #45803#44592
      OnClick = SpeedButton3Click
    end
    object Label2: TLabel
      Left = 5
      Top = 13
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object CmbComport: ZIniComboBox
      Left = 57
      Top = 8
      Width = 76
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
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
        'COM12')
      SaveItems = False
      IniKey = 'ComPort'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 251
    Width = 454
    Height = 19
    Panels = <>
  end
  object Edit_Send: ZIniEdit
    Left = 11
    Top = 106
    Width = 289
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 2
    OnKeyDown = Edit_SendKeyDown
    IniKey = 'LastCmd'
    IniDataSource = INI
    MoveCursor = False
  end
  object BtnSend: TBitBtn
    Left = 317
    Top = 103
    Width = 59
    Height = 27
    Caption = #51204#49569
    TabOrder = 3
    OnClick = BtnSendClick
  end
  object MemoRX: TMemo
    Left = 11
    Top = 136
    Width = 433
    Height = 109
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 13
    Top = 60
    Width = 119
    Height = 27
    Caption = 'READ TEMP.'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object CbTempOffset: ZIniCheckBox
    Left = 320
    Top = 62
    Width = 121
    Height = 17
    Caption = #50728#46020' '#50724#54532#49483' '#51201#50857
    TabOrder = 6
    OnClick = CbTempOffsetClick
    IniKey = 'CbTempOffset'
    IniDataSource = INI
  end
  object Edt_TempOffset: ZIniEdit
    Left = 320
    Top = 80
    Width = 121
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 7
    IniKey = 'Edt_TempOffset'
    IniDataSource = INI
    MoveCursor = False
  end
  object ChkRead: ZIniCheckBox
    Left = 320
    Top = 42
    Width = 121
    Height = 17
    Caption = #50672#49549' '#51069#44592
    TabOrder = 8
    OnClick = ChkReadClick
    IniKey = 'ChkRead'
    IniDataSource = INI
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'TempSensor'
    Left = 59
    Top = 140
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 107
    Top = 140
  end
  object TimerTemp: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTempTimer
    Left = 152
    Top = 146
  end
end
