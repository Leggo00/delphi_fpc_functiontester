object FrmCP323: TFrmCP323
  Left = 410
  Top = 155
  BorderStyle = bsDialog
  Caption = 'DC POWER [ CP-323 ]'
  ClientHeight = 563
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 0
    Top = 349
    Width = 658
    Height = 16
    Align = alBottom
    AutoSize = False
    Caption = '   RECEIVE DATA'
  end
  object Label6: TLabel
    Left = 6
    Top = 35
    Width = 72
    Height = 13
    Caption = 'SEND DATA'
  end
  object Label1: TLabel
    Left = 6
    Top = 62
    Width = 98
    Height = 13
    Caption = 'COMMAND LIST'
  end
  object cmbComPort: ZIniComboBox
    Left = 6
    Top = 5
    Width = 99
    Height = 23
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ItemHeight = 15
    ParentFont = False
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
    IniKey = 'cmbComPort'
    IniDataSource = INI
  end
  object BtnSend: TBitBtn
    Left = 303
    Top = 27
    Width = 74
    Height = 29
    Caption = #51204#49569
    TabOrder = 1
    OnClick = BtnSendClick
  end
  object BtnClear: TBitBtn
    Left = 378
    Top = 27
    Width = 74
    Height = 29
    Caption = #52488#44592#54868
    TabOrder = 2
    OnClick = BtnClearClick
  end
  object listRxTxList: TListBox
    Left = 0
    Top = 365
    Width = 658
    Height = 179
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ItemHeight = 15
    ParentFont = False
    TabOrder = 3
  end
  object edtSend: TEdit
    Left = 86
    Top = 32
    Width = 209
    Height = 21
    ImeName = #54620#44397#50612'('#54620#44544')'
    TabOrder = 4
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 544
    Width = 658
    Height = 19
    Panels = <>
  end
  object BitBtn1: TBitBtn
    Left = 465
    Top = 27
    Width = 89
    Height = 29
    Caption = #51204#50896'ON'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object listCommand: TListBox
    Left = 5
    Top = 77
    Width = 447
    Height = 264
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    ItemHeight = 13
    Items.Strings = (
      '20 01; Remote Control Mode : 0=Panel, 1=Remote'
      '21 01; Output On/Off : 0=Off, 1=On'
      '22 ; Maximum Ouuput Voltage'
      '23 ; Output Voltage'
      '24 ; Output Current'
      '25 ; Communication address'
      '26 ; Reading present current/voltage'
      '27 ; Calibration Mode'
      '28 ; Reading Calibration State'
      '29 ; Calibrate Voltage value'
      '2A ; Sending the actual output voltage to calibration program'
      '2B ; Calibrate Current value'
      '2C ; Sending the actual output current to calibration program'
      '2D ; Save the calibration data to EEPROM'
      '2E ; Setting calibration information'
      '2F ; Reading calibration information'
      '31 ; Reading product'#39's model, serial information'
      '32 ; Restoring the factory default calibration data.'
      '37 ; enable the local key'
      '12 ; Return information of command operation in power supply')
    ParentFont = False
    TabOrder = 7
    OnDblClick = listCommandDblClick
  end
  object BitBtn2: TBitBtn
    Left = 558
    Top = 27
    Width = 89
    Height = 29
    Caption = #51204#50896'OFF'
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object chkConnectOnOff: ZIniCheckBox
    Left = 110
    Top = 8
    Width = 97
    Height = 17
    Caption = 'CONNECT'
    TabOrder = 9
    OnClick = chkConnectOnOffClick
    IniKey = 'chkConnectOnOff'
    IniDataSource = INI
  end
  object rdoControlMode: ZIniRadioGroup
    Left = 461
    Top = 77
    Width = 185
    Height = 47
    Caption = 'Control Mode'
    Columns = 2
    Items.Strings = (
      'PANEL'
      'REMOTE')
    TabOrder = 10
    OnClick = rdoControlModeClick
    IniDataSource = INI
  end
  object rdoOutputMode: ZIniRadioGroup
    Tag = 1
    Left = 461
    Top = 131
    Width = 185
    Height = 47
    Caption = 'Output Mode'
    Columns = 2
    Items.Strings = (
      'OFF'
      'ON')
    TabOrder = 11
    OnClick = rdoOutputModeClick
    IniDataSource = INI
  end
  object GroupBox1: TGroupBox
    Left = 461
    Top = 186
    Width = 185
    Height = 47
    Caption = 'Max Voltage'
    TabOrder = 12
    object edtMaxOutputVoltage: ZIniRealSpinEdit
      Left = 8
      Top = 18
      Width = 167
      Height = 22
      Increment = 1.000000000000000000
      TabOrder = 0
      Value = 16.000000000000000000
      IniKey = 'edtMaxOutputVoltage'
      IniDataSource = INI
    end
  end
  object GroupBox2: TGroupBox
    Left = 461
    Top = 240
    Width = 185
    Height = 47
    Caption = 'Voltage'
    TabOrder = 13
    object edtVoltage: ZIniRealSpinEdit
      Left = 8
      Top = 18
      Width = 167
      Height = 22
      Increment = 1.000000000000000000
      TabOrder = 0
      IniKey = 'edtVoltage'
      IniDataSource = INI
    end
  end
  object GroupBox3: TGroupBox
    Left = 461
    Top = 295
    Width = 185
    Height = 47
    Caption = 'Current'
    TabOrder = 14
    object edtCurrent: ZIniRealSpinEdit
      Left = 8
      Top = 18
      Width = 167
      Height = 22
      Increment = 1.000000000000000000
      MaxValue = 3.100000000000000000
      TabOrder = 0
      IniKey = 'edtCurrent'
      IniDataSource = INI
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'CP-323'
    Left = 221
    Top = 2
  end
  object Comm: TCommPortDriver
    ComPortSpeed = 19200
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 252
    Top = 2
  end
end
