object FrmData: TFrmData
  Left = 441
  Top = 315
  Width = 620
  Height = 320
  Caption = 'TEST RESULT'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Grid: TAdvStringGrid
    Left = 0
    Top = 0
    Width = 612
    Height = 286
    Cursor = crDefault
    Align = alClient
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
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 0
    OnGetCellColor = GridGetCellColor
    OnGetAlignment = GridGetAlignment
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    Bands.PrimaryColor = 8454143
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
  object PopupMenu1: TPopupMenu
    Left = 86
    Top = 78
    object HTML1: TMenuItem
      Caption = 'HTML '#51200#51109
      OnClick = HTML1Click
    end
    object CSV1: TMenuItem
      Caption = 'CSV '#51200#51109
      OnClick = CSV1Click
    end
    object EXCEL1: TMenuItem
      Caption = 'EXCEL '#51200#51109
      OnClick = EXCEL1Click
    end
  end
  object SaveDialog: TSaveDialog
    Left = 88
    Top = 132
  end
end
