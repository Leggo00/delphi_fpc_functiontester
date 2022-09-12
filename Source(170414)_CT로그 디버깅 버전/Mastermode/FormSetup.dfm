object FrmSetup: TFrmSetup
  Left = 523
  Top = 71
  BorderStyle = bsDialog
  Caption = #52769#51221#49444#51221
  ClientHeight = 823
  ClientWidth = 1142
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1142
    823)
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1142
    Height = 51
    Align = alTop
    TabOrder = 0
    object BtnSave: TSpeedButton
      Left = 8
      Top = 8
      Width = 64
      Height = 33
      Caption = #51200#51109
      OnClick = BtnSaveClick
    end
  end
  object PageControl1: TPageControl
    Left = 502
    Top = 48
    Width = 639
    Height = 765
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = #49884#54744' '#49444#51221
      ImageIndex = 3
      object Label1: TLabel
        Left = 320
        Top = 8
        Width = 95
        Height = 14
        Caption = '* '#45458#51060' '#52769#51221' SPEC'
      end
      object Label2: TLabel
        Left = 439
        Top = 37
        Width = 9
        Height = 14
        Caption = '~'
      end
      object Label7: TLabel
        Left = 439
        Top = 86
        Width = 9
        Height = 14
        Caption = '~'
      end
      object Label8: TLabel
        Left = 320
        Top = 64
        Width = 99
        Height = 14
        Caption = '*  '#51648#44536' '#52769#51221' SPEC'
      end
      object cbNoBarcode_1: ZIniCheckBox
        Left = 8
        Top = 4
        Width = 153
        Height = 17
        Caption = 'MOTOR '#48148#53076#46300' '#47924#49884
        TabOrder = 0
        IniKey = 'BarcodeNotUse_1'
        IniDataSource = TESTOPTION
      end
      object cbMesUse_1: ZIniCheckBox
        Left = 8
        Top = 52
        Width = 97
        Height = 17
        Caption = 'MES '#49324#50857
        TabOrder = 1
        IniKey = 'MesUse_1'
        IniDataSource = TESTOPTION
      end
      object cbMaster: ZIniCheckBox
        Left = 8
        Top = 100
        Width = 97
        Height = 17
        Caption = #47560#49828#53552' '#47784#46300
        TabOrder = 2
        IniKey = 'Master'
        IniDataSource = TESTOPTION
      end
      object cbNoBarcode_2: ZIniCheckBox
        Left = 8
        Top = 27
        Width = 137
        Height = 17
        Caption = 'ECU '#48148#53076#46300' '#47924#49884
        TabOrder = 3
        IniKey = 'BarcodeNotUse_2'
        IniDataSource = TESTOPTION
      end
      object cbItacUse: ZIniCheckBox
        Left = 8
        Top = 76
        Width = 97
        Height = 17
        Caption = 'ITAC '#49324#50857
        TabOrder = 4
        IniKey = 'ItacUse'
        IniDataSource = TESTOPTION
      end
      object cbStateNotUse_1: ZIniCheckBox
        Left = 8
        Top = 124
        Width = 97
        Height = 17
        Caption = #51060#51204#44277#51221' '#47924#49884
        TabOrder = 5
        IniKey = 'StateNotUse_1'
        IniDataSource = TESTOPTION
      end
      object cbAutoModel: ZIniCheckBox
        Left = 8
        Top = 148
        Width = 97
        Height = 17
        Caption = #51088#46041' '#47784#45944' '#48320#44221
        TabOrder = 6
        IniKey = 'AutoModel'
        IniDataSource = TESTOPTION
      end
      object edtMin: ZIniEdit
        Left = 320
        Top = 32
        Width = 109
        Height = 22
        ImeName = 'Microsoft IME 2010'
        TabOrder = 7
        IniKey = 'Min'
        IniDataSource = TESTOPTION
        MoveCursor = False
      end
      object edtMax: ZIniEdit
        Left = 456
        Top = 32
        Width = 109
        Height = 22
        ImeName = 'Microsoft IME 2010'
        TabOrder = 8
        IniKey = 'Max'
        IniDataSource = TESTOPTION
        MoveCursor = False
      end
      object cbMasterEcuSkip: ZIniCheckBox
        Left = 8
        Top = 171
        Width = 273
        Height = 17
        Caption = #47560#49828#53552' '#44160#49324#49884' Ecu '#48148#53076#46300' Skip'
        TabOrder = 9
        IniKey = 'MasterEcuSkip'
        IniDataSource = TESTOPTION
      end
      object cbJIGCheck: ZIniCheckBox
        Left = 7
        Top = 193
        Width = 97
        Height = 17
        Caption = 'PLC JIG Check'
        TabOrder = 10
        IniKey = 'JIGCheck'
        IniDataSource = TESTOPTION
      end
      object cbReMasterMode: ZIniCheckBox
        Left = 7
        Top = 212
        Width = 254
        Height = 17
        Caption = 'PLC '#47784#45944' '#48320#44221#49884' Auto Master Mode '#51116#51089#50629
        TabOrder = 11
        IniKey = 'ReMasterMode'
        IniDataSource = TESTOPTION
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 230
        Width = 687
        Height = 575
        TabOrder = 12
        object Label3: TLabel
          Left = 4
          Top = 25
          Width = 87
          Height = 14
          Caption = '* Check Time : '
        end
        object Label4: TLabel
          Left = 272
          Top = 24
          Width = 9
          Height = 14
          Caption = '~'
        end
        object Label5: TLabel
          Left = 272
          Top = 48
          Width = 9
          Height = 14
          Caption = '~'
        end
        object GridMaster: TAdvStringGrid
          Left = 0
          Top = 123
          Width = 669
          Height = 471
          Cursor = crDefault
          HelpContext = 9
          ColCount = 6
          FixedCols = 0
          RowCount = 9
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ScrollBars = ssVertical
          TabOrder = 0
          OnKeyDown = GridMasterKeyDown
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            'Use'
            'Barcode'
            'ModelCode'
            'JIGModel'
            'Try'
            'Oring Skip Master')
          Filter = <>
          FixedColWidth = 37
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
          ScrollBarAlways = saVert
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
          ColWidths = (
            37
            238
            138
            64
            46
            120)
          object lbMaster: ZIniListBox
            Left = 271
            Top = 124
            Width = 170
            Height = 53
            ImeName = 'Microsoft IME 2010'
            ItemHeight = 14
            Items.Strings = (
              'Master Grid '#45236#50857' '#51200#51109#50857)
            TabOrder = 3
            Visible = False
            SaveItems = True
            IniKey = 'MasterBarcode'
            IniDataSource = TESTOPTION
          end
          object edtMasterTime1: ZIniEdit
            Left = 91
            Top = 45
            Width = 30
            Height = 22
            Hint = '08:30:00 or 17:30:00'
            ImeName = 'Microsoft IME 2010'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Visible = False
            IniKey = 'MasterTime1'
            IniDataSource = TESTOPTION
            MoveCursor = False
          end
          object edtMasterTime2: ZIniEdit
            Left = 139
            Top = 45
            Width = 30
            Height = 22
            Hint = '08:30:00 or 17:30:00'
            ImeName = 'Microsoft IME 2010'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            Visible = False
            IniKey = 'MasterTime2'
            IniDataSource = TESTOPTION
            MoveCursor = False
          end
          object edtMasterTime3: ZIniEdit
            Left = 91
            Top = 69
            Width = 30
            Height = 22
            Hint = '08:30:00 or 17:30:00'
            ImeName = 'Microsoft IME 2010'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Visible = False
            IniKey = 'MasterTime3'
            IniDataSource = TESTOPTION
            MoveCursor = False
          end
          object edtMasterTime4: ZIniEdit
            Left = 139
            Top = 69
            Width = 30
            Height = 22
            Hint = '08:30:00 or 17:30:00'
            ImeName = 'Microsoft IME 2010'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Visible = False
            IniKey = 'MasterTime4'
            IniDataSource = TESTOPTION
            MoveCursor = False
          end
        end
        object cbMasteralarm: ZIniCheckBox
          Left = 5
          Top = 0
          Width = 97
          Height = 17
          Caption = #47560#49828#53552' Alarm'
          TabOrder = 1
          IniKey = 'Masteralarm'
          IniDataSource = TESTOPTION
        end
        object DateTimePicker2: TDateTimePicker
          Tag = 100
          Left = 286
          Top = 20
          Width = 106
          Height = 23
          Date = 40463.336805555550000000
          Time = 40463.336805555550000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 2
        end
        object DateTimePicker1: TDateTimePicker
          Tag = 100
          Left = 165
          Top = 20
          Width = 106
          Height = 23
          Date = 40463.375000000000000000
          Time = 40463.375000000000000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 3
        end
        object cbDayUse: ZIniCheckBox
          Left = 95
          Top = 24
          Width = 70
          Height = 17
          Caption = #51452#44036#49884#44036
          TabOrder = 4
          IniKey = 'DayUse'
          IniDataSource = TESTOPTION
        end
        object DateTimePicker4: TDateTimePicker
          Tag = 100
          Left = 286
          Top = 44
          Width = 106
          Height = 23
          Date = 40463.336805555550000000
          Time = 40463.336805555550000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 5
        end
        object DateTimePicker3: TDateTimePicker
          Tag = 100
          Left = 165
          Top = 44
          Width = 106
          Height = 23
          Date = 40463.375000000000000000
          Time = 40463.375000000000000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 6
        end
        object cbNightUse: ZIniCheckBox
          Left = 95
          Top = 48
          Width = 70
          Height = 17
          Caption = #50556#44036#49884#44036
          TabOrder = 7
          IniKey = 'NightUse'
          IniDataSource = TESTOPTION
        end
        object cbStopTimeUse: ZIniCheckBox
          Left = 8
          Top = 74
          Width = 169
          Height = 17
          Caption = #49444#48708' '#51221#51648' '#49884#44036' '#44036#44201' (Min)  : '
          TabOrder = 8
          IniKey = 'StopTimeUse'
          IniDataSource = TESTOPTION
        end
        object edtStopTime: ZIniEdit
          Left = 192
          Top = 73
          Width = 121
          Height = 22
          Hint = '60'
          ImeName = 'Microsoft IME 2010'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          IniKey = 'StopTime'
          IniDataSource = TESTOPTION
          MoveCursor = False
        end
        object BitBtn1: TBitBtn
          Left = 395
          Top = 21
          Width = 75
          Height = 23
          Caption = 'Reset'
          TabOrder = 10
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 395
          Top = 45
          Width = 75
          Height = 23
          Caption = 'Reset'
          TabOrder = 11
          OnClick = BitBtn2Click
        end
      end
      object edtJigMin: ZIniEdit
        Left = 320
        Top = 86
        Width = 109
        Height = 22
        ImeName = 'Microsoft IME 2010'
        TabOrder = 13
        IniKey = 'JIGMIN'
        IniDataSource = TESTOPTION
        MoveCursor = False
      end
      object edtJigMax: ZIniEdit
        Left = 456
        Top = 86
        Width = 109
        Height = 22
        ImeName = 'Microsoft IME 2010'
        TabOrder = 14
        IniKey = 'JIGMAX'
        IniDataSource = TESTOPTION
        MoveCursor = False
      end
    end
  end
  object PageControl2: TPageControl
    Left = 3
    Top = 48
    Width = 493
    Height = 765
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'LOADING'
      ImageIndex = 3
      object cbWorkOder: ZIniCheckBox
        Left = 8
        Top = 5
        Width = 112
        Height = 17
        Caption = 'WorkOder Check'
        TabOrder = 0
        IniKey = 'WorkOderUse'
        IniDataSource = TESTOPTION
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 32
        Width = 489
        Height = 705
        TabOrder = 1
        object Label6: TLabel
          Left = 10
          Top = 28
          Width = 44
          Height = 14
          Caption = 'Barcode'
        end
        object cbMasterCheck: ZIniCheckBox
          Left = 8
          Top = 0
          Width = 193
          Height = 17
          Caption = #47560#49828#53552' '#51228#54408' Upload '#50504#54632
          TabOrder = 0
          IniKey = 'cbMasterCheck'
          IniDataSource = TESTOPTION
        end
        object GridLoad: TAdvStringGrid
          Left = 6
          Top = 55
          Width = 478
          Height = 650
          Cursor = crDefault
          HelpContext = 9
          ColCount = 3
          FixedCols = 0
          RowCount = 9
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ScrollBars = ssVertical
          TabOrder = 1
          OnKeyDown = GridLoadKeyDown
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            'Use'
            'Barcode'
            'Info')
          Filter = <>
          FixedColWidth = 37
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
          ScrollBarAlways = saVert
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
          ColWidths = (
            37
            220
            195)
          object lbLoadBarcode: ZIniListBox
            Left = 271
            Top = 124
            Width = 170
            Height = 53
            ImeName = 'Microsoft IME 2010'
            ItemHeight = 14
            Items.Strings = (
              'Master Grid '#45236#50857' '#51200#51109#50857)
            TabOrder = 3
            Visible = False
            SaveItems = True
            IniKey = 'LoadBarocde'
            IniDataSource = TESTOPTION
          end
        end
        object edtSerachBarcode: ZIniEdit
          Left = 59
          Top = 26
          Width = 342
          Height = 22
          ImeName = 'Microsoft IME 2010'
          TabOrder = 2
          MoveCursor = False
        end
        object Button1: TButton
          Left = 408
          Top = 24
          Width = 75
          Height = 25
          Caption = #44160#49353
          TabOrder = 3
          OnClick = Button1Click
        end
      end
    end
  end
  object TESTOPTION: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'TESTOPTION'
    Left = 149
    Top = 8
  end
end
