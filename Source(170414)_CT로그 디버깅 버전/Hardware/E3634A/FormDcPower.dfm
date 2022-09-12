object FrmE3634A: TFrmE3634A
  Left = 508
  Top = 127
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'DC POWER [Agilent - E3634A]'
  ClientHeight = 483
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 38
    Width = 615
    Height = 426
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 5
      Top = 6
      Width = 77
      Height = 13
      Caption = '[Command]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 98
      Width = 120
      Height = 13
      Caption = '[Receive Msg List]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 5
      Top = 265
      Width = 104
      Height = 13
      Caption = '[Send Cmd List]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 313
      Top = 98
      Width = 88
      Height = 13
      Caption = 'Command List'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 52
      Width = 595
      Height = 2
    end
    object Bevel2: TBevel
      Left = 6
      Top = 88
      Width = 595
      Height = 2
    end
    object Label13: TLabel
      Left = 5
      Top = 62
      Width = 53
      Height = 13
      Caption = '[Config]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 184
      Top = 65
      Width = 42
      Height = 12
      Caption = 'Voltage'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 312
      Top = 65
      Width = 41
      Height = 12
      Caption = 'Current'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object btnSend: TBitBtn
      Left = 513
      Top = 18
      Width = 89
      Height = 28
      Caption = #51204#49569
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSendClick
    end
    object edtCommand: TEdit
      Left = 3
      Top = 22
      Width = 504
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
    end
    object CmdList: TListBox
      Left = 308
      Top = 113
      Width = 294
      Height = 307
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      Items.Strings = (
        '*IDN?'
        '*RST'
        '*CLS'
        'APPL 12,2.5'
        'VOLT:RANG p20V'
        'CURR?'
        'OUTP ON'
        'OUTP OFF'
        ''
        'SYSTem:Interface RS232'
        'SYSTem:LOCal'
        'SYSTem:REMote'
        'SYSTem:RWLock')
      TabOrder = 2
      OnDblClick = CmdListDblClick
    end
    object Button1: TButton
      Left = 226
      Top = 92
      Width = 75
      Height = 21
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 226
      Top = 259
      Width = 75
      Height = 21
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
    object ReceiveList: TListBox
      Left = 3
      Top = 114
      Width = 300
      Height = 140
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      TabOrder = 5
    end
    object SendList: TListBox
      Left = 3
      Top = 281
      Width = 300
      Height = 140
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      TabOrder = 6
      OnDblClick = SendListDblClick
    end
    object BitBtn1: TBitBtn
      Left = 465
      Top = 58
      Width = 136
      Height = 28
      Caption = 'Send Output'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object edtVoltage: ZIniEdit
      Left = 234
      Top = 62
      Width = 53
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 8
      Text = '18'
      IniKey = 'Voltage'
      IniDataSource = iniDcPower
      MoveCursor = False
    end
    object edtCurrent: ZIniEdit
      Left = 362
      Top = 62
      Width = 53
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 9
      Text = '18'
      IniKey = 'Current'
      IniDataSource = iniDcPower
      MoveCursor = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 41
    Align = alTop
    Color = clInactiveBorder
    TabOrder = 1
    object Label9: TLabel
      Left = 5
      Top = 14
      Width = 48
      Height = 13
      Caption = #53685#49888#54252#53944
      Transparent = True
    end
    object btnConnect: TSpeedButton
      Left = 163
      Top = 8
      Width = 67
      Height = 25
      Caption = #50672#44208
      OnClick = btnConnectClick
    end
    object cbPort: ZIniComboBox
      Left = 64
      Top = 9
      Width = 96
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
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
        'COM21'
        'COM22')
      SaveItems = False
      IniKey = 'Port'
      IniDataSource = iniDcPower
    end
    object btnClose: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 464
    Width = 615
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object iniDcPower: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'E3632A'
    Left = 12
    Top = 170
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 48
    Top = 176
  end
end
