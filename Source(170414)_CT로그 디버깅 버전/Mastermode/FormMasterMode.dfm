object FrmMasterMode: TFrmMasterMode
  Left = -41
  Top = 465
  BorderStyle = bsDialog
  Caption = 'MASTER MODE'
  ClientHeight = 807
  ClientWidth = 1246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1246
    Height = 51
    Align = alTop
    TabOrder = 0
    OnDblClick = Panel1DblClick
    object BtnSave: TSpeedButton
      Left = 8
      Top = 8
      Width = 64
      Height = 33
      Caption = 'SAVE'
      OnClick = BtnSaveClick
    end
    object Button2: TButton
      Left = 376
      Top = 16
      Width = 177
      Height = 25
      Caption = 'POPUP TEST'
      TabOrder = 0
      Visible = False
      OnClick = Button2Click
    end
    object cbDebug: TCheckBox
      Left = 632
      Top = 24
      Width = 97
      Height = 17
      Caption = 'debug'
      TabOrder = 1
      Visible = False
    end
    object Cb_AutoNGStop: ZIniCheckBox
      Left = 792
      Top = 18
      Width = 206
      Height = 17
      Hint = '???? ????'
      Caption = '                          continuous NG, the test stops '
      TabOrder = 2
      Visible = False
      IniKey = 'AutoNgStop'
    end
    object Ed_NgStopCount: ZIniSpinEdit
      Left = 810
      Top = 11
      Width = 56
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      Visible = False
      IniKey = 'NgStopCount'
    end
    object Edit1: TEdit
      Left = 1008
      Top = 8
      Width = 121
      Height = 23
      ImeName = 'Microsoft IME 2010'
      TabOrder = 4
      Visible = False
    end
    object Button4: TButton
      Left = 1136
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 5
      Visible = False
      OnClick = Button4Click
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 57
    Width = 1229
    Height = 741
    ActivePage = TabSheet2
    TabOrder = 1
    object TabSheet2: TTabSheet
      ImageIndex = 3
      object Label7: TLabel
        Left = 509
        Top = 22
        Width = 110
        Height = 15
        Caption = 'MASTER BARCODE'
      end
      object BtnInput1Up: TSpeedButton
        Tag = 1
        Left = 1052
        Top = 374
        Width = 24
        Height = 24
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = BtnInput1UpClick
      end
      object BtnInput1Dn: TSpeedButton
        Tag = 1
        Left = 1080
        Top = 374
        Width = 24
        Height = 24
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = BtnInput1DnClick
      end
      object BtnInput1Add: TSpeedButton
        Left = 1108
        Top = 372
        Width = 24
        Height = 24
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777777777777777777700000777777777770A220777777777770A22077
          7777777770A220777777700000A22000007770A222222222207770A222222222
          207770AAAAA22AAAA077700000A220000077777770A220777777777770A22077
          7777777770AAA077777777777000007777777777777777777777}
        Layout = blGlyphTop
        OnClick = BtnInput1AddClick
      end
      object BtnInput1Delete: TSpeedButton
        Left = 1134
        Top = 372
        Width = 24
        Height = 24
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777770000000000000777091111111111077709111111111
          1077709999999999907770000000000000777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        Layout = blGlyphTop
        OnClick = BtnInput1DeleteClick
      end
      object cbReMasterMode: ZIniCheckBox
        Left = 10
        Top = 64
        Width = 254
        Height = 17
        Caption = 'Change Model Alarm Use'
        TabOrder = 0
        IniKey = 'ReMasterMode'
        IniDataSource = TESTOPTION
      end
      object cbMasteralarm: ZIniCheckBox
        Left = 10
        Top = 8
        Width = 138
        Height = 17
        Caption = 'MASTER Alarm Use'
        TabOrder = 1
        IniKey = 'Masteralarm'
        IniDataSource = TESTOPTION
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 109
        Width = 493
        Height = 92
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 68
          Width = 97
          Height = 15
          Caption = 'NG COUNT Value'
        end
        object Label11: TLabel
          Left = 8
          Top = 36
          Width = 83
          Height = 15
          Caption = 'Ng Count Spec'
        end
        object cbNGCHECK: ZIniCheckBox
          Left = 8
          Top = -1
          Width = 198
          Height = 17
          Caption = 'Ng Count Check Use'
          TabOrder = 0
          IniKey = 'cbNGCHECK'
          IniDataSource = TESTOPTION
        end
        object spnNGcounter: ZIniSpinEdit
          Left = 136
          Top = 56
          Width = 125
          Height = 34
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
          IniKey = 'NGCOUNTER'
          IniDataSource = TESTOPTION
        end
        object spnNGspec: ZIniSpinEdit
          Left = 136
          Top = 18
          Width = 125
          Height = 34
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 2
          Value = 0
          IniKey = 'spnNGspec'
          IniDataSource = TESTOPTION
        end
        object BitBtn3: TBitBtn
          Left = 276
          Top = 61
          Width = 69
          Height = 23
          Caption = 'Reset'
          TabOrder = 3
          OnClick = BitBtn1Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 9
        Top = 356
        Width = 495
        Height = 350
        Caption = 'PC <=> PLC IO INTERFACE'
        TabOrder = 3
        object PageControl2: TPageControl
          Left = 6
          Top = 24
          Width = 481
          Height = 315
          ActivePage = TabSheet1
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'STATUS'
            object GroupBox6: TGroupBox
              Left = 7
              Top = 2
              Width = 215
              Height = 267
              Caption = 'PC => PLC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object LED_MASTER_MODE: TLed
                Tag = 2
                Left = 6
                Top = 44
                Width = 127
                Height = 23
                Alignment = laLeft
                BorderColor = 4210816
                BorderWidth = 1
                Caption = 'PC Master Mode'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                LedHeight = 23
                LedWidth = 23
                Margin = 4
                OffColor = 2510080
                PhongSize = 4
                OnClick = LED_MASTER_MODEClick
              end
              object Label4: TLabel
                Left = 15
                Top = 132
                Width = 44
                Height = 14
                Caption = 'JIG NUM'
              end
              object Label5: TLabel
                Left = 15
                Top = 156
                Width = 47
                Height = 14
                Caption = 'PartNum'
              end
              object LED_MASTER_PD: TLed
                Tag = 2
                Left = 5
                Top = 17
                Width = 196
                Height = 23
                Alignment = laLeft
                BorderColor = 4210816
                BorderWidth = 1
                Caption = 'PC Master Product'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                LedHeight = 23
                LedWidth = 23
                Margin = 4
                OffColor = 2510080
                PhongSize = 4
                OnClick = LED_MASTER_MODEClick
              end
              object EditJIGMODEL: TEdit
                Left = 72
                Top = 127
                Width = 60
                Height = 22
                ImeName = 'Microsoft IME 2010'
                TabOrder = 0
                Text = '0'
              end
              object EditPartNum: TEdit
                Left = 72
                Top = 151
                Width = 60
                Height = 22
                ImeName = 'Microsoft IME 2010'
                TabOrder = 1
              end
            end
            object GroupBox5: TGroupBox
              Left = 232
              Top = 1
              Width = 215
              Height = 267
              Caption = 'PLC => PC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object LED_AUTO: TLed
                Tag = 2
                Left = 5
                Top = 17
                Width = 121
                Height = 23
                Alignment = laLeft
                BorderColor = 4210816
                BorderWidth = 1
                Caption = 'PLC Auto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                LedHeight = 23
                LedWidth = 23
                Margin = 4
                OffColor = 2510080
                PhongSize = 4
                OnClick = LED_MASTER_MODEClick
              end
              object Panel2: TPanel
                Left = 30
                Top = 226
                Width = 91
                Height = 15
                Caption = 'Panel2'
                TabOrder = 0
                Visible = False
              end
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'IO ADDRESS'
            ImageIndex = 1
            object GroupBox7: TGroupBox
              Left = 1
              Top = -2
              Width = 449
              Height = 123
              Caption = 'PC'
              TabOrder = 0
              object Label8: TLabel
                Left = 8
                Top = 16
                Width = 102
                Height = 15
                Caption = 'PC Master Product'
              end
              object Label13: TLabel
                Left = 8
                Top = 40
                Width = 90
                Height = 15
                Caption = 'PC Master Mode'
              end
              object edtMasterProduct: ZIniEdit
                Left = 122
                Top = 14
                Width = 121
                Height = 23
                ImeName = 'Microsoft IME 2010'
                TabOrder = 0
                IniKey = 'edtMasterProduct'
                IniDataSource = TESTOPTION
                MoveCursor = False
              end
              object edtMasterTime: ZIniEdit
                Left = 122
                Top = 36
                Width = 121
                Height = 23
                ImeName = 'Microsoft IME 2010'
                TabOrder = 1
                IniKey = 'edtMasterTime'
                IniDataSource = TESTOPTION
                MoveCursor = False
              end
            end
            object GroupBox8: TGroupBox
              Left = 2
              Top = 125
              Width = 449
              Height = 123
              Caption = 'PLC'
              TabOrder = 1
              object Label12: TLabel
                Left = 8
                Top = 16
                Width = 58
                Height = 15
                Caption = 'PLC AUTO'
              end
              object edtAuto: ZIniEdit
                Left = 110
                Top = 14
                Width = 121
                Height = 23
                ImeName = 'Microsoft IME 2010'
                TabOrder = 0
                IniKey = 'edtAuto'
                IniDataSource = TESTOPTION
                MoveCursor = False
              end
            end
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 199
        Width = 491
        Height = 152
        TabOrder = 4
        object Label1: TLabel
          Left = 8
          Top = 99
          Width = 142
          Height = 15
          Caption = 'Master Check Last Time : '
        end
        object DateTimePicker1: TDateTimePicker
          Tag = 100
          Left = 86
          Top = 20
          Width = 106
          Height = 23
          Date = 40463.375000000000000000
          Time = 40463.375000000000000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 0
        end
        object cbDayUse: ZIniCheckBox
          Left = 8
          Top = 24
          Width = 70
          Height = 17
          Caption = 'DayTime'
          TabOrder = 1
          IniKey = 'DayUse'
          IniDataSource = TESTOPTION
        end
        object DateTimePicker2: TDateTimePicker
          Tag = 100
          Left = 86
          Top = 44
          Width = 106
          Height = 23
          Date = 40463.375000000000000000
          Time = 40463.375000000000000000
          ImeName = 'Microsoft Office IME 2007'
          Kind = dtkTime
          TabOrder = 2
        end
        object cbNightUse: ZIniCheckBox
          Left = 8
          Top = 48
          Width = 70
          Height = 17
          Caption = 'Night'
          TabOrder = 3
          IniKey = 'NightUse'
          IniDataSource = TESTOPTION
        end
        object BitBtn13: TBitBtn
          Left = 404
          Top = 95
          Width = 69
          Height = 23
          Caption = 'Reset'
          TabOrder = 4
          OnClick = BitBtn13Click
        end
        object cbMasterTimeCheck: ZIniCheckBox
          Left = 8
          Top = -1
          Width = 167
          Height = 17
          Caption = 'Time Check Alarm Use'
          TabOrder = 5
          IniKey = 'cbMasterTimeCheck'
          IniDataSource = TESTOPTION
        end
        object edtHistory: ZIniEdit
          Left = 185
          Top = 97
          Width = 214
          Height = 22
          Hint = '2014-10-11 21:11:33'
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ImeName = 'Microsoft IME 2003'
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          IniKey = 'DayHis'
          IniDataSource = SAVETIME
          MoveCursor = False
        end
        object edtMasterTime1: ZIniEdit
          Left = 331
          Top = 21
          Width = 30
          Height = 23
          Hint = '08:30:00 or 17:30:00'
          ImeName = 'Microsoft IME 2010'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Visible = False
          IniKey = 'MasterTime1'
          IniDataSource = TESTOPTION
          MoveCursor = False
        end
        object edtMasterTime2: ZIniEdit
          Left = 331
          Top = 45
          Width = 30
          Height = 23
          Hint = '08:30:00 or 17:30:00'
          ImeName = 'Microsoft IME 2010'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Visible = False
          IniKey = 'MasterTime2'
          IniDataSource = TESTOPTION
          MoveCursor = False
        end
      end
      object rdoSTATIONmode: ZIniRadioGroup
        Left = 9
        Top = 27
        Width = 255
        Height = 32
        Caption = 'MODE'
        Columns = 2
        Enabled = False
        ItemIndex = 1
        Items.Strings = (
          'Variant'
          'PLC  JIG MODEL')
        TabOrder = 5
        IniKey = 'rdoSTATIONmode'
      end
      object cbPLCModeCheck: ZIniCheckBox
        Left = 9
        Top = 84
        Width = 250
        Height = 17
        Caption = 'PLC Manual -> Auto  Alarm Use'
        TabOrder = 6
        IniKey = 'cbPLCModeCheck'
        IniDataSource = TESTOPTION
      end
      object BitBtn2: TBitBtn
        Left = 1086
        Top = 16
        Width = 129
        Height = 25
        Caption = 'MASTER MODE OFF'
        TabOrder = 7
        OnClick = BitBtn2Click
      end
      object GridMaster: TAdvStringGrid
        Left = 509
        Top = 42
        Width = 708
        Height = 310
        Cursor = crDefault
        HelpContext = 9
        ColCount = 7
        FixedCols = 0
        RowCount = 9
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 8
        OnKeyDown = GridMasterKeyDown
        OnClickCell = GridMasterClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'Use'
          'Barcode'
          'Partnum'
          'Project'
          'JIGModel'
          'OK/NG'
          'Try')
        Filter = <>
        FixedColWidth = 37
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Arial'
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
          192
          87
          221
          62
          42
          41)
        object Label2: TLabel
          Left = 208
          Top = 375
          Width = 46
          Height = 15
          Caption = 'REPEAT'
          Visible = False
        end
        object lbMaster: ZIniListBox
          Left = 271
          Top = 124
          Width = 170
          Height = 53
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 15
          Items.Strings = (
            'Master Grid SAVE COMPONENT')
          TabOrder = 3
          Visible = False
          SaveItems = True
          IniKey = 'MasterBarcode'
          IniDataSource = TESTOPTION
        end
        object ZIniSpinEdit2: ZIniSpinEdit
          Left = 336
          Top = 356
          Width = 125
          Height = 34
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 4
          Value = 0
          Visible = False
          IniDataSource = TESTOPTION
        end
        object GroupBox9: TGroupBox
          Left = 47
          Top = 427
          Width = 98
          Height = 22
          Caption = 'jhy kih MASTER Setting '
          TabOrder = 5
          Visible = False
          object Label14: TLabel
            Left = 16
            Top = 21
            Width = 110
            Height = 15
            Caption = 'MASTER BARCODE'
          end
          object Label15: TLabel
            Left = 144
            Top = 21
            Width = 80
            Height = 15
            Caption = 'MODEL CODE'
          end
          object BtnMasterAdd: TSpeedButton
            Left = 16
            Top = 61
            Width = 57
            Height = 21
            Caption = 'Add'
          end
          object BtnMasterDelete: TSpeedButton
            Left = 73
            Top = 61
            Width = 57
            Height = 21
            Caption = 'Delete'
          end
          object Ed_MasterSerial: TEdit
            Left = 16
            Top = 37
            Width = 121
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            ParentFont = False
            TabOrder = 0
          end
          object Ed_MasterModelCode: TEdit
            Left = 144
            Top = 37
            Width = 121
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            ParentFont = False
            TabOrder = 1
          end
          object VList_Master: TValueListEditor
            Left = 16
            Top = 85
            Width = 254
            Height = 105
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
            ParentFont = False
            TabOrder = 2
            TitleCaptions.Strings = (
              'BARCODE'
              'MODEL CODE'
              'HMF')
            ColWidths = (
              89
              159)
          end
        end
      end
      object lbStep: ZIniListBox
        Left = 512
        Top = 408
        Width = 705
        Height = 297
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 15
        TabOrder = 9
        OnDblClick = lbStepDblClick
        SaveItems = True
        IniDataSource = INI
      end
      object edtStep: TEdit
        Left = 512
        Top = 376
        Width = 537
        Height = 23
        ImeName = 'Microsoft IME 2010'
        TabOrder = 10
      end
      object Button3: TButton
        Left = 1162
        Top = 373
        Width = 54
        Height = 25
        Caption = 'save'
        TabOrder = 11
        OnClick = Button3Click
      end
      object cbStepCheck: ZIniCheckBox
        Left = 265
        Top = 84
        Width = 88
        Height = 17
        Caption = 'StepCheck'
        TabOrder = 12
        IniKey = 'cbStepCheck'
        IniDataSource = TESTOPTION
      end
      object cbStepCount: ZIniCheckBox
        Left = 361
        Top = 84
        Width = 128
        Height = 17
        Caption = 'StepCountCheck'
        TabOrder = 13
        IniKey = 'cbStepCount'
        IniDataSource = TESTOPTION
      end
    end
    object TabSheet3: TTabSheet
      ImageIndex = 1
      TabVisible = False
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
        Top = 31
        Width = 489
        Height = 705
        TabOrder = 1
        object Label6: TLabel
          Left = 10
          Top = 28
          Width = 46
          Height = 15
          Caption = 'Barcode'
        end
        object cbMasterCheck: ZIniCheckBox
          Left = 8
          Top = 0
          Width = 193
          Height = 17
          Caption = '??? ?? Upload ??'
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
            ItemHeight = 15
            Items.Strings = (
              'Master Grid ?? ???')
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
          Height = 23
          ImeName = 'Microsoft IME 2010'
          TabOrder = 2
          MoveCursor = False
        end
        object Button1: TButton
          Left = 408
          Top = 24
          Width = 75
          Height = 25
          Caption = '??'
          TabOrder = 3
          OnClick = Button1Click
        end
      end
    end
  end
  object TESTOPTION: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'STEP.INI'
    IniSection = 'TESTOPTION'
    Left = 149
    Top = 8
  end
  object SAVETIME: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'STEP.INI'
    IniSection = 'MASTER'
    Left = 261
    Top = 8
  end
  object TimerMaster: TTimer
    Enabled = False
    Interval = 800
    OnTimer = TimerMasterTimer
    Left = 420
    Top = 123
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'STEP.INI'
    IniSection = 'STEP'
    Left = 301
    Top = 88
  end
end
