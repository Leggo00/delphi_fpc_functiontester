object FrmKMIMBCOPWM: TFrmKMIMBCOPWM
  Left = 672
  Top = 334
  BorderStyle = bsDialog
  Caption = 'PWM & SIGNAL BOARD(Ver MBCO)'
  ClientHeight = 527
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 41
    Align = alTop
    TabOrder = 0
    object dpbLabel1: TdpbLabel
      Left = 9
      Top = 3
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object BtnConnect: TSpeedButton
      Left = 76
      Top = 5
      Width = 73
      Height = 33
      Caption = #50672#44208
      OnClick = BtnConnectClick
    end
    object SpeedButton2: TSpeedButton
      Left = 148
      Top = 5
      Width = 73
      Height = 33
      Caption = #54644#51228
      OnClick = SpeedButton2Click
    end
    object Edit_Comport: ZIniSpinEdit
      Left = 8
      Top = 16
      Width = 65
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'Comport'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 508
    Width = 569
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 569
    Height = 467
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Control'
      object Label9: TLabel
        Left = 5
        Top = 262
        Width = 60
        Height = 12
        Caption = #53685#49888#47784#45768#53552
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 6
        Width = 273
        Height = 249
        Caption = 'PWM CONTROL'
        TabOrder = 0
        object BtnReset: TSpeedButton
          Left = 188
          Top = 13
          Width = 73
          Height = 28
          Caption = 'RESET'
          OnClick = BtnResetClick
        end
        object Label1: TLabel
          Left = 8
          Top = 52
          Width = 23
          Height = 12
          Caption = 'CH1'
        end
        object Label2: TLabel
          Left = 56
          Top = 32
          Width = 57
          Height = 12
          Caption = 'FREQ(Hz)'
        end
        object Label3: TLabel
          Left = 128
          Top = 32
          Width = 52
          Height = 12
          Caption = 'DUTY(%)'
        end
        object Label4: TLabel
          Left = 8
          Top = 76
          Width = 23
          Height = 12
          Caption = 'CH2'
        end
        object SpeedButton1: TSpeedButton
          Tag = 13
          Left = 187
          Top = 49
          Width = 62
          Height = 20
          Caption = 'SET'
          OnClick = SetPWM
        end
        object SpeedButton3: TSpeedButton
          Tag = 14
          Left = 187
          Top = 73
          Width = 62
          Height = 20
          Caption = 'SET'
          OnClick = SetPWM
        end
        object SpeedButton4: TSpeedButton
          Tag = 11
          Left = 51
          Top = 97
          Width = 62
          Height = 20
          Caption = 'SET'
          OnClick = SetPWM
        end
        object SpeedButton5: TSpeedButton
          Tag = 12
          Left = 123
          Top = 97
          Width = 62
          Height = 20
          Caption = 'SET'
          OnClick = SetPWM
        end
        object Edit_Ch1Freq: TNumberEdit
          Left = 48
          Top = 48
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 6
          TabOrder = 0
          Text = '0'
          Min = -10000000000.000000000000000000
          Max = 9900.000000000000000000
          FormatStr = '#,###,##0.###'
        end
        object Edit_Ch1Duty: TNumberEdit
          Left = 120
          Top = 48
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 6
          TabOrder = 1
          Text = '0'
          Min = -10000000000.000000000000000000
          Max = 100.000000000000000000
          FormatStr = '#,###,##0.###'
        end
        object Edit_Ch2Freq: TNumberEdit
          Left = 48
          Top = 72
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 6
          TabOrder = 2
          Text = '0'
          Min = -10000000000.000000000000000000
          Max = 9900.000000000000000000
          FormatStr = '#,###,##0.###'
        end
        object Edit_Ch2Duty: TNumberEdit
          Left = 120
          Top = 72
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 6
          TabOrder = 3
          Text = '0'
          Min = -10000000000.000000000000000000
          Max = 100.000000000000000000
          FormatStr = '#,###,##0.###'
        end
        object btn_MBCO_Set: TButton
          Left = 96
          Top = 216
          Width = 75
          Height = 25
          Caption = 'MBCO Set'
          TabOrder = 4
          OnClick = btn_MBCO_SetClick
        end
        object btn_MBCO_RESET: TButton
          Left = 8
          Top = 216
          Width = 81
          Height = 25
          Caption = 'MBCO ReSet'
          TabOrder = 5
          OnClick = btn_MBCO_RESETClick
        end
        object btn_MBCO_PosSet: TButton
          Left = 176
          Top = 216
          Width = 89
          Height = 25
          Caption = 'Pos Set(bit)'
          TabOrder = 6
          OnClick = btn_MBCO_PosSetClick
        end
        object edt_MBCO_POS_dec: TNumberEdit
          Left = 176
          Top = 192
          Width = 89
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 6
          TabOrder = 7
          Text = '0'
          Min = -10000000000.000000000000000000
          Max = 4096.000000000000000000
          FormatStr = '######0.###'
        end
      end
      object GroupBox2: TGroupBox
        Left = 283
        Top = 6
        Width = 273
        Height = 249
        Caption = 'SIGNAL CONTROL'
        TabOrder = 1
        object SpeedButton6: TSpeedButton
          Left = 12
          Top = 37
          Width = 73
          Height = 20
          Caption = 'All Low'
          OnClick = SignalResetClick
        end
        object SpeedButton7: TSpeedButton
          Tag = 1
          Left = 92
          Top = 37
          Width = 73
          Height = 20
          Caption = 'Default'
          OnClick = SignalResetClick
        end
        object SpeedButton8: TSpeedButton
          Tag = 2
          Left = 172
          Top = 37
          Width = 73
          Height = 20
          Caption = 'All High'
          OnClick = SignalResetClick
        end
        object Label5: TLabel
          Left = 16
          Top = 24
          Width = 40
          Height = 12
          Caption = 'RESET'
        end
        object Label6: TLabel
          Left = 16
          Top = 80
          Width = 76
          Height = 12
          Caption = 'SET STATUS'
        end
        object BtnWrite: TSpeedButton
          Left = 172
          Top = 101
          Width = 73
          Height = 20
          Caption = 'WRITE'
          OnClick = BtnWriteClick
        end
        object BtnRead: TSpeedButton
          Left = 172
          Top = 125
          Width = 73
          Height = 20
          Caption = 'READ'
          OnClick = BtnReadClick
        end
        object Label7: TLabel
          Left = 16
          Top = 168
          Width = 36
          Height = 12
          Caption = 'INDEX'
        end
        object SpeedButton9: TSpeedButton
          Left = 172
          Top = 181
          Width = 73
          Height = 20
          Caption = 'SET'
          OnClick = SpeedButton9Click
        end
        object SpeedButton10: TSpeedButton
          Left = 172
          Top = 205
          Width = 73
          Height = 20
          Caption = 'SWEEP'
          OnClick = SpeedButton10Click
        end
        object Label8: TLabel
          Left = 80
          Top = 168
          Width = 59
          Height = 12
          Caption = 'INTERVAL'
        end
        object Cb_1: TCheckBox
          Left = 16
          Top = 96
          Width = 49
          Height = 17
          Caption = '1'
          TabOrder = 0
        end
        object Cb_2: TCheckBox
          Left = 16
          Top = 112
          Width = 49
          Height = 17
          Caption = '2'
          TabOrder = 1
        end
        object Cb_3: TCheckBox
          Left = 16
          Top = 128
          Width = 49
          Height = 17
          Caption = '3'
          TabOrder = 2
        end
        object Cb_4: TCheckBox
          Left = 80
          Top = 96
          Width = 49
          Height = 17
          Caption = '4'
          TabOrder = 3
        end
        object Cb_5: TCheckBox
          Left = 80
          Top = 112
          Width = 49
          Height = 17
          Caption = '5'
          TabOrder = 4
        end
        object Cb_6: TCheckBox
          Left = 80
          Top = 128
          Width = 49
          Height = 17
          Caption = '6'
          TabOrder = 5
        end
        object Ed_Index: TSpinEdit
          Left = 16
          Top = 184
          Width = 57
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
        object Ed_Interval: TSpinEdit
          Left = 80
          Top = 184
          Width = 57
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 7
          Value = 100
        end
      end
      object Memo: TMemo
        Left = 3
        Top = 281
        Width = 550
        Height = 151
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Terminal'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'THETA TABLE'
      ImageIndex = 1
      object Grid: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 561
        Height = 440
        Cursor = crDefault
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        Filter = <>
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
      end
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'MBCOPWM'
    Left = 80
    Top = 344
  end
end
