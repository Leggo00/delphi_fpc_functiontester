object FrmTos9201: TFrmTos9201
  Left = 418
  Top = 222
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #45236#51204#50517'/'#51208#50672#51200#54637' [TOS9201]'
  ClientHeight = 568
  ClientWidth = 803
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
    Width = 803
    Height = 501
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
      Top = 73
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
    object dpbLabel1: TdpbLabel
      Left = 11
      Top = 466
      Width = 94
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Voltage'
      Color = 16744576
      EdgeStyle = desBump
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
    end
    object lblVoltage: TdpbLabel
      Left = 104
      Top = 466
      Width = 113
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
    object dpbLabel2: TdpbLabel
      Left = 221
      Top = 466
      Width = 94
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Current'
      Color = 16744576
      EdgeStyle = desBump
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
    end
    object lblCurrent: TdpbLabel
      Left = 313
      Top = 466
      Width = 113
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
    object dpbLabel3: TdpbLabel
      Left = 431
      Top = 466
      Width = 94
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Resistance'
      Color = 16744576
      EdgeStyle = desBump
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
    end
    object lblResistance: TdpbLabel
      Left = 524
      Top = 466
      Width = 113
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
    object btnSend: TBitBtn
      Left = 597
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
      Width = 582
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
      Top = 61
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
      Top = 88
      Width = 294
      Height = 364
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
      Left = 310
      Top = 60
      Width = 482
      Height = 392
      ActivePage = TabSheet4
      TabOrder = 4
      object TabSheet1: TTabSheet
        Caption = 'COMMAND LIST'
        object listCommand: TListBox
          Left = 0
          Top = 0
          Width = 474
          Height = 364
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 11
          Items.Strings = (
            'START       ; Starting Test'
            'STOP        ; Stops a Test'
            'FUN 0       ; Current Mode          0=ACW, 1=DCW, 2=IR,'
            '                                    3=Auto Test, 4=Auto Edit,'
            
              '                                    5=System, 6=Offset Adj, 7=In' +
              'terface'
            'VDATA?      ; Monitor voltage'
            'IDATA?      ; Monitor current'
            'RDATA?      ; Monitor resistance'
            'BUZZERVOL 0 ; Buzzer volume         0 - 10')
          ParentFont = False
          TabOrder = 0
          OnDblClick = listCommandDblClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'ACW'
        ImageIndex = 1
        object Label2: TLabel
          Left = 7
          Top = 168
          Width = 67
          Height = 13
          Caption = #9670'  Voltage(V)'
        end
        object Label7: TLabel
          Left = 7
          Top = 192
          Width = 87
          Height = 13
          Caption = #9670'  Frequency(Hz)'
        end
        object Label8: TLabel
          Left = 7
          Top = 217
          Width = 68
          Height = 13
          Caption = #9670'  Lower(mA)'
        end
        object Label4: TLabel
          Left = 7
          Top = 241
          Width = 68
          Height = 13
          Caption = #9670'  Upper(mA)'
        end
        object Label5: TLabel
          Left = 7
          Top = 266
          Width = 55
          Height = 13
          Caption = #9670'  Timer(s)'
        end
        object Label6: TLabel
          Left = 7
          Top = 290
          Width = 46
          Height = 13
          Caption = #9670'  Offset'
        end
        object Label10: TLabel
          Left = 269
          Top = 168
          Width = 92
          Height = 13
          Caption = #9670'  Start Voltage(V)'
        end
        object Label12: TLabel
          Left = 269
          Top = 192
          Width = 79
          Height = 13
          Caption = #9670'  Rise Timer(s)'
        end
        object Label13: TLabel
          Left = 269
          Top = 217
          Width = 74
          Height = 13
          Caption = #9670'  Fall Timer(s)'
        end
        object Label18: TLabel
          Left = 269
          Top = 241
          Width = 50
          Height = 13
          Caption = #9670'  Range'
        end
        object Label22: TLabel
          Left = 269
          Top = 266
          Width = 49
          Height = 13
          Caption = #9670'  Speed'
        end
        object Label23: TLabel
          Left = 269
          Top = 290
          Width = 53
          Height = 13
          Caption = #9670'  Ground'
        end
        object Label24: TLabel
          Left = 269
          Top = 315
          Width = 88
          Height = 13
          Caption = #9670'  Contact check'
        end
        object btnSendACW: TButton
          Left = 12
          Top = 315
          Width = 199
          Height = 31
          Caption = 'ACW SEND'
          TabOrder = 0
        end
        object ListBox2: TListBox
          Left = 0
          Top = 0
          Width = 474
          Height = 161
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 11
          Items.Strings = (
            'A:TES  5200      ; Voltage               0 - 5200        (V)'
            'A:FREQ 50        ; Frequency             50, 60          (Hz)'
            
              'A:LOW  0.0001,1  ; Lower current         0.0001 - 0.10   (A), 0=' +
              'Off, 1=On'
            'A:UPP  0.1       ; Upper current         0.0001 - 0.10   (A)'
            
              'A:TIM  0.5,1     ; Test time             0.3 - 999       (s), 0=' +
              'Off, 1=On'
            'A:OFF  0         ; Offset                0=Off, 1=On'
            'A:STAR 0         ; Start voltage         0 - 99          (%)'
            'A:RTIM 0.1       ; Rise time             0.1 - 200       (s)'
            'A:FTIM 1         ; Fall time             0.0 - 200       (s)'
            'A:VRAN 0         ; Output-voltage range  0=AUTO, 1=5kV'
            'A:RES  0         ; Current detection     0=SLOW, 1:MID, 2:FAST'
            '                   response speed'
            'A:GND  0         ; Ground                0=LOW, 1=GUARD'
            'A:CCH  0         ; Contact check         0=Off, 1=On')
          ParentFont = False
          TabOrder = 1
          OnDblClick = listCommandDblClick
        end
        object edtACW_Voltage: ZIniSpinEdit
          Left = 108
          Top = 164
          Width = 71
          Height = 22
          MaxValue = 5200
          MinValue = 0
          TabOrder = 2
          Value = 0
          IniKey = 'edtACW_Voltage'
          IniDataSource = INI
        end
        object edtACW_Frequency: ZIniComboBox
          Left = 108
          Top = 188
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            '50'
            '60')
          SaveItems = False
          IniKey = 'edtACW_Frequency'
          IniDataSource = INI
        end
        object cmbACW_LowerOnOff: ZIniComboBox
          Left = 182
          Top = 213
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbACW_LowerOnOff'
          IniDataSource = INI
        end
        object edtACW_Lower: ZIniRealSpinEdit
          Left = 108
          Top = 213
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 0.100000000000000000
          MinValue = 0.000100000000000000
          TabOrder = 5
          IniKey = 'edtACW_Lower'
          IniDataSource = INI
        end
        object edtACW_Upper: ZIniRealSpinEdit
          Left = 108
          Top = 237
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 0.100000000000000000
          MinValue = 0.000100000000000000
          TabOrder = 6
          Value = 0.100000000000000000
          IniKey = 'edtACW_Upper'
          IniDataSource = INI
        end
        object cmbACW_TimerOnOff: ZIniComboBox
          Left = 182
          Top = 262
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 7
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbACW_TimerOnOff'
          IniDataSource = INI
        end
        object edtACW_Timer: ZIniRealSpinEdit
          Left = 108
          Top = 262
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 999.000000000000000000
          MinValue = 0.300000000000000000
          TabOrder = 8
          Value = 0.300000000000000000
          IniKey = 'edtACW_Timer'
          IniDataSource = INI
        end
        object cmbACW_OffsetOnOff: ZIniComboBox
          Left = 108
          Top = 286
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 9
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbACW_OffsetOnOff'
          IniDataSource = INI
        end
        object edtACW_StartVoltage: ZIniSpinEdit
          Left = 370
          Top = 164
          Width = 71
          Height = 22
          MaxValue = 1
          MinValue = 1
          TabOrder = 10
          Value = 1
          IniKey = 'edtACW_StartVoltage'
          IniDataSource = INI
        end
        object edtACW_RiseTime: ZIniRealSpinEdit
          Left = 370
          Top = 188
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 200.000000000000000000
          MinValue = 0.100000000000000000
          TabOrder = 11
          Value = 0.100000000000000000
          IniKey = 'edtACW_RiseTime'
          IniDataSource = INI
        end
        object edtACW_FallTime: ZIniRealSpinEdit
          Left = 370
          Top = 213
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 200.000000000000000000
          TabOrder = 12
          IniKey = 'edtACW_FallTime'
          IniDataSource = INI
        end
        object cmbACW_Range: ZIniComboBox
          Left = 370
          Top = 237
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 13
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbACW_Range'
          IniDataSource = INI
        end
        object cmbACW_ResponseSpeed: ZIniComboBox
          Left = 370
          Top = 262
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 14
          Items.Strings = (
            '0'
            '1'
            '2')
          SaveItems = False
          IniKey = 'cmbACW_ResponseSpeed'
          IniDataSource = INI
        end
        object cmbACW_Ground: ZIniComboBox
          Left = 370
          Top = 286
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 15
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbACW_Ground'
          IniDataSource = INI
        end
        object cmbACW_ContactCheck: ZIniComboBox
          Left = 370
          Top = 311
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 16
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbACW_ContactCheck'
          IniDataSource = INI
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'DCW'
        ImageIndex = 2
        object Label11: TLabel
          Left = 7
          Top = 167
          Width = 67
          Height = 13
          Caption = #9670'  Voltage(V)'
        end
        object Label15: TLabel
          Left = 7
          Top = 192
          Width = 68
          Height = 13
          Caption = #9670'  Lower(mA)'
        end
        object Label25: TLabel
          Left = 7
          Top = 217
          Width = 68
          Height = 13
          Caption = #9670'  Upper(mA)'
        end
        object Label26: TLabel
          Left = 7
          Top = 242
          Width = 55
          Height = 13
          Caption = #9670'  Timer(s)'
        end
        object Label28: TLabel
          Left = 7
          Top = 267
          Width = 92
          Height = 13
          Caption = #9670'  Start Voltage(V)'
        end
        object Label29: TLabel
          Left = 7
          Top = 292
          Width = 79
          Height = 13
          Caption = #9670'  Rise Timer(s)'
        end
        object Label30: TLabel
          Left = 277
          Top = 168
          Width = 80
          Height = 13
          Caption = #9670'  Wait Timer(s)'
        end
        object Label37: TLabel
          Left = 277
          Top = 193
          Width = 53
          Height = 13
          Caption = #9670'  Ground'
        end
        object Label39: TLabel
          Left = 277
          Top = 217
          Width = 88
          Height = 13
          Caption = #9670'  Contact check'
        end
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 474
          Height = 161
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 11
          Items.Strings = (
            'D:TES  6100      ; Voltage               0 - 6100           (V)'
            
              'D:LOW  0.00001,1 ; Lower current         0.00001 - 0.011    (A),' +
              ' 0=Off, 1=On'
            'D:UPP  0.1       ; Upper current         0.00001 - 0.011    (A)'
            
              'D:TIM  0.5,1     ; Test time             0.3 - 999          (s),' +
              ' 0=Off, 1=On'
            'D:STAR 0         ; Start voltage         0 - 99             (%)'
            'D:RTIM 0.1       ; Rise time             0.1 - 200          (s)'
            'D:WTIM 1         ; Wait time             0.3 - 10           (s)'
            'D:GND  0         ; Ground                0=LOW, 1=GUARD'
            'D:CCH  0         ; Contact check         0=Off, 1=On')
          ParentFont = False
          TabOrder = 0
          OnDblClick = listCommandDblClick
        end
        object edtDCW_Voltage: ZIniSpinEdit
          Left = 108
          Top = 164
          Width = 71
          Height = 22
          MaxValue = 6100
          MinValue = 0
          TabOrder = 1
          Value = 0
          IniKey = 'edtDCW_Voltage'
          IniDataSource = INI
        end
        object cmbDCW_LowerOnOff: ZIniComboBox
          Left = 182
          Top = 189
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbDCW_LowerOnOff'
          IniDataSource = INI
        end
        object edtDCW_Lower: ZIniRealSpinEdit
          Left = 108
          Top = 188
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 0.011000000000000000
          MinValue = 0.000010000000000000
          TabOrder = 3
          IniKey = 'edtDCW_Lower'
          IniDataSource = INI
        end
        object edtDCW_Upper: ZIniRealSpinEdit
          Left = 108
          Top = 213
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 0.011000000000000000
          MinValue = 0.000010000000000000
          TabOrder = 4
          Value = 0.011000000000000000
          IniKey = 'edtDCW_Upper'
          IniDataSource = INI
        end
        object cmbDCW_TimerOnOff: ZIniComboBox
          Left = 182
          Top = 239
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 5
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbDCW_TimerOnOff'
          IniDataSource = INI
        end
        object edtDCW_Timer: ZIniRealSpinEdit
          Left = 108
          Top = 238
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 999.000000000000000000
          MinValue = 0.300000000000000000
          TabOrder = 6
          Value = 0.300000000000000000
          IniKey = 'edtDCW_Timer'
          IniDataSource = INI
        end
        object edtDCW_StartVoltage: ZIniSpinEdit
          Left = 108
          Top = 263
          Width = 71
          Height = 22
          MaxValue = 99
          MinValue = 0
          TabOrder = 7
          Value = 0
          IniKey = 'edtDCW_StartVoltage'
          IniDataSource = INI
        end
        object edtDCW_RiseTime: ZIniRealSpinEdit
          Left = 108
          Top = 287
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 200.000000000000000000
          MinValue = 0.100000000000000000
          TabOrder = 8
          Value = 0.100000000000000000
          IniKey = 'edtDCW_RiseTime'
          IniDataSource = INI
        end
        object edtDCW_WaitTime: ZIniRealSpinEdit
          Left = 378
          Top = 164
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 10.000000000000000000
          MinValue = 0.300000000000000000
          TabOrder = 9
          IniKey = 'edtDCW_WaitTime'
          IniDataSource = INI
        end
        object cmbDCW_Ground: ZIniComboBox
          Left = 378
          Top = 189
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbDCW_Ground'
          IniDataSource = INI
        end
        object cmbDCW_ContactCheck: ZIniComboBox
          Left = 378
          Top = 214
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbDCW_ContactCheck'
          IniDataSource = INI
        end
        object Button2: TButton
          Left = 14
          Top = 321
          Width = 199
          Height = 31
          Caption = 'DCW SEND'
          TabOrder = 12
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'IR'
        ImageIndex = 3
        object Label14: TLabel
          Left = 7
          Top = 167
          Width = 67
          Height = 13
          Caption = #9670'  Voltage(V)'
        end
        object Label17: TLabel
          Left = 7
          Top = 191
          Width = 68
          Height = 13
          Caption = #9670'  Lower(mA)'
        end
        object Label19: TLabel
          Left = 7
          Top = 216
          Width = 68
          Height = 13
          Caption = #9670'  Upper(mA)'
        end
        object Label20: TLabel
          Left = 7
          Top = 241
          Width = 55
          Height = 13
          Caption = #9670'  Timer(s)'
        end
        object Label31: TLabel
          Left = 7
          Top = 265
          Width = 79
          Height = 13
          Caption = #9670'  Rise Timer(s)'
        end
        object Label32: TLabel
          Left = 7
          Top = 289
          Width = 80
          Height = 13
          Caption = #9670'  Wait Timer(s)'
        end
        object Label35: TLabel
          Left = 273
          Top = 168
          Width = 53
          Height = 13
          Caption = #9670'  Ground'
        end
        object Label36: TLabel
          Left = 273
          Top = 192
          Width = 88
          Height = 13
          Caption = #9670'  Contact check'
        end
        object Button4: TButton
          Left = 8
          Top = 321
          Width = 200
          Height = 31
          Caption = 'IR SEND'
          TabOrder = 0
        end
        object ListBox3: TListBox
          Left = 0
          Top = 0
          Width = 474
          Height = 161
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 11
          Items.Strings = (
            'I:TES  500       ; Voltage               10 - 1020          (V)'
            
              'I:LOW  9999,1    ; Lower resistance      10000 - 9990000000 ('#8486'),' +
              ' 0=Off, 1=On'
            
              'I:UPP  10000,1   ; Upper resistance      10000 - 9990000000 ('#8486'),' +
              ' 0=Off, 1=On'
            
              'I:TIM  0.5,1     ; Test time             0.5 - 999          (s) ' +
              ', 0=Off, 1=On'
            'I:RTIM 0.1       ; Rise time             0.1 - 200          (s)'
            'I:WTIM 1         ; Wait time             0.3 - 10           (s)'
            'I:GND  0         ; Ground                0=LOW, 1=GUARD'
            'I:CCH  0         ; Contact check         0=Off, 1=On')
          ParentFont = False
          TabOrder = 1
          OnDblClick = listCommandDblClick
        end
        object edtIR_Voltage: ZIniSpinEdit
          Left = 108
          Top = 164
          Width = 71
          Height = 22
          MaxValue = 1020
          MinValue = 10
          TabOrder = 2
          Value = 10
          IniKey = 'edtIR_Voltage'
          IniDataSource = INI
        end
        object cmbIR_LowerOnOff: ZIniComboBox
          Left = 182
          Top = 188
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbIR_LowerOnOff'
          IniDataSource = INI
        end
        object edtIR_Lower: ZIniRealSpinEdit
          Left = 108
          Top = 188
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 9990000000.000000000000000000
          MinValue = 10000.000000000000000000
          TabOrder = 4
          IniKey = 'edtIR_Lower'
          IniDataSource = INI
        end
        object edtIR_Upper: ZIniRealSpinEdit
          Left = 108
          Top = 212
          Width = 71
          Height = 22
          Increment = 0.010000000000000000
          MaxValue = 9990000000.000000000000000000
          MinValue = 10000.000000000000000000
          TabOrder = 5
          Value = 10000.000000000000000000
          IniKey = 'edtIR_Upper'
          IniDataSource = INI
        end
        object cmbIR_TimerOnOff: ZIniComboBox
          Left = 182
          Top = 238
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 6
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbIR_TimerOnOff'
          IniDataSource = INI
        end
        object edtIR_Timer: ZIniRealSpinEdit
          Left = 108
          Top = 237
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 999.000000000000000000
          MinValue = 0.500000000000000000
          TabOrder = 7
          Value = 0.500000000000000000
          IniKey = 'edtIR_Timer'
          IniDataSource = INI
        end
        object edtIR_RiseTime: ZIniRealSpinEdit
          Left = 108
          Top = 261
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 200.000000000000000000
          MinValue = 0.100000000000000000
          TabOrder = 8
          Value = 0.100000000000000000
          IniKey = 'edtIR_RiseTime'
          IniDataSource = INI
        end
        object edtIR_WaitTime: ZIniRealSpinEdit
          Left = 108
          Top = 286
          Width = 71
          Height = 22
          Increment = 0.100000000000000000
          MaxValue = 10.000000000000000000
          MinValue = 0.300000000000000000
          TabOrder = 9
          IniKey = 'edtIR_WaitTime'
          IniDataSource = INI
        end
        object cmbIR_Ground: ZIniComboBox
          Left = 374
          Top = 164
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbIR_Ground'
          IniDataSource = INI
        end
        object cmbIR_ContactCheck: ZIniComboBox
          Left = 374
          Top = 189
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            '0'
            '1')
          SaveItems = False
          IniKey = 'cmbIR_ContactCheck'
          IniDataSource = INI
        end
        object cmbIR_UpperOnOff: ZIniComboBox
          Left = 182
          Top = 213
          Width = 71
          Height = 21
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 13
          TabOrder = 12
          Items.Strings = (
            'OFF'
            'ON')
          SaveItems = False
          IniKey = 'cmbIR_UpperOnOff'
          IniDataSource = INI
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 681
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
    Width = 803
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Color = clInactiveBorder
    TabOrder = 1
    DesignSize = (
      803
      48)
    object GradientFill1: TGradientFill
      Left = 0
      Top = 0
      Width = 803
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
    object SpeedButton2: TSpeedButton
      Left = 431
      Top = 7
      Width = 80
      Height = 32
      Caption = #51221#51648
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 353
      Top = 7
      Width = 80
      Height = 32
      Caption = #49884#51089
      OnClick = SpeedButton3Click
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
      Left = 716
      Top = 9
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
    Top = 549
    Width = 803
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
    IniSection = 'TOS9201'
    Left = 388
    Top = 58
  end
  object Comm: TCommPortDriver
    ComPortSpeed = 19200
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 358
    Top = 58
  end
  object TimerRead: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerReadTimer
    Left = 418
    Top = 58
  end
end
