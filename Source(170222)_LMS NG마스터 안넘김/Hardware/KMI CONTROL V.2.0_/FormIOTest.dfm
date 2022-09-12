object FrmIOTest: TFrmIOTest
  Left = 278
  Top = 295
  Width = 705
  Height = 621
  Caption = 'KMI GEN2 TEST'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    Left = 0
    Top = 313
    Width = 689
    Height = 270
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'MemoLog')
    ParentFont = False
    TabOrder = 0
  end
  object Chart1: TChart
    Left = 0
    Top = 41
    Width = 689
    Height = 272
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.ExactDateTime = False
    BottomAxis.Increment = 5.000000000000000000
    BottomAxis.Maximum = 24.000000000000000000
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 100.000000000000000000
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    RightAxis.Maximum = 10.000000000000000000
    View3D = False
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    PrintMargins = (
      15
      19
      15
      19)
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      LinePen.Width = 2
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = clBlue
      VertAxis = aRightAxis
      LinePen.Color = clBlue
      LinePen.Width = 2
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 41
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = 'HARDWARE'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Cb_Running: TCheckBox
      Left = 112
      Top = 8
      Width = 97
      Height = 17
      Caption = 'RUNNING'
      TabOrder = 1
      OnClick = Cb_RunningClick
    end
    object Button2: TButton
      Left = 200
      Top = 8
      Width = 97
      Height = 25
      Caption = 'SAVE IO STATUS'
      TabOrder = 2
    end
    object Button3: TButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = 'DA'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Ed_DA: TEdit
      Left = 512
      Top = 8
      Width = 65
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object Edit_AD: TEdit
      Left = 360
      Top = 8
      Width = 65
      Height = 21
      ReadOnly = True
      TabOrder = 5
      Text = '0'
    end
  end
  object DOTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = DOTimerTimer
    Left = 224
    Top = 56
  end
  object ADTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ADTimerTimer
    Left = 288
    Top = 56
  end
end
