object FrmMainStatus: TFrmMainStatus
  Left = 843
  Top = 400
  Width = 220
  Height = 120
  BorderIcons = [biSystemMenu]
  Caption = 'MAIN COM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object pnMenu: TPanel
    Left = 0
    Top = 0
    Width = 212
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PNToolBAR: TXiPanel
      Left = 0
      Top = 0
      Width = 212
      Height = 86
      ColorFace = clWhite
      ColorGrad = 15456207
      ColorLight = clCream
      ColorDark = clBtnFace
      ColorScheme = csCustom
      FillDirection = fdVertical
      Align = alClient
      TabOrder = 0
      UseDockManager = True
      object LED_Ready: TLed
        Tag = 2
        Left = 77
        Top = 21
        Width = 16
        Height = 20
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'PC_READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
      end
      object LED_Alive: TLed
        Tag = 2
        Left = 77
        Top = 40
        Width = 16
        Height = 20
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'ALIVE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
      end
      object Label1: TLabel
        Left = 76
        Top = 5
        Width = 17
        Height = 13
        Caption = 'PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 30
        Top = 22
        Width = 43
        Height = 13
        Caption = 'READY  '
        Transparent = True
      end
      object Label3: TLabel
        Left = 40
        Top = 40
        Width = 33
        Height = 13
        Caption = 'ALIVE '
        Transparent = True
      end
      object LED_Reset: TLed
        Tag = 2
        Left = 77
        Top = 60
        Width = 16
        Height = 20
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'RESET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
      end
      object Label4: TLabel
        Left = 34
        Top = 61
        Width = 39
        Height = 13
        Caption = 'RESET '
        Transparent = True
      end
      object Label5: TLabel
        Left = 124
        Top = 5
        Width = 24
        Height = 13
        Caption = 'PLC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object LED_PLC_READY: TLed
        Tag = 2
        Left = 126
        Top = 20
        Width = 16
        Height = 20
        Alignment = laLeft
        BorderColor = 4210816
        BorderWidth = 1
        Caption = 'PLC_READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        LedHeight = 15
        LedWidth = 15
        Margin = 4
        OffColor = 2510080
        PhongSize = 4
      end
      object Label6: TLabel
        Left = 154
        Top = 22
        Width = 43
        Height = 13
        Caption = 'READY  '
        Transparent = True
      end
      object AdvGlowButton3: TAdvGlowButton
        Left = 455
        Top = 5
        Width = 109
        Height = 57
        Caption = 'Cover Barcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 5
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 0
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object cmbModelList: TComboBox
        Left = 602
        Top = 14
        Width = 145
        Height = 21
        Style = csDropDownList
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        TabOrder = 1
      end
      object EditModel: ZIniEdit
        Left = 758
        Top = 14
        Width = 121
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Text = 'EditModel'
        IniKey = 'Model'
        IniDataSource = INI
        MoveCursor = False
      end
    end
  end
  object ZIniFormPosition1: ZIniFormPosition
    IniDataSource = INI
    Left = 92
    Top = 84
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'MainStatus'
    Left = 20
    Top = 100
  end
end
