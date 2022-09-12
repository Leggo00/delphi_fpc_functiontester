object FrmIOScale: TFrmIOScale
  Left = 583
  Top = 160
  Width = 663
  Height = 739
  BorderIcons = [biSystemMenu]
  Caption = 'I/OScale [AD, DA]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object btnSave: TXiButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
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
      Caption = 'SAVE'
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 655
    Height = 668
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'AD'
      object GridAD: TAdvStringGrid
        Left = 0
        Top = 29
        Width = 647
        Height = 610
        Cursor = crDefault
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = GridADGetAlignment
        OnGetEditorType = GridADGetEditorType
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownAlwaysVisible = True
        Filter = <>
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        MouseActions.DirectComboClose = True
        MouseActions.DirectComboDrop = True
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
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 647
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 75
          Height = 14
          Caption = 'Change Item '
        end
        object cbItem: TComboBox
          Left = 82
          Top = 3
          Width = 145
          Height = 22
          Style = csDropDownList
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 14
          ItemIndex = 0
          TabOrder = 0
          Text = 'RANGE'
          OnChange = cbItemChange
          Items.Strings = (
            'RANGE'
            'MIN'
            'MAX'
            'UNIT'
            'SCALE'
            'OFFSET')
        end
        object edtValue: TEdit
          Left = 312
          Top = 3
          Width = 80
          Height = 22
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 1
        end
        object btnApply: TXiButton
          Left = 395
          Top = 3
          Width = 75
          Height = 21
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
          Caption = 'APPLY'
          TabOrder = 2
          OnClick = btnApplyClick
        end
        object cbRange: TComboBox
          Left = 232
          Top = 3
          Width = 81
          Height = 22
          Style = csDropDownList
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 14
          ItemIndex = 0
          TabOrder = 3
          Text = #177'10V'
          OnChange = cbItemChange
          Items.Strings = (
            #177'10V'
            '+10V'
            #177'20V'
            '+20V')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'DA'
      ImageIndex = 1
      object GridDA: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 578
        Height = 592
        Cursor = crDefault
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = GridADGetAlignment
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
end
