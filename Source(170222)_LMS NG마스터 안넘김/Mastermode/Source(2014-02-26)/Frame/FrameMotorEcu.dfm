object FrmeMotorEcu: TFrmeMotorEcu
  Left = 0
  Top = 0
  Width = 1266
  Height = 846
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnLoading: TPanel
    Left = 0
    Top = 0
    Width = 1266
    Height = 846
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BevelWidth = 2
    Caption = 'd'
    Color = 15987699
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 62
      Width = 1258
      Height = 400
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 10
      BorderWidth = 2
      Caption = '`'
      Color = 15987699
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 2
        Top = 2
        Width = 1254
        Height = 396
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'TEST DATA'
          object Shape3: TShape
            Left = 666
            Top = 4
            Width = 579
            Height = 60
            Brush.Color = 16766935
            Shape = stRoundRect
          end
          object Shape1: TShape
            Left = 666
            Top = 70
            Width = 579
            Height = 60
            Brush.Color = 16766935
            Shape = stRoundRect
          end
          object Edit_MotorSerial: TEdit
            Left = 779
            Top = 9
            Width = 461
            Height = 52
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -40
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object XiPanel8: TXiPanel
            Left = 671
            Top = 9
            Width = 108
            Height = 50
            ColorFace = clWhite
            ColorGrad = 13001472
            ColorLight = 8404992
            ColorDark = 8404992
            ColorScheme = csCustom
            FillDirection = fdVertical
            Caption = 'MOTOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            UseDockManager = True
          end
          object XiPanel6: TXiPanel
            Left = 671
            Top = 75
            Width = 108
            Height = 50
            ColorFace = clWhite
            ColorGrad = 13001472
            ColorLight = 8404992
            ColorDark = 8404992
            ColorScheme = csCustom
            FillDirection = fdVertical
            Caption = 'ECU'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            UseDockManager = True
          end
          object Edit_EcuSerial: TEdit
            Left = 779
            Top = 75
            Width = 461
            Height = 52
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -40
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object XiPanel7: TXiPanel
            Left = 671
            Top = 135
            Width = 111
            Height = 197
            ColorFace = 8404992
            ColorGrad = 8404992
            ColorLight = 8404992
            ColorDark = 8404992
            ColorScheme = csCustom
            FillDirection = fdVertical
            Caption = 'RESULT'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            UseDockManager = True
          end
          object Panel1: TPanel
            Left = 782
            Top = 135
            Width = 458
            Height = 196
            BorderWidth = 5
            Caption = 'Panel6'
            TabOrder = 5
            object pnResult: TPanel
              Left = 6
              Top = 6
              Width = 446
              Height = 184
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvSpace
              BiDiMode = bdLeftToRight
              Caption = '---'
              Color = 16119285
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -107
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel9: TPanel
            Left = 329
            Top = 33
            Width = 330
            Height = 62
            BorderWidth = 2
            Caption = 'Panel6'
            TabOrder = 6
            object pnCable: TPanel
              Left = 3
              Top = 3
              Width = 324
              Height = 56
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvSpace
              BiDiMode = bdLeftToRight
              Caption = '---'
              Color = 16119285
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -67
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object XiPanel9: TXiPanel
            Left = 330
            Top = 6
            Width = 329
            Height = 28
            ColorFace = 8404992
            ColorGrad = 8404992
            ColorLight = 8404992
            ColorDark = 8404992
            ColorScheme = csCustom
            FillDirection = fdVertical
            Caption = 'CABLE VISION'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            UseDockManager = True
          end
          object Panel11: TPanel
            Left = 3
            Top = 33
            Width = 329
            Height = 62
            BorderWidth = 2
            Caption = 'Panel6'
            TabOrder = 8
            object pnOring: TPanel
              Left = 3
              Top = 3
              Width = 323
              Height = 56
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvSpace
              BiDiMode = bdLeftToRight
              Caption = '---'
              Color = 16119285
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -67
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object XiPanel10: TXiPanel
            Left = 4
            Top = 6
            Width = 329
            Height = 28
            ColorFace = 8404992
            ColorGrad = 8404992
            ColorLight = 8404992
            ColorDark = 8404992
            ColorScheme = csCustom
            FillDirection = fdVertical
            Caption = 'ORING CHECK'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            UseDockManager = True
          end
          object XiPanel5: TXiPanel
            Left = 2
            Top = 97
            Width = 659
            Height = 273
            ColorFace = clWhite
            ColorGrad = 14344414
            ColorLight = clSilver
            ColorDark = clSilver
            ColorScheme = csCustom
            FillDirection = fdVertical
            TabOrder = 10
            UseDockManager = True
            object Shape2: TShape
              Left = 330
              Top = 66
              Width = 325
              Height = 99
              Brush.Color = 16766935
              Shape = stRoundRect
            end
            object Label1: TLabel
              Left = 432
              Top = 65
              Width = 129
              Height = 38
              Caption = '1st (mm)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -33
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Shape4: TShape
              Left = 3
              Top = 65
              Width = 325
              Height = 99
              Brush.Color = 16766935
              Shape = stRoundRect
            end
            object Label2: TLabel
              Left = 100
              Top = 64
              Width = 139
              Height = 38
              Caption = '2nd (mm)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -33
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Shape5: TShape
              Left = 3
              Top = 170
              Width = 325
              Height = 99
              Brush.Color = 16766935
              Shape = stRoundRect
            end
            object Label3: TLabel
              Left = 101
              Top = 168
              Width = 132
              Height = 38
              Caption = '3rd (mm)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -33
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Shape6: TShape
              Left = 331
              Top = 170
              Width = 325
              Height = 99
              Brush.Color = 16766935
              Shape = stRoundRect
            end
            object Label4: TLabel
              Left = 434
              Top = 168
              Width = 130
              Height = 38
              Caption = '4th (mm)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -33
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object XiPanel11: TXiPanel
              Left = 1
              Top = 1
              Width = 657
              Height = 26
              ColorFace = 8404992
              ColorGrad = 8404992
              ColorLight = 8404992
              ColorDark = 8404992
              ColorScheme = csCustom
              FillDirection = fdVertical
              Align = alTop
              Caption = 'GASKET CHECK'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              UseDockManager = True
            end
            object pnResult_1: TPanel
              Left = 342
              Top = 104
              Width = 300
              Height = 52
              BevelOuter = bvNone
              BevelWidth = 2
              Caption = '---'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object pnResult_2: TPanel
              Left = 17
              Top = 103
              Width = 300
              Height = 52
              BevelOuter = bvNone
              BevelWidth = 2
              Caption = '---'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object pnResult_3: TPanel
              Left = 15
              Top = 208
              Width = 300
              Height = 52
              BevelOuter = bvNone
              BevelWidth = 2
              Caption = '---'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object pnResult_4: TPanel
              Left = 345
              Top = 208
              Width = 300
              Height = 52
              BevelOuter = bvNone
              BevelWidth = 2
              Caption = '---'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object pnSpec: TPanel
              Left = 124
              Top = 28
              Width = 533
              Height = 35
              BevelInner = bvLowered
              BevelOuter = bvSpace
              BiDiMode = bdLeftToRight
              Caption = '---'
              Color = 16119285
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -40
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
            end
            object XiPanel12: TXiPanel
              Left = 3
              Top = 28
              Width = 122
              Height = 34
              ColorFace = 8404992
              ColorGrad = 8404992
              ColorLight = 8404992
              ColorDark = 8404992
              ColorScheme = csCustom
              FillDirection = fdVertical
              Caption = 'SPEC'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              UseDockManager = True
            end
          end
          object edtDayHis: ZIniEdit
            Left = 673
            Top = 341
            Width = 276
            Height = 22
            Ctl3D = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ImeName = 'Microsoft IME 2003'
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 11
            IniKey = 'DayHis'
            IniDataSource = INI
            MoveCursor = False
          end
          object edtNightHis: ZIniEdit
            Left = 961
            Top = 341
            Width = 276
            Height = 22
            Ctl3D = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ImeName = 'Microsoft IME 2003'
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 12
            IniKey = 'NightHis'
            IniDataSource = INI
            MoveCursor = False
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'RESULT LIST'
          ImageIndex = 1
          object GridList: TAdvStringGrid
            Left = 0
            Top = 0
            Width = 1249
            Height = 384
            Cursor = crDefault
            ColCount = 11
            DefaultRowHeight = 26
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              'NO'
              'MOTOR Serial'
              'ECU Serial'
              'Oring'
              'Cable'
              'Gasket#1'
              'Gasket#2'
              'Gasket#3'
              'Gasket#4'
              'Time'
              'RESULT')
            ControlLook.FixedGradientFrom = clWhite
            ControlLook.FixedGradientTo = clBtnFace
            Filter = <>
            FixedRowHeight = 26
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Look = glClassic
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
            WordWrap = False
            ColWidths = (
              64
              264
              269
              77
              59
              84
              83
              84
              84
              64
              93)
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 4
      Top = 566
      Width = 1258
      Height = 276
      Align = alClient
      BevelOuter = bvNone
      Color = 15987699
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1258
        Height = 276
        Align = alClient
        BevelOuter = bvNone
        Color = 15987699
        TabOrder = 0
        object Panel4: TPanel
          Left = 921
          Top = 0
          Width = 337
          Height = 62
          Align = alRight
          BevelOuter = bvNone
          BevelWidth = 10
          TabOrder = 0
          object Panel12: TPanel
            Left = 169
            Top = 0
            Width = 169
            Height = 62
            Align = alLeft
            BevelInner = bvSpace
            BevelOuter = bvSpace
            TabOrder = 0
            object XiPanel16: TXiPanel
              Left = 2
              Top = 2
              Width = 165
              Height = 27
              ColorFace = clWhite
              ColorGrad = clSilver
              ColorLight = clSilver
              ColorDark = clSilver
              ColorScheme = csCustom
              FillDirection = fdVertical
              Align = alTop
              Caption = 'FAIL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              UseDockManager = True
              object SpeedButton2: TSpeedButton
                Left = 2
                Top = 3
                Width = 162
                Height = 23
                Flat = True
                OnClick = SpeedButton2Click
              end
            end
            object Count_Fail: ZIniSpinEdit
              Left = 1
              Top = 28
              Width = 166
              Height = 34
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -20
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              MaxValue = 10000
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 0
              IniKey = 'TotalFail'
              IniDataSource = COUNT
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 169
            Height = 62
            Align = alLeft
            BevelInner = bvSpace
            BevelOuter = bvSpace
            TabOrder = 1
            object XiPanel1: TXiPanel
              Left = 2
              Top = 2
              Width = 165
              Height = 27
              ColorFace = clWhite
              ColorGrad = clSilver
              ColorLight = clSilver
              ColorDark = clSilver
              ColorScheme = csCustom
              FillDirection = fdVertical
              Align = alTop
              Caption = 'PASS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              UseDockManager = True
              object SpeedButton1: TSpeedButton
                Left = 2
                Top = 3
                Width = 162
                Height = 23
                Flat = True
                OnClick = SpeedButton1Click
              end
            end
            object Count_Pass: ZIniSpinEdit
              Left = 2
              Top = 28
              Width = 166
              Height = 34
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -20
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              MaxValue = 10000
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 0
              IniKey = 'TotalPass'
              IniDataSource = COUNT
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 62
          Width = 1258
          Height = 214
          Align = alBottom
          BevelOuter = bvNone
          Color = 15987699
          TabOrder = 1
          object pcStatus: TPageControl
            Left = 289
            Top = 0
            Width = 635
            Height = 214
            ActivePage = TabSheet1
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Status'
              DesignSize = (
                627
                185)
              object LbOptionModelName: TdpbLabel
                Left = 0
                Top = 0
                Width = 627
                Height = 185
                Align = alClient
                Alignment = taCenter
                AutoSize = False
                Color = clWhite
                EdgeStyle = desFlat
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #45208#45588#44256#46357' ExtraBold'
                Font.Style = [fsBold]
                Layout = tlCenter
                ParentColor = False
                ParentFont = False
              end
              object pnLamp: TXiPanel
                Left = 5
                Top = 4
                Width = 618
                Height = 177
                ColorFace = clGreen
                ColorGrad = 56576
                ColorLight = clSilver
                ColorDark = clSilver
                ColorScheme = csCustom
                FillDirection = fdVertical
                Anchors = [akLeft, akTop, akRight, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -40
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                UseDockManager = True
                object lbStatus: TdpbLabel
                  Left = 1
                  Top = 1
                  Width = 616
                  Height = 175
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'READY'
                  Color = clBlack
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -40
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Layout = tlCenter
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                end
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 289
            Height = 214
            Align = alLeft
            BevelOuter = bvNone
            Color = 15987699
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object PageControl2: TPageControl
            Left = 924
            Top = 0
            Width = 334
            Height = 214
            ActivePage = TabSheet5
            Align = alClient
            TabOrder = 2
            object TabSheet5: TTabSheet
              Caption = 'LOG'
              object MemoLog: TMemo
                Left = 0
                Top = 0
                Width = 326
                Height = 185
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ImeName = 'Microsoft IME 2010'
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    object XiPanel19: TXiPanel
      Left = 4
      Top = 462
      Width = 1258
      Height = 23
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' MESSAGE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      UseDockManager = True
    end
    object XiPanel4: TXiPanel
      Left = 4
      Top = 485
      Width = 1258
      Height = 81
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csSilver
      FillDirection = fdVertical
      Align = alTop
      Caption = '`'
      TabOrder = 3
      UseDockManager = True
      DesignSize = (
        1258
        81)
      object lbMessage: TdpbLabel
        Left = -4
        Top = 4
        Width = 1250
        Height = 74
        Anchors = [akLeft, akRight]
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        EdgeStyle = desFlat
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowDepth = 0
        ShowAccelChar = False
        TextStyle = dtsShadow
      end
    end
    object XiPanel2: TXiPanel
      Left = 4
      Top = 4
      Width = 1258
      Height = 35
      ColorFace = 9803157
      ColorGrad = 9915136
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Caption = 'ECU + MOTOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      UseDockManager = True
      OnClick = XiPanel2Click
      OnDblClick = XiPanel2DblClick
      object lbMaster: TLabel
        Left = 1170
        Top = 4
        Width = 88
        Height = 24
        Caption = 'MASTER'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object LbOringPass: TLabel
        Left = 1034
        Top = 4
        Width = 127
        Height = 24
        Caption = 'ORING PASS'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object LED_Trace: TLed
        Tag = 2
        Left = 5
        Top = 7
        Width = 68
        Height = 18
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'TRACE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = clRed
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object lbJigCheck: TLabel
        Left = 897
        Top = 3
        Width = 112
        Height = 24
        Caption = 'JIG CHECK'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object cbDebug: TCheckBox
        Left = 584
        Top = 8
        Width = 97
        Height = 17
        Caption = 'DEBUG'
        TabOrder = 0
        Visible = False
      end
    end
    object XiPanel3: TXiPanel
      Left = 4
      Top = 39
      Width = 1258
      Height = 23
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' TEST DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      UseDockManager = True
      DesignSize = (
        1258
        23)
      object XiButton1: TXiButton
        Left = 81
        Top = 3
        Width = 42
        Height = 16
        ColorFace = 16772829
        ColorGrad = 16758380
        ColorDark = 16754769
        ColorLight = 16772313
        ColorBorder = 11753728
        ColorText = clBlack
        OverColorFace = 16772055
        OverColorGrad = 16753478
        OverColorDark = 16752190
        OverColorLight = 16770250
        OverColorBorder = 11753728
        OverColorText = clBlack
        DownColorFace = 16757606
        DownColorGrad = 16764573
        DownColorDark = 16765864
        DownColorLight = 16752190
        DownColorBorder = 11753728
        DownColorText = clBlack
        DisabledColorFace = 15658734
        DisabledColorGrad = clWhite
        DisabledColorDark = 13816530
        DisabledColorLight = clWhite
        DisabledColorBorder = clGray
        DisabledColorText = clGray
        ColorFocusRect = 16755027
        ColorScheme = csNeoSky
        Layout = blGlyphLeft
        Spacing = 4
        TransparentGlyph = True
        Gradient = True
        HotTrack = True
        Caption = 'Edit'
        TabOrder = 0
        Visible = False
        OnClick = XiButton1Click
      end
      object btnReset: TXiButton
        Left = 1199
        Top = 2
        Width = 56
        Height = 19
        ColorFace = 16772829
        ColorGrad = 16758380
        ColorDark = 16754769
        ColorLight = 16772313
        ColorBorder = 11753728
        ColorText = clBlack
        OverColorFace = 16772055
        OverColorGrad = 16753478
        OverColorDark = 16752190
        OverColorLight = 16770250
        OverColorBorder = 11753728
        OverColorText = clBlack
        DownColorFace = 16757606
        DownColorGrad = 16764573
        DownColorDark = 16765864
        DownColorLight = 16752190
        DownColorBorder = 11753728
        DownColorText = clBlack
        DisabledColorFace = 15658734
        DisabledColorGrad = clWhite
        DisabledColorDark = 13816530
        DisabledColorLight = clWhite
        DisabledColorBorder = clGray
        DisabledColorText = clGray
        ColorFocusRect = 16755027
        ColorScheme = csNeoSky
        Layout = blGlyphLeft
        Spacing = 4
        TransparentGlyph = True
        Gradient = True
        HotTrack = True
        Anchors = [akLeft, akTop, akRight]
        Caption = 'RESET'
        TabOrder = 1
        OnClick = btnResetClick
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 7
    Top = 566
    Width = 285
    Height = 277
    Caption = 'IO Control'
    TabOrder = 1
    object GroupBox5: TGroupBox
      Left = 3
      Top = 12
      Width = 138
      Height = 262
      Caption = 'PLC => PC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object LED_Request: TLed
        Tag = 2
        Left = 5
        Top = 13
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'MOTOR Scan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Vision_OK: TLed
        Tag = 2
        Left = 5
        Top = 147
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'CABLE OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Vision_NG: TLed
        Tag = 2
        Left = 5
        Top = 166
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'CABLE NG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Master: TLed
        Tag = 2
        Left = 5
        Top = 204
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'MASTER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Vision_ST: TLed
        Tag = 2
        Left = 5
        Top = 128
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'CABLE START'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Oring_OK: TLed
        Tag = 2
        Left = 5
        Top = 70
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ORING OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Oring_NG: TLed
        Tag = 2
        Left = 5
        Top = 89
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ORING NG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Gasket_ST: TLed
        Tag = 2
        Left = 5
        Top = 185
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'GASKET START'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_ECUreq: TLed
        Tag = 2
        Left = 5
        Top = 32
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ECU Scan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Oring_SKIP: TLed
        Tag = 2
        Left = 5
        Top = 108
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ORING SKIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Oring_ST: TLed
        Tag = 2
        Left = 5
        Top = 51
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ORING START'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_JIGMODE: TLed
        Tag = 2
        Left = 5
        Top = 224
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'JIG CHECK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object Led_TotalEnd: TLed
        Tag = 2
        Left = 5
        Top = 243
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'Total End'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 13
        LedWidth = 13
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 142
      Top = 12
      Width = 138
      Height = 262
      Caption = 'PC => PLC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object LED_BCR_M_OK: TLed
        Tag = 2
        Left = 6
        Top = 12
        Width = 123
        Height = 17
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'MOTOR BAR OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_BCR_M_NG: TLed
        Tag = 2
        Left = 6
        Top = 29
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'MOTOR BAR NG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_WORKCOMP: TLed
        Tag = 2
        Left = 6
        Top = 116
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'WORK COMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_BCR_E_OK: TLed
        Tag = 2
        Left = 6
        Top = 46
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ECU BAR OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_BCR_E_NG: TLed
        Tag = 2
        Left = 6
        Top = 64
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ECU BAR NG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Gasket_OK: TLed
        Tag = 2
        Left = 6
        Top = 81
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'GASKET OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Gasket_NG: TLed
        Tag = 2
        Left = 6
        Top = 98
        Width = 127
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'GASKET NG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Oring_END: TLed
        Tag = 2
        Left = 6
        Top = 133
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ORING END'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Vision_END: TLed
        Tag = 2
        Left = 6
        Top = 150
        Width = 121
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'VISION END'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_PCMASTER: TLed
        Tag = 2
        Left = 6
        Top = 168
        Width = 118
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = #47560#49828#53552' '#51228#54408
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object Led_Stop: TLed
        Tag = 2
        Left = 6
        Top = 185
        Width = 118
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = #49444#48708' '#51221#51648
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_Jig: TLed
        Tag = 2
        Left = 6
        Top = 202
        Width = 119
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'JIG ALARM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object LED_PCOring_SKIP: TLed
        Tag = 2
        Left = 6
        Top = 220
        Width = 119
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'PC Oring Skip'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
      object Led_PCOring_Check: TLed
        Tag = 2
        Left = 6
        Top = 239
        Width = 119
        Height = 16
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'PC Oring Check'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
        OnClick = LED_RequestClick
      end
    end
  end
  object TimerRun: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerRunTimer
    Left = 1130
    Top = 368
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'PACKING'
    Left = 1032
    Top = 368
  end
  object COUNT: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'PACKING'
    Left = 1074
    Top = 368
  end
end
