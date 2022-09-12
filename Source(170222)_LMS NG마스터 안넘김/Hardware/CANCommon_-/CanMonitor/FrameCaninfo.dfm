object FrCanInfo: TFrCanInfo
  Left = 0
  Top = 0
  Width = 452
  Height = 28
  TabOrder = 0
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 452
    Height = 28
    Align = alClient
    Style = bsRaised
  end
  object Label_MsgName: TLabel
    Left = 106
    Top = 4
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = 'MESSAGE NAME'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object btn_down: TSpeedButton
    Left = 229
    Top = 3
    Width = 17
    Height = 17
    Glyph.Data = {
      3E020000424D3E0200000000000036000000280000000D0000000D0000000100
      18000000000008020000C30E0000C30E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0DFDDF0DFDE
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6F4CF
      9A978F1715C68681FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFDAB0AE9F322D870100810000C78883FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFF0DEDCB35E5A8905008802008C0A00840000C78984FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFD7A8A4941C198600008B09008C0B018C0B01840000C78984
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFAF544D7F00008B09008C0B018C0B018C
      0B01840000C78984FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFF0DEDDB25B578904
      008803008C0B018C0B01840000C78984FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFD8ACA99B29248500008A0600840000C78984FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6E5BF77739217117E0000C68681
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB
      D4D2A94C48CD9590FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF9FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00}
    OnClick = btn_downClick
  end
  object btn_up: TSpeedButton
    Left = 245
    Top = 3
    Width = 17
    Height = 17
    Glyph.Data = {
      3E020000424D3E0200000000000036000000280000000D0000000D0000000100
      18000000000008020000C30E0000C30E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFF9F1F1EEDAD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE1BEBC921712C4817DF9F3F1FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE1BEBB8906
      008500009F332ED19E9AFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFE1BFBC8C0B018B0900880200880100AF544FEBD5D2FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFE1BFBC8C0B018B09008C0B018B0A00860000921711
      CD9591FEFDFDFFFFFF00FFFFFFFFFFFFFFFFFFE1BFBC8C0B018B09008C0B018C
      0B018C0B0084000090140AFAF3F3FFFFFF00FFFFFFFFFFFFFFFFFFE1BFBC8C0B
      018B09008C0B018A08008500009C2C28D9AEABFFFEFEFFFFFF00FFFFFFFFFFFF
      FFFFFFE1BFBC8C0B018A07008600008D0C07BD726EF5EAE9FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFE1BEBB880200890400AE534EE3C3C1FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE2C1BF9F332ED8ACA9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFDFBFBFCF9
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00}
    OnClick = btn_upClick
  end
  object Label_Info: TLabel
    Left = 266
    Top = 6
    Width = 14
    Height = 11
    Caption = 'Hz'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #44404#47548
    Font.Style = []
    ParentFont = False
  end
  object Edit_Value: TEdit
    Left = 184
    Top = 0
    Width = 41
    Height = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #44404#47548
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    ParentFont = False
    TabOrder = 0
  end
end
