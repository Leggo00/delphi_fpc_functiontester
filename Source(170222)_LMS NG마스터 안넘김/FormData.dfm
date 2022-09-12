object FrmData: TFrmData
  Left = 547
  Top = 360
  Width = 872
  Height = 603
  Caption = 'TEST RESULT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
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
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 856
    Height = 565
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    object TabSheet1: TTabSheet
      Caption = 'Test Information'
      OnResize = TabSheet1Resize
      object dpbLabel1: TdpbLabel
        Left = 8
        Top = 8
        Width = 97
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Test Step'
        Color = 8404992
        EdgeStyle = desSunkenHeavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowColor = clBlack
        TextStyle = dtsShadow
      end
      object Lb_StepName: TdpbLabel
        Left = 112
        Top = 8
        Width = 713
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        EdgeStyle = desSunkenHeavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object dpbLabel3: TdpbLabel
        Left = 8
        Top = 48
        Width = 97
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Progress'
        Color = 8404992
        EdgeStyle = desSunkenHeavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowColor = clBlack
        TextStyle = dtsShadow
      end
      object Gauge: TGauge
        Left = 112
        Top = 48
        Width = 713
        Height = 33
        ForeColor = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object dpbLabel2: TdpbLabel
        Left = 8
        Top = 88
        Width = 98
        Height = 113
        Alignment = taCenter
        AutoSize = False
        Caption = 'Test Result'
        Color = 8404992
        EdgeStyle = desSunkenHeavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowColor = clBlack
        TextStyle = dtsShadow
      end
      object Lb_Result: TdpbLabel
        Left = 112
        Top = 88
        Width = 713
        Height = 113
        Alignment = taCenter
        AutoSize = False
        Caption = 'READY'
        Color = clGray
        EdgeStyle = desSunkenHeavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowColor = clBlack
        TextStyle = dtsShadow
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Test Report'
      ImageIndex = 1
      object Grid: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 848
        Height = 537
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
    end
  end
  object rdoDataMode: ZIniRadioGroup
    Left = 188
    Top = 358
    Width = 125
    Height = 30
    Columns = 2
    Items.Strings = (
      'Info'
      'Report')
    TabOrder = 1
    Visible = False
    OnClick = rdoDataModeClick
    IniKey = 'DATAVIEWMODE'
    IniDataSource = INI
  end
  object PopupMenu1: TPopupMenu
    Left = 38
    Top = 230
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
    Top = 220
  end
  object INI: ZIniData
    Enable = True
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'REPORTCHECK'
    Left = 396
    Top = 332
  end
end
