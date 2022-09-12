object FrmMain: TFrmMain
  Left = 593
  Top = 65
  Width = 1265
  Height = 794
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'KMI SIMULATOR'
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PanelProject: TPanel
    Left = 0
    Top = 56
    Width = 234
    Height = 661
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object dpbLabel6: TdpbLabel
      Left = 0
      Top = 605
      Width = 234
      Height = 22
      Align = alBottom
      Visible = False
      Alignment = taCenter
      AutoSize = False
      Caption = 'USE PIN COUNT'
      Color = clGray
      EdgeStyle = desRaised
      Font.Charset = ANSI_CHARSET
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
    object lbPinCount: TdpbLabel
      Left = 0
      Top = 627
      Width = 234
      Height = 34
      Align = alBottom
      Visible = False
      Alignment = taCenter
      AutoSize = False
      Caption = '000000 / 000000'
      Color = clBlack
      EdgeStyle = desFlat
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      ShadowColor = clBlack
      ShadowDepth = 2
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 234
      Height = 375
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      DesignSize = (
        234
        375)
      object dpbLabel3: TdpbLabel
        Left = 138
        Top = 116
        Width = 92
        Height = 28
        Anchors = [akLeft, akTop, akRight]
        Visible = False
        Alignment = taCenter
        AutoSize = False
        Caption = 'CYCLE'
        Color = 16763080
        EdgeStyle = desBump
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object LabelUnit: TdpbLabel
        Left = 2
        Top = 236
        Width = 230
        Height = 50
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'GOOD'
        Color = clGreen
        EdgeStyle = desBump
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        ShadowColor = clBlack
        TextStyle = dtsShadow
      end
      object Label_Model: TdpbLabel
        Left = 2
        Top = 22
        Width = 230
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Color = 16763080
        EdgeStyle = desFlat
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        TextStyle = dtsShadow
        OnDblClick = Label_ModelDblClick
      end
      object Label_TestFile: TdpbLabel
        Left = 2
        Top = 66
        Width = 230
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Color = 16763080
        EdgeStyle = desFlat
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        TextStyle = dtsShadow
      end
      object Label_UnitNgCount: TdpbLabel
        Left = 228
        Top = 293
        Width = 231
        Height = 24
        Visible = False
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Color = clWhite
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = []
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object dpbLabel1: TdpbLabel
        Left = 2
        Top = 90
        Width = 230
        Height = 22
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'BARCODE'
        Color = clGray
        EdgeStyle = desRaised
        Font.Charset = ANSI_CHARSET
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
      object dpbLabel4: TdpbLabel
        Left = 2
        Top = 2
        Width = 230
        Height = 20
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'MODEL'
        Color = clGray
        EdgeStyle = desRaised
        Font.Charset = ANSI_CHARSET
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
      object LableStepName: TdpbLabel
        Left = 2
        Top = 342
        Width = 230
        Height = 30
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'STEP NAME'
        Color = clBlack
        EdgeStyle = desRaised
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clAqua
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object dpbLabel2: TdpbLabel
        Left = 2
        Top = 46
        Width = 230
        Height = 20
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'TEST FILE NAME'
        Color = clGray
        EdgeStyle = desRaised
        Font.Charset = ANSI_CHARSET
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
      object lb_Barcode: TdpbLabel
        Left = 2
        Top = 112
        Width = 230
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Color = 16763080
        EdgeStyle = desFlat
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        TextStyle = dtsShadow
      end
      object Panel4: TPanel
        Left = 236
        Top = 158
        Width = 93
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        BorderWidth = 5
        Color = clBlack
        TabOrder = 1
        Visible = False
        object LCD_Cycle: TLCD99
          Left = 6
          Top = 6
          Width = 81
          Height = 32
          Align = alClient
          Color = clBlack
          DigitNum = 5
          DigitSpacing = 4
          GapX = 1
          GapY = 1
          OnColor = clGray
          SegmentSize = 1
          Value = '00000'
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 136
        Width = 230
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 5
        Color = clBlack
        TabOrder = 0
        object LCD_Time: TLCD99
          Left = 5
          Top = 5
          Width = 220
          Height = 34
          Align = alClient
          Color = clBlack
          DigitNum = 9
          DigitSpacing = 4
          GapX = 1
          GapY = 1
          OnColor = clGray
          SegmentSize = 1
          Value = '0:00:00'
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 180
        Width = 230
        Height = 56
        Align = alTop
        Color = clWhite
        TabOrder = 2
        object ToolBar1: TToolBar
          Tag = 100
          Left = 1
          Top = 1
          Width = 228
          Height = 54
          Align = alLeft
          AutoSize = True
          ButtonHeight = 54
          ButtonWidth = 55
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Images = ImageList
          ParentFont = False
          ParentShowHint = False
          ShowCaptions = True
          ShowHint = True
          TabOrder = 0
          Transparent = False
          object BtnStrart: TToolButton
            Left = 0
            Top = 0
            Caption = #51088#46041#52769#51221
            ImageIndex = 45
            OnClick = BtnStrartClick
          end
          object BtnManual: TToolButton
            Tag = 1
            Left = 55
            Top = 0
            Caption = #49688#46041#52769#51221
            ImageIndex = 50
            OnClick = BtnManualClick
          end
          object BtnStop: TToolButton
            Left = 110
            Top = 0
            Caption = #52769#51221#51221#51648
            ImageIndex = 48
            OnClick = BtnStopClick
          end
          object ToolButton2: TToolButton
            Left = 165
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 48
            Style = tbsSeparator
          end
          object btnReset: TToolButton
            Left = 173
            Top = 0
            Caption = #52488#44592#54868
            ImageIndex = 46
            OnClick = btnResetClick
          end
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 286
        Width = 230
        Height = 56
        Align = alTop
        TabOrder = 3
        object lcdTotal: TdpbLabel
          Left = 0
          Top = 22
          Width = 77
          Height = 34
          Alignment = taCenter
          AutoSize = False
          Caption = '0000'
          Color = clBlack
          EdgeStyle = desFlat
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowColor = clBlack
          ShadowDepth = 2
        end
        object lcdFail: TdpbLabel
          Tag = 1
          Left = 153
          Top = 22
          Width = 76
          Height = 34
          Alignment = taCenter
          AutoSize = False
          Caption = '0000'
          Color = clBlack
          EdgeStyle = desFlat
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowColor = clBlack
          ShadowDepth = 2
          OnDblClick = lcdGoodDblClick
        end
        object lcdGood: TdpbLabel
          Left = 77
          Top = 22
          Width = 76
          Height = 34
          Alignment = taCenter
          AutoSize = False
          Caption = '0000'
          Color = clBlack
          EdgeStyle = desFlat
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowColor = clBlack
          ShadowDepth = 2
          OnDblClick = lcdGoodDblClick
        end
        object dpbLabel13: TdpbLabel
          Left = 153
          Top = 0
          Width = 76
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'FAIL'
          Color = clGray
          EdgeStyle = desRaised
          Font.Charset = ANSI_CHARSET
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
        object dpbLabel12: TdpbLabel
          Left = 77
          Top = 0
          Width = 76
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'GOOD'
          Color = clGray
          EdgeStyle = desRaised
          Font.Charset = ANSI_CHARSET
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
        object lblTotal: TdpbLabel
          Tag = 100
          Left = 0
          Top = 0
          Width = 77
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'TOTAL'
          Color = clGray
          EdgeStyle = desRaised
          Font.Charset = ANSI_CHARSET
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
        object LbFailCount: TLabel
          Left = 144
          Top = 8
          Width = 6
          Height = 12
          Caption = '0'
          Color = clBtnFace
          ParentColor = False
          Visible = False
        end
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 375
      Width = 234
      Height = 230
      ActivePage = TabSheet4
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'STEPLIST'
        object TreeView: TTreeView
          Left = 0
          Top = 0
          Width = 226
          Height = 202
          Align = alClient
          HideSelection = False
          Images = ImgListStep
          Indent = 19
          PopupMenu = PopupMenu1
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnCustomDrawItem = TreeViewCustomDrawItem
        end
        object edtDate: ZIniEdit
          Left = 15
          Top = 32
          Width = 121
          Height = 21
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          Text = 'edtDate'
          Visible = False
          IniKey = 'Date'
          IniDataSource = IniMain
          MoveCursor = False
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'RESOURCE'
        ImageIndex = 1
        object TreeViewRes: TTreeView
          Left = 0
          Top = 0
          Width = 226
          Height = 202
          Align = alClient
          DragMode = dmAutomatic
          HideSelection = False
          Indent = 19
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnStartDrag = TreeViewResStartDrag
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TABLE'
        ImageIndex = 2
        object vl_Table: TValueListEditor
          Left = 0
          Top = 0
          Width = 226
          Height = 206
          Align = alClient
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
          TabOrder = 0
          TitleCaptions.Strings = (
            'Field'
            'Value')
          ColWidths = (
            112
            108)
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'VARIABLE'
        ImageIndex = 3
        object vl_Variable: TValueListEditor
          Left = 0
          Top = 0
          Width = 226
          Height = 202
          Align = alClient
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
          TabOrder = 0
          TitleCaptions.Strings = (
            'Var Name'
            'Value')
          ColWidths = (
            112
            108)
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'MetaFile'
        ImageIndex = 4
        object memoMeta: TMemo
          Left = 0
          Top = 0
          Width = 226
          Height = 202
          Align = alClient
          ImeName = 'Microsoft IME 2003'
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
        end
      end
    end
    object IniSetPin: ZIniSpinEdit
      Left = 154
      Top = 636
      Width = 70
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      Visible = False
      IniKey = 'SetPinCount'
      IniDataSource = IniMain
    end
    object IniUsePin: ZIniSpinEdit
      Left = 26
      Top = 636
      Width = 70
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      Visible = False
      IniKey = 'UsePinCount'
      IniDataSource = IniMain
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 717
    Width = 1249
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object Panel_Back: TPanel
    Left = 242
    Top = 60
    Width = 87
    Height = 61
    Color = clAppWorkSpace
    TabOrder = 2
    Visible = False
  end
  object edtTotal: ZIniSpinEdit
    Left = 10
    Top = 369
    Width = 70
    Height = 21
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
    Visible = False
    IniKey = 'edtTotal'
    IniDataSource = IniMain
  end
  object edtGood: ZIniSpinEdit
    Left = 81
    Top = 369
    Width = 70
    Height = 21
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
    Visible = False
    IniKey = 'edtGood'
    IniDataSource = IniMain
  end
  object edtFail: ZIniSpinEdit
    Left = 155
    Top = 369
    Width = 70
    Height = 21
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
    Visible = False
    IniKey = 'edtFail'
    IniDataSource = IniMain
  end
  object pnlMenu: TAdvPanel
    Left = 0
    Top = 0
    Width = 1249
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    Styler = uImg.AdvPanelStyler
    DesignSize = (
      1249
      56)
    FullHeight = 56
    object Led_Ready: TLed
      Left = 651
      Top = 5
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'PLC READY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object Led_PCReady: TLed
      Left = 753
      Top = 5
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'PC READY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object Led_PCOK: TLed
      Left = 753
      Top = 37
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'TEST OK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object Led_PCNG: TLed
      Left = 753
      Top = 21
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'TEST NG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
      OnColor = clRed
    end
    object Led_PlcReset: TLed
      Left = 651
      Top = 37
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'RESET'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
      OnColor = clYellow
    end
    object Led_PCbarcodeNG: TLed
      Left = 853
      Top = 22
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'BARCODE NG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
      OnColor = clRed
    end
    object Led_PCbarcodeOK: TLed
      Left = 853
      Top = 6
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'BARCODE OK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object Led_Start: TLed
      Left = 651
      Top = 21
      Width = 90
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'START'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object Led1: TLed
      Left = 853
      Top = 37
      Width = 148
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'BARCODE NOREAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
      OnColor = clRed
    end
    object LED_ALIVE: TLed
      Left = 948
      Top = 5
      Width = 80
      Height = 13
      Alignment = laLeft
      BorderWidth = 1
      Caption = 'PLC ALIVE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LedHeight = 13
      LedShape = lsRound
      LedWidth = 13
      OffColor = clBlack
    end
    object tbTitle: TToolBar
      Tag = 100
      Left = 0
      Top = 0
      Width = 643
      Height = 56
      Align = alLeft
      AutoSize = True
      ButtonHeight = 55
      ButtonWidth = 55
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList
      ShowCaptions = True
      TabOrder = 0
      object BtnOpen: TToolButton
        Left = 0
        Top = 0
        Hint = #54532#47196#51229#53944' '#50676#44592
        Caption = #47784#45944#49440#53469
        ImageIndex = 0
        OnClick = MenuOpenProjectClick
      end
      object BtnSave: TToolButton
        Tag = 1
        Left = 55
        Top = 0
        Hint = #54532#47196#51229#53944' '#51200#51109
        Caption = #51200'  '#51109
        ImageIndex = 5
        OnClick = MenuOpenProjectClick
      end
      object BtnSaveAs: TToolButton
        Tag = 2
        Left = 110
        Top = 0
        Hint = #54532#47196#51229#53944' '#49352#47196#51200#51109
        Caption = #45796#47480#51060#47492
        ImageIndex = 3
        OnClick = MenuOpenProjectClick
      end
      object ToolButton6: TToolButton
        Left = 165
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Tag = 9
        Left = 173
        Top = 0
        Caption = #52769#51221#48169#48277
        ImageIndex = 22
        OnClick = MenuOpenProjectClick
      end
      object BtnStepEdit: TToolButton
        Tag = 4
        Left = 228
        Top = 0
        Caption = #49884#54744#49444#51221
        ImageIndex = 9
        OnClick = MenuOpenProjectClick
      end
      object ToolButton8: TToolButton
        Left = 283
        Top = 0
        Width = 6
        Caption = 'ToolButton8'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object btnSlidacs: TToolButton
        Tag = 5
        Left = 289
        Top = 0
        AllowAllUp = True
        Caption = #45936#51060#53552
        Grouped = True
        ImageIndex = 7
        OnClick = MenuOpenProjectClick
      end
      object ToolButton10: TToolButton
        Left = 344
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object BtnSimulator: TToolButton
        Tag = 6
        Left = 352
        Top = 0
        Caption = #49688#46041#51312#51089
        ImageIndex = 11
        OnClick = MenuOpenProjectClick
      end
      object BtnHardware: TToolButton
        Tag = 10
        Left = 407
        Top = 0
        Caption = #54616#46300#50920#50612
        ImageIndex = 8
        OnClick = MenuOpenProjectClick
      end
      object ToolButton5: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Tag = 8
        Left = 470
        Top = 0
        Caption = 'JIG'
        ImageIndex = 29
        Visible = False
        OnClick = MenuOpenProjectClick
      end
      object ToolButton7: TToolButton
        Left = 525
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object btnSystemError: TToolButton
        Tag = 11
        Left = 533
        Top = 0
        AllowAllUp = True
        Caption = 'MASTER'
        Grouped = True
        ImageIndex = 26
        OnClick = MenuOpenProjectClick
      end
      object btnPopSave: TToolButton
        Left = 588
        Top = 0
        Caption = 'LMS'
        ImageIndex = 4
        OnClick = btnPopSaveClick
      end
    end
    object ToolBar2: TToolBar
      Tag = 100
      Left = 1194
      Top = 0
      Width = 55
      Height = 56
      Align = alRight
      AutoSize = True
      ButtonHeight = 54
      ButtonWidth = 55
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      Images = ImageList
      ParentFont = False
      ShowCaptions = True
      TabOrder = 1
      object btnClose: TToolButton
        Tag = 4
        Left = 0
        Top = 0
        Caption = ' '#45149#45236#44592' '
        ImageIndex = 15
        OnClick = MenuCloseClick
      end
    end
    object Button1: TButton
      Left = 944
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
    object pnMES: TPanel
      Left = 1032
      Top = 4
      Width = 154
      Height = 48
      Anchors = [akLeft, akTop, akBottom]
      BevelWidth = 3
      Caption = 'MES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object Edit1: TEdit
    Left = 920
    Top = 64
    Width = 121
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 7
    Visible = False
  end
  object Edt_Pass: ZIniEdit
    Left = 920
    Top = 96
    Width = 121
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 8
    Visible = False
    IniKey = 'PASSWORD'
    IniDataSource = IniMain
    MoveCursor = False
  end
  object Panel6: TPanel
    Left = 32
    Top = 200
    Width = 185
    Height = 41
    TabOrder = 9
    Visible = False
    object cbTrashBarcode: TCheckBox
      Left = 0
      Top = 0
      Width = 97
      Height = 17
      TabOrder = 0
    end
    object edtTestBarocde: TEdit
      Left = 16
      Top = 8
      Width = 161
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
    end
  end
  object IniMain: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.Ini'
    IniSection = 'MAIN'
    Left = 412
    Top = 80
  end
  object TimerRun: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerRunTimer
    Left = 362
    Top = 134
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    Left = 468
    Top = 80
    object memuOpen: TMenuItem
      Caption = #54532#47196#51229#53944'(&P)'
      object MenuOpenProject: TMenuItem
        Caption = #54532#47196#51229#53944' '#50676#44592'(&O)'
        OnClick = MenuOpenProjectClick
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N28: TMenuItem
        Caption = #47112#51060#50500#50883' '#50676#44592
        OnClick = N28Click
      end
      object MenuSaveProject: TMenuItem
        Tag = 1
        Caption = #47112#51060#50500#50883' '#51200#51109'(&S)'
        OnClick = MenuOpenProjectClick
      end
      object MenuSaveAsProject: TMenuItem
        Tag = 2
        Caption = #45796#47480#51060#47492' '#51200#51109'(&A)'
        OnClick = MenuOpenProjectClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object N26: TMenuItem
        Caption = #47784#45944#54200#51665
        OnClick = N26Click
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object MenuClose: TMenuItem
        Caption = #51333#47308'(&X)'
        OnClick = MenuCloseClick
      end
    end
    object M1: TMenuItem
      Caption = #52769#51221'(&M)'
      object MenuAutoStart: TMenuItem
        Caption = #51088#46041#49688#54665
      end
      object MenuManualStart: TMenuItem
        Caption = #49688#46041#49688#54665
      end
      object MenuStop: TMenuItem
        Caption = #52769#51221#51473#51648
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Tag = 3
        Caption = #48260#54140
        OnClick = MenuOpenProjectClick
      end
      object MenuStepEdit: TMenuItem
        Tag = 4
        Caption = #49884#54744#49444#51221
        OnClick = MenuOpenProjectClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Tag = 5
        Caption = #45936#51060#53552' '#44288#47532
        OnClick = MenuOpenProjectClick
      end
      object N19: TMenuItem
        Caption = #49468#49436#53580#51060#48660
        Visible = False
      end
    end
    object N16: TMenuItem
      Caption = #49884#48044#47112#51060#53552
      object MenuSimulator: TMenuItem
        Tag = 6
        Caption = #51077#52636#47141' '#49688#46041#53580#49828#53944
        OnClick = MenuOpenProjectClick
      end
      object N14: TMenuItem
        Caption = #51077#52636#47141' '#52488#44592#54868
        OnClick = N14Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object MenuOpenSimul: TMenuItem
        Tag = 7
        Caption = #49884#48044#47112#51060#53552' '#50676#44592
        OnClick = MenuOpenProjectClick
      end
      object MenuNewSimul: TMenuItem
        Tag = 8
        Caption = #49884#48044#47112#51060#53552' '#46356#51088#51064
        OnClick = MenuOpenProjectClick
      end
    end
    object N6: TMenuItem
      Caption = #49444#51221'(&S)'
      object N24: TMenuItem
        Tag = 9
        Caption = #52769#51221#48169#48277' '#49444#51221
        OnClick = MenuOpenProjectClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object MenuHardware: TMenuItem
        Tag = 10
        Caption = #54616#46300#50920#50612'(&H)'
        OnClick = MenuOpenProjectClick
      end
      object N7: TMenuItem
        Caption = #51088#50896#54200#51665'(&R)'
        Visible = False
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = #50952#46020#50864'(&W)'
      object N5: TMenuItem
        Caption = #44228#45800#51221#47148
        OnClick = N5Click
      end
      object N4: TMenuItem
        Caption = #44032#47196#51221#47148
        OnClick = N4Click
      end
      object N8: TMenuItem
        Caption = #49464#47196#51221#47148
        OnClick = N8Click
      end
      object MenuAutoAlign: TMenuItem
        Caption = #51088#46041#51221#47148
        OnClick = MenuAutoAlignClick
      end
      object MenuDesignMode: TMenuItem
        Caption = #46356#51088#51064#47784#46300
        Visible = False
        OnClick = MenuDesignModeClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object MenuReport: TMenuItem
        Caption = 'Report Window'
        OnClick = MenuReportClick
      end
      object MenuGraph: TMenuItem
        Caption = 'Graph Window'
        OnClick = MenuGraphClick
      end
      object CAN11: TMenuItem
        Tag = 1
        Caption = 'CAN #1'
        OnClick = CAN11Click
      end
      object CAN21: TMenuItem
        Tag = 2
        Caption = 'CAN #2'
        OnClick = CAN11Click
      end
      object CountLIST: TMenuItem
        Caption = #44221#44256' '#47532#49828#53944
        OnClick = CountLISTClick
      end
      object MenuUserMsg: TMenuItem
        Caption = #49324#50857#51088#47700#49464#51648
        Visible = False
        OnClick = MenuUserMsgClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object MenuViewProject: TMenuItem
        Caption = #54532#47196#51229#53944' '#51221#48372#48372#44592
        OnClick = MenuViewProjectClick
      end
      object LOG1: TMenuItem
        Caption = 'LOG'
        OnClick = LOG1Click
      end
      object ASCII1: TMenuItem
        Caption = 'ASCII'
        OnClick = ASCII1Click
      end
    end
    object P1: TMenuItem
      Caption = #51452#48320#51109#52824'(&P)'
      object CAN1: TMenuItem
        Caption = 'CAN'
        OnClick = CAN1Click
      end
      object MenuDevice: TMenuItem
        Caption = 'DEVICE'
      end
      object CANDIAG1: TMenuItem
        Caption = 'CANDIAG'
        OnClick = CANDIAG1Click
      end
      object PLC1: TMenuItem
        Caption = 'PLC'
        OnClick = PLC1Click
      end
      object CLIENT1: TMenuItem
        Caption = 'CLIENT'
        OnClick = CLIENT1Click
      end
      object ITAC1: TMenuItem
        Caption = 'ITAC'
        OnClick = ITAC1Click
      end
      object UDP1: TMenuItem
        Caption = 'UDP'
        OnClick = UDP1Click
      end
      object B1: TMenuItem
        Caption = 'BARCODE #1'
        OnClick = B1Click
      end
      object BARCODE21: TMenuItem
        Caption = 'BARCODE #2'
        OnClick = BARCODE21Click
      end
      object BARCODE31: TMenuItem
        Caption = 'BARCODE #3'
        OnClick = BARCODE31Click
      end
      object NIHARDWARE1: TMenuItem
        Caption = 'NIHARDWARE'
        OnClick = NIHARDWARE1Click
      end
    end
    object A1: TMenuItem
      Caption = #51221#48372'(&A)'
      object MenuAbout: TMenuItem
        Caption = #54532#47196#44536#47016' '#51221#48372'...'
        OnClick = MenuAboutClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 680
    Top = 72
    object N3: TMenuItem
      Caption = #51088#46041' '#49688#54665
      OnClick = BtnStrartClick
    end
    object MenuStepRun: TMenuItem
      Caption = #49828#53597' '#49688#54665
      OnClick = BtnManualClick
    end
    object N25: TMenuItem
      Caption = #54788#51116' '#49828#53597' '#44620#51648' '#49688#54665
      OnClick = N25Click
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #49828#53597' '#54200#51665
      OnClick = N17Click
    end
    object N18: TMenuItem
      Caption = #49828#53597' '#49325#51228
      OnClick = N18Click
    end
  end
  object ScieCalc: TScieCalc
    Left = 456
    Top = 136
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'lay'
    Filter = 'Layout Files(*.lay)|*.lay'
    Left = 528
    Top = 80
  end
  object OpenDialog: TOpenDialog
    Left = 568
    Top = 80
  end
  object ImgListStep: TImageList
    Left = 40
    Top = 536
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F0080000F0080000F008000
      0F0080000F0080000F0080000F0080000F0080000F0080000F0080000F008000
      0F0080000F0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF000000F00000FFFF00C0808F0000FFFF00C0808F000000F000C0808F0000FF
      FF00C0808F0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F00000000000000F00000FFFF00000000000000F000C0808F0000FFFF00C080
      8F0000FFFF0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF00C0808F00000000000000F0000000F000C0808F0000FFFF00C0808F0000FF
      FF00C0808F0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F000000F0000000F00000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF00C0808F000000F000C0808F00000000000000F00000FFFF00C0808F0000FF
      FF00C0808F0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F000000F000C0808F0000FFFF00C0808F0000FFFF000000F00000FFFF00C080
      8F0000FFFF0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000F00C0808F0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0080000F0080000F0080000F008000
      0F0080000F0080000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000F00C0808F0000FF
      FF00C0808F0000FFFF00C0808F0080000F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080000F008000
      0F0080000F0080000F0080000F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000080000F0080000F0080000F008000
      0F0080000F0080000F0080000F0080000F0080000F0080000F0080000F008000
      0F0080000F0080000F000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FF
      FF00C0808F0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FF
      FF00C0808F0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF00C0808F0000FF
      FF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FF
      FF00C0808F0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C0808F0000FFFF00C080
      8F0000FFFF0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080000F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000080000F00C0808F0000FFFF00C080
      8F0000FFFF00C0808F0000FFFF00C0808F0080000F0080000F0080000F008000
      0F0080000F0080000F000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
      C000000000000000000000000000000000000000000080000F00C0808F0000FF
      FF00C0808F0000FFFF00C0808F0080000F000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C0000000
      000000000000000000000000000000000000000000000000000080000F008000
      0F0080000F0080000F0080000F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
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
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      8001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      00010000000000000001000000000000000300000000000080FF000000000000
      C1FF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      80018001C007C00700010001C007C00700010001C007C00700010001C007C007
      00010001C007C00700010001C007C00700010001C007C00700010001C007C007
      00010001C007C00700010001C007C00700030003C00FC00F80FF80FFC01FC01F
      C1FFC1FFC03FC03FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TimerPLC: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerPLCTimer
    Left = 376
    Top = 200
  end
  object ImageList: TImageList
    AllocBy = 0
    Height = 35
    Width = 38
    Left = 421
    Top = 246
    Bitmap = {
      494C010139003B00040026002300FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000980000000D0200000100200000000000E0DE
      04000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F500D1CFCA00B6B2AC00A19D990092918F008C91
      9000919C99009AA9A500C8C4BD00EFEBE900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C9C8C9007E8989006763710068687400676D780066707A0068717B006D71
      7C00736F7B00756B7B0064636D0064616C0088848C00C1C0C100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2C5008175
      7B0076737600748C8C00BDD0DD00D5DFE600F2EDEC00FFF2EB00FFF3E700FFF2
      E500F5EBE100E6E4DA00B6BDC0008194A100556F80004B5A5D0087807200D5CF
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8F9100757B7B009FB0
      AC00E7E5E400FFEAEE00FCB7A800F29E8500DE734D00C94F1B00C3460900D05F
      2000E4874800F3A36600FFD5AA00FFF2D300E3EEDE008EA79D005D6E61006B68
      6000ACA19A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00ECF0F1009790940097919300DCE6DA00ECF6
      E600D39C9300BC373900D32E0300D93A0200E34D0000EE620000F56D0000F871
      0000FE770500FF7B0D00F17D0E00DE781500FEB76D00FFFCD500DFE2E0007081
      9400525C6C00918A8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FDFDFC00858A8D0094A9A100E5F0E000F2C1B100C646
      3900BF1C0D00C2271200DB440700DB490100DE560000E6680000E7750000E57C
      0000E9850000F18E0600FF9A0000FFB01600FF8A0900DA7E2D00FDCAB000F7EC
      F4009BA4B20046565E0091929000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF0094819000B2AEB300E0F4E800CBB29E00BB352300DF08
      0000F1290500BF350100E2480700E74C0700F3550700FB620700FD6F0400F878
      0100F1810000EE880000F09D0100F0950000FFAB1100FFA92300D98A2900F5BF
      8800FFEEDB00B9A9AA005B605F00A4A79F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00AEAEB0009E8E9D00F2E1E500E6B3B000A32A2000CA1F0900DE31
      0900CD2C0000DF3F0000ED410000E64B0200D9540300D05D0200D66B0200EC7B
      0600FF840400FF840000FF8B0E00FFA41F00F1A10800F8B60A00FABC1600D09A
      1E00DAB37C00FFEAE4008B8B8B0064646200CDCBCA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00F6F6F6007E818600D8D6E200F7D6C700BB3C1600EA350300DA340000E42D
      0600E8240600C62F0A00D9360000D7461900E5510500FF640000FE6E0000F071
      0000FA840000FF8E0000FF950100FF980100FFA20800FFA40D00FEAC1E00E8A0
      1D00DA9A2400FFCE6000D8DFDC005D64750078778500FDFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF009FA0A200A3A7AC00E9E6E200D26D5E00CD370E00D6400400E2330100D61C
      0000B4220600A0361700A0340B00932D1000C64B0B00E45C0000CA590900BC5C
      1000CB680000E8821100F4930000FA9B0000FFA81100F59D0900F59D1100FEA4
      2100EF921500EC8D1500FEE9D400B3ADB2005E606C00BDC0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FDFD
      FD007D7D7D00D8D8D800DDCCB100D12C1300EE451200BD420000EA300000DF28
      0E00E8957F00FFD9C800FFDED200FFE0D400C5673200B7460000FFCBA400FCCF
      B400AF6C3500AB601600F1880000F18B0000FC980A00F6940600F8960800FF9D
      0F00FD930600FF960900F0AE7D00FFE6D6005F666F007D838700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00B7B6
      B60094939100F6F2ED00B78A5700E3350B00EA490B00C0440000F6360700BB13
      0000E1B4A700FFFFFE00FBFEFF00FFFAF700B55E3200B4490F00F7DACC00FBFC
      FF00FFE9D600C69C7100BD520000DB6D0D00FD8C1700FF910700FF920000FF98
      0000F6950000FB9D0400D76A1C00FFE9C700889090005C686E00F8F6F300FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008F8E
      8D00C5BFB800EFE6DC00D0834400EC682C00C7430000D2460000FF471600B51A
      0300D8ABA700EAF9FF00E0ECF000FFFFFC00C4623800B8440F00F3E7DD00E1FD
      FF00FFFAF600FFFFE800FFCAB600AD663A00B1570200EF850A00FF8E0000FF90
      0000FD920000ED880000F2680400FFCA9A00BEBFBD0058636A00C1C2C100FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008180
      7D00E6DDD300D7C9B700F99B5900F7975100CB601600CD410000DA2B0000BC26
      0800E3A9A400E5FDFF00EBF6F300F6F3EF00C0543200B7320000E4D7C700D9FA
      FF00F0EDE900F3FEEE00F4FCFF00FDF4EA00C49E6E00A0580400D36F0000FC84
      0700F7760000FF7D0100FF710300E7966300EBDFDF005E677000A6A4A600FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007C7B
      7700F4E9DB00C4B39E00EE935000FB975600EE8C4600D96A2100D5380000D02E
      0B00E49F9600CCF2F700DCEEE100E7F2F000CA5F4A00C2340B00E1CFB800DBF3
      F100F7EBEB00E2F2F100CEE8EF00E8FAFB00FFFFF800EED6BA00B2794600B152
      0800E3650600FF700600F5650000BF683600FFE8EC006A6C740092949200FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007675
      7200FDF0E000BFAD9600F2A36000FF874B00F18C4800DE8F4000F3611F00E030
      0B00DC938500B6E8E800C2DDCD00D8EEF300A9443B00B9280800E8D1B700CEDD
      D500EFD9DB00CEDAE600EAE7E200E4EBEE00D9E6F400EFF6FF00FFF3ED00D79E
      7700BB590B00DD610000EB600000AF542700FFE2EA00706B74008F928E00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007371
      6D00F6E6D900C3AB9900FFB56C00E4993D00E8993E00E5834300FC7D5600D560
      4100D6A39300B5C9CE00C5C5D700DBD3DA00B74D3500CD250D00BBB4AB00BBD3
      D300CAD5CD00B2D4D400CADACF00D1D6D700D4DDE600CAE7EC00E3FFFB00E8E8
      C400B3632C00DB490700FF560500BD410B00E2EED00089727700908F9400FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007775
      7300FAECE000C5B1A000F4AD6E00E9A04C00DC8A3100F9944F00F6764500E772
      4B00DCAA9600BCD1D30099B2BC00C0C5C600A9462A00C21D0200C1B2A900B5BD
      BD00C9B7B000CCC1C400D3C5C600BEC9C600CEEDE400E5F0E000DDAF9700DD6E
      4600D93F0400FF530B00E2430100BD4A1F00EBF2DD00806B73009B9A9F00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007C7B
      7A00F7EAE200D2C0B500F4AF7E00EDA25600E6903600F1893C00FF844700DD6E
      3E00E9BDA500B9D2D600BFCBD500CED3D400A65D3F00B7280C00CAB1AD00BAAE
      B400BBA59F00B4A9AB00A9AFAE00C2CBC100C8BBA500C67D5D00D4411B00EC37
      0600E4410200D8550B00F2613300D6775D00F4F5EB0079687500ACACB100FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008483
      8300DED5D100E8DAD400F3AE8300FAAC6000F49A3B00EE862D00FF8F4700D16C
      3500EAC4AC00BDD8E200D5C2D500DEDAE000C0917500CA5C4400DECBCE00D1C7
      D300CCCEC800B1CBCB00CCCDC900D4AEA200C86B5200C73E1700E04B1900EB65
      2F00DE743E00DE8B5400FF886F00F6B2A500E7E2E400726B7500C7CCCE00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF009695
      9700BAB5B400F4ECEC00E9A77E00FFBB7200F79C3A00FE9A3C00F2863500DC7F
      4200E8C3A900E0F3FB00DADCE700E5E1E700BB8C7100B6584100DAD9DD00E7F1
      FB00E5EDE600DAD8D800DD948C00CE675800E5644900F2794F00EA8B5900DA8B
      6000D67E6000EB817000DB7F7400FED9D500C1B6C0006A6E7500F4F9F800FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00B3B4
      B60099989900EBE7EC00EAB89C00FABA7A00FDAD5400F2973C00ED883200E081
      3800FEC89F00FFFEF500DDFFF400FCF0E600D48A6600D7694700F9EFE800F9FC
      FA00D9B9A600D97C7900D05A4700DA604800F0735400E26A4700DC6B4A00D86B
      5500DD6E6400F2817F00BF817B00F0EBE8009D8F9A0076818300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF0085858800CCCBD500F5DDD700DBB18700FFC37900E79B4800F9984000EA82
      2900FFB57100F7C79D00DAC4A100F4BB9B00DF824500F16B3100E3A38A00DB9C
      8800C3714800DE563A00DE664200E8755000E7735200E5674B00F36D5500E565
      5000E87B6500F3998100DBB6AE00C6DDD50080747900BEC8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF0095959A00A6A6AA00F7F3FF00CAB29A00F0C38600FFBF7200FA9D4200FF97
      3100EF8A2E00C97B3600EE714500E1734300D9792500FF7C2D00E66C4400E661
      4000DA6C3000EE773F00FD744600E96D4400D86D4800D3745300CE745500D97F
      5C00FFA97E00E5895A00FFEBE10096BAAE007A6F7200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00EFEFEF0086868600CCCBCF00FFFBF200BBA38500E2B68100FFD89100E895
      4000F4933900F8903300EE903D00F08D3B00EB853300EC803200F1813B00EC7B
      3D00E5754000EB7C4A00D3744200E97F4A00EE773F00E76B3500FF926700FBA7
      8B00BC867B00EFCDCD00DADCDC0071727200C1C4C400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00B1B3B30093959900F1EBE600FFF0DB00C3A27B00E0AB7200FFD9
      9300FFB16100E3832F00ED913E00EF8F3C00ED893700F2893A00F68A4200F082
      4200E5793F00E5784400F0794800D7693500E17F4900FFBD8A00EBA98000C48C
      7300E5B4AC00FFEEF00086888800989B9B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF008F939400A5A6A500FAF3EA00FFF5E000CCAC8900D9A6
      7400FFC88900FFD89300F99F5200F5974B00ED8B3D00EC863B00F0863F00ED83
      4300E8804500E9824B00E78D5400FFAB7500FFB68800F2A68200C0876E00F0CC
      BC00FFFAF3009FA9A000878A8A00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF0091919400A0A2A400EAE7E300FFF7E900E0C2
      A500BB8A6200E4A97800FFD99300FFD28B00FEC77E00F8BD7500F7B97300F6B9
      7700F6BA7E00F9BF8400FFCA9000F0AE7E00CE8B6A00D1978400FFDAD100F5E5
      DF009CA09C00677C7400FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB0093959B0092949700D0CECD00F4E6
      DA00FFF2DD00D8B39700CA986A00DCA87900F9C08D00FFCE9A00FFCE9A00FFC6
      9400F7BC8E00EDB48700E19B7300DBA58400F9DAC300F1E9DC00CDD3CE008D94
      94008D939300FCFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFB1B50083848600ADAA
      A600E7DBD500F9E8DF00FFECDA00FFDDC700EEC5AC00D6AA8D00C99B7C00D2A6
      8700E7BFA300F5CDB400FFE4CD00FEE6D400F0E1D8009DA3A30081828500AFAE
      B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F2009C9C
      9C008384840096969C00AEC3C400BDD0CD00D6E7DE00E5F4E600E4F4E300E1F1
      E000D7EAD900C7DCCD00AEBEB7009898950080797A00A0979A00F8F8F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F8F800B5B7BD008B88970084808D007F7981007A717600766E70007B76
      7700807D7E007D7A7C0093949A00B6B8BB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFBFA00D4D5D200B1B1AF00A09E9E00979596009692
      970096949800B1B0AA00CDCCC600F4F2F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAFBFA00D0D1CF00B1B1B0009C9D9C009191910092939400999B9B00ADAB
      A900CAC7C400F2EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9F800D1D0
      CC00B4B2AD009F9E9A0093939000939390009A9B9700AAA9A400C7C5C200F1EE
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F8F700D2CFCB00B5B3AC009DA1
      99008D958D008F948D009C9B9800ADA8A600C9C4BD00F0EDEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D4D6D5007C777B0079757700746F71006B686A0064686900637072006178
      7A005D7B7C00616664005B5F5A00656562008D8B8700CDCCCB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCD008285
      87006C6D6D006C6C6C006F6F6F007070700071717100707070006F6F6F006E6E
      6E005C5C5C00696766008D8A8A00C6C6C800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C9CA00848586006A677000716C
      7500766F7200756D6D0073706C00737472006E737400656E7200605D59006C69
      66008C898600C2C1C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C8C8C900828487005D646E00656C75006B717600696E
      7100676C6F006A6E73006A6F7800686B79005D576E006563700085878A00BEC0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECBCC008884
      8400726E6F00A098A900C6B9C700F4E2E900FFF8F800FFF9F300FFF2E700F8EC
      E000F1E9DC00E1E3EB00C2C4CE008C909B0060656E005A5D6000827F7D00D8D4
      D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBC5C8007D768200647377006EA0
      9400ADCCE100C8DEEA00E8F0F000F9F7EC00FDF4E600F9F1E400ECEAE200E0E3
      E100A7CEC6007F9D9800606F710056595B0088828100D5D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C7C2C5007F7C81007378790090909000BDCDDE00D3DC
      E500EEEBE600FEF2E000FFF3DD00FEF2E000EFEAE100E2E0DF00C9C6C2009F9C
      98006E6B6700615F5C0089848200D2CECB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C2C1C5006E787900677471008C9B9300B1CFD000D1DFDE00F6EDEA00FFF1
      ED00FFF1EB00FFF1EB00F4EDE400E1E6DD00B2C0D7009497AC00706673006755
      5C0090838300D2CECB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009994980079747700B2A5
      A700EFE2E400F8EBE300E4CABA00CD9A8000BD6D4800B54F1F00BF491500E263
      2C00FF804700DD9F6900FFD2A900FFF4DC00F4E1D900ABA6A5006C6A69006E6C
      6300A6A29700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009391950076737A00A1A4A900F5E9E500FFEE
      E100FDB9A600F39E8400DF714D00CA4C1C00C4430C00D05D2400E3864E00F2A5
      6D00F8C2A400FFF1E200EBD9D800A2A8A7006071660056625100ADAB9E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009695970078777900A5A5A500DFDFDF00F1F1F100EEBAAD00DE9D
      8100CA754700BD581A00BD4E0A00CC5D1F00EC805000FFA07900CDCAC600EAE7
      E300E9E6E200AEABA7006B68640064645D00ACAAA000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F93
      960074797A00B5B5AF00F5EADC00FFEDD800F7C4AA00E7A18400D3725100C44F
      2800BC461700C3592400D7834900EDA76B00FED1AF00FFE6CE00F9E6DF00B5AF
      B400686B7300595D5A00A5A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8FAFA00938D9200968D9200EBDEE000FFF0
      F300B4A3A600D73E2300CA2F0800D2320000EF4D0000FD620000F5680000F371
      0000F9810400FF860000F67B0300D77D2900EAB68800FFF3E200D9DAD800828B
      8F00515D620094929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F9FA008B8A8E00918F9300DADCDD00FFFAF600E79C8E00D340
      2C00D82D0000DA380000E14D0000EC620200F36C0200FB710100FF720400FF73
      0800EE781100DF822700F4BB7600FFF6CC00E1DFCD00808584005F5B6200908A
      9100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F9
      FA0096858C00928E9800C5DDE900E0EAEA00E7A99700CE422500E9280000EC36
      0000F8540800F25F0300F36C0000FF7C0600FF790000FF7C0000FF8A0000EC79
      1000FFB16700FFFFD000CEDBDD006D7EA90056566C009A8D7E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF3F400918E93009293
      9900DBCDCE00FFE9E100F6A79400A9452C00C62F0000CF340000E6450100FC5A
      0800FF670900FF6F0700FF7A0B00FF841300E77B0500D9862300E4BA7500F9F0
      CA00D9E3D300898F8A00696060009C8A8000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFC007B83830086A89D00E7EDDC00FFD1C400C733
      2500C4170700CE360000D9440100E3520700DD560000D95D0000E4730000E983
      0200E5860000FB8D0B00FF960000FFA40000F4920000E1902F00FFCFA700F1E4
      E2009CA7B50049526600928D8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFC007F8189009CA2A300E5EDE600F2CDC900AA3C3600B2170200CD2D
      0500DC440900DC470400E3520000EC630000F4710000F47C0000F9880200FE92
      0A00FF960000FF9E0500ED950800D68E2800FFD0A200FFEAEA009599AC004E64
      760093929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC008A80
      8600A0A2A000EDF5EE00F8C7C900B03D4000AA170700CD250600DC400B00DC46
      0900DB510400DC5E0000DD6A0000E1760000EA830500F38C0D00FF990000FFA9
      2000DE881600C98F3600EECD9B00FDECE300AEA4B0005E5D680090948E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC008A8D8F008C9B9E00E6E7
      EB00F3CFCF00A85147009B110000D42B1000EC3E0200EE4C0400E95B0200E466
      0000E2730000ED810000F58A0000F6890000FFA30000FFA00300E28D0F00D891
      3A00FFD3A400FFEDE2009DA2B1004759760095989400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008F828500AEAAAA00E1F7E400D5B8A300A6221100D223
      0F00C0270A00DD3B0100E3440600E3480300E8540600F76B1000F26F0700EE6F
      0000F87D0300E78A0000F7970300FFA80D00FFAF1700E9A21C00C8963200D9BC
      7F00FFFCDB00A3A5AD005F5C5D009EA4A100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093839200A7A8A800DCF6E400C9B6A100A0211800EE1D1500D7170000C03F
      0600E5450F00E3480900E6520600EB630500EE6F0200EB770000ED800000F48A
      0100F6960000FF9C0900FFA41500FD9E1800D7921D00F0D08400F6F5D9008497
      9F0055555500A5A6A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091849800B8B1
      B400EFFDE500CDB59700A8211100E41C1000D3170000E2371100D63C0900E74E
      1100EE580A00F6660700F6700400F0780100F1840A00E8810600F7950000F8A2
      0200F7AA1800F6A72800E5962700FFCB7C00F7E5D400949CC400565D5700A1A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092839500B3ACB200ECFAEF00DCBA
      9D00B42A0600CE1F0000CF280000F1371400D4471A00DE3F0100FE540200FF66
      0500E96F0500DB750400E97F0200FF8B0400F7980200FA9C0D00FFA41900F5A3
      1500DDA01A00E9C76D00F9F6E1008D9CBC004D646000A2A69A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A9AAB20096969800EDE1D500E8C6AE00912D1000DF311300E329
      0700C62A0000D8320000DE3E0400E64C0B00E4520600E4570000F1680600FD75
      0B00FE750700EB8F0000FB9C1100F4960D00F5A10C00FFBC1900EBB11800DBA0
      2C00F2B46000FFF2E5008F8D8D0062636700D9D7D700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACAC
      B000918E9400F6F4EC00E6BFA300A1290B00DA280F00DF260C00D2290300E03B
      0A00F2410400E9480400E0560400DA650400DB710000E67B0000F9840000FF8B
      0100FFAD0000FF9E0A00FE981A00FFB42300F1BC0E00C29E0A00DBB27400FFF0
      FF00949494005E5E5D00D2D0D000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABAE00A08B9E00D6E0
      DA00D3BF9C00AC340A00D9260000D9260100D4320800C4350200E1440500E749
      0300F2520000FB5F0000FC6A0000F5720000F57F0200F4890A00FC9F0200E9A5
      0400E6A81400FFB22C00FFA41500EB9B1200E2BE7E00EAE8FC0093908B00535D
      6100CFCFD100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ACACAE009891A000EFEEEA00E1B3A100A431
      1600D02D0C00D9260100E0340A00C32C0000DF380500E9500B00E2590000E161
      0000EF700300F87A0400FC800000FF8C0000FF9D0000FF9F0500FFA61100FFB4
      1D00FFAF1C00D0922000E2BC8200FFEFE5007B898800696D6000CFCDCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00817A8600CAD1CE00FEDDCA00AE381B00D3280200DA2D0000D42A
      0000E62D0100E0400A00D73B0000D7440000E1570400E6620400E6660000EE70
      0400F87B0D00FF8F0600FF940E00FF980F00FA9C0700F8A40400FCAB0E00F8A3
      1800F1961D00EFC49900E5DCD3006A606C0087858500FDFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00F8F8F8008983
      8700D1DBDB00F5CAB900C0431D00E22A0000EE3C0D00C02C0000C52A0300EA2C
      0900C6460000D54D0000E7550300EF5C0000EF650000EC720000E5800000E08A
      0000FEA40000F99A0000FDA01B00EEA00D00F3B40C00F1B01800E38F3600FFAB
      8E00E5E5E5006666660084818100FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00F7F7F70087848600E2D0E100E7DE
      D000B13E1D00F4290000ED420E00C72D0000D0280000C83B0800DB4A0000D747
      0000E6590000EF690300F1740200EC7B0000E7800000F3940900F98F0000F6A5
      0800E49F0C00F19B1300FFB81D00FFA50000D7941700F7C98F00FBE2D8005F67
      660076828800FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00F7F7F70085848500BFCFD500E8D7C400C64A2800EA26
      0200E42D0D00D8250800D6270000C2400400DC390000ED550700E45B0000E765
      0200E9670200EA6C0000F37C0000FF990100F9980000F3980700E7900400FBA1
      0D00FFBA1D00F89C0D00E3902700FFCD8700E0DBDC006F6D65007D808000FDFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF009F9F9F0097A7AD00FEF3EB00BD684E00E03A1100F73B0500E4420800D332
      0000E0250000C3250000E1440C00E8500900E8550000F3690500F06D0000E86C
      0000F37C0900FE7D0000FA820000FF9D0000FFAA0800FF9D0500FFA41400FFAD
      1A00FC9E0500C77F3200FFE5C800B7A3A800605C5B00BDCAC600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF009E9E9E009C9C
      9C00FEEBE800B3654E00C53C0B00E7410000EC360000EE2E0300DB2C0B00BB2D
      0A00D83C0000E3490200ED560B00ED5E0900F0660600F8750800FE800900FF86
      0800E97E0500FF9A1600F9990A00F99B0C00FFA11600FFA01A00FFA21800F090
      0000E5E5E500A5A5A5005B5D5E00BDC7C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF009E9E9E00A1A1A100E8F2E500AB65
      4E00E92E0F00F62E0300CB430F00CD200000FC210000E73E1200E33E0000E84A
      0000E4540500D7550200D8600100E9740700F7810400FA840000FFA00400FF94
      0000FFA40B00FD9D0E00FF9F0C00FFA30800F0960100E58B0800FFE7D400B5B3
      A80044595A00BCC3C000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF009E9E9E00A1A1A100F4EFEE00BB6F5200E0320000FF33
      0000E4340C00CC250A00DC2F0900C82C0000D3400000F1500600F24B0200D745
      0000BE4F0600CB721A00CB6F0000F0850500C3780C00BF7E1C00B5781A00C77F
      0F00EC920500FFAF1600FF960900E3800600FFEEE800B3ABA400555E5E00BCC2
      C100FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FEFE
      FE007C7C7C00BFE1DA00F9C0B100C1351100DD3B0000E03D0000E43A0000D02D
      0600B0210600AF260600B9290000D43C0100ED4F0100F5580000FA670000F973
      0400EC6E0000DA7A1600D57A0000E98F0000FFA40400FF9F0A00FC940500FB9B
      0100FFA70000EB851B00EBAD7100FFE9DB006C6A6A007F8B8900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FEFEFE007F7F8200D7DA
      E200DED2BA00C6400A00FF390100D11E0900B9111000A6200200E1220000D033
      0C00C5410100CA450100E4540200FC5E0400E7530700D3581600DB610700FF7E
      0000FF900000F6980900F68D0800F6920000FFA71400E28A0200CA960E00FF85
      0100FFA26B00DDEBD3007D63750078878700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FDFDFD0084848500D4D4D400DECCA700B330
      0F00E2371100B24313007F150000E7372000F4220A00DB1F0000FA3E0000EF45
      0B00CB3A0700CB501E00CA581C00CB550400F8720C00FF790400F0810000FF91
      0100FF9F0A00EC8F0400C9861900B9792400CF801900EA8C0300F49E8000F5E7
      D000597169007E848600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FDFDFD007E7E7E00DBDBDB00EEBCB000C73B1700FA430000E845
      0000CA310000CC331400D62E0C00F6310300E73B0100E33B0500C8380800CB69
      4100FFC69F00FBC99500A1530700EC7E1F00FFDDB600FFE8C900FCE6C300F8CF
      9000CC811300FE980900FFA91000F18D0000DD9A7F00F8E4D900616D6F008186
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00B8B9
      B80096969600E3F3E200C6745B00D8441500E3500600E7530500D72C0000BA25
      0A00FFA49500E79C9400A54936009D260000D2440700EF580800EC5A0000EB66
      0400EB710D00F9DCB500C79D6200A5650D00C76E0000F9931200FD940700F38F
      0000FEA00700FF8F0E00D0731600FFE4C000919499005E5F6700F8F6F300FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00B7B7B70094959700EEEE
      F400CB755D00D43C0500EB5A1C00DB9F8100C79E9500B88A6800CA290300CB22
      0300FF390100D9430600D3490100E33E0000CD491400C88D5C00C58E4500CF60
      0000FF8A0500F1880000FD960300F38F0000EE780100E2873600DCBF6E00C77B
      2100D9682500EFECCD00A78D9A0050616500F8F6F300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00B8B8B80094949400F2F2F200C87A4C00E13E
      1700E57A4700EACE9800C96F510093000000B7220800E62F0F00E83D0500CA37
      0900B3422100FFB09400FFB68F00AE571900CA5C0400ED6F0300DC851100FF8D
      1400FA800000E9951700FFE19D00FFF0E000F9C69E00CB7F1B00C0583300FFEA
      CB0088A193005F676700F8F6F300FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00B7B7B70095959500EFEFEF00D3826700E23D1200EA400000DA5F
      0900BF370000D6391200C41E0100EC290D00DD1F0200AE290800C68C6F00F4ED
      DC00FFFFF700FFE5CD00AD572300E66E2200FFF4FA00F8FCFF00F6FFFF00FEEA
      CB00B3711E00E6810100FFA00D00FF9F0B00C6602500FFF2DA008C9598005D61
      6400F8F6F300FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF009292
      9200BABABA00FFEBD900D0846000E56A2C00D94B0000E84A0000D5340000B136
      2200FFCBC700FFFCFF00FFDDD900BA70580097280000C6440100D7560700CF5B
      0400EC832800E1F9FF00FFF9FF00EFBDB700C26E3A00CC650000F3860200FB8E
      0A00EE830A00FF850000E16E0000E9C79200BCC2C9006A5D6D00CCC9C000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0092919100BCBABA00E5E3
      E300E7825B00EC622000CA6B2C00F1FBE400EAFFFF00F2EED200C9371900C820
      0800F0300100E3320700C72E0100CF683B00EFD3B400FBFFF100E2B79000CF50
      0B00FC760000FE850700F7790000CC710500E6A36A00FFEAD900FFFFEA00DC8D
      5A00DC580400E9C69B00DAC0C60056646A00C5C4C000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF008A8D8B00D4CAC300F5D9D200D08D4E00D759
      1800E08D7100FFFCFF00FFFBFC00B8847E0087272700AC0A0500E3340200E839
      0100D5381100F9E1CF00FFFDFE00EFEAD500BF926D00C3391C00FA5D0600EF7E
      0500F2840E00EC912500FFFEEA00DFFFFF00DDFEF000D47F3B00E2651000F7B8
      8600C4D1C90075536B00BEC2C100FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF008D8F8E00C0C0C000DBDBDB00D3855600E75B2600EB4F0A00C03C
      0000D84B0200DC2E0000CB230B00A1190700B0483B00FEC4B800FDFFF900D7FA
      FD00ECFFFF00F9DBC8009A400500FF882F00EAEEF300E5F6FF00E4F7FE00EFDE
      C400B56D2000F7861100FD870000F0870000EA680D00FBC8A000C0C4C500605C
      6100C1C2C100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008183
      8300D7D9D900ECC7AB00EA9F6B00E78F4900DE632500D03E0400E1330000C82F
      0A00E6D7B700FFF9FF00EEFAFE00F5FFFA00D2B1A800A73D3600BF261100E24D
      1500ED701C00F1F6FF00F8FFFE00EFFFF100E1FED700B59D6F00B44D0E00F068
      0A00F77B0000DB810B00F76E0C00F5885000D8EBD8006A6F7800ADAAA700FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0081807F00DBD6D300CBC5
      C000EC995C00F47F3400C87D4500E9FBF400E5F5FF00FFECE000C92A1600C413
      0400CF160200A7301A00B08E7000E4F9D900EDFFFC00FFF3FE00E79D9100C852
      1F00F4780200C65F0200D47B3E00F2CCAA00FCF5F800E3F7FF00E9FEEF00DE89
      5900F6600000D58E5C00F2DBD900626A7100A4A7A800FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007E817E00DBD1CA00E2C6BF00F0A06500F272
      3100F3AC8B00EDF9FD00FAFFFE00FFFFF800F1D8D400A45C54009D130000C923
      0000DF301600EDDFCD00E1F8F300F8FFF400FFF8DA00DABC9F00B3662700BB4D
      0000EB590000F18F3100EDF7E600E5F8FB00F6F7ED00D16C2800E75D0300EF99
      6500D8E1D40078607200A3A8AC00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF007F807F00D2D2D200C3C3C300DC9B5E00F38E5000F1571600E847
      0000E3490000E6270000CB200A00C77E7000D2E6D900E8F3F000DBE4ED00D3E3
      F400E0F0F700F1DFC2009E4E0100EE6B0000E6EEE300DFF4F100EFFFFA00F4DE
      BB00B7621200FF810E00F7750000FA830200FF710100C78A5800E4E4E400736C
      7300AAA6AA00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007C7D
      7D00E1E3E300DFB69600E99B6600EE964F00F5814000E55D2200DC380300C42D
      0B00E0CFB500D3EEF200FEF3F500FEF5F100E0FCEF00E8ECE000CD806D00A92B
      0200D05B1800F5EDF700EADFE200F2ECE700F4FFF900E8FFF700CBD6B500B57C
      4500C64B0700E1770400FD6A0A00E3703700D9E4D000686A720096989600FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0078757400EEE6DF00C4B8
      AE00F1995200FF8E4100E5A06F00DAEFF100DAE8FF00F4DFD700B4200F00B019
      0B00B4404500D4C0BB00CFF8E900CCE7DD00D2E2E900ECFCFF00C69C8F00B639
      0700C1540A00C1976D00D0D4CE00CBE9EE00DCDCEE00ECE7F600F0FFEC00AA76
      4700FA5A0000D7703F00FEEBE6005F606400979B9C00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0076797500ECE2DB00CFB3AC00E4915900FF88
      4300F5BE9900DEF4F200E4F2EE00EDF4ED00EAFFFF00F3F5EF00D9A59E007B27
      0E00A1130200E2CFC200D0F0EB00E6FEF200F0F7E800E9FFF500F4F7E100C090
      5C00B9481000C2671C00E0E4D800E3EFEF00EEEDDF00CC662500F75B0100E26C
      3800EBEDDA007A6C780096999B00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00777A7800F3E3D700DABBA200F19F5800E9934700FC934A00DB54
      2000B4260F00B8504900CEB3A900C4E7D300CDD5D500C7D4D600CFD1DB00D5DE
      EB00EEF0F800CED1B800B0400C00DE701800E1DFDE00D8E6EC00DBEFF000CDD8
      B800C3581500ED6D0600FD790700ED700200FF6C0700EA642E00F2E5D5005D73
      790098939800FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007576
      7600E9EBEB00DFAF8D00F09D6500EA944800FC924B00FB834200EC571F00CC3D
      1E00CAB9A600C3F1EB00D3D8D600EEDEDF00E0E8E800DCFBF800F5FFF000DAB5
      8F00AE612900D9CBD600E2E2E800D8D4DF00E7DEF200D7E8FD00CCF9FD00E6F8
      E700C1997C00DA5C0000F75A0000CE531B00EDEEDA007B767F008D929000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0079777400F5E9DF00BFAF
      9E00F0AB5C00F4883B00EA986E00DFDBE600EDE8FF00DAD5C6008D3B1C00AB79
      5D00C5CBD600BABEC900C7B9BF00E2CDCF00B8CBD200B8EAF000ACA48D00B04B
      1400D8AE9B00C0C5C800ACC1D000AAC9C800CFCCC400D6D0C900DAEDDA00AA79
      5F00F7570000CA492200FCF0EA00736D6E0096939300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0071757000F9EFE800C1A59E00EAA16500EC83
      3A00E9BB9200DFF4F200E2DEDD00DED2D200D6E8EF00E4F2F100E6FFFF00DFF3
      DC00A9514100D1A4A000E5E4E600C9DAD700E3DCDF00EDE9F500D5F5FF00E9FF
      ED00D9B89100B4672E00D9C6C300D7E5E400CEE6D400B7652400FF5C0300D447
      1600EFEEDA0074707500928E8F00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0073767400F5E7DB00CBAF9700F1A16000F48B4800FB834200E582
      5000DBA78900C6B7AE00BEB8B900C7B8BC00C1BFB700C2CAC000CAC9C500C6CE
      CE00DDDDDD00C7C5AD00AE370A00D7601500D3D1D000CFDBE100DAE9EC00D2D6
      B900C6531600E7620100F86C0100EA670000FC630600DA552300F9EADA005F72
      7700958D9100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF006E70
      7000E9EBEB00DBA88700F8A46A00E48F3F00EE8C4000FA924B00FF793F00E860
      4300C9B6A700B0C6CB00BBC7C900D9D6D800D4CDD400DCE0E500FEFFF700DFC6
      A400A2693500CFC6D300B9C0C900BECBD300C5C5D700C8C6DC00F1F6FF00FCF5
      E600CBAC8D00E0550000F14F0000BB400E00F3ECDB00797178008A908F00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007D7A7800F4E7D900BEAB
      9600F2B96A00F08E4200E5966D00E7DCE600E9DCF200D5D1B900AA6E4A00DDD2
      B200A8B0C100B0B3C200ACACAC00C5C4BA00BDBDBD00CDC2CC00BA968400CC92
      5700DBD8DA00ADB4BD00A69CA200B6BAAE00BCBDB300B1BDBD00D1E2D500B55F
      4B00E74D0000B92A0E00ECE8E30084767700948D8A00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF006E726E00F9EFE800BB9F9800F6B27100F08A
      3F00DFB58B00CAE2E200D6D6D600DCD4D400C8DEE300C5D9D400E3EDF400F0F5
      E000BE564900CF939300D7CDD300BCC8CA00D3CCD300CDCBDE00C2DCED00EFFF
      F700EDC4AB00BB693900C8B3B500BCCAC900BBD4C600B6632B00EF4B0000C538
      0D00EDEDDB0075717600928C8B00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF006F717100F9EDE300BEA69000FAAD6E00F58B4B00EF7B3C00E89C
      6800E9E0BF00C4DFD500A9B4BC00B59FB100B7B1A600B3B8A900B4B4A800AEB5
      AE00CBC8C300C1BBA400B2311000DD581E00C5C4C000BAC4CB00C3CDD400C7C3
      AB00C8491600E6580100F25E0000E85C0200E64C0000BD3D1200FDEDDD00646F
      7300968E9000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007273
      7300E8EAEA00D9B09000FFB17800F2A04E00E88C3B00E98B3F00F77B3B00F372
      5100D5C5B500C1C5D700AEAAB500A7BAB700B3D5CE00DAC5C300E2737100BD33
      1C00B24B1A00AEAEC000B3AAB400B2B5B300ADC9BC00C6D7C900EAC1AB00E177
      5200C4380300D7480000E0470400C04E2500F6EEE10074697300949A9900FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007B787600F4E5D500CDB6
      A000FFAE6700F88F4600C8936800B5D4D500B1C1CD00DDD4B900D7704F00DF8F
      7800DDC3D500B8CBD200A0BEB100BCBBA700B1A59F00C3BDC200B17B7000BC39
      1100B38D8B00E1DCD300D0D1C100A7B6A800B1ACBB00A49CBA00C0BDB800C86B
      4400D43E0000D43F2B00EDECE8007F6E6B00A09B9700FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0072767200F5EBE400C9ADA600F4B06700FE92
      4500E3B48E00B3D2D500B1C6C700B9C8C000BADCD200DEEFDA00FDB7B000A136
      2100C0160B00D4A4A200A5AFB600A5B3B200B6BDBA00AECDCE00E3D5CF00CA86
      6F00CA443200B64D2100B3B1B000A5B0B400C0BCBB00BB522700D6400000C24E
      2B00E9EFE40079707A009C9B9800FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF006D707200FAF0E900C1AD9B00F3AA6600F8A45800EE904400D47C
      3C00D3916E00E6C3B900E3DEDF00CBD8DA00B7B2B400AFB6B100AEB2AC00A5B3
      AD00BABEB900B3AB9A00AF261000E2522800B9B6B100ACB4BB00BBC1C800C7BD
      AC00CE481E00E6500900EA520400DE500900DD450E00B6432200FFF0E3006A6D
      71009E9A9B00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007B7C
      7C00E4E6E600DFC5AD00F9B07C00FAA95800F0933E00E88C3900F07C3500F076
      4E00E0D2BF00CADAEA00B9CECC00C7DAC700C6B39E00C4554B00CE0D0900D613
      0000EC542B00C1CDDF00C2BBBE00B7B09C00CDC9A600C8977100B83C1400DA37
      0000E1460000D7542200E15B2B00E5846800F5F2EE0073697600ADB1B000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007A777600F3EBEB00CEC6
      C600E3BB7000FF9A5100E8A06A00DDD4CB00B3D3E600C8C7C900CC6F5600D56C
      3900F3774700E9BE9700DAEAD900C1D4DC00ACC2CE00B3C5C400BC887B00AF1E
      0E00DE270700D55C3500FDC19D00FFEAD800C1D1D000A3C9CB00BEC3BA009F6C
      5C00E3493600D6827000FFF0E3006D6F6F00ABAAAF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00787B7700EEE4DD00DFC3BC00F9BE6E00F88C
      3B00F1B89800C5DEE800B7CACF00D3D7CC00D6CFBE00D19F8100D3654100E650
      2800EA3E2800D3BCB400B4BDC600AEB3B200C9C0B300B8A29700B7533000BA30
      0200D8280A00D0592800C4C7C500B0C4C900C8C9CD00C1543400E15C2300D787
      6A00DEEDE90079687600AAAEB100FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0073757A00ECE8E300D1C4B400FFC17800E69D4900E38C3000FC8D
      3D00F57B4700DF785D00E0AB9700EFE4CE00ECE1F100D8DBE300C3C8CB00A4B7
      BA00B3BCC000ADABA100A5201200CD401B00BFBDB500ADB6BA00B3B7C200B8AC
      A200B8331200CD3B0000D5440600D5501700ED633F00D5776000FBF3E6006D6F
      6F00ABACAF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008384
      8400D2D4D400DFD7C600E4A67800F9A95C00F6944000EF923B00FD8C3C00F47E
      4F00E7DFC200E5F1F300DEDECE00DDAE8E00DA694800F3553D00FF5F4900E352
      3800DD573500D8E8F800E0DDD800F8D1B500CE795300BE3A1500F0583500F56C
      3E00DA6E3400F2806200F4856500FFB8A600D7DCDF0067606F00CED4D300FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0084818100DBD6D500D8D0
      D000E2AE6800EEA05900EA8F6200EDEDE700B8D9EC00F4D7DA00C57E5900DD66
      2F00E9693900D06C4A00DB897E00F9C1C600F2FCFC00D6FFF200C6A79000C22F
      1F00E9452800C3482400A14A2800DB9C8800FFE3DE00EDF1EC00FCF9EB00C7A2
      8E00FA746200F4B09D00E8DFD200686F6F00CCD1D200FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007D807D00E4DAD300E8CCC500E9BF6600FF9C
      4B00FBB99C00E0E8F900F0ECF700DCB8B000BC746300EB614400DD7C3C00EC7E
      3C00E56F4600E7DFD200FFF4FF00E6DCDC00C5988A00BD383100F63D0500E04D
      0900D8461600DE693200F9EDED00C9EBF100C7E7EC00E3896B00FF875900F0B7
      A100D2E7E800755C7000C7CFD000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF007F828700D3D1D000E4DCCF00F1AE6F00FFB16200FB993B00FF8E
      3000F6833800E4774100D4714500D97D5400F1C8CD00F5E0DF00F6E9EB00D4DC
      E300CDD4DD00BFC0BC00B4392B00DB593400D8D9CF00C1CACE00BCC2CF00C5BB
      B400D2533A00F0693700F7774400F5845900F9816E00F8B6A400DCE3D600716C
      7000C6CDCE00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008A8B
      8C00BDBFBF00E8ECE000E6AF8400FFB86D00FA974100EE8E3400FD8B3700EC78
      4300DED7B600EFDAD200DB7C6900E5593400E06E3900D0794700CD6C4800D068
      4B00E48A6C00DBE7F300D0B6AF00CA6D5400E95E3D00F1785800D17F6000D97D
      6400FF7C6900E8817200E9887400FFC5BC00BAC5CD0066657200F7FBFA00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0097959500B7B3B200EEE9
      E800E1AB7400FFC48400F79F7000FFF4E400EAF4F400FFD8C700D3865500F278
      3C00F0734100EB694400E85D4A00E26B6200DFB4A300EEF6D800F6C7AB00E959
      4700FF745900E0654500E4704F00E2735900DD867600FDCEC000FFF7E400CBA4
      8E00E27D6E00FFDDCC00BDBFB300626B6B00F7FBFA00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0099989800B8B8B800EAEAEA00E6BB7C00FFB2
      7900FFB88000FFF8B800E6B47200DD6E3000FD793900EE853C00F5814200D971
      3600CB724000FFC9A200FFDCBB00D67E6000C45C3F00E6715400D67C5E00E46D
      5400EE6C5500E58B7200FFE5C700FFFAE100FFDFD300D7848300DD786F00FFD7
      CD00C3C2BE005E717300F4F9F800FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0098989D00B4B4B400EDE9DE00E7AD8300FFB67700F6953E00F591
      3100F3994000E88C4300E2733500F9773C00C66C4A00E2A18200FFDCCA00FFF7
      F400F7F5FB00D0D6D100C3564800F4855D00F1F3E700DDE8EC00DBE3F000DFDA
      D700E56F5C00F57C5200EC7E5400DE846200E6827D00FFD9CD00ACBFB0006B75
      7200F4F9F800FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0
      C00090909000FCEDEA00D3B79F00E5B67E00F9B56200EE963800F58E3800F98A
      4400F17E4500E5753300E7763700E9773B00EB763F00E9724100E96D4400E86B
      4500E7694600E2704B00D45D3D00DF5D4600F0675700EB645400E3654D00E26E
      4F00DD724C00F08B7C00C3897D00F4E8E2009098980083848900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00BFBFBE0092919000F4F2
      F100D8B89500FEAB7700F8B47300E1A37300D5A87D00DAA86E00DF723400EC7F
      4100ED804800E17D4700DE6E4300DE603E00DC6B4B00DE876700E1816300DF5E
      4500E46D5300E56C4C00F7795600E25F3E00D05B3E00D3765F00DA917D00D391
      7F00BF7F7400FFEFE300929D93007F868700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00BDBDBC0091909000F3F3F300BEB47E00FABB
      8800F8A36B00D08A4700CF7D3500FF884400F37A3400DD8D4000EB6D3300F17B
      4700D4683E00D26E4C00D6725600CA5E4600DA644B00E6684F00E9614900E763
      4B00EA6F5300C85D4100DE816800D17A6600C0665B00EA8A8400D3847900FFE1
      D8009DA19C0072818300FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00B2B4B80097979700EFEFE300DAAB9000FFC49400FCAA5D00F198
      3D00EB913800EF934400EB873F00F2833D00F9773400D36F3400D4896200E9C8
      B900FFF8FA00E2E9E200BD594700DB794F00F6FAEE00EEFAFE00EFF8FF00E0DE
      DD00CF5E4E00D6674100DA795300DE927500CE787800FFE6DC0086A39400737D
      7800FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0082828200DBD4D100FDECD700D1AB7B00F9BB7400F29F4A00F7943E00FA8E
      4000EC7C3600ED834300EC824300EA7E4400E9794400E6744500E7714800E870
      4C00E9714E00D1653C00E8765100E86F4F00DF624600E56A4E00DE6C4E00D871
      5000E6866200DC877700DEAEA200F3EDE600656D6D00CCCED100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0082848200CED1
      CF00F8E6DF00DC9A7100FFCD7E00FA9C4900CF751D00E99C3C00F4853500EA87
      4900DD7C3C00C97A3700CF7D3C00EE794200FC6B3D00ED623B00DD684300D56F
      4C00DC6B4A00E36D4A00DD663F00EA764D00ED7B5300D8634600EE827000E584
      7A00DCBAB400DDDBD100757A7700C7CACD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0081828100DDDDDD00FAFBDB00D5A4
      7E00FFBB8400E4984C00F2974200FF8B3B00FF8D4000D6883B00F27A3F00FB85
      5100EA774A00DB694400DB6A4A00E26D5000E9715400E4694D00FC694F00F16D
      4F00EB725200E3684800DF5A3F00EB665200FA847300E9847500E1B4A700FEE9
      E100656B6700C4CACD00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF007E7F7E00D6D6D600FBEBE400BD9C8200FFC58D00EF96
      4500F9913400FF943C00EF893E00E2814100EC7E3E00E57A4000CB653400CD6D
      4500FFA17D00FF9F7B00D7704900D66E4300F4A39B00FCBEAC00EFBB9D00E8A0
      7E00E0755400E6684C00F9886E00EB8E7500C1B9BA00F1E9EA00716E6E00C5CA
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00A1A1A100A7AAB600EBE5D800E3C8A600E4B27D00FFCC8400EC914000EF8B
      3300FF994100F5904C00EE884700E7804100E77C4300E87B4700E97A4A00E473
      4800DF6D4400DF764A00D86B3F00E1704500EF7E5300E2764D00CF6B4800D980
      5E00F3A08100C78C7D00FFF3E800AAACA6006F797900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00A1A3A2009AA1
      9E00FFF0FE00DCC8A900F6AB6700FFCE7600FFA13D00F88B2100E7953600E983
      4200ED8E4400EE8F4500EC863E00E8753200EE703500F27A4600E57F4E00CE79
      4900E7784A00E26C4300E4754F00D1724700D2704600ED7E5E00FF968500DF84
      7F00FEF0F1009DA6A300737C7800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00A2A3A300A4A4A400F4E9E100E7BD
      A600EFB68300FFD18000D8923400F78D3500FB883800F0904400F28C4400E77E
      3B00E47A3B00EC7D4500EE7D4B00E5764600DE6F4100DF724600E6734E00E570
      4B00E0674000F47B5400E6724F00E97F6000F89F8400DF8F7600FEEFE600B6B4
      AC006B767300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00A2A3A300A2A2A200FBF0EC00D1B6A100E1AD7E00FFD8
      9000E6873000F8943C00F38F3D00EC8A3E00FF854000FF854500F0794100DF6C
      3A00E6734800E56F4500DD653700F3774700D7675100CA543B00DB654800D764
      4300CE684500EB907100EB977D00D6866F00F1E9EA00A6A0A1007B7C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00F5F4F5006E7A7D00D6DCD700FDEFDD00CAA58300ECB37C00FFDC9200EB92
      3A00ED8F2E00ED893B00F08B4000F18B4200EC843F00E57B3B00E3763800E678
      3E00EA7B4300E5774700E7784600EC7C4700E0733F00D7714100E98E6700F0A0
      8300D78E7800F1D1C600EAE0D6006B747000C8CFCF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00F1F1F1008587
      8D00D3C7DD00EEF4E300D5AA8300F9BD8700FFC47B00F6983700E79F3A00F08B
      3D00EF893700EF823400EF7E3500F0813B00F0824200E97B4100E1774100D77A
      4300F2814800E86B3E00E7735000C66E4900E8966D00F99C7B00DF938100F5CE
      C500D6D2D8006E817D00C0C6C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00F0F0F00087888B00D6CFD400FFFC
      F000BD966F00F3C68300FFD78300F59E4800F28F3F00E98D4000F4903E00F087
      3800F4873900F6833A00F17C3700EE7A3900EB7A3C00ED7F4300DF6F4500E87C
      5200E0774C00D9704700F2916D00F1A28100CC967800EECDB300DBDFD9006A76
      7100C0C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EFEFEF0089898A00CAC6C500FFFFF300CBA88600F0B8
      8100FFD08800ED944300EB8A3300F8963E00EE8A3800EB873900EC8D4400E486
      4400DD7E3F00DA7A3E00D9763800E4804000F4734600F8754A00F16E4300E86F
      4700F4936F00DD947600C9937C00FFD5C200E2DCDD0077787700C0C4C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B0B7B900888E8E00F5F2EA00FFF8E600BC977100F0B77F00FFCE
      8100FFB65F00EC8D3600ED8C3500EE8C3800F18E3E00F48F4100F48B4200ED83
      3C00E77D3600E7774300E4743F00E1713C00F1885500FFA57900F4A38200E29D
      8900EDB2A300FFF4EE0089898500929C9D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABB0
      AE0092949D00E6E1E000F2FCEB00B48C7A00F6B88F00FFDD8A00FFAF5000EC8E
      3500FB903B00F58D3A00EC8A3C00E8894000F2814200FC773E00F6753E00EA7B
      4300EB7C3800EE6D3C00F97E5E00FAA07E00FAA98600E0937300E4B9A400EAF3
      E6008E8E92008A939500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB1AF008E979E00DFDC
      D800FFFFEE00C6926D00FEBB8400FFCE8A00FBB66700CB8A3900F9904100F88C
      3B00F9893700F7843300F9833600FB823C00F67E3D00F0783C00FB784D00D46C
      3D00D6865700F19F7600F79A7B00E4937E00E1BBA900F0F4E100858C8C008B95
      9500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFB2B1008F949700E3E0D800FFFAE700B592
      7000F2BC8700FFD18B00FFB56100E2852A00FF994900F6893B00F3873A00EF83
      3B00EF833C00F2854100EF803C00ED7E3A00EB7A3800D1753400D5894E00FFAF
      8000FBA08100E0947E00EAC6B600E5E8D8008789890094989800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00999C9C00A2A5A600EFEAE100FFFFEB00C2A17A00DFB0
      7A00FFC78900FFC97700FFB36100ED984800DD883A00DE863A00E1883E00E387
      3E00E1853E00EB874D00F5905900FFA47200FFB08700EFA28200D1957F00E6BA
      AD00FFF6ED009C9C9B0081858600FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009B9A9200AAACA600F1EDE200FFF9E800BAA58600C09B6900FFDB9800FFD4
      8400FFA55C00F6974E00EC884000EC843F00EC824300EA7E4800E87C4D00E97D
      5400EE8D4E00FFA66E00FFC39500F3A68500C58C7700ECC8C000F5E8E6009D9D
      9D0083848400FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008E929000ACAF
      AB00F6EDEA00FFEBE000D6AA8D00CF9E6C00FFD58E00FFD17D00F69F5D00ED97
      5100E0893F00E08A3E00E58C4200E6864400E8844A00EB834E00F1835300FFA3
      7200FFC29300EDAC8500D5937A00F2BDB000FFF8F3009FA1A10085888A00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F949300A7A9A700F4EEE700FFFB
      EA00C7A68500CE9C6800FFCD8900FFD78900FFA15800F3964B00ED8E4400E785
      3D00E6843E00E9864200E4834100EC8A4A00F18C4800F5A66700F9BD8700E9AC
      8400D18B7400F6BFB200FDEEE50098AEA20083868600FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008C9091009B9FA000ECEAE000FFF6E300DCBE
      A300A9836100FEC17F00FFC78700FFCB8B00FFC68900FFBD8000F9B57A00FCB6
      7B00FFBA7F00FFC58500FFC28A00F8AF8300D18F7200D19F8D00FCE0D500F0E6
      DF00A2A39F007C7E8100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0093909100A7A3A400ECE3E000FFFCEF00E4C4A700AE815500E7B1
      7A00FFD48D00FFCE8700FFC67F00FFC17A00FFBC7900FDBA7D00FDBA8300FFBD
      8A00FFCA9900F6B08100C5876100C9997D00FFDFCC00F8E9E000A7A5A4007177
      7900FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8B
      8F00A1A4A800E0E7EA00FAF4E700D7C19800BE884700FFBB6A00FFCA9200FFD5
      9800FCCA8800F4C37D00F0BC7900EEB27600FDB88600FFBC9000FFCD9200F3AD
      7800E6996B00CB916D00FBE4CA00E6E6DA00A8A5A6007C737D00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00909092009E9FA200EEE8
      E300FDEDDD00E6C8AB00A87E5400D9A87600FFD19500FFCC8D00FFC88700FBBE
      7C00FABA7900F8B97C00F2B67B00FEC28C00FFC79400FFB18600E08F6E00CF90
      7C00FFD9CD00FBEDE700A4A4A4006F777800FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB0092999B0091959300D4D1C900FFF4
      E900FFF4E600DCAE7E00DAAC7C00DFAF7F00EBBA8C00F9C79900FFCD9F00F8C5
      9A00F2BD9200EDB97300DBA46B00D8A47C00FBCFB800FFEBE200D0CCC700919A
      99007A918F00FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB0098959D0098979B00DACFD200FEE8E200FFF1E100D9B3
      9B00CDA26F00DFB07C00F3C28A00FFCB8F00FECA8E00F9C38C00EFBD8900E9B8
      8600C99B7C00D0AA8C00ECD1B700FFF6E300DCD9CB008D918F008C939700FCFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB009D9B9F0098979800CAC5C200FEF5F200F6EBE700BFB3AF00D4A26E00DAA8
      7400F1BF8B00FFCD9900F8C69200F6C49000F5C38F00EAB88400D4A18000CAA1
      8800E5CBBF00FDF5F500CDD2D500868F8E00919A9A00FCFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00A09EA2009492
      9400D0CBCA00FFF3ED00FEEBDE00D3BBA900DAA58000E1A98000FABC8E00FFC6
      9500FFC79600FFC29500F6B58E00F3B39000D1967600CD957C00F6C9BB00FFF2
      ED00E0D3D500888C8D008E949600FCFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B4B6008A898A009F9F
      9F00D1D1D100FFEDE500FFEAE000F8DECE00E4C5B000D0AB9100CAA18000D7AB
      8600E5B89200D6CACA00E8DCDC00F6ECEC00E3D9D900ACA5A40087818400B0AE
      B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFB1B7007D7C8200A7A6A700D8CBC900FFF1
      EA00FFEAD500FEDFC600E9C7AA00D2AD8B00C6A27E00D1AD8900E0C09D00EACC
      A900FFECE000FEECE100E1DBD000A6A9A00088888600ADAFB200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AFAFB30087848600A8A5A400E0D4D200F1E6E200FFF1D300FCDA
      BC00E8C6A800D3B19300C19F8100CBA98B00E3C1A300EBC9AB00FFE5CA00FFF9
      E500EADDD5009896960080818400AEB0B300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0AF
      B40088868A00A7A4A600D5CFD400F3ECEF00FFF2D600F2D9B900E9CAA300D9B3
      8900C8A07600D1AA8400E1BE9D00F1CFB200FDEAD500E9F4E000BEE0D50095A2
      A20080808700B2ACB400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F200A4A5
      A800818183009C9D9B00B4B5B100D6D3CE00EFEAE100FBF4E500FBF1DF00FAEC
      D900F9EBD500DED4D400C9C1C100989695007E7C7B009D9C9D00F9F9FA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F2009C9EA100808585008F8E
      8A00BFC5CA00D0D4D500E3E5DF00F0F0E400F4F5E500F2F3E300E4E9DA00D7DE
      CF00C0AEAF00979191007F7B7C009B9D9D00F8F8F900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F2009E9C9C008886840098939000CFC5BE00D6CC
      C500ECE2DB00FAF0E900F5EBE400F1E7E000EEE4DD00E3D9D200C0B9AA009792
      8900807F7E009EA0A200F8F8F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F200A09E9E008887860093939300C2C2C200CDCDCD00DEDEDE00ECEC
      EC00F0F0F000EBEBEB00E0E0E000D8D8D800BABABA0096938F007D7C7C009D9E
      9F00F8F8F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00AEB3B90094999E007E84880073777C006B7073006C7071007275
      7600777B7C007E7D7D0091929100BCBBBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00B3B5
      BA00898B98007E7F88007A787D007672750073717000767574007A7B7C00747A
      7D0097929400C0BCBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00B7B7BA00888A95007F81
      89007B7C830075757C006E6F750071727800797B8100787B820098959600BEBC
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900B8B8BB008A8B9000838387007C7C7E007474
      760072727400747577007C7C7E007E7F810098979700BDBCBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F400D0CECA00B5B2AE009F9D9B00929291009092
      9200969C9B009EA7A500C8C5BF00EEEAE800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAFBFA00D2D3CF00B1B2AE009DA09B00909391008E93940095999C00B3AD
      A800CDC8C400F4F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFBFA00D1D2
      CF00B1B1AF009D9F9C00929392009193940095989900B1ADAA00CAC6C300F3F0
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00D8D8D600B3B3B100A0A0
      9F00959596009493960098979B00AFAFAF00CECDCC00F5F3F300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C7C6C700868B8B006B6A6D006D6D6D006E6E6E006F6F6F00707070007070
      70006F6F6F006F6F6F005E5E5E006463660087868900C1C0C100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDD1CF00777A
      7C0076767600726F6B00716B6400746E670075726D006F727000666E6D005669
      6E0065656B006C5E63008E828500CDCBCB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCED00079808300707273006B67
      6600726A6A00777372006A7272005C71730055727700686D76005B5959006A61
      5C008F888900C8C8CB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D5D7D6007F7D7D0078757600716E6D006C6C6C006F6F
      6F007373730074747400747474006868680060606000686565008C888800CECD
      CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C4C300857B
      7B00786A72009494A000B6C5DF00CDD7E800E9EAEE00FCF2EB00FFF5E900FFF5
      EB00F4EEE900E9E4E500B6D3D80081979200697569005E616000807B7F00D2CD
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBC9C90083808000717875009596
      A400BCB9C200EBE0E200FFF5EE00FFF8EA00F6F7E300EBF8E000E3F9E000DAE0
      DF00B6C4C3008DA0A500696E77005B515B00887D7F00D7D3D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CCC6C7007C777B00647479008D9EA700B8C0C700E9E4
      E500FFF4EC00FFF5E800FFF3E300FDF1DF00F3EDDA00E5E0E900C6C7D500969E
      AB006D6F7000655E4F008D847800D5D2CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D3D1D200878686006B6D6C00A1A1A100BEBEBE00E3E3E300F6F6F600F5F5
      F500ECECEC00E9E9E900ECECEC00E5E5E500C9C9C900999999006A6A6A00595A
      5B0082808100DCD9D900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00919090007378770099AC
      A900E3E7E800FEE1EA00FFC2AA00EF9F8000D9704700C94F1B00C0460A00C45A
      1B00D6834500EAA76A00E4BDAF00FFF5E300E9E6D700A1A8A50062686F00615A
      5F00B2A49B00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0094929A0072797D00A5ABAA00E5D8D600FCF0
      EE00E2C6BF00CD958400C46D5200BA4B2300BA3C0C00DF592300FF824A00FAA6
      7200FECFA300F0F0D200D1E8DA0098ABA800606564006F6A6200AAA59800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0090909700717A7B00ACB7B400E0E1DD00F7E9E300E7CBC000D19E
      8A00BE715100B6502600BF491800DF5F2A00FD7A4100F6AA7500FDC9AB00F6E2
      DD00E7E5EB00B4B4B40066645A0067645B00ABA99E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009893
      9A006F717900A7B0B900D3DEE600FFECE900F1C3B800D8957C00CD734A00C559
      2300C44C1000DC611F00FB803E00F0A37500F9C7B100F3E5E700DBE1EE00A6AC
      B10068665E006C665C00ABA79C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ECF0F100908990009B909700DBD8DA00FAF4
      EF00DB9D9700BF3B3B00D0320000D53A0000E64D0000F5610300FD6D0400FD6E
      0100FF740600FF7A0F00F7841600D67E2000EBBC7800FFFCD800E7E9E3008285
      8D0051515700938E8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F9FA008D899400998E9600DDD5D600FFF4ED00E8A29B00E03D
      2700D22F0F00D6300100ED490800FE600C00FD690500F9700200FD790700FB7B
      0000F57E1100DF822D00E9B47B00FFF9D500DCE3D4008B8C8A0062585E009190
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F9
      FA00948995008B8D9300B6DED300FAEEE200FFA49F00CC3D1D00C4310900C933
      0000DF490200F15C0400F6660100FA710300FF7D0D00FC770500F37A0D00E285
      2E00EAB58300FBEBDF00DBDCE600948F98005D4F510091919000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FBFB008C858E009690
      9700E6E2E100FDDEDD00E6A2A300CB392300CA321300D4360600E6470500F758
      0800FB650700FF700D00FF7C1600F4740D00EC750800E7841C00F9BC6C00FFF4
      C900D2DDD300788E930042585E00908D8D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFC007E83880098A5A300EBEBEB00FACEC700B53F
      3300BE190000D4260200E73C0400E5490700DF580400D6600000D9690000EB78
      0000FD810500FF820800FF9C0000FFA50000ED9A1900C1852C00EDC89400FFFC
      E90091A7B2002B58730090908F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFC007D888A009E9FA300FFE6E600FFCBC300A9413000A1180200CD2F
      0000D9400100E0500100DB590000DA640000DF750000E17F0000DC800000FF93
      0100FF920200FF9D1400FF8E1500DA903200F7D69E00F4EDDA00A6A6AC005759
      5C0093919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC008387
      8B009DA1A400DDE9E300F7E2D300A7453500BD170A00E3340000EA410000EE4C
      0000EC590000ED690000EE770000E97D0000DE790000FF900E00FF910000FF99
      0000F28F0000D8973500F4D7AB00ECE7E600A7A8BC005655540093919000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC00808287009EA4A600E2E4
      DE00FFD3C700B2473900A7160600CD340100D63E0300E14D0100E65A0000E667
      0000E4750000E1820000DC880000FF970000FFA10000FFAC0000F8940000D492
      2B00F7DAAD00F4EDEA00A2A4B600575765008B8E9300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A3839100B1ABAE00EBF9ED00CEB9A4009C220A00F024
      0500E01D0000CF430000D4420100E24E0800EE5C0A00F4640500F66F0300F97E
      0600F9880900F48A0700FFA80000FFA40000FFA61100FFAD2600E6952200FCC7
      7700FFF9DC00949DA6005D5D5D00A4A5A100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0091898800ADAAA800E9F0E900D3B3A6009B2B1900BB120000E9310D00D538
      0000DE450000E4540300E85C0100E7610000EF680000FE760C00FF821800EF85
      0F00F5960A00FAA50000FFAC0000FBA50D00E1993300E1B98900FFF3E700A6A6
      A60059595900A2A6A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00938A8B00AAA8
      A500DDF7E500E0C3AE00AC211100C60A0000CA240500CD3B0100D2420100DA4E
      0100E1590000E6620000EF6C0000F9770600FF800D00F2920000F0970000FAA7
      0B00FFB20D00EFA20600DA9E2300E7C48000FFF4D700ADA8A5005E5B5800A3A4
      A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00958C9000ACA8AA00E7F7EC00D9B8
      A800A2251100CE1D0200E0330D00C7360000D4420600E2500800E6580300E761
      0000EB6F0000EC7C0000EE830300E68C0000EF990100F7A40900FFAA0F00FBA2
      1200DE932700E4B27D00FFF4E500A7A4BD0048505A009FA6A400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ACADAE00998A9400F2EBE200E7BEA700A22F0E00D22A0100D528
      0000CD270000D72F0000DC380000DD3D0000E4480000EE580000F1620000F168
      0000F6720000FF7C0300F38A0000F6950F00EA920A00FFAA1600FFB11C00E694
      1D00F0AF7800FFF0ED0096949400615F5F00CCCACA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00AAA9
      B00089949300EBECE200FAAFA100C6261400EA240700E3260000D52E0000E635
      0800D6410100F4490000FF520400E8580600DB650600F67A0800F67F0000FF8D
      0100F49C0800EFA50500FFAE0500FFB81000F2A51200EF9E2F00FFB46400FFE6
      FA00869488004F645600D7D5D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABB1008E908E00FCF1
      E300E3BEA40093230500DD1F0200FB351100CB270000F73A1300EA350700E841
      0200F0590900EF670700E76A0100E9760400F8871300FF990100FA9A0A00E296
      0800ECA81300FFBD2300F0A61200E49C2000FFC25900F5EEEB00938E8B006262
      5D00D4D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFACB4008C929400DDE2D900E4BCAA00A02C
      1500D2220300E92B0200D5240000DC3B0700DE3D0600E5440600EF520800F961
      0900FE6D0700FD730200FC770000FE8B0C00FE971900EF941300F29E1000FFB4
      1D00F4AB1B00DBA32C00E4BA5900FBEAEE00908E8E0057615F00DBD9D900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00F4F4F40080828400C6E7E000F1D2C300B6381B00E52B0200E73C0900A42C
      0000B2412700BD312A00B6432200B0462100A9502400AC5D2C00AD632900B666
      2500C76D2600D8772D00CD802A00B6722500C4883400C9881500F2A51300FFAE
      2300DA8F3300FFBE9300DFDDDD006F6D6D0084828900FDFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FAFAFA007F7D
      8700D6D7D300F6DBC700A13D2400D32D1000E92C0B00DE371200A91A0000DE2D
      0200CE420000DF4A0000F7580100E1650700DC6B0300FF760200FF7B0000FC8A
      0700F58A0000FF9C0A00FFA00C00FBA30F00EDB12100E6A51B00EE921100F7BC
      A900D6E2CC00697471008A7F8600FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FAFAFA0084798100D2DAD300F5D8
      C300B5361D00E42D0D00E0370B00C6280000DE290000D9310800DE3D0900E04B
      0800E1590100E3650000E9710000EE790000F07D0000F7800D00FF8D0300FFA0
      0000FFA30000F99F0400FAA92200FBA72900EA8D1200C2BBB800EBE4E1006D68
      6500847E7E00FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FCFCFC0088758100D4E7DE00EBDFC700AF371A00E82B
      0A00E2310400D6330200E42F0000E13F0400DE3F0100DE480200E3560600E362
      0500E06A0000E1770000E6800000FF8D0C00F9850000FF9A0000FFA61000ECA0
      1200F3AB2100FFB21F00F79A0000E5BA9300FCE7D1006669670081818700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00A1A3A400A4A6A600F2E0DF00CF716400D42D0C00F6390600D1270000C143
      2700FDC5C400EFF7FF00E0ECF000EEF2F700F9F1F800FDECF000FAEBE900F7F2
      E900F0F9E500E8FBE200F1F8EB00F2F6F100FFF5E300D7AF6700CE880000FEAB
      0200EEA20A00C5840A00EFEDED00A19F9F005B595B00BDBFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF009E9E9E009DA5
      AC00FFFAF200AE654700C53E1000DE300100E43711009B110000942F20009F26
      0C009E411400AF3D0000D6470000DE660D00E16F0B00FB720400FF790100F988
      0000FF950200FF9E1000FF891200D2841F00B98F2400BD840000FFA90C00DB7E
      2F00F5EEC700A7A2AB0067546100BBCAC500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF009999990093A8B000FFF3E800C35E
      3700B34A0100CE430000F02B0000C41C0A00AD1B1D00C41C0000D3300300E24B
      0800E9580200EC620000F06B0300EE710900F17A1300FB830600FF8F0000D698
      0000C7940800BB8B0300BA901900D7811100FFA81300DA7D1600FFF0CA00C2B2
      C30043515300BDCAC100FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00A2A2A100B1AAAD00FFECE000B5634400D5380C00F73C
      0900DF3A0300C7290000DB2E0800DF300000E2380000E9460800E9530D00E85C
      0900E6650200EC750200F5830700E9840000FF9C0800FFA50800FC9E0500F29B
      0F00F89E1700FF9F1000FFA10700C67F2700FFE5B600B5A9A900585A6800C6CB
      CA00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FCFC
      FC007D7E7F00E0E0D400F3BFA100CA3A1000F1480500E73D0000E2310400DB3C
      3200EFF6EF00E1FCFF00F2F8F700F4F9F800F7F9F900FBFBFB00FFFDFD00FFFD
      FE00FFFDFE00FFFCFD00EBFFFE00EFF8FB00FFFFF400E1B37D00E77D1200FF9C
      0700ED9C0000FF9B0200FF9C7300DDEDDB00666F79007F828300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FEFEFE0081818100D1DA
      DD00EEC0AF00A5320700E5450500EE3B0000D4340C00E67D7000FFD1D600FCDF
      E200F0D7C700D17A5800D13D0900DE4F0400E2610400EB6E0500E97D0D00FF87
      0000F2890000DC820000CB7E2800EAB78F00FFE5BA00D89B3E00F78E0300F486
      0000E3AD7600EED5E3006E6776007E8B8300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FEFEFE0085858500D6DADF00F3BEB100CA3F
      1800D2450200D53D0000DE300200EE846D00FFD5CF00AE68510093220700CB2E
      0600F54D1000EA560200E3660000E76B0000FF7B0600F9800000FD830700E8B7
      7300FADDD900F6DBDE00F4DDC700DE954B00F3960000E6861400E1A97A00E5D6
      DA0064747300888D8300FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FEFEFE007D7E7E00C8E2DC00FFBFB400D5351700DF470E00C93B
      0000E63D0300DE2E0500C1280900D23B0900CD380600C9360400CB3C0300D549
      0600E45D0900F46D0B00FD760C00FF850300EF810400EA8C1100EB920C00E587
      0000E98B0000F0980C00E8961900E38D1100E9AE7000FCE6E8005E5F7300858D
      8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00B7B7
      BA0095959500EFEBE000C27F5E00BE380800E44E0700E8410000E52D0000D334
      2600D9E3D700D6EFF100E1E9E800E5EBEA00E7EDEC00EBF0EF00F0F2F200F4F4
      F400F9F7F700FCF7F800E9FBFA00F0F7FA00FFFFF500DDB17C00E5780F00FF97
      0600EF980000FF940200DE652D00E9EBCE0091949C0060606200F6F5F200FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00B8B8B80095959500EFEF
      E900C07D6400D04A1400EF490000F3460000B31B0000F8A59D00FEF0FC00EFFC
      FF00F1FAF700C9866D00CB360400EE510100F8660200F0690000DB6F0000F471
      1000B7680000C0A03F00F3E6B800FFFDFF00FFFBF900C98B4B00E57B0000FF9C
      0000D76A2600FFE0E6008E99A100615E5B00F8F6F300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00B7B7B70094949400F2EDE400C8846D00DB37
      0D00F24A0A00E63C0000D02C0200E8AE9800F6FFF900F3FFFB00DAADA900AA36
      2B00B71F0000DC490B00E35E0200F1700000FA760000F37A0000F0730500E4C3
      9200F4FAFF00F4F6FF00FBFFFF00D0986100E6870200F38D0C00D56B2C00F9E3
      D70091A29F00695D5D00F8F6F300FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00BABBBA0097979700EFE7F100BA716300CB441600DD470100E44F
      0500DE3A0000DE2C0000E7310700F02C0000B7150000BE484700DABBB200E5AA
      8A00DF3D0200FF680300EB720000FF7E0300F1730000D76C1700DA9A7100EDD9
      B000C6914000F5870500FF9C0000F38C1100F16C0A00F4ECC7009B96AB005360
      5F00F9F7F400FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008F90
      9400B7B5B400F1E9DC00DF855C00D8612900D1580900DD3C0000EF2D0000E245
      3100D3E0D000D3E7E800D5E0DE00DAE2E100DEE6E500E2E8E700E4EAE900E8ED
      EC00EEF0F000F2F4F400E6F2F200EDF4F700FCFFF600D7AC7B00DC6D0B00FE8C
      0300EC8D0000FC870000E6631400E3C79E00CEC8C90069656A00C0C1BF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0091919100B9B9B900FEED
      DA00CD7F5B00D8571800EA560400DF3E0000C22C0300E99E9500F1FEFF00F5F5
      FB00FFFFF800D1907100C93A0000EF560000F9620000EE5C0000DC600200BE52
      4000E7B38E00FEFFDB00EBFFF800DAEFFE00FAF7F200C48D4800E87C0000FE90
      0000EC5E0B00FFC1AD00B9C7C5006C616300CBC8C000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0092929200B8B8B800E5E9CC00BA815A00F65F
      2C00EB4C0800DE360000D12B0800EDB2A200E4F8F300E8FFFF00FAFDFF00FFE7
      E900C97A6D00A3310C00D04E0900E6640100EE700000F1730700FA6E0300E8BE
      7900FEFFF000F2F3E900FCFFEF00C2915F00E0770A00FC8C0400F95F1200E8C5
      A300B9C7C100735B6500C7C6C100FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0093939300B6B6B600DEE1D200DC917100F4642A00E2410000DA43
      0000E5471100DF320C00C4100000BD120000CC8A7800ECEFE600E6FFF700E4BE
      9C00C73C0300EB5D0600FC6B0500D2530E00C1782E00DBBC8900FBFDF100F8FF
      F700C4915900EE780F00FE850000F58E1000F76B0600E8C9A200BFB3C5005C6A
      6800D3CDC800FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007C7D
      8100D9D5D000DCCFBF00FF966300F2884800CB6B1800DE4A0000EE2D0000E248
      2F00C1D4BF00CAD6D600CDD8D600D2DDDB00D6E1DF00DAE2E100DAE2E100DCE4
      E300E0E8E700E3EBEA00E2E8E700E6EDF000F6FFF400CFA67900D35F0600FA7F
      0100EA810000F4770000FA6E0A00CC8B5800EBDCD9006E6C7200A6A5A700FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007E7F7F00DADADA00E9C5
      A700ED9B7100FF8F4D00D9631200D8450100C1280100E99E9000DDFCF500ECEB
      ED00FFFFF800D08D7400BF2E0000D53C0000D0460000CA531B00C56F4500E9C2
      D100FFF2F300E8EFE800D2E3E600D8F5FA00F9FFF300B47F3C00E4670000F885
      0000FF701100E48F6100E0DBD20065696E00A7A9A600FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0080808000DADADA00E3D3AE00D1976600FF8C
      5000DE5D1400CC3D0000C3280700E9AC9E00F6FEFD00ECEFF400E9F1F800F0F7
      FA00FFFFFB00D9B4A000984C2200B6480800D34F0200EA680500FF6A0E00E4B1
      7F00F4F9FC00F4EDFA00FBFFFE00C4926800E5680000FE850000FF660C00CF96
      6300DBDED5007F697B00A4A7A800FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0083848400D5D5D500ECD0AE00DF9B6600F68A3C00F36C1800E13F
      0000CD200000BC2B1600B34A3C00D7CAC200F8F6F600FBF7FC00D7FCEC00CFC3
      9F00B63E1000C4440900C14D0C00B6896E00E8E8C400F3FFF300E9F9FF00FFFB
      FF00D2876100D8600100E3820200EC7E0000FD690000D6956900EAD4E0005E6F
      6B00AFADA800FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007476
      7800F3E9E200C8B4A200F9955500FC975200DC873700EE691F00E0300000CB3D
      1E00B2C5B000CDD2D500C1C9C800C6CECD00CDD5D400D0D8D700D0D8D700CFDA
      D800D2DDDB00D5E0DE00E0E0E000DFE6E900EFFCF400C8A17A00CF560600F872
      0200EA760000F26B0100FF6C0000D06E3800FEEBE4005D63680098989900FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0078787800EBEBEB00E9B8
      9200EC986800F3935100ED893B00EB632300C5270300E6978400D3F7E700C9E7
      EC00E7FCFA00C4807900BE1E0C00D0300E00CC513100D68D8500E6D3DC00BCD9
      DD00CCD9D700D6CFCC00E4DFE000D2E7E500E2F4DD00B3784600EC5B1700EA72
      0100EF6A0200D06E2E00FFEBDF005E717800929E9A00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0077777700E5E5E500EDBA9200E3976600FF94
      5400EA823500DA662500B6310C00C8978700E5F6F200E0E7E200E9E7E700ECED
      F100E2F1F300ECFFFB00F3F2DD00C2846600AD391A00D3510000FA580900CEAD
      7F00C7F2EF00CFE6EE00DCF7EE00BA8F6400EF5E0000FB760400FF600100C970
      3300F5EADC00756B7C0093999B00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF007A7A7A00E6E6E600E8BC9300E09A5E00F89A4700FA8A3800D956
      1D00B93A2500BE737100DFCED100CCE6ED00CBDDE800DCDEE600E8FFF300E0B2
      9A00AB170100B6573D00C1B49400DBDED500D0EBD700D2E5DC00DEDFED00FDE7
      E900D8835300EB6B0200ED820000E7700000FF6C0100CB663900FFEBF1005D6F
      6800959B9600FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007374
      7400FBEFE500C6AE9800F7A55D00FC955000E78E4400F5833C00E4531B00D355
      3300B1C2AD00BBBCC600BABCBC00BFC1C100C3C8C700C7CDCC00C9CFCE00CAD2
      D100CED6D500CFDAD800DFDAD900D9DEE100E4F6EF00C4A07C00CE500900F969
      0400EB6C0300F2630800FF6A0100CB4D1D00FFF2EB005E70710091929100FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0071727200EFEFEF00D3B3
      8200E9A16500EE894B00F98D5300F3783E00D75E2600DC9F7D00CBDCD800BDD3
      D100EAF5EB00CF7F74009F070000CB6A5600C6BBA000BDC4B700BCBAB900B2C2
      BB00BCC9BB00C5C9BE00C1C6C900C4D9E100DFE9DD00B16F3E00EA5A0900FF67
      0200F6530700DD4C2600FFF7E100696767008E959600FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0074747400E7E7E700E5B18800E59C6800FA88
      4900F4944800F1834100D8552E00D0A38E00D7EDE100BFD8CE00DDE2E000E7E0
      E500E0E3E800CBE3E300E4FAF500FFFFF800E5BEB500C4531A00E0440300CCB1
      7E00BBECD600C5DCCD00CEEED600AA895C00E5550000F0650500F65E0000C853
      1000FFECDB00656A790094919500FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0076767600E7E7E700C2B28800F4A16D00FF8D4900F4823B00D898
      6200D8C0AA00C6C7CB00A7BCCB00CEB7C500A9BBC200BCC7CB00D9DDD200D8A4
      9300C0635400D3B7AC00B8C7C300BFB7BE00ADB8AE00B9C0BB00C4D3DC00D8E5
      DD00BB824A00EA5E0000FF680000F06D0000FF680100BE431700FFF1F5006371
      6D008C918E00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007475
      7400F6E8DC00CDB19900EBB46300F4894500EA844300ED8C4A00ED7C4300E877
      5600B3C0B000A6A3B200BAB5B600BAB8B800BABABA00BCBEBE00BEC3C200C2C8
      C700C6CCCB00C7CFCE00D9CFCF00CCD1D400D7EBE600BB987700C9470600F65D
      0200E8600200EE570700EE560000BB2C0600F6E6E0005A7774008D8E8F00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0072737300E7E7E700D3B2
      8500F3AA7000F8975500F58D4C00FF904F00E46E3300EDB49500C8D9DC00CFBD
      CA00C8E1DD00A3736D00B11B1B00FE948D00D0D0C400A6B8B900B6A4B500CDA8
      B000AEABA600A2BAB000A0B6BB00A9B7C300E2D4CE00B66F4300CC4C0000F35D
      0000F65C1500B9340F00F5E6D30079797900868C8E00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0075757500EBEBEB00C4AD7F00DCAD7500EF8B
      4A00F1934700F47E3D00FE6C4800F0B6A000D3DDD000ADCFC500BCD1CE00CDD0
      D400E3D6DE00EDDEE600E3E4E800D8F3F000D0FFF700D0794D00D4370C00D49A
      8700C3C3D300D6BACE00DCDDE100A2816000D4500000E6560500EE690800C53C
      0000FFEAD80062707C00938B9100FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0076767600E5E5E500C3AA8800F7A77800FF8E4B00E3813900DAA3
      6A00EFDABE00CCD6D00094B7BB00A1AFAB00A5ADAD00CBB4B900CFC6BD00BB97
      8500B86D5D00D8C7BA00AAC5BC00A4A2B500B3B8B900B4AEB300A6A7BB00C4D0
      D400AE7D5500D0500300F3610000F05E0500E6510000B3300900F4E9EB006B70
      6F0091909100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007A7B
      7A00F1E1D500D3B49B00E3C06A00FE8E4C00F8884C00E0884800DD804800E87F
      5E00C5CFC200CAC4D700B5AFB000B4AEAF00B1ACAD00B1AFAF00B2B2B200B6B8
      B800B9BEBD00BBC1C000D3C5C600C0C5C800CAE0DB00B2907200C23F0000EF52
      0000E1550000E74E0300E0480000DE462700FBECE9004A6D6900989A9B00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0077777700E5E5E500D9B5
      9100FBB47B00F3954C00EA883C00FB8B3F00E8773900EAB29900B8CBDA00C5C1
      C700BADCD200B37F7300AC000000CA2E2900D29B9200DAD7D300BFBEC700BDB7
      C200AFAFAF00B9B7B600B3B4BE009FA9BA00C0BBBA00AA5F3900DC450200DE51
      0000D2440700C3523200F8E9D9007274750090959700FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007B7B7B00E4E4E400D0B49100FFB37800EB99
      4700E28D3D00FF8B4B00D9794300D4BA9C00D1CBD000D5C1BC00CBC5C600C0C2
      CA00B9BBC600C5D0D400E9EFE400F3CCB600D97D6400CA380000DC3C0C00CE8D
      6700B2C0B500BAB1C600DCCBD400A0734D00D23F0000EB4D0000F4410A00A640
      1D00FFF4E200716B6C009A999C00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0077777700E8E8E800E4B29600F2B17E00EA9F5000E08D3700D877
      3500E7866000EBB6A100F3F5E200D2E0D500B5C0BE00AEAFB300B9CEC500C78B
      7B00B50B0000C9614A00C7BE9D00E3D9E600BCC2BD00B9B4B300BAB0C100CCBB
      C800AF644E00C7430D00CB4B0200EC4D0B00D94F0000CB4A2900E4E7EB00746E
      7300A29A9C00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007977
      7700E9E7E700C6C4C400F1A47D00FEA25B00E0843D00E2813D00ED843A00C889
      5D00D1D5D000B7D9D300D1CBD000CAC4C900BFB9BE00B5AFB400AFA9AE00AEA8
      AD00B0AAAF00B3ADB200A2B2AB00A8CAC000C5DACB00B2866900B12F0400F23D
      0B00ED430D00E2562100DF683100C6866800FAEBE9007C767B00AEACAC00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF007C7C7C00E7E7E700E3C2
      A800F5B38000ED974B00EF943F00EB812C00F0854100E7B19A00BFD2E700BAC5
      C200CDDACA00D9998100DA3F2600D42D1200A51D0300B35B4300E0C0A900BBD9
      DE00C1CFCD00C3B9B900B8A8B300AEB0C200C7C2C300A4563900D7380000E05E
      1D00D2562600E18A7000FFF0E4006A6F7000ADB0B100FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007B7B7B00DDDDDD00DCC5AB00FFBA8400EC9B
      4600F1974200F9803800D6753B00D7BB9D00D5D4DE00BBBEC200CDC6CD00B5BF
      C600AACCCB00D0D5CC00DB958800B44029009A230300EB340800DC2C0700C489
      6900A0C3B9009AA8BB00C6B8C300AA664900EC360200E2601B00EF5F2F00CF83
      6600F1F2E2006D717200AAAAAD00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0077777700EEEEEE00E9C6A400F7BB8000F4A14B00FD9C3B00FD84
      3400F8723C00E1714D00DA917100EBD2CE00E4F2F100C9D9DF00C1D8D000E1AC
      9800C31E0500CC170000EA2B0A00C3808500E3D4C100E1F0DB00BCCECF00D7CE
      D100C1624E00D32F0000EA4B0D00F64E1900EA671D00FA7E6000E8F4F8007A6F
      7700B8AEB000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008583
      8300D5D3D300D3D1D100EAB68100F6A65100F79E4300FE953A00FE842600E18A
      5200F4DBD100DADBD700D1D5CF00D1D5CF00CFD3CD00CCD0CA00C8CCC700C2C6
      C100BCC0BB00B9BDB800BFB7C100A1ADB300BFCAC800BE978800B2472600F161
      3700EF754700D0784A00FE906600E3AA9500F0E3E500716C7600C8CBCC00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0081818100D9D9D900F4DC
      CA00E3AB7C00F9AA6100F09C4300ED893000EA813800EBB59700CFDFF000D7C3
      CF00DAE2D800C2A48900C1623B00EC6F4200EE562D00DB3C1A00C84A2800D1A5
      AC00EBDBD400EBF2E300D2DAD900C2C8D500E2D4D800BE7B6200E66C3800F37D
      4E00FA926F00E7AC9800F0DDD800686D7300CED3D300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0080808000D3D3D300E3D5C900E8AD7C00FBAA
      5500F99A3D00FF883500E2814100DFBFA200D0D5E400C4CDD700B3CFD000BFD9
      D300DCCCBF00DC928000CD533B00D6402100E8492500E4482500D13B1D00D7A1
      8A00C4DBD700B3BACE00DBCEDC00C68E7B00FD684000E8824E00F58F6C00F0C1
      AB00CDD8CE006A747700CDD2D300FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0080808000D1D1D100ECD4B600E2B68100E9A45400F29C4200E98D
      3C00E9884400ED834600DD6C2E00F3734200FFBC9600EAF2DB00E3FFFF00D1BC
      BF00BC535000DD4E3300CF491900C73F1500D1664A00F1C8B900E6FBF200E0F8
      EE00AC887600B2533200F37B4D00F97C5600E58B7300DCB0A900E7DFE0006269
      6700D9D7D600FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF009897
      9800B3B1B100EDEBEB00CDA67A00FFC37300EE943600FF993700FE821C00EA94
      5800F7DFD900E2E2E800D6D9D700D6D9D700D5D7D700D4D6D600D0D2D300CCCE
      CF00C8CACB00C6C8C900D9BDD400C8BFD300DED4E100DEABA900D96B5900FF77
      5A00F17D5E00DE8C6D00E98C7300FFD6CE00C7BFC90068687100F4F9F800FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008E8E8F00B8B8B800F9EF
      E500D6A98300FFB97500E7974400FA963D00E3772900FBC29B00E5F1F500E6D2
      E900C6E5E400B4AB9700C9684C00EA6D4700F6784F00FF735300FF695000D651
      5300E88B7C00FDD1BA00FCF9EB00D7F3F300DBF0ED00BC8E7600EE764C00F48A
      6B00E18B7500F3D2C300D2BEBD005F676D00F7FBFA00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0092929300BABABA00EEE7EA00D6AA8500FFC1
      7200FB9B3E00FF933900E9873F00F4C9A800E5E8F000D4E2DC00DBECDE00D1BA
      A400D06E5600EA593F00F7684800F8704C00FF704B00E56E4E00D1634700E5BE
      A800DDF4EC00D0DCE800EDEAF300C09E8E00D46D4D00E2806200D6877200FBDB
      D000BABFBE005E696D00F7FBFA00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0091919200C2C2C200FFF5E200D0AA8000FFC07900E8943B00F497
      4200F3914500EA823D00F6874300E86F4300CA684000CC967500FEE3C900EDB8
      A400D2665400F06A5200E9694600E06D4200EC674C00D5615600ECA8A100FFEC
      E300D8948100E26D5000FF805C00F5835F00DB887300F9D3CE00CAC4C500666D
      6C00FDFDFD00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00B5B5
      B70095939400F7F5F500D5B1A100FFC18800FFA75B00F38E3800E7802000D296
      6000E6E8E900DAF2FE00DFE9F000DCE6ED00D8E1EA00D3DCE500D1DAE400D0D8
      E500D1D8E700D1D8E700D0CCD200D4DCE300DCDDE100CD9F9800C55C4900ED64
      4A00EA705800EB8C7800C47C7400FFF0F1008F8F9B007C808800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C00092929200E6EA
      E400E5C2A100F3B47800F6AB5D00FF9D4500F3883300FFC69400EFF9ED00F4EF
      F100F6FFF700DEAF9400DB593B00F46E4600E7734A00D3603F00D66B5000EB61
      4F00DF5A3E00DE6D4D00FBB3A100FAF1EE00F8FFFE00BF8C7800E5603E00EA88
      7600CB827400FAEEE400AA9598007D878A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00C0C0C00091919100EAE5F400DFC4A900F5B6
      7200FFAD5900F5933B00E1823300FFCC9E00FFFFF200E9E3BE00D6967300D060
      3C00E46B4100F5784C00F0674100E2614000DB745400EC644800D4654B00E2BA
      A100EBFEED00EFFFFC00FFF7F300CF988900D2624C00F4887C00C1807700FFE5
      E100AA9EA40080848B00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00C0C0C00097979700F6ECEC00CCAE9500F5BD8200FFBB6800E388
      2D00F4933C00F28B3C00F3893C00EA7A4600EB703E00DD673600D97A4900D576
      4A00D6623F00E86A4D00E66F5500D7744800EC624500FF685500DF5C4E00D569
      5800DC695500EF705700ED6B4D00F4927400CA847300FFE8E500979293007D83
      8200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0086848600D3D1D100F7E4DF00D8A17600FFCB8D00F9A15500F0913400D499
      5B00FCEFDF00FEFBF300F2F1E300F1EFE400F0EEE400EDEAE200EBE7E200E8E3
      E000E6E1E000E5DFE000EAE7D200E2E8D500E7E5D300D3AA9300BC624300EB79
      5500F38F7200D68A7300E1B0B200EBDBE20074737D00BDC5C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0081818100CFDD
      D900FFE3C500E0A46E00FFC88000F28F3900FD8E3800DD9E6400C6CEB700DBC0
      A600EEC19F00EE8F6300DF6B3400D7733800EB784500EE734F00C8745100D763
      4000E9794B00D55F3500D2564400E47C8300F8ABB200C3726300F0856000E88C
      8100F7B6AE00E7E5DD007A6C6F00CACED100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00D0CBE000F1E5D300D0A1
      6E00FFC88800F0A05300E5873400F7A66300E6C59800E48C5000DF6E3500F878
      3D00F5814600CF6E3400D4774600EB805B00DC634900F06A4800E0694900E993
      7500F6BDA400EEBAA900ECB0A000D4827000E27C6500F0888300E8BCB500F0DF
      DC007E697000CACCD000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF007D7D7D00D6D3E300F9E6DF00D3A77E00FFC57C00F7A0
      4800ED8E3100F5933B00F5933F00E77B3300FF8F4900FF814000DD682B00E56E
      3700FB764A00EF714800D9704700D7714700E26D4600F4795500DC603E00F069
      4D00FA695300E06A5100DC8C6F00DA8E7700EDB9AD00F7E3E20071717300CED0
      D200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF009B9A9D009F9D9D00ECF8EC00E3C69900DFA86F00FFBE7600FFA03F00D883
      3300E09B6900EC9C6700E5986700E5976800E4966800E2926900E08F6A00DD8B
      6800DA876700D8856600DE875F00D78D6B00CC866800CC755500D8694300F987
      6200EA917600CA8F7B00FFEEF200A3A2A600787A7E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00A4A4A40098A7
      B000FEF3F500E3BCAD00E0AC8300FFCD8A00E19F4600E98F2A00F8881E00E080
      2D00E3792C00F47B3500FF7D3E00F9743B00ED713B00E9764400E4784800CD6B
      4100DB714800EE795400E96E4A00E4694700CF5C3B00E37D5A00FFA88400B086
      7A00FFEFE000A9AE9F006E7A6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00A5A5A5009FA6B400ECEDE300E3C4
      A300F7BD9300F4B77700FFA44F00EC852F00BC843700FE783000F48C3F00E788
      3E00E97C3800E67C3F00CE794100D36E4100F86E4A00E1754500DF6F4100E265
      3F00E5624100CE563900D36B4E00DB836500E69F7E00D4867F00EDEADB00A8B3
      AB007C777400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00A0A0A000A6A7BB00F8EFF200E0C2A900E3B07800FFC5
      7700EF9B4200EF953D00E48A3600FC973500E67D2600E3833700E5874600F079
      4200FF723F00F3723B00D6783700D86F4400E7764B00D76B3C00DC764600EF7A
      5300E4644700EA826B00DB9B8300BD8A7A00FFE8E200ADA4A70073797900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00EEEEEE008D8C8C00B4CDC900FFFBDE00CFAB8700F7C29000FFC16C00FEA7
      4F00E2863900F37C1F00F67C3000F57A3000F2762F00F0732F00EE6F3200ED6C
      3300ED6C3500ED6B3600F3663300EC6F4300D15F3B00E06D4C00FF896600FE94
      7500E39B8900F2C8C100DFD4D600787E7C00BCC1C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00F4F3F4007779
      8100CCC6C700FFFFF200BF9E7D00EDB57E00FFCD8300EC973B00F59B3600FA92
      3F00EB8B3800E1883800DB893C00DA853F00E3854400E77F4400E4733B00EA81
      4E00DE704000E9764B00DF6A4300DD6D4900F3907000FFAB8B00D58A6A00F2D1
      C800E4D8CC006F786F00C7CFCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00F4F3F4007C768800D0D8D100FFFD
      E700C4957600F4C38B00FFC97100FF9C3800E2993700FB954200EA863400DD84
      3400DD883E00EF834300FF7B4500FB784600E0784300E8743D00EC7F4900EA74
      4300EA704200DC704100F58F6500FEA17A00E0947000FFCFC100CEEDD8005877
      6A00C8CECC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00F5F4F50076788100D4D2D800FCF2E800D0B28F00EEB8
      7C00FFCA8000E7954800E5924700F99E3B00E58E3200D68C3A00D4894400EA80
      4300FF7A4000F7793800E3883D00E67C4D00F4754800F9794900DE774600CA72
      4400E3846300FB9E8900DF8E7F00F2D5CC00E6D6D70070727500CED2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AEAEAE008C96A200F1E1DB00FFF5EE00B4917D00FEC68500FFCA
      7900F4AB5700FF9D3100E88F3700E88E3900E78D3900E78B3E00E5873E00E485
      4000E4834300E3824300E57B3C00D2743F00CD7E5300F9AA8300FAAA8500D99A
      7E00D0B3A500F2F3F1008D8D8D008C969100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      B80090939300D7DED700FFFDEB00CA9C7A00F8B07A00FFD88E00EFB05600E689
      3200F3903C00FF964500FF8E4300F6823B00EF7E3B00EB7D3B00E0783700E779
      3900E87A3E00DB6D3900E37A4F00FFA68300E59B7F00CF967D00EAB9A300FFF0
      EA008D8C8600939E9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B5B40093989500D8D9
      D000FFF5E900C0A28700E5B18300FFDB9B00FFAA5E00ED8A2E00F7933500FD95
      3800F88D3200F1873000EF863700EB843B00E67F3A00D6803E00DF793E00DD6B
      3600F0845400FFB08400E7A77E00D19A7500F1BB9800F1F1F1008B8B8800989E
      9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B6B8B9008D909200E8ECED00FFFAEC00B995
      6D00FFC98E00FFD19100F5A66700CF813400EF934400EE903D00D9863100EA8E
      3D00FD8C4300EB7C3800D77B3A00EB7E4A00E66B3900E8714000DD804F00F7A8
      7F00FFB19200DC958100E9B5A400F5E9E500919091008D969A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008F959200A5A8A600ECEDE900FFFAF100BFA48F00C796
      6E00FFD59C00FFCB8700FCA54F00F79C4700F0903C00EB873500E9833800EA82
      3F00EA824700EA834C00E5904C00FFA86B00FFC39300FFA38200D3877400F3C6
      BB00F4E9E500A1ABA50084858500FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9D9E00A4A9A900E9E6E200FFFAEA00D3A58300DEA87100FFD08D00FFCF
      7E00FFB56600FF944A00F97F3900FC7F3B00FE8B4800F48F4B00E78A4500F189
      4400F8915200FFAD7700FFBB8E00E7A48300C3927C00DBBCAD00FFF7EC009A9B
      99007C828100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0096979600A7AA
      A800F9F0E700FFFEEC00CDA58200D69D6A00FFD69900FFD78900FFAD5D00E58A
      3900E5863600F18F4100EE8D4300E6874200E3854400F0874400ED935300FAAD
      7400FFB98B00F6A18100DD927C00E6BEAB00FFFCEA009696950084878600FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00999B9900A5A8AB00ECEBE700FFFF
      E800D39D6E00E09B6200FFD09800FFCD9600FFA06100FF8F3C00FF973400E590
      2A00E2873200E7854500DD7C4A00F1814C00F28C5700F8A57100FFC59400F7A6
      8100DB846A00ECBBA500FCFFE700A0A09E00767C7F00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0090929200A0A1A100E4DED900FFFDEE00EDC9
      AB00B7835500EDAD7600FFD68F00FFD08900FFC78000FFC17A00FFBB7800FDBA
      7D00FCB98200FBB98600FFC79200F7AF7F00C88A6100CD9E7F00FFE2CD00FAEA
      DE00A2A29F006C737100FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008E8C9000A3A3A600E2E1DD00FFF9E700E0C1A000B17F5500FBBB
      7A00FFC48200FFCD8A00FFCE8B00F9C48100F4B67600F9B07200FFB37600FFC1
      8300FFBC8400FAB08000CB8F6B00BB927900F9E0D000FAF1E800A8A5A1007B82
      8400FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00918F
      9100A5A3A400E5DAD200FFF8E400E0BF9E00AB845D00D7B27800F4CD8F00FFDA
      9A00FECD8900EFBB7500EBB67300EDB87900ECB67900FFBC7A00FFCA9100FFB7
      8800CF8A6900CA988400F8DCD500EDE0E200A6A3A30080838400FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091959700979A9E00E8E4
      E300FFFFF200D9C1A500A2825E00EFBD8100FCC98B00FFCD9000FEC58700FABB
      7E00FCB97A00FEB77800FAB37400FFBB7E00FFC68C00F8B08000C48F6A00BC99
      7F00FAE7D800F0E7E300A3A19F007F818100FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB0097989C0098999A00D7CECA00F9E6
      D700FFF4D900DDBA9800CD9F7600DBA97F00EDB98B00FDC59600FFC99A00FDC4
      9700F1BB9200EAB59000D89C7E00D7AB8C00E5D3B600F3F7DE00C7D7C6008590
      890091969500FCFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB0095959A008E969500C9D4CC00FDF2E400FFF6E600D2AF
      8700D0AD8200D3AB8100E1B68B00F3C49800F7C69800F6C49600FAC99900E8AD
      8500DDA88300D0A48500F3D4BB00FFF7E800DAD1C80092959400838F8F00FCFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB0098979C0093969500D8D2CD00F9F0E300FFF5E300DEB49700D4A78600D7A3
      7E00EEB48A00FFC69800FFCA9A00FFC49700FFC19400E6BE8E00D39C7500D899
      7D00FECEBC00FFF1E900C7CCCB0092969A00888D9600FCFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00969A9D009393
      9400D5CCC300FFF2DD00FFFFE300D4AE7E00CEA67600D4AA7B00EDBF8F00FDCC
      9C00FCC79500FAC08F00FDC29100EDAF8600DAA17A00CFA08100F3D1BA00FFE9
      DD00D6CDCA009896990090919800FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAFB30083848700B7B3
      B200D4CFC600F3EBDE00FFEDE200FFDCCE00E8C3AF00D3AA9300C8A18500CFA7
      8E00DCB99F00E7C5AD00FFE5DA00FCEADF00DDDFD3009FB0A5007C8D8800AAB1
      B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B3B50084868700A1A1A100D2CDCE00F5F1
      DF00FFEEDD00FFDBCC00F6BFB000E4AA9700D1A08A00C9A88E00D0BB9C00E2C8
      B700FAE3D300FCEBDE00E2D8CE00A9A3A00088848500AEAEB100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B0B3B6007A7D7E00A3A5A500C8CBC900FFECE400FDE3D700F7D7
      C400EEC9AF00DBB19400CCA08100D2A68700E2B89B00E5C3B300FDEBDA00FCF7
      E800E1D8CF00AFA4A20091838700ADADB100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1B4
      B70089888900ADA49B00DDD0C200FFF4DB00FFEED500F8DFC500E1C6AC00C9AB
      9000C19E8400CEA98D00E0B99D00E2CAB800FEE7D800FCEADF00E5D9D500AEA9
      A60085828800ADADB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F1009699
      9C008186880091969700BCC3C600CCD1D000E1E3DD00F2F2E600F5F6E600F0F1
      E100E5EBDA00DEE5D600B8B3B400989695007F7B7B009C979900F6F6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F2009C9DA40077858B009A9D
      9B00B5BCB900CFD6D100DEE6DC00ECF0E400F1F1E100F3EBDA00F8ECDA00E0D8
      D800C0BCBB009594940080808000999B9C00F9F9FA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F2009A9DA20078828600929E9C00ACBDB900CFDD
      D200E1EBDB00E8EEDB00EBF2DD00EBF1DE00E6EFDB00E0DADB00BFBDBD009090
      90007C7C7C009E9E9E00F9F9FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2F2F300A3A4A800828186009C9C9A00BBB5B000DCD3CF00F4EAE300FDF1
      EB00FFF0E900FEECE500FBEAE100D6D7D500BCBDBB00949795007D818000999C
      9E00F9F9FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F5F600B4B8BE008589940080838A007C7C7E007875730073726B007475
      6F0077797500787B79008C929500B7B9BB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00AFB3
      B70096999C0080838400797A7C00747576006F717100737474007B7C7D007D7C
      7C0091929100BBBBBC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00B0B2B80096959900817E
      7F00807B79007C767400726E6A0074706E007F7E7E006F7C7D0091919200BFBC
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00B8BABE0094969B007B7D810077777B007575
      78006F6E7100737172007D7C7D00787E7E008C919100BCBCBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00E2E1E100B9B7B700A6A1A4009A969A00989599009B9A9F00B6B7
      B600D5D6D500F6F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00DBDB
      D900B6B6B300A2A1A00094939500939297009B9AA100B0B0B000D2D0CF00F6F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00E6E6E600BCBEBD00A9A9
      A9009B9B9B0098979700A09F9F00BDBBBB00DDDCDC00F8F7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDEDF00817E
      8200767077007169700074697300776F7A006E737C005F717800556D73006A61
      58006D6762006F6D6D008E8E8F00D2D1D200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5D7D600817C7E007C737600786D
      6900756B6400736F6A006F75700065737200586D6E005A676F0067656B006D61
      62008D848500D1CFD000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3E1E2008887880070707000696969006C6C6C006F6F
      6F006D6D6D006D6D6D00707070006A6A6A005F5F5F006464640092909100DAD8
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBD8D90087868A006F6D720093A8
      A900B3C1BF00DDE1DC00FAF3EA00FDF5E400F8F4DC00F2F6D900F0FBDA00FFE6
      DB00D9C4BC00958E8B00616665005961620082858900E1DEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6D3D4008381820070787600869BA300B0BCC200E3E1
      E100FFF5ED00FFF8EB00FFF6E400F8F4E100F2F4E000E8E0E000BAC4C40089A1
      A1005B6F74004D515600847F8200E0DCDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2DFE00083818900716B7C007B9A9B00AEC2C300DBDEE200FCF3F600F9EC
      EE00F9F1F100EAE9E500EBECE800D5EFF500BACCC500929D8D006A756B004C55
      5C0086869200E7E5E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00949C9700767C7B00A4A4A400ECECEC00FCE1
      D700F4C7BC00E19C8B00CA6B5100BD4B2600C64B1900E1632800F97B3B00CB9E
      9100E7C7BC00FBEFE900E5ECE9009DAAA8005D645F0068675A00AFADA200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0091969900717B7E00A5ABAA00E5D8D600FFEDF000EFC2BF00D592
      8300C76E5300B84E2500B5400D00D15A2200F9844700EBA76C00F8D0A000F6F0
      D300DEE7DD00A6ABAC006764660069696000A9AA9D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B99
      910070807D00A9A8AA00F5DEE600FFECEC00F3C3BD00D8938200CF745500BE4F
      2100C34A1200DC611F00FD813B00EF985F00FFD0B200FCDEDD00E7DBE100BDB6
      AD00726E5500555C4100B1B9B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFCFC008B7E8A0096989F00CADFDD00FBF1E700EE9D9500BC42
      1E00D7280000F9350000EC4F0000D95D0000EE6A0000FF720000FF800900FC80
      0000FF8A0200ED8C1400F0B26400FFF5D900E4E3ED008888A000524E6400928F
      9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FB
      FB008A83900099939C00DDD5D600FFF4ED00E8A29B00D23D2900C72E1100CC30
      0200EC4A0900FF630C00FF6A0600FF700000FF760200F77E0000F3800E00E181
      2D00EDB37F00FFF7DA00DCE3D600898B8B005F565E0091909600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC008388870091A1
      9D00C7E1D400FFEEDF00EFA39700E3322B00D82A1400DF360A00ED4A0500F459
      0000F7690000F97C0200F1800100F7830600EB821500D7812F00F2B58300FFEC
      D400EDE6DD0089949200495D5E009C97A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFC0084767F009AA8B600CEE9E500F2D0CA00B0433B00AE1A0E00C02F
      0100EA471600EA470800E65C0A00E9630500F4640000FF7E1100D9790400FC95
      0000F48B0000FF9A1B00F2902400D8893800F9CE9D00F5ECDE009DADB400585B
      6E0090918E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC008183
      89009E9FA300FFE6E600FFCBC300A9413000A1180200D52B0000DF3D0300E34F
      0300DD590000DA670000DC790000D9810000D3810000FF970000FF940000FF9C
      1200F08C1600C98D3300F1D59F00FBEDDB00B7A8AC005A5A5D0092929100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC008C8A9200959FB500D8E3
      E000FAC9BF00BA513E00991B0000DF310600DD3A0300E54E0300E6550000F263
      0000F36D0000EE790600DC750100E38C0000FD9C0000FFA30400EE900700D18B
      3000FAD4B200ECDDEB009998C000595B650093939900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00F6EFE800DAD5CF00201F1E00201F
      1E00201F1E00DAD5CF00FAF2EB00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A08B9200AEA5AC00E6F8EB00C1B29F009D231300D91A0900D91C0300D73F
      0400D8390000E64D0800DA4F0000E95F0500FB721000D96C0000CF850F00F68F
      0000FC990900FF9E0F00FFA20E00FF9F0E00E99A2500DFBC7800FDFADE009A9F
      B40052575800ADAEAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00988D8E00ACA7
      A900E9F0E900D3B3A6009B2B1900BB120000E9310D00D2350000DA410200E352
      0600E75D0300E9630000F26B0000FF770700FF811000E6880600F2980400FEA4
      0000FFA80200FFA11300E3973700DCB88800F6F5E100A3A3A30058595900ACAD
      AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B919500A59FA900E0F5ED00DEBA
      B000C6251D00DD110000C5270300CC3D0400CA470400CC530300D95D0000F168
      0400F4690200F5750A00FA861B00FF9A0300F7940200F09C0400FFBA0E00FFAD
      0000EF9E1700E8B97C00FFFAFB00969E9E00595E5E00AFAFB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00979793001F1F1E0000000000000000000000
      000000000000000000001F1F1E00C7C7C200F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B1
      B6008C9A9800D4E1D300EBB9A300B0270D00EB2B0E00E7280100D72C0000D03D
      0000E5430200EE470400F55B1000ED650B00DE660000E9790100ED850400FF8F
      0300FF970600F89E0300FFB00700FFBA0F00EEA20C00E29C2B00F8B96800F6F0
      F5008C8D91005E616400DCDEDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3AEB60091949500DEEB
      DD00FFC1AB00B91E0400DE350F00E1230000C2300000D13F0B00CB410000E348
      0900FC4F1100F15D0000E3790000F3820000FF751000F38F0000FF9C0E00F593
      1100FFA71D00F9AA1300FCB62300E49E2900FFB66000FFEDEC007D948C00615E
      5B00DFDADA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B6B8B7008A9A9300E3E3D500F9BFAC00A31C
      0800DB1E0900F92E1300EA200100DE280A00D7370F00C73C0400D54B0200EB59
      0000FF730500F0780000E17F0000FF860000FF9A0D00DF900300E59E0100FFB5
      0B00FFB41500EDA02500F6B55900F5F1DE009595850062635C00E6E7E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00979393001F1E1E00000000003C3A3A003C3A3A003C3A
      3A003C3A3A003C3A3A00000000001F1E1E00C7C2C200F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF007C72
      7D00C8DED900E8DEC600B4401F00EB280200F4320300CE2A0000D1350000DD38
      0100D73F0600C7380000CB3F0000DC550100F6730B00FF870800FD770000FD88
      0700FF910300FFA10200EDA30300E2A50F00F6B62800FFB02500F18D0000DDC1
      9F00EBDCD3006A6B7500787B8100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FCFCFC0081758200D5DAD800EEDD
      C800AB341A00DA2D0C00CC330600D7340700D9250000E3300000EF3D0C00EE4B
      0700E6560000EB600000F0650400E7710700DD820000FF960000FF990700FF9A
      0700FFA40F00F4A20D00FEB22300EE9F1A00EC971D00EABC9D00D8DFCA007674
      74008B7E8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084787D00D2E6DA00ECD6BA00C8401E00EE2E
      0900E4401600C4280400DE1C04009E301E00A5493000A4522F00BE5A2A00C440
      0000FA660C00FF780200F6800000C67F1E00C1802400B57D2400B5802500BE84
      1B00F0A42C00FFAA2300FC990700EBCFA600F6E1C2007B72640082828200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00EBE5E5001F1E1E00000000003C3A3A00D5CFCF00F7EFEF00F7EF
      EF00F7EFEF00AAA6A6003C3A3A00000000001F1E1E00F2EBEB00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00A1A09E009DAE
      B100FFF0E600C0664800C93B0C00DF400400D4380000CE2C0000E02E0500DD20
      0100C9502900C6835600B1613200BB430800E1570400EF690000FF890800E788
      0900F9900500FF960200FF9D1200F5A12300E89D1D00F4A00B00FFAE0400C685
      3000FFE9C800B5ADB400555C6200CED2D100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00A09F9E00A8A9B300EBE5DA00CD76
      5B00B81E0000F2471400CF360300C52E0100F2270600CF460200D8330000D135
      0000B9500100B65E2200C1533700C6533200C1662300DD740D00E57A0000FF9C
      0000FFAA0A00F69C0800F9A31500FFA71000FFA80400D4853400FFF0C300A6A3
      A50058536300C9CFCE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A2A09D00AEB7B400FFE3DD00D3705400C1320000EF46
      0C00D82D0000BF280300C2442700F5E8CE00FCFBE100FFFFE700FFE9CD00C36A
      4500CA521600DC640B00F2881D00FFF0DF00EEE8F300FAF7FF00FFE7E200DF9A
      5100EB8D0B00FCA50900E9A10700A4703B00FFF1CA00C2AE9D005C5B5D00D2D7
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700B4AFAB0000000000000000003C3A3800F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7003C3A38000000000000000000C7C2BD00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000FFFFFF00FFFFFF00FEFEFE0080838400B8D5
      CC00FFC6B700C52E0C00E43F0600CF420000CE420000D92F0500E01A0200C614
      0900FFB5A300FFFFF000F4E9D500C88B71009E421300BA510700DD6A0F00F88D
      0D00F4850100FF8A0500FF931000FC900900F9970B00FCA30C00F9A30300F68D
      0600F1AB6F00EFDBDA00697276007D848200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FEFEFE0083848500C5DEE000E2B7A600DA38
      1500F3521400D7420000E3370300D2330700ED280800DE290000D5350000CC5D
      4300BC859E00AB98C900AC9FCD00AFA0CC00A599D300C1837800B8703000D982
      0400F7950000FFA00D00FF9E1000FFA00200FFA70000F4850700EDB16F00E8DC
      DC005E697F007C888900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE007A808200CCDAE600F6B89A00CC480800E5480000ED40
      0100ED360400C2260800BA4B4300FFF6FF00FFFDFE00F3FBFA00FEFFFA00C07D
      5C00D84D0400EB630300E38C2A00FFFFFE00F9FEFD00FFF5FF00F6FFF800CEB6
      7400E8810300FFA10300FD9F0600F2970D00FF985500E5F0E6006A6C84007280
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE7001F1E1D0000000000000000003C3A3800F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7003C3A380000000000000000001F1E1D00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000FFFFFF00FFFFFF00CACCC90092929200E5F7
      EA00BD7A6300E1411900FF430700F0440000DA3E0200DD331100DC1B0D00AE1F
      1C00E5ADA800EFFFFF00E2FBFD00FDFEFA00FFE4CF00CB865B00B9450E00F365
      0000FE800400FD8E1400FA8E0600FF960000FF990000FB940000EE920B00FF9D
      0000BB661600FFE8E3008A9396005F656100FCFCFC00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00C4C6C40093939300DBECE800C5886E00F13E
      0B00EA470000DA4A0200E4380400D7370D00DA1B0000E61C0000BC615D00878F
      CA006F87FF007579FD007F83EC00718BEF005E85FF009F9CF800A38FAC00B882
      4B00D17A0600FF900600FF980800FA910000F2970000FF950000CC6E1B00FFE4
      DB008896A90054606300FAFBF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CDD0CC0091979900E1E7EC00D28F6E00C03F0000E34C0200F04A
      0900F03A0600C4210000CE524700FCF5FC00FDFBFB00EBF9F700FAFEF800BC7B
      5C00D64A0300EB5F0200E4882900F9FAF800F4F9F800FFF2FD00F4FFF700CDB2
      7200E57B0000FF9A0100F9970300F6940800F2772D00E8E1D0009594A4005C69
      6F00FCFCFC00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E7001F1D1D0000000000000000003C383800F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E7003C38380000000000000000001F1D1D00F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000FFFFFF00FFFFFF008D8E8E00BEBEBE00F8E5
      DE00CD855B00E4672300D3420000DB460400E1420000DD350000D22B0600BF14
      0000EABBA600F0FFFB00F0F6FB00FAFFFF00FFFFFC00FFF3F100DCD6D700B374
      4100B84A0800F76D0D00F47D0000F4960000E98B0000FB940900EF870400F886
      0A00E3721100FFBD8A00C2D7CE0066586400D6D3D200FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF008E8F8F00BABABA00FFEAE400BF805A00EB62
      1E00E4420000E3470200D73D0C00CB330A00D11B0000AC5061007A70CA00316A
      FF00235AFD004D65F500646EF1007075F0008C89FD005979FF00889BFF00A99D
      C100B87A4A00DE740300FF8B0000FF8C0000EF8C0C00FF890000D85D0500F5BC
      A600B7BDC200585F6200D2CFCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0095969600B4B4B400ECE6E100CF875D00DF641A00DC520500DB3F
      0000F03B0300CE200000D74B3A00ECF0F500EDF5F400DFF6F200F2FCF600B979
      5B00D4450200EB580200E5812900EFF3EE00ECF2F100F8EDF700F0FCF600C9AC
      7300E1710000FC8F0000F68C0300FA8A0000E7600E00E5C0A400C7C3C8005561
      6500D8D8D800FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700B4ABAB0000000000000000003C383800F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E7003C383800000000000000000097909000F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000FFFFFF00FFFFFF0086878700D3D3D300DEC7
      B700DD956500FF894300E3591700D5460900D4380000D9330000D22B0600C417
      0300EBB9A500EBFBF400E1E7EC00E4E9EA00F1F5F000FFFDFA00F9F9F900F8FF
      F500E1BEA400B3643300AF520300D76F0400FF870B00FF790000FF820000F67E
      0100E6670500EA936100D6DFD50075657000B5B3B200FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0080818100DADADA00F4C1B700EA9B7000F396
      4700EE6D1800CE380000D63C1100D7310C00D53E12006260CA003E41E3001828
      F0001038EE001E59EF002960EB00395EE400596BE8004762F9005877FF007889
      FE00A183A000C3691C00FF850000FF820000E3710C00F77B0000F7691200DE8D
      6700E5DFD4006F6D6D00B1AEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0085868600D7D7D700DDCABB00DE916000FF934400E4661800CE41
      0000E63A0000D9290000E7513900D9E8EA00DDEEEA00D2F0EB00EDF8F500B876
      5D00D4400400E9500100E3772900E3EBE400DFEAE800EFE5F100ECF7F400C6A5
      7300DF690000FA840100F4800400F77E0000F8660D00DA916B00E8E2DB00636C
      6F00B6B5B600FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00EFE1DA001F1D1C00000000003C383600D5CAC300F7E7DE00F7E7
      DE00F7E7DE00C5BAB4003C383600000000001F1D1C00E5D9D200F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000FFFFFF00FFFFFF007F7F7F00E6E6E600D3B7
      9900E39A6000FF984F00F97D3D00E5642D00CB3C0200D1300000D52F0800CD1E
      0A00E3B09C00DBE9E300DBDFE400E2E7E800E8EFEA00F0F1ED00DFEAE800F0F3
      FF00F3FFFF00E4F5EC00CAB99E00BF633200F0560B00FF6D0100E5780000F877
      0000F6630300D6643500EEE8DD007D707800979B9A00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007B7B7B00E9E9E900E0AF9F00FF956B00E797
      4400E68D3500E4652800DB310F00E4220400D96C36000045FA000028D600002A
      DF000036F700002FE400193CDA002B4AE7000F3CEB005A61E0002D48EC004161
      FF009188D800AE613000F7780000FF790000EE6B1400E8770000FB641000CD6C
      3A00FFEFD800756D6D009B9A9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007D7D7E00E8E8E800D8BDA300E6975E00FF9C4C00F4843800E466
      2500DD3E0400D22B0000E6543600CDDDDC00CEE2DD00C7E4E100E8F3F100B772
      5F00D43C0600E6480200DF6D2700D5E3D800D2E0DC00E4DCE700E6F0F000C59F
      7500DF610300F9780300F3740700F4740000FF6E1500CE603600F5F1DF007075
      78009D9A9F00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00C7BDB8001F1D1C00000000003C3836003C3836003C38
      36003C3836003C383600000000001F1D1C0097908C00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000FFFFFF00FFFFFF0075757600EBEBEB00D5B5
      8C00E59D5D00FC914700FA8B4D00F7875300E05F2600DB450F00D1310700CB20
      0B00DBA99500D4E2DC00D6D9DE00D4D9DA00D2DCD600DDE3DE00D3E6E300ECE7
      E900F4E6F100F7F5FF00ECF8FA00F4EAD800B9754600CB550800EE650300F571
      0000FF620900CA451900FEEBE3007770750087928D00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0074747400EFEFEF00B8B68D00FAA35900FD95
      6000F4893F00F3863800E7673600D43E0F00CA6269000825EB00092ADB000A26
      D8000C20E3000C25DF00092DD4000C2DE1001127FF00133FE0001B40E8000846
      E8004065FB00C8665400D85A0000ED6F0000FF5E1000F6660000F85C0F00DB48
      2200FBF0DA004F756F00958B8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0078787A00E7E7E700D4B59400EE9E6100FD914300F38D4500F587
      4B00EB5E2500D03E0E00CE512B00C6D1CF00C4D2CC00BDD3D100E0E5E600B56A
      5A00D0340600E3400100DB632700C7D8CB00C0D1CD00D5CCD900DCE2E700BF95
      7200DD560400F76D0300F1670700EA6A0000FF631000CB401500F5F4DF006C6F
      770096919900FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00DFD9D2000000000000000000000000000000
      0000000000000000000000000000CFCAC400EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000FFFFFF00FFFFFF0072717200EAEAEA00D2AF
      8700F2AB6800FA964800E9834200EF8B5400F8844900F36C3400D6451800CF2C
      1600CDA28D00BECEC700C4C7CC00C8CCCD00C7D1CB00D4DBD600CADFDC00EAEA
      E400E0D8D900E8E4EA00F5FDFD00FFFDEB00C47C5200C9500A00EC630700E55C
      0000F4520400BE391400FEECE500736C710089938F00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0074747400E7E7E700BFB09000FFAF6700EB87
      4600F5924000F3914500EC7D4B00DF622F00CF7F74000029D9000016C4000012
      CB000A1DE4000224E200002CD0000032C300002FC0000428DA001135DD000029
      E0001950EF00BA705400DF5F0C00E75E0200EA5E0000E0520000F8601900B62A
      0600F9EEDA005F817B00958B8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0079777B00E4E4E400C8AB8600F4A76900F68E4100E5874500EE8A
      5300FB7F4900E2653200D06C4200C4C6C600BFC3BE00B1C1C000D7D6DA00AE5F
      5400CD2D0300DF3A0100D55E2700B7CBBE00AEC2BD00C2BBCA00CFD4DD00B88A
      6B00D64C0000F0610000EB5A0500DC5E0000EE510700D7370F00EFF3DA006769
      73009C97A000FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EEDED600938C8900000000001E1C1B001E1C1B001E1C
      1B001E1C1B001E1C1B0000000000938C8900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000FFFFFF00FFFFFF0078777900E9E9E900D9B6
      9500F8B07400FE9C4E00E7874100E0864500EF874400FB824400F0704000E54F
      3700CDAB9400AABFB700AEB1B600B7B9BA00BAC0BB00BFC5C000AFC2BF00C0CE
      CD00DCEAE800E3EDE100D9BAA500CB5C3C00EA3F0C00EF4F0100CD5B0000D24F
      0000DC460900BC492E00F0EBE800766C72009C9F9D00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0079797A00E4E4E400CCAE9D00FFBB7700E88D
      3800F2993E00E58C4200E2824D00E4804500DEA07A004F65EC002434D400081B
      D000001BD6000013D3000010D600091DDA001E25D0001329DF000E29DE000015
      F0001A41E300B3673600DD550000E84A0E00E25A0000D34B0000DA480C00BC42
      2400FFF4E400546C6A00A39A9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B7A7F00E6E6E600D1B48D00FDB27400FE984F00E68C4C00DC80
      4B00EF7F4A00E2754100E28F6200C6C0C100BCB9B500ABB5B500D0C9D000A956
      4E00CA270000DC370000D45B2900ACC3B400A2B9B100B7B0BF00C5C9D400B281
      6700D2440000EC590000E6510100CE540000E4490400E33A1400E8EED500676B
      7600A6A2AB00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600938C89000000000000000000938C8900EFDED600EFDE
      D600EFDED600938C8900000000001E1C1B00AFA6A200EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000FFFFFF00FFFFFF007D7D7E00E1E1E100E8C7
      B400F4AE7900FF9D4F00F0934400DF8A4000E2863900EC813D00F5855100F269
      4F00DBC3AB00B8D3CA00B3B6BB00ADACAE00ACADA900BCBBB700B3C1BF00BCD0
      C400D5AEA000C8664E00B2360D00C0320000E4470800E1440200DE4F0B00DA5C
      2100E5633400D37D6B00DBE8EA007A6C7700BAB7B400FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007D7D7D00E5E5E500E5BCB900FFB67800FAA3
      4100F1973800E3843E00E67F4800E5824400E1975D009D9AEF007370F5004A53
      F100344BDD00243CCC001D22D500120FDA000505CD000210BD000007CF000413
      F200584FC800C9551600D5460000E03F1200DC411400DE601F00E05C2D00E17F
      6700FFF6EA0057676600BCB5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007C7B7E00EBEBEB00FBC7A900EAA97200FFA55600F88D3200ED8E
      3E00FF884F00EA603500E2966500D6D7D300CDC8CA00B6C2C400CCD4CA00B869
      5600D71C0700E01A0000DE533200CDC9BE00A5ABAA009EB1B400C5C5BF00BF76
      6200C22B0900ED3E1300E4451300D5521900D8653A00C5896C00EAEDDD006E7F
      7B00BDBABB00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED6001E1C1B00000000001E1C1B00EBDCD500EFDED600EFDE
      D600EFDED600EBDCD5001E1C1B00000000001E1C1B00EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000FFFFFF00FFFFFF007F7F8000D5D5D500EFCF
      C400F8B28300FFA05200F0923F00E08E3D00EC934200E5833B00DC764100EB6A
      4F00DAC9AF00C3E2D900D0D4D900D4D1D300CECDC900CDCAC600B5C0BE00C789
      7100B53D1F00E7401400EA470800F1621E00E2592100F36C4600EA6A5300F076
      4800FF8F6A00F5B1A400CCE5E900746A7300E0DEDC00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF007F7F7F00D7D7D700FDD5DA00DBA37200FFB7
      5200EE933800F1894600FE8A4900ED7C3E00E3783500ABA1B8009994F0007D7F
      FF007678EE00827DD9007771DC00455ADE00184FDA002335DC000935E6003A47
      D30096698400EB4E2200E25F1600F16D4500FC6C5A00EA7B4B00FF927100F0AB
      9800ECE0DA006E777A00DCD9D900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007D7D7F00DADADA00F3DBC300F2B18400F9A75A00F2A04100F18A
      3400FF854300E87C4600E6966100E0DBDD00D5CDD700BCC9D100CCDED700BC87
      7300DF4F3600DC482A00C5674300D8D2CD00C4C8CD00A8BDC500C2CDCB00CD9B
      8700BF4B2A00DD582C00EA794700FA7F4D00FF956F00E2AA9100E5E7DB005F69
      6900E3E4E400FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600E8DAD3001E1C1B00000000001E1C1B00EFDED600EFDED600EFDE
      D600EFDED600EFDED6001E1C1B00000000001E1C1B00EBDCD500EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000FFFFFF00FFFFFF0095959600BFBFBF00F6E9
      DB00D4A88900FFB87E00EA984600EF903300FF923E00EF864300CD7B4100BD7D
      4600E8C7B300E2E9FA00C7DFF700DCE5E800FAD9C500EDA08600D76B5900E45E
      4000E3674900E9755600F0785B00F4745700FA795800F8815A00EA815500F180
      6600D2837000F8D4CA00D3CDCE0060636A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0094949500B6B6B600FFE5E800C9A68400FFC0
      6500F1984800F0894400FF8F3C00F4824300FD783A00C98C6400C19FBE009B9B
      FF00778BFF007989F3007B82E900707BEB006A7FF9006E78FF006C90F4009792
      A700C98F5400FF6A5E00F0806200E17D5B00E17C5C00E6876600E9867200FBD4
      C600C5BEBB00666C7100FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0095959700B9B9B900E6E9DA00E0AA8900FFC47E00D6983A00FC91
      3600FF8E4100D5823E00EB955900ECE4EB00E1D8E500D1D7E400E0E6E500C992
      8300E9675000F16A4E00DF856300EFE6E900DFDDE900CBD6E400E2E3E700E0AB
      9E00E06F5400FF846100EE845B00F3845E00E0866800FED2C100C7C7C1005E65
      6800FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EED6CE001E1B1A00000000001E1B1A00EDD6CE00EFD6CE00EFD6
      CE00EFD6CE00EDD6CE001E1B1A00000000001E1B1A00EDD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000FFFFFF00FFFFFF00C6C6C60095969600FFF1
      ED00C5B29700EBBF8A00FFA15700FF984200E58B3200EA934300F0824000FB70
      3700FFC8A700FFFFFA00DCECEB00D1B4A600D27B6000D75F4200E2624B00DC5B
      4200EE775D00E2715700D5614800E76B5300E86A5100D5654700D4725000F492
      7A00D08E7B00FFE4DA00979595007C7F8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00C5C5C50094959500F8E4E300D2C4AE00F6BA
      6E00FEB06D00E38D4100F5922A00EA8C4A00FF854C00E57B2800E6976600D0AB
      B500AFADF30096A9FF008E9CFC00A191EF00BB90F700B496DF00BF9DA300D881
      5F00C9773000E35C5A00D9735600D3654D00C8795000E08D7800D17F7300F9EA
      E10097979700797E8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CDCDCD00989A9B00E6EBEA00D4B39F00F1BE8600F0AD5800FD96
      3A00FA913A00DB833600F3985500E2F1ED00DDE8EC00DFEBF100EDEEEA00C28C
      7B00CE573E00E9614700F2856900EBF9F700DFEDF300DEEDF600F3F3F300D49F
      9200CE5C4500F5725700D7644900F1917A00C6816E00FFF5EC0096949400898A
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE001E1B1A000000000000000000AFA29E00EFD6CE00EFD6
      CE00EFD6CE009389850000000000000000001E1B1A00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000FFFFFF00FFFFFF00FFFFFF007E7E7F00D4D1
      D300FEE6DA00D1A27C00FFCB8A00F59F4D00F0893200FB923B00EF8C3800E473
      2300FFA46C00FAB29000D08C6F00BF6D4400D36A3900E76E4200EF6E4D00F273
      5A00D55E4400CF604600DF6B5200E2685200DF685300DE765F00D87E6500D48D
      7900E7BBAA00F7EBE100696C6C00DCDCDF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00EBDFDB00E0DDCF00DEAA
      6800FFC98E00E29D4D00EA9D2800D8904A00F27C4800E98B3200E7821600E982
      2C00E0907F00C1A2BF00A5ACC000A8AAB200BDA4AE00CB817F00E26F3600FF53
      3D00E06D4800D9665700E1783F00F3645500E0886A00E1968800FFB6B000E0DE
      D60071747500D1D3D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848600DFD4DC00E9E1D400CFA07A00FFCA8A00F9A2
      4C00E8882E00FA8E3D00F4924A00F8FDE000F5F5E300F6F4E900FFF1DE00D09A
      7B00CA694300D96C4600E27E5B00F6F7E700FBF5EE00F6F1F000FCF0E600D9A7
      9100BC5B4100D86E5600E18B7300DC908400E4B6AB00F1E3DD0073717200E1E0
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00D3C6C0001D1B1A00000000001D1B1A001D1B1A001D1B
      1A001D1B1A001D1B1A00000000001D1B1A00CABFB900E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000FFFFFF00FFFFFF00FFFFFF00A5A4A60093A0
      A800FFEFEE00E4BBA400E3B88500FFC57E00F8944200FF943A00E88D2B00E794
      3100E3843400E1743600E5733700E77A3600E67C3500E1763900DD6E3E00E765
      4200F0765200E8765100E06C4900E56B4D00E06C5300E2806800F2A28B00BC8F
      8100FFE7DB00A6A79E0079807E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00A7A6A700A3A5AF00F6F1F000D2BA
      A600D9AE8300FFCD8C00E9984300ED8E2D00FC973000E9823D00FA8B4500FF85
      3F00F7722E00F06B2800F2733600EC753D00DE6E3900D86E4500E1704800EE74
      5000EB6D4A00E76C4A00DF714F00E07F5B00FDA58000B0808600FFECEE00AAAB
      A9006E767500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A7A6A900B09EA500E9F3ED00E9C6B200F4A27900FFC5
      7C00E9994400F78C3B00E8863A00EC9A6300E6946A00DF8E6D00EB957100D777
      4900DE743E00E4764200DD6D4200DD816400E5837100E1887A00D5887500C76F
      5100D2664700EB876E00E2998500C68B8900FFEBE600A3A4A00082808100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00CABFB9001D1B1A0000000000000000000000
      000000000000000000001D1B1A00BDB3AE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000FFFFFF00FFFFFF00FFFFFF00F7F6F7008580
      8900D1D9D900FFF9EC00C99A7E00FDBB8A00FFD08600E99C4500FE943700FF92
      3500F08A3100DB8A3500E48E3A00F7873500FD7D3200F77D3B00ED824900F97A
      4700EE784400EC7C4700E5723F00E36D4300FC906E00F8A18600CA876E00EBD4
      CC00E7E0D7006A746F00D4D5D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00F6F5F60080808600C8C3C200FFFB
      EC00C09D7C00E9B37E00FFD18700F29B4300F4963500F88F4600ED8B3F00E087
      3700D9873600DD883A00E2843B00E77B3B00E6733600E97A4800ED7B4C00E870
      4600EB744D00DD6F4B00EE8D6C00FFB49300D18A6900F4CFD300E5D5D6006E75
      7200D0D3D300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F6F700918E9000BEC9C700FEF4ED00D19F8800FEC5
      8E00F3BE6E00EAA14D00F18D3F00FF863100F9803600EC703400F6783E00F176
      3400F7833C00FB834200F6753E00F76A3900F7643E00EF654800D5633F00DB6C
      4400FD8A6500FA977B00D7927F00EEC4C500E2DDDA0078808200DAD8D900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E6D6C700CABFB4001D1B19001D1B
      19001D1B1900CABFB400E6D6C700E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8BC
      BE008B8E9100EDEAE600FFF9EC00C29F7E00EAB88300FFC87E00FFB05E00F38C
      3600F6903E00F38E3F00F2853700F8823500FE853D00F5814000E3753900E877
      3E00E97F4200D6733500E8844900FFAB7A00F79E7900D8967D00F0C3AE00F4E6
      E700929391008D9A9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B7B90096979800E6DC
      D500FFF3E100C9A38000ECB47D00FFCE8600FFAF5D00E68A3D00EB8A3A00F48B
      3A00F98B3900F4833300E97B2F00E97D3500ED854000EC7B3C00E5733700E373
      3F00E57C5100FFA58200EFA68A00C68E7500EABEA700FFF2F300908F8D00909B
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B9BEBF009C9FA000D4E1DF00FFF9E700CC98
      6A00F4D08400FAD58000FFA85D00E49B2200E2982E00DF8B3200F2914100E888
      3400DE852D00E4823600F27E3D00DF813500EF854600DE7A4400D2804900FFAF
      7800FFAF7F00DC957300E7BDA600FFEDF1009494920089959800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A69E9C00ACA6A600E2EDEB00F5F5E500CA9D7C00E8AA7400FFD28C00FCD0
      8300F8AE6600F98E4B00F9884600EF8B4A00DA874300D9834100E7884900DE84
      4E00DA874F00F6A86D00FFBD8500F2A47900D2937700E0BBAD00FFF2EC00A39F
      A00083848500FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A09B9900ADA9
      A900F5ECE800FFF7E600C49F7D00DEA97600FFD19100FFC87B00FFB06400FA95
      4700F7853800FE883B00FC8D4400EE8C4400E1874000F3884400F88F5000FFA3
      6D00FFBE9100EDAA8900C2937D00DCBFB000FFF6EB009C9D9B007C818000FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A19C00ACAAA500FEF4EA00FFF6
      E100CCA88400D39F6A00FFDA9A00FFCF8800EEB36400E1954200E78D3500F08A
      3700ED843B00E87E4100E67E4900F1825000E7804F00FFA17700FFB99700F898
      8000D0897500DABDA800F5FBE400A1A29E0088888600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00949A9D00A3A2A500E0D4D200FFFFEC00E2C39600C1885000F3B5
      7900FCCC8C00F6D39100EBC88600F0BD7E00FAB77A00FCB47400FFB67400FFC2
      9300FFC19000F2B88400D3976900D49A7700FFDBCA00F7E8E600AAAAAD00817A
      8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868A
      8E00A2A2A500F1EAE700FFFBEA00D7B59700B1865F00F8BF8100FCC88600FDCF
      8800F7CD8200F0C17700F1B67000FAB37300FFB57700FFC58700FFC18800F8B0
      8000CF936F00BF937B00F0D7C700F8EDE500A4A19D007D828300FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A7A7A8009E9E9E00E9DF
      D800FFFDEB00E7C4A300A97F5500ECAB7800FFC38800FFD39100FFCB8400FFBD
      7600FFB87600FAB77E00F3B48100F8BC8100FFCD9900FFAF8800D4846700D39E
      8900FDE3D500ECE1D900B5AFAE0085858600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD009DA1A30096979900CBCBCB00F1F1F100ECECEC00D7B4
      8C00D1A97F00DAA87E00F1B88B00FFC99800FFCB9800FAC78F00F3C48C00F1AB
      8E00D6997F00CA9D8800EBCEBF00FFEFE900D4C9CB009D989F0098919D00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00979A9D008F8E9000D9D0CC00FFFBEF00FFF0DF00CDAE8700C8A87D00D0AF
      7E00E9C19000F7CC9900F7C89500F4C29400F7C29700E6B08700CC9B7500D2A9
      8900EDCEB500FFF9EA00E5DAD2009793950096929900FDFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD009DA3A7009A9C
      9F00CBC6C700FFF5EB00FFF4E500E2B39800D2A18100D7A17800F0B88700FDC8
      9500F4C49400EAC09500EAC69E00CCB47E00C9A27500D2A28000F5CFB700FFF0
      E300CECFCD009D9A9F009C98A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B8BCBD00898A8C00A0A0A000D6D6D600FFF2
      DB00FFE8D000F9DAC100EBC6AA00D6AE9100C7A28000CBAB8700DABD9800F1CD
      B500FFE2CB00FFEEDC00E5DCCF00B1ADA8008E888B00B9B6BC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B3B6B70085858700A2A1A300D0CCD100F7F5E300F9EAD700FED9
      C500F7C3AC00E3AA9100CE9C8500CEA89000D8BCA400E6D0BE00FFEFDE00F4E7
      D900E0D7CD00AFABA60088838400B8B5BA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9BF
      C1008A8D9100A6A5A700D0CCCB00F3F0E800F5EDE000EDDECB00DDC4AA00CBAD
      9000C9A78A00D0AD9300D9B59D00E8CEB000F3E8CC00F0F3DD00D9DCCD00A8A5
      A2008B858900BDBCC200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F500A5A6A70082818300999B
      9C00B9B6B200DCD3CF00F7EBE500FFEFE800F5E9DD00EFE6D900F2EBDC00DADA
      CC00C6C9BA00999F9800767F77009CA09E00F9F9FA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4F4F500A0A2A8007B808A00979B9B00B1B7B200CFD7
      CC00E3E8D900ECEEDB00F6EFDE00FAEADD00FBE5DA00D7D5D400BBBCBA009B9F
      9B007A807D00999C9B00F9F9FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5F5F600A4A5A7008785880093959A00ADB2B500D5D6D400EEE8E100F4EA
      E000F8E8DC00FBEADD00FEEDE000E8CECE00CAC1BE00999F9D00747C7900A5A5
      A600FBFBFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00BFC1
      C40096969B007C7E820072747800737576007375750073777500767B7800767B
      7D008F909400BFBDC300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00BABCBE0097979A008081
      830078797A007676770073747400757676007A7C7B00797A7B0090919200BEBC
      C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00CECBCE009B969B007F7A7F0077767A00797C
      7C00747876006F777200727C770084828A0099929B00C3BEC600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FCF5ED00DAD5CF00201F1E00201F1E00B8B4AF00F2EB
      E500FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00EFEFE800C7C7C2001F1F1E001F1F
      1E0097979300DEDED900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00D5D5CF001F1F1E00000000000000000000000000000000001F1F
      1E00B4B4AF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF001F1F1E001F1F1E001F1F1E00EFEFE800F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00EFEFE800C7C7
      C2001F1F1E001F1F1E00B4B4AF00E5E5DF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00C7C2C2001F1E1E0000000000000000000000
      0000000000001F1E1E001F1E1E00DED9D900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00EBE5E5001F1E1E00000000001F1E1E001F1E1E001F1E1E001F1E1E001F1E
      1E001F1E1E00C7C2C200F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF001F1E1E000000000000000000EFE8E800F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00C7C2C2001F1E1E000000
      00000000000000000000000000001F1E1E001F1E1E00F5EDED00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00C7C2C2001F1E1E00000000001F1E1E001F1E1E001F1E
      1E001F1E1E001F1E1E00000000001F1E1E00DED9D900F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF001F1E1E00000000000000000097939300F7EFEF00F7EFEF00F7EFEF009793
      9300000000001F1E1E00F5EDED00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00B4AFAF000000000000000000D5CFCF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00C7C2C2001F1E1E00000000001F1E
      1E001F1E1E001F1E1E001F1E1E001F1E1E00000000001F1E1E00F6EEEE00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F6EEE7001F1E1D00000000001F1E1D00E5DFD900F7EFE700F7EF
      E700F7EFE7009793900000000000000000001F1E1D00F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F5ED
      E6001F1E1D00000000001F1E1D00EFE8E100F7EFE700F7EFE700F7EFE700F5ED
      E6001F1E1D0000000000DED9D300F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700DED9D300000000000000000097939000F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F5EDE6001F1E1D00000000001F1E1D00DED9
      D300F7EFE700F7EFE700F7EFE700979390001F1E1D0000000000B4AFAB00F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700EBE5DE0000000000000000001F1E1D00F7EFE700F7EFE700F7EF
      E700F7EFE700F2EBE4001F1E1D00000000001F1E1D00DED9D300F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700E5DF
      D90000000000000000001F1E1D00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E7001F1E1D000000000097939000F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F5EDE6001F1E1D00000000001F1E1D00F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F5EDE600D5CFCA00D5CFCA00D5CFCA00F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE7001F1E1D00000000001F1E1D00F5ED
      E600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F5E6E600EFE1E100EFE1E100F5E6E600F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E7001F1D1D00000000000000000097909000F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700D5CA
      CA0000000000000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E7001F1D1D00000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E7001F1D1D00000000001F1D1D00F2E4E400F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700B4ABAB000000000000000000E5D9
      D900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E7001F1D1D0000000000000000001F1D1D00F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D
      1D0000000000000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E7001F1D1D00000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700D5CACA000000000000000000C7BDBD00F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E5D9D9009790
      90001F1D1D001F1D1D00DED3D300F7E7E700D5CACA000000000000000000C7BD
      BD00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D1C00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D
      1C0000000000000000001F1D1C00F6E7DE00F7E7DE00F7E7DE00F7E7DE00F6E7
      DE001F1D1C0000000000B4ABA600F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F5E6DD001F1D1C00000000001F1D1C00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE0097908C001F1D1C000000
      000000000000000000001F1D1C001F1D1C0097908C0000000000000000001F1D
      1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F5E6DD001F1D1C000000000000000000C7BDB800F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D
      1C0000000000000000000000000097908C00F7E7DE00F7E7DE00F7E7DE009790
      8C00000000001F1D1C00E5D9D200F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00B4ABA600000000001F1D1C00E5D9D200F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE0097908C001F1D1C00000000001F1D
      1C001F1D1C001F1D1C001F1D1C001F1D1C000000000000000000000000001F1D
      1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE001E1D1C001E1D1C001E1D1C00DFD9D200EFE7DE00EFE7
      DE00EFE7DE0093908C0000000000000000001E1D1C00E8E1DA00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE001E1D
      1C000000000000000000000000001E1D1C001E1D1C001E1D1C001E1D1C001E1D
      1C00000000001E1D1C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EDE6DD001E1D1C00000000001E1D1C00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00E5DED7001E1D1C000000000000000000AFAB
      A600EFE7DE00EFE7DE00EFE7DE0093908C000000000000000000000000001E1D
      1C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600938C890000000000000000001E1C1B001E1C1B001E1C
      1B001E1C1B001E1C1B00000000001E1C1B00938C8900EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6001E1C
      1B0000000000000000004E4E4E00000000000000000000000000000000001E1C
      1B001E1C1B00EDDDD600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600AFA6A200000000001E1C1B00E5D7D000EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600C2B8B30000000000000000001E1C1B00EEDE
      D600EFDED600EFDED600EFDED600EDDDD6001E1C1B0000000000000000001E1C
      1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600CFC4BF00000000000000000000000000000000000000
      000000000000000000001E1C1B00AFA6A200EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600AFA6
      A2000000000000000000E8DAD300E8DAD300AFA6A2001E1C1B001E1C1B00D9CC
      C600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EDDDD6001E1C1B00000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED6001E1C1B0000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B000000000000000000938C
      8900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600D9CCC600000000001E1C1B00EBDCD500C2B8B3001E1C
      1B001E1C1B00AFA6A200E8DAD300EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600CFC4
      BF000000000000000000E8DAD300EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600CFC4BF001E1C1B001E1C1B00CFC4
      BF00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED6001E1C1B0000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B000000000000000000CFC4
      BF00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600E8DAD300000000001E1C1B00EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600E5D7
      D0000000000000000000CFC4BF00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600938C8900000000001E1C
      1B00EBDCD500EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600938C890000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B000000000000000000DFD2
      CC00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EBD5CD001E1B1A001E1B1A00EBD5CD00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EED6
      CE001E1B1A00000000001E1B1A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00C2B3
      AE001E1B1A001E1B1A00DFCCC500EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EED6CE00000000000000
      000093898500EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00CFBFB90000000000000000001E1B1A00EED6
      CE00EFD6CE00EFD6CE00EFD6CE00EDD6CE001E1B1A00000000001E1B1A00EED6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE001E1B1A0000000000E8D3CC00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00AFA29E00000000001E1B1A00C2B3AE00EFD6CE00EFD6CE00EBD5CD001E1B
      1A00000000001E1B1A00EDD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00CFBFB9001E1B1A001E1B
      1A001E1B1A001E1B1A001E1B1A001E1B1A001E1B1A001E1B1A00000000000000
      00001E1B1A00CFBFB900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EDD6CE001E1B1A000000000000000000AFA2
      9E00EFD6CE00EFD6CE00EFD6CE0093898500000000000000000093898500EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE001D1B1A00000000001D1B1A001D1B1A001D1B
      1A001D1B1A001D1B1A001D1B1A001D1B1A001D1B1A00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE001D1B1A00000000001D1B1A001D1B1A001D1B1A001D1B1A000000
      00000000000090898500E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00CABFB900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CABFB900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00BDB3AE001D1B1A00000000001D1B
      1A001D1B1A001D1B1A001D1B1A001D1B1A00000000001D1B1A00E4D5CD00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE001D1B1A000000000000000000000000000000
      0000000000000000000000000000000000001D1B1A00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00D9CCC5001D1B1A001D1B1A000000000000000000000000001D1B
      1A001D1B1A00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00CABFB9001D1B1A001D1B
      1A001D1B1A001D1B1A001D1B1A001D1B1A001D1B1A001D1B1A001D1B1A001D1B
      1A001D1B1A00CABFB900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00ABA29E001D1B1A000000
      00000000000000000000000000001D1B1A001D1B1A00D9CCC500E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C6001D1B19001D1B19001D1B19001D1B19001D1B
      19001D1B19001D1B19001D1B19001D1B19001D1B1900E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600D3C6BB00908982001D1B190090898200D3C6
      BB00E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E4D5C600CABF
      B4001D1B19001D1B190090898200D3C6BB00E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00DAD5CF00DAD5
      CF00DAD5CF00DAD5CF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF001F1F1E000000
      0000000000001F1F1E00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00EFEF
      E8001F1F1E001F1F1E001F1F1E001F1F1E001F1F1E001F1F1E001F1F1E001F1F
      1E001F1F1E001F1F1E001F1F1E00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00EBEBE500C7C7C2001F1F1E001F1F1E0097979300DEDED900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF001F1F1E001F1F1E001F1F1E001F1F1E00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF001F1E1E000000
      0000000000001F1E1E00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00EFE8
      E8001F1E1E000000000000000000000000000000000000000000000000000000
      000000000000000000001F1E1E00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF009793
      93001F1E1E00000000000000000000000000000000001F1E1E001F1E1E00E5DF
      DF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF001F1E1E0000000000000000001F1E1E00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF001F1E1E000000
      0000000000001F1E1E00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF001F1E1E0000000000000000001F1E1E001F1E1E001F1E1E001F1E1E001F1E
      1E001F1E1E001F1E1E001F1E1E00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00979393001F1E
      1E00000000001F1E1E001F1E1E001F1E1E001F1E1E001F1E1E00000000001F1E
      1E00EBE5E500F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF001F1E1E0000000000000000001F1E1E00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7001F1E1D000000
      0000000000001F1E1D00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700B4AFAB0000000000000000001F1E1D00F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700EBE5DE001F1E1D000000
      000097939000F5EDE600F7EFE700F7EFE700F7EFE700EFE8E1001F1E1D000000
      00001F1E1D00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7001F1E1D0000000000000000001F1E1D00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7001F1E1D000000
      0000000000001F1E1D00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F6EEE7001F1E1D00000000001F1E1D0097939000F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700C7C2BD00000000001F1E
      1D00F5EDE600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700D5CFCA000000
      00001F1E1D00F5EDE600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7001F1E1D001F1E1D001F1E1D001F1E1D001F1E
      1D001F1E1D001F1E1D001F1E1D0000000000000000001F1E1D001F1E1D001F1E
      1D00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D1D000000
      0000000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700E5D9D9001F1D1D00000000001F1D1D0097909000F5E6E600F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D1D001F1D1D001F1D
      1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700EFE1E1000000
      000000000000EFE1E100F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E7001F1D1D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F1D
      1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D1D000000
      0000000000001F1D1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700E5D9D9001F1D1D0000000000000000001F1D1D00EBDE
      DE00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700D5CACA000000
      000000000000EFE1E100F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E7001F1D1D00000000001F1D1D001F1D1D001F1D
      1D001F1D1D001F1D1D001F1D1D0000000000000000001F1D1D001F1D1D001F1D
      1D00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D1C000000
      0000000000001F1D1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00EFE1DA001F1D1C0000000000000000001F1D
      1C00E5D9D200F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00DED3CC001F1D1C000000
      00001F1D1C00F6E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00B4ABA60000000000B4ABA600F7E7DE00F7E7
      DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D1C00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D1C000000
      0000000000001F1D1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F6E7DE0097908C001F1D1C000000
      00001F1D1C00EBDED700F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00EFE1DA001F1D1C001F1D1C001F1D1C001F1D1C00000000001F1D
      1C00B4ABA600F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F6E7DE001F1D1C001F1D1C00EFE1DA00F7E7
      DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D1C00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE001E1D1C000000
      0000000000001E1D1C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE0093908C001E1D
      1C00000000001E1D1C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00E8E1DA000000000000000000000000000000000000000000AFAB
      A600EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00CFCAC4001E1D1C0093908C00EFE7
      DE00EFE7DE00EFE7DE001E1D1C0000000000000000001E1D1C00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6001E1C1B000000
      0000000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600938C
      8900000000001E1C1B00DFD2CC00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600E8DAD3001E1C1B001E1C1B001E1C1B000000000000000000EDDD
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED6001E1C1B001E1C1B00E8DA
      D300EFDED600EFDED6001E1C1B0000000000000000001E1C1B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6001E1C1B000000
      0000000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EDDD
      D6001E1C1B0000000000AFA6A200EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EDDDD600AFA6A2001E1C1B001E1C
      1B00EEDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600E5D7D0001E1C1B001E1C
      1B00EFDED600EFDED6001E1C1B0000000000000000001E1C1B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED6001E1C1B001E1C1B001E1C1B001E1C1B001E1C1B000000
      0000000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600E8DAD300E8DAD300E8DAD300EFDED600EFDED600EFDED600EFDED600EFDE
      D6001E1C1B00000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6001E1C1B000000
      0000C2B8B300EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600938C89001E1C
      1B00DFD2CC00EFDED6001E1C1B0000000000000000001E1C1B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED6001E1C1B00000000000000000000000000000000000000
      0000000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6001E1C1B00000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDE
      D6001E1C1B00000000001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600CFC4BF001E1C
      1B001E1C1B00E8DAD300EFDED600EFDED600EFDED600EFDED6001E1C1B000000
      00001E1C1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EDDDD6001E1C
      1B001E1C1B00EFDED6001E1C1B0000000000000000001E1C1B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE001E1B1A001E1B1A001E1B1A0000000000000000000000
      0000000000001E1B1A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE001E1B1A00000000001E1B1A00EED6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE001E1B1A0000000000AFA29E00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00CFBFB9000000
      000000000000DFCCC500EFD6CE00EFD6CE00EFD6CE00EFD6CE001E1B1A000000
      00001E1B1A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00C2B3
      AE0038323000CFBFB9001E1B1A0000000000000000001E1B1A00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EDD6CE00AFA29E001E1B1A000000
      0000000000001E1B1A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00AFA29E000000000000000000C2B3AE00EFD6CE00EFD6CE00EFD6CE00C2B3
      AE001E1B1A001E1B1A00DFCCC500EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EBD5CD001E1B
      1A00000000001E1B1A00EDD6CE00EFD6CE00EFD6CE00D9C6C0001E1B1A000000
      0000C2B3AE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE001E1B1A00000000000000000000000000000000001E1B1A00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00ABA29E000000
      0000000000001D1B1A00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E4D5CD001D1B1A00000000001D1B1A001D1B1A001D1B1A001D1B1A001D1B
      1A00000000001D1B1A00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE009089
      85001D1B1A00000000001D1B1A001D1B1A001D1B1A001D1B1A00000000001D1B
      1A00E4D5CD00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00D9CCC5001D1B1A000000000000000000000000001D1B1A00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E6D6CE001D1B
      1A001D1B1A001D1B1A00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00D9CCC5001D1B1A00000000000000000000000000000000001D1B
      1A001D1B1A00E6D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00908985001D1B1A00000000000000000000000000000000001D1B1A00BDB3
      AE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00908985000000000000000000000000001D1B1A00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E6D6C700D3C6BB001D1B19001D1B190090898200D3C6
      BB00E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600D9CCBF00ABA29A001D1B19001D1B1900BDB3A900E1D3C500E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E1D3C500E1D3C500E1D3C500E1D3C500E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FCFCF400FAFAF300DADAD900C5C5C400C5C5
      C400CBCBCB00F4F4EE00FAFAF300FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700F5F5EE00EFEFE900C2C2C100B3B3B300B3B3B300C1C1C100EAEA
      E500F4F4EE00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700EFEF
      E800E6E6E100C0C0C000B2B2B200B2B2B200C0C0C000E2E2DE00EFEFE900FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700F0E9E900DAD5D50099969600535151000A0A0A00000000000000
      0000040404003D3C3C008A878700CAC6C600E7E0E000FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700DAD5
      D500B3B0B0006160600025242400010101000000000000000000000000002323
      230061606000AAA8A800D3CDCD00FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C9C5C5009E9C9C005151
      51001F1F1F000101010000000000000000000000000020202000545454009998
      9800C3BEBE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F4ED
      ED00CBC6C6005A59590002020200000000000101010004040400060606000606
      06000505050002020200000000000000000038373700B0ACAC00E9E2E200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E2DCDC009B9999002B2B
      2B00000000000000000001010100040404000606060006060600050505000101
      01000000000000000000272727008E8D8D00D8D2D200FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700D2CDCD008584840026262600000000000000
      0000010101000404040006060600060606000505050001010100000000000000
      0000252525007F7E7E00C9C4C400FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F2ECEC006967
      6700070707000000000004040400060606000707070007070700070707000707
      070007070700070707000606060006060600000000000000000046454500D3CE
      CE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700E2DEDE002F2F2F00000000000000
      0000050505000606060007070700070707000707070007070700070707000707
      07000606060005050500000000000000000029282800C9C5C500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700D4D1D100242424000000000000000000050505000606
      0600070707000707070007070700070707000707070007070700060606000505
      0500000000000000000023222200C2BFBF00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00F1EBE500555352000101
      0100030303000707070007070700070707000707070007070700070707000707
      0700070707000707070007070700070707000707070005050500000000001F1F
      1E00D2CDC900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00DDD8D4002222220001010100050505000707
      0700070707000707070007070700070707000707070007070700070707000707
      070007070700070707000707070005050500010101001C1C1C00C5C1BF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00CECBC8001D1D1D00010101000505050007070700070707000707
      0700070707000707070007070700070707000707070007070700070707000707
      07000707070005050500010101001C1C1C00BDBAB900FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FCF5ED00E4DE
      D900201F1E00201F1E00201F1E00E4DED900FCF5ED00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00EFEFE8004D4D4C00030303000808
      0800090909000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000303
      030017171700D7D7D200F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00DFDFDA00222222000404040009090900090909000707
      0700070707000707070007070700070707000707070007070700070707000707
      07000707070007070700070707000909090009090900040404001C1C1C00CCCC
      C800F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00D3D3CF001E1E1E0004040400090909000909090007070700070707000707
      0700070707000707070007070700070707000707070007070700070707000707
      0700070707000909090009090900040404001C1C1C00C4C4C100F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00E5E5DF001F1F1E000000
      0000000000000000000000000000000000001F1F1E00E5E5DF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F0E9E90065636300050505000B0B0B000A0A
      0A000B0B0B000A0A0A0003030300010101000A0A0A000B0B0B000A0A0A000A0A
      0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000B0B
      0B00060606002C2B2B00DDD7D700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00E6E0E0002F2F2F00040404000B0B0B000B0B0B000B0B0B000808
      0800080808000808080008080800080808000808080008080800080808000808
      08000808080008080800080808000B0B0B000B0B0B000B0B0B00040404002323
      2300D5D0D000F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DDD8
      D80024242400040404000B0B0B000B0B0B000B0B0B0008080800080808000808
      0800080808000808080009090900090909000808080008080800080808000808
      0800080808000B0B0B000B0B0B000B0B0B000404040021212100CFCACA00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00EFE8E8001F1E1E00000000001F1E
      1E001F1E1E001F1E1E001F1E1E001F1E1E00000000001F1E1E00EFE8E800F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00C0BCBC000B0B0B00090909000C0C0C000C0C
      0C000B0B0B000C0C0C00414141004C4C4C0009090900070707000C0C0C000C0C
      0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C
      0C000C0C0C00040404007E7B7B00F6EEEE00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF009A989800050505000A0A0A000C0C0C000C0C0C000C0C0C001313
      1300131313001313130013131300131313001313130013131300131313001313
      13001313130013131300131313000C0C0C000C0C0C000C0C0C000A0A0A000505
      05007A787800F6EEEE00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF008786
      8600050505000A0A0A000C0C0C000C0C0C000C0C0C0013131300131313001313
      130013131300121212000B0B0B000B0B0B001212120013131300131313001313
      1300131313000C0C0C000C0C0C000C0C0C000A0A0A000505050078777700F6EE
      EE00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF009793930000000000000000009793
      9300F7EFEF00F7EFEF00F7EFEF001F1E1E00000000000000000097939300F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700EEE7E1004A494800050505000E0E0E000E0E0E000E0E
      0E000C0C0C000C0C0C0084848400F0F0F0009D9D9D00353535000A0A0A000909
      09000D0D0D000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E
      0E000E0E0E000C0C0C0014131300D3CEC900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700E4DED90028282800070707000E0E0E000E0E0E000D0D0D0016161600EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00161616000D0D0D000E0E0E000E0E0E000606
      060021212100CECAC600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700DCD7D3002424
      2400070707000E0E0E000E0E0E000D0D0D0016161600EFEFEF00F7F7F700F7F7
      F700F7F7F700CBCBCB000101010002020200CCCCCC00F7F7F700F7F7F700F7F7
      F700EFEFEF00161616000D0D0D000E0E0E000E0E0E000606060023232300CAC7
      C300F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F5EDE6001F1E1D00000000001F1E1D00EBE5
      DE00F7EFE700F7EFE700F7EFE700E5DFD90000000000000000001F1E1D00F5ED
      E600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700CBC6C100080808000D0D0D000F0F0F000F0F0F001010
      10000E0E0E000D0D0D0081818100FFFFFF00FFFFFF00E3E3E3007F7F7F002121
      2100050505000A0A0A000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000808080085828000F6EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700AEABA800050505000E0E0E000F0F0F000F0F0F000E0E0E0018181800F8F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8F8F800171717000E0E0E000F0F0F000F0F0F000E0E
      0E000505050087858400F6EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE7009E9C9B000505
      05000E0E0E000F0F0F000F0F0F000E0E0E0018181800F8F8F800FFFFFF00FFFF
      FF00FFFFFF00D3D3D3000202020003030300D4D4D400FFFFFF00FFFFFF00FFFF
      FF00F8F8F800171717000E0E0E000F0F0F000F0F0F000E0E0E00050505008887
      8600F6EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700EBE5DE0000000000000000001F1E1D00F7EF
      E700F7EFE700F7EFE700F7EFE700F6EEE7001F1E1D000000000000000000EBE5
      DE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F5E6E6008A858500040404001111110011111100111111001111
      1100101010001010100081818100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C9
      C900606060001313130006060600101010001212120011111100111111001111
      110011111100111111000A0A0A0041404000EBDEDE00F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F3E5
      E50061606000060606001111110011111100111111001010100019191900F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700191919001010100011111100111111001111
      1100060606004E4E4E00EADDDD00F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F1E4E400555555000606
      06001111110011111100111111001010100019191900F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D3D3D3000404040004040400D3D3D300FFFFFF00FFFFFF00FFFF
      FF00F7F7F7001919190010101000111111001111110011111100060606005252
      5200E9DCDC00F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700D5CACA0000000000000000001F1D1D00F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D1D000000000000000000D5CA
      CA00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F3E5E5004D4A4A000E0E0E001313130013131300131313001313
      1300121212001212120082828200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00B2B2B2004D4D4D00111111000F0F0F0014141400131313001313
      13001313130013131300101010001E1D1D00DACFCF00F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F0E3
      E3002F2F2F000F0F0F00141414001414140014141400131313001C1C1C00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7001C1C1C001313130014141400141414001414
      14000F0F0F0028282800DAD0D000F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700EDE2E2002B2B2B000F0F
      0F00141414001414140014141400131313001C1C1C00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D3D3D3000707070007070700D3D3D300FFFFFF00FFFFFF00FFFF
      FF00F7F7F7001C1C1C00131313001414140014141400141414000F0F0F002A2A
      2A00DAD1D100F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E7009790900000000000000000001F1D1D00F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E7001F1D1D0000000000000000009790
      9000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00E8DCD50017171700131313001414140014141400141414001414
      1400131313001313130083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECECEC00979797002E2E2E000B0B0B00121212001414
      140014141400141414001313130009090900B0A9A600F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00DFD6
      D0001010100014141400141414001414140014141400131313001C1C1C00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7001C1C1C001313130014141400141414001414
      14001414140010101000B4AFAC00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00D8D1CC00101010001414
      1400141414001414140014141400131313001C1C1C00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D3D3D3000707070007070700D3D3D300FFFFFF00FFFFFF00FFFF
      FF00F7F7F7001C1C1C0013131300141414001414140014141400141414001010
      1000B7B3B100F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D1C00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D
      1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00E1D6CF0008080800161616001616160016161600161616001616
      1600151515001515150083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1E10080808000242424001515
      1500161616001616160016161600050505009F999500F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00D6CE
      C9000B0B0B0017171700171717001717170017171700161616001F1F1F00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7001F1F1F001616160017171700171717001717
      1700171717000A0A0A00A5A19E00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00CEC8C5000B0B0B001717
      1700171717001717170017171700161616001F1F1F00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D4D4D4000A0A0A000A0A0A00D4D4D400FFFFFF00FFFFFF00FFFF
      FF00F7F7F7001F1F1F0016161600171717001717170017171700171717000A0A
      0A00AAA7A500F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D1C00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE001F1D1C0000000000000000001F1D
      1C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00DAD5CF000A0A0A00181818001818180018181800181818001818
      1800171717001717170085858500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F4005B5B5B001414
      1400181818001818180018181800070707009C999600EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00D1CD
      C9000D0D0D00191919001919190019191900191919001818180021212100F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700212121001818180019191900191919001919
      1900191919000D0D0D00A3A19F00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00CAC7C5000D0D0D001919
      19001919190019191900191919001818180021212100F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D4D4D4000D0D0D000D0D0D00D4D4D400FFFFFF00FFFFFF00FFFF
      FF00F7F7F7002121210018181800191919001919190019191900191919000D0D
      0D00A8A7A500EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE001E1D1C0000000000000000001E1D1C00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE001E1D1C0000000000000000001E1D
      1C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600DDD1CC000F0F0F001A1A1A001A1A1A001A1A1A001B1B1B001B1B
      1B001A1A1A001A1A1A0085858500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500595959001B1B1B001A1A
      1A001A1A1A001A1A1A00191919000B0B0B00A09A9700EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600D7CD
      CA00171717001A1A1A001B1B1B001B1B1B001C1C1C001B1B1B0024242400F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700232323001B1B1B001B1B1B001B1B1B001B1B
      1B001A1A1A0017171700A8A4A100EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600D2CAC800171717001A1A
      1A001B1B1B001B1B1B001C1C1C001B1B1B0024242400F7F7F700FFFFFF00FFFF
      FF00FFFFFF00D5D5D5001010100010101000D5D5D500FFFFFF00FFFFFF00FFFF
      FF00F7F7F700232323001B1B1B001B1B1B001B1B1B001B1B1B001A1A1A001717
      1700AEABA900EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED6001E1C1B0000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B0000000000000000001E1C
      1B00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600E8DAD4003B3A39001A1A1A001D1D1D001D1D1D001E1E1E001E1E
      1E001D1D1D001D1D1D0088888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFCFCF007070700024242400121212001C1C1C001E1E
      1E001D1D1D001D1D1D001C1C1C001A1A1A00C4BBB600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600E6DA
      D500343434001A1A1A001E1E1E001E1E1E001E1E1E001D1D1D0025252500F8F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8F8F800252525001D1D1D001E1E1E001E1E1E001E1E
      1E001A1A1A002F2F2F00C7BFBA00EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600E5DAD600333333001A1A
      1A001E1E1E001E1E1E001E1E1E001D1D1D0025252500F8F8F800FFFFFF00FFFF
      FF00FFFFFF00D5D5D5001212120012121200D5D5D500FFFFFF00FFFFFF00FFFF
      FF00F8F8F800252525001D1D1D001E1E1E001E1E1E001E1E1E001A1A1A003333
      3300C9C2BE00EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600938C890000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B000000000000000000938C
      8900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EDDDD600706C6A00181818002020200020202000202020002020
      20001F1F1F002020200089898900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAEAEA0088888800363636001A1A1A001B1B1B0020202000202020002020
      200020202000202020001C1C1C0039383700E0D3CD00EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600ECDC
      D60062616000171717002121210021212100212121002020200028282800F8F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8F8F800282828001F1F1F0021212100212121002121
      21001616160052515100DFD3CD00EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EBDBD6005E5E5D001717
      17002121210021212100212121002020200028282800F8F8F800FFFFFF00FFFF
      FF00FFFFFF00D6D6D6001515150015151500D6D6D600FFFFFF00FFFFFF00FFFF
      FF00F8F8F800282828001F1F1F00212121002121210021212100161616005A5A
      5A00DFD3CD00EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600CFC4BF0000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EFDED6001E1C1B000000000000000000CFC4
      BF00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600AEA6A300171717002222220023232300232323002323
      230022222200222222008B8B8B00FFFFFF00FFFFFF00FFFFFF00F3F3F300AFAF
      AF00454545001D1D1D0020202000232323002323230023232300232323002222
      220023232300222222001C1C1C0068656300EBDCD400EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600A39F9D001A1A1A00232323002424240024242400232323002B2B2B00F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F9002B2B2B002222220024242400242424002222
      22001A1A1A007A787700EBDCD400EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED6009D9A99001A1A
      1A00232323002424240024242400232323002B2B2B00F9F9F900FFFFFF00FFFF
      FF00FFFFFF00D8D8D8001818180018181800D8D8D800FFFFFF00FFFFFF00FFFF
      FF00F9F9F9002B2B2B00222222002424240024242400222222001A1A1A008483
      8300EBDCD400EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600DFD2CC0000000000000000001E1C1B00EFDE
      D600EFDED600EFDED600EFDED600EEDED6001E1C1B000000000000000000DFD2
      CC00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00DCCAC400323130002222220026262600262626002626
      260025252500252525008F8F8F00FFFFFF00FDFDFD00C4C4C400666666002626
      2600212121002727270027272700272727002626260026262600262626002626
      2600262626002525250020202000B2A5A100EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00D8C8C30039393800212121002727270027272700272727002E2E2E00F1F1
      F100F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F1F1F1002E2E2E002626260027272700282828002020
      200036363600B4A9A500EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00D4C7C2003A3A
      3A00212121002727270027272700272727002E2E2E00F1F1F100F8F8F800F8F8
      F800F8F8F800D1D1D1001C1C1C001C1C1C00D1D1D100F8F8F800F8F8F800F8F8
      F800F1F1F1002E2E2E002626260027272700282828002020200039393900B5AC
      A900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EDD6CE001E1B1A00000000001E1B1A00E5D0
      C900EFD6CE00EFD6CE00EFD6CE00E5D0C90000000000000000001E1B1A00EDD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EED6CF00988E8B002121210028282800292929002929
      2900292929002828280088888800D4D4D4007A7A7A00343434001E1E1E002828
      28002A2A2A002A2A2A002A2A2A002A2A2A002A2A2A002A2A2A00292929002929
      290029292900272727005B565500E8D3CD00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EED6CF00918B890024242400292929002A2A2A002B2B2B002D2D2D003434
      3400353535003535350035353500353535003535350035353500353535003535
      35003535350035353500343434002B2B2B002A2A2A002A2A2A00282828002323
      23006E6B6B00E8D3CD00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EED6CF008D89
      880024242400292929002A2A2A002B2B2B002D2D2D0034343400353535003535
      350035353500343434002E2E2E002E2E2E003434340035353500353535003535
      3500343434002B2B2B002A2A2A002A2A2A00282828002323230079777700E8D3
      CD00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE009389850000000000000000009389
      8500EFD6CE00EFD6CE00EFD6CE001E1B1A00000000000000000093898500EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00D9CCC60056535100282828002D2D2D002D2D
      2D002D2D2D002C2C2C003C3C3C004141410028282800282828002E2E2E002E2E
      2E002E2E2E002E2E2E002E2E2E002D2D2D002D2D2D002D2D2D002D2D2D002D2D
      2D002B2B2B0038363600BCB2AD00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00D4C9C40048474600282828002E2E2E002F2F2F00303030002F2F
      2F002F2F2F002F2F2F002F2F2F002F2F2F00303030002F2F2F002F2F2F002F2F
      2F002F2F2F002F2F2F002F2F2F002E2E2E002E2E2E002D2D2D00272727003E3D
      3D00BBB2AD00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00D0C6
      C20043434300282828002E2E2E002F2F2F00303030002F2F2F002F2F2F002F2F
      2F002F2F2F002F2F2F0031313100303030002F2F2F002F2F2F002F2F2F002F2F
      2F002F2F2F002E2E2E002E2E2E002D2D2D002727270040404000BAB2AD00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E1D3CC001D1B1A00000000001D1B
      1A001D1B1A001D1B1A001D1B1A001D1B1A00000000001D1B1A00E1D3CC00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00BCB2AD00323232002D2D2D003131
      310030303000303030002E2E2E002C2C2C002F2F2F0030303000313131003030
      3000303030003030300030303000303030003030300030303000303030002F2F
      2F0026262600928C8900E5D4CD00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00BBB3AF003F3F3F002D2D2D0031313100313131003232
      3200323232003232320032323200323232003333330032323200323232003232
      320032323200323232003232320031313100323232002D2D2D003D3D3D009994
      9200E5D4CD00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00BAB4B100424242002D2D2D00313131003131310032323200323232003232
      3200323232003232320033333300323232003232320032323200323232003232
      32003232320031313100323232002D2D2D00414141009E9A9800E5D4CD00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00D9CCC5001D1B1A000000
      0000000000000000000000000000000000001D1B1A00D9CCC500E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600B7AEA600323131003030
      3000333333003434340034343400343434003434340034343400353535003434
      3400343434003434340034343400343434003333330033333300323232002828
      280085807B00E6D7C800E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600B8B1AA00414141002F2F2F00323232003535
      3500353535003535350035353500353535003636360035353500353535003535
      3500353535003535350034343400323232002F2F2F0040404000908D8900E6D7
      C800E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600B9B4AF00444444002F2F2F003232320035353500353535003535
      3500353535003535350036363600353535003535350035353500353535003535
      350034343400323232002F2F2F004444440099979300E6D7C800E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E6D6C700CABF
      B4001D1B19001D1B19001D1B1900CABFB400E6D6C700E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC700C1B3AE00504C
      4B00303030003737370037373700373737003737370037373700383838003737
      3700373737003737370037373700373737003636360034343400413F3E00988F
      8C00E5CFC700E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC700BFB4B0004D4C4C00333333003232
      3200373737003838380038383800383838003939390038383800383838003838
      380038383800373737003232320033333300484747009E979400E5CFC700E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC700BEB5B2004C4C4C003333330032323200373737003838
      3800383838003838380039393900383838003838380038383800383838003737
      370032323200333333004B4A4A00A39D9B00E5CFC700E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600C7B5
      AF00857D7B00383838003737370038383800393939003A3A3A003B3B3B003A3A
      3A003A3A3A003A3A3A0039393900373737003838380066616000B9AAA500E3CC
      C400E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600C0B0AB00898483005050
      50003434340033333300383838003B3B3B003D3D3D003C3C3C003B3B3B003838
      380033333300343434005050500077747300B4A6A200E3CCC400E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600BAABA7008B88880054545400343434003333
      3300383838003B3B3B003D3D3D003C3C3C003B3B3B0038383800333333003434
      340054545400817F7E00AFA29F00E3CCC400E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E5CEC700C2B3AE0088807E00525150004342420036363600363636003434
      3400353535003D3C3C004E4D4D006E6A6800B0A39F00E1CCC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E5CEC700BEB1
      AC00928D8C0068686700505050003D3D3D0038383800373737003D3D3D004E4E
      4E0066666600827F7E00AEA39F00E1CCC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E5CEC700BAAFAA00989595007070
      7000535353003D3D3D0038383800373737003D3D3D00535353006F6F6F008E8C
      8C00ACA39F00E1CCC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EEDED600DED0CA00CCC1BC007E7E7E00707070006F6F
      6F0076767600BDB5B100D6CAC400ECDDD600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EEDED600DDCFC900CCC2BE00CBCBCB00C2C2C200C2C2C200CBCBCB00BEB7
      B400D5C9C300ECDDD600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EEDED600DCCE
      C800CCC3BF00D0D0D000C5C5C500C5C5C500D0D0D000BFB9B600D4C8C200ECDD
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00DDDBE2004F6ACD000E2CAC000F2B
      96000D2B9F000C2BA5000C2BA4000C2BA4000C2BA4000C2BA4000D2BA4000A2A
      A5000427A6000527A6000628A7000627A6000728A5000728A6000728A5000829
      A5000E2FA8000A2AA4004560BA00DEDBE400FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00E1E5D000589159000E660F000C6512000C6412000F66
      1500106616001066160010661600106616000F6615000B661100116617000765
      0E0008650F0004660B0005650C0003640A00016408000365090009670A000A6A
      090044984600D8E1C500FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00C0C9E7005B70C4000E2DA9000728A500102FA7001331A8001432A7001432
      A8001331A9001432AA001332AC001232AC001032AD000C30B0000A2EB000092C
      B000072BAD000529AD000328AF000228B0000625AE000A28A500576BBC00C0C6
      E100FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00C4CCEB00566C
      C7000A2AAA000C2BA8001231AE001332AD001533AC001432AB001331AC001433
      AE001433AF001132AF001032B1000D31B3000A2FB4000A2EB500082CB400052A
      B2000329B3000128B5000023B2000021A8005066BD00C3C9E500FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00516ACC000021B3001239C5001339
      C4001C40C6002245C7002144C7002144C7002144C7002144C7002144C6001B3F
      C400163ECA00183FC8000F39CE00123ACD000A36D1000835D2000835D2000935
      D2000935D3000830C200001DA0004761BB00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF0056A35700006700001379130013781300187D18002183
      2100218321002183210021832100218321001A841A001282120012821200148D
      1400148F14000F8C0F000E8A0E000B8A0B00088A08000286020002840200027B
      0200005B000049984900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF003E5ACC001E40C5000F33C200193BC4001D40C6002143C7002143C6002242
      C6002040C7001C3FC700183DC600143BC600133BCA00103BCD000F3ACD00103C
      CE000F3ACC000B38CB000634CD000231CE00002FCB000025BF001532B4003850
      AF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF003D5BD1002042
      CB001337C8001A3DC8001F41CA002244CB002445CA002343CA002143CA002144
      CC002043CD001D42CD001B42CF001842D000143FD000123ED1000F3CD1000C3A
      D0000736D1000333D100012FCF00002AC6001436BA00364FB300F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF000F36CB00133FD5001D48D700254A
      CE00284EDA002D52E2002D52E1002D52E1002A50DF00244ADF001E45DE001B43
      DD001D45DE001140DF001243E1001648E3001548E5000F41E1000A3BDD000839
      DC00093ADD000A3ADA000B36CD000E2BA300F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF000F820F00158A15001C8C1C0024872400279227002A97
      2A00329632002A962A0027962700289528002A972A0043A6430044A64400259E
      25001B9C1B0015A8150013A613000FA40F00089C0800019C0100029E02000291
      0200027C02000D6B0C00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF000029D0000E36D5001F45DB00284CDC002E50DC003154DD003155DE002E51
      DD00274CDC00224ADD001C48DC001744DC001443DF001143E0001043E2001245
      E3001247E2001146E3000B42E300053EE3000339E1000032D9000024BE000016
      A100F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00042ED4001139
      D9002147DD002B4EDE002E51DF003052DF002E52E0002F53E0003154E1003055
      E1002E55E2002B55E2002753E3002452E4001F4FE5001C4DE6001247E5000A41
      E500093FE500063DE500033AE3000034DD000025C200001AA500F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF001140DC001543E000284EDB002B51
      E2002F54E3003959E5003858E4003354E3003859E7005D7AEC007E97ED00899D
      F000889DEF007C96ED005775EB001E48E5000D41E3001548E4001648E4000C3C
      DD000637DA00103EDA00193EC9000F2FA900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00168D16001D8A1D00259625002C9A2C0031983100389B
      3800379B3700379B3700389C3800309C300049AA4900FFFFFF00FFFFFF0040B5
      40001CAB1C0023AE230013B213000CB40C000EB30E0006A30600009C0000029C
      0200018801000D6D0C00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF000F37DB001C42DD00294EE0003055E0003859E1003C5DE200385BE2003458
      E1004063E200617DE8007B95EC0089A1EE0086A0EF007190ED004F76EB002657
      E800104AE6001049E7001048E8000A44E700053DE6000237DE00002DC5000022
      AC00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00123ADD001E45
      DF002B50E1003457E200395AE3003A5BE400385BE400395CE400395EE500395E
      E500375EE500345EE600305CE6002A5AE7002457E8002154E900184FE900114A
      E9000D47E9000B44E800063FE6000238E000012DC9000124AE00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE7001543DD00224CE2003054E4003657
      E4003858E4003959E4004161E6007188F200CAD2FB00E2ECFC00FBFEFE00FFFF
      FF00FFFFFF00FBFFFE00E4EAFD00C4CDFA005F7FF0001446E4001244E4001547
      E4001143E100103ED900183EC900102FA800F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7001A8A1900229022003098300034983400389B380044A3
      44004DA74D0045A34500399D390039A039004CB54C00FFFFFF00FFFEFF0049B5
      49001FB21F001AA81A0029AF290025B7250013B613000DB20D000BAD0B00019E
      01000B860B00136D1200F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700163EDC002349DE003153E000395CE1003F60E3003A5CE2004263E300778E
      EA00BAC8F400E1E6F900F5F6FD00FAFBFE00F9FBFE00F3F6FD00DCE3FA00ACBF
      F500547DED00144DE9000944E8000E47E8000941E6000439DD00022FC6000126
      AE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700173FDE00254A
      E0003356E200385AE3004564E500889CEE00D1D9F90095A8F000284FE2003C61
      E5003D63E6003962E7003560E7002E5EE8002559E9000743E70083A2F400C7D5
      FA006A8EF100134DEA00053FE700063AE1000330CA000227B000F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE7001C46DD003557E4003A5AE4004563
      E7004361E7006780EC00E7EEFA00EEEFFA008397F2004D6AE8004E6AE8003959
      E5003051E300405FE5003E5EE4006F87F100EAEEFF00DEE3FC003D63EC000F43
      E3001649E5001341DD002144C6001734A700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700218F20002C982C003E9F3E0042A1420043A143005DAE
      5D00E6F3E600FDFEFD006EB66E002F972F0057BB5700FFFFFF00FFFFFF004BBA
      4B0015AF150050BF5000FCFEFC00E2F3E20028BA280008B1080010B41000079C
      070015891500146D1300F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E7001A42DC00294EDF003B5CE1004060E2004262E2004D6BE4009CABEE00ECEF
      FB00FDFDFE00D4DAF800A9B9F3008BA3EF0089A2EF00A7B9F400D0DBF900FDFE
      FE00E3E9FB007898F100154DE7000A45E7000A43E5000A3DDD000631C6000428
      AE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7001C43DF002C4F
      E1003B5CE3003C5DE300506DE600E5E9FC00FFFFFF00F2F4FD00A6B6F300375D
      E400375EE6003C64E7003862E7002858E8001E52E80098B1F500F0F4FE00FFFF
      FF00DDE5FC001C53EA00043EE7000A3EE2000733CA000429B100F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700214DE1003456E3004160E6004E6A
      E7004D69E600CBD2FC00F4F5FF00788DE9003F5EE4004564E7004F6CE800ADBA
      F400AAB6F3004462E6003153E3002248E0005D78F000F1F2FF00C9D1FB001846
      E3001448E5001A4AE2002244C6001734A700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E70028922700359B350040A040004CA54C004CA54C0044A2
      440066B36600EEF6EE00FBFDFB0074B974003FA23F008AD58A008BCD8B0034AE
      340064C16400F9FFF900EBF7EB0038B9380007AE070016B216000EB50E000EA6
      0E0014891400146D1300F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E7002047DC003154DF004061E2004161E2004F6BE4009CABEE00F6F7FB00EEF1
      FA009AACEF00637FE8004669E500315BE2002B59E4003663E7004D76EB0090A9
      F200F2F4FC00EDF0FB007193F000144CE7000A42E4000F42DD000C35C700082B
      AE00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7002349DF003355
      E1004262E3004766E400506DE6007E93ED00E1E6FB00FFFFFF00FFFFFF00B9C5
      F6004B6FE9002F5AE5002957E6003E69E900B0C2F700FFFFFF00FFFFFF00D7E1
      FB005A7DEF00194EE9000F45E7001043E2000C38CA00092DB100F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E7002851E0003B5BE5004A67E7004764
      E600718AF100FDFEFF00A8B8F5004764E7004A67E7004462E6005A74EA00FFFF
      FF00FFFFFF00506CE7002D50E2002B50E1001541E0008BA5F400FFFFFF005070
      EF000C42E4001949E1002244C6001734A700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700289327003C9D3C0049A449004DA64D0051A8510051A8
      510047A3470064B16400F3F9F3009BCD9B00399E39002D9E2D002D9C2D0025A1
      25008BCE8B00ECF8EC003AB63A0014A914001CB01C0014B1140010AE100015A0
      1500158915001B6D1A00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700264BDE00375AE1004060E2004968E3007A8DEA00E5E9F900F1F2FB0098A9
      EF004162E3003C60E2004063E4003D64E5003460E6002959E5001F51E5001F53
      E5008BA5F200F2F4FC00D3DDF9004772EB001147E5000D40DD00133BC7000C2F
      AE00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700294EE1003A5A
      E3004966E5004F6CE6004F6DE7003A5AE3006780EA00C9D1F800FFFFFF00FFFF
      FF00C8D3F8004E73E9004C71E900C4D1F800FFFFFF00FFFFFF00B4C6F8003C6A
      EC000037E500164CE800184BE6001646E100123BCB000D30B200F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE002D52DA004160E700526EE7004B66
      E600ADC3F400F2F6FE006B81ED004F6BE6004F6BE7004563E6005A74EA00FEFF
      FF00FAFFFE004F6BE7002E51E2002D51E2001D49E1004064EB00F3F5FE0095AE
      F0001441E3001A49E1002144C6001734A700F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE002E9C2D0044A144004DA64D004CA64C0048A4480049A4
      490049A44900409F400043A1430045A3450041A041003BA33B0033AB330036A9
      36002EA92E001BAB1B000FA60F0014A814000CA90C000F9C0F000F9B0F00199A
      19001B8C1B001C6C1B00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE002C50DF003F60E2003F5FE2005672E600A9B5F000FDFDFC00BCC6F400607A
      E8004162E3004969E4004769E4004167E6003861E500315DE6002E5BE500194C
      E4003F6AE800B2C4F500F9FBFD00839EEF001E50E400093CDB00183FC6001032
      AE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE002F52E2004060
      E4004F6CE600546FE7005471E7005772E8003E5EE5005D78E800B2C0F400FFFF
      FF00FFFFFF00CAD5F800CBD5F800FFFFFF00FFFFFF00A1B6F500305EE900073E
      E6001E52E7001A4DE6001A4CE5001B49E000173ECA001133B100F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE003356E4004764E6005570E7004865
      E500C7D1F700EBEFFC004D6AE500546FE7004C68E700405FE6005A75E900FFFF
      FE00FEFFFE004F6BE7002E51E2002B51E2002A50E2001947E200E6EBFC00B7C6
      F6000F3FE2001B49E1002144C6001734A700F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00379E350043A1430062B06200DAECDA00DAEDDA00D9EC
      D900DCEEDC00D1E8D10052A8520047A3470041A141003A9F3A00339E330031A9
      31002DAA2D0032A63200C4EAC400D0EFD000CEECCE00CCE9CC00CEF0CE0034A4
      3400158B15001C6C1B00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE003255E0004665E3004161E3006079E700C3CBF400FFFFFD009DACEF004866
      E4004766E3004867E3004667E4003F63E400365DE4002F59E3002C58E5001F4E
      E3001B4CE20087A1EF00FFFFFE00A5B8F3002856E4000939D9001D43C6001334
      AE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE003557E3004665
      E5005470E7005772E8005872E8005771E7005571E7004161E4004A67E5008DA1
      EE00ECEFFC00FFFFFF00FFFFFF00E9EEFC007D97EE002452E5001245E4002151
      E6001D4DE5001E4DE6001F4EE400204CDF001C42C9001434AF00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE003B5CE3004F6BE700546FE7004865
      E500C7D0F700EAEEFB004D6AE600546FE7004B68E7004160E6005A75E900FFFF
      FF00FFFFFF004C69E700264CE1002D52E200274FE3000F42E300E6EBFC00B9C6
      F6001240E2002950E0002144C6001734A700EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00349E33004CA54C0067B36700D9EBD900D9ECD900DDEE
      DD00DBECDB00D1E8D10052A8520047A3470041A041003BA13B0033A3330034A2
      340030A030002EA82E00C6E6C600CDEBCD00CBE6CB00CFE7CF00CFE8CF003AA1
      3A001C871C001A6D1A00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE003759E2004D69E5004965E400647CE700C4CDF400FFFEFE009CABEF004866
      E3004766E3004866E3004665E4003F61E400355CE2002F57E1002C56E3001F4C
      E2001A48E200869FEF00FFFFFF00A8BAF3002C56E3000D3BD8002145C5001535
      AD00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00395BE3004D6A
      E7005A74E8005B74E8005B74E8005972E7005670E6004260E3004A67E5008DA1
      EE00ECEFFC00FFFFFF00FFFFFF00E9EEFC007D97EE002550E4001342E2002250
      E5001F4DE400204DE400224EE400244DDF001F44C9001736AF00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6003E5DE200536EE7005D77E8004A65
      E600ACC2F400F1F6FE006B81ED004F6BE6004C68E700415FE6005A75EA00FFFF
      FF00FFFFFE004C69E600264CE1002B51E2001B49E200395CE400EEF2FC00A1BA
      F4001342E2002A50E0002144C6001733A600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED6003D9E3C0053A9530058AB580056AB56004FA74F0050A8
      50004DA74D003F9F3F0043A1430045A3450041A141003A9D3A003296320036A1
      36002A9B2A001D921D0013931300149714000D900D0018911800189118002597
      2500218821001A6D1900EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6003E5EE2005470E500546DE400647DE700B0BBF100FEFDFD00BBC4F3006078
      E6004261E2004766E3004665E3004061E300355AE1002F55E1002C54E1001945
      DF003D62E500B0BEF400FBFBFE008BA0EE002B53E1001841D8002545C4001937
      AC00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6004161E4005471
      E700617AE8006079E8005F78E8005E76E800415FE4005E78E800B2C0F400FFFF
      FF00FFFFFF00C9D2F800CAD3F800FFFFFF00FFFFFF00A2B3F300365DE5000938
      E000244EE300244DE300264FE300284FDE002345C9001A38AF00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004462E300607AE9006983EA00617C
      E900879CF200FEFFFF00A8B7F5004663E6004B68E7004160E600546FE800FFFF
      FF00FFFFFF004C69E700264CE1002B50E2001C44E1008BA5F100FBFFFC00657F
      E300284DE3002B50DF002144C6001733A600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600429E40005CAE5C0066B4660068B5680066B466005AAD
      5A004DA64D0068B36800F3F9F30095CA9500319931002D962D00259225002392
      23008BC48B00EEF8EE003DA33D001A921A002599250025982500259925002997
      2900218521001A6D1900EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6004261E2005A75E600617BE600637CE600899BEC00EBEDF900EEEFFA0094A4
      EE00425FE2003E5DE100405FE1003C5DE2003356E1002A4EDF002049DE001D45
      DE00869BED00F0F2FB00DBE0F9005674E600264DDF00244AD9002646C4001B38
      AC00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6004665E5005A76
      E7006780E800657FE900607AE8004763E5006D83EB00C9D1F800FFFFFF00FFFF
      FF00C8D0F7004E6BE6004A69E600C4CEF600FFFFFF00FFFFFF00BAC7F6004063
      E5000634DE00254CE2002B51E2002C51DD002647C7001C39AD00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600425FE300617BE9006983EA006983
      EA00647FEA00D5DDFC00F2F1FD008192F0004261E6004160E700526EE800AFBC
      F400ABB9F3004463E6002B4FE2001E46DF00516FEA00F0F2FF00CAD1FB002B4F
      E2002C51E3002B50DF002144C6001733A600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600439F420062B162006EB76E0066B3660068B468005CAE
      5C006AB46A00EFF7EF00FAFCFA0076BA760041A1410091C9910092C992003398
      330064B16400FAFDFA00EAF5EA0040A4400020932000289828002D992D002D96
      2D00218221001A6E1900EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6004563E4005E78E6006F86E9006880E8006981E800ACB9F100F8F8FC00E9EB
      FA0095A3ED005E78E6004361E1003354E0002E51E0003658E0004A68E300889B
      EC00ECEDFB00F2F4FB00859AED002B51E000264CDF002D50D8002646C2001C39
      AB00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6004866E5005F7A
      E9006F87EA006883EA006881EA00899BEE00E4E8FB00FFFFFF00FFFFFF00BAC5
      F5004D69E5003153E1002A4EE1003F5FE300B1BEF400FFFFFF00FFFFFF00DAE1
      F900607CEA002E53E3002A4EE1002D51DC002747C6001D3AAD00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004C68E4006781EA006E85F2006681
      EB00647EEA007E96EF00EDF6FB00F8F8FF008B9DF3004B68E7003E5EE600284B
      E3001F43E1003051E2003859E2006F87F100E9ECFC00E6EEFA004D6DE900254B
      E1002B51E3002A50DF002144C7001733A600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED60049A3480061B0610075BA750073BA730067B3670077BC
      7700F0F7F000FBFDFB0075BA7500399D39005CAE5C00FFFFFF00FFFFFF004FA7
      4F001F8E1F005CAC5C00FAFCFA00ECF6EC0045A54500279527002B992B002D96
      2D00218221001A6E1900EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6004A68E400657EE800798FEA00738AE9006881E8006B83E800ADBAF100F1F2
      FC00FBFBFC00C9D2F6009FADEF008699EC008699EC009EAEF000C7CFF500FCFB
      FD00EBECFB008C9EED003054E100274EDF002E51DF002F52D8002646C2001C39
      AB00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6004E6BE6006680
      EA00768EEC006B86EA00728AEB00EAEDFB00FFFFFF00F2F4FD00ADBAF300415D
      E400405EE3004362E4003D5DE4002F51E100264AE0009FAEF100F0F3FD00FFFF
      FF00E1E6FA00375CE400264CE0002F51DC002748C7001D3AAD00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00506BE5006F88E8008597E7006E87
      E5007D91DF006881EC007D97ED00CED8F700DBE2FB00C0CEFC0098AAF2008599
      EF008498EF008B9EEC00B8C8F100D9DEFC00CAD4F7005D7CE800284CE1002F52
      E2003154E4002F52E0002145C9001734A800EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE004CA34A0078BE78007CC27C007DC37D0074BA740083C1
      8300E6F3E6007EBF7E0050A850004FA74F0060AF6000FFFFFF00FFFFFF005AAE
      5A00399C39002993290063B06300DEEFDE0053A953002E962E00319731003296
      3200208220001A6D1900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00526EE4006F88E9008499EB008195EA00778CEA00657EE700667FE70093A4
      EE00CED5F600EAEDFA00F6F6FB00F9F9FD00FAF9FD00F6F7FC00E5E8FA00C1CA
      F400748AE9003757E1002B51DF003456E0003356E0002F52D8002644C1001B38
      AA00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE005370E7007089
      EB008399ED007A92EC00768EEB00A2B2F100DBE1FA00A5B3F3004361E500526D
      E700516BE5004C68E4004765E4004361E4003A5AE3002145E00093A5EF00D0D8
      F9007F95ED00375AE3002E51E0002F52DC002748C7001C3AAD00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE005771EC007F92E7009DAAF30098A7
      EE008D9EEE007A8FEC006E85E600647EE600647DEC0089A1F100A9BAF300AEBB
      F400B6C2F500A2B3F2007F98F000526CE800415FE5004664E7004865E7003F5E
      E5003A5AE5003154E0002043C6001632A500EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE0059AA580085CA850096D796008AD38A0084CC840078BD
      78006BB66B0066B4660068B5680060B1600072B97200FFFFFF00FFFFFF006AB4
      6A004EA74E0054AA54004BA54B00379C370044A344003EA03E003A9D3A003296
      3200208220001A6D1900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE005874E5007E92EC0097A7EF0091A3EE008397EC007A8EEA006C84E800637D
      E6006D84E800869AEB009DADEE00A8B6F100A6B5F10097A8EE00798EEA005772
      E5004463E2004262E3004263E3003D5EE200375AE1003051D8002240C1001431
      A700EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE005A75E8007D93
      ED0094A7F0008DA1EF008095ED00748CEB006A84EA006780EA00647EE900607A
      E8005C76E7005972E8005671E800546FE7004F6BE6004E6AE6004765E5004060
      E3003F5FE4003C5EE3003759E2003153DC002343C5001634AB00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE005770E40093A3EF00A3AFFB00A7B3
      FF0093A3ED008496EC007C90EA006D85EE006782E900647EE9005E79E9005875
      E8005E7BE9005874E7005D77E8005873E7005671E700546FE7004967E700405F
      E6003657E5002C51E1002245C8001430A800E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE005CAB5B0085CB8500A3DCA300A0D9A00092D692007ABF
      7A007BBD7B0076BB760068B5680068B568006CB76C007EBF7E007CBE7C0067B4
      67005EAF5E0059AC590059AC590051A851004AA54A003D9E3D00379A37003197
      31002285220011670F00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE005673E6008498ED00A6B3F200A0AFEF008EA2ED008296EA00788EE9007088
      E9006881E800617BE6005C76E5005773E5005572E5005570E5005470E5005572
      E6005572E6005370E5004C6BE4004464E3003C5DE1002E4FD800173ABE000626
      A300E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE005F7AE800879C
      EE00A3B3F1009BADF1008B9FEF007D94EC00728BEB006F88EB006F87EB006B83
      EA006982E900667FE900657EE900637CE9005F79E8005D78E9005470E7004D6B
      E6004A69E5004565E4003D5EE4003052DD001C3EC4000C2BA700E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE007792EC00647CED008F9FFB008C9E
      F4008195E9007288F1006680EA00607AE900627CE900627CE900607AE9005B75
      E800637DE900526EE7004F6CE700516CE700506BE7004663E600415FE6003254
      E3002D51E3002A4ED9000E31B6005169CA00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE0080BF810069B9690091CE910087CB870080C8800073BA
      73006CB66C0066B3660060B0600060B060005FAF5F0054AA54004DA74D0053A9
      530055A9550050A850004CA64C0048A348003E9E3E00369B36002D9A2D002890
      280010711000428E4300E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE007A8FEA008197EB008DA0ED008C9FED007D92EB007089E8006B82E8006780
      E700617CE7005D77E7005872E6005571E6005370E600526FE500506FE400516F
      E4004F6DE4004969E3004263E3003A5EE2003255DF002145D4002848C300445D
      BB00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE008498ED008B9E
      EF0091A3EF008B9FEF007F94ED00728BEA006C86E9006681E900637CE900627C
      E9005F7AE9005D77E8005C76E8005A76E7005672E8005470E600506DE6004C6A
      E6004565E5003E5FE3003357E300264BD9002D4DC900445DBD00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E2E3E5007F9BEE00556FEA00516D
      E6004D69E6004968E3004563E3004663E4003D5DE2003D5DE2003D5DE2003E5E
      E2003D5DE200395AE2003A5AE2002F56E3003156E3002F54E2002B52E200234F
      E200224FE3001C43D2005974CC00D9D6DF00E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600DEE1CC007CBF7C0052A8510053A8520050A64F0047A1
      4500429E4000439F4100429E4000419E3F00409D3F003F9C3E00409D3F00379D
      3600369D3500339A320032943100349D33002A93280025912400239122001F89
      1E0050A25000DCE0CA00E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600CFD5F4008EA0EB00627BE5005F7AE6005B74E5005570E300516CE3004C6A
      E3004867E2004866E2004867E2004866E2004664E2004261E1003F60E0003C5C
      DF003A5ADE003759DE003456DE002D51DD002046DA001E41CF006378D300C3C8
      E700E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600D4DBF80092A5
      F000647EEA00607AE9005873E800516EE6004D6AE5004866E4004563E4004765
      E4004262E5004161E4004060E4003E5EE3003D5EE3003859E2003558E2003457
      E2003154E2002B4FE0002147DE001B40D2006077D700C7CDEB00E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900E4DEDC00E4DEDD00E4DEDD00E4DE
      DD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DE
      DD00E5DFDD00E7E2E000EBE6E500EDEAE900EFECEB00F0EDEC00EFECEB00EDEA
      E900EBE7E500E7E2E000E5E0DE00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E4DFDD00E5DFDD00E5DFDD00E5DFDE00E5DFDE00A55A
      390000000000A55A3900E4DEDC00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DE
      DD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E5DFDD00E7E2
      E000EBE6E500EDEAE900EFECEB00F0EDEC00EFECEB00EDEAE900EBE7E500E7E2
      E000E5E0DE00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E5DFDD00E5DFDD00E5DFDE00E5DFDE00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E5DFDD00E5DFDD00E9E4E300F1EE
      ED00F8F7F600FDFCFC00FEFEFE00FEFEFE00FEFEFE00FFFFFE00FEFEFE00FEFE
      FE00FEFEFE00FDFCFC00F8F7F600F1EFED00EAE5E300E6E0DE00E6E0DE00E6E0
      DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E5DFDD00E5DFDD00E9E4E300F1EEED00F8F7F600FDFC
      FC00FEFEFE00FEFEFE00FEFEFE00FFFFFE00FEFEFE00FEFEFE00FEFEFE00FDFC
      FC00F8F7F600F1EFED00EAE5E300E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0
      DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00EAE5E400F4F2F100FCFCFB00FEFE
      FE00FFFEFD00FBF9F800ECEAE700DEDAD500D3CEC800D0CAC400D3CEC800DEDA
      D500ECEAE700FBF9F800FFFEFD00FEFEFE00FCFCFB00F4F2F100EBE6E500E6E0
      DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00EAE5E400F4F2F100FCFCFB00FEFEFE00FFFEFD00FBF9
      F800ECEAE700DEDAD500D3CEC800D0CAC400D3CEC800DEDAD500ECEAE700FBF9
      F800FFFEFD00FEFEFE00FCFCFB00F4F2F100EBE6E500E6E0DE00E6E0DE00E6E0
      DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900E4DEDC00E4DEDD00E4DEDD00E4DE
      DD00E4DEDD00E4DEDD00E5E0DF00F1EEEE00FCFBFA00FEFDFC00FAF8F600E2DD
      DA00B6B0BC008580AB006763B7005350C8004342D6003D3CDB004240D600504E
      C8006460B700817DAB00B4AFBC00E2DCDA00FBF8F600FEFDFC00FCFBFA00F2EF
      EE00E7E1E000E5DFDD00E5DFDD00E5DFDE00E5DFDE00E5DFDE00E5DFDE00A55A
      390000000000A55A3900E4DEDC00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DE
      DD00E5E0DF00F1EEEE00FCFBFA00FEFDFC00FAF8F600E2DEDA00BBBEB50093A7
      960081A9930077B196006FB798006CB999006EB6980075B095007FA8910091A6
      9500B9BEB400E2DEDA00FBF8F600FEFDFC00FCFBFA00F2EFEE00E7E1E000E5DF
      DD00E5DFDD00E5DFDE00E5DFDE00E5DFDE00E5DFDE00A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900E4DEDD00E4DEDD00E4DEDD00E4DE
      DD00E4DEDD00E8E3E100F6F3F100FEFBFA00FAF5F300DFD8D600A19BAF006864
      BA004644DC003838F6003333FD003232FD003232FD003232FD003232FD003232
      FD003232FD003434F6003F3DDC005F5BBA009D97AF00DED8D600FAF5F300FEFB
      FA00F6F3F200E9E4E200E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DEDD00E4DEDD00E4DEDD00E4DEDD00E8E3
      E100F6F3F100FEFBFA00FAF5F300DFDAD500A9B0A40082AB950072BC9E006FCB
      A9006DCFAB006CCEAA006CCEAA006CCEAA006CCEAA006CCEAA006CCEAA006CCB
      A7006DBA9B007CA99100A6AFA200DFDAD500FAF5F300FEFBFA00F6F3F200E9E4
      E200E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E8E2E000F7F0EE00FBF4F200F2EAE700BCB5BA00706CAB004D4CE7003D3D
      FC003838FD003737FD003737FD003737FD003737FD003737FD003737FD003737
      FD003737FD003737FD003737FD003737FC003F3EE700635FAB00B9B2BA00F2EA
      E700FBF4F200F7F0EE00E9E3E100E6E1DF00E7E1DF00E7E1DF00E7E1DF00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E4DFDD00E8E2E000F7F0
      EE00FBF4F200F2EAE700BFBEB50084A38F007AC5A80073D0AF0070D0AD006FCF
      AC006FCFAC006FCFAC006FCFAC006FCFAC006FCFAC006FCFAC006FCFAC006FCF
      AC006FCFAC006FCFAC0070C2A2007B9F8900BDBDB400F2EAE700FBF4F200F7F0
      EE00E9E3E100E6E1DF00E7E1DF00E7E1DF00E7E1DF00A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E6E0
      DE00F1E9E700F4EBE900ECE3E100A9A2AA006A68CA004E4DF8004040FD003C3C
      FD003C3CFD003C3CFD003C3CFD003C3CFD003C3CFD003C3CFD003C3CFD003C3C
      FD003C3CFD003C3CFD003C3CFD003C3CFD003C3CFD003D3DF8005250CA00A29B
      AA00ECE3E100F4EBE900F2EAE800E7E1DF00E7E1DF00E6E1DF00E6E1DF00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E6E0DE00F1E9E700F4EB
      E900ECE3E100ADAEA40089B8A1007FD2B40077D1B10074D1AF0073D1AF0073D1
      AF0073D1AF0073D1AF0073D1AF0073D1AF0073D1AF0073D1AF0073D1AF0073D1
      AF0073D1AF0073D1AF0073D1AF0073CEAD0077B29700A9ACA100ECE3E100F4EB
      E900F2EAE800E7E1DF00E7E1DF00E6E1DF00E6E1DF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7E4E9004F9E
      D5000D73B7000667B2000B6CB3000F70B5001072B7000F70B5001072B6000F72
      B6000C79BD000C7DBF000D80C1000C81C1000783C2000881C1000881C1000783
      C4000484C600057EC1000D80C1000A79BE004893CE00DEDAE500FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E9E2
      DF00ECE4E200E4DBD900A9A2A4007170DA005656FC004646FD004242FD004242
      FD004242FD004242FD004242FD004242FD004242FD004242FD004242FD004242
      FD004242FD004242FD004242FD004242FD004242FD004242FD004242FC004D4B
      DA00A29BA400E4DBD900ECE4E200EAE2E000E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E9E2DF00ECE4E200E4DB
      D900ACA9A00091C5AF0086D6B9007BD3B40078D2B20078D2B20078D2B20078D2
      B20078D2B20078D2B20078D2B20078D2B20078D2B20078D2B20078D2B20078D2
      B20078D2B20078D2B20078D2B20078D2B20078D2B10077BCA000A7A89D00E4DB
      D900ECE4E200EAE2E000E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF0052AEE9000481
      CF001793DA002095E2001F93E2001F94E3002297DF001F94DF002297E500219E
      E10020A1DE0018A7DF001BABE30018ACE30013AFE5000DB7EB000FB3E90009BC
      F00009BAEF0006B2EB0006B4EB0006A2E000007BC5004C93CA00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900E4DFDD00E4DFDD00E4DDDB00E5DB
      D900E2D8D500AAA2A200817FCB006363FC004F4FFD004D4AEE004F4AE8004848
      FC004848FD004848FD004848FD004848FD004848FD004848FD004848FD004848
      FD004848FD004848FD004848FD004848FC004E49EA004E4AEB004848FD004848
      FC005654CA00A49BA200E2D8D500E5DBD900E6DEDC00E7E1DF00E7E1DF00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E4DDDB00E5DBD900E2D8D500ACA8
      9F0098BDAA008FDABF0081D5B7007DCBAD007EC8AA007CD3B4007CD4B4007CD4
      B4007CD4B4007CD4B4007CD4B4007CD4B4007CD4B4007CD4B4007CD4B4007CD4
      B4007CD4B4007CD3B4007CC9AB007DC9AB007CD4B4007CD4B4007AB39900A7A6
      9C00E2D8D500E5DBD900E6DEDC00E7E1DF00E7E1DF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF000F9AE500159F
      F7001AA1F60027A1F00028A6F8002AA6F5002FADFA0030AEFB002DACFC002EAD
      FB0033B2FB002AB4FB0024AFFA002DC5FA002DC9FA0028CDFD001CD8FD0011D2
      FC000BC9F9000BCBF90009CAF9000AC0F20006A2DE000C79BC00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900E4DFDD00E3DDDB00DED6D400DDD3
      D000C3BAB600918EB6007E7EFB005D5DFD005551EF007554820077557C005250
      F200504FFB004F4FFD004F4FFD004F4FFD004F4FFD004F4FFD004F4FFD004F4F
      FD004F4FFD004F4FFD00504FFB005350F10073537F0075547B005450EE004F4F
      FD005050FB006C69B500C1B8B600DDD3D000DFD7D400E6DFDD00E7E1DF00A55A
      390000000000A55A3900E4DFDD00E3DDDB00DED6D400DDD3D000C3BBB6009FB1
      A300A1DFC9008AD8BC0082CDB100868F7C00888C7A0081CFB20081D4B60081D5
      B70081D5B70081D5B70081D5B70081D5B70081D5B70081D5B70081D5B70081D5
      B70081D4B60081CEB100848C7A00868B780081CCB00081D5B70081D4B60084A9
      9300C2BAB500DDD3D000DFD7D400E6DFDD00E7E1DF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF001CA1F9001DA5
      FD0028AAFE002BACFE002FAEFD0036B2FE0036B2FF0034B1FE0034B1FE0035B1
      FF002DB8FE0029C1FE0024C9FE0026C7FE001DD2FF0015DDFE001ADCFF001CDC
      FE001DDEFF0015D3FB0007C2F40009C9F90008B6ED001087C400F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900E5DFDD00DFD8D600D8CDCA00D5CA
      C8009F989E009594E8007575FD005C5CFC006C56A900835858006457C8007557
      89006956B7005656FD005656FD005656FD005656FD005656FD005656FD005656
      FD005656FD005656FD006555BC00745583006357CD00805659006E56A1005756
      FC005656FD005C5BE7008D869E00D5CAC800D8CDCA00E1D9D700E7E2DF00A55A
      390000000000A55A3900E5DFDD00DFD8D600D8CDCA00D5CAC800A3A39900ADD6
      C5009CDEC6008AD7BC0086A690008A78690087B8A0008994810087AE970086D7
      BA0086D7BA0086D7BA0086D7BA0086D7BA0086D7BA0086D7BA0086D7BA0086D7
      BA0085B09900868F7D0087BCA2008877680087A18C0086D6B90086D7BA0084C9
      AE00969F9100D5CAC800D8CDCA00E1D9D700E7E2DF00A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7001DA1F9001DA4
      FC002EAEFD0032AFFD0037B1FE003DB5FE003AB2FE0049B9FE006AC6FD00AADD
      FC00C5EEFE00BFEAFF00BBF0FE00C3EDFD009CE1FB0045D4FD001CDAFE0018DA
      FE001BDCFE0019D9FD0016D5FC000AC9F8000ABAEE00108DC900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900E4DEDC00D7CECB00D1C6C300BDB4
      AE009F9CBB009696FC007373FE00645FE6007F586400755B99006F5AAD008459
      5B006C5CC000705AAB00625DE9005E5EFE005E5EFE005E5EFE005E5EFE005E5E
      FE00605CED006C57A7006A5CC60080575F00715AA500725AA00080576100645D
      E2005E5EFE005F5FFC006F6CBA00BDB4AE00D1C6C300D7CECB00E5E0DE00A55A
      390000000000A55A3900E4DEDC00D7CECB00D1C6C300BDB4AE00A9B8AC00B3E5
      D2009BDDC5008CCBB100897E6E008B9E8A008AA994008B7A6B008BB59D008AA8
      92008BCCB1008CD9BC008CD9BC008CD9BC008CD9BC008CD9BC008ACEB30086A4
      8F008BB8A000887B6B008AA48F008AA18D00897C6C008BC9AE008CD9BC008CD8
      BC0087AD9800BDB4AE00D1C6C300D7CECB00E5E0DE00A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE70021A4FA002DAD
      FD003DB4FE0040B6FE0040B6FE0049B9FE0083CEFC00F1F9FE00E1F2FD00A2DA
      FB006AC9FD0045CEFD0051C9FE006DD0FD00A0DBFB00EEF4FC00E6F4FE004AD2
      FE0011DAFE001CDCFE001CDCFE000BCAF90009BBEF00128AC600F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900E1DAD800CDC2BF00CBC0BD00A39B
      9400B4B3EA009494FE007575FE00705FB500825960006E62CD0082596100785F
      A100755EA800865951006B62D8006565FE006665F9006865F1006765F7006565
      FE006962DF007A524F00745DA100755FA80083585A006E62CD00815963007460
      B1006565FE006666FE006D6CE9009E959400CBC0BD00CDC2BF00E2DCD900A55A
      390000000000A55A3900E1DAD800CDC2BF00CBC0BD00A49C9300C4DED300B3E5
      D3009CDEC6008CAE98008B7C6D0090BEA6008B7D6D008EA38F008DA892008B74
      66008FC4AB0091DABF0091D7BD0091D3B90091D7BC0091DABF008EC7AE00806D
      60008CA28E008EA793008A7869008FBEA600897D6E008EAD970091DABF0092DB
      BF0092CEB500A09B9100CBC0BD00CDC2BF00E2DCD900A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E70022A4FA0038B2
      FE0040B5FE004BBBFE0046B9FE0068C4FD00E7F5FC00D6EFFD005EC1FC0042B8
      FE0045BAFE003EC2FE0041C4FD003AC4FE002DC6FE0068CFFC00FEFBFD00B3E4
      FC001DD6FD0017DCFE001ADDFE000DC7F6000EB3E900118BC700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900DBD4D200C6BAB600C4B8B500A19B
      9900BBBBF6009696FE007A7AFE007A5E8800805E7D007566C300865951007468
      CE00835C68007D6298006E6EFD00716AE000816392008C63720087658D00746B
      DD006E6EFD00745F9E007F5961007468CE00845852007766BB007E5E83007F5E
      80006E6EFE006E6EFE007373F6008D879900C4B8B500C6BAB600DDD6D300A55A
      390000000000A55A3900DBD4D200C6BAB600C4B8B500A3A09600CCE9DE00B4E6
      D4009FDFC8008A9381008E8E7D0091B8A3008B73650093BFA9008C827200909F
      8C0096DCC30094CAB300939D8A00978D7C00979D8A0096CAB20096DCC3008A9F
      8D00887C6C0093BFA9008A74660092B49F008D9180008D907F0096DCC30096DC
      C30098D8C000959B8E00C4B8B500C6BAB600DDD6D300A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E70026A7FA0038B2
      FE0046B9FE004CBBFE004CBAFE009FD9FC00FAFCFD007DCCFC0047B9FE0049BB
      FE004CBAFE0042BEFE0032C9FD003BC5FD002DCBFD0022C7FD0095DEFD00FFFF
      FE0047DDFE0014D9FE0022D9FE001FCCFA000DB5EA001489C300F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE000000
      0000EFB53900E7B53100EFB53900EFB53900EFB53900E7B53100F7DE8400E7C6
      3100E7C61800E7C61800E7C61800E7C61800DEC61800DEC6180000000000F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900D7CECB00C0B2AF00BFB2AE00A5A0
      A400C2C1FB009C9CFE008181FE007E5B6C007F659C007D66A200845E6A007A6B
      C400855B5D007A6FD4007573F400805E7700915E470097614A0097614A008D65
      75007773F000766ED80081595B007C6BBF00825E72007F669D007D67A400845D
      66007575FE007575FE007B7BFA00847FA300BFB2AE00C0B2AF00D8CFCC00A55A
      390000000000A55A3900D7CECB00C0B2AF00BFB2AE00A8A99F00D2EEE300B8E8
      D600A5E1CB008982730092A2900092A593008E83740096BAA6008C7B6C0098C4
      AF009AD8C1008C8A7A00937365009977680099776800988F7E009BD6BF0096C6
      B0008878690096B7A3008D88780093A3900092A694008D8071009CDEC6009CDE
      C6009FDDC60090A19100BFB2AE00C0B2AF00D8CFCC00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE0034AEFC003DB5
      FE004EBCFE0056BDFE0053BCFE00C1E7FC00D8F0FD0059BFFD004ABAFE0049BB
      FE004DBBFE004CBFFE003CC2FE003BC4FE0030CAFD0024C9FD004FD8FD00FFFA
      FD008DD9FD0016D2FC001EC6FB0016B9F6001AABE2001787C300F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE000000
      0000E7B53100EFB53900EFC66B00EFC66B00EFC66B00EFBD4A00EFBD4A00F7DE
      8400E7C63100E7C61800E7C61800E7C61800DEC61800D6BD180000000000F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900D2C8C500BAACA800BAADA900AAA6
      AB00CBCBFE00A6A6FE008B8BFE007F595D00826DAB008268990085637A008071
      C000865D5F007F78E1007D77E2007F5754008C5A450095604900956049008E60
      57007F76D9007D79E900845C6100826EAF008464820085668A00816CA900865D
      62007E7EFE007E7EFE008585FD00827EAA00BAADA900BAACA800D3C9C700A55A
      390000000000A55A3900D2C8C500BAACA800BAADA900ADAFA500D9F2E900BFEA
      DA00ACE3CF0086786A0097AC9A0093A08F00918D7E0099B9A6008D7C6E009FCE
      B9009CCDB800847264008E6F61009775670097766700937C6C009DC9B4009ED2
      BD008B7C6E0098AF9C00919382009397870096AA98008E7E7000A2E0CA00A2E0
      CA00A7E1CC0091A69500BAADA900BAACA800D3C9C700A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE0034AEFC004BBA
      FE0057BEFE0056BDFE0054BCFE00DBF0FC00D2EDFC005DC0FD004CBAFE0049BB
      FE004EBCFE0050C0FE003DBDFE0036BFFE0030C9FD002AC7FD0049C9FB00E3F0
      FC009BDCFD001FCBFC0023CBFA002BBCFE001EA7EC001D89C400F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE000000
      0000FFEFC600FFF7E700FFF7DE00FFF7DE00FFF7DE00FFEFC600FFEFC600EFC6
      6B00EFBD4A00EFB53900EFB53900EFB53900E7C61800E7C6180000000000EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900D0C6C400B6A7A300B8AAA500ADA9
      AB00D5D5FE00B3B3FE009797FE00815E6B00866C9A00866FA300876068008678
      C500865D5D00877CD5008583F3007C5D70007E513E0086564200875742008361
      6F008583F100857CDA00885E5E008777C10087637300886E9D00866FA5008860
      65008686FE008787FE009090FD008884AA00B8AAA500B6A7A300D2C7C400A55A
      390000000000A55A3900D0C6C400B6A7A300B8AAA500AFB0A700E1F4ED00C8ED
      E000B5E6D4008981730097A2910099A898008F8374009EBEAB008D7B6D00A2C8
      B500A6DBC7008783740080635700886A5D00896B5D008D857700A6DAC600A1CB
      B8008E7C6E009FBBA90092897A009AA5940099A9980090817300A8E2CD00A9E2
      CE00AFE4D10095A79800B8AAA500B6A7A300D2C7C400A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE0034AFFC004EBA
      FE005CC0FE0062C3FE005ABFFE00CCE6FB00DBF1FC0060C0FC004EBBFE0045B9
      FE005BC1FE00EDF7FE00F3FAFE004BC6FD0030C3FE0027BFFD0051CDFC00F6F6
      FC0091D9FC001AC4FA0031C1FE002BB1FA0023A6E3001C87C100EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6000000
      0000FFEFC600FFF7E700FFF7DE00FFF7DE00FFF7DE00FFEFC600FFEFC600EFC6
      6B00EFBD4A00EFB53900EFB53900EFB53900E7C61800E7C6180000000000EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900D1C8C500B3A39F00B6A8A300ABA6
      A300DDDDFB00C1C1FE00A5A5FE00856B8800866578008C7CC100875A4E008C80
      CF0088616700896F98008E8EFD008B85E20080688B007D5B6400826889008A83
      DC008E8EFD008871A000886163008C80CF00895D53008C7BBC008A6A83008B6A
      82008E8EFE009191FE009B9BFA00918CA200B6A8A300B3A39F00D3C9C600A55A
      390000000000A55A3900D1C8C500B3A39F00B6A8A300ACAAA100E6F4EF00D2F0
      E500BEE9D90092958600918C7D00A2BDAB008A726400A5C6B3008F82730099A2
      9100AEE4D000A6D1BE008E958600857B6E0090948600A5CDBB00AEE4D00099A6
      960090807100A5C6B4008E766800A2BAA8009695850097948400AEE4D000B0E4
      D200B7E5D40099A39600B6A8A300B3A39F00D3C9C600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6003CB2FB0056BF
      FE0063C3FE0063C3FE005FC1FE00B7E0FB00FDFBFD007ECCFD0049BAFE0045B9
      FE005BC1FE00F0F6FD00F6FBFE0051BDFE002EBBFE0024B7FD007FD5FE00FFFF
      FF005FC2FE0024AFFD002CA9FE002FAFF90028A5E1002083C100EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900D5CDCA00B1A19B00B4A6A000A39C
      9500E4E4F700D1D1FE00B5B5FE009283B600835C5B009285CB00896160008E75
      9C008F7BAD0082584D009088D9009696FE009594F9009491F1009594F8009696
      FD009089DC007C554D008C76A3008E77A4008B605B009285CD008B626300907B
      B0009696FE009C9CFE00A8A7F60097909500B4A6A000B1A19C00D7CFCC00A55A
      390000000000A55A3900D5CDCA00B1A19B00B4A6A000A49E9500E9F3EE00DEF4
      EC00CAEDE000A3B5A70089786A00A8C4B4008F7E70009DA69600A1B0A000866F
      6200A9CCBB00B3E6D400B2E2D100B0DDCC00B2E2D000B3E6D400A9CEBD00816C
      5F009CA999009EAB9B00907B6E00A8C6B50091817200A2B3A300B4E6D400B8E7
      D700BEE4D6009B9B9000B4A6A000B1A19C00D7CFCC00A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED60042B4FB005EC1
      FE0066C4FE0062C2FE0060C2FE0083CFFD00F4FAFC00D4EAFB005DBFFD0043B9
      FE0055BDFE00ECF4FD00EFF7FD004DBAFE002CABFD0052BBFD00E7F4FD00D0ED
      FC0035AFFC0027A9FD002BADFE002EADFB00279EE4002383BE00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900DCD6D300B1A09B00B1A19C009D93
      8A00E2E1EA00E0E0FE00C7C7FE00AAA5E700836062008F7697009581AF00875E
      59009485BF00907DAB009B97EC009E9EFE009E9EFE009E9EFE009E9EFE009E9E
      FE009B97EE008D7AA8009285C100845D5A00937CA600937BA1008C6362009A94
      E300A0A0FE00AAAAFE00B2B1E9009A908A00B1A19C00B1A19B00DED7D500A55A
      390000000000A55A3900DCD6D300B1A09B00B1A19C009D938A00E5E9E500E9F7
      F200D7F1E800BDDCCF008A7C6F009CA29400A5B3A4008C786B00A6BCAD00A0AF
      A000B3DBCB00B9E8D700B9E8D700B9E8D700B9E8D700B9E8D700B3DCCD009CAB
      9D00A5BDAE0089786A00A1AC9E00A1AA9B0092807300B2D6C600BBE8D800C2EB
      DC00C2DED2009B928900B1A19C00B1A19B00DED7D500A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED60046B6FB0063C3
      FE0076CAFE006BC6FE0072C8FE0065C3FE00AADDFC00FFFEFE00CDE9FB0055BE
      FD0057C0FE00EDF5FD00F1F8FE0045B7FD0048B9FD00DEF2FD00F4FAFD005DC0
      FD0023A9FD002BACFD002DADFE002FADFC002698E3002481BC00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900E3DEDC00BBADA800AC9B9500AB9E
      9700BFBCBA00ECECFD00DADAFE00C1C1FD009A89AA00815952009A8DC5008E73
      8A009483B000A5A5FE00A5A5FE00A5A5FE00A5A5FE00A5A5FE00A5A5FE00A5A5
      FE00A5A5FE00A5A5FE009485B700896E82009A8DC900885F58009680A500A6A6
      FC00AEAEFE00BBBBFC00A6A3B900AB9E9700AC9B9500BBADA800E5DFDD00A55A
      390000000000A55A3900E3DEDC00BBADA800AC9B9500AB9E9700C0BFB800F1F9
      F600E4F6F000D3F0E600A7B0A40085716400ADC2B4009A998B00A4B2A400BFE9
      DA00BFE9DA00BFE9DA00BFE9DA00BFE9DA00BFE9DA00BFE9DA00BFE9DA00BFE9
      DA00A5B6A90093918500ADC4B6008D786A00A4AD9F00BFE9DA00C5EBDD00CEED
      E200AFB9AE00AB9E9700AC9B9500BBADA800E5DFDD00A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED60047B7FB006EC7
      FE0078CAFE0077CAFE0076CAFE006EC7FE0069C5FE00ABDDFC00DFF1FC006AC5
      FC0056BFFE00ECF5FD00F2F9FE0045B8FE006CC4FC00D7EAFA0069C5FD0024A9
      FD0029ABFD002BACFD002DAEFE0029AAFC002698E3002581BC00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900E4DFDD00CDC2BF00A8969000B3A4
      9F00A59D9500E4E3E900EAEAFF00D6D6FF00BFBCF1008F738000896B7600A9A6
      F100ACABFC00ADADFF00ADADFF00ADADFF00ADADFF00ADADFF00ADADFF00ADAD
      FF00ADADFF00ADADFF00ACABFC00A9A6F100896D7E008A6C7700AAA6EE00B3B3
      FF00BFBFFF00C2C1E9009E969500B3A49F00A8969000CEC4C000E6E1DF00A55A
      390000000000A55A3900E4DFDD00CDC2BF00A8969000B3A49F00A59D9500E6E9
      E600F0FAF600E1F5EE00CFE7DC0096908500918A7D00BFE2D300C3E9DB00C4EB
      DD00C4EBDD00C4EBDD00C4EBDD00C4EBDD00C4EBDD00C4EBDD00C4EBDD00C4EB
      DD00C3E9DB00BFE2D400928E8200928B7E00BFE0D200C8EDE000D1F0E400CEE1
      D800A09C9200B3A49F00A8969000CEC4C000E6E1DF00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE004EB8FC0078CA
      FD0082CEFD0080CDFD0080CDFD0079CAFE006FC7FE0066C4FE006FC7FE005AC0
      FE0063C3FE00FCFAFD00FFFEFE0056BDFE004CB9FE0051BCFD0031B0FD0032AF
      FD0034B0FD0032B0FD0031B0FE002FACFC002498E400217EBB00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900E5DFDD00DFD7D500B1A19C00AB9A
      9400AC9F9800BCB8B300F4F4FD00E8E8FF00D8D8FF00C0BBE900B1AADE00B6B6
      FD00B4B4FF00B3B3FF00B3B3FF00B3B3FF00B3B3FF00B3B3FF00B3B3FF00B3B3
      FF00B3B3FF00B3B3FF00B3B3FF00B3B3FE00AAA3DF00AEA9E600BABAFF00C3C3
      FF00D2D2FD00AEAAB300AB9E9800AB9A9400B2A19C00E0D9D600E7E1DF00A55A
      390000000000A55A3900E5DFDD00DFD7D500B1A19C00AB9A9400AC9F9800BDB9
      B200F7FBF900EFF9F500E3F6EF00CEE2D800C1D7CB00CBEDE000CAEDE000C9ED
      E000C9EDE000C9EDE000C9EDE000C9EDE000C9EDE000C9EDE000C9EDE000C9ED
      E000C9EDE000C9ECDF00BCD6C900C1DCCF00CEEFE300D4F1E700DFF3EB00B2B6
      AD00AB9F9800AB9A9400B2A19C00E0D9D600E7E1DF00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0057BDFC008ED2
      FC009DD8FA009AD7FA009AD7FA007BCBFE0077CAFE0078CAFE006BC5FE0061C2
      FE006CC6FE00A2D9FE00A2D8FE0065C3FE0055BDFE0052BDFE004EBCFE0044B8
      FE0045B8FE003CB3FE0038B3FF0031AEFC002197E3001979B700EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E4DFDD00E4DFDD00CEC4C100A693
      8D00B3A29D00A1978F00D0CECC00F5F5FE00EBEBFF00DEDEFF00D0D0FF00C6C6
      FF00C0C0FF00BDBDFF00BBBBFF00BABAFF00BABAFF00BABAFF00BABAFF00BABA
      FF00BABAFF00BABAFF00BBBBFF00BCBCFF00BEBEFF00C4C4FF00CDCDFF00D9D9
      FE00C1BECC00A0968F00B3A29D00A6938D00D0C5C200E6E1DE00E6E0DE00A55A
      390000000000A55A3900E4DFDD00E4DFDD00CEC4C100A6938D00B3A29D00A197
      8F00D1D0CB00F8FCFA00F1FAF600E7F7F100DDF3EB00D6F1E700D2F0E400CFEF
      E300CEEEE200CEEEE200CEEEE200CEEEE200CEEEE200CEEEE200CEEEE200CEEE
      E200CEEEE200CFEEE300D0EFE400D4F0E600DBF2EA00E3F5EE00C6CCC400A097
      8E00B3A29D00A6938D00D0C5C200E6E1DE00E6E0DE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE0057BEFC008FD3
      FC009CD8FA009AD7FA009BD7FA008DD2FB0078CBFE0079CBFE0076C9FE0073C8
      FE0066C4FE0059C0FE0059C0FE0063C3FE0061C1FE005BBFFE0058BEFE0050BD
      FE0049BBFE003AB3FE0034B1FE002FADFC002297E3001679B800E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E4DFDD00E4DFDD00E2DCDB00BCAE
      A900A9969000B5A5A000A39A9200DEDDDC00F7F7FE00F0F0FF00E6E6FF00DBDB
      FF00D2D2FF00CCCCFF00C7C7FF00C5C5FF00C3C3FF00C2C2FF00C2C2FF00C2C2
      FF00C3C3FF00C4C4FF00C6C6FF00CACAFF00D0D0FF00D8D8FF00E2E2FE00D1D0
      DC00A2999200B5A5A000A9969000BDAFAA00E5DEDC00E7E1DF00E7E1DF00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E2DCDB00BCAEA900A9969000B5A5
      A000A39B9200DFDFDB00F9FCFB00F4FBF900ECF9F400E5F6F000DEF4ED00DAF3
      EA00D7F1E700D5F1E700D3F0E600D3F0E500D2F0E500D2F0E500D3F0E600D4F1
      E700D6F1E700D8F2E900DDF3EB00E2F5EF00E9F8F200D5DBD500A39A9200B5A5
      A000A9969000BDAFAA00E5DEDC00E7E1DF00E7E1DF00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE0079C9FC0073C9
      FD0091D3FC008ED2FC008ED2FC0074C9FE0072C8FE006CC6FE005FC1FE0060C1
      FE005FC1FE005DC1FE0062C2FE005AC0FE0053BDFE004FBBFE004BBAFE0046B9
      FE003CB4FE0035B1FE002CADFE0028ABFA000F8DD9004F9AD600E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E4DFDD00E4DFDD00E4DEDD00DDD7
      D400B3A39E00AB999300B8A9A400A89F9700D0CDCA00F6F6FA00F5F5FF00EEEE
      FF00E7E7FF00E0E0FF00DADAFF00D5D5FF00D3D3FF00D1D1FF00D0D0FF00D1D1
      FF00D2D2FF00D4D4FF00D8D8FF00DDDDFF00E4E4FF00E8E8FA00C9C6CA00A69E
      9700B8A9A400AB999300B4A49E00DFD8D500E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E4DEDD00DDD7D400B3A39E00AB99
      9300B8A9A400A89F9700D1CFCA00F8FAF900F8FCFA00F3FBF800EDF9F400E8F7
      F200E4F5EF00E1F5ED00DFF4EC00DEF3EC00DDF3EB00DDF3EB00DEF4EC00E0F4
      ED00E3F5EE00E7F6F100EBF8F400EDF6F200CBCDC600A79F9600B8A9A400AB99
      9300B4A49E00DFD8D500E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E2E2E4007FCB
      FC0051BBFC0050BAFC0051BAFC004BB8FC0044B5FB0041B4FB0041B3FB0041B3
      FB0041B3FB003CB2FB0039B0FB0036AFFB0036B0FB0032AEFB0031ADFB0033AE
      FB002FACFB0021A4F9001EA3FA001DA3F30055ABE100DCD6E200E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DF
      DD00DAD2CF00B4A49E00AB989200B7A8A300ACA29A00B3AFA800E9E8E900F9F9
      FE00F6F6FF00F2F2FF00EDEDFF00E9E9FF00E6E6FF00E4E4FF00E3E3FF00E4E4
      FF00E5E5FF00E8E8FF00EBEBFF00EFEFFE00E2E1E900B0ACA800ACA19A00B7A8
      A300AB989200B4A49E00DBD3D000E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DFDD00DAD2CF00B4A4
      9E00AB989200B7A8A300ACA29A00B4AFA800EAEAE800FAFDFC00F8FCFB00F5FB
      F900F2FAF700EFFAF600EDF9F500ECF8F400EBF8F300EBF8F400ECF9F400EEF9
      F500F1FAF700F3FAF800E5E8E500B1AFA600ACA29A00B7A8A300AB989200B4A4
      9E00DBD3D000E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00DBD4D100B9AAA500AB999200B4A49E00B2A59F00A9A19900C0BC
      B600E0DFDD00F6F5F800F9F9FF00F7F7FF00F5F5FF00F4F4FF00F4F4FF00F4F4
      FF00F5F5FF00F2F1F800DCDBDD00BDBAB600A8A19900B2A59F00B4A49E00AB99
      9200B9AAA500DDD5D300E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00DBD4
      D100B9AAA500AB999200B4A49E00B2A59F00A9A19900C0BCB600E1E0DD00F7F8
      F700FBFDFC00F9FDFC00F8FCFB00F7FCFA00F7FCFA00F7FCFA00F8FCFA00F4F7
      F500DEDFDB00BEBCB500A8A19900B2A59F00B4A49E00AB999200B9AAA500DDD5
      D300E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E4DEDC00E4DEDC00E4DEDC00E4DE
      DD00E4DEDD00E4DEDC00E0D9D700C4B7B200AE9D9600AE9D9600B7A8A200B3A6
      A000ACA29B00ABA49D00BCB7B100CDCAC700DAD8D600DFDDDC00DAD8D600CCCA
      C700BBB7B100AAA49D00ABA29B00B3A6A000B7A7A200AE9D9600AE9D9600C4B7
      B300E0DAD800E5DFDD00E5DFDD00E5DFDD00E5DFDD00E5DFDD00E5DFDD00A55A
      390000000000A55A3900E4DEDC00E4DEDC00E4DEDC00E4DEDD00E4DEDD00E4DE
      DC00E0D9D700C4B7B200AE9D9600AE9D9600B7A8A200B3A6A000ACA29B00ABA5
      9D00BCB8B100CECBC600DBDAD600DFDFDB00DADAD500CDCBC600BBB8B100ABA4
      9D00ABA29B00B3A6A000B7A7A200AE9D9600AE9D9600C4B7B300E0DAD800E5DF
      DD00E5DFDD00E5DFDD00E5DFDD00E5DFDD00E5DFDD00A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900E5DFDD00E5DFDD00E5DFDD00E5DF
      DD00E5DFDD00E5DFDD00E5DFDD00E4DEDC00D7CFCC00BEB0AB00AD9A9400AE9C
      9600B4A39E00B8A9A400B5A8A200AFA39C00A99E9700A89D9500A99E9700AFA3
      9C00B5A8A200B8A9A400B4A39E00AE9C9600AD9B9500BEB0AB00D7CFCC00E5DF
      DD00E6E0DE00E6E0DE00E7E1DE00E6E0DE00E7E1DE00E7E1DE00E7E1DE00A55A
      390000000000A55A3900E5DFDD00E5DFDD00E5DFDD00E5DFDD00E5DFDD00E5DF
      DD00E5DFDD00E4DEDC00D7CFCC00BEB0AB00AD9A9400AE9C9600B4A39E00B8A9
      A400B5A8A200AFA39C00A99E9700A89D9500A99E9700AFA39C00B5A8A200B8A9
      A400B4A39E00AE9C9600AD9B9500BEB0AB00D7CFCC00E5DFDD00E6E0DE00E6E0
      DE00E7E1DE00E6E0DE00E7E1DE00E7E1DE00E7E1DE00A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DEDC00D9D1CF00C6B8
      B500B6A5A000AC9A9300AC9A9300AE9C9500AF9D9600AF9E9700AF9D9600AE9C
      9500AC9A9300AC9A9300B6A6A000C6B9B500DAD2CF00E4DFDD00E5E0DE00E6E0
      DE00E5E0DE00E5E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A
      390000000000A55A3900E4DEDD00E4DFDD00E4DFDD00E4DFDD00E4DFDD00E4DF
      DD00E4DFDD00E4DFDD00E4DFDD00E4DEDC00D9D1CF00C6B8B500B6A5A000AC9A
      9300AC9A9300AE9C9500AF9D9600AF9E9700AF9D9600AE9C9500AC9A9300AC9A
      9300B6A6A000C6B9B500DAD2CF00E4DFDD00E5E0DE00E6E0DE00E5E0DE00E5E0
      DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E0DE00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E5DF
      DD00E4DFDD00E5DFDD00E5DFDE00E5DFDD00E5DFDE00E5DFDE00E5DFDE00E5DF
      DE00E4DEDD00DED7D400D5CCC900CEC4C000CABFBA00C8BCB700CABEBA00CEC4
      C000D5CCC900DFD8D500E5DFDD00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E1
      DF00E6E1DF00E6E1DF00E6E1DF00E6E1DF00E7E1DF00E7E1DF00E6E1DF00A55A
      390000000000A55A3900E4DFDD00E4DFDD00E4DFDD00E5DFDD00E4DFDD00E5DF
      DD00E5DFDE00E5DFDD00E5DFDE00E5DFDE00E5DFDE00E5DFDE00E4DEDD00DED7
      D400D5CCC900CEC4C000CABFBA00C8BCB700CABEBA00CEC4C000D5CCC900DFD8
      D500E5DFDD00E6E0DE00E6E0DE00E6E0DE00E6E0DE00E6E1DF00E6E1DF00E6E1
      DF00E6E1DF00E6E1DF00E7E1DF00E7E1DF00E6E1DF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700AD7B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B73008C5A
      5A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700AD7B7B00DEC6BD00FFCEC600FFCEC600FFCEC600FFCEC600FFCE
      C600FFCEC600FFCEC600FFCEC600FFCEC600FFCEC600FFCEC600FFCEC6008C5A
      5A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00AD847B00DECEBD00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD008C5A
      5A00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00AD7B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B73008C5A5A00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00B5847B00DECEC600F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD008C5A
      5A00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00AD7B7B00DEC6BD00FFCEC600FFCEC600FFCEC600FFCEC600FFCEC600FFCE
      C600FFCEC600FFCEC600FFCEC600FFCEC600FFCEC600FFCEC6008C5A5A00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00B58C7B00DECEC600F7EFE700FFE7CE00FFE7CE00FFE7C600FFDE
      BD00FFDEBD00FFDEBD00FFDEB500FFDEB500FFD6AD00F7EFE700FFDEBD008C5A
      5A00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00AD847B00DECEBD00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD008C5A5A00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00000000000000
      000000000000000000000000000000000000F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300BD8C7B00E7D6CE00F7EFE700FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00F7EFE700FFDEBD009463
      5A00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00B5847B00DECEC600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD008C5A5A00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF0000000000E7C6
      1800E7C61800D6BD1800D6BD180000000000F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A57B7300FFD6CE00FFD6CE00FFD6CE00FFD6
      CE00FFD6CE00C6948400E7D6CE00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD009463
      6300F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700B58C7B00DECEC600F7EFE700FFE7CE00FFE7CE00FFE7C600FFDEBD00FFDE
      BD00FFDEBD00FFDEB500FFDEB500FFD6AD00F7EFE700FFDEBD008C5A5A00F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE70000000000E7C6
      1800E7C61800DEC61800DEC6180000000000F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7000000000029FF
      FF0029FFFF0018F7FF0029FFFF0018F7FF0000CEFF0000C6F70000C6F70000B5
      E70000B5E70000B5E70000000000F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A57B7300F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700C6948400EFDECE00F7EFE700FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6A500FFD6A500FFD6A500FFD6A500F7EFE700FFDEBD009C6B
      6300F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700BD8C7B00E7D6CE00F7EFE700FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00DEA54A00C6BDAD00DEBD9C00DE9452009C420800393139007B7B7B00C6C6
      C600EFEFEF00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE70000000000EFB5
      3900EFB53900E7C61800E7C6180000000000F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7007B3918007B39
      18007B3918007B3918007B3918007B3918007B3918007B3918000000000018F7
      FF0018F7FF0029FFFF0052FFFF0039FFFF0039FFFF0039FFFF0039FFFF0000B5
      E70000ADDE0000ADDE0000000000F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A57B7300F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700CE9C8400EFDED600F7EFE700FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00F7EFE700FFDEBD009C6B
      6300F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700C6948400E7D6CE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E7001842520052949C00B5732900DE7B2900BD5A00006B42210052524A007373
      7300A5A5A500C6C6C600E7E7E700F7F7F700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E70000000000EFB5
      3900EFB53900E7C61800E7C6180000000000F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E7007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A5FF
      FF00A5FFFF00C6FFFF00BDFFFF00A5FFFF0052FFFF0039FFFF0029FFFF0000CE
      FF0000BDF70000BDF70000000000F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700AD7B7B00F7EFE700FFDEB500FFDEB500FFDE
      B500FFDEB500CE9C8400EFE7DE00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700FFDEBD00A573
      6B00F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700C6948400EFDECE00F7EFE700FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00527B8C007B7B5200FFC68C00FFDEAD00F7BD7B00E78C3900BD6B10008452
      210063524A006B6B6B0094949400B5B5B500DEDEDE00EFEFEF00F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700000000000000000000000000000000000000000000000000EFB5
      3900EFB53900E7C61800E7C61800000000000000000000000000000000000000
      000000000000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE007B391800FFFF
      FF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00AD847B00F7EFE700FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00D6A58C00EFE7DE00FFF7F700FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00F7EFE700FFDEBD00AD73
      6B00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00CE9C8400EFDED600F7EFE700FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00BD8C5200DEA56B00FFE7C600FFEFCE00FFDEB500FFC68C00E79C
      4A00CE7318009C521800735239006363630084848400ADADAD00CECECE00E7E7
      E700F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE0000000000EFB53900E7B53100EFB53900EFB53900EFB53900E7B5
      3100E7B53100E7C61800E7C61800E7C61800E7C61800E7C61800DEC61800DEC6
      180000000000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B391800F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00B5847B00F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700DEAD8C00F7E7DE00FFF7F700FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00F7EFE700FFDEBD00AD7B
      7300F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00CE9C8400EFE7DE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700E7AD7300D6843100E7A56300FFD6B500FFE7CE00FFE7
      BD00FFC68C00EFA55A00D67B2100845A29005252520052525A0073737300A5A5
      A500F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE0000000000E7B53100EFB53900EFC66B00EFC66B00EFC66B00EFBD
      4A00EFBD4A00E7C61800E7C61800E7C61800E7C61800E7C61800DEC61800D6BD
      180000000000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE007B391800FFFF
      FF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400FFFFFF007B391800EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00BD8C7B00F7F7EF00FFE7C600FFDEBD00FFDE
      BD00FFDEBD00DEAD8C00F7EFDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7EF00FFF7EF00FFF7E700FFF7E700FFF7E700F7EFE700FFDEBD00AD7B
      7300EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00D6A58C00EFE7DE00FFF7F700FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00FFDEBD00FFDEBD00D68C5A00A54200009C5A1800DE944A00EFC6
      9400FFE7CE00FFE7C600BDA58400A5ADA5007B7B9C001010840029316B006B6B
      6B00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE0000000000FFEFC600FFF7E700FFF7DE00FFF7DE00FFF7DE00FFEF
      C600FFEFC600EFC66B00EFBD4A00EFB53900EFB53900EFB53900E7C61800E7C6
      180000000000EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B391800EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600BD948400FFF7F700FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00E7B58C00F7EFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7EF00FFF7EF00FFE7D600FFBDBD00FFA5A500AD7B
      7300EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600DEAD8C00F7E7DE00FFF7F700FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00F7EFE700FFDEBD00A5948400D6A5
      7300D68C3900F7B57B009C8C8400E7EFF7004A52C600084AD6000821B5004A4A
      7B00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED60000000000FFEFC600FFF7E700FFF7DE00FFF7DE00FFF7DE00FFEF
      C600FFEFC600EFC66B00EFBD4A00EFB53900EFB53900EFB53900E7C61800E7C6
      180000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6007B391800FFFF
      FF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400FFFFFF007B391800EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600C6948400FFF7F700FFFFF700FFF7EF00FFF7
      EF00FFF7E700E7B58C00FFEFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7EF00B5847300B5847300B5847300B584
      7300EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600DEAD8C00F7EFDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFF7E700FFF7E700FFF7E700F7EFE700FFDEBD009C9C9C00EFEF
      EF00EFDED600EFBD9C00AD8C630084849C002139B5002173EF000829B5008484
      A500EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600000000000000000000000000000000000000000000000000FFF7
      DE00FFF7DE00EFC66B00EFB53900000000000000000000000000000000000000
      000000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B391800EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600CE9C8400FFFFFF00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00EFB59400FFF7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700B5847300FFC67B00DEA57300DEC6
      B500EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600E7B58C00F7EFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7EF00FFF7EF00FFF7EF00FFE7D600FFBDBD00FFA5A5009C9C9C00EFEF
      EF00EFDED600EFDED600EFDED600DEDED6007B7BB5002931B5007B7BBD00EFEF
      EF00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED60000000000FFF7
      DE00FFF7DE00EFC66B00EFB5390000000000EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6007B391800FFFF
      FF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400FFFFFF007B391800EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600D6A58400FFFFFF00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00EFBD9400FFF7E700FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00F7F7F700B5847300DEB58C00E7C6B500EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600E7B58C00FFEFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7EF00B5847300B5847300B5847300A5A5A500EFEF
      EF00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED60000000000FFF7
      DE00FFF7DE00EFC66B00EFB5390000000000EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B3918007B39
      18007B39180000000000EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00DEAD8C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700F7BD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400B5847300E7CEB500EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFB59400FFF7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B5847300FFC67B00DEA57300DEC6B500EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0000000000FFEF
      C600FFEFC600EFBD4A00E7B5310000000000EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE007B391800FFFF
      FF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A584007B391800FFFF
      FF00FFFFFF007B391800EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00DEAD8C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7EF00FFF7E700FFE7D600E7AD9C00E7A5
      9400AD847B00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFBD9400FFF7E700FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7
      F700F7F7F700EFEFEF00F7F7F700B5847300DEB58C00E7C6B500EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0000000000FFF7
      E700FFF7E700EFC66B00EFBD4A0000000000EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE007B391800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B391800FFFF
      FF007B391800E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7B58C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7EF00B5847300B5847300B584
      7300B5847300E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00F7BD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400B5847300E7CEB500E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00000000000000
      000000000000000000000000000000000000E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE007B3918007B39
      18007B3918007B3918007B3918007B3918007B3918007B3918007B3918007B39
      1800E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00EFB59400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00B5847300FFC67B00DEA5
      7300DEC6B500E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00B5847300DEB58C00E7C6
      B500E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600F7C69400DEAD8400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B5847300E7CEB500E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F7007384CE002139AD001831
      A5002139A5002139AD002139A5002139A5002139AD002139AD002139AD002139
      AD001839AD001839AD001839AD001839B5001839AD001031AD001031AD001031
      B5000829AD001839A5008494CE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70073391000733910007339
      0800FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700738CD6001839C6000829BD000831
      BD001031BD001839BD001839BD001839BD001839BD001039BD001039BD001039
      C6001039C6000831C6000831C6000831C6000031C6000029C6000029C6000029
      C6000021C6000021B5001031AD008494CE00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700733910007339100073391000B54A2100B54A18007339
      1000FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF002142CE000831CE001839D6002142
      D600214AD600294AD600294AD600294AD600294AD600294AD600214AD600214A
      D600214ADE00184ADE00184ADE001042DE001042DE000842DE000839DE000031
      DE000031DE000029CE000018B5002942AD00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF007B42
      10007B4210007B421000BD5A2900BD522900B5522100B5522100B54A21007339
      1000FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF000000000000000000000000000000
      000000000000FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF001842DE001039DE00214ADE00294A
      DE003152DE003152E700315AE7003152E7002952DE00184ADE001042DE001042
      DE000839E7000839E7000842E700104AE700104AE700104AE7000842E7000039
      E7000039E7000031DE000021BD002139AD00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF007B4218007B4218007B421800C663
      3100C6633100BD633100BD632900BD5A2900BD5A2900BD522900B55221007339
      10004A3108004A3108004A3108004A310800F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF008C52520084524A0084524A0084524A008452
      4A0084524A0084524A0084524A0084524A0084524A0084524A0084524A008452
      4A0084524A0063313100F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF000000000000BDF70000ADDE0000AD
      DE0000000000F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00214ADE001842DE00294AE7003152
      E700395AE700395AE700395AE7003152E7004263E7007B94EF00A5B5F700ADC6
      F700ADBDF70094ADF7006384EF00215AEF000842E700104AEF00104AEF000842
      EF000039E7000031DE000021C6002942B500F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF007B421800C66B3900C66B3900C66B3900C66B
      3900C66B3900C66B3900C66B3100C6633100BD633100BD5A2900BD5A29008442
      1000FFD6A500FFD6A500FFD6A5004A310800F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF008C5A5200CEADA500FFBDAD00FFBDAD00FFBD
      AD00FFBDAD00FFBDAD00FFBDAD00FFBDAD00FFBDAD00FFBDAD00FFBDAD00FFBD
      AD00FFBDAD0063313100F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF000000000000CEFF0000B5E70000B5
      E70000000000F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00214AE7001842DE003152E700395A
      E7004263E700395AE7003963E7007B94EF00CEDEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7FF00BDCEFF00527BEF00104AEF000842EF00084A
      EF000042E7000039DE000021C6002942B500F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF007B421800CE734200CE734200CE734200CE73
      4200CE734200CE733900CE733900C66B3900C66B3100C6633100BD632900844A
      1000FFD6AD00FFD6A500FFD6A5004A310800F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00945A5200CEB5A500F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00FFD6A50063313100F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF000000000029FFFF0000CEFF0000C6
      F70000000000F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700294AE700214ADE00315AE7004263
      E7004263E7004263E7008CA5EF00FFFFFF00FFFFFF00DEE7FF00ADBDF70094AD
      F70094ADF700ADBDF700E7EFFF00FFFFFF00EFEFFF005A84F700084AEF000842
      EF000842E7000839DE000029C6002942B500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7007B421800CE7B4A00D6844A00D6844A00D684
      4A00CE7B4A00CE7B4200CE7B4200CE734200CE733900C66B3900C6633100844A
      1000FFD6AD00FFD6AD00FFD6AD004A310800F7EFE700F7EFE70073390800F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE70094635200CEB5AD00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00FFD6A50063313100F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700000000000000000000000000000000000000000029FFFF0000CEFF0000C6
      F7000000000000000000000000000000000000000000F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE7002952E7002952E700395AE7004263
      E700395AE700849CEF00FFFFFF00FFFFFF00ADB5F7006384EF00395AE7001042
      E7000842E700315AEF00527BEF00ADBDF700FFFFFF00E7EFFF004A73EF000042
      E7001042E7000839DE000029C600294AB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7007B4A1800D6845200D68C5200D68C5200D68C
      5200D68C5200D6844A00D6844A00CE7B4A00CE7B4200CE733900C66B39009452
      1000FFDEB500FFDEAD00FFD6AD004A310800F7EFE70073391000AD4218007339
      0800F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7009C635200D6BDAD00F7EFDE00FFDEB500FFD6
      B500FFD6AD00FFD6A500FFCEA500FFCE9C00FFCE9C00FFCE9400FFC69400F7EF
      DE00FFD6A5006B393100F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E7000000000029FFFF0018F7FF0029FFFF0029FFFF0018F7FF0000CEFF0000C6
      F70000C6F70000C6F70000B5E70000B5E70000000000F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E7003152E7003152E7004263E7004263
      E7005A73E700D6DEFF00FFFFFF00A5B5F7004263E700315AE7004A6BE7007B9C
      EF007394EF003163E700104AE700215AEF00ADBDF700FFFFFF00ADC6F7001852
      EF000842E7001042DE000029C600294AB500F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700844A1800DE945A00DE945A00DE945A00DE94
      5A00DE945A00DE945200D68C5200D6844A00D6844A00CE7B4200CE7342009452
      1000FFDEB500FFDEB500FFDEB5004A31080073421000BD5A2900B55221007339
      1000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A56B5200D6C6B500F7EFDE00FFB57300FFB5
      7300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300F7EF
      DE00FFD6A5006B393900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E7007B3918007B3918007B3918007B3918007B3918007B3918007B3918007B39
      18000000000018F7FF0029FFFF0052FFFF0052FFFF0039FFFF0000CEFF0000CE
      FF0000CEFF0000CEFF0000B5E70000ADDE0000000000F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700315AE700315AE7004A63E700395A
      E7008CA5EF00FFFFFF00DEE7FF00637BEF003963E7004263E7006384EF00FFFF
      FF00FFFFFF00426BEF00295AE700104AE7004A7BEF00E7EFFF00EFF7FF005A7B
      EF000039E7001842DE000831C600314AB500F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E70084521800E79C6300E79C6300E79C6300E79C
      6300E79C6300DE9C6300DE945A00DE8C5200D68C5200D6844A00CE7B4200945A
      1800FFDEBD00FFDEBD00FFDEB5007B4A1800D67B4A00CE7B4200C66B39007342
      1000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A56B5A00DEC6B500F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00FFD6A50073393900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E7007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000A5FFFF00C6FFFF00BDFFFF00BDFFFF00A5FFFF0052FFFF0039FF
      FF0029FFFF0029FFFF0000CEFF0000BDF70000000000F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00395AE700395AE7004A6BE700395A
      E700B5C6F700FFFFFF00ADB5F7004A63E7004A6BE7004263E700637BEF00FFFF
      FF00FFFFFF00426BEF00295AE7002152E700184AE700ADBDF700FFFFFF00849C
      F7000031E700184ADE000831C600314AB500F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE008C5A2100E7A56B00E7AD6B00E7AD6B00E7AD
      6B00E7A56B00E7A56B00E79C6300DE945A00DE945A00D68C5200D6844A00945A
      1800FFE7C600FFE7BD007B522100DE9C6300E7A56B00DE9C6300D6844A007B42
      180073391000733908004A310800F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00AD735A00DECEBD00F7EFDE00FFC68C00FFC6
      8C00FFC68C00FFC68C00FFC68C00FFC68C00FFC68400FFC68400FFBD8400F7EF
      DE00FFD6A50073423900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE007B391800FFFFFF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      84000000000000000000000000000000000000000000BDFFFF0052FFFF0029FF
      FF000000000000000000000000000000000000000000F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE003963E7004263E7005273E700395A
      E700C6CEF700FFFFFF0094A5F700395AE7004A6BE7004263E700637BEF00FFFF
      FF00FFFFFF00426BE7002952E7002952E7000039E70094ADF700FFFFFF0094AD
      F7000031E700214ADE001031BD003152B500F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00945A2100EFAD7300EFB57300EFB57B00EFB5
      7B00EFAD7300EFAD7300E7A56B00E79C6300DE945A00DE8C5200D68452009C5A
      1800FFE7C6007B4A1800DE9C6300EFB57B00F7C68400EFB57B00DE9C6300CE7B
      4200BD5A2900AD4A180073390800F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00B57B5A00E7CEC600F7EFDE00FFB57300FFB5
      7300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300F7EF
      DE00FFD6A5007B424200F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B39180000000000BDFFFF0052FFFF0029FF
      FF0000000000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE004263E7004263E7005A73E7004263
      E700C6CEF700FFFFFF0094A5EF00395AE7004A6BE7004263E700637BEF00FFFF
      FF00FFFFFF004263E7002952E7002152E7000039E70094ADF700FFFFFF009CAD
      F7000031DE00214ADE001039BD003152B500EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE009C632100EFBD7B00F7BD8400F7BD8400F7BD
      7B00EFB57B00EFB57B00EFAD7300E7A56B00E79C6300DE945A00D68C52009C5A
      1800FFE7CE007B4A1800E7A56B00F7C68400FFD69C00F7C68400E7A56B00D67B
      4A00BD5A2900B54A180073390800EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00BD7B6300EFD6CE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00FFD6A500844A4200EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE007B391800FFFFFF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400E7A58400E7A58400FFFFFF007B39180000000000A5FFFF0039FFFF0018F7
      FF0000000000EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004263E7004A6BE7005A73EF004A63
      E700BDC6F700FFFFFF00ADBDF7004A63E7004A6BE7004263E700637BEF00FFFF
      FF00FFFFFF004263E7002952E700214AE700184AE700ADBDF700FFFFFF00849C
      F7000839DE00294ADE001039BD003952B500EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A56B2900F7BD8400F7C68400F7C68400F7C6
      8400F7BD8400F7BD7B00EFB57B00EFAD7300E7A56B00DE9C6300DE8C5A009C5A
      1800FFEFD600FFEFD60084522100EFB57B00F7C68400EFB57B00DE9C6300CE7B
      4200BD5A2900AD4A180073390800EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600C6846300EFD6CE00F7F7F700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7EF
      DE00FFD6A5008C524200EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B39180000000000C6FFFF0052FFFF0039FF
      FF0000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004A6BE7005273E700637BE7005273
      E70094ADEF00FFFFFF00DEE7FF006B7BEF00395AE700395AE700637BEF00FFFF
      FF00FFFFFF004263E7002952E7001042DE005273EF00E7EFFF00EFF7FF00637B
      EF001042DE00294ADE001839BD003952B500EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600AD732900F7C68C00FFCE8C00FFCE9400F7CE
      8C00F7C68C00F7BD8400EFB57B00EFAD7300E7A56B00E79C6300DE945A009C63
      1800FFEFDE00FFEFD600FFEFD60084522100E7A56B00DE9C6300D6844A007B42
      180073391000733908004A310800EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600CE8C6300EFDECE00F7F7F700FFB57300FFB5
      7300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300FFB57300F7EF
      DE00FFD6A5008C524A00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6007B391800FFFFFF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400E7A58400E7A58400FFFFFF007B3918000000000000000000000000000000
      000000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004A6BE7005A73E7006B84EF00637B
      EF006B84EF00DEDEFF00FFFFFF00A5B5F7004263E700395AE7004A63E7006B84
      EF006384EF003152E7001842DE00294AE700ADBDF700FFFFFF00B5C6F7002952
      E700214ADE002952DE001839BD003952B500EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600B57B3100F7CE8C00FFCE9400FFD69400FFCE
      9400F7CE8C00F7C68400F7BD8400EFB57300E7AD6B00E79C6300DE945A009C63
      1800FFF7E700FFEFDE00FFEFDE004A3108007B4A1800CE7B4200C66B39007342
      1000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600CE8C6300F7DECE00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7E700FFF7E700FFEFDE00FFEFD600FFEFD600F7EF
      DE00FFD6A50094524A00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B391800EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004A6BE7005A7BEF007384EF006B84
      EF005A7BEF0094A5EF00FFFFFF00FFFFFF00ADB5F700637BEF003152E7001842
      DE001842DE003152E7005273E700ADB5F700FFFFFF00EFEFFF005A7BEF001842
      DE002952E7002952DE001839BD003952B500EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600BD843100FFCE9400FFD69400FFD69C00FFD6
      9400FFCE9400F7C68C00F7BD8400EFB57B00E7AD6B00E79C6300DE945A00A563
      1800FFF7E700FFF7E700FFEFDE004A310800EFDED60073421000B55221007339
      1000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600D6946B00F7E7D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700FFF7E700FFF7E700FFF7E700FFD6C600FFA5
      A500FF84840094524A00EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D6007B391800FFFFFF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      8400E7A58400E7A58400FFFFFF007B391800EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00526BE700637BEF00738CEF00738C
      EF006B84EF00637BEF009CADF700FFFFFF00FFFFFF00DEE7FF00A5B5F70094A5
      EF0094A5EF00ADBDF700E7E7FF00FFFFFF00EFEFFF006B84EF00214AE700294A
      E7003152E7002952D6001839BD003952B500EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00BD843100F7CE8C00FFCE9400FFD69400FFCE
      9400FFCE8C00F7C68400F7BD7B00EFB57300E7AD6B00E79C6300DE945A00A563
      1800FFF7EF00FFF7E700FFF7E7004A310800EFD6CE00EFD6CE0073390800EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00DE946B00F7E7D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7E700FFF7E700945A4A00945A
      4A00945A4A00945A4A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B3918007B3918007B39180000000000EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE005273E7006B84EF00849CEF008494
      EF007B8CEF00637BEF00637BEF0094A5EF00D6DEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7FF00C6CEF7006B84EF003152E7002952E700315A
      E7003152E7002952D6001839BD003952B500EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00C68C3100F7C68C00FFCE8C00FFCE8C00FFCE
      8C00F7C68C00F7BD8400EFB57B00EFAD7300E7A56B00E79C6300DE945A00A563
      1800FFF7F700FFF7EF00FFF7EF0063390800EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00E79C6B00FFEFDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700945A4A00FFAD
      5200CE845200BD7B5A00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE007B391800FFFFFF00E7A58400E7A58400E7A58400E7A58400E7A58400E7A5
      84007B391800FFFFFF00FFFFFF007B391800EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE005A7BE7007B8CEF0094A5EF008CA5
      EF00849CEF00738CEF006B84EF005A7BE7006B84EF0094A5EF00B5BDF700BDC6
      F700BDC6F700A5B5F7008494EF00526BE700395AE7004263E7004263E700395A
      E7003152E700294AD6001039BD003152B500E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00C68C3100F7BD8400F7C68400F7C68400F7C6
      8400F7BD8400F7BD7B00EFB57B00E7AD7300E7A56B00BD7B2900B5732900A563
      1800FFFFF700FFFFF700FFF7EF0063390800E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E79C6B00FFEFDE00FFFFFF00FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700EFEFEF00EFE7E700EFEFEF00945A4A00CE94
      6B00C67B6300E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE007B391800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B391800FFFFFF007B391800E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE005A7BEF00849CEF009CADF7009CAD
      F7008CA5EF007B94EF00738CEF00738CEF00637BEF005A73E700526BE7004A6B
      E7004A6BE7004A6BE7004A6BE7005273E7005273E700526BE7004A6BE7004263
      E700315AE700294ADE001031BD00294AAD00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00C68C3100EFB57B00F7BD8400F7BD8400F7BD
      8400EFBD7B00EFB57B00BD843100BD7B2900BD7B2900FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFFFF70063390800E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00EFA57300CE8C6300CE8C6300CE8C6300CE8C
      6300CE8C6300CE8C6300CE8C6300CE8C6300CE8C6300CE8C6300945A4A00CE8C
      6300E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE007B3918007B3918007B3918007B3918007B3918007B3918007B3918007B39
      18007B3918007B391800E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600637BEF008494EF009CADF7009CAD
      F7008C9CEF007B94EF00738CEF00738CEF006B84EF006B84EF00637BEF00637B
      EF00637BEF00637BEF005A7BEF005A73EF005273E7005273E7004A6BE7004263
      E700315AE700214AD6000831BD003952B500E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600C68C3100EFAD7300EFB57300EFB57B00BD84
      3100BD843100BD843100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073420000E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600A5ADF700738CEF00738CEF00738C
      EF006B84EF005A7BEF005A73E7005273E700526BE7004A6BE7004A6BE7004A6B
      E7004A63E7004263E7004263E7004263E700395AE700395AE7003152E700294A
      E7002142DE001039D600294AC60094A5D600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600C68C3100BD7B2900BD842900BD842900844A
      0000844A0000844A0000844A0000844A0000844A0000844A0000844A00007342
      000073420000734200007342000073420000E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A5ADF7006B84EF006384
      EF00637BEF00637BEF005A7BEF005A73EF005273E7005273E7005273E7005273
      E7005273E700526BE700526BE7004A6BE7004A6BE7004A6BE7004263E7004263
      E700395ADE00395AD6009CA5E700E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E7E7E700CECECE00CECE
      9C00CE9C6300CE9C6300CE9C6300CE9C6300CE9C9C00F7CEA500DEDEDE00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700D5C7C100CDB9B300C5B3AF00B7A9A100BEB1A900CABCB300C9B9AE00DDD0
      C700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700E7EFF7006BA5C60010639C00085A9400085A9400085A
      9400085A9400085A940008639C0008639C0008639C0008639C0008639C000863
      9C0000639C0000639C0000639C0000639C000063A5000063A500005A9C000863
      9C006394BD00DEE7EF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FBF4F400E8E2
      E2009E9E9E0061616100464646005B5B5B0086868600989797006F6969005E5D
      5D005E5E5E0097979700C6C6C600EAE6E600FBF5F500FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700EFEFEF00F7CEA500CE9C63009C6363009C63
      31009C6331009C6331009C6331009C6331009C6331009C633100CE9C6300CECE
      9C00E7E7E700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E1CE
      C700D0998900DCA08A00CA8C7500BB836E00A8746300855D4D00633D29007755
      4100B09F9400A0887700BCA59600FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F7006BADD600086BB5001073B5001073B500187BBD00187B
      BD00187BBD00187BBD00187BBD00187BBD00187BBD00187BBD001084BD001084
      BD001084C6000884C6000884BD000884C6000084C6000084C600007BBD000073
      B50000639C006394BD00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700ECE8E800B6B4B4007474
      740084848400A1A1A1007D7D7D005453530059515100836A6A00AA8F8F00C3BF
      BF00A6A6A600646464005D5D5D0083838300C0BFBF00E8E4E400FCF5F500FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700D6D6D600CE9C9C009C6331009C6331009C6331009C63
      31009C6331009C6331009C6331009C6331009C6331009C6331009C6331009C63
      3100CE9C6300F7CEA500FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00D2AD
      A000EEAA9500FFCFB600FFC6A600DC9D8400D3917A00EAA98E00E2A38B00C187
      750096655500794D3B007F594800947C6F0082645100E3D9D300FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00107BC600107BC6001884CE001884CE00218CCE00298C
      CE00298CCE00298CCE00298CCE00218CCE002194D6002194CE002194D600189C
      D600189CD600109CD600109CD600089CD600089CD6000094D600008CD6000084
      C6000073B50008639C00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FEF6EF00EEEAE600C7C6C5007C7C7C007B7B7B00C4C4
      C400E7E7E700D5D5D500B1B1B100A9A7A7009F8B8B00826F6F007A7676009595
      9500C0C0C000D5D5D500BCBCBC007B7B7B006464640078787800B1B1B000FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00D6D6D600CE9C63009C6331009C6331009C6331009C6331009C63
      31009C6331009C6331009C6331009C6331009C6331009C6331009C6331009C63
      31009C6331009C633100CECE9C00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D8B4
      A800EDAC9900FFCFB500E4AB9000CD917D00D8917A00E9A78B00F2B39500C98B
      7500E8A48A00F8B39700D3937C00B17964009C6955009E817200F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00087BCE001084D600218CD6002994D6002994D6003194
      D6003194D6003194D600319CDE00319CDE00299CDE00299CDE0029A5DE0021A5
      DE0021A5DE0018A5DE0010ADDE0010ADDE0008ADDE0000A5DE00009CDE00008C
      D600007BBD00005A9C00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00DFDFDC00939393007D7D7D00BABABA00ECECEC00F1F1
      F100EBEBEB00D0D0D000AEAEAE00AEAEAE00868686005D5D5D005E5E5E006F6F
      6F00828282009D9D9D00C1C1C100DFDFDF00CECECE00838383007E7E7E00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00D6D6D600CE9C63009C6331009C6331009C6331009C6331009C6331009C63
      31009C6331009C6331009C6331009C6331009C6331009C6331009C6331009C63
      31009C6331009C6331009C633100C6C6C600F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DBB6
      AA00EEAF9C00FFD0B600E5AD9300F4CDB800FFD4B500EBB29600CA927C00E2A1
      8900DD998000E6AA8E00CA8E7800DC977E00F9B59700A87E6900CFC0B500F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF000884D600188CD6002994DE003194DE00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00ADD6F7004AADE7004AADE70042ADE70029A5E70029AD
      E70021ADE70021ADE70018ADE70010B5E70010ADE70008ADE70000A5DE000094
      D6000084C60000639C00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00A7A7A700B4B4B400E6E6E600F6F6F600F0F0F000EBEB
      EB00E3E3E300C5C5C500A7A7A700AAAAAA00A9A9A900A2A2A200989898008585
      85007B7B7B008686860098989800A8A8A800A1A1A1007272720086868600F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00EFEF
      EF00CE9C63009C6331009C6331009C6331009C6331009C6331009C633100CE9C
      6300CECE9C00C6C6C600F7CEA500CECE9C00CE9C63009C6363009C6331009C63
      31009C6331009C6331009C633100CE9C6300D6D6D600F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DCB7
      AA00F0B29F00FFCFB600FAC0A100E2BCA600E8CFB400E9B79B00DDAB9600FFE1
      C500EBBCA100CE968100EFB79F00E4A38800EFB196009A674E00AA8D7C00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF001084D600218CD6003194DE00399CDE00FFFFFF00E7F7
      FF00B5DEF700CEE7F700F7FFFF00BDE7F700C6E7F700BDE7F7004AB5E70029AD
      E70029ADE70021B5E70018B5E70018B5E70010B5E70008ADE70008A5DE00009C
      D6000084C6000063A500F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00A8A8A800E4E4E400F5F5F500EEEEEE00DFDFDF00C6C6
      C600A2A2A200858585007F7F7F008A8A8A0095959500A2A2A200B0B0B000B6B6
      B600B7B7B700A7A7A700898989005D5D5D00ADADAD006262620089898900F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00CECE
      9C009C6331009C6331009C6331009C6331009C633100CE9C6300CECE9C00E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7CEA500CE9C63009C63
      31009C6331009C6331009C6331009C633100CE9C9C00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700DDB7
      AB00F1B4A300FFD0B700FCC5A500D9A38800D1998100F8BFA000F5BFA300DFBB
      A400E7BDA200E6AF9700F0CFB800EEC9AD00EDB49A009A695100AE948300F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700108CD6002994DE00319CDE00399CDE00FFFFFF00BDDE
      F7004AA5DE005AADE700C6E7F700FFFFFF00FFFFFF00FFFFFF00B5E7F7004ABD
      E70029B5E70021B5E70021B5E70018B5E70010B5E70008B5E70008ADDE00089C
      D6000084C6000063A500F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700A8A8A800DFDFDF00ECECEC00BABABA009D9D9D00A7A7
      A700C2C2C200BFBFBF009E9E9E00939393008C8C8C0088888800888888009393
      9300A8A8A800BABABA00BEBEBE0092A8990082AA8F006464640089898900F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700EFEFEF00CE9C
      63009C6331009C6331009C6331009C633100CE9C6300D6D6D600F7F7F700EFEF
      EF00F7CEA500CECE9C00CE9C9C00F7CEA500E7E7E700FFFFFF00E7E7E700CE9C
      9C009C6331009C6331009C6331009C6331009C633100D6D6D600F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700E0B9
      AD00F3B7A600FFD4BB00E4AE9300D1947F00DA947C00E6A88D00E6B09400C48A
      7400E0A48A00FFC7A700D9AA9200DCAF9500FAC4A7009E6D5400AE938200F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700188CD6002994DE00399CDE00429CDE00F7FFFF00E7F7
      FF0084BDEF004AA5DE0063B5E700A5D6EF008CCEEF00B5DEF700FFFFFF00ADDE
      F70039B5E70021B5E70021B5E70018B5E70010B5E70010ADE70008A5DE00089C
      D6000884C6000063A500F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7008A8A8A00AAAAAA0096969600B9B9B900D3D3D300D7D7
      D700D5D5D500DDDDDD00DDDDDD00CBCBCB00B9B9B900AEAEAE00A8A8A8009B9B
      9B0088888800868686009B9B9B007A9784005D9B72005B5B5B008A8A8A00F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700CECECE009C63
      31009C6331009C6331009C6331009C633100F7CEA500FFFFFF00DEDEDE00CE9C
      9C009C6363009C6331009C6331009C633100CE9C6300CECECE00FFFFFF00E7E7
      E700CE9C63009C6331009C6331009C6331009C633100CE9C9C00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E1BA
      AE00F4BAA900FFD5BB00E4B19700F4CEB800FFD9BA00EAB79C00CB968100EDAC
      9300E09E8500E1AA9000CA8E7800D08E7700F7C0A3009E6E5500AD938200F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700188CD6003194DE00429CDE004AA5DE007BBDE700E7F7
      FF00EFF7FF008CC6EF004AA5E70042A5E70042A5E700C6E7F700FFFFFF00A5DE
      F70039B5E70031B5E70021B5E70018ADE70018ADE70010ADE70010A5DE00109C
      D6000884C6000063A500F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E70082828200B9B9B900DEDEDE00DFDFDF00DADADA00D4D4
      D400D7D7D700DFDFDF00D0D0D000D0D0D000D7D7D700DDDDDD00D4D4D400C9C9
      C900C0C0C000B3B3B300A0A0A0008E8E8E007F7F7F00616161008B8B8B00F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700CECE9C009C63
      31009C6331009C6331009C633100CE9C6300F7F7F700EFEFEF00CE9C9C009C63
      31009C6331009C6331009C6331009C6331009C633100CE9C6300DEDEDE00FFFF
      FF00CECE9C009C6331009C6331009C6331009C633100CE9C6300E7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E2BA
      AE00F5BDAD00FFD5BC00F6C3A400EBC9B400F0DAC000ECBDA100DCAE9900FFE3
      C900EBC3A800CC998500F5C3AB00F3B89C00EBB39A009D6D5500AD938200F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700218CD600399CDE0042A5DE004AA5DE0052ADE7008CC6
      EF00E7F7FF00EFF7FF0084BDEF004AA5E7004AA5E700B5DEF700F7FFFF00C6E7
      F7009CDEF7009CDEF7007BCEEF004ABDEF0021ADE70018ADE70018A5DE00109C
      D6001084C6000863A500F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E70095959500E2E2E200DFDFDF00D9D9D900D4D4D400D1D1
      D100E3E3E300CECECE00DBDBDB00E0E0E000D8D8D800CBCBCB00C2C2C200CCCC
      CC00D7D7D700D7D7D700D2D2D200CACACA00AEAEAE006B6B6B009C9C9C00F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700CE9C9C009C63
      31009C6331009C6331009C633100CECE9C00FFFFFF00CECECE009C6363009C63
      31009C6331009C6331009C6331009C6331009C6331009C633100CECE9C00F7F7
      F700D6D6D6009C9C31009C6331009C6331009C6331009C9C6300DEDEDE00F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00E5BC
      B000F5C0B000FFD5BD00FFCEAD00D3A18800C6947D00F6C3A400F7C6A900EAC9
      B000E9C3A700EDBAA000E8C8B200EECEB200EDBBA200A0705600AB928200F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE002194D600429CDE004AA5DE0052A5DE0052A5E7005AAD
      E7008CC6EF00EFF7FF00E7F7FF0084C6EF0042A5DE0052ADE700C6E7F700F7FF
      FF00EFF7FF00E7F7FF00FFFFFF00D6EFFF008CD6EF0029ADE70018A5DE00189C
      D6001084C6000863A500F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00ABABAB00CDCDCD00D9D9D900D3D3D300D4D4D400D7D7
      D700BFBFBF00DADADA00F1F1F100EFEFEF00EDEDED00ECECEC00E8E8E800DBDB
      DB00CACACA00C4C4C400C8C8C800CCCCCC00C1C1C10082828200D2CDCB00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00CE9C63009C63
      31009C6331009C6331009C633100CECECE00FFFFFF00CE9C9C009C6331009C63
      31009C6331009C6331009C6331009C6331009C6331009C633100CE9C6300E7E7
      E700F7F7F7009C9C63009C6331009C6331009C6331009C633100DEDEDE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00E6BE
      B100F7C3B300FFDAC200E5B49800D1947F00DD967F00E7B09400E7B59A00C087
      7100DBA28800FFD1B000D7B49F00D1B09C00FDCFB000A1715800AB928100F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE002994DE0042A5DE0052A5DE0052ADE70052ADE70052A5
      E70052ADE70084BDE700F7FFFF00E7F7FF007BBDE70039A5DE004AADE7005AB5
      E7004AB5E7004AB5E7006BC6EF00CEEFFF00F7FFFF008CD6EF00189CDE001894
      D6001884C600086BA500F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00DCD4D000A6A6A600A9A9A900AFAFAF00B6B6B600B0B0
      B000A8A8A800ACACAC00B4B4B400C2C2C200D6D6D600E9E9E900EBEBEB00E9E9
      E900E8E8E800E5E5E500CDCDCD00BCBCBC0095959500BBB6B300F3E4DC00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00CE9C63009C63
      31009C6331009C6331009C633100D6D6D600FFFFFF00CE9C9C009C6331009C63
      31009C633100CECE9C00CECECE009C9C63009C6331009C633100CE9C6300DEDE
      DE00F7F7F7009C9C63009C6331009C6331009C6331009C633100D6D6D600F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00E7BF
      B200F7C6B800FFDBC300E2B29900F3CBB700FFD6B900EBBAA100CE9B8500F5B3
      9900E5A48A00CEB0A1005A7FC2005B7BC100DAC1B500A8775C00AA917F00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE002994DE004AA5DE0052ADDE005AADE7005AADE7005AAD
      E70052A5E70052A5DE007BBDE700EFF7FF00EFF7FF0063B5E700319CDE00319C
      DE00299CDE00219CDE00219CDE0039ADE700BDE7F700FFFFFF0042ADE7002194
      D6001884C60010639C00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EEE6DE00EAE2DA00DBD8D400AEAEAE00E8E8E800E9E9
      E900BABABA00B1B1B100B4B4B400B9B9B900AEAEAE00A4A4A400AFAFAF00B6B6
      B600CFCFCF00CCCCCC00B4B4B4009D9D9D00C9C6C300ECE5DC00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00CE9C63009C63
      31009C6331009C6331009C633100CECECE00FFFFFF00CECE9C009C6331009C63
      31009C633100DEDEDE00F7F7F700CE9C63009C6331009C633100CE9C9C00EFEF
      EF00EFEFEF009C9C63009C6331009C6331009C6331009C633100DEDEDE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600E9C0
      B400F9C9BC00FFDAC300F3C2A600E2C5B300E7CEB400E8BFA400DCB19B00FFE9
      D000F0C9AC009E9FA60075A4F800789CFD009FA7C100A3785F00AD958500EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED6003194DE0052A5DE005AADE7005AADE7005AADE7005AAD
      E70052A5E70052A5DE0052A5DE00ADD6F700F7FFFF0073B5E700319CDE00319C
      DE00299CDE00299CDE00219CDE00219CDE006BBDE700EFF7FF0094CEEF002194
      D6002184C600106B9C00EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A6A5A500E2D4D200F9D5
      CF00EAC5BF00E2C8C300DBCCC800D5D0CE00D4D4D400D1D1D100D3D3D300BABA
      BA0090909000B1B1B100BFBAB800DAD1CD00EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600CE9C9C009C63
      31009C6331009C6331009C633100CE9C9C00F7F7F700DEDEDE00CE9C63009C63
      31009C633100DEDEDE00F7F7F7009C9C63009C6331009C633100F7CEA500FFFF
      FF00CECECE009C6331009C6331009C6331009C633100CE9C6300E7E7E700EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EBC3
      B700F9CCC000FFD9C200FFD3B200F5C9AA00EFC4A700FBCFAF00F7CCAF00DFBF
      AA00E5BEA200E3C4AD0087B4D40087B3ED00B9B7BD00AA7E6600AD958700EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600319CDE0052ADE70063ADE70063ADE70063ADE7005AAD
      E70052A5E70052A5DE0052A5DE00ADD6EF00E7F7FF005AADE700319CDE00319C
      DE00319CDE0052ADE70039A5DE002194DE0031A5DE00DEEFFF00C6E7F7002994
      D6002184BD00106B9C00EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600D6C6C100D3B1A400F9CA
      A900FFCBAB00FFCCAD00FFCDAF00FBCAAD00F9CBB100F7D2BB00E2CDC300ADA9
      A900BCBBBA00E4D6D000EDDED700EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600CECE9C009C63
      31009C6331009C6331009C633100CE9C6300E7E7E700F7F7F700CECE9C009C63
      63009C633100DEDEDE00F7F7F700CE9C63009C633100CE9C9C00EFEFEF00F7F7
      F700CE9C9C009C6331009C6331009C6331009C633100CE9C6300EFEFEF00EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EDC4
      B700FACFC400FFDAC300FED3B200F5C9AA00F3C6A900F3C7AA00F3C6A900F0C3
      A600F9CEB000FFDABB00DBCABA00B7BBBB00FAD7BE00AE836C00AE968700EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600399CDE005AADE70063B5E70063B5E70063ADE7005AAD
      E7005AADE70052A5DE0052A5DE00ADD6EF00E7F7FF005AADE700399CDE00319C
      DE006BB5E700D6EFFF00BDDEF7002994DE00319CDE00DEEFFF00CEE7F7002994
      D6002184BD00106B9C00EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600DFC8C200D4B09E00FEDB
      B800FFDCB900FFDCB900FFDCB900FFDCB900FFDCB900FFDAB600BE9A88009E97
      9700E9DCD600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600DEDEDE009C63
      63009C6331009C6331009C6331009C633100CE9C9C00F7F7F700F7F7F700F7CE
      A5009C633100DEDEDE00F7F7F700CE9C6300CE9C9C00EFEFEF00FFFFFF00F7CE
      A5009C6331009C6331009C6331009C6331009C633100CECE9C00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EDC5
      B800FAD2C900FFDFC800EDBE9F00E1A68600E8AE8C00E7AF8E00E7B09100E8B2
      9300E9B59700E8B89C00EABBA000F2C4A700FFDAC000B0897400B0998B00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600399CDE0063ADE7006BB5E7006BB5E7006BB5E70063AD
      E7005AADE7005AA5E70052A5DE00A5CEEF00F7FFFF0073B5E700399CDE00319C
      DE007BBDE700DEEFFF00BDDEF700319CDE0063B5E700EFF7FF00A5CEEF002994
      D6002184BD00106B9C00EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600DECCC800DBB8A500FFE2
      C400FFE2C400FFE2C400FFE2C400FFE2C400FFE2C400FFE2C400AF8F8500AFAD
      AD00EEE1DB00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600CE9C
      9C009C6331009C6331009C6331009C6331009C633100CECE9C00EFEFEF00F7F7
      F700CE9C6300DEDEDE00F7F7F700CE9C6300CECECE00FFFFFF00CECE9C009C9C
      63009C6331009C6331009C6331009C633100CE9C6300E7E7E700EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EEC8
      BB00FCD7CD00FEDEC900E7AD8B00F8A27400FFB07F00FFB18300FFB58800FFB6
      8A00FAB18700F3AD8600F1B18C00EAAE8C00EDC0A600B38D7900AF988B00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00429CDE0063B5E70073BDE70073BDE7006BB5E70063AD
      E7005AADE7005AADE70052A5DE007BBDE700E7F7FF00D6E7F70052A5DE00399C
      DE00399CDE0063B5E7004AA5DE0042A5DE00B5DEF700F7FFFF005AADE7002994
      D6002184BD0010639C00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00C8ADA900EED3C000FFE8
      D100FFE8D100FFE8D100FFE8D100FFE8D100FFE8D100FCE4CE00937B7900CEC2
      BE00EED5CD00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00CECE
      CE009C9C63009C6331009C6331009C6331009C6331009C633100CE9C6300CECE
      9C009C9C6300DEDEDE00F7F7F700CE9C6300CE9C9C00CE9C9C009C6331009C63
      31009C6331009C6331009C6331009C633100CECE9C00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFCA
      BD00FCD9D200FFE3CD00E6AE8C00F2895300FF935700FF965C00FF996000FF9B
      6400FF9F6A00FFA37000FFA67400FFA87600E2A38200B48F7C00B29C8F00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00429CDE006BB5E7007BBDE7007BBDEF0073BDE7006BB5
      E70063ADE7005AADE7005AADE70063ADE700ADD6EF00F7FFFF00BDDEF70073B5
      E700429CDE00429CDE006BB5E700B5DEF700F7FFFF00B5DEF700319CDE002994
      D6002184BD0010639C00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EEDDD900BE9C9600FCEAD900FFEE
      DC00FFEEDC00FFEEDC00FFEEDC00FFEEDC00FFEEDC00EAD3C40090858500E5D8
      D400EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00CECE9C009C6331009C6331009C6331009C6331009C6331009C6331009C63
      31009C633100DEDEDE00F7F7F700CE9C63009C6331009C6331009C6331009C63
      31009C6331009C6331009C633100CE9C9C00E7E7E700EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00F0CB
      BF00FCDCD500FFE1CB00F4CBAC00E4986F00E7875500E7845300E9855300F188
      5200FA894F00FF8B4E00FF8D4F00FF8E5200E29D7B00B9978300B29D9000E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE004AA5DE007BBDE7008CC6EF008CC6EF007BBDEF0073BD
      E7006BB5E7006BB5E70063ADE7005AADE70063B5E700BDDEF700FFFFFF00EFF7
      FF00DEEFFF00DEEFFF00EFF7FF00F7FFFF00BDDEF70052ADDE003194DE002994
      D600217BBD0010639C00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E6D7CF00C6B1AE00E0CAC200FFF4E900FFF4
      E900FFF4E900FFF4E900FFF4E900FFF4E900FEF3E800BDA59F00BCB8B600E7D7
      D000E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00EFEFEF00CE9C9C009C6331009C6331009C6331009C6331009C6331009C63
      31009C633100DEDEDE00F7F7F700CE9C63009C6331009C6331009C6331009C63
      31009C6331009C633100CE9C6300DEDEDE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00F2D1
      C500FDE4DF00FFE5D200FFDFBE00F8D4B600F1CAAC00F2C7A800F1C3A400ECB5
      9500E6A68300E19C7600E1977000E1987200F5CAAF00C19F8A00B19B8E00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE0052A5DE0084C6EF009CCEEF0094CEEF008CC6EF007BBD
      E70073BDE7006BB5E7006BB5E70063B5E70063ADE70063ADE7008CC6EF00BDDE
      F700DEEFFF00DEEFFF00BDDEF7007BBDE7004AA5DE00429CDE00319CDE00298C
      D600187BBD0008639C00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00DBCAC600C5ACAB00FFFAF500FFFAF500FFFA
      F500FFFAF500FFFAF500FFFAF500FFFAF500E9DDD900B2A5A400E5DCD700E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00EFEFEF00CECE9C009C6363009C6331009C6331009C6331009C63
      31009C633100CE9C6300CE9C63009C6331009C6331009C6331009C6331009C63
      31009C633100CE9C6300DEDEDE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600F7E5
      DC00FEF5E600FFF9E500FFF3D000FFF4D100FFF3D100FFF1CE00FFEFCC00FFEC
      CB00FFEACB00FCE5C800FBE2C600FCE1C500FFE6CA00CBA99200C9B8AD00E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C6005AADE70084BDEF009CCEEF0094CEEF008CC6EF007BBD
      E70073BDE70073B5E7006BB5E7006BB5E70063B5E70063ADE70063ADE70063AD
      E7005AADE7005AADE70052ADE7004AA5DE004AA5DE00429CDE003194DE00298C
      CE00187BBD00186B9C00E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E8D9CC00DDCCC900CFB9B900D9C9C800DFD1D000D6C3
      C300DDCDCD00E0D0D000DAC8C700D9C7C600D5C7C600DDD2C900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600F7CEA500CE9C63009C6331009C6331009C63
      31009C6331009C6331009C6331009C6331009C6331009C6331009C633100CE9C
      6300CECE9C00E7E7E700E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600FAEFDF00FAEEDA00FAEFDA00F9F0DB00F9F1DB00F8F0DC00F9F2DC00F7EB
      D100F4DDB600FCE8C000FFEEC500FFEFC600FEEBC400EBDBCD00E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC6008CC6EF0063B5E70084BDEF0084BDEF0073BDE7006BB5
      E70063B5E70063ADE7005AADE7005AADE7005AADE70052A5E70052A5E70052A5
      DE004AA5DE004AA5DE0042A5DE00429CDE00399CDE00319CDE002994D600218C
      CE001073B5006B9CC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7E7E700F7CEA500CE9C9C00CE9C
      63009C6331009C6331009C6331009C633100CE9C6300CE9C6300CECE9C00DEDE
      DE00E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600F9F3
      EF00F5E6DB00F7E9DD00F8ECDF00F8ECDF00F8EDE000E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7F7FF0094C6EF0052ADE7004AA5DE00429CDE00399C
      DE00399CDE00399CDE00319CDE00319CDE00399CDE00319CDE003194DE003194
      DE002994DE002994DE002994DE002994DE002194D600188CD600188CD6002184
      CE006BADD600DEEFF700E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600EFEFEF00DEDE
      DE00D6D6D600F7CEA500CECECE00D6D6D600DEDEDE00EFEFEF00E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700EFE7DE00D6C6B500C6A5
      8400C6AD9400E7E7E700FFF7F700FFF7F700F7EFE700F7E7E700F7F7EF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70000000000000000000000
      000000000000FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00D6B5
      A500BD846300AD735A009C847B00BDB5BD00D6D6D600CECECE009C949400735A
      4A009C6B5200BD7B5A00BD7B6300BD7B6300BD7B6300BD7B6300AD7B6B00B5B5
      AD00D6D6D600CECECE00A59C9C0084635A00A5847B00E7D6D600FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700F7E7DE00E7AD6B00EFAD1000FFCE
      0000EF9C1800C6A59400EFEFEF00EFE7E700DEA56B00C68C4200CEAD9C00E7DE
      DE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F70000000000000000000000000084848400CECECE00CECE
      CE009C9C9C0000000000FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E7BDAD00EF9C
      8400EFB5A500CEB5AD00D6CECE00DEDEDE00D6CECE00DED6D600DEDEDE00B5AD
      AD00AD948400EFBDAD00F7CEB500F7CEB500F7CEB500F7C6B500CEADA500D6D6
      DE00EFEFEF00EFEFEF00CEC6C600AD8C8400C6846300AD8C8400FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700F7DED600F7BD5200FFE70000FFEF
      0000FFD60000D6943900C6ADA500D6A58C00F7BD1800FFD60000DE9C1800C69C
      7300E7DEDE00F7F7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00000000000000000000000000CECECE00FFFFFF00FFFFFF00FFFFFF00CECE
      CE009C9C9C0000000000FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00DE947300F7B5
      9C00E7BDA500CEBDB500DEDEDE00BDB5AD00CEAD9C00CEB5AD00D6D6D600CECE
      CE00A5948400E7BDA500F7CEB500F7CEB500F7CEB500F7CEB500BDADA500DEDE
      E700EFEFEF00EFEFEF00D6CED600A5948C00CE948400A56B5200FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00E7E7DE00E7E7DE00FFF7EF00FFF7EF00E7D6CE00E7B54A00FFD60000FFB5
      0000FFAD0000F7940800D6943100E7A52100FFDE0000FFEF0000FFC60000E794
      1800C69C8400E7E7DE00FFF7EF00FFF7EF00FFF7EF00FFF7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF0000000000000000000000
      0000CECECE00FFFFFF00FFFFFF00FFFFFF004A4A4A004A4A4A00FFFFFF00CECE
      CE00CECECE009C9C9C0000000000F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00E78C6300EFB5
      9C00E7B5A500CEC6BD00DEDEDE00A59C9400BD9C8400CEAD9C00CEC6C600D6D6
      D600A59C8C00DEB59C00F7CEAD00F7CEAD00F7CEAD00EFC6A500BDB5AD00DEDE
      DE00EFE7EF00EFEFEF00D6D6DE00A59C9C00CE9C8400B5735200F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00E7DE
      CE00EFB57300D6A57300CECEC600DECECE00D6A57300EFBD2100FFC60000FF94
      0000FF940000FF9C0000FFCE0000FFE70000FFEF0000FFCE0000FF9C0000FF9C
      0000D6843900DEC6C600F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00000000000000000000000000CECECE00FFFFFF00FFFF
      FF00FFFFFF00949494004A4A4A00000000004A4A4A006363630094949400FFFF
      FF00CECECE009C9C9C0000000000F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DE8C6300EFB5
      9400E7B59C00CEBDBD00D6D6DE00BDBDBD00AD9C9400BDADAD00D6D6D600D6D6
      D600AD9C8C00DEB59400F7C6A500F7C6A500F7C6A500EFBD9C00BDADAD00D6D6
      D600E7E7E700E7E7E700CECED600AD9C9C00D69C8400B56B5200F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00E7DED600E7B5
      7300FFCE1000F7CE1000DE944A00DE9C4200FFC61000FFE70000FFC60000FF94
      0000FF940000FF9C0000FFBD0000FFCE0000FFC60000FF9C0000FF940000F784
      0000CE632100C6A59400EFE7E700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF000000000000000000CECECE00FFFFFF00FFFFFF00FFFFFF00949494004A4A
      4A000000000094630000BD7B0000FFAD2100FFAD2100FFAD210063636300FFFF
      FF00CECECE00CECECE009C9C9C0000000000F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DE8C6300EFAD
      8C00E7AD9400CEBDB500D6D6D600DEDEDE00D6CED600DED6D600DEDEDE00CECE
      CE00A5948C00DEAD9400F7BD9C00F7BD9C00F7BD9C00F7BD9C00CEAD9C00BDB5
      AD00DEDEDE00D6D6D600BDADAD00C6A58C00E7A58400AD6B5200F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFEF00F7EFEF00EFE7E700E7C68C00F7C6
      1800FFD60000FFC60000FFCE0000FFCE0000FFD60000FFCE0000FFAD0000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF9C
      0000F7AD0000DE8C1800C6A58C00EFE7DE00F7EFEF00F7EFEF00F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE7000000
      0000CECECE00FFFFFF00FFFFFF00949494004A4A4A000000000094630000BD7B
      0000FFAD2100FFAD2100FFAD2100FFAD2100FFAD2100FFAD2100FFAD21009494
      9400FFFFFF00CECECE009C9C9C0000000000F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700DE845200EFA5
      7B00E7AD8C00CEBDB500D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECE
      CE00A5948400DEA58400F7BD9400F7BD8C00F7BD8C00F7BD8C00F7B59400C6A5
      9400CEC6CE00BDBDBD00AD8C8400DE9C7B00EF9C7B00B56B4A00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700EFE7E700EFC68C00FFBD
      1000FFB50000FF940000FFA50000FFB50000FFB50000FFA50000FF940000FF94
      0000FF940000FF9C0000FF9C0000FF9C0000FF940000FF940000FF9C0000FFAD
      0000FFC60000FFB50000D67B2100CEBDB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE7000000
      0000FFFFFF00949494000000000094630000BD7B0000FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A00FFD68C00FFBD4A00FFBD4A00FFBD4A006363
      6300FFFFFF00CECECE00CECECE009C9C9C0000000000F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700DE7B5200EF9C
      7300DEA58400C6B5AD00D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00CEC6
      C600A5948400DE9C7300F7B58C00F7B58C00F7B58C00F7B58C00F7B58C00CEA5
      8C00BDBDBD00B5B5B500A58C7B00DE947300EF9C7300B56B4A00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7EFE700F7EFE700F7EFE700EFD6BD00F7AD
      3900FFA50000FF9C0000FF9C0000FF9C0000FF9C0000FF940000FF9C0000FFA5
      1000FFAD2900F7B53900EFB54200F7B53900FFA52100FF9C0000FF9C0000FF9C
      0000FFA50000FFAD0000F78C0000BD9C8C00F7EFE700F7EFE700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E7000000
      0000FFFFFF00949494004A4A4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A006BFFFF00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A0094949400FFFFFF00CECECE009C9C9C0000000000F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E70000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700D67B5200E794
      6B00DE9C7B00C6ADAD00D6CED600DEDEDE00D6D6D600D6D6D600DEDEDE00C6C6
      C600A58C7B00DE946B00F7AD8400F7AD8400F7AD8400F7AD8400F7AD7B00CE9C
      8400B5B5BD00B5B5B500A5847300D68C6300E7946300AD6B4200F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E7DECE00EFB5
      6B00FFA50800FFA50000FFA50000FFA50000FFA50000FFA50800EFAD3900EFBD
      7B00F7DEAD00EFD6B500E7D6BD00EFD6B500F7D69400FFBD4200FFA50000FFA5
      0000FFA50000FFA50000FF8C0800C69C8400F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E70000000000FFFFFF006363630094630000FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A006BFFFF006BFFFF00FFBD4A00FFBD4A00FFBD
      4A0063636300FFFFFF00CECECE00CECECE009C9C9C0000000000F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E70000000000000000000000
      000000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000848484000000
      0000F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700D67B4A00E78C
      6300D6947300BDADA500CECECE00D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      BD00A58C7B00D6946300F7AD7300F7AD7300F7AD7300EFA57300CE947300A584
      84009CA5BD009CA5B50084737B00A5735A00CE7B5200AD634200F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7E700E7DEDE00CEBDB500CEB59C00E79C
      4A00FF9C0000FFA50000FFAD0000FFAD0000FFAD1800EFB56300E7CEB500EFDE
      D600F7EFE700F7E7E700F7E7E700F7E7E700F7EFD600FFE77300FFBD3900FFA5
      0000FFAD0000F7940800DE945200E7CEBD00F7E7E700F7E7E700F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE0000000000FFFFFF00949494004A4A4A00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A006BFFFF00FFD68C006BFFFF006BFFFF006BFF
      FF006BFFFF0094949400FFFFFF00CECECE009C9C9C0000000000F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE000000000084848400848484008484
      840000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000848484000000
      0000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00D6734200E784
      5200D6946B00BDA5A500CECECE00D6D6D600D6D6D600D6D6D600D6D6D600BDBD
      BD00A5847B00D68C5A00F7A56B00F7A56B00F79C6B00BD8484006B7BB5005A8C
      D6006B94E7006394E7005A84CE00526BA5007B525A00945A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00EFBD8400F79C3900F7942900FF8C
      0800FF940000FFAD0000FFAD0000FFAD1000E7AD7300E7D6C600EFE7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00E7E7C600FFF76B00FFD65A00FFB5
      1000FFA50000CE8C4A00DEC6BD00EFE7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE0000000000FFFFFF006363630094630000FFBD4A00FFBD4A00FFBD
      4A006BFFFF00FFBD4A00FFBD4A006BFFFF00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A0063636300FFFFFF00CECECE00CECECE009C9C9C0000000000F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE0029292900292929002929
      29002929290029292900292929000000000000000000C6C6C600C6C6C600C6C6
      C60000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000B5B5B5000000
      0000F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00D6734200E77B
      4A00D68C6300BDA59C00CEC6CE00D6D6D600D6D6D600D6D6D600D6D6D600BDBD
      BD009C847B00D68C5200F79C6300F79C5A00CE8C6B007384BD0073B5F7008CCE
      FF008CCEFF008CCEFF0084CEFF0073B5F700426BBD0063424200F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00F7E7DE00F7AD6300FF7B0000FF730000FF7B
      0000FFA50000FFB50000FFB50800E7A56300DECECE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00EFE7DE00E7DE9C00FFF76300FFDE5A00FFBD
      2100FFA50000DE842100C6A59400EFDED600F7E7DE00F7E7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE0000000000FFFFFF00949494004A4A4A006BFFFF006BFFFF006BFF
      FF00FFD68C006BFFFF00FFD68C006BFFFF00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A0094949400FFFFFF00CECECE009C9C9C0000000000EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600F7F7F70000000000E7E7E700E7E7E700E7E7
      E70000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000E7E7E7000000
      0000EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00D6734200DE73
      3900CE846300BDADA500CECECE00CECECE00CECECE00CECECE00CECECE00C6C6
      C6009C8C8400B5734A00EF945200F7945200AD7B84005294E70073C6FF007BCE
      FF0084CEFF0084CEFF0084CEFF007BCEFF004A94FF004A425A00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFE7DE00F79C5200FF840000FF9C0000FFA5
      0000FFB50000FFBD0000F7AD3100CEB5AD00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00E7DEC600EFE77300FFEF5A00FFD65A00FFBD
      1800FFB50000FF9C0000CE8C5200E7D6CE00EFE7DE00EFE7DE00EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED60000000000FFFFFF006363630094630000FFBD4A00FFBD
      4A00FFBD4A00FFBD4A006BFFFF006BFFFF00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A0063636300FFFFFF00CECECE00CECECE009C9C9C000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED60010101000101010001010
      10001010100010101000101010000000000000000000C6C6C600C6C6C600C6C6
      C60000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000B5B5B5000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600D66B3900CE73
      4200B58C7B00BDBDBD00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00ADADAD008C736300BD7B4200F7944A00AD7B84004A94EF005ABDFF0063C6
      FF0063C6FF0063C6FF0063C6FF005ABDFF003994FF0042426B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600F7AD5A00FFAD0000FFC60000FFC6
      0000FFC60000FFC60000D69C5A00E7DEDE00EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFE7DE00EFE7D600E7D68C00F7D65200FFD65200FFC65200FFC6
      0800FFC60000F7AD1000D6AD8400EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED60000000000FFFFFF00949494004A4A4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A006BFFFF00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A0094949400FFFFFF00CECECE009C9C9C000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6000000000084848400848484008484
      840000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000848484000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600D66B3900B57B
      6300B5ADAD00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C6009C9C9C00946B5200DE844200A57B8400318CEF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF00298CFF0039426B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600F7BD7B00FFC61000FFC60800FFC6
      0000FFCE0000FFC60000C6946B00E7E7DE00EFDED600EFDED600EFDED600EFDE
      D600EFDED600DED6C600E7C68400F7C65200F7BD4200F7BD5200FFC63100F7B5
      0800E7A53100E7AD7300E7D6C600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000000000FFFFFF006363630094630000FFBD
      4A00FFBD4A00FFBD4A00FFBD4A00FFD68C00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A0063636300FFFFFF00CECECE00CECECE009C9C
      9C0000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED60000000000000000000000
      000000000000E7E7E700C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000848484000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600C6734A00A59C
      9400C6C6C600DED6DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600BDBDC60094847300BD7342009C7B7B00217BEF0021A5FF0021AD
      FF0021ADFF0021ADFF0021ADFF0021ADFF001084FF0039426B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFD6BD00E7BD7300F7AD3900FFAD
      1000FFCE0000FFC60000DE8C4200C6AD9400CEC6BD00DEDED600DEDED600D6C6
      C600CEB58C00E7B56300EFAD4200EFAD3900EFAD4200F7B54200FFC61000DEA5
      5200DEC6B500EFD6C600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000000000FFFFFF00949494004A4A4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFAD2100FFAD2100FFAD210094949400FFFFFF00CECECE009C9C
      9C0000000000EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D60000000000E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70000000000000000000000
      0000EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600BD845A00BDBD
      C600E7E7E700EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00E7DEE700B5ADAD00B57B5200947384001873EF00089CFF00089C
      FF00089CFF00089CFF00089CFF00089CFF00007BFF0039426B00EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFDED600EFDED600F7CEAD00FF8C2900FF8C
      0000FFC60000FFD60000E78C1800E7944200DE9C5200CE9C6300D69C6300E7A5
      4A00E79C4200E7943900E7943100DE943900EFA53900FFCE0800EFAD2900C6B5
      A500EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0000000000FFFFFF00636363009463
      0000FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFAD2100FFAD2100FFAD
      0000FFAD0000FFAD0000DE940000DE94000063636300FFFFFF00CECECE00CECE
      CE009C9C9C0000000000EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00BD8C7B00DEDE
      E700EFEFEF00EFEFEF00EFEFEF00E7E7E700D6CECE00D6D6D600E7E7E700EFEF
      EF00EFEFEF00EFEFEF00CEC6CE00B59C8C009C9CB500318CEF0018A5FF00089C
      FF00009CFF00009CFF00009CFF00009CFF000073FF0039396B00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFDECE00F7CEA500FF841800FF8C
      0000FFD60000FFDE0000F7BD0800DE7B2100DE7B2900DE842900DE842900D684
      2900D67B3100D67B3100DE8C3100EFAD2900FFCE0800FFDE0000F7B52900CEA5
      9400EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0000000000FFFFFF00949494004A4A
      4A00FFAD2100FFAD2100FFAD2100FFAD2100FFAD2100FFAD2100DE940000DE94
      0000DE940000DE940000DE940000BD7B0000BD7B000094949400FFFFFF00CECE
      CE009C9C9C0000000000EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00BD947B00E7E7
      EF00EFEFEF00EFEFEF00E7E7E700B5ADAD00D6BDAD00D6BDB500D6CECE00EFEF
      EF00EFEFEF00EFEFEF00CECECE00BDAD9C00ADADC60084B5F70094D6FF0063C6
      FF0031B5FF0018A5FF00089CFF00009CFF000073FF0039396B00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00EFD6CE00EFDECE00F7DEBD00F7B52900FFCE
      0000FFDE0000FFDE0800FFE70000F7BD0800E78C1800DE7B2100D67B2100D67B
      2100E7842900EF9C2100FFBD1800FFC62100F7BD3100F7C62100E7B56B00DECE
      BD00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE0000000000FFFFFF006363
      63004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0063636300FFFFFF00CECE
      CE00CECECE009C9C9C0000000000E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00C6947B00DEDE
      DE00EFEFEF00EFEFEF00D6D6D600B5A59C00F7D6BD00EFCEBD00CEC6C600EFEF
      EF00EFEFEF00EFEFEF00C6C6C600CEB5A500B5B5CE008CB5F700ADDEFF00ADDE
      FF009CDEFF007BCEFF005ABDFF0042B5FF00298CFF0039426B00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00EFD6CE00EFDECE00EFD67300FFDE
      2900F7D64200F7C64A00FFC60800FFDE0000FFDE0000F7CE0000F7BD0800F7C6
      0800FFCE0800FFD60800EFC63100DEB57B00E7BDA500E7BD9400DED6C600E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE0000000000FFFFFF009494
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400FFFF
      FF00CECECE009C9C9C00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00D69C7B00CEC6
      CE00EFEFEF00F7F7F700DED6DE00B5A59C00F7D6BD00EFCEC600D6CEC600F7EF
      F700F7F7F700EFEFEF00BDB5B500DEC6B500BDBDD6008CB5F700B5DEFF00B5E7
      FF00B5E7FF00B5E7FF00ADDEFF009CDEFF0073B5FF00524A6B00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6CE00E7D6CE00E7D6CE00EFDEBD00EFD6
      A500E7CEAD00DEC6A500FF9C1800FFDE0000FFEF0800FFD62100EFCE3900FFCE
      2100FFEF0000F7D62100DEB57B00DECEC600E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C60000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE0000000000E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600D69C8400CEC6
      BD00E7DEE700F7F7F700D6D6D600B5A59C00F7D6C600EFCEC600D6CEC600F7F7
      F700F7F7F700DEDEDE00C6B5B500F7DEC600BDBDD60094B5EF00BDE7FF00BDE7
      FF00BDE7FF00BDE7FF00BDE7FF00BDE7FF007BADEF006B637300E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7D6C600E7D6C600E7D6C600E7D6CE00E7D6
      CE00E7D6C600E7D6C600FFBD3100FFDE1000EFCE3900E7CE9400E7CEB500E7B5
      7300F7C64200E7CE8400E7D6BD00E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7C6B500E7B5
      9C00D6CEC600E7E7E700CECECE00C6B5AD00F7DECE00F7DECE00D6CECE00EFEF
      EF00DEDEDE00C6C6BD00E7D6C600FFE7D600E7D6D60094A5E700A5C6FF00C6EF
      FF00CEE7FF00CEEFFF00C6E7FF009CC6FF00737BB500BDADB500E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600F7E7B500F7D6A500EFDEB500E7D6CE00E7CEC600F7E7
      D600F7E7CE00E7CEBD00E7D6C600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600FFF7F700E7C6
      BD00C69C8400C69C8400BD9C8400D69C8400EFAD8C00E7AD8C00CEA58C00BDA5
      9400C69C8400D69C8C00EFAD8C00EFAD8C00EFAD8C00D69C94009C849C008484
      AD008484B5008484B5008484AD00948CAD00CEBDC600F7F7F700E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C6C3C300A87676009974
      7400967474008C7474008C74740096747400987474008C7474008C7474008C74
      74008C747400907474009C909000FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700CAC9C900EC0D0D007700
      000072000000DB000000CC000000740000006B000000DB000000DB000000DB00
      0000D6000000AB0000008F6F6F00FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700DEDED600BDC6BD00BDC6BD00BDC6
      BD00C6BDBD00C6BDBD00C6BDBD00C6BDBD00C6BDBD00C6BDBD00C6BDBD00C6BD
      BD00C6BDBD00CEC6C600D6CECE00D6CECE00BDCEBD00BDC6BD00EFEFE700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700E7EFE7009CCEAD00A5CEB500A5CEB500A5CEB500A5CEB500A5CE
      B500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CE
      B500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB5009CCEAD00E7EFE700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7EFE700D6C6
      B500C6BDB500C6BDB500C6BDB500C6BDB500C6BDAD00C6BDAD00C6BDAD00C6BD
      AD00C6BDAD00C6BDAD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5
      AD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6ADAD00D6CECE00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700CAC9C900E31B1B006B00
      0000120000004B000000E10000007A0000000E0000004B0000004B0000004B00
      000083000000DC0000008B747400FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700CECEC600187B420000A5520000A55200007B
      3900101810001018100010181000101810001018100010181000101810001018
      10001018100021392100395A3900395A3900088C4A0000A552005A946B00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700E7EFDE003194390000730000007300000073000000730000007300000073
      0000007300000073000000730000007300000073000000730000007300000073
      000000730000007300000073000000730000007300000073000031943900E7EF
      DE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700D67B3100DE94
      5A00DE945A00DE8C5A00D68C5200D6845200D6844200CE7B4200C67B4200C673
      4200BD6B3900C66B3900BD633900BD633100BD5A3100BD5A3100BD5A3100BD5A
      3100BD5A3100BD5A3100BD5A3100BD5A3100AD391000C6AD9C00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00CAC9C300E31B1A007300
      00000000000000000000CA000000860000000000000000000000000000000000
      000042000000DC0000008C747100FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF000063210000CE7B0000CE7B0000CE7B0000A5
      52000039000000390000185A1800427B42000039000000390000003900000039
      00000039000000520000006B0000006B000000B5520000CE7B0039845200FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      F7009CCEAD000073000000840000188C1800218C2100218C2100188C2100188C
      2100188C2100108C2100108C2100088C1800088C1800108C1800088C1800088C
      1800088C1800008C1800008C1800008C1800008C100000840000007300009CCE
      AD00FFF7F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7F700FFF7F700E7945200FFF7
      FF00FFF7F700FFF7F700F7F7F700F7F7F700F7F7F700F7EFEF00F7EFEF00EFE7
      E700D6CECE00E7DEDE00EFE7E700EFE7E700EFE7E700EFDEE700EFDEDE00EFDE
      DE00E7DEDE00E7DEDE00E7DEDE00E7D6D600BD6B5A00C6ADA500FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00C5C9C300E21B1A007900
      00002300000023000000B60000007C0000000000000000000000000000000000
      000046000000E300000089747100F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF0000A5520000CE7B0000CE7B0000CE7B0000A5
      52000039000000390000427B4200CECECE000039000000390000003900000039
      00000039000000520000006B0000006B000000B5520000CE7B0039845200F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00FFF7
      EF00A5CEB50000730000188C18008CCE9400B5E7C600A5E7BD0094E7B5008CE7
      AD007BE7AD006BE7A5006BE7A5005AE79C005AE79C0052E79C0042E7940031E7
      8C0031E78C0018E7840018E7840018E7840010CE6300008C100000730000A5CE
      B500FFF7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00FFF7EF00FFF7EF00E7945200FFFF
      FF00FFFFFF00EFF7FF00EFF7FF00EFF7FF00EFF7FF00EFEFF700FFF7F700EFE7
      EF00B5ADB500E7D6DE00F7EFF700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7E7E700EFE7E700EFE7E700EFDEDE00C6735A00C6ADA500FFF7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00C5C3C300DF1A1A008C00
      0000890000008A0000007C000000760000003D0000003C000000450000003500
      00005A000000AB0000008E717100F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF0000A5520000CE7B0000CE7B0000CE7B0000A5
      52000039000000390000427B4200CECECE000039000000390000003900000039
      00000039000000520000006B0000006B000000B5520000CE7B0039845200F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7F7
      EF00A5CEB50000730000218C2100BDE7C600F7FFFF00DEFFF700D6FFF700C6FF
      EF00B5FFEF00A5FFE7009CFFE70094FFE70094FFDE006BFFD60063FFCE004AFF
      C60042FFBD0029FFB50021FFAD0021FFB50018E78400008C180000730000A5CE
      B500F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7F7EF00F7F7EF00E79C5200FFFF
      FF00E7EFFF008CBDF7006BADEF0063ADF7005AA5EF008CB5EF00FFF7F700EFE7
      EF00B5ADB500E7DEDE00F7F7F700F7EFF700F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7E7E700EFE7E700EFDEDE00C6735A00C6ADA500F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00C5C3C300DF1A1A008A00
      00007E000000830000007E0000007F000000880000009300000048000000D400
      0000E3000000AA0000008D717100F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF0000A5520000CE7B0000CE7B0000CE7B0000A5
      52000039000000390000185A1800427B42000039000000390000003900000039
      00000039000000520000006B0000006B000000B5520000CE7B0039845200F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00A5CEB50000730000218C2100BDDEC600EFFFFF00D6FFF700D6FFF700ADEF
      D60073C69C0063BD840052BD7B0052BD840052BD7B0039BD730039BD730031C6
      7B0042EFA50042FFB50029FFAD0021FFAD0018DE8400008C180000730000A5CE
      B500F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00E79C5200FFFF
      FF00D6EFFF0063B5F7005ABDF7004ABDFF00189CEF004A8CE700FFF7FF00EFEF
      EF00B5ADB500E7DEDE00F7F7F700EFE7EF00EFE7E700EFE7E700EFE7E700EFE7
      E700EFE7E700EFDEE700EFE7E700EFDEDE00C6735A00C6ADA500F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700C5C3BD00DF1A1A008C00
      00008F00000031000000B00A0900DB110000CC000000810000001C0000001F00
      000066000000DD00000089716F00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE70000A5520000CE7B0000CE7B0000CE7B0000A5
      5200003900000039000000390000003900000039000000390000003900000039
      00000039000000520000006B0000006B000000B5520000CE7B0039845200F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      EF00A5CEB50000730000218C2100BDDEC600EFFFFF00D6FFF700CEF7E70063BD
      7300108418001084100010841000088410000884100008841000088410000884
      100021B55A0042F7B50042FFB50029FFB50018DE8400008C180000730000A5CE
      B500F7EFEF00F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFEF00F7EFEF00E79C5200FFFF
      FF00DEEFFF0084C6F700A5E7FF0094E7FF004AC6FF004A94E700FFFFFF00EFEF
      EF00B5ADB500E7DEDE00F7F7F700C6C6C600B5B5B500B5B5B500B5B5B500B5B5
      B500B5ADB500BDBDBD00E7DEDE00EFDEDE00C6735A00C6ADA500F7EFEF00F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700C5C3BD00DA1A1A00A900
      0000E20000001C000000889B950071D23300E00000007F00000022000000111B
      1B005C161600D900000089716F00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE70000A5520000CE7B0000CE7B0000CE7B0000C6
      730000A5520000A5520000A5520000A5520000A5520000A5520000A5520000A5
      520000A5520000AD520000B5520000B5520000CE730000CE7B0039845200F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700A5CEB50000730000218C2100BDDEC600EFFFFF00D6FFF700BDF7DE004294
      4A00299C39007BCE9C0084D6AD0073D6A5006BD69C006BD69C005ACE8C00189C
      3100189C390052F7AD004AFFBD0042FFBD0031DE8C00088C180000730000A5CE
      B500F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700EF9C5200FFFF
      FF00DEEFFF0094C6F700C6E7FF00BDF7FF0073D6FF004A9CE700FFFFFF00EFEF
      EF00B5ADB500E7DEDE00F7EFF700C6BDC600ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00BDB5B500E7DEDE00EFDEDE00C6735A00C6ADA500F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700C7C0C000EC191900B800
      0000F60000002100000094A9A900A4D5E300DC0000007F00000020000000758D
      8D00BC717100D1000000896F6F00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E70000A5520000CE7B0000CE7B0000CE7B0000CE
      7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE
      7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE7B0000CE7B0039845200F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7EF
      E700A5CEB50000730000218C2100BDDEC600F7FFFF00DEFFF700CEF7E7005AB5
      630039AD5200A5EFD600BDFFEF00B5FFE700ADFFE7008CFFDE0084F7CE0029A5
      4A00219C39005AF7B5005AFFC6004AFFBD0031DE8C00088C180000730000A5CE
      B500F7EFE700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7EFE700F7EFE700EF9C5A00FFFF
      FF00DEEFFF0084C6F7009CCEF7009CD6FF006BBDF7005A9CE700FFFFFF00EFEF
      EF00B5ADB500E7DEDE00FFF7F700FFF7F700FFF7F700FFF7F700F7EFF700F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00EFE7E700C6735A00C6ADA500F7EFE700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700C4B9B900C6BBBB00C6BBBB00C6BBBB00C6BB
      BB00C6BBBB00C6BBBB00C6BBBB00C6BBBB00C6BBBB00B7B0B0005F1A1A003600
      00004B000000040000002E38380021575700E6000000800000001E0000001F2D
      2D006D242400DD000000896F6F00F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E70000A5520000CE7B0008D68C0052E7BD0052E7
      BD0052E7BD0052E7BD0052E7BD0052E7BD0052E7BD0052E7BD0052E7BD0052E7
      BD0052E7BD0052E7BD0052E7BD0018DE9C0000CE7B0000CE7B0039845200F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700A5CEB50000730000218C2100BDDEC600F7FFFF00E7FFF700D6FFF700BDEF
      D6009CE7B500B5F7DE00B5FFE700B5FFE700ADFFE7009CFFDE0084F7C60031A5
      4A00219C39006BF7B5006BFFC6005AFFC60042DE9400088C180000730000A5CE
      B500F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700EFA55A00FFFF
      FF00EFF7FF00ADD6F7008CC6F7008CC6F70084BDEF00A5C6F700FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00FFF7F700FFF7F700F7F7F700F7EFF700F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00EFE7E700C6735A00C6ADA500F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00807F7F009A9A9900837C7C008B8289008B82
      8A0088878A00838B8A00838B8A0083828A0083828A008A888A00667574006470
      70005E6F6F00707272000E0C0C00600000008E0000007C0000006C0000005E00
      00006C0000008F000000906F6C00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE0000A5520000CE7B0018DE9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0052E7BD0000CE7B0000CE7B0039845200F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      E700A5CEB50000730000218C2100BDDEC600FFFFFF00E7FFFF00CEFFEF006BBD
      7B0073C68400CEF7E700BDFFE700ADFFE700B5FFE700B5FFEF009CF7DE0031AD
      4A00319C42008CF7D6007BFFD6006BFFCE0052DE9C00108C180000730000A5CE
      B500F7E7E700F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7E700F7E7E700EFA55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00DED6D600CEC6CE00CEC6CE00CEC6CE00CEC6
      C600CEC6C600D6C6CE00EFE7E700EFE7E700C6735A00C6ADA500F7E7E700F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE008E8E8E005853530086B1B200CCFCC600C0FF
      C100E8E0C900FFC0C700FFC8C200FDFFCC00FFFFC000F4F4E900F1F1FB00F4F4
      F300FAFAFA00C2C2C200131313000600290001002D0004002D0007000C000900
      0000060000000100000075706E00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE0000A5520000CE7B0018DE9C00FFFFFF00C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      84008484840084848400DEDEDE0052E7BD0000CE7B0000CE7B0039845200F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF007BBD7B00007B
      0000007B08007BCE8C00D6FFF700B5FFE700B5FFE7007BD69C00087B10000084
      000000840000087B100052BD84008CFFDE005ADE9C00088C180000730000A5CE
      B500F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00EFA55A00FFFF
      FF00F7FFFF00D6E7FF00BDD6F700BDD6F700BDD6F700D6E7FF00FFFFFF00EFEF
      EF00B5ADB500E7DEE700F7F7F700C6C6C600B5ADB500B5ADB500B5ADB500B5AD
      B500B5ADB500BDB5BD00E7DEDE00F7E7E700C6735A00C6ADA500F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE008D8D8D005C4E4E0020A9AB0000FF6E004CE0
      420056A21200D3422200F5383800FDAA0000E0F75200E2DF4F00BDBDBF00B7B7
      BC00E1E1E100C4C4C400121213000000FF000000FF000000FF0000004D000068
      620000747400003C3C0071686500EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE0000A5520000CE7B0018DE9C00FFFFFF00D6D6
      D600ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00EFEFEF0052E7BD0000CE7B0000CE7B0039844A00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00F7E7
      DE00A5CEB50000730000218C2100BDDEC600FFFFFF0094BD9400108410000084
      000000840000107B100094D6A500BDFFE700B5FFE700B5FFE7006BCE8400007B
      0800007B00004ABD6B0094FFDE008CFFDE005ADE9C00108C180000730000A5CE
      B500F7E7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00F7E7DE00F7E7DE00EFA55A00FFFF
      FF00DEEFFF007BB5F70063ADEF005AADEF00429CEF0073ADEF00FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00EFE7EF00E7DEE700E7DEDE00E7DEDE00E7DE
      DE00DEDEDE00DEDEDE00F7EFEF00F7E7EF00C67B5A00C6ADA500F7E7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED6008D8D8D004D5A5C00B43226007ED3F0008CDC
      D600C0E7530034F95C00B4CDC400E4476200CE749700CCE39900E9E84500BABA
      C100E2E2E200C3C3C3001212120000005A00000063000000630000001200006C
      650000797900003A3A006F625F00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000A5520000CE7B0018DE9C00FFFFFF00EFEF
      EF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600F7F7F70052E7BD0000CE7B0000CE7B00397B4A00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFE7
      DE00A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00DEF7E700429C
      52004AAD5A00D6F7E700DEFFF700D6FFF700D6FFEF00BDFFE700ADF7DE0063C6
      7B0052BD6B0094FFD60094FFD60094FFDE006BDEA500108C210000730000A5CE
      B500EFE7DE00EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFE7DE00EFE7DE00EFA55A00FFFF
      FF00D6EFFF0073B5F70073C6F70063C6F70029ADF7004A94E700FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7F700F7F7F700F7F7F700F7EFEF00C67B5A00C6ADA500EFE7DE00EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED6008D8D8D005C6153002B008400C6ABB30090FF
      59007BE0D300ADC4A0003CF04000B8C8C100E94E5000D0798B00CDDE9900E4E4
      4000E1E0E600C3C3C30013131300595946006464500063634F0063635E006351
      5200634F4F00665B5B0087838100EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000A5520000CE7B0018DE9C00FFFFFF00C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      84008484840084848400DEDEDE0052E7BD0000CE7B0000CE7B00397B4A00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00D6F7E700429C
      4A004AA55200C6F7DE00D6FFF700D6FFF700D6FFEF00D6FFE700B5F7DE0084E7
      AD009CEFCE00ADFFE700A5FFDE009CFFDE006BDEA500108C210000730000A5CE
      B500EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFAD5A00FFFF
      FF00DEEFFF0084C6F700B5E7FF00A5EFFF0052CEFF004A9CE700FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00E7E7E700DED6DE00DED6DE00DED6DE00DED6
      DE00DED6DE00DEDEDE00EFEFEF00F7EFEF00C67B5A00C6ADA500EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED6008D8D8D0053525400788073004947ED00B9A8
      B70066E8E20070D9E400AEC69D003BEF3F00B5CBC100EE4A5600D07B8900CCDC
      9100FFFF7700B8B8CC008A848100ACA39E00ABA29E00ABA29E00ABA29E00ABA2
      9E00ABA29E00ABA39F00A9A09C00EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000A5520000CE7B0018DE9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0052E7BD0000CE7B0000CE7B00397B4A00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00DEEFE7004A9C
      4A004AA55200CEF7E700DEFFF700DEFFF700DEFFF700DEFFF700C6EFDE0042AD
      52004AAD5A00ADF7D600B5FFE700ADFFE70084DEAD00188C210000730000A5CE
      B500EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600F7AD5A00FFFF
      FF00DEEFFF008CC6F700CEEFFF00CEF7FF007BD6FF00529CE700FFFFFF00EFEF
      EF00B5ADB500E7DEE700F7F7F700B5B5B500A59CA500A59CA500A59CA500A59C
      A500A59CA500ADADAD00DEDEDE00F7EFF700C67B6300C6ADA500EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED6008D8D8D004F4F5C00A6A62200C3C3BB003A39
      EF00B6A2C3006CEEDC0070D9E600AFC59B003CEC3E00B1CEC000F34E5600CA77
      7E00A9BCFD00C5C3BA00918B8800EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED60000A5520000CE7B0018DE9C00FFFFFF00ADAD
      AD00636363006363630063636300636363006363630063636300636363006363
      63006363630063636300D6D6D60052E7BD0000CE7B0000CE7B00397B4A00EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00DEEFE7004A9C
      4A00319C390094CE9C009CD6AD009CD6AD009CD6AD009CD6AD0094CE9C00319C
      390039944200B5F7CE00BDFFEF00BDFFEF008CDEAD00188C210000730000A5CE
      B500EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600F7AD5A00FFFF
      FF00DEEFFF0073B5F70063B5F70063B5F7004AA5EF005A9CE700FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00F7EFEF00F7F7F700C67B6300C6ADA500EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE008D8D8D00525251007B7B8A00D2D2CA00AFAF
      C6003B3DEC00B6A1C30069EADC0075D8EB00AFC598003DEB3F00B0D8B2007000
      7500A754A100C4D2C50090878400EDD5CD00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE0000A5520000CE7B0018DE9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0052E7BD000084520000845200397B4A00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFDE
      D600A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00E7F7EF007BB5
      7B00188418001084100010841800108418001084180010841800108410001884
      18006BB57B00CEF7E700D6FFF700D6FFF70094DEB500188C210000730000A5CE
      B500EFDED600EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFDED600EFDED600F7AD6300FFFF
      FF00F7FFFF00D6EFFF00C6E7FF00C6E7FF00C6DEF700D6E7FF00FFFFFF00EFEF
      EF00B5ADB500E7DEE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F700C67B6300C6ADA500EFDED600EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE008D8D8D00525252007F7F7F00C9C9CA00CCCC
      BC00AFAFC6003B3BEC00B5A5C30065E7DC007ADBEB00B0D090003952D700877E
      CE00FBC1B100BAC3C40090878400EDD5CD00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE0000A5520000CE7B0010CE8C00A5C6A500A5C6
      A500A5C6A500A5C6A500A5C6A500A5C6A500A5C6A500A5C6A500A5C6A500A5C6
      A500A5C6A500A5C6A500A5C6A50031CE94000042290000422900397B4A00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00A5CEB50000730000218C2100BDDEC600F7FFFF00F7FFFF00F7FFFF00DEEF
      DE009CC69C008CBD8C008CBD8C008CBD8C008CBD8C008CBD8C008CBD8C0094C6
      9C00BDEFDE00D6FFF700D6FFF700DEFFF700A5DEBD00218C210000730000A5CE
      B500EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00F7AD6300FFFF
      EF00FFFFEF00FFFFEF00FFFFEF00FFFFEF00FFF7EF00FFF7EF00FFF7EF00F7E7
      DE00CEB5B500EFDECE00FFEFE700FFEFE700FFEFE700FFEFDE00FFE7DE00FFE7
      DE00FFE7DE00FFE7DE00FFE7D600FFDED600C6735200C6AD9C00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE008D8D8D005151510086868600D5D5D500C9C9
      CA00D3D3C700BDBDCE004845F500B6A7D10058DDEE001F70FF007A93DA0018FF
      570073FFF400CEB6BA008D878400E5D5CD00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE0000A5520000CE7B0000A55200003900000039
      0000003900000039000000390000003900000039000000390000003900000039
      0000003900000039000000390000007B290000CE7B0000CE7B00397B4A00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00EFD6
      CE00A5CEB50000730000218C2100BDE7C600FFFFFF00F7FFFF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7FFFF00EFFFFF00EFFFFF00F7FFFF00B5E7C600218C210000730000A5CE
      B500EFD6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00EFD6CE00EFD6CE00F7A55200FFDE
      B500FFDEAD00FFD6AD00FFD6A500FFCEA500FFC69C00FFC69400FFC69400FFBD
      8C00F7AD8400FFAD7B00FFAD8400FFA57B00FFA57300FF9C6B00FF946300FF8C
      6300FF8C5A00FF8C5A00FF8C5A00F7845A00C64A2100C6AD9C00EFD6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE008E8E8E004D4D4D004F4F4F00878787007F7F
      7F007F7F7F0084847E00757583000000AF000000AF000068B00000B2AE0000B0
      7E005ED15500D3C2D3008D878400E5D5CD00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00528C5A00008C420000843100003900000039
      0000003900000039000000390000003900000039000000390000003900000039
      0000003900000039000000390000006B210000A55200008C4200738C6B00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00A5CEB50000730000188C18008CCE9400BDE7C600BDDEC600BDDEC600BDDE
      C600BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDE
      C600BDDEC600BDDEC600BDDEC600BDE7C6008CCE9400188C180000730000A5CE
      B500E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00F7A54A00FFCE
      8C00FFCE8400FFC67B00FFBD7B00FFB57300FFAD6B00FFA55A00FF9C5200FF94
      4A00FF8C4200FF8C3900FF7B3900FF732900FF6B2100FF631800FF5A1000FF52
      0800FF520800FF520800FF520800F7420800C6310000C6AD9C00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600888888009B9B9B0057575700525252005252
      520052525200525252005353520060604E0060604E0060554E00604E4E00604E
      52009C919D00BEC0BE008E888200E6D5C500E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600DEC6BD00ADAD9400ADAD9400ADAD9400ADAD
      9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD
      9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD9400ADAD9400DEC6BD00E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      CE009CCEAD000073000000840000188C1800218C2100218C2100218C2100218C
      2100218C2100218C2100218C2100218C2100218C2100218C2100218C2100218C
      2100218C2100218C2100218C2100218C2100188C180000840000007300009CCE
      AD00E7D6CE00E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6CE00E7D6CE00F7A54200FFCE
      7B00FFCE8400FFC67B00FFBD7300FFB56B00FFAD6B00FFA55A00FF9C5200FF94
      4A00FF8C4200FF843900FF7B2900FF732100FF631800FF5A1000FF520800FF4A
      0000FF4A0000FF4A0000FF420000EF390000BD310000CEB5A500E7D6CE00E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC60089828000A49D9A00A8A09E00A8A09E00A8A0
      9E00A8A09E00A8A09E00A8A09E00A8A09E00A8A09E00A8A09E00A8A09E00A8A0
      9E00A39B990091898700968B8800E3CBC300E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7D6
      C600D6CEBD003194390000730000007300000073000000730000007300000073
      0000007300000073000000730000007300000073000000730000007300000073
      000000730000007300000073000000730000007300000073000031943900D6CE
      BD00E7D6C600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7D6C600E7D6C600F7BD8400F7AD
      4A00F7AD5200F7A55200F7A54A00F7944200EF944200EF8C4200EF8C3900EF84
      3100E77B2900E7732900E76B2100E7631800E75A1800E7521000DE520800DE4A
      0000DE420000D6420000D6390000C6310000C6633900E7D6CE00E7D6C600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600CECEBD009CCEAD00A5CEB500A5CEB500A5CEB500A5CEB500A5CE
      B500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB500A5CE
      B500A5CEB500A5CEB500A5CEB500A5CEB500A5CEB5009CCEAD00D6CEBD00E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600EFD6C600FFE7
      C600F7DEBD00F7D6BD00F7D6B500F7D6B500F7D6B500F7D6B500EFD6AD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00EFC6AD00EFC6AD00EFC6AD00EFC6A500EFC6
      A500E7BDA500E7B5A500E7B5A500E7BDAD00F7DED600E7D6CE00E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00DEDEDE00E7E7E700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700A55A390000000000A55A3900FFFFF700FFFFF700FFFFF700EFEF
      EF00BDBDBD009494940094949400A5A5A500BDBDBD00D6D6D600DEDEDE00EFEF
      EF00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A
      390000000000A55A3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700A55A390000000000A55A
      3900FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F70073BD
      D60084C6DE002184A500296B84004A63730063636300737373008C8C8C00A5A5
      A500BDBDBD00D6D6D600DEDEDE00EFEFEF00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700F6EFEF00F6F0F000FDF5F500FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F6EF
      EF00F6F0F000FDF5F500FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700BDD6DE00297B9400297B
      9400297B9400DEE7EF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F7006BB5
      D600ADDEEF008CDEFF005ACEF70039BDEF0029ADD6002184A500296B84004A63
      6B0063636300737373008C8C8C00A5A5A500BDBDBD00D6D6D600EFEFEF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FDF6
      F600DBE3E70079949B008D878300BAABA500C8C0BC00D6D1D000F0EAEA00FBF3
      F300FEF6F600FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FDF6F600DBE3E7007994
      9B008D878300BAABA500C8C0BC00D6D1D000F0EAEA00FBF3F300FEF6F600FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700D6EFEF0010A5D60029ADCE001084
      AD00217B9C00297B9400297B9400297B940084B5BD00FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700A55A390000000000A55A3900FFF7F700FFF7F700FFF7F70052BD
      E7007BCEEF00B5EFFF0073DEFF0073DEFF0073DEFF0073DEFF0063D6FF004AC6
      EF0029ADD6002184A500296B84004A636B00636363007B7B7B00ADADAD00E7E7
      E700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A
      390000000000A55A3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700EEEF
      F2006CB7D0004CA8C7001980A2001E6B8400336371004D5C5F00796E6700A296
      9000B1ABA800D1CCCB00F0EAE900F7F0F000FDF5F500FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A
      3900FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700EEEFF2006CB7D0004CA8
      C7001980A2001E6B8400336371004D5C5F00796E6700A2969000B1ABA800D1CC
      CB00F0EAE900F7F0F000FDF5F500FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700A55A390000000000A55A3900FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7F700FFF7F700D6E7EF0042B5DE00B5EFFF0063D6
      FF004AC6F70021B5E700109CCE002184A500297B9400297B9400297B9400297B
      9400FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00A55A390000000000A55A3900FFF7EF00FFF7EF00FFF7EF0052BD
      E70052BDEF00E7FFFF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7
      FF007BE7FF007BE7FF006BD6FF004AC6EF0031ADD60029738C0073737300C6C6
      C600FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A
      390000000000A55A3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E1EA
      E8004AADCE00A2E0F60077DAFF003EBDEE002CABD9001898C4000E87AF001C72
      8E002B60720048555800766E690088847F00A29D9900DAD1CA00E9E1DA00F3EC
      E500FAF3EC00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A
      3900FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E1EAE8004AADCE00A2E0
      F60077DAFF003EBDEE002CABD9001898C4000E87AF001C728E002B6072004855
      5800766E690088847F00A29D9900DAD1CA00E9E1DA00F3ECE500FAF3EC00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A55A390000000000A55A3900F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFF7EF00FFF7EF00D6E7EF004ABDDE00C6EFFF0073DE
      FF0073DEFF0073DEFF0073DEFF005AD6FF0039BDEF0018ADDE000894BD00217B
      9C00297B9400297B9400297B94009CBDC600FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00A55A390000000000A55A3900F7F7EF00F7F7EF00F7F7EF0052BD
      E7005AC6F700CEEFF7008CEFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0042BDEF004A5A63009C9C
      9C00E7E7E700F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A
      390000000000A55A3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D5E9
      E80027A3D000B7E4F500B1ECFF006FD9FF0072DAFF0071DBFF0062D3FC004DC4
      F00032B4E1001AA5D5001690B8001C7591002A60700041595E005A6465006E6F
      6C008E868100D5D0CA00F1F0E900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A
      3900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D5E9E80027A3D000B7E4
      F500B1ECFF006FD9FF0072DAFF0071DBFF0062D3FC004DC4F00032B4E1001AA5
      D5001690B8001C7591002A60700041595E005A6465006E6F6C008E868100D5D0
      CA00F1F0E900F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7F7EF00F7F7EF0008A5D6006BCEF700ADE7FF008CE7
      FF007BDEFF007BDEFF007BDEFF007BDEFF007BDEFF007BDEFF0073DEFF005AD6
      FF0031BDE70018A5D600108CB500217B9C00297B9400297B9400F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF0052BD
      E7006BCEF7007BCEE700B5F7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0084E7FF00317B8C006B6B
      6B00ADADAD00D6D6D600DEDEDE00EFEFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DBE4
      EA0046B1DC0088D3F100C0EDFA007FE1FF0078DFFF0079DFFF007AE0FF007BE0
      FF007EE2FF007FE3FF006EDAFC0053CDF3003EC4EE0026B3E0001F96BD001D78
      96001D647C004B626800C1B7B300F4EDED00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DBE4EA0046B1DC0088D3
      F100C0EDFA007FE1FF0078DFFF0079DFFF007AE0FF007BE0FF007EE2FF007FE3
      FF006EDAFC0053CDF3003EC4EE0026B3E0001F96BD001D7896001D647C004B62
      6800C1B7B300F4EDED00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF0010A5D60073CEF7008CD6EF00A5EF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7
      FF007BE7FF007BE7FF0073DEFF0052CEF70031BDE700109CD600428CA500F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF0052BD
      E7006BCEFF0052BDEF00D6FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0052CEEF0029ADD60039BDE70021A5CE00395A
      630063636300737373008C8C8C00A5A5A500BDBDBD00D6D6D600DEDEDE00EFEF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DFE6
      EB0065BFE3004BBCE800C2E9F4008FEAFF007DE4FF007EE4FF007EE4FF007EE4
      FF007EE4FF007EE4FF0081E6FF0084E8FF0088EAFF0085E9FF0072E1FF0060DA
      FC0041D0F9001B87AA00645D5900DFD9D800F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DFE6EB0065BFE3004BBC
      E800C2E9F4008FEAFF007DE4FF007EE4FF007EE4FF007EE4FF007EE4FF007EE4
      FF0081E6FF0084E8FF0088EAFF0085E9FF0072E1FF0060DAFC0041D0F9001B87
      AA00645D5900DFD9D800F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFEF00F7EFEF0010A5D60063CEF70084D6EF00B5F7
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF006BDEFF000894B500639C
      AD00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE70052BD
      E70073D6FF004ABDF700DEF7FF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF004ACEE70073C6E70084DEFF0063CEFF0042BD
      EF0029ADD6002184A500296B84004A636B0063636300737373008C8C8C00A5A5
      A500C6C6C600E7E7E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700D6E3
      E4004FBCE60040B9EA00A7DCEE00ADF3FF0084EBFF0085EBFF0085EBFF0085EB
      FF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0086EBFF0088EDFF008CEF
      FF008AEEFF004AC4E8002C5B6900B5A7A000F5EDE600F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700D6E3E4004FBCE60040B9
      EA00A7DCEE00ADF3FF0084EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EB
      FF0085EBFF0085EBFF0085EBFF0086EBFF0088EDFF008CEFFF008AEEFF004AC4
      E8002C5B6900B5A7A000F5EDE600F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE70010A5D60063CEF7006BCEEF00BDF7
      FF008CF7FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF006BDEFF0031B5DE00639C
      AD00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700A55A390000000000A55A3900F7EFE700F7EFE700F7EFE70052BD
      E7007BD6FF0063CEFF00A5DEEF00DEFFFF00BDFFFF00A5FFFF00A5FFFF00A5FF
      FF00A5FFFF00A5FFFF00A5FFFF006BD6EF0042B5E700B5EFFF007BDEFF007BDE
      FF007BDEFF007BDEFF006BD6FF004AC6EF0031ADD6002184A500296B84004A63
      6B006B6B6B00A5A5A500E7E7E700F7EFE700F7EFE700F7EFE700F7EFE700A55A
      390000000000A55A3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700D4E4
      E50049BAE60057C2F30071C7E700CDF7FD0088F0FF008BF0FF008AF0FF008AF0
      FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0
      FF0085E9FF007EEBFF003B8C9E00625E5C00E6DFD900F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700A55A390000000000A55A
      3900F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700D4E4E50049BAE60057C2
      F30071C7E700CDF7FD0088F0FF008BF0FF008AF0FF008AF0FF008AF0FF008AF0
      FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF0085E9FF007EEB
      FF003B8C9E00625E5C00E6DFD900F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7EFE700F7EFE70010A5D6006BCEFF005ABDEF00B5EF
      F700A5FFFF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF006BDEFF007BE7F7001084
      AD0084ADB500F7EFE700F7EFE700F7EFE700F7EFE700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E70052BD
      E70084DEFF0073DEFF004AC6EF008CD6EF008CD6EF00BDE7F700E7FFFF00EFFF
      FF00C6FFFF00C6FFFF00C6FFFF0052BDE70042BDE700A5E7F70084E7FF0084E7
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0073DEFF0052CE
      EF00187B9C0073737300CECECE00F7E7E700F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700DCE0
      E70063C5EE0068CBFA0038B3E300DCF5FB0095F8FF0090F6FF0090F6FF0090F6
      FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6
      FF0086EBFF00A4F6FF0063CEE2003B545C00BDB0AD00F6E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700DCE0E70063C5EE0068CB
      FA0038B3E300DCF5FB0095F8FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6
      FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6FF0090F6FF0086EBFF00A4F6
      FF0063CEE2003B545C00BDB0AD00F6E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E70010A5D6007BD6FF0042BDEF00A5DE
      F700B5FFFF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0073DEFF00A5F7FF0029A5
      CE007BADB500F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700A55A390000000000A55A3900F7E7E700F7E7E700F7E7E70052BD
      E70094E7FF0084E7FF0084E7FF0084E7FF0084E7FF0073DEFF005ACEEF005AC6
      E700E7FFFF00DEFFFF00DEFFFF0052BDE7005AC6F7008CD6EF008CEFFF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF007BE7FF008CEFFF007BE7
      FF0052BDE700525A6300A5A5A500EFEFEF00F7E7E700F7E7E700F7E7E700A55A
      390000000000A55A3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E7E4
      E70066C6EE0074D0FE0041BAEF00B0E1F100B7FEFF0092FDFF0097FDFF0097FD
      FF0097FDFF0097FDFF0097FDFF0097FDFF0097FDFF0097FDFF0097FDFF0097FD
      FF0089EFFF00A6F0FF00A9F9FF0036798A0069646100ECDFDF00F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A
      3900F7E7E700F7E7E700F7E7E700F7E7E700F7E7E700E7E4E70066C6EE0074D0
      FE0041BAEF00B0E1F100B7FEFF0092FDFF0097FDFF0097FDFF0097FDFF0097FD
      FF0097FDFF00B7CECE00AAA2A30097A6A70095B5B500A4C7C700B0DBE200B8E6
      F000AAF9FE0036798A006C676400ECDFDF00F7E7E700F7E7E700F7E7E700F7E7
      E700F7E7E700F7E7E700F7E7E700A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7E700F7E7E70010A5D6007BD6FF0042BDF70094DE
      F700BDFFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0073E7FF00B5FFFF0063CE
      DE0021849C009CB5BD00F7E7E700F7E7E700F7E7E700F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE0052BD
      E70094F7FF008CF7FF008CF7FF008CF7FF008CF7FF004AC68C0073DECE0084EF
      FF0063CEE7009CDEEF00BDE7F70052BDE7006BCEFF004ABDE700B5FFFF008CF7
      FF008CF7FF008CF7FF008CF7FF008CF7FF0084E7FF009CD6DE008CF7FF0084EF
      FF0052BDE70029637B0084848400D6D6D600F7E7DE00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00E5E5
      E2006BC7ED0078D3FF005EC9FD0064C2E400E2FFFF00A2FFFF00A0FFFF00A0FF
      FF009FFFFF009EFFFF009EFFFF009FFFFF009FFFFF009FFFFF009FFFFF009FFF
      FF008FF0FF00A8EDFF00DCFFFF0062C3DC0046535700B9B1AC00F6E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00E5E5E2006BC7ED0078D3
      FF005EC9FD0064C2E400E2FFFF00A2FFFF00A0FFFF00A0FFFF009FFFFF009EFF
      FF009EFFFF00D1C3C300CE646400A951510085727200BDC0C00097999900969D
      9E00B6C0C000ABC9D0005D686C00BAB2AD00F5E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE0010A5D60073D6FF0052C6FF006BCE
      F700C6F7FF00A5FFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF007BE7FF00CEFFFF009CEF
      F700219CBD009CB5BD00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00A55A390000000000A55A3900F7E7DE00F7E7DE00F7E7DE0052BD
      E7009CFFFF009CFFFF009CFFFF009CFFFF0063DEAD0008A5100021B5420094FF
      F7009CFFFF009CFFFF0084F7FF0052BDE7006BCEFF0029ADE700CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF008CEFF700D6D6BD00FFCE9C00A5E7E7008CF7
      FF00A5F7FF0029A5C60063636300ADADAD00EFEFEF00F7E7DE00F7E7DE00A55A
      390000000000A55A3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00DFE5
      E40079CFF20079D9FF006DD5FF0044BDE800AADDEE00E1F6FB00D3F7FA00CCF9
      FB00C8FDFE00C6FFFF00B9FFFF00B1FFFF00B2FFFF00B2FFFF00B2FFFF00B2FF
      FF009DF0FF00B1EEFF00EAFFFF00C0F9FD002F6E8100847A7500EFE2DA00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A
      3900F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00DFE5E40079CFF20079D9
      FF006DD5FF0044BDE800AADDEE00E1F6FB00D3F7FA00CCF9FB00C8FDFE00C6FF
      FF00B9FFFF00DACCCC00E5767600CA61610093767600E2C6C600DABCBC00DAD9
      D900B6B7B70096969600838486009E9C9B00DBD5D100DED5D000F2E3DB00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00A55A390000000000A55A3900EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00F7E7DE00F7E7DE0010A5D60084DEFF0063CEFF005AC6
      F700CEEFFF00B5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FF
      FF00A5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF007BE7FF00CEFFFF00BDF7
      FF005AADCE00297B9400B5C6CE00F7E7DE00F7E7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00A55A390000000000A55A3900EFE7DE00EFE7DE00EFE7DE0052BD
      E700A5FFFF009CFFFF009CFFFF006BE7B50010B5290010B5290010B5290029B5
      52008CF7EF009CFFFF009CFFFF0052BDE7007BD6FF0052C6F70094DEEF00ADFF
      FF00A5FFFF00A5FFFF0094FFFF00D6D6BD00FFD6A500FFDEA500F7D6A5008CE7
      FF00B5F7FF0052BDE700315A6B0084848400D6D6D600EFE7DE00EFE7DE00A55A
      390000000000A55A3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00DFE6
      E40090DAF60081E2FF0079E0FF0078DFFF004CC7ED0051C4E90069CAE80079CE
      E90096D8ED00B3E0F000E6F9FC00D2FFFF00C0FFFF00C2FFFF00C3FFFF00C3FF
      FF00ABF2FF00AFE6FF00B7D5FF00D8F2FF0063B7CC0054555300CEC7C200EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A
      3900EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00DFE6E40090DAF60081E2
      FF0079E0FF0078DFFF004CC7ED0051C4E90069CAE80079CEE90096D8ED00B3E0
      F000E6F9FC00E2CDCD00E2767600C661610081636300B7727200CF767600F5E7
      E700EDF2F200DAD6D600B8888800864C4C0092555500564A4A00D1CECA00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFE7DE00EFE7DE0010A5D6008CDEFF006BD6FF004AC6
      F70073CEEF00EFFFFF00F7FFFF00E7FFFF00D6FFFF00CEFFFF00BDFFFF00B5FF
      FF00B5FFFF00B5FFFF00B5FFFF00B5FFFF00B5FFFF0084DEFF00D6FFFF00DEFF
      FF008CDEEF00218CAD00B5C6C600EFE7DE00EFE7DE00EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED60052BD
      E700D6FFFF009CFFFF0063D6AD0021BD420021BD420021BD420021BD420021BD
      420039BD5A00CEF7EF00CEFFFF0052BDE70084DEFF0073D6FF0031B5DE0073C6
      E7009CDEEF00ADE7F700DEFFFF00FFE7BD00FFDEAD00FFE7B500FFE7AD00E7C6
      A500C6EFF700DEFFFF0052BDE70063636300B5B5B500F7F7F700EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600CFDD
      E1009ADFF6008EEDFF0084EBFF0086EBFF008AEEFF0089EEFF0088EEFF007CE7
      FD0065DAF5004ECDEC007FD1EA00F0F9FC00F4FFFF00EDFFFF00E8FFFF00EDFF
      FF00C5FEFF008DC6FF000D3BFF008CAAFF00D1F7F600366E7100927E7000E9DA
      D300EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600CFDDE1009ADFF6008EED
      FF0084EBFF0086EBFF008AEEFF0089EEFF0088EEFF007CE7FD0065DAF5004ECD
      EC007FD1EA00EACDCE00E2787800C761610086686800AB666600BB626200ECDD
      DD00FDFFFF00EFEBEB00C090900096505000E36C6C006B4C4C00CBC6C200EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED60010A5D60094E7FF0073DEFF0073DE
      FF0052CEF70029B5E7005AC6E7006BC6E7009CDEEF00CEF7FF00F7FFFF00D6FF
      FF00C6FFFF00C6FFFF00C6FFFF00C6FFFF00C6FFFF0084E7FF00E7FFFF00E7FF
      FF00B5E7F7004A9CB500297B9400D6CECE00EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600DEF7
      F70052BDE7008CD6AD0029C6520029C65A0029C65A0029C65A0029C65A0029C6
      5A0029C65A0029AD5A006BB5C60052BDE70094E7FF0084E7FF0084E7FF0084E7
      FF006BCEEF009CADA50073B5BD009CDEEF00FFDEB500FFDEAD00FFF7BD00FFE7
      AD00EFCEAD00EFFFFF0052BDE70042525A0084848400DEDEDE00EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600A8D2
      E1009DE4F70091F7FF008EF5FF008FF5FF008FF5FF008FF5FF008FF5FF0090F6
      FF0093F7FF0097FAFF0074E6F7006DCFE80093D6EB0099D9E80098C1F5005E82
      FF00BDD5FF00C2D6FF00002FFF00819AFF00F0FAFF002560E300464E9400D9CB
      C300EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600A8D2E1009DE4F70091F7
      FF008EF5FF008FF5FF008FF5FF008FF5FF008FF5FF0090F6FF0093F7FF0097FA
      FF0074E6F700C7C3CA00E2797900C761610096777700B9717100A0444400C6B7
      B700F2F7F700FEFAFA00C696960095505000DF6B6B006A4C4C00CBC6C200EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED60010A5D6008CE7FF007BE7FF007BE7
      FF007BE7FF007BE7FF007BE7FF0073E7FF005AD6F7004AC6EF005ACEEF00EFF7
      FF00DEFFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF008CDEFF00EFFFFF00EFFF
      FF00E7FFFF006BC6DE002184A500D6CECE00EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED60029BD5A0031CE630031CE6300319C
      52008C8C8C00E7E7E700FFFFFF0052BDE70094F7FF008CF7FF008CF7FF008CEF
      F700CEBD9C00FFD6A500FFD6A50073B5BD0073C6DE0084CEE700ADDEE700CEEF
      E700FFEFCE00F7F7EF00DEF7FF0052BDE7008C8C8C00DEDEDE00EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600ACD4
      E300C7F9FE0092FFFF0099FEFF0098FEFF0098FEFF0098FEFF0098FEFF0096FF
      FF0095FFFF0096FEFF0099FFFF0083F5FA0085F3F90091F5F80064BCFB000034
      FF001542F9002A78DE00023DF9004A87F6004C72FE00022DFF003B4FB800D1C3
      BB00EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600ACD4E300C7F9FE0092FF
      FF0099FEFF0098FEFF0098FEFF0098FEFF0098FEFF0096FFFF0095FFFF0096FE
      FF0099FFFF00CDCFD000E27B7B00C66060009B7E7E00D5A4A400AD666600A495
      9500C6CACA00F3EFEF00CC9C9C00954F4F00DF6B6B006A4C4C00CBC6C200EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED60010ADD6008CF7FF0084EFFF0084EF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0073E7FF006BD6
      EF00FFFFFF00F7FFFF00F7FFFF00EFFFFF00E7FFFF0094DEFF00F7FFFF00F7FF
      FF00F7FFFF00A5E7F7003994AD00297B9400EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED6004ACE730039D6730039D67300398C
      520084848400D6D6D600FFFFFF0052BDE7009CFFFF009CFFFF009CFFFF00C6C6
      B500FFD6A500FFD6A500FFCE9C00FFD6A500FFCE9C00FFCE9C0052BDE70052BD
      E70052BDE70052BDE70052BDE70052BDE700C6C6C600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600BED9
      E200CFF5FA009CFFFF0098FFFF0099FFFF0099FFFF0099FFFF0097FFFF00ADFF
      FF00B7FFFF00AFFFFF00ACFFFF00A8FFFF00A3FFFF009FFFFF009EFFFF005FB0
      FF00044FFF0000A4FD0000CEFF0000B6F6000060FC00152EB500584F6000A69A
      9900DFD1CD00EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600BED9E200CFF5FA009CFF
      FF0098FFFF0099FFFF0099FFFF0099FFFF0097FFFF00ADFFFF00B7FFFF00AFFF
      FF00ACFFFF00D7D4D400E27D7D00C65F5F00705E5E00AFABAB00DDD5D500D2D0
      D000A7A9A900C8C5C500C292920096505000DF6B6B006A4C4C00C4C0BE00EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFDED600EFDED60010ADD6009CFFFF008CFFFF008CFF
      FF008CFFFF008CFFFF008CFFFF008CFFFF008CFFFF008CFFFF008CFFFF0073EF
      FF0031BDDE006BCEE70073C6E7009CD6EF00BDE7F700F7FFFF00FFFFFF00FFFF
      FF00FFFFFF00F7FFFF005AADC600217B9400EFDED600EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE007BCE8C0042DE7B0042DE7B0039AD
      5A006B6B6B00BDBDBD00F7F7F70052BDE700ADFFFF009CFFFF00BDCEBD00FFCE
      A500FFEFD600FFDEB500FFD6A500FFD6A500FFD6A500FFCE9C00FFD6A500FFEF
      D600FFEFDE00F7D6B500EFBD9400C6C6C600EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00E1D7
      D40097D1E500C5FFFF008CFFFF0092FFFF0093FFFF0091FFFF00BBFFFF00B2E1
      F200A3CCDC00AADDEA00A2E1EF00A4E8F200A4E5F40062ADFF003C84FF00458F
      FF0014AFFF0009D4FF003ADFFF0014D7FF0001B5F900162DAF001F37B1003346
      B400B9ACB400EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00E1D7D40097D1E500C5FF
      FF008CFFFF0092FFFF0093FFFF0091FFFF00BBFFFF00B2E1F200A3CCDC00AADD
      EA00A2E1EF00D6CFD200E17E7E00C9616100BD606000AE5E5E009D5D5D008E64
      64007E6A6A007D7171009667670091515100E06B6B006A4C4C00B1AEB200EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE0018ADD600A5FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF007BF7FF0063DEF70018ADDE00009CCE00009C
      CE00009CCE00009CCE001894B500217B9400EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00A55A390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00D6EFD6004ADE730052EF84004AE7
      7B00526352008C8C8C00D6D6D60052BDE700D6F7FF00EFBD9400EFC6A500FFEF
      DE00FFF7E700FFF7E700FFD6AD00FFCE9C00FFD6A500FFD6A500FFD6A500FFDE
      BD00FFEFDE00EFBD9400C6C6C600EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A
      390000000000A55A3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EBD6
      D0009AC9D900C0EEF700E2FFFF00D0FFFF00C4FFFF00C6FFFF00CCF2FA0073A7
      BA00AFBBBE00BAC6CB00BCCBD000CFD2D300CED0D7004E6BF1000A30F700062E
      F30000A5FA0013D5FF0077F4FF0028DBFF0000C2FD000532F1000637FB000939
      FE00D5C6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A
      3900EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EBD6D0009AC9D900C0EE
      F700E2FFFF00D0FFFF00C4FFFF00C6FFFF00CCF2FA0073A7BA00AFBBBE00BAC6
      CB00BCCBD000E1CBCB00E2808000C76060008A575700AE6F6F00B8696900B761
      6100B7575700AB5050009D4F4F00AB5A5A00DC6B6B006A4C4C00BFBBBE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00EFD6CE00EFD6CE0018ADD600ADFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF0010ADD600EFD6CE00EFD6
      CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00EFD6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00ADDEB5004ADE73005AF7
      8C005AB573008C8C8C00BDBDBD00DEE7EF0052BDE70052BDE700EFBD9400FFEF
      E700FFF7EF00FFF7EF00FFF7E700FFD6AD00FFD6A500FFCE9C00FFD6AD00FFF7
      EF00EFBD9400BDBDBD00F7F7F700E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00D7D5D20096C8D80072BBD60083C3DA0087C9DE00ACD7E30083C2D600D8D0
      CB00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E6D6CF00D3C9D200D4CAD200989A
      C3000779F20000CDFF000CD3FF0003D1FF000090FA003239880067637E00BFB9
      C800E6D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00D7D5D20096C8
      D80072BBD60083C3DA0087C9DE00ACD7E30083C2D600D8D0CB00E7D6CE00E7D6
      CE00E7D6CE00E8CDCB00E2818100C65E5E0087737300C4CCCC00B0B7B700B2AF
      AF00B8A0A000BA959500AE7E7E00B2626200DB6969006A4C4C00C7C2BE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE0018ADD600BDFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF00B5FFFF00D6FFFF00CEFFFF00BDFFFF00ADFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF0010ADD600E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00A55A390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00DEEFDE004ADE
      73004ADE730073D68C00D6DED600E7D6CE00E7D6CE00E7D6CE00E7D6CE00EFBD
      9400FFFFFF00FFFFFF00FFFFFF00FFEFD600FFD6A500FFCE9C00FFF7E700EFBD
      9400BDB5B500EFEFEF00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A
      390000000000A55A3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E4D5CE00DFD4CE00E1D5CE00E2D5CE00E5D6CE00E3D5CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00DACED2004060
      EE00002EF800217CDE00019BFA000E80DF000137F700062EE70064689700DCCE
      C600E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A
      3900E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E4D5
      CE00DFD4CE00E1D5CE00E2D5CE00E5D6CE00E3D5CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E8CFCD00E2838300C65E5E00947A7A00D5D6D600DBDBDB00DBDC
      DC00E0E4E400D8DEDE00BDCCCC0090727200DF6666006A4C4C00C7C2BE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00A55A390000000000A55A3900E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6CE00E7D6CE00C6CECE0029BDDE00A5FFFF009CFF
      FF009CFFFF009CFFFF00A5FFFF00C6F7FF0042BDDE00009CCE00009CCE00009C
      CE00BDEFFF00D6FFFF00DEFFFF00CEFFFF00BDFFFF0018ADD600E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6C600E7D6C600E7D6
      C600E7D6C600A55A390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600EFBD9400FFFFFF00FFFFFF00FFFFFF00FFDEBD00FFEFDE00EFBD9400B5AD
      A500E7E7E700E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A
      390000000000A55A3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A8ADDE002953
      FC008994DA00A7A5C7000330FF003947B0006E78BD001F44FA008F99D900E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A
      3900E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E8D1CD00E2848400C65E5E0092787800C9CACA00BABABA00B2B2
      B200B3B3B300C2C2C200CFD6D600A8848400DC6464006A4C4C00C7C2BB00E7D6
      C600E7D6C600E7D6C600E7D6C600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7D6C600E7D6C600C6CEC60042BDDE00EFFFFF00DEFF
      FF00CEFFFF00B5FFFF00D6FFFF0084D6EF0063B5CE00E7D6C600E7D6C600E7D6
      C600009CCE00009CCE00009CCE00009CCE00009CCE00C6CEC600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600FFF7F700EFBD9400FFFFF700FFBD6300FFFFF700FFF7EF00C6B5A500DEDE
      DE00E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E4CDC900BBB5
      D700E7CEC600D8C8CE00002DFF006776CF00DDCAC400B7B1D300DBC8CC00E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E8D0CE00E2848400C65C5C00957A7900BEBCCC00BEB7B500CCC4
      C700B4BBD800CCCCCE00D0D7D700A37F7F00DD646400694B4B00C7BEBA00E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A5BDC600009CCE00009C
      CE00009CCE00009CCE00009CCE0042ADCE00E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600FFEFE700EFBD9400EFBD9400EFBD9400EFDEC600E7E7E700E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600DECBCC00919DEB00C9BBCB00E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E6CFC900E49D9C00C7696900AE979600E4CDC600E7CEC600DDCB
      CC009EA8E700C9C0CA00DACDC800A27C7C00DC6060006F505000CDC2BE00E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600A55A390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A
      390000000000A55A3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600A55A390000000000A55A
      3900E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CE
      C600E7CEC600E3CDC600E9C9C400D8B4B100E6CFC700DECBC500E6CEC600E7CE
      C600E7CEC600E7CEC600DECAC400AD8C8C00D8737300A48A8A00E2CEC700E7CE
      C600E7CEC600E7CEC600E7CEC600A55A390000000000A55A3900EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600A55A390000000000A55A3900EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600A55A
      390000000000A55A3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600A55A390000000000A55A
      3900EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDE
      D600EFDED600EEDED600EFDDD500EDDAD200EFDED600EDDDD500EEDED600EEDE
      D600EFDED600EFDED600E3D3CC00C5AAA900D99C9B00D5C3C000EEDED600EFDE
      D600EFDED600EFDED600EFDED600A55A390000000000A55A3900F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00A55A390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A
      390000000000A55A3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A
      3900F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00A55A390000000000A55A3900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A55A390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      390000000000A55A3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A55A390000000000A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A390000000000A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      390000000000A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A390000000000A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A3900A55A
      3900A55A3900A55A3900A55A3900A55A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      28000000980000000D0200000100010000000000042900000000000000000000
      000000000000000000000000FFFFFF0080000000000000000000000000000000
      0000000080000000000000000000000000000000000000008000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      8000000000000000000000000000000000000000800000000000000000000000
      0000000000000000800000000000000000000000000000000000000080000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000080000000000000000000000000000000000000008000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      8000000000000000000000000000000000000000800000000000000000000000
      0000000000000000800000000000000000000000000000000000000080000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000080000000000000000000000000000000000000008000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      8000000000000000000000000000000000000000800000000000000000000000
      0000000000000000800000000000000000000000000000000000000080000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000080000000000000000000000000000000000000008000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      8000000000000000000000000000000000000000800000000000000000000000
      0000000000000000800000000000000000000000000000000000000080000000
      0000000000000000000000000000000080000000000000000000000000000000
      000000008000000000000000000000000000000000000000FFFFFFFFFC000000
      0000000000000000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF00800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      02000000000800000000200000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0080000000020000000008000000000000000000008000000002000000
      0008000000000000000000008000000002000000000800000000000000000000
      8000000002000000000800000000000000000000800000000200000000080000
      0000000000000000800000000200000000080000000000000000000080000000
      0200000000080000000000000000000080000000020000000008000000000000
      0000000080000000020000000008000000000000000000008000000002000000
      0008000000000000000000008000000002000000000800000000000000000000
      8000000002000000000800000000000000000000800000000200000000080000
      0000000000000000800000000200000000080000000000000000000080000000
      0200000000080000000000000000000080000000020000000008000000000000
      0000000080000000020000000008000000000000000000008000000002000000
      0008000000000000000000008000000002000000000800000000000000000000
      8000000002000000000800000000000000000000800000000200000000080000
      0000000000000000800000000200000000080000000000000000000080000000
      0200000000080000000000000000000080000000020000000008000000000000
      0000000080000000020000000008000000000000000000008000000002000000
      0008000000000000000000008000000002000000000800000000000000000000
      8000000002000000000800000000000000000000800000000200000000080000
      0000000000000000800000000200000000080000000000000000000080000000
      0200000000080000000000000000000080000000020000000008000000000000
      0000000080000000020000000008000000000000000000008000000002000000
      000800000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFFF00
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      00002000000000008000000002000000000800000000200000000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      000000008000000002000000000800000000200000000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF00800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      02000000000800000000200000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      000800000000200000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      8000000002000000000800000000200000000000800000000200000000080000
      0000200000000000800000000200000000080000000020000000000080000000
      0200000000080000000020000000000080000000020000000008000000002000
      0000000080000000020000000008000000002000000000008000000002000000
      0008000000002000000000008000000002000000000800000000200000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      00000000000000000000}
  end
end
