object FrmCanDiag: TFrmCanDiag
  Left = 517
  Top = 159
  BorderStyle = bsDialog
  Caption = 'CAN Diag Function'
  ClientHeight = 624
  ClientWidth = 568
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 112
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
    Height = 97
    Caption = 'FUNTION'
    TabOrder = 1
    object BtnStartDiag: TSpeedButton
      Left = 7
      Top = 21
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
    object BtnGmvSec: TSpeedButton
      Left = 423
      Top = 21
      Width = 90
      Height = 28
      Caption = 'SECURITY(GMI)'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = BtnGmvSecClick
    end
    object CheckBox_VIewAll: TCheckBox
      Left = 328
      Top = 72
      Width = 105
      Height = 17
      Caption = 'View CAN Data'
      Checked = True
      State = cbChecked
      TabOrder = 0
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
      Width = 121
      Height = 17
      Caption = 'Send Present Code'
      Enabled = False
      TabOrder = 5
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 603
    Width = 568
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
    Top = 208
    Width = 553
    Height = 393
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Message Log'
      object Memo: TMemo
        Left = 0
        Top = 0
        Width = 545
        Height = 365
        Align = alClient
        Color = 8404992
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 0
        WordWrap = False
      end
      object Edit3: TEdit
        Left = 336
        Top = 8
        Width = 161
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
        Visible = False
      end
    end
  end
  object Edit1: TEdit
    Left = 152
    Top = 200
    Width = 177
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 344
    Top = 200
    Width = 201
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 5
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
end
