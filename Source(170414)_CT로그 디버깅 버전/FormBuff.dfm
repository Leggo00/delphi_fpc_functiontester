object FrmBuff: TFrmBuff
  Left = 340
  Top = 138
  Width = 225
  Height = 438
  Caption = #51077#47141#48260#54140
  Color = clBtnFace
  Constraints.MaxWidth = 225
  Constraints.MinWidth = 225
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 31
    Align = alTop
    TabOrder = 0
    object BtnRecord: TSpeedButton
      Left = 27
      Top = 3
      Width = 62
      Height = 27
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Record'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333EEEEEEEEEEEEEEE3E0000000000000E3E0F77777777770E3E0F888888888
        70E3E0F88888888870E3E0F88899988870E3E0F88999998870E3E0F889999988
        70E3E0F88999998870E3E0F88899988870E3E0F88888888870E3E0F888888888
        70E3E0FFFFFFFFFFF0E3E0000000000000E3EEEEEEEEEEEEEEE3}
      OnClick = BtnRecordClick
    end
    object LedRec: TLed
      Left = 1
      Top = 3
      Width = 26
      Height = 26
      Alignment = laTop
      BorderWidth = 1
      Caption = 'REC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      LedWidth = 18
      Margin = 1
      OffColor = clBlack
      OnColor = clRed
    end
    object BtnReplay: TSpeedButton
      Left = 89
      Top = 3
      Width = 62
      Height = 27
      AllowAllUp = True
      Caption = 'Replay'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
        70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
        70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
        70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
      OnClick = BtnReplayClick
    end
    object BtnClear: TSpeedButton
      Left = 151
      Top = 3
      Width = 62
      Height = 27
      AllowAllUp = True
      Caption = 'Clear'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      OnClick = BtnClearClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 217
    Height = 26
    Align = alTop
    TabOrder = 1
    object BtnDelay: TSpeedButton
      Left = 2
      Top = 3
      Width = 39
      Height = 20
      Caption = 'Delay'
      Flat = True
      NumGlyphs = 2
      OnClick = BtnDelayClick
    end
    object BtnAddStep: TSpeedButton
      Left = 161
      Top = 3
      Width = 55
      Height = 20
      Caption = 'Add Step'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = BtnAddStepClick
    end
    object BtnGraph: TSpeedButton
      Left = 42
      Top = 3
      Width = 39
      Height = 20
      Caption = 'Graph'
      Flat = True
      NumGlyphs = 2
      OnClick = BtnGraphClick
    end
    object btnUp: TSpeedButton
      Left = 82
      Top = 3
      Width = 39
      Height = 20
      Caption = 'UP'
      Flat = True
      NumGlyphs = 2
      OnClick = btnUpClick
    end
    object btnDown: TSpeedButton
      Left = 121
      Top = 3
      Width = 39
      Height = 20
      Caption = 'Down'
      Flat = True
      NumGlyphs = 2
      OnClick = btnDownClick
    end
  end
  object TabControl: TTabControl
    Left = 0
    Top = 57
    Width = 217
    Height = 347
    Align = alClient
    TabOrder = 2
    Tabs.Strings = (
      #51077#47141#51312#44148
      #44160#49324#54980#51312#44148)
    TabIndex = 0
    OnChange = TabControlChange
    object InputGrid: TCheckStringGrid
      Left = 4
      Top = 24
      Width = 209
      Height = 319
      Align = alClient
      ColCount = 2
      DefaultColWidth = 50
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 100
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      KyungsangOrder = False
      ColAttribSTr = 'S;FM'
      ReadOnly = False
      ColWidths = (
        122
        61)
    end
  end
  object TimerLed: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerLedTimer
    Left = 48
    Top = 112
  end
end
