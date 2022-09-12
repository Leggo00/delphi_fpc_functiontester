object FrmPLZ1004W: TFrmPLZ1004W
  Left = 278
  Top = 155
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'E-LOAD [PLZ1004W] 1.5-150V, 0-200A'
  ClientHeight = 500
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 609
    Height = 433
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 10
      Top = 8
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
    object Bevel2: TBevel
      Left = 10
      Top = 55
      Width = 781
      Height = 2
    end
    object Label1: TLabel
      Left = 10
      Top = 81
      Width = 108
      Height = 13
      Caption = '[Tx/Rx Data List]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object btnSend: TBitBtn
      Left = 438
      Top = 17
      Width = 80
      Height = 32
      Caption = #51204#49569
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSendClick
    end
    object edtCommand: TEdit
      Left = 10
      Top = 24
      Width = 420
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
    end
    object Button1: TButton
      Left = 179
      Top = 61
      Width = 80
      Height = 32
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object memoLog: TMemo
      Left = 10
      Top = 97
      Width = 248
      Height = 328
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object pcTest: TPageControl
      Left = 264
      Top = 60
      Width = 338
      Height = 366
      ActivePage = TabSheet1
      TabOrder = 4
      object TabSheet1: TTabSheet
        Caption = 'COMMAND LIST'
        object dpbLabel1: TdpbLabel
          Left = 7
          Top = 6
          Width = 96
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'CURRENT'
          Color = 16744576
          EdgeStyle = desBump
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object lblCurrent: TdpbLabel
          Left = 105
          Top = 6
          Width = 120
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '0.000'
          Color = clWhite
          EdgeStyle = desSunkenHeavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object dpbLabel4: TdpbLabel
          Left = 7
          Top = 33
          Width = 96
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'VOLTAGE'
          Color = 16744576
          EdgeStyle = desBump
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object lblVoltage: TdpbLabel
          Left = 105
          Top = 33
          Width = 120
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '0.000'
          Color = clWhite
          EdgeStyle = desSunkenHeavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object dpbLabel7: TdpbLabel
          Left = 7
          Top = 60
          Width = 96
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'WATT'
          Color = 16744576
          EdgeStyle = desBump
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object lblWatt: TdpbLabel
          Left = 105
          Top = 60
          Width = 120
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '0.000'
          Color = clWhite
          EdgeStyle = desSunkenHeavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object rdoLoadOnOff: ZIniRadioGroup
          Left = 8
          Top = 94
          Width = 317
          Height = 75
          Caption = 'LOAD ON/OFF'
          Items.Strings = (
            'INPUT ON'
            'INPUT OFF')
          TabOrder = 0
          OnClick = rdoLoadOnOffClick
          IniKey = 'rdoLoadOnOff'
          IniDataSource = INI
        end
        object rdoMode: ZIniRadioGroup
          Left = 8
          Top = 175
          Width = 317
          Height = 75
          Caption = 'SET MODE'
          Columns = 3
          Items.Strings = (
            'CC'
            'CV'
            'CP'
            'CR'
            'CCCV'
            'CRCV')
          TabOrder = 1
          OnClick = rdoModeClick
          IniKey = 'rdoMode'
          IniDataSource = INI
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 258
          Width = 317
          Height = 75
          Caption = 'SET CURRENT/VOLTAGE'
          TabOrder = 2
          object Label10: TLabel
            Left = 11
            Top = 25
            Width = 55
            Height = 13
            Caption = #9670'  '#51204#50517'(V)'
          end
          object Label12: TLabel
            Left = 11
            Top = 49
            Width = 55
            Height = 13
            Caption = #9670'  '#51204#47448'(A)'
          end
          object edtCurrent: ZIniRealSpinEdit
            Left = 73
            Top = 45
            Width = 71
            Height = 22
            Increment = 1.000000000000000000
            MaxValue = 200.000000000000000000
            TabOrder = 0
            OnChange = edtCurrentChange
            IniKey = 'edtCurrent'
            IniDataSource = INI
          end
          object edtVoltage: ZIniRealSpinEdit
            Left = 73
            Top = 21
            Width = 71
            Height = 22
            Increment = 1.000000000000000000
            MaxValue = 150.000000000000000000
            MinValue = 1.500000000000000000
            TabOrder = 1
            Value = 1.500000000000000000
            OnChange = edtVoltageChange
            IniKey = 'edtVoltage'
            IniDataSource = INI
          end
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 522
      Top = 17
      Width = 80
      Height = 32
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Color = clInactiveBorder
    TabOrder = 1
    DesignSize = (
      609
      48)
    object GradientFill1: TGradientFill
      Left = 0
      Top = 0
      Width = 609
      Height = 48
      ColorBegin = 15724527
      ColorEnd = 14013909
      ColorNum = 2
      Align = alClient
    end
    object Label9: TLabel
      Left = 5
      Top = 17
      Width = 48
      Height = 13
      Caption = #53685#49888#54252#53944
      Transparent = True
    end
    object btnConnect: TSpeedButton
      Left = 163
      Top = 7
      Width = 80
      Height = 32
      Caption = #50672#44208
      OnClick = btnConnectClick
    end
    object SpeedButton1: TSpeedButton
      Left = 243
      Top = 7
      Width = 80
      Height = 32
      Caption = #54644#51228
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 353
      Top = 7
      Width = 80
      Height = 32
      Caption = #49884#51089
      OnClick = SpeedButton3Click
    end
    object SpeedButton2: TSpeedButton
      Left = 433
      Top = 7
      Width = 80
      Height = 32
      Caption = #51221#51648
      OnClick = SpeedButton2Click
    end
    object cbPort: ZIniComboBox
      Left = 64
      Top = 13
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
      IniKey = 'Port'
      IniDataSource = INI
    end
    object btnClose: TButton
      Left = 522
      Top = 7
      Width = 80
      Height = 32
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 481
    Width = 609
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'PLZ1004W'
    Left = 64
    Top = 196
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 32
    Top = 196
  end
  object TimerRead: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerReadTimer
    Left = 96
    Top = 196
  end
end
