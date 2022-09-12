object Form1: TForm1
  Left = 651
  Top = 280
  Width = 1255
  Height = 658
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 88
    Width = 39
    Height = 13
    Caption = 'AD1_01'
  end
  object Label4: TLabel
    Left = 8
    Top = 216
    Width = 63
    Height = 13
    Caption = #44536#47000#54532' '#44036#44201
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = 'ShowModal'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 89
    Height = 25
    Caption = 'Do Test'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 109
    Width = 89
    Height = 21
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    TabOrder = 2
    Text = 'Edit1'
  end
  object GroupBox1: TGroupBox
    Left = 120
    Top = 16
    Width = 617
    Height = 569
    Caption = 'GroupBox1'
    TabOrder = 3
    object Label2: TLabel
      Left = 97
      Top = 19
      Width = 46
      Height = 13
      Caption = 'RECORD'
    end
    object Label3: TLabel
      Left = 97
      Top = 41
      Width = 51
      Height = 13
      Caption = 'CHANNEL'
    end
    object CheckListBox1: TCheckListBox
      Left = 16
      Top = 24
      Width = 61
      Height = 425
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 13
      Items.Strings = (
        'CH1'
        'CH2'
        'CH3'
        'CH4'
        'CH5'
        'CH6'
        'CH7'
        'CH8'
        'CH9'
        'CH0'
        'CH11'
        'CH12'
        'CH13'
        'CH14'
        'CH15'
        'CH16'
        'CH17'
        'CH18'
        'CH19'
        'CH20'
        'CH21'
        'CH22'
        'CH23'
        'CH24'
        'CH25'
        'CH26'
        'CH27'
        'CH28'
        'CH29'
        'CH30'
        'CH31'
        'CH32')
      TabOrder = 0
    end
    object Button3: TButton
      Left = 416
      Top = 12
      Width = 105
      Height = 25
      Caption = 'BUFF READ'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Chart1: TChart
      Left = 96
      Top = 64
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 2
      ColorPaletteIndex = 13
      object Series1: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
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
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object edtRecordCount: TEdit
      Left = 168
      Top = 14
      Width = 121
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 3
      Text = '1000'
    end
    object edtSampleRate: TEdit
      Left = 168
      Top = 36
      Width = 121
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 4
      Text = '100000'
    end
    object CheckBox1: TCheckBox
      Left = 320
      Top = 16
      Width = 57
      Height = 17
      Caption = #50672#49549
      TabOrder = 5
    end
    object Chart3: TChart
      Left = 96
      Top = 272
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 5.000000000000000000
      LeftAxis.Minimum = -5.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 6
      ColorPaletteIndex = 13
      object FastLineSeries4: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries5: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries6: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart4: TChart
      Left = 96
      Top = 376
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 7
      ColorPaletteIndex = 13
      object FastLineSeries7: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries8: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries9: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart5: TChart
      Left = 96
      Top = 472
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 8
      ColorPaletteIndex = 13
      object FastLineSeries10: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries11: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries12: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart6: TChart
      Left = 352
      Top = 64
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 9
      ColorPaletteIndex = 13
      object FastLineSeries13: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'U'
        LinePen.Color = clRed
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries14: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'V'
        LinePen.Color = clBlue
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries15: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clYellow
        Title = 'W'
        LinePen.Color = clYellow
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart7: TChart
      Left = 352
      Top = 168
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 10
      ColorPaletteIndex = 13
      object FastLineSeries16: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries17: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries18: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart8: TChart
      Left = 352
      Top = 272
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 11
      ColorPaletteIndex = 13
      object FastLineSeries19: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries20: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries21: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart9: TChart
      Left = 352
      Top = 368
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 12
      ColorPaletteIndex = 13
      object FastLineSeries22: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries23: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries24: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart10: TChart
      Left = 352
      Top = 472
      Width = 248
      Height = 93
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsSeries
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 24.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Minimum = -1.000000000000000000
      View3D = False
      Color = clWhite
      TabOrder = 13
      ColorPaletteIndex = 13
      object FastLineSeries25: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'U'
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries26: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'V'
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object FastLineSeries27: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'W'
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object CheckBox2: TCheckBox
      Left = 320
      Top = 40
      Width = 57
      Height = 17
      Caption = 'DATA'
      TabOrder = 14
    end
  end
  object Memo1: TMemo
    Left = 24
    Top = 384
    Width = 249
    Height = 201
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 144
    Width = 57
    Height = 17
    Caption = 'LOG'
    TabOrder = 5
    OnClick = CheckBox3Click
  end
  object Edit2: TEdit
    Left = 16
    Top = 240
    Width = 57
    Height = 21
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    TabOrder = 6
    Text = 'Edit2'
  end
  object CheckBox4: TCheckBox
    Left = 24
    Top = 360
    Width = 97
    Height = 17
    Caption = 'CheckBox4'
    TabOrder = 7
  end
  object Chart2: TChart
    Left = 744
    Top = 320
    Width = 494
    Height = 267
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.CheckBoxes = True
    Legend.LegendStyle = lsSeries
    Title.Text.Strings = (
      '')
    Title.Visible = False
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 24.000000000000000000
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 5.000000000000000000
    LeftAxis.Minimum = -5.000000000000000000
    View3D = False
    Color = clWhite
    TabOrder = 8
    ColorPaletteIndex = 13
    object FastLineSeries1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = 'U'
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object FastLineSeries2: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = 'V'
      LinePen.Color = 3513587
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object FastLineSeries3: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = 'W'
      LinePen.Color = 1330417
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Grid: TAdvStringGrid
    Left = 752
    Top = 19
    Width = 481
    Height = 287
    Cursor = crDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 9
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    Filter = <>
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'MS Sans Serif'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'MS Sans Serif'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurence'
    SearchFooter.HintFindPrev = 'Find previous occurence'
    SearchFooter.HintHighlight = 'Highlight occurences'
    SearchFooter.MatchCaseCaption = 'Match case'
    RowHeights = (
      22
      22
      22
      22
      22
      22
      22
      22
      22
      22)
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 240
    Top = 120
  end
end
