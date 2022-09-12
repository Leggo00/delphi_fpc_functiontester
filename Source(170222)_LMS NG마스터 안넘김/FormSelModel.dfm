object FrmSelModel: TFrmSelModel
  Left = 310
  Top = 154
  BorderStyle = bsDialog
  Caption = #47784#45944#49440#53469
  ClientHeight = 524
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 524
    Align = alClient
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    ColorTo = 14986888
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
    FullHeight = 0
    object Shape15: TShape
      Left = 14
      Top = 9
      Width = 104
      Height = 20
      Brush.Color = clGray
      Pen.Color = 8404992
    end
    object Shape16: TShape
      Left = 14
      Top = 7
      Width = 104
      Height = 20
      Brush.Color = 16762052
      Pen.Color = 8404992
    end
    object GradientFill6: TGradientFill
      Left = 16
      Top = 8
      Width = 101
      Height = 18
      ColorBegin = clWhite
      ColorEnd = 16757683
      ColorNum = 30
    end
    object dpbLabel50: TdpbLabel
      Left = 19
      Top = 10
      Width = 94
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = #52769#51221#47784#45944
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      Layout = tlCenter
      ParentFont = False
      TextStyle = dtsShadow
      Transparent = True
    end
    object Shape1: TShape
      Left = 14
      Top = 65
      Width = 104
      Height = 20
      Brush.Color = clGray
      Pen.Color = 8404992
    end
    object Shape2: TShape
      Left = 14
      Top = 63
      Width = 104
      Height = 20
      Brush.Color = 16762052
      Pen.Color = 8404992
    end
    object GradientFill1: TGradientFill
      Left = 16
      Top = 64
      Width = 101
      Height = 18
      ColorBegin = clWhite
      ColorEnd = 16757683
      ColorNum = 30
    end
    object dpbLabel1: TdpbLabel
      Left = 19
      Top = 66
      Width = 94
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = #49324#50577#49440#53469
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      Layout = tlCenter
      ParentFont = False
      TextStyle = dtsShadow
      Transparent = True
    end
    object ComboBox_Model: TComboBox
      Left = 14
      Top = 32
      Width = 371
      Height = 29
      Style = csDropDownList
      Ctl3D = True
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #55092#47676#47784#51020'T'
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 21
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox_ModelChange
    end
    object FileListBox: TFileListBox
      Left = 104
      Top = 208
      Width = 169
      Height = 177
      FileType = [ftDirectory]
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 1
      Visible = False
    end
    object BtnOK: TXiButton
      Left = 226
      Top = 477
      Width = 75
      Height = 38
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
      Caption = #54869#51064
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnCancel: TXiButton
      Left = 306
      Top = 477
      Width = 75
      Height = 38
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
      Caption = #52712#49548
      TabOrder = 3
      OnClick = BtnCancelClick
    end
    object Grid: TAdvStringGrid
      Left = 13
      Top = 88
      Width = 372
      Height = 382
      Cursor = crDefault
      ColCount = 3
      DefaultRowHeight = 18
      RowCount = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 4
      OnDblClick = BtnOKClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'MS Sans Serif'
      ActiveCellFont.Style = [fsBold]
      ColumnSize.Location = clIniFile
      Filter = <>
      FixedColWidth = 35
      FixedRowHeight = 18
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
      ColWidths = (
        35
        81
        234)
    end
  end
end
