object FrmItac: TFrmItac
  Left = 493
  Top = 438
  Width = 666
  Height = 572
  Caption = 'ITAC Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnApiInit: TSpeedButton
      Left = 8
      Top = 6
      Width = 80
      Height = 30
      Caption = 'apiInit'
      OnClick = BtnApiInitClick
    end
    object BtnapiShutdown: TSpeedButton
      Left = 88
      Top = 6
      Width = 80
      Height = 30
      Caption = 'apiShutdown'
      OnClick = BtnapiShutdownClick
    end
    object Cb_DisableITAC: ZIniCheckBox
      Left = 194
      Top = 10
      Width = 97
      Height = 17
      Caption = 'ITAC'#49324#50857' '#50504#54632
      TabOrder = 0
      IniKey = 'DisableITAC'
      IniDataSource = iTacINI
    end
  end
  object MemoLog: TMemo
    Left = 8
    Top = 368
    Width = 641
    Height = 145
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 1
    WordWrap = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 201
    Height = 107
    Caption = 'LOG IN'
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 23
      Width = 53
      Height = 13
      Caption = 'Station No.'
    end
    object BtnLogin: TSpeedButton
      Left = 27
      Top = 70
      Width = 80
      Height = 30
      Caption = 'LogIN'
      OnClick = BtnLoginClick
    end
    object BtnLogOut: TSpeedButton
      Left = 107
      Top = 70
      Width = 80
      Height = 30
      Caption = 'Logout'
      OnClick = BtnLogOutClick
    end
    object Label2: TLabel
      Left = 15
      Top = 47
      Width = 51
      Height = 13
      Caption = 'Session ID'
    end
    object Edit_StationNo: ZIniEdit
      Left = 86
      Top = 20
      Width = 99
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = 'Edit_StationNo'
      IniKey = 'StationNo '
      IniDataSource = iTacINI
      MoveCursor = False
    end
    object Edit_SessionID: ZIniEdit
      Left = 86
      Top = 44
      Width = 99
      Height = 21
      Color = clBtnFace
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 1
      MoveCursor = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 216
    Top = 48
    Width = 209
    Height = 193
    Caption = 'Check Serial No'
    TabOrder = 3
    object Label4: TLabel
      Left = 15
      Top = 23
      Width = 40
      Height = 13
      Caption = 'SerialNo'
    end
    object BtnCheckSerial: TSpeedButton
      Left = 8
      Top = 49
      Width = 97
      Height = 30
      Caption = 'CheckSNStatus'
      OnClick = BtnCheckSerialClick
    end
    object BtnGetSnrInofData: TSpeedButton
      Left = 104
      Top = 49
      Width = 97
      Height = 30
      Caption = 'GetSnrInofData'
      OnClick = BtnGetSnrInofDataClick
    end
    object SpeedButton2: TSpeedButton
      Left = 8
      Top = 81
      Width = 97
      Height = 30
      Caption = 'queryRecipeData'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 104
      Top = 81
      Width = 97
      Height = 30
      Caption = 'GetSnrUploadInfo'
      OnClick = SpeedButton3Click
    end
    object SpeedButton5: TSpeedButton
      Left = 8
      Top = 153
      Width = 97
      Height = 30
      Caption = 'VerifyMerge'
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 104
      Top = 153
      Width = 97
      Height = 30
      Caption = 'assignSerialNumber'
      OnClick = SpeedButton6Click
    end
    object BtnGetStation: TSpeedButton
      Left = 8
      Top = 113
      Width = 97
      Height = 30
      Caption = 'GetStationSetup'
      OnClick = BtnGetStationClick
    end
    object Edit_SerialNo: ZIniEdit
      Left = 70
      Top = 20
      Width = 123
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = '10042590001'
      IniKey = 'Edit_SerialNo'
      IniDataSource = iTacINI
      MoveCursor = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 515
    Width = 650
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object GroupBox3: TGroupBox
    Left = 432
    Top = 48
    Width = 217
    Height = 241
    Caption = 'Result data'
    TabOrder = 5
    object BtnuploadStateAndResultData: TSpeedButton
      Left = 48
      Top = 137
      Width = 153
      Height = 30
      Caption = 'uploadStateAndResultData'
      OnClick = BtnuploadStateAndResultDataClick
    end
    object Label5: TLabel
      Left = 30
      Top = 89
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label7: TLabel
      Left = 32
      Top = 112
      Width = 27
      Height = 13
      Caption = 'Value'
    end
    object Label8: TLabel
      Left = 23
      Top = 67
      Width = 30
      Height = 13
      Caption = 'Result'
    end
    object BtnUploadState: TSpeedButton
      Left = 48
      Top = 169
      Width = 153
      Height = 30
      Caption = 'uploadState'
      OnClick = BtnUploadStateClick
    end
    object SpeedButton8: TSpeedButton
      Left = 48
      Top = 201
      Width = 153
      Height = 30
      Caption = 'uploadFailureSlip'
      OnClick = SpeedButton8Click
    end
    object Edit_TestName: ZIniEdit
      Left = 70
      Top = 84
      Width = 99
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      MoveCursor = False
    end
    object Edit_TestValue: ZIniEdit
      Left = 70
      Top = 108
      Width = 99
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      MoveCursor = False
    end
    object Rb_Pass: TRadioButton
      Left = 72
      Top = 64
      Width = 44
      Height = 17
      Caption = 'Pass'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object Rb_Fail: TRadioButton
      Left = 120
      Top = 64
      Width = 44
      Height = 17
      Caption = 'Fail'
      TabOrder = 3
    end
    object RdoUpLoad: ZIniRadioGroup
      Left = 8
      Top = 16
      Width = 201
      Height = 41
      Caption = 'Upload Type'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'DATA'
        'RECIPE')
      TabOrder = 4
      IniKey = 'RdoUpLoad'
      IniDataSource = iTacINI
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 240
    Width = 417
    Height = 121
    Caption = 'Attribute for Serial'
    TabOrder = 6
    object Label3: TLabel
      Left = 15
      Top = 23
      Width = 39
      Height = 13
      Caption = 'Attribute'
    end
    object BtnGetAttribute: TSpeedButton
      Left = 176
      Top = 17
      Width = 113
      Height = 30
      Caption = 'GetAttribute'
      OnClick = BtnGetAttributeClick
    end
    object BtnAppendAttribute: TSpeedButton
      Left = 176
      Top = 49
      Width = 113
      Height = 30
      Caption = 'AppendAttribute'
      OnClick = BtnAppendAttributeClick
    end
    object BtnremoveAttribute: TSpeedButton
      Left = 176
      Top = 81
      Width = 113
      Height = 30
      Caption = 'RemoveAttribute'
      OnClick = BtnremoveAttributeClick
    end
    object Label6: TLabel
      Left = 31
      Top = 47
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 77
      Width = 161
      Height = 30
      Caption = 'GetNextSerialNUmberForWorkOrder'
      OnClick = SpeedButton1Click
    end
    object Edit_AttributeValue: ZIniEdit
      Left = 64
      Top = 48
      Width = 99
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      MoveCursor = False
    end
    object Button1: TButton
      Left = 312
      Top = 16
      Width = 89
      Height = 25
      Caption = 'GetOCRData'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Combo_AttributeCode: TComboBox
      Left = 64
      Top = 20
      Width = 97
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'YAW_SNR'
      Items.Strings = (
        'YAW_SNR'
        'YAW_LOT'
        'YAW_SW')
    end
    object Edt_YMD: ZIniEdit
      Left = 304
      Top = 64
      Width = 99
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
      MoveCursor = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 155
    Width = 201
    Height = 85
    Caption = 'Work Order'
    TabOrder = 7
    object Label9: TLabel
      Left = 15
      Top = 23
      Width = 39
      Height = 13
      Caption = 'Attribute'
    end
    object SpeedButton4: TSpeedButton
      Left = 16
      Top = 45
      Width = 161
      Height = 30
      Caption = 'GetAttributeForWorkorder'
      OnClick = SpeedButton4Click
    end
    object Cb_AttributeCodeForWorkOrder: TComboBox
      Left = 64
      Top = 20
      Width = 97
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      TabOrder = 0
      Text = 'SAMPLE_WO'
      Items.Strings = (
        'SAMPLE_WO')
    end
  end
  object GroupBox6: TGroupBox
    Left = 432
    Top = 312
    Width = 217
    Height = 49
    Caption = 'TEST'
    TabOrder = 8
    object SpeedButton7: TSpeedButton
      Left = 48
      Top = 11
      Width = 153
      Height = 30
      Caption = 'GetHMFforSerial'
      OnClick = SpeedButton7Click
    end
  end
  object Button2: TButton
    Left = 320
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 9
    OnClick = Button2Click
  end
  object iTacINI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'ITAC'
    Left = 56
    Top = 392
  end
  object TimerConnect: TTimer
    Enabled = False
    Interval = 5000
    Left = 104
    Top = 400
  end
end
