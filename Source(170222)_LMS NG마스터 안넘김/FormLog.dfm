object FrmLog: TFrmLog
  Left = 394
  Top = 179
  Width = 406
  Height = 301
  Caption = 'LOG'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 22
    Align = alTop
    TabOrder = 0
    object BtnClear: TSpeedButton
      Left = 5
      Top = 4
      Width = 65
      Height = 17
      Caption = 'CLEAR'
      OnClick = BtnClearClick
    end
  end
  object ListBoxLog: TListBox
    Left = 0
    Top = 22
    Width = 398
    Height = 245
    Align = alClient
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = #54620#44397#50612'('#54620#44544')'
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
  end
end
