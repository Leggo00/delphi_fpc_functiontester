object FrmSetGraph: TFrmSetGraph
  Left = 592
  Top = 266
  BorderStyle = bsDialog
  Caption = #44536#47000#54532#49444#51221
  ClientHeight = 416
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 388
    Height = 373
    ActivePage = ts2
    Align = alTop
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #44536#47000#54532' '#49444#51221
      object grp1: TGroupBox
        Left = 7
        Top = 8
        Width = 361
        Height = 201
        Caption = #44536#47000#54532' '#49444#51221
        TabOrder = 0
        object lbl1: TLabel
          Left = 24
          Top = 24
          Width = 64
          Height = 12
          Caption = #44536#47000#54532' '#51228#47785
        end
        object lbl2: TLabel
          Left = 40
          Top = 48
          Width = 64
          Height = 12
          Caption = #44536#47000#54532' '#47560#51652
        end
        object shp1: TShape
          Left = 128
          Top = 88
          Width = 112
          Height = 33
          Brush.Style = bsBDiagonal
          Pen.Color = clGray
        end
        object lbl7: TLabel
          Left = 56
          Top = 80
          Width = 30
          Height = 12
          Caption = 'LEFT'
        end
        object lbl8: TLabel
          Left = 256
          Top = 80
          Width = 36
          Height = 12
          Caption = 'RIGHT'
        end
        object lbl9: TLabel
          Left = 152
          Top = 40
          Width = 25
          Height = 12
          Caption = 'TOP'
        end
        object lbl10: TLabel
          Left = 152
          Top = 128
          Width = 53
          Height = 12
          Caption = 'BOTTOM'
        end
        object edt_Title: TEdit
          Left = 104
          Top = 16
          Width = 194
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
        end
        object se_Top: TSpinEdit
          Left = 153
          Top = 56
          Width = 65
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object se_Left: TSpinEdit
          Left = 56
          Top = 96
          Width = 65
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object se_Bottom: TSpinEdit
          Left = 152
          Top = 144
          Width = 65
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object se_Right: TSpinEdit
          Left = 256
          Top = 96
          Width = 65
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object Cb_Split: TCheckBox
          Left = 16
          Top = 176
          Width = 129
          Height = 17
          Caption = #48516#54624#52285#51004#47196' '#48372#44592
          TabOrder = 5
        end
      end
      object grp2: TGroupBox
        Left = 5
        Top = 216
        Width = 363
        Height = 121
        Caption = #49353#49345' '#49440#53469
        TabOrder = 1
        object lbl3: TLabel
          Left = 24
          Top = 24
          Width = 52
          Height = 12
          Caption = #48176#44221' '#49353#49345
        end
        object shp_BackColor: TShape
          Left = 112
          Top = 24
          Width = 32
          Height = 16
          OnMouseDown = shpColorMouseDown
        end
        object lbl4: TLabel
          Left = 24
          Top = 48
          Width = 64
          Height = 12
          Caption = #44536#47000#54532' '#49353#49345
        end
        object shp_FrontColor: TShape
          Left = 112
          Top = 48
          Width = 32
          Height = 16
          OnMouseDown = shpColorMouseDown
        end
        object shp_LineColor: TShape
          Left = 112
          Top = 72
          Width = 32
          Height = 16
          OnMouseDown = shpColorMouseDown
        end
        object lbl5: TLabel
          Left = 24
          Top = 72
          Width = 52
          Height = 12
          Caption = #49440' '#53580#46160#47532
        end
        object shp_GridColor: TShape
          Left = 112
          Top = 96
          Width = 32
          Height = 16
          OnMouseDown = shpColorMouseDown
        end
        object lbl6: TLabel
          Left = 23
          Top = 96
          Width = 64
          Height = 12
          Caption = #44536#47532#46300' '#49353#49345
        end
        object btn4: TSpeedButton
          Left = 216
          Top = 24
          Width = 88
          Height = 32
          Caption = 'WHITE'
          OnClick = btn4Click
        end
        object btn3: TSpeedButton
          Left = 216
          Top = 59
          Width = 88
          Height = 32
          Caption = 'BLACK'
          OnClick = btn3Click
        end
      end
    end
    object ts2: TTabSheet
      Caption = #44536#47000#54532' '#52629' '#49444#51221
      ImageIndex = 1
      object grp3: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 201
        Caption = #52629' '#49444#51221
        TabOrder = 0
        object lbl12: TLabel
          Left = 20
          Top = 71
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #52292#45328#51060#47492
        end
        object lbl13: TLabel
          Left = 28
          Top = 116
          Width = 40
          Height = 12
          Alignment = taRightJustify
          Caption = #52629' '#48276#50948
        end
        object lbl14: TLabel
          Left = 28
          Top = 144
          Width = 40
          Height = 12
          Alignment = taRightJustify
          Caption = #52629' '#49353#49345
        end
        object shp_AxisColor: TShape
          Left = 76
          Top = 143
          Width = 37
          Height = 18
          OnMouseDown = shpColorMouseDown
        end
        object lbl11: TLabel
          Left = 20
          Top = 29
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = #52292#45328#49440#53469
        end
        object Label5: TLabel
          Left = 140
          Top = 116
          Width = 9
          Height = 12
          Caption = '~'
        end
        object Label6: TLabel
          Left = 83
          Top = 95
          Width = 36
          Height = 12
          Caption = #52572#49548#44050
        end
        object Label7: TLabel
          Left = 163
          Top = 95
          Width = 36
          Height = 12
          Caption = #52572#45824#44050
        end
        object Label8: TLabel
          Left = 250
          Top = 95
          Width = 24
          Height = 12
          Caption = #44036#44201
        end
        object edt_AxisName: TEdit
          Left = 75
          Top = 66
          Width = 225
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          Text = 'edt_AxisName'
        end
        object edtAxisMin: TEdit
          Left = 74
          Top = 111
          Width = 60
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          Text = 'edt1'
        end
        object edtAxisMax: TEdit
          Left = 155
          Top = 111
          Width = 60
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 2
          Text = 'edt1'
        end
        object chk_AxisVisible: TCheckBox
          Left = 82
          Top = 174
          Width = 97
          Height = 17
          Caption = 'VISIBLE'
          TabOrder = 3
        end
        object edtAxisStep: TEdit
          Left = 237
          Top = 111
          Width = 60
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 4
          Text = 'edt1'
        end
        object cbb_AxisList: TComboBox
          Left = 76
          Top = 25
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 5
          OnChange = cbb_AxisListChange
        end
        object BtnAxisApply: TBitBtn
          Left = 276
          Top = 161
          Width = 72
          Height = 24
          Caption = #51201#50857
          TabOrder = 6
          OnClick = BtnAxisApplyClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 216
        Width = 361
        Height = 121
        Caption = #47700#51064' '#52629' '#49444#51221
        TabOrder = 1
        object Label9: TLabel
          Left = 23
          Top = 29
          Width = 39
          Height = 12
          Caption = 'Bottom'
        end
        object Label10: TLabel
          Left = 39
          Top = 61
          Width = 20
          Height = 12
          Caption = 'Left'
        end
        object Label11: TLabel
          Left = 31
          Top = 93
          Width = 28
          Height = 12
          Caption = 'Right'
        end
        object cbb_BottomAxis: TComboBox
          Left = 68
          Top = 25
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = #50630#51020
          Items.Strings = (
            #50630#51020)
        end
        object cbb_LeftAxis: TComboBox
          Left = 68
          Top = 57
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            #50630#51020)
        end
        object BtnRefAxisApply: TBitBtn
          Left = 296
          Top = 89
          Width = 52
          Height = 24
          Caption = #51201#50857
          TabOrder = 2
          OnClick = BtnRefAxisApplyClick
        end
        object cbb_RightAxis: TComboBox
          Left = 68
          Top = 89
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          Items.Strings = (
            #50630#51020)
        end
      end
    end
    object ts3: TTabSheet
      Caption = #52292#45328' '#49444#51221
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 329
        Caption = #52629#49444#51221
        TabOrder = 0
        object Label1: TLabel
          Left = 26
          Top = 63
          Width = 48
          Height = 12
          Caption = #52292#45328#51060#47492
        end
        object Label3: TLabel
          Left = 28
          Top = 136
          Width = 52
          Height = 12
          Caption = #52292#45328' '#49353#49345
        end
        object Label4: TLabel
          Left = 25
          Top = 29
          Width = 48
          Height = 12
          Caption = #52292#45328#49440#53469
        end
        object Label2: TLabel
          Left = 15
          Top = 93
          Width = 60
          Height = 12
          Caption = #44592#51456#52629#49444#51221
        end
        object shp_ChColor: TShape
          Left = 84
          Top = 135
          Width = 37
          Height = 18
          OnMouseDown = shpColorMouseDown
        end
        object edt_ChannelName: TEdit
          Left = 83
          Top = 58
          Width = 225
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          Text = 'edt1'
        end
        object chk_ChVisible: TCheckBox
          Left = 82
          Top = 174
          Width = 97
          Height = 17
          Caption = 'VISIBLE'
          TabOrder = 1
        end
        object cbb_ChList: TComboBox
          Left = 84
          Top = 25
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 2
          OnChange = cbb_ChListChange
        end
        object cbb_AxisList2: TComboBox
          Left = 84
          Top = 89
          Width = 221
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnChange = BtnChannelApplyClick
        end
        object BtnChannelApply: TBitBtn
          Left = 276
          Top = 289
          Width = 72
          Height = 24
          Caption = #51201#50857
          TabOrder = 4
          OnClick = BtnChannelApplyClick
        end
      end
    end
  end
  object btnOK: TBitBtn
    Left = 224
    Top = 384
    Width = 75
    Height = 25
    Caption = #54869#51064
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 304
    Top = 384
    Width = 75
    Height = 25
    Caption = #52712#49548
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btn1: TBitBtn
    Left = 8
    Top = 384
    Width = 72
    Height = 24
    Caption = #49444#51221#50676#44592
    TabOrder = 3
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 80
    Top = 384
    Width = 72
    Height = 24
    Caption = #49444#51221#51200#51109
    TabOrder = 4
    OnClick = btn2Click
  end
  object ColorDlg: TColorDialog
    Left = 177
    Top = 282
  end
  object dlgSave: TSaveDialog
    Left = 317
    Top = 81
  end
  object dlgOpen: TOpenDialog
    Left = 318
    Top = 153
  end
end
