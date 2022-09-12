object FrmMasterMenu: TFrmMasterMenu
  Left = 0
  Top = 0
  Width = 150
  Height = 404
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 150
    Height = 404
    Align = alClient
    BorderWidth = 2
    TabOrder = 0
    object pnStatus: TPanel
      Left = 3
      Top = 126
      Width = 144
      Height = 275
      Align = alClient
      Caption = 'Result'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnBcd: TPanel
      Left = 3
      Top = 44
      Width = 144
      Height = 41
      Align = alTop
      Caption = 'Serial No'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnVariant: TPanel
      Left = 3
      Top = 3
      Width = 144
      Height = 41
      Align = alTop
      Caption = ' Variant'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnType: TPanel
      Left = 3
      Top = 85
      Width = 144
      Height = 41
      Align = alTop
      Caption = 'Master Type'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
end
