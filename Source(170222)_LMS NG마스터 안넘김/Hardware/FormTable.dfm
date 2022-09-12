object FrmTable: TFrmTable
  Left = 346
  Top = 210
  Width = 230
  Height = 356
  Caption = 'ASCII TABLE'
  Color = clBtnFace
  Constraints.MaxWidth = 230
  Constraints.MinWidth = 230
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Grid: TStringGrid
    Left = 0
    Top = 0
    Width = 222
    Height = 322
    Align = alClient
    ColCount = 4
    DefaultColWidth = 50
    DefaultRowHeight = 16
    RowCount = 257
    GridLineWidth = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 0
    OnDrawCell = GridDrawCell
  end
end
