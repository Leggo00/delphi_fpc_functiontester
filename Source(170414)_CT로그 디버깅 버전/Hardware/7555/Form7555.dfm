object Frm7555: TFrm7555
  Left = 348
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'YOKOGAWA 7555 Digital Multimeter Communication'
  ClientHeight = 437
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
  PixelsPerInch = 96
  TextHeight = 12
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
      Left = 8
      Top = 13
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object CmbComport: ZIniComboBox
      Left = 64
      Top = 8
      Width = 65
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
    Top = 418
    Width = 454
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
    Width = 441
    Height = 145
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 2
    object BtnMeas: TSpeedButton
      Left = 208
      Top = 104
      Width = 105
      Height = 25
      Caption = #52769#51221
      OnClick = BtnMeasClick
    end
    object SpeedButton4: TSpeedButton
      Tag = 1
      Left = 24
      Top = 72
      Width = 49
      Height = 25
      Caption = 'DC V'
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Tag = 2
      Left = 72
      Top = 72
      Width = 49
      Height = 25
      Caption = 'AC V'
      OnClick = SpeedButton4Click
    end
    object SpeedButton6: TSpeedButton
      Tag = 3
      Left = 120
      Top = 72
      Width = 50
      Height = 25
      Caption = '2W'
      OnClick = SpeedButton4Click
    end
    object SpeedButton7: TSpeedButton
      Tag = 4
      Left = 169
      Top = 72
      Width = 49
      Height = 25
      Caption = '4W'
      OnClick = SpeedButton4Click
    end
    object SpeedButton8: TSpeedButton
      Tag = 5
      Left = 217
      Top = 72
      Width = 49
      Height = 25
      Caption = 'DC A'
      OnClick = SpeedButton4Click
    end
    object SpeedButton9: TSpeedButton
      Tag = 6
      Left = 265
      Top = 72
      Width = 49
      Height = 25
      Caption = 'AC A'
      OnClick = SpeedButton4Click
    end
    object Cb_Repeat: TCheckBox
      Left = 24
      Top = 104
      Width = 97
      Height = 17
      Caption = #48152#48373#52769#51221
      TabOrder = 0
      OnClick = Cb_RepeatClick
    end
    object Rg_Channel: TRadioGroup
      Left = 328
      Top = 8
      Width = 89
      Height = 121
      Caption = 'CHANNEL'
      ItemIndex = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 1
      OnClick = Rg_ChannelClick
    end
    object Pn_Value: TPanel
      Left = 24
      Top = 16
      Width = 289
      Height = 49
      BevelInner = bvLowered
      Caption = '0.00'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -35
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 200
    Width = 441
    Height = 209
    ActivePage = TabSheet1
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
    IniSection = '7555'
    Left = 40
    Top = 336
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 88
    Top = 336
  end
  object TimerMeas: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerMeasTimer
    Left = 138
    Top = 334
  end
  object TimerOut: TTimer
    Enabled = False
    OnTimer = TimerOutTimer
    Left = 194
    Top = 334
  end
end
