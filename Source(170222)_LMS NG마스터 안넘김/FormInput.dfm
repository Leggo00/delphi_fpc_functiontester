object FrmInput: TFrmInput
  Left = 450
  Top = 319
  BorderStyle = bsDialog
  Caption = #44050' '#51077#47141
  ClientHeight = 138
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    280
    138)
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 81
    Caption = #44050#51012' '#51077#47141#54616#49464#50836'.'
    TabOrder = 0
    object Edit_Value: TEdit
      Left = 32
      Top = 32
      Width = 209
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentFont = False
      TabOrder = 0
      Text = '000'
      OnKeyDown = Edit_ValueKeyDown
    end
  end
  object BtnOk: TBitBtn
    Left = 116
    Top = 91
    Width = 78
    Height = 38
    Anchors = [akTop, akRight]
    Caption = #54869#51064
    ModalResult = 1
    TabOrder = 1
  end
  object BtnClose: TBitBtn
    Left = 196
    Top = 91
    Width = 78
    Height = 38
    Anchors = [akTop, akRight]
    Caption = #52712#49548
    ModalResult = 2
    TabOrder = 2
  end
end
