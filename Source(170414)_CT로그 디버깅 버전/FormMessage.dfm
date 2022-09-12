object FrmMessage: TFrmMessage
  Left = 289
  Top = 143
  Width = 757
  Height = 131
  Caption = #49324#50857#51088' '#47700#49464#51648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 97
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = clSilver
    TabOrder = 0
    object GradientFill: TGradientFill
      Left = 5
      Top = 5
      Width = 739
      Height = 87
      ColorBegin = 8404992
      ColorNum = 255
      Align = alClient
    end
    object Label_Msg: TdpbLabel
      Left = 5
      Top = 5
      Width = 739
      Height = 87
      Align = alClient
      Alignment = taCenter
      Caption = #49324#50857#51088#47700#49464#51648
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  object TimerClose: TTimer
    Enabled = False
    OnTimer = TimerCloseTimer
    Left = 616
    Top = 32
  end
end
