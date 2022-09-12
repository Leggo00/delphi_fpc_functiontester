object FrmWT230: TFrmWT230
  Left = 414
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'YOKOGAWA WT230 Communication'
  ClientHeight = 484
  ClientWidth = 532
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 41
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 152
      Top = 6
      Width = 73
      Height = 27
      Caption = #50672#44208
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 224
      Top = 6
      Width = 73
      Height = 27
      Caption = #50672#44208#54644#51228
      OnClick = SpeedButton2Click
    end
    object BtnInit: TSpeedButton
      Left = 304
      Top = 6
      Width = 73
      Height = 27
      Caption = #52488#44592#54868
      OnClick = BtnInitClick
    end
    object SpeedButton3: TSpeedButton
      Left = 384
      Top = 5
      Width = 73
      Height = 27
      Caption = #45803#44592
      OnClick = SpeedButton3Click
    end
    object Label2: TLabel
      Left = 8
      Top = 13
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object CmbComport: ZIniComboBox
      Left = 64
      Top = 8
      Width = 81
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
    Top = 465
    Width = 532
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
  object Panel2: TPanel
    Left = 8
    Top = 48
    Width = 513
    Height = 193
    TabOrder = 2
    object BtnMeas: TSpeedButton
      Left = 424
      Top = 136
      Width = 81
      Height = 41
      Caption = #52769#51221
      OnClick = BtnMeasClick
    end
    object Grid: TStringGrid
      Left = 8
      Top = 8
      Width = 409
      Height = 175
      DefaultColWidth = 80
      DefaultRowHeight = 18
      RowCount = 9
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ScrollBars = ssNone
      TabOrder = 0
      OnDrawCell = GridDrawCell
    end
    object Cb_Repeat: TCheckBox
      Left = 424
      Top = 112
      Width = 73
      Height = 17
      Caption = #48152#48373#52769#51221
      TabOrder = 1
      OnClick = Cb_RepeatClick
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 248
    Width = 441
    Height = 209
    ActivePage = TabSheet2
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #53685#49888#47784#45768#53552
      object BtnClear: TSpeedButton
        Left = 374
        Top = 3
        Width = 59
        Height = 27
        Caption = 'CLEAR'
        OnClick = BtnClearClick
      end
      object BtnSend: TBitBtn
        Left = 314
        Top = 3
        Width = 59
        Height = 27
        Caption = #51204#49569
        TabOrder = 0
        OnClick = BtnSendClick
      end
      object Edit_Send: ZIniEdit
        Left = 0
        Top = 6
        Width = 305
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 1
        OnKeyDown = Edit_SendKeyDown
        IniKey = 'LastCmd'
        IniDataSource = INI
        MoveCursor = False
      end
      object MemoRX: TMemo
        Left = 0
        Top = 40
        Width = 433
        Height = 142
        Align = alBottom
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
        TabOrder = 2
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = #52488#44592#47749#47161#50612
      ImageIndex = 1
      object MemoInit: TMemo
        Left = 0
        Top = 0
        Width = 433
        Height = 182
        Align = alClient
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
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'WT230'
    Left = 32
    Top = 272
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 80
    Top = 272
  end
  object TimerMeas: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerMeasTimer
    Left = 130
    Top = 270
  end
end
