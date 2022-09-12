object FrmCLV421: TFrmCLV421
  Left = 345
  Top = 140
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'SICK[CLV421]'
  ClientHeight = 362
  ClientWidth = 616
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
    Top = 48
    Width = 616
    Height = 295
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
      Left = 8
      Top = 52
      Width = 595
      Height = 2
    end
    object Label1: TLabel
      Left = 10
      Top = 68
      Width = 118
      Height = 13
      Caption = '[Tx && Rx Data List]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 312
      Top = 68
      Width = 102
      Height = 13
      Caption = '[Command List]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 312
      Top = 253
      Width = 68
      Height = 13
      Caption = '[Barcode]'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object btnSend: TBitBtn
      Left = 515
      Top = 19
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
      Left = 10
      Top = 24
      Width = 498
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
      Left = 236
      Top = 58
      Width = 67
      Height = 25
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
      Top = 83
      Width = 294
      Height = 204
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
    object listCommand: TListBox
      Left = 312
      Top = 83
      Width = 294
      Height = 164
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      Items.Strings = (
        '21 : SW Trigger Start'
        '22 : SW Trigger Stop')
      ParentFont = False
      TabOrder = 4
      OnDblClick = listCommandDblClick
    end
    object edtBarcode: TEdit
      Left = 312
      Top = 267
      Width = 294
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Color = clInactiveBorder
    TabOrder = 1
    object GradientFill1: TGradientFill
      Left = 0
      Top = 0
      Width = 616
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
      Top = 11
      Width = 75
      Height = 25
      Caption = #50672#44208
      OnClick = btnConnectClick
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
      IniDataSource = iniMarking
    end
    object btnClose: TButton
      Left = 534
      Top = 11
      Width = 75
      Height = 25
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 343
    Width = 616
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object iniMarking: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'CLV421'
    Left = 134
    Top = 154
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 104
    Top = 156
  end
end
