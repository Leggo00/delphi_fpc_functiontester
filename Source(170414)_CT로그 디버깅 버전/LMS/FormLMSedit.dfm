object FrmLMSedit: TFrmLMSedit
  Left = 799
  Top = 90
  BorderStyle = bsDialog
  Caption = 'Master Setup'
  ClientHeight = 896
  ClientWidth = 1218
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 12
    Top = 11
    Width = 1195
    Height = 875
    ActivePage = TabSheet6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet2: TTabSheet
      BorderWidth = 5
      Caption = '                        '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object PageControl3: TPageControl
        Left = 342
        Top = 5
        Width = 335
        Height = 823
        ActivePage = TabSheet3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet3: TTabSheet
          BorderWidth = 5
          Caption = #47532#49828#53944' '#48372#44592' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object Splitter1: TSplitter
            Left = 0
            Top = 130
            Width = 317
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object TreeViewNG: TTreeView
            Left = 0
            Top = 133
            Width = 317
            Height = 648
            Align = alClient
            BevelWidth = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #44404#47548
            Font.Style = []
            HideSelection = False
            Images = ImageList_Led
            Indent = 19
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
          end
          object listNgMaster: TFileListBox
            Left = 0
            Top = 0
            Width = 317
            Height = 130
            Align = alTop
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = [fsBold]
            ImeName = 'Microsoft IME 2010'
            ItemHeight = 21
            ParentFont = False
            TabOrder = 1
            OnClick = listNgMasterClick
          end
        end
      end
      object PageControl1: TPageControl
        Left = 3
        Top = 5
        Width = 331
        Height = 823
        ActivePage = TabSheet1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object TabSheet1: TTabSheet
          BorderWidth = 5
          Caption = #9660' LMS '#54028#51068' '#49444#51221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          DesignSize = (
            313
            781)
          object TreeView: TTreeView
            Left = 0
            Top = 133
            Width = 313
            Height = 648
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelWidth = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #44404#47548
            Font.Style = []
            HideSelection = False
            Images = ImageList_Led
            Indent = 41
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            OnDblClick = TreeViewDblClick
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 313
            Height = 92
            Align = alTop
            TabOrder = 1
            object Label1: TLabel
              Left = 7
              Top = 12
              Width = 108
              Height = 15
              Caption = #49373#49457' '#44592#51456' '#54028#51068' '#49440#53469
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton20: TSpeedButton
              Tag = 1
              Left = 284
              Top = 29
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              OnClick = SpeedButton20Click
            end
            object edtMasterFileName: TEdit
              Left = 8
              Top = 58
              Width = 297
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ImeName = 'Microsoft Office IME 2007'
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtSelProjectFile: ZIniEdit
              Left = 7
              Top = 29
              Width = 274
              Height = 24
              ImeName = 'Microsoft Office IME 2007'
              TabOrder = 1
              IniKey = 'SeletedProjectFile'
              IniDataSource = INI
              MoveCursor = False
            end
          end
          object Button1: TXiButton
            Left = 1
            Top = 98
            Width = 201
            Height = 35
            ColorFace = 15263999
            ColorGrad = 9803263
            ColorDark = 8553215
            ColorLight = 14540287
            ColorBorder = 157
            ColorText = clBlack
            OverColorFace = 14671871
            OverColorGrad = 7829503
            OverColorDark = 6974207
            OverColorLight = 14145535
            OverColorBorder = 157
            OverColorText = clBlack
            DownColorFace = 10921727
            DownColorGrad = 12171775
            DownColorDark = 13553407
            DownColorLight = 6184703
            DownColorBorder = 157
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 6184703
            ColorScheme = csNeoRose
            Layout = blGlyphLeft
            Glyph.Data = {
              EE000000424DEE0000000000000076000000280000000F0000000F0000000100
              04000000000078000000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300007777777
              0030000007888888000000000780088800000000078008880000000007888888
              000000000000000000000000000000000000000FFFFFFFFF0000000FFFFFFFFF
              0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF
              0700000FFFFFFFFF00003009999999990030}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            Caption = '  LMS '#52404#53356#54637#47785' FILE '#49373#49457
            TabOrder = 2
            OnClick = Button1Click
          end
          object XiButton1: TXiButton
            Left = 201
            Top = 98
            Width = 110
            Height = 35
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Layout = blGlyphLeft
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            Caption = #47784#46160#54644#51228
            TabOrder = 3
            OnClick = XiButton1Click
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #49444#48708#49345#53468#54028#51068
      ImageIndex = 1
      object label222: TLabel
        Left = 32
        Top = 43
        Width = 94
        Height = 34
        Caption = '* '#49444#48708' '#49345#53468#54028#51068'     (State.vlt) : '
        WordWrap = True
      end
      object SpeedButton1: TSpeedButton
        Tag = 1
        Left = 1100
        Top = 40
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Button9: TButton
        Left = 32
        Top = 8
        Width = 75
        Height = 25
        Caption = 'SAVE'
        TabOrder = 0
        OnClick = Button9Click
      end
      object edtStatevlt: ZIniEdit
        Left = 202
        Top = 40
        Width = 895
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 1
        IniKey = 'edtStatevlt'
        IniDataSource = LMSOPTION
        MoveCursor = False
      end
      object cbLabelOption: TCheckBox
        Left = 32
        Top = 168
        Width = 97
        Height = 17
        Caption = #46972#48296#51204#50857
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 32
        Top = 221
        Width = 433
        Height = 177
        Caption = 'EOL_TOOL COUNT1'
        TabOrder = 3
        object Label11: TLabel
          Left = 14
          Top = 53
          Width = 69
          Height = 17
          Caption = 'Tool Name'
        end
        object Label12: TLabel
          Left = 14
          Top = 80
          Width = 56
          Height = 17
          Caption = 'Tool Life'
        end
        object Label13: TLabel
          Left = 14
          Top = 107
          Width = 83
          Height = 17
          Caption = 'Tool Mileage'
        end
        object Label14: TLabel
          Left = 232
          Top = 78
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Label15: TLabel
          Left = 232
          Top = 105
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Label16: TLabel
          Left = 15
          Top = 133
          Width = 60
          Height = 17
          Caption = 'Tool Unit'
        end
        object edtToolName_1: ZIniEdit
          Left = 108
          Top = 49
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 0
          Text = 'Test Probe1'
          IniKey = 'edtToolName_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolLife_1: ZIniEdit
          Left = 108
          Top = 76
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 1
          Text = '7000'
          IniKey = 'edtToolLife_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolMileage_1: ZIniEdit
          Left = 108
          Top = 103
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 2
          Text = '7000'
          IniKey = 'edtToolMileage_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolLifeAddr_1: ZIniEdit
          Left = 271
          Top = 75
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 3
          IniKey = 'edtToolLifeAddr_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolMileageAddr_1: ZIniEdit
          Left = 271
          Top = 102
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 4
          IniKey = 'edtToolMileageAddr_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolUnit_1: ZIniEdit
          Left = 109
          Top = 129
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 5
          IniKey = 'edtToolUnit_1'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 32
        Top = 405
        Width = 433
        Height = 177
        Caption = 'EOL_TOOL COUNT2'
        TabOrder = 4
        object Label17: TLabel
          Left = 14
          Top = 53
          Width = 69
          Height = 17
          Caption = 'Tool Name'
        end
        object Label18: TLabel
          Left = 14
          Top = 80
          Width = 56
          Height = 17
          Caption = 'Tool Life'
        end
        object Label19: TLabel
          Left = 14
          Top = 107
          Width = 83
          Height = 17
          Caption = 'Tool Mileage'
        end
        object Label20: TLabel
          Left = 232
          Top = 78
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Label21: TLabel
          Left = 232
          Top = 105
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Label22: TLabel
          Left = 15
          Top = 133
          Width = 60
          Height = 17
          Caption = 'Tool Unit'
        end
        object edtToolName_2: ZIniEdit
          Left = 108
          Top = 49
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 0
          Text = 'Test Probe2'
          IniKey = 'edtToolName_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolLife_2: ZIniEdit
          Left = 108
          Top = 76
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 1
          Text = '7000'
          IniKey = 'edtToolLife_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolMileage_2: ZIniEdit
          Left = 108
          Top = 103
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 2
          Text = '7000'
          IniKey = 'edtToolMileage_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolLifeAddr_2: ZIniEdit
          Left = 271
          Top = 75
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 3
          IniKey = 'edtToolLifeAddr_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolMileageAddr_2: ZIniEdit
          Left = 271
          Top = 102
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 4
          IniKey = 'edtToolMileageAddr_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtToolUnit_2: ZIniEdit
          Left = 108
          Top = 130
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 5
          IniKey = 'edtToolUnit_2'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
      end
      object cbTestMode: ZIniCheckBox
        Left = 32
        Top = 197
        Width = 97
        Height = 17
        Caption = #51076#49884#47784#46300
        TabOrder = 5
        IniKey = 'cbTestMode'
        IniDataSource = INI
      end
      object GroupBox4: TGroupBox
        Left = 472
        Top = 221
        Width = 433
        Height = 177
        Caption = 'PLC STATE'
        TabOrder = 6
        object Label23: TLabel
          Left = 14
          Top = 80
          Width = 85
          Height = 17
          Caption = 'AUTO/MANU'
        end
        object Label24: TLabel
          Left = 14
          Top = 107
          Width = 33
          Height = 17
          Caption = 'STOP'
        end
        object Label25: TLabel
          Left = 104
          Top = 81
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Label26: TLabel
          Left = 104
          Top = 108
          Width = 30
          Height = 17
          Caption = 'Addr'
        end
        object Led_Auto: TLed
          Tag = 3
          Left = 270
          Top = 78
          Width = 27
          Height = 27
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 22
          LedShape = lsRound
          LedWidth = 22
          Margin = 4
          OffColor = 2510080
          PhongSize = 3
        end
        object Led_Stop: TLed
          Tag = 3
          Left = 271
          Top = 108
          Width = 27
          Height = 27
          Alignment = laLeft
          BorderColor = 4210816
          BorderWidth = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LedHeight = 22
          LedShape = lsRound
          LedWidth = 22
          Margin = 4
          OffColor = 2510080
          PhongSize = 3
        end
        object edtPlcAuto_Addr: ZIniEdit
          Left = 143
          Top = 78
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 0
          IniKey = 'edtPlcAuto_Addr'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
        object edtPlcStop_Addr: ZIniEdit
          Left = 143
          Top = 105
          Width = 121
          Height = 25
          ImeName = 'Microsoft IME 2010'
          TabOrder = 1
          IniKey = 'edtPlcStop_Addr'
          IniDataSource = LMSOPTION
          MoveCursor = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 88
        Width = 1105
        Height = 62
        TabOrder = 7
        object Button2: TButton
          Left = 7
          Top = 23
          Width = 75
          Height = 25
          Caption = #49688#46041
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 103
          Top = 23
          Width = 75
          Height = 25
          Caption = #51088#46041
          TabOrder = 1
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 199
          Top = 24
          Width = 75
          Height = 24
          Caption = #51221#51648
          TabOrder = 2
          OnClick = Button5Click
        end
        object Button7: TButton
          Left = 775
          Top = 21
          Width = 153
          Height = 25
          Caption = #54028#51068#49373#49457#51068#49884#51221#51648
          TabOrder = 3
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 943
          Top = 21
          Width = 153
          Height = 25
          Caption = #54028#51068#49373#49457#51116#49884#51089
          TabOrder = 4
          OnClick = Button8Click
        end
        object cbStateTest: TCheckBox
          Left = 8
          Top = 0
          Width = 153
          Height = 17
          Caption = #49444#48708' '#49345#53468' '#54028#51068' '#53580#49828#53944' '
          TabOrder = 5
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #52769#51221#44208#44284#54028#51068'(FCT)'
      ImageIndex = 2
      object Label2: TLabel
        Left = 2
        Top = 6
        Width = 138
        Height = 34
        Caption = '* '#51228#54408#48324' '#52769#51221#44208#44284' '#54028#51068' :  (Serial_Measure.csv)'
        WordWrap = True
      end
      object SpeedButton2: TSpeedButton
        Tag = 1
        Left = 1071
        Top = 8
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
      object Label3: TLabel
        Left = 40
        Top = 82
        Width = 70
        Height = 17
        Caption = #45936#51060#53552' '#44221#47196
      end
      object SpeedButton3: TSpeedButton
        Tag = 1
        Left = 1091
        Top = 74
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 25
        Top = 365
        Width = 78
        Height = 17
        Caption = 'LMSLISTFILE'
      end
      object SpeedButton4: TSpeedButton
        Tag = 1
        Left = 1075
        Top = 359
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton4Click
      end
      object Label5: TLabel
        Left = 48
        Top = 114
        Width = 34
        Height = 17
        Caption = 'Serial'
      end
      object Label6: TLabel
        Left = 48
        Top = 146
        Width = 96
        Height = 17
        Caption = #53580#49828#53944' '#52572#51333#44208#44284
      end
      object Label7: TLabel
        Left = 280
        Top = 111
        Width = 40
        Height = 17
        Caption = 'Model'
      end
      object Label8: TLabel
        Left = 280
        Top = 137
        Width = 70
        Height = 17
        Caption = 'Model Info'
      end
      object Label9: TLabel
        Left = 528
        Top = 111
        Width = 57
        Height = 17
        Caption = 'Datetime'
      end
      object Label10: TLabel
        Left = 0
        Top = 41
        Width = 144
        Height = 34
        Caption = '* '#51228#54408#48324' data'#54869#51064' '#54028#51068' :  (Serial_Result.target)'
        WordWrap = True
      end
      object SpeedButton5: TSpeedButton
        Tag = 1
        Left = 1069
        Top = 43
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton5Click
      end
      object Button3: TButton
        Left = 768
        Top = 106
        Width = 345
        Height = 55
        Caption = 'CSV '#45936#51060#53552' load'
        TabOrder = 0
        OnClick = Button3Click
      end
      object edtMeasureCsv: ZIniEdit
        Left = 174
        Top = 7
        Width = 895
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 1
        IniKey = 'edtMeasureCsv'
        IniDataSource = LMSOPTION
        MoveCursor = False
      end
      object edtSampleLoad: TEdit
        Left = 152
        Top = 74
        Width = 937
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 2
      end
      object Grid: TAdvStringGrid
        Left = 24
        Top = 170
        Width = 1105
        Height = 183
        Cursor = crDefault
        ColCount = 6
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 3
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        Bands.PrimaryColor = 8454143
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        Filter = <>
        FixedRowHeight = 18
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548
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
        ColWidths = (
          64
          155
          130
          83
          64
          64)
      end
      object Memo1: TMemo
        Left = 16
        Top = 90
        Width = 41
        Height = 39
        ImeName = 'Microsoft IME 2010'
        TabOrder = 4
        Visible = False
      end
      object MemoLmsList: TMemo
        Left = 24
        Top = 418
        Width = 409
        Height = 239
        ImeName = 'Microsoft IME 2010'
        Lines.Strings = (
          '')
        ScrollBars = ssBoth
        TabOrder = 5
      end
      object edtLMStestfile: TEdit
        Left = 136
        Top = 359
        Width = 937
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 6
      end
      object Button10: TButton
        Left = 24
        Top = 386
        Width = 177
        Height = 25
        Caption = 'lms list load'
        TabOrder = 7
        OnClick = Button10Click
      end
      object MemoLMSResult: TMemo
        Left = 440
        Top = 418
        Width = 625
        Height = 239
        ImeName = 'Microsoft IME 2010'
        Lines.Strings = (
          '')
        ParentShowHint = False
        ScrollBars = ssBoth
        ShowHint = True
        TabOrder = 8
      end
      object Button11: TButton
        Left = 440
        Top = 386
        Width = 201
        Height = 25
        Caption = 'return lms result '
        TabOrder = 9
        OnClick = Button11Click
      end
      object edtTotalResult: TEdit
        Left = 152
        Top = 138
        Width = 121
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 10
      end
      object EdtSerial: TEdit
        Left = 152
        Top = 106
        Width = 121
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 11
      end
      object edtModel: TEdit
        Left = 384
        Top = 103
        Width = 121
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 12
      end
      object edtModelInfo: TEdit
        Left = 384
        Top = 129
        Width = 121
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 13
      end
      object edtDateTime: TEdit
        Left = 632
        Top = 103
        Width = 121
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 14
      end
      object Button12: TButton
        Left = 1104
        Top = 2
        Width = 75
        Height = 25
        Caption = 'SAVE'
        TabOrder = 15
        OnClick = Button9Click
      end
      object Button13: TButton
        Left = 552
        Top = 664
        Width = 153
        Height = 169
        Caption = #54644#45817#54260#45908' '#51204#48512
        TabOrder = 16
        OnClick = Button13Click
      end
      object FileListBox: TFileListBox
        Left = 24
        Top = 664
        Width = 521
        Height = 169
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 17
        Mask = '*.CSV'
        TabOrder = 17
        OnDblClick = FileListBoxDblClick
      end
      object edtMeasuretarget: ZIniEdit
        Left = 172
        Top = 42
        Width = 895
        Height = 25
        ImeName = 'Microsoft IME 2010'
        TabOrder = 18
        IniKey = 'edtMeasuretarget'
        IniDataSource = LMSOPTION
        MoveCursor = False
      end
      object Button14: TButton
        Left = 648
        Top = 386
        Width = 201
        Height = 25
        Caption = 'return lms '#46972#48296#51204#50857' '#51076#49884#53580#49828#53944
        TabOrder = 19
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 712
        Top = 664
        Width = 153
        Height = 169
        Caption = #54644#45817#54260#45908' '#51204#48512' '#46972#48296' '#51204#50857' '#51076#49884#53580#49828#53944
        TabOrder = 20
        WordWrap = True
        OnClick = Button15Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 4
      TabVisible = False
      object PageControl4: TPageControl
        Left = 686
        Top = 5
        Width = 487
        Height = 823
        ActivePage = TabSheet8
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        object TabSheet8: TTabSheet
          BorderWidth = 5
          Caption = #47560#49828#53552' '#54028#51068#44288#47532
          object gridModel: TAdvStringGrid
            Left = 0
            Top = 44
            Width = 469
            Height = 737
            Cursor = crDefault
            Align = alClient
            ColCount = 4
            Ctl3D = True
            DefaultColWidth = 120
            RowCount = 19
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ParentCtl3D = False
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnHasComboBox = gridModelHasComboBox
            OnGetEditorType = gridModelGetEditorType
            HintColor = clYellow
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'MS Sans Serif'
            ActiveCellFont.Style = []
            CellNode.ShowTree = False
            CellNode.TreeColor = clSilver
            ColumnHeaders.Strings = (
              'No'
              #47784#45944#47749
              #47560#49828#53552' '#54028#51068
              'NG '#47532#49828#53944' '#54028#51068
              '')
            ControlLook.ControlStyle = csClassic
            ControlLook.DropDownAlwaysVisible = True
            EnhRowColMove = False
            Filter = <>
            FixedColWidth = 40
            FixedRowHeight = 22
            FixedFont.Charset = ANSI_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = #47569#51008' '#44256#46357
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Lookup = True
            LookupHistory = True
            MouseActions.DirectComboDrop = True
            MouseActions.DirectEdit = True
            Navigation.AdvanceOnEnter = True
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
            PrintSettings.Borders = pbNoborder
            PrintSettings.Centered = False
            PrintSettings.PagePrefix = 'page'
            PrintSettings.PageNumSep = '/'
            ScrollWidth = 16
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'Tahoma'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SelectionColor = clHighlight
            SelectionTextColor = clHighlightText
            URLColor = clBlack
            WordWrap = False
            ColWidths = (
              40
              137
              149
              121)
            RowHeights = (
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22
              22)
            object listNGMasterFile: ZIniListBox
              Left = 24
              Top = 16
              Width = 290
              Height = 150
              ImeName = 'Microsoft IME 2010'
              ItemHeight = 15
              TabOrder = 0
              Visible = False
              SaveItems = True
              IniKey = 'listModelInfo'
              IniDataSource = INI
            end
            object listModelDir: TFileListBox
              Left = 24
              Top = 184
              Width = 290
              Height = 150
              FileType = [ftDirectory]
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 15
              TabOrder = 1
              Visible = False
            end
            object listMasterFile: TFileListBox
              Left = 24
              Top = 514
              Width = 290
              Height = 150
              ImeName = 'Microsoft IME 2010'
              ItemHeight = 15
              TabOrder = 2
              Visible = False
            end
            object listLayoutFile: TFileListBox
              Left = 24
              Top = 338
              Width = 290
              Height = 150
              ImeName = 'Microsoft IME 2010'
              ItemHeight = 15
              TabOrder = 3
              Visible = False
            end
          end
          object XiPanel1: TXiPanel
            Left = 0
            Top = 0
            Width = 469
            Height = 44
            ColorFace = clWhite
            ColorGrad = 14344414
            ColorLight = 8224125
            ColorDark = 6447714
            ColorScheme = csSilver
            FillDirection = fdVertical
            Align = alTop
            TabOrder = 1
            UseDockManager = True
            object btnSave: TXiButton
              Left = 5
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                EE000000424DEE0000000000000076000000280000000F0000000F0000000100
                04000000000078000000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300007777777
                0030000007888888000000000780088800000000078008880000000007888888
                000000000000000000000000000000000000000FFFFFFFFF0000000FFFFFFFFF
                0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF
                0700000FFFFFFFFF00003009999999990030}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #51200#51109
              TabOrder = 0
              OnClick = btnSaveClick
            end
            object BtnAdd: TXiButton
              Left = 68
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                777777777777777777777777700000777777777770A220777777777770A22077
                7777777770A220777777700000A22000007770A222222222207770A222222222
                207770AAAAA22AAAA077700000A220000077777770A220777777777770A22077
                7777777770AAA077777777777000007777777777777777777777}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #52628#44032
              TabOrder = 1
              OnClick = BtnAddClick
            end
            object BtnDelete: TXiButton
              Left = 131
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777777777777777777777777777777777777777777777777777777777777777
                7777777777777777777770000000000000777091111111111077709111111111
                1077709999999999907770000000000000777777777777777777777777777777
                7777777777777777777777777777777777777777777777777777}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #49325#51228
              TabOrder = 2
              OnClick = BtnDeleteClick
            end
            object BtnCopy: TXiButton
              Left = 194
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                77777700000077777770B8FFFFFB0700000077777770B8FFFFFB070000007777
                7770B8FFFFFB0700000077777770B8FFFFFB0700000070000000000880080700
                000070FFFFFFFF00088B0700000070FFFFFFFF0008BB0700000070F00F000F00
                09008700000070FFFFFFFF0399977700000070F0000F0F0999997700000070FF
                FFFFFF9999999700000070F00F00000799977700000070FFFF0FF07799977700
                000070F07F0F077799977700000070FFFF007999997777000000700000077777
                777777000000777777777777777777000000}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #48373#49324
              TabOrder = 3
              OnClick = BtnCopyClick
            end
            object BtnMoveUp: TXiButton
              Left = 257
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000F000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000777
                7770777777090777777077777709077777707777770907777770777777090777
                7770777777090777777077700009000077707770999999907770777709999907
                7770777709999907777077777099907777707777709990777770777777090777
                7770777777090777777077777770777777707777777077777770}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #50948#47196
              TabOrder = 4
              OnClick = BtnMoveUpClick
            end
            object BtnMoveDn: TXiButton
              Left = 320
              Top = 5
              Width = 62
              Height = 34
              ColorFace = 15987699
              ColorGrad = 12369084
              ColorDark = 10987431
              ColorLight = 16250871
              ColorBorder = 6447714
              ColorText = clBlack
              OverColorFace = 15790320
              OverColorGrad = 10921638
              OverColorDark = 10658466
              OverColorLight = 15658734
              OverColorBorder = 7697781
              OverColorText = clBlack
              DownColorFace = 13290186
              DownColorGrad = 14342874
              DownColorDark = 15329769
              DownColorLight = 8158332
              DownColorBorder = 5131854
              DownColorText = clBlack
              DisabledColorFace = 15658734
              DisabledColorGrad = clWhite
              DisabledColorDark = 13816530
              DisabledColorLight = clWhite
              DisabledColorBorder = clGray
              DisabledColorText = clGray
              ColorFocusRect = 11382189
              ColorScheme = csNeoSilver
              Layout = blGlyphLeft
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707777
                7777777777707777777777777709077777777777770907777777777770999077
                7777777770999077777777770999990777777777099999077777777099999990
                7777777000090000777777777709077777777777770907777777777777090777
                7777777777090777777777777709077777777777770007777777}
              Spacing = 4
              TransparentGlyph = True
              Gradient = True
              HotTrack = True
              Caption = #50500#47000
              TabOrder = 5
              OnClick = BtnMoveDnClick
            end
          end
        end
      end
    end
  end
  object chkLMSUse: ZIniCheckBox
    Left = 20
    Top = 17
    Width = 85
    Height = 16
    Caption = 'LMS '#49324#50857
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    IniKey = 'UseMasterMode'
    IniDataSource = LMSOPTION
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'ModelManager.ini'
    IniSection = 'Manager'
    Left = 862
    Top = 12
  end
  object ImageList_Led: TImageList
    BlendColor = clBlack
    Left = 969
    Top = 9
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000040800000408000004080000040800000408000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004080
      FF004080FF004080FF004080FF004080FF004080FF0000408000004080000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF000040
      8000004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF004080
      FF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004080FF004080FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF00FFFFFF00FFFFFF004080FF004080FF004080FF004080FF004080FF004080
      FF004080FF000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080FF004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF004080
      FF00004080000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004080
      FF004080FF004080FF004080FF004080FF004080FF004080FF004080FF000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004080FF004080FF004080FF004080FF004080FF00004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF0000008400000084000000
      84000000840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      840000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000084840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000840000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000084848400848484008484
      8400C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00008484000084840000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00008484000084840000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF0000008400000084000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000000000000000000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000000000000848484008484
      8400C6C6C600C6C6C60084848400848484008484840084848400848484008484
      840084848400000000000000000000000000000000000000000000FF000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000840000000000000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000084000000000000000000000000000000000000FFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400000084000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      0000008400000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      84000000840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F000000000000F81FF81FF81FF81FE007E007E007E007
      C003C003C003C003800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001800180018001800180018001C003C003C003C003
      E007E007E007E007F81FF81FF81FF81F00000000000000000000000000000000
      000000000000}
  end
  object ImageList_Led2: TImageList
    BlendColor = clBlack
    Height = 32
    Width = 32
    Left = 1025
    Top = 9
    Bitmap = {
      494C010105000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080800080808000808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000808080008080800080808000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000808080008080800080808000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000808080008080800080808000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080800080808000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      80008080800080808000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      8000FF000000FF000000FF000000FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80008080800080808000FF000000FF000000FF000000FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00808080008080800080808000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000080808000808080008080
      8000808000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00808080008080800080808000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000008080800080808000808080008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00808080008080800080808000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000808080008080800080808000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00808080008080800080808000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080808000808080008080800080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008080800080808000808080008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080008080800080808000808080008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800080808000808080008080800080808000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080800080808000808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080800080808000808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080800080808000808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080000080808000808080008080800000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808000008080800080808000808080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080000080808000808080008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080808000808080008080800000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808000008080800080808000808080000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080808000808080008080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808000008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080000080808000808080008080800000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808000008080800080808000808080000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080000080808000808080008080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      000080808000808080008080800000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      00008080800080808000808080000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      000080808000808080008080800000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0080808000808080008080
      8000000000000000000000000000000000000000000000000000FFFFFF008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080008080800000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      800080808000808080000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      80008080800000000000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF0000FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      8000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FF000000FF000000FF0000FFFFFF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00008080800080808000000000000000000000000000FFFFFF00808080008080
      80000000FF000000FF000000FF00FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF008080800080808000000000000000000000000000FFFFFF00808080008080
      800000FFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080008080800000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FF000000FF0000FFFFFF00FFFFFF0000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FFFF0000FFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      800080808000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FF000000FF000000FF0000FFFFFF00FFFFFF0000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF008080
      8000808080000000000000000000000000000000000000000000FFFFFF008080
      80008080800000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      8000808080000000000000000000000000000000000000000000000000008080
      80008080800080808000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000008080
      8000808080008080800000FF000000FF000000FF0000FFFFFF00FFFFFF0000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000808080008080
      8000808080000000000000000000000000000000000000000000000000008080
      800080808000808080000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00808080008080
      8000808080000000000000000000000000000000000000000000000000008080
      8000808080008080800000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      800080808000000000000000000000000000000000000000000000000000FFFF
      FF00808080008080800080808000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080800000000000000000000000000000000000000000000000000000FFFF
      FF0080808000808080008080800000FF000000FF000000FF0000FFFFFF00FFFF
      FF0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000080808000808080008080
      800080800000000000000000000000000000000000000000000000000000FFFF
      FF008080800080808000808080000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0080808000808080008080
      800080800000000000000000000000000000000000000000000000000000FFFF
      FF0080808000808080008080800000FFFF0000FFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0080808000808080008080
      8000808000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00808080008080800080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0080808000808080008080800000FF000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00008080800080808000808080008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF008080800080808000808080000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF008080800080808000808080008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0080808000808080008080800000FFFF0000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF008080800080808000808080008080
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0080808000808080008080800000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0080808000808080008080800000FF000000FF000000FF
      0000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000808080008080800080808000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF008080800080808000808080000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00808080008080800080808000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0080808000808080008080800000FFFF0000FFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00808080008080800080808000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0080808000808080008080800000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000080808000808080008080800080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF008080800080808000808080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0080808000808080008080800080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0080808000808080008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000808080008080800080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008080800080808000808080008080
      800000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000808080008080800080808000808080008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008080800080808000808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00808080008080800080808000808080008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008080800080808000808080008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080008080800080808000808080008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800080808000808080008080800080808000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800080808000808080008080800080808000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800080808000808080008080800080808000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800080808000808080008080800080808000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000000000000000000000
      FFF00FFF000000000000000000000000FF8001FF000000000000000000000000
      FF0000FF000000000000000000000000FE00007F000000000000000000000000
      FC00003F000000000000000000000000F800001F000000000000000000000000
      F000000F000000000000000000000000E0000007000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C000000300000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      80000001000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000E0000003000000000000000000000000
      E0000007000000000000000000000000F000000F000000000000000000000000
      F800001F000000000000000000000000FC00003F000000000000000000000000
      FE00007F000000000000000000000000FF0000FF000000000000000000000000
      FF8001FF000000000000000000000000FFF00FFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF00FFFFFF00FFFFFF00FFFFFF00FFFFF8001FFFF8001FFFF8001FFFF8001FF
      FF0000FFFF0000FFFF0000FFFF0000FFFE00007FFE00007FFE00007FFE00007F
      FC00003FFC00003FFC00003FFC00003FF800001FF800001FF800001FF800001F
      F000000FF000000FF000000FF000000FE0000007E0000007E0000007E0000007
      C0000003C0000003C0000003C0000003C0000003C0000003C0000003C0000003
      C0000003C0000003C0000003C000000380000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      80000001800000018000000180000001C0000003C0000003C0000003C0000003
      C0000003C0000003C0000003C0000003E0000003E0000003E0000003E0000003
      E0000007E0000007E0000007E0000007F000000FF000000FF000000FF000000F
      F800001FF800001FF800001FF800001FFC00003FFC00003FFC00003FFC00003F
      FE00007FFE00007FFE00007FFE00007FFF0000FFFF0000FFFF0000FFFF0000FF
      FF8001FFFF8001FFFF8001FFFF8001FFFFF00FFFFFF00FFFFFF00FFFFFF00FFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList: TImageList
    Left = 912
    Top = 8
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF00FFFF
      FF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FFFFFF000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000000000000FFFFFF0000000000FF0000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000000000000000000080000F0180000F0180000F018000
      0F0180000F0180000F0180000F0180000F0180000F0180000F0180000F018000
      0F0180000F0180000F01000000000000000080000F0180000F0180000F018000
      0F0180000F0180000F0180000F0180000F0180000F0180000F0180000F018000
      0F0180000F0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F01000000000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000FF000000FF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF01C0808F0100FF
      FF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FF
      FF01C0808F0180000F01000000000000000080000F01FFFFFF01C0808F0100FF
      FF010000F00100FFFF01C0808F0100FFFF01C0808F010000F001C0808F0100FF
      FF01C0808F0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F01000000000000000080000F01FFFFFF0100FFFF01C080
      8F01000000010000F00100FFFF01000000010000F001C0808F0100FFFF01C080
      8F0100FFFF0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF01C0808F0100FF
      FF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FF
      FF01C0808F0180000F01000000000000000080000F01FFFFFF01C0808F0100FF
      FF01C0808F01000000010000F0010000F001C0808F0100FFFF01C0808F0100FF
      FF01C0808F0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C0008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000C0C0C000808080000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F01000000000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F010000F0010000F00100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF01C0808F0100FF
      FF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FF
      FF01C0808F0180000F01000000000000000080000F01FFFFFF01C0808F0100FF
      FF01C0808F010000F001C0808F01000000010000F00100FFFF01C0808F0100FF
      FF01C0808F0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01FFFFFF0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C0808F0100FFFF01C080
      8F0100FFFF0180000F01000000000000000080000F01FFFFFF0100FFFF01C080
      8F010000F001C0808F0100FFFF01C0808F0100FFFF010000F00100FFFF01C080
      8F0100FFFF0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF010000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C00000FFFF0000FFFF00C0C0C000C0C0C000C0C0C00000FF000000FF
      0000C0C0C000C0C0C000808080000000000080000F01FFFFFF01FFFFFF01FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF01FFFFFF0180000F01000000000000000080000F01FFFFFF01FFFFFF01FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
      FF01FFFFFF0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0100000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080000F01C0808F0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0180000F0180000F0180000F018000
      0F0180000F0180000F01000000000000000080000F01C0808F0100FFFF01C080
      8F0100FFFF01C0808F0100FFFF01C0808F0180000F0180000F0180000F018000
      0F0180000F0180000F010000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0100000000FFFFFF010000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000080000F01C0808F0100FF
      FF01C0808F0100FFFF01C0808F0180000F010000000000000000000000000000
      0000000000000000000000000000000000000000000080000F01C0808F0100FF
      FF01C0808F0100FFFF01C0808F0180000F010000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080000F018000
      0F0180000F0180000F0180000F01000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080000F018000
      0F0180000F0180000F0180000F01000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000000000FFFF00000000
      0000800100000000000080010000000000008001000000000000800100000000
      0000800100000000000080010000000000008001000000000000800100000000
      000080010000000000008001000000000000FFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFC003
      80018001C007800100010001C007000000010001C007000000010001C0070000
      00010001C007000000010001C007000000010001C007000000010001C0070000
      00010001C007000000010001C007000000030003C00F800180FF80FFC01FC003
      C1FFC1FFC03FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList_SW: TImageList
    BlendColor = clBlack
    Height = 21
    Width = 48
    Left = 1081
    Top = 9
    Bitmap = {
      494C010102000400040030001500FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000C0000000150000000100200000000000003F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0D0D000BABA
      BA00A2A2A200979797009797970097979700979797008A8A8A006D6D6D005F5F
      5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F
      5F005F5F5F006D6D6D008A8A8A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDDDDD00D1D1D100D1D1D100D1D1D100D1D1D100BABABA008A8A8A007272
      7200727272007272720072727200727272007272720072727200727272007272
      7200727272008A8A8A00BABABA00D1D1D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C700ABABAB009B9B9B008A8A
      8A006D6D6D005F5F5F005F5F5F005F5F5F005F5F5F00585858004A4A4A001F1F
      1F001F1F1F001F1F1F00252525002E2E2E002D2D2D00222222001F1F1F001F1F
      1F001F1F1F0028282800585858005F5F5F005F5F5F005F5F5F005F5F5F006D6D
      6D008A8A8A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDDDDD00D1D1D100BABA
      BA008A8A8A0072727200727272007272720072727200666666004F4F4F001212
      12001212120012121200171717001E1E1E001D1D1D0014141400121212001212
      1200121212002121210066666600727272007272720072727200727272008A8A
      8A00BABABA00D1D1D100DDDDDD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B6B6B600A3A3A3008D8D8D006D6D6D005F5F5F005858
      58004A4A4A00404040005D5D5D00777777007E7E7E0080808000838383008585
      8500888888008A8A8A008C8C8C008F8F8F008E8E8E008A8A8A00878787008383
      83007F7F7F007B7B7B0078787800747474006A6A6A004A4A4A00262626002828
      2800585858005F5F5F006D6D6D008A8A8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400DDDDDD00D1D1D100BABABA008A8A8A00727272006666
      66004F4F4F002C2C2C0044444400585858005E5E5E0060606000626262006464
      640066666600686868006A6A6A006C6C6C006B6B6B0068686800656565006262
      62005F5F5F005C5C5C0059595900565656004E4E4E0034343400181818002121
      210066666600727272008A8A8A00BABABA00D1D1D100DDDDDD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E005E5E5E00575757004A4A4A006F6F6F008585
      850092929200979797009C9C9C00A0A0A000A2A2A200A4A4A400A7A7A700A8A8
      A800A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A8A8A800A7A7A700A7A7
      A700A6A6A600A3A3A3009F9F9F009C9C9C0098989800929292008A8A8A008282
      82006F6F6F00525252003B3B3B00585858005F5F5F006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D9D9D900B7B7B7008989890071717100656565004F4F4F00525252006464
      64006F6F6F0073737300777777007A7A7A007C7C7C007E7E7E00808080008181
      8100828282008282820082828200828282008282820081818100818181008080
      80007F7F7F007D7D7D007A7A7A0077777700747474006F6F6F00686868006262
      6200525252003B3B3B003030300066666600727272008A8A8A00C5C5C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000575757004A4A4A007C7C7C009E9E9E00A2A2A200A6A6A600AAAA
      AA00AEAEAE00B1B1B100B2B2B200B3B3B300B3B3B300B3B3B300B4B4B400B4B4
      B400B5B5B500B5B5B500B5B5B500B6B6B600B6B6B600B5B5B500B4B4B400B3B3
      B300B2B2B200B1B1B100B0B0B000AFAFAF00AEAEAE00ADADAD00AAAAAA00A3A3
      A3009C9C9C00959595008E8E8E00868686005252520028282800666666008A8A
      8A00000000000000000000000000000000000000000000000000EBEBEB00BFBF
      BF0087878700646464004F4F4F005D5D5D00787878007C7C7C007F7F7F008383
      830086868600898989008A8A8A008A8A8A008B8B8B008B8B8B008C8C8C008C8C
      8C008C8C8C008D8D8D008D8D8D008D8D8D008D8D8D008C8C8C008C8C8C008B8B
      8B008A8A8A008989890088888800878787008787870086868600838383007D7D
      7D0077777700717171006B6B6B00656565003B3B3B00212121007E7E7E00BABA
      BA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B004A4A4A0086868600A1A1A100AAAAAA00ACACAC00B0B0B000B3B3B300B6B6
      B600B6B6B600B7B7B700B7B7B700B7B7B700B8B8B800B8B8B800B8B8B800B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B8B8B800B8B8B800B8B8
      B800B8B8B800ADB0AE0099A39D008B98910089958E0087918B0091979300A6A7
      A600AEAEAE00A8A8A800A2A2A2009B9B9B00929292007F7F7F00595959005858
      58006D6D6D00909090000000000000000000EAEAEA00D2D2D200B2B2B2007979
      79004E4E4E00646464007B7B7B008282820085858500888888008B8B8B008E8E
      8E008E8E8E008E8E8E008E8E8E008F8F8F008F8F8F0090909000909090009090
      9000909090009090900090909000909090009090900090909000909090009090
      90008F8F8F0087948B0077A184006CA67E006BA07B0069987700718F79008089
      820087878700828282007C7C7C00767676006F6F6F005F5F5F00484848006666
      66008A8A8A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F5F5F004A4A
      4A00A3A3A300B2B2B200B5B5B500B7B7B700B9B9B900BBBBBB00BBBBBB00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBB
      BB00BBBBBB009CA6A0005F7E6C00375F480034574200304F3C00465A4E007485
      7B0088938D0087908B0091979300A4A5A400A6A6A6009C9C9C00939393007777
      77003F3F3F00666666009090900000000000CFCFCF008D8D8D00626262004E4E
      4E007C7C7C00898989008C8C8C008E8E8E009191910092929200929292009292
      9200939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300939393009393930093939300929292009292
      9200929292007BA588004DCE77002CDC620029CA580026B64F00379E53005AA7
      71006A9A780069967600708E78007E8780007F7F7F00777777006F6F6F005858
      5800333333007E7E7E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00606060009F9F9F00B5B5
      B500B9B9B900BCBCBC00BDBDBD00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BCBC
      BC00BCBCBC0095A29A00456D5500154C2B00104625000C41210013412600274B
      350030503D00304C3B00455A4D007282780091989400A0A2A100A2A2A2009999
      990085858500555555006666660090909000ABABAB0060606000787878008C8C
      8C00909090009292920094949400959595009494940094949400959595009595
      9500959595009595950094949400949494009494940094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      94009393930076AD88003BE3720015FE5F0010FE59000CF7540010DF4F001FC7
      510026B9510026AE4C00369E520058A16D0070937A007B857E007C7C7C007575
      750064646400454545007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000A4A4A400B6B6B600C1C1
      C100BFBFBF00C1C1C100C2C2C200C0C0C000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD0097A59D0049725A001B523100154C2B00104625000C4121000B3F
      2000093B1D0006371A00113B220026473200465F50007D8B8200A0A2A100A2A2
      A2009898980074747400404040006D6D6D00808080007F7F7F008C8C8C009797
      9700969696009898980099999900979797009696960096969600969696009696
      9600969696009696960095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009494940078AE8A003FE376001BFE660015FE5F0010FE59000CF754000BF4
      520009EC4D0006E148000ED147001EBD4C0037AD580061A274007B877E007C7C
      7C007474740056565600343434008A8A8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000069696900BABABA00C9C9C900C8C8
      C800C4C4C400C5C5C500C4C4C400C2C2C200C0C0C000C0C0C000C0C0C000C0C0
      C000BFBFBF00BFBFBF00BFBFBF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00BEBEBE0098A59D004C745C00245A3A001F553500174D2C00124827001046
      26000E4424000C412100093C1D0007381A00123F24003C5C49007E8D8400A0A3
      A100A0A0A000949494005D5D5D005F5F5F00696969008F8F8F009F9F9F009E9E
      9E009B9B9B009D9D9D009B9B9B00999999009898980098989800989898009797
      9700979797009696960096969600969696009696960096969600969696009696
      9600959595009595950095959500959595009595950095959500959595009595
      95009595950079AE8B0042E3780024FE6D001FFE680017FE610012FE5B0010FE
      59000EFB57000CF6530009EC4E0007E349000FDA4C0030C25B0062A877007B88
      7F007B7B7B007070700044444400727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CFCFCF00D2D2D200CFCF
      CF00C9C9C900C8C8C800C6C6C600C4C4C400C2C2C200C1C1C100C1C1C100C1C1
      C100C0C0C000C0C0C000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00BEBEBE0098A69E004E775E00275D3D00245A39001F5535001B513100184E
      2E00154C2B0013492800104626000E4424000C412200214E33005F796A00B2B2
      B200A8A8A8009D9D9D007F7F7F005F5F5F0066666600A1A1A100A9A9A900A7A7
      A700A1A1A1009F9F9F009D9D9D009B9B9B009A9A9A0099999900989898009898
      9800979797009797970097979700969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600959595009595
      95009595950079AE8B0043E37A0027FE700024FE6C001FFE68001BFE640018FE
      620015FE5F0013FE5C0010FE59000EFB57000CF754001CE659004BBD6E008A8A
      8A0081818100787878005F5F5F00727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000067676700D5D5D500DCDCDC00DBDB
      DB00D4D4D400CBCBCB00C9C9C900C7C7C700C5C5C500C3C3C300C2C2C200C1C1
      C100C1C1C100C1C1C100C0C0C000C0C0C000C0C0C000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BEBE
      BE00BEBEBE0099A69E0050786000285D3D00255B3B00275C3C00255A3A001F55
      35001B513000174E2D00154D2C00124A29001A4F30004D6F5B0097A19B00B4B4
      B400AAAAAA009F9F9F00777777006060600067676700A6A6A600B4B4B400B5B5
      B500ADADAD00A2A2A200A0A0A0009E9E9E009C9C9C009B9B9B00999999009999
      9900989898009898980097979700979797009797970097979700969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696007BAF8D0046E47C0028FE700025FE6D0027FE6E0025FE6D001FFE
      68001BFE640017FE620015FE600012FE5E0017F75D003ED46C0075A182008B8B
      8B00838383007979790058585800727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00D1D1D100E2E2E200EAEA
      EA00E2E2E200D5D5D500CCCCCC00CACACA00C8C8C800C6C6C600C4C4C400C3C3
      C300C2C2C200C1C1C100C1C1C100C1C1C100C0C0C000C0C0C000C0C0C000C0C0
      C000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF009AA7A000517961003266470036684A00336647002C614100245A
      3A001F563500195230001F543500306044004E715C0084958B00ACAFAD00B4B4
      B400ACACAC00989898006F6F6F00767676007B7B7B00A5A5A500B6B6B600C9C9
      C900C0C0C000AFAFAF00A4A4A400A2A2A2009F9F9F009D9D9D009C9C9C009A9A
      9A00999999009999990098989800989898009898980097979700979797009797
      9700979797009797970097979700979797009696960096969600969696009696
      9600969696007BAF8D0047E47D0032FE770036FE790033FE78002CFE730024FE
      6D001FFE690019FE66001CF7650028EA68003FD5700068B27E0086948A008C8C
      8C00848484007373730058585800888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAA006C6C6C00DADADA00F2F2
      F200F4F4F400E4E4E400D6D6D600CDCDCD00CACACA00C9C9C900C7C7C700C5C5
      C500C4C4C400C2C2C200C2C2C200C2C2C200C1C1C100C1C1C100C1C1C100C1C1
      C100C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF009BA8A00053796200346648003567490030634400316445003969
      4D003E6A50003A674C004D725C007D9386009CA6A000AFB2B100B7B7B700B4B4
      B400A9A9A9008D8D8D0071717100B7B7B700000000006C6C6C00ADADAD00D0D0
      D000D9D9D900C3C3C300B1B1B100A5A5A500A2A2A200A1A1A1009F9F9F009D9D
      9D009B9B9B009A9A9A0099999900999999009999990098989800989898009898
      9800989898009797970097979700979797009797970097979700979797009797
      9700979797007DB08E0049E47D0034FE780035FE790030FE75002EF7730031EA
      710034E4700030E46D003ED6710063BC81007BA7890089978E008F8F8F008B8B
      8B00828282007070700079797900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5D5D500A6A6A6006C6C6C00D7D7
      D700E8E8E800FCFCFC00EDEDED00DDDDDD00D1D1D100CDCDCD00CBCBCB00C9C9
      C900C7C7C700C6C6C600C4C4C400C3C3C300C3C3C300C3C3C300C2C2C200C2C2
      C200C2C2C200C2C2C200C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100A4AEA80069867400557C65004C765D003F6D52004F765F008298
      8B0095A49B0094A39A009EA9A300B5B8B600BEBEBE00BBBBBB00B8B8B800AFAF
      AF008F8F8F0073737300B8B8B800ECECEC0000000000A6A6A6006C6C6C00A9A9
      A900BEBEBE00E3E3E300D0D0D000B9B9B900AAAAAA00A5A5A500A3A3A300A1A1
      A1009F9F9F009D9D9D009B9B9B009A9A9A009A9A9A009A9A9A009A9A9A009999
      9900999999009999990099999900999999009898980098989800989898009898
      98009898980082AA8F0057D17F004AE47E0041E47A0034E472003FD7730069BE
      870077B18B0075B089007CA98B008E9C930095959500929292008E8E8E008686
      86007070700077777700BABABA00ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D4D400A6A6A6006D6D
      6D00CECECE00DCDCDC00E8E8E800EEEEEE00E6E6E600DFDFDF00D6D6D600CFCF
      CF00CDCDCD00CCCCCC00CACACA00C9C9C900C8C8C800C7C7C700C6C6C600C5C5
      C500C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C3C3
      C300C3C3C300BABDBC00A6B0AA009FACA5009CAAA20098A79E00A1ADA600B9BD
      BA00C3C3C300C3C3C300C3C3C300C2C2C200BEBEBE00B8B8B800A8A8A8009595
      95007E7E7E00B7B7B700E7E7E700000000000000000000000000A6A6A6006D6D
      6D00A1A1A100ACACAC00C0C0C000CFCFCF00C4C4C400BBBBBB00B1B1B100A8A8
      A800A6A6A600A4A4A400A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C
      9C009C9C9C009C9C9C009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B0093A0970085AD920080B391007EB491007AB48E0080AD900092A0
      97009A9A9A009A9A9A009999990098989800949494008E8E8E00848484007C7C
      7C0080808000B7B7B700E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2D2D200A8A8
      A80078787800656565005B5B5B00D7D7D700E4E4E400E5E5E500E5E5E500E1E1
      E100DBDBDB00D3D3D300CFCFCF00CECECE00CDCDCD00CCCCCC00CBCBCB00CACA
      CA00C9C9C900C8C8C800C8C8C800C7C7C700C6C6C600C6C6C600C7C7C700C7C7
      C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C6C6
      C600C5C5C500C4C4C400C2C2C200C0C0C000AEAEAE009C9C9C007D7D7D00C1C1
      C100CACACA00E3E3E3000000000000000000000000000000000000000000A8A8
      A80078787800656565005B5B5B00AAAAAA00BBBBBB00C0C0C000C1C1C100BDBD
      BD00B5B5B500ADADAD00A8A8A800A7A7A700A6A6A600A4A4A400A3A3A300A2A2
      A200A1A1A100A0A0A0009F9F9F009E9E9E009E9E9E009E9E9E009E9E9E009E9E
      9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E009D9D
      9D009B9B9B009A9A9A009898980095959500898989007F7F7F007D7D7D00B4B4
      B400CACACA00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D60000000000B2B2B2009E9E9E0078787800656565005B5B5B00D1D1D100D8D8
      D800DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D6D6D600D4D4D400D2D2
      D200D2D2D200D1D1D100D0D0D000CFCFCF00CFCFCF00CFCFCF00CECECE00CECE
      CE00CECECE00CDCDCD00CDCDCD00CCCCCC00CCCCCC00CACACA00C8C8C800C6C6
      C600C0C0C000B5B5B500ACACAC00676767007C7C7C00C2C2C200C7C7C700DFDF
      DF00000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B2009E9E9E0078787800656565005B5B5B00A6A6A600AAAA
      AA00AFAFAF00B1B1B100B1B1B100B1B1B100B0B0B000AEAEAE00ACACAC00AAAA
      AA00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A6A6A600A6A6A600A5A5
      A500A5A5A500A4A4A400A4A4A400A3A3A300A1A1A100A0A0A0009D9D9D009A9A
      9A00949494008F8F8F008D8D8D00676767007C7C7C00B4B4B400C7C7C700DFDF
      DF00EDEDED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E100D3D3D300BFBFBF00B4B4B400A0A0A0007A7A7A006767
      67006666660065656500646464005B5B5B00D1D1D100D3D3D300D3D3D300D3D3
      D300D3D3D300D2D2D200D2D2D200D2D2D200D1D1D100CFCFCF00CECECE00CDCD
      CD00CBCBCB00CACACA00C9C9C900C7C7C700C4C4C400B7B7B700A7A7A7009B9B
      9B00686868007C7C7C00C8C8C800B9B9B900C6C6C600DCDCDC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFBFBF00B4B4B400A0A0A0007A7A7A006767
      67006666660065656500646464005B5B5B00A6A6A600A5A5A500A5A5A500A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A5A5A500A3A3A300A2A2A200A0A0
      A0009F9F9F009D9D9D009C9C9C009A9A9A00979797008C8C8C00828282007F7F
      7F00686868007C7C7C00B9B9B900B9B9B900C6C6C600DCDCDC00EAEAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3E3E300E2E2E200D7D7D700C3C3C300B8B8
      B800B6B6B600B5B5B500B5B5B500A2A2A2007B7B7B0068686800686868006868
      6800686868006868680067676700676767006767670067676700686868006868
      680068686800686868006868680069696900696969006A6A6A007E7E7E00C1C1
      C100BBBBBB00C7C7C700DDDDDD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E200D7D7D700C3C3C300B8B8
      B800B6B6B600B5B5B500B5B5B500A2A2A2007B7B7B0068686800686868006868
      6800686868006868680067676700676767006767670067676700686868006868
      680068686800686868006868680069696900696969006A6A6A007E7E7E00B4B4
      B400BBBBBB00C7C7C700DDDDDD00E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E4E4E400DADADA00C7C7C700BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BEBEBE00BFBFBF00BFBFBF00CACACA00DFDF
      DF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E4E4E400DADADA00C7C7C700BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BEBEBE00BFBFBF00BFBFBF00CACACA00DFDF
      DF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000C0000000150000000100010000000000F80100000000000000000000
      000000000000000000000000FFFFFF00FFC00001FFFFFFF00000FFFF00000000
      0000000000000000FF00000007FFFF80000001FF000000000000000000000000
      FC00000000FFF8000000003F000000000000000000000000FC000000003FF000
      0000001F000000000000000000000000F8000000000FC0000000000F00000000
      0000000000000000E00000000003000000000007000000000000000000000000
      C000000000010000000000030000000000000000000000000000000000000000
      0000000100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000001000000000000000000000000
      000000000000800000000000000000000000000000000000800000000001C000
      00000001000000000000000000000000C00000000003E0000000000300000000
      0000000000000000E8000000000FF80000000007000000000000000000000000
      F8000000003FFE000000001F000000000000000000000000FE00000001FFFF00
      000000FF000000000000000000000000FFFC00000FFFFFFC00000FFF00000000
      000000000000000000000000000000000000000000000000000000000000}
  end
  object TimerState: TTimer
    Enabled = False
    OnTimer = TimerStateTimer
    Left = 824
    Top = 15
  end
  object LMSOPTION: ZIniData
    Tag = 11
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'LMSOPTION'
    Left = 784
    Top = 16
  end
end
