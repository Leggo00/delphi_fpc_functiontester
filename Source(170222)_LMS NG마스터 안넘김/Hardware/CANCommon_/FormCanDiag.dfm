object FrmCanDiag: TFrmCanDiag
  Left = 293
  Top = 159
  BorderStyle = bsDialog
  Caption = 'CAN Diag Function'
  ClientHeight = 427
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 208
    Top = 7
    Width = 644
    Height = 89
    Caption = 'CAN DIAG'
    TabOrder = 0
    object Label3: TLabel
      Left = 89
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
      Left = 89
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
      Left = 125
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
      Left = 209
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
      Left = 171
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
      Left = 583
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
      Left = 121
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
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_RxID: ZIniEdit
      Left = 121
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
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_TxMsg: ZIniEdit
      Left = 196
      Top = 30
      Width = 385
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
      Left = 196
      Top = 54
      Width = 385
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
      Left = 166
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
      Left = 166
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
    object rdoEcu: ZIniRadioGroup
      Left = 10
      Top = 19
      Width = 76
      Height = 59
      Caption = 'ECU'
      Items.Strings = (
        'HPCU'
        'HCU')
      TabOrder = 6
      OnClick = rdoEcuClick
      IniKey = 'rdoEcu'
      IniDataSource = INI
    end
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 7
    Width = 197
    Height = 392
    Caption = 'FUNTION'
    TabOrder = 1
    object BtnStartDiag: TSpeedButton
      Left = 9
      Top = 89
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
    object BtnStopDiag: TSpeedButton
      Left = 9
      Top = 116
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
      Left = 9
      Top = 143
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
    object Label5: TLabel
      Left = 14
      Top = 20
      Width = 30
      Height = 11
      Caption = 'Retry'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
    end
    object BtnTesterPresent: TSpeedButton
      Left = 9
      Top = 170
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
    object SpeedButton1: TSpeedButton
      Left = 9
      Top = 197
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
    object btnDtcClear: TSpeedButton
      Left = 9
      Top = 224
      Width = 90
      Height = 28
      Caption = 'DTC CLEAR'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = btnDtcClearClick
    end
    object btnDtcRead: TSpeedButton
      Left = 9
      Top = 251
      Width = 90
      Height = 28
      Caption = 'DTC READ'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = btnDtcReadClick
    end
    object SpeedButton2: TSpeedButton
      Left = 9
      Top = 278
      Width = 90
      Height = 28
      Caption = 'HCU  Service'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object CheckBox_VIewAll: TCheckBox
      Left = 14
      Top = 62
      Width = 105
      Height = 17
      Caption = 'View CAN Data'
      TabOrder = 0
    end
    object Edit_StartDiag: ZIniEdit
      Left = 100
      Top = 92
      Width = 88
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
      Top = 119
      Width = 88
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
    object Cb_ViewTestPresent: TCheckBox
      Left = 14
      Top = 42
      Width = 121
      Height = 17
      Caption = 'View Present Code'
      TabOrder = 3
    end
    object Edit_nRetry: ZIniSpinEdit
      Left = 50
      Top = 14
      Width = 49
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 4
      Value = 1
      IniKey = 'Retry'
      IniDataSource = INI
    end
    object Edit_Present: ZIniEdit
      Left = 100
      Top = 173
      Width = 88
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 5
      Text = '000'
      IniKey = 'Present'
      IniDataSource = INI
      MoveCursor = False
    end
    object Edit_ReadID: ZIniEdit
      Left = 100
      Top = 200
      Width = 88
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 6
      Text = '000'
      IniKey = 'ReadID'
      IniDataSource = INI
      MoveCursor = False
    end
    object edtDtcClear: ZIniEdit
      Left = 100
      Top = 227
      Width = 88
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 7
      Text = '000'
      IniKey = 'DTC CLEAR'
      IniDataSource = INI
      MoveCursor = False
    end
    object edtDtcRead: ZIniEdit
      Left = 100
      Top = 254
      Width = 88
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 8
      Text = '000'
      IniKey = 'edtDtcRead'
      IniDataSource = INI
      MoveCursor = False
    end
    object edtHcuServiceData: ZIniEdit
      Left = 100
      Top = 281
      Width = 88
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 9
      Text = '000'
      IniKey = 'edtHcuServiceData'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 406
    Width = 862
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
    Left = 208
    Top = 101
    Width = 644
    Height = 298
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Message Log'
      object Memo: TMemo
        Left = 0
        Top = 0
        Width = 636
        Height = 270
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
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CANDIAG'
    Left = 242
    Top = 152
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 282
    Top = 152
  end
end
