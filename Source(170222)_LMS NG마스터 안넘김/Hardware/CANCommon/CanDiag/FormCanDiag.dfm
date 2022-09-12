object FrmCanDiag: TFrmCanDiag
  Left = 548
  Top = 114
  BorderStyle = bsDialog
  Caption = 'CAN Diag Function'
  ClientHeight = 741
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 107
    Width = 553
    Height = 89
    Caption = 'CAN DIAG'
    TabOrder = 0
    object Label3: TLabel
      Left = 9
      Top = 34
      Width = 30
      Height = 11
      Caption = 'SEND'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 58
      Width = 31
      Height = 11
      Caption = 'READ'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 45
      Top = 18
      Width = 38
      Height = 11
      Caption = 'CAN ID'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 129
      Top = 18
      Width = 56
      Height = 11
      Caption = 'MESSAGE'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 91
      Top = 18
      Width = 20
      Height = 11
      Caption = 'Len'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object BtnSendCommand: TSpeedButton
      Left = 496
      Top = 30
      Width = 50
      Height = 48
      Caption = 'SEND'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnSendCommandClick
    end
    object Edit_TxID: ZIniEdit
      Left = 41
      Top = 30
      Width = 43
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 0
      Text = '000'
      IniKey = 'TxID'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_RxID: ZIniEdit
      Left = 41
      Top = 54
      Width = 43
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
      Text = '000'
      IniKey = 'RxID'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_TxMsg: ZIniEdit
      Left = 116
      Top = 30
      Width = 373
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 2
      MoveCursor = False
    end
    object Edit_RxMsg: ZIniEdit
      Left = 116
      Top = 54
      Width = 373
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      MoveCursor = False
    end
    object Edit_TxLen: ZIniEdit
      Left = 86
      Top = 30
      Width = 28
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '00'
      MoveCursor = False
    end
    object Edit_RxLen: ZIniEdit
      Left = 86
      Top = 54
      Width = 28
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '00'
      MoveCursor = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 553
    Height = 95
    Caption = 'FUNTION'
    TabOrder = 1
    object BtnStartDiag: TSpeedButton
      Left = 8
      Top = 22
      Width = 90
      Height = 28
      Caption = 'START DIAG'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnStartDiagClick
    end
    object BtnTesterPresent: TSpeedButton
      Left = 167
      Top = 21
      Width = 90
      Height = 28
      Caption = 'PRESENT'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnTesterPresentClick
    end
    object BtnStopDiag: TSpeedButton
      Left = 7
      Top = 53
      Width = 90
      Height = 28
      Caption = 'STOP DIAG'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnStopDiagClick
    end
    object BtnSecurity: TSpeedButton
      Left = 327
      Top = 21
      Width = 90
      Height = 28
      Caption = 'SECURITY'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnSecurityClick
    end
    object SpeedButton1: TSpeedButton
      Left = 167
      Top = 53
      Width = 90
      Height = 28
      Caption = 'READ ID'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object CheckBox_VIewAll: TCheckBox
      Left = 328
      Top = 72
      Width = 105
      Height = 17
      Caption = 'View CAN Data'
      TabOrder = 0
      OnClick = CheckBox_VIewAllClick
    end
    object Edit_StartDiag: ZIniEdit
      Left = 100
      Top = 24
      Width = 56
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
      Text = '00 00'
      IniKey = 'StartDiag'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_StopDiag: ZIniEdit
      Left = 100
      Top = 56
      Width = 56
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 2
      Text = '000'
      IniKey = 'StopDiag'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_Present: ZIniEdit
      Left = 260
      Top = 24
      Width = 56
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 3
      Text = '000'
      IniKey = 'Present'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_ReadID: ZIniEdit
      Left = 260
      Top = 56
      Width = 56
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 4
      Text = '000'
      IniKey = 'ReadID'
      IniDataSource = INI
      MoveCursor = False
    end
    object Cb_SendTestPresent: ZIniCheckBox
      Left = 328
      Top = 56
      Width = 116
      Height = 17
      Caption = 'Send Present Code'
      TabOrder = 5
      OnClick = Cb_SendTestPresentClick
    end
    object btnTest: TButton
      Left = 448
      Top = 56
      Width = 75
      Height = 25
      Caption = 'btnTest'
      TabOrder = 6
      OnClick = btnTestClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 720
    Width = 566
    Height = 21
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 232
    Width = 553
    Height = 481
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Message Log'
      object Memo: TMemo
        Left = 0
        Top = 0
        Width = 545
        Height = 453
        Align = alClient
        Color = 8404992
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  object Cb_SaveLog: TCheckBox
    Left = 8
    Top = 208
    Width = 66
    Height = 17
    Caption = 'Save Log'
    TabOrder = 4
  end
  object Ed_LogFileName: ZIniEdit
    Left = 88
    Top = 205
    Width = 417
    Height = 21
    ImeName = 'Microsoft IME 2003'
    ReadOnly = True
    TabOrder = 5
    MoveCursor = False
  end
  object Button1: TButton
    Left = 504
    Top = 204
    Width = 50
    Height = 22
    Caption = 'LOG'
    TabOrder = 6
    OnClick = Button1Click
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CANDIAG'
    Left = 40
    Top = 336
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 80
    Top = 336
  end
  object OpenDialog1: TOpenDialog
    Left = 132
    Top = 336
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'log'
    Filter = 'Text Log Files(*.log)|*.log|All Files(*.*)|*.*'
    Left = 216
    Top = 295
  end
end
