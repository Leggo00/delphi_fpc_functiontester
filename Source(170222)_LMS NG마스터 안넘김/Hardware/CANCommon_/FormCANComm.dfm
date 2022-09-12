object FrmCANComm: TFrmCANComm
  Left = 506
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'KMI CAN-COMMUNCATION'
  ClientHeight = 640
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object V: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 49
    Align = alTop
    TabOrder = 0
    object BtnClose: TSpeedButton
      Left = 690
      Top = 8
      Width = 65
      Height = 33
      Caption = 'Close'
      OnClick = BtnCloseClick
    end
    object Label6: TLabel
      Left = 168
      Top = 183
      Width = 77
      Height = 12
      Caption = 'BAUD RATE'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 9
      Width = 50
      Height = 13
      Caption = 'COMPORT'
    end
    object BtnCommConnect: TSpeedButton
      Left = 138
      Top = 11
      Width = 65
      Height = 33
      Caption = 'Connect'
      Layout = blGlyphTop
      OnClick = BtnCommConnectClick
    end
    object BtnCommDisconnect: TSpeedButton
      Left = 203
      Top = 11
      Width = 65
      Height = 33
      Caption = 'Disconnect'
      OnClick = BtnCommDisconnectClick
    end
    object Label8: TLabel
      Left = 80
      Top = 9
      Width = 42
      Height = 13
      Caption = 'CARD ID'
    end
    object BtnCodeClear: TSpeedButton
      Left = 268
      Top = 11
      Width = 65
      Height = 33
      Caption = 'Clear Port'
      OnClick = BtnCodeClearClick
    end
    object BtnRead: TSpeedButton
      Left = 334
      Top = 11
      Width = 65
      Height = 33
      Caption = 'Read'
      OnClick = BtnReadClick
    end
    object ComboPort: ZIniComboBox
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      Style = csDropDownList
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'COM1'
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
      IniKey = 'COMPORT'
      IniDataSource = INI
    end
    object Edit_CardID: ZIniSpinEdit
      Left = 80
      Top = 24
      Width = 57
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 1
      Value = 0
      IniKey = 'CardID'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 621
    Width = 762
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'DISCONNECT'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'DISCONNECT'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'DISCONNECT'
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 369
    Height = 433
    Caption = 'PORT #1'
    TabOrder = 2
    object Label7: TLabel
      Left = 32
      Top = 21
      Width = 44
      Height = 13
      Caption = 'Baudrate'
    end
    object Label1: TLabel
      Left = 68
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Kbps'
    end
    object BtnConnect1: TSpeedButton
      Tag = 1
      Left = 216
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Open'
      OnClick = BtnConnectClick
    end
    object BtnDisConnect1: TSpeedButton
      Tag = 1
      Left = 264
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Close'
      OnClick = BtnDisConnectClick
    end
    object BtnClear1: TSpeedButton
      Tag = 1
      Left = 312
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Initial'
      OnClick = BtnClearClick
    end
    object BtnSend1: TSpeedButton
      Tag = 1
      Left = 304
      Top = 399
      Width = 57
      Height = 26
      Caption = 'Send'
      OnClick = BtnSendClick
    end
    object Led_CAN1: TLed
      Left = 10
      Top = 22
      Width = 21
      Height = 14
      Alignment = laTop
      BorderWidth = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      LedWidth = 16
      OffColor = clBlack
    end
    object Edit_Data1: TEdit
      Left = 8
      Top = 402
      Width = 297
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentFont = False
      TabOrder = 0
    end
    object RadioType1: ZIniRadioGroup
      Left = 104
      Top = 16
      Width = 105
      Height = 41
      Caption = 'CAN TYPE'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'High'
        'Low')
      TabOrder = 1
      IniKey = 'CAN_SPEED_TYPE1'
      IniDataSource = INI
    end
    object ListViewTx1: TListView
      Left = 8
      Top = 64
      Width = 353
      Height = 113
      Columns = <
        item
          Caption = 'ID'
          Width = 60
        end
        item
          Caption = 'DATA'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'CT(ms)'
        end
        item
          Alignment = taRightJustify
          Caption = 'Time(ms)'
          Width = 80
        end>
      ColumnClick = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 2
      ViewStyle = vsReport
    end
    object ListViewRx1: TListView
      Left = 8
      Top = 184
      Width = 353
      Height = 209
      Columns = <
        item
          Caption = 'ID'
          Width = 60
        end
        item
          Caption = 'DATA'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'CT(ms)'
        end
        item
          Alignment = taRightJustify
          Caption = 'Time(ms)'
          Width = 80
        end>
      ColumnClick = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 3
      ViewStyle = vsReport
    end
    object Cb_BaudRate1: ZIniComboBox
      Left = 8
      Top = 40
      Width = 57
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '500'
      Items.Strings = (
        '500'
        '250'
        '125'
        '100'
        '83.3'
        '50'
        '33.3')
      SaveItems = False
      IniKey = 'CANSpeed1'
      IniDataSource = INI
    end
  end
  object GroupBox2: TGroupBox
    Left = 384
    Top = 56
    Width = 369
    Height = 433
    Caption = 'PORT #2'
    TabOrder = 3
    object BtnConnect2: TSpeedButton
      Tag = 2
      Left = 216
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Open'
      OnClick = BtnConnectClick
    end
    object BtnDisConnect2: TSpeedButton
      Tag = 2
      Left = 264
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Close'
      OnClick = BtnDisConnectClick
    end
    object BtnClear2: TSpeedButton
      Tag = 2
      Left = 312
      Top = 16
      Width = 49
      Height = 41
      Caption = 'Initial'
      OnClick = BtnClearClick
    end
    object BtnSend2: TSpeedButton
      Tag = 2
      Left = 304
      Top = 399
      Width = 57
      Height = 26
      Caption = 'Send'
      OnClick = BtnSendClick
    end
    object Led_CAN2: TLed
      Left = 10
      Top = 22
      Width = 21
      Height = 14
      Alignment = laTop
      BorderWidth = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      LedWidth = 16
      OffColor = clBlack
    end
    object Label2: TLabel
      Left = 32
      Top = 21
      Width = 44
      Height = 13
      Caption = 'Baudrate'
    end
    object Label3: TLabel
      Left = 68
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Kbps'
    end
    object Edit_Data2: TEdit
      Left = 8
      Top = 402
      Width = 289
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentFont = False
      TabOrder = 0
    end
    object RadioType2: ZIniRadioGroup
      Left = 104
      Top = 16
      Width = 105
      Height = 41
      Caption = 'CAN TYPE'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'High'
        'Low')
      TabOrder = 1
      IniKey = 'CAN_SPEED_TYPE2'
      IniDataSource = INI
    end
    object ListViewTx2: TListView
      Left = 8
      Top = 64
      Width = 353
      Height = 113
      Columns = <
        item
          Caption = 'ID'
          Width = 60
        end
        item
          Caption = 'DATA'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'CT(ms)'
        end
        item
          Alignment = taRightJustify
          Caption = 'Time(ms)'
          Width = 80
        end>
      ColumnClick = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 2
      ViewStyle = vsReport
    end
    object ListViewRx2: TListView
      Left = 8
      Top = 184
      Width = 353
      Height = 209
      Columns = <
        item
          Caption = 'ID'
          Width = 60
        end
        item
          Caption = 'DATA'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'CT(ms)'
        end
        item
          Alignment = taRightJustify
          Caption = 'Time(ms)'
          Width = 80
        end>
      ColumnClick = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Terminal'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 3
      ViewStyle = vsReport
    end
    object Cb_BaudRate2: ZIniComboBox
      Left = 8
      Top = 40
      Width = 57
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '500'
      Items.Strings = (
        '500'
        '250'
        '125'
        '100'
        '83.3'
        '50'
        '33.3')
      SaveItems = False
      IniKey = 'CANSpeed1'
      IniDataSource = INI
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 496
    Width = 217
    Height = 121
    Caption = 'OPTION'
    TabOrder = 4
    object LedRun: TLed
      Left = 158
      Top = 24
      Width = 50
      Height = 22
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'Read'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      LedWidth = 16
      OffColor = clBlack
    end
    object CheckBoxRead: TCheckBox
      Left = 16
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Auto Read'
      TabOrder = 0
      OnClick = CheckBoxReadClick
    end
    object Edit_Interval: ZIniSpinEdit
      Left = 96
      Top = 24
      Width = 59
      Height = 22
      MaxValue = 2000
      MinValue = 10
      TabOrder = 1
      Value = 100
      IniKey = 'Interval'
      IniDataSource = INI
    end
    object CheckBox_Log: TCheckBox
      Left = 96
      Top = 48
      Width = 67
      Height = 17
      Caption = 'View Data'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox_ChangeClick
    end
    object CheckBox_AutoType: TCheckBox
      Left = 16
      Top = 48
      Width = 69
      Height = 17
      Caption = 'Auto Type'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBoxSave: TCheckBox
      Left = 16
      Top = 74
      Width = 81
      Height = 17
      Caption = 'Save File'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = CheckBoxSaveClick
    end
    object CheckBox_Change: TCheckBox
      Left = 96
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Change'
      TabOrder = 5
      OnClick = CheckBox_ChangeClick
    end
  end
  object MemoLog: TMemo
    Left = 232
    Top = 496
    Width = 521
    Height = 117
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 5
    WordWrap = False
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CAN'
    Left = 80
    Top = 176
  end
  object TimerCANRead: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerCANReadTimer
    Left = 82
    Top = 352
  end
  object ScieCalc: TScieCalc
    Left = 480
    Top = 648
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Text Files(*.txt)|*.txt'
    Left = 192
    Top = 176
  end
  object CommPortDriver1: TCommPortDriver
    LPTMode = False
    Left = 136
    Top = 312
  end
end
