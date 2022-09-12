object FrmSensorModel: TFrmSensorModel
  Left = 552
  Top = 287
  BorderStyle = bsDialog
  Caption = #49468#49436#52280#51312' '#47784#45944#52628#44032
  ClientHeight = 182
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 182
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 5
    TabOrder = 0
    object dpbLabel1: TdpbLabel
      Left = 176
      Top = 20
      Width = 36
      Height = 12
      Caption = #47784#45944#47749
    end
    object dpbLabel2: TdpbLabel
      Left = 176
      Top = 84
      Width = 48
      Height = 12
      Caption = #53580#51060#48660#47749
    end
    object cbKModel: TComboBox
      Left = 16
      Top = 12
      Width = 145
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnSelect = cbKModelSelect
    end
    object edtMd: TEdit
      Left = 176
      Top = 36
      Width = 129
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 1
    end
    object edtSnsr: TEdit
      Left = 176
      Top = 97
      Width = 129
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 2
    end
    object btnAdd: TButton
      Left = 176
      Top = 132
      Width = 129
      Height = 37
      Caption = 'ADD'
      TabOrder = 3
      OnClick = btnAddClick
    end
    object memoSen: TMemo
      Left = 16
      Top = 44
      Width = 145
      Height = 127
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Korean IME 2002'
      ParentFont = False
      TabOrder = 4
    end
  end
end
