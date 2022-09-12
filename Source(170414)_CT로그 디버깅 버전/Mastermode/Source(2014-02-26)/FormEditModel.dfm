object FrmEditModel: TFrmEditModel
  Left = 765
  Top = 259
  Width = 1030
  Height = 602
  Caption = #47784#45944#49324#50577' '#54200#51665
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar: TStatusBar
    Left = 0
    Top = 548
    Width = 1022
    Height = 20
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 57
    Width = 1022
    Height = 491
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'MODEL TABLE'
      object Grid: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 1014
        Height = 464
        Cursor = crDefault
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 21
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnClickCell = GridClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        Filter = <>
        FixedRowHeight = 18
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clNavy
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548
        FixedFont.Style = []
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
        RowHeights = (
          18
          21)
        object Panel1: TPanel
          Left = 484
          Top = 10
          Width = 493
          Height = 61
          TabOrder = 0
          Visible = False
          object Label1: TLabel
            Left = 14
            Top = 12
            Width = 44
            Height = 11
            Caption = #47784#45944#53076#46300
            Transparent = True
          end
          object Label2: TLabel
            Left = 235
            Top = 12
            Width = 33
            Height = 11
            Caption = #54596#46300#47749
            Transparent = True
          end
          object Label3: TLabel
            Left = 235
            Top = 34
            Width = 33
            Height = 11
            Caption = #54596#46300#44050
            Transparent = True
          end
          object BtnItemSearch: TSpeedButton
            Left = 446
            Top = 8
            Width = 41
            Height = 45
            Caption = #52286#44592
            OnClick = BtnItemSearchClick
          end
          object Edit_ItemName: TEdit
            Left = 271
            Top = 31
            Width = 168
            Height = 19
            Color = clBtnFace
            ImeName = 'Microsoft IME 2003'
            ReadOnly = True
            TabOrder = 0
          end
          object ComboBox_ALC: TComboBox
            Left = 63
            Top = 9
            Width = 168
            Height = 19
            Style = csDropDownList
            DropDownCount = 30
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 11
            TabOrder = 1
          end
          object ComboBox_Field: TComboBox
            Left = 271
            Top = 9
            Width = 168
            Height = 19
            Style = csDropDownList
            DropDownCount = 30
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 11
            TabOrder = 2
          end
        end
      end
    end
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = 15658734
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    Version = '1.7.9.0'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = clSilver
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    FullHeight = 0
    object BtnOpen: TXiButton
      Left = 3
      Top = 3
      Width = 75
      Height = 51
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
      Caption = #50676#44592
      TabOrder = 0
      OnClick = BtnOpenClick
    end
    object BtnSave: TXiButton
      Left = 78
      Top = 3
      Width = 75
      Height = 51
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
      Caption = #54200#51665
      TabOrder = 1
      OnClick = BtnSaveClick
    end
    object BtnReload: TXiButton
      Left = 153
      Top = 3
      Width = 75
      Height = 51
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
      Caption = #51116#47196#46300
      TabOrder = 2
      OnClick = BtnReloadClick
    end
    object edtFileName: ZIniEdit
      Left = 260
      Top = 12
      Width = 121
      Height = 23
      Hint = #50676#50632#45912' '#47784#45944' '#54028#51068#51032' '#44221#47196#47484' '#51200#51109#54620#45796'. '#54532#47196#44536#47016' '#51116#49892#54665#49884#50640' '#52280#51312
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      Visible = False
      IniKey = 'FileName'
      IniDataSource = INI
      MoveCursor = False
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '.xls'
    Filter = 'Excel Files(*.xls)|*.xls|Excel Files(*.xls)'
    Left = 88
    Top = 304
  end
  object SaveDialog: TSaveDialog
    Left = 144
    Top = 304
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'MODEL'
    Left = 192
    Top = 312
  end
  object ZIniFormPosition1: ZIniFormPosition
    IniDataSource = INI
    Left = 388
    Top = 152
  end
end
