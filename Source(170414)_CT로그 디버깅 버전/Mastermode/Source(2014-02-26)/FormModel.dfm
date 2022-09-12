object FrmModel: TFrmModel
  Left = 119
  Top = 228
  Width = 1139
  Height = 315
  Caption = #47784#45944#49324#50577#49444#51221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1123
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 1121
      Height = 39
      Align = alClient
      Alignment = taCenter
      BiDiMode = bdRightToLeft
      Caption = 'Model Information'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 1008
      Top = 8
      Width = 73
      Height = 22
      Caption = 'ADD ROW'
      OnClick = SpeedButton1Click
    end
    object Button1: TButton
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 112
      Top = 8
      Width = 49
      Height = 20
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 168
      Top = 8
      Width = 121
      Height = 20
      ImeName = 'Microsoft IME 2010'
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 296
      Top = 8
      Width = 121
      Height = 20
      ImeName = 'Microsoft IME 2010'
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 258
    Width = 1123
    Height = 19
    Panels = <>
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 41
    Width = 1123
    Height = 217
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
    TabOrder = 2
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
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
