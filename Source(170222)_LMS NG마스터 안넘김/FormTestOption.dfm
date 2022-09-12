object FrmTestOption: TFrmTestOption
  Left = 490
  Top = 95
  BorderStyle = bsDialog
  Caption = #49884#54744#50741#49496
  ClientHeight = 430
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label9: TLabel
    Left = 167
    Top = 338
    Width = 9
    Height = 12
    Caption = '~'
  end
  object GroupBox1: TGroupBox
    Left = 296
    Top = 188
    Width = 281
    Height = 113
    Caption = #9654' '#52769#51221' '#50741#49496
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 38
      Width = 12
      Height = 12
      Caption = #54924
    end
    object Label2: TLabel
      Left = 120
      Top = 86
      Width = 24
      Height = 12
      Caption = #49884#44036
    end
    object Label8: TLabel
      Left = 224
      Top = 86
      Width = 12
      Height = 12
      Caption = #48516
    end
    object CheckBox_TestCount: ZIniCheckBox
      Left = 16
      Top = 32
      Width = 97
      Height = 17
      Hint = 'TestCount'
      Caption = #52769#51221#54924#49688' '#49444#51221
      TabOrder = 0
      IniKey = 'UseTestCount'
      IniDataSource = INI
    end
    object Edit_TestCount: ZIniSpinEdit
      Left = 120
      Top = 30
      Width = 81
      Height = 21
      MaxValue = 99999
      MinValue = 1
      TabOrder = 1
      Value = 1
      IniKey = 'TestCount'
      IniDataSource = INI
    end
    object CheckBox_TestTime: ZIniCheckBox
      Left = 16
      Top = 58
      Width = 97
      Height = 17
      Caption = #52769#51221#49884#44036' '#49444#51221
      TabOrder = 2
      IniKey = 'UseTestTime'
      IniDataSource = INI
    end
    object Edit_TestHour: ZIniSpinEdit
      Left = 48
      Top = 78
      Width = 65
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      IniKey = 'TestHour'
      IniDataSource = INI
    end
    object Edit_TestMin: ZIniSpinEdit
      Left = 152
      Top = 78
      Width = 65
      Height = 21
      MaxValue = 59
      MinValue = 0
      TabOrder = 4
      Value = 0
      IniKey = 'TestMin'
      IniDataSource = INI
    end
  end
  object Radio_DataSave: ZIniRadioGroup
    Left = 296
    Top = 56
    Width = 137
    Height = 125
    Caption = #9654' '#45936#51060#53552' '#51200#51109
    ItemIndex = 0
    Items.Strings = (
      #47784#46160' '#51200#51109
      #50577#54408' '#51200#51109
      #48520#47049' '#51200#51109
      #51200#51109' '#50504#54632)
    TabOrder = 1
    OnClick = Radio_DataSaveClick
    IniKey = 'DataSave'
    IniDataSource = INI
  end
  object BitBtn2: TBitBtn
    Left = 404
    Top = 380
    Width = 81
    Height = 40
    Caption = #54869#51064
    ModalResult = 1
    TabOrder = 2
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600CCFFFF0099FFFF0066FFFF0033FFFF00FFCCFF00CCCCFF0099CCFF0066CC
      FF0033CCFF0000CCFF00FF99FF00CC99FF009999FF006699FF003399FF000099
      FF00FF66FF00CC66FF009966FF006666FF003366FF000066FF00FF33FF00CC33
      FF009933FF006633FF003333FF000033FF00CC00FF009900FF006600FF003300
      FF00FFFFCC00CCFFCC0099FFCC0066FFCC0066FFCC0033FFCC0000FFCC00FFCC
      CC00CCCCCC0099CCCC0066CCCC0033CCCC0000CCCC00FF99CC00CC99CC009999
      CC006699CC003399CC000099CC00FF66CC00CC66CC009966CC006666CC003366
      CC000066CC00FF33CC00CC33CC009933CC006633CC003333CC000033CC00FF00
      CC00CC00CC009900CC006600CC003300CC000000CC00FFFF9900CCFF990099FF
      990066FF990033FF990000FF9900FFCC9900CCCC990099CC990066CC990033CC
      990000CC9900FF999900CC99990099999900669999003399990000999900FF66
      9900CC66990099669900666699003366990000669900FF339900CC3399009933
      9900663399003333990000339900FF009900CC00990099009900660099003300
      990000009900FFFF6600CCFF660099FF660066FF660033FF660000FF6600FFCC
      6600CCCC660099CC660066CC660033CC660000CC6600FF996600CC9966009999
      6600669966003399660000996600FF666600CC66660099666600666666003366
      660000666600FF336600CC33660099336600663366003333660000336600FF00
      6600CC00660099006600660066003300660000006600FFFF3300CCFF330099FF
      330066FF330033FF330000FF3300FFCC3300CCCC330099CC330066CC330033CC
      330000CC3300FF993300CC99330099993300669933003399330000993300FF66
      3300CC66330099663300666633003366330000663300FF333300CC3333009933
      3300663333003333330000333300FF003300CC00330099003300660033003300
      330000003300CCFF000099FF000066FF000033FF0000FFCC0000CCCC000099CC
      000066CC000033CC000000CC0000FF990000CC99000099990000669900003399
      000000990000FF660000CC66000099660000666600000066000033660000FF33
      0000CC33000099330000663300003333000000330000CC000000990000006600
      0000330000000000DD000000BB000000AA000000880000007700000055000000
      44000000220000DD000000BB000000AA00000088000000770000005500000044
      000000220000DDDDDD0055555500777777007777770044444400222222001111
      110077000000550000004400000022000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00323232323232
      3232323232323232000000EDEDEDEDEDED323232323232323232323232323232
      323232323232000013131900EDEDEDEDEDED3232323232323232323232323232
      32323232000013131313191900EDEDEDEDEDED32323232323232323232323232
      3232000013131313131319191900EDEDEDEDEDED323232323232323232323232
      320013131313131313131919191900EDEDEDEDEDED3232323232323232323232
      320013131313131313131919191900EDEDEDED32323232323232323232323232
      320013131313131313131919191900EDED323232323232323232323232323232
      3200131313131313000000191919003232323232323232323232323232323232
      3200131313130000424242001919003232323232323232323232323232323232
      3200131300004242424242420019003232323232323232323232323232323232
      3200000042424242000000424200003232323232323232323232323232323232
      3200424242420000131319000032323232323232323232323232323232323232
      3232004200001313131319190032323232323232323232323232323232323232
      3232000013131313131319191900003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313131319191919003232323232323232323232323232323232
      3200131313131313FFFFFF191919003232323232323232323232323232323232
      320013131313FFFFFBFBFBFF1919003232323232323232323232323232323232
      32001313FFFFFBFBFBFBFBFBFF19003232323232323232323232323232323232
      3200FFFFFBFBFBFBFBFBFBFBFBFF003232323232323232323232323232323232
      3200FBFBFBFBFBFBFBFBFBFBFBFB003232323232323232323232323232323232
      323200FBFBFBFBFBFBFBFBFB0000323232323232323232323232323232323232
      32323200FBFBFBFBFBFB00003232323232323232323232323232323232323232
      3232323200FBFBFB000032323232323232323232323232323232323232323232
      3232323232000000323232323232323232323232323232323232}
  end
  object BtnClose: TBitBtn
    Left = 492
    Top = 380
    Width = 81
    Height = 40
    Caption = #52712#49548
    ModalResult = 2
    TabOrder = 3
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600CCFFFF0099FFFF0066FFFF0033FFFF00FFCCFF00CCCCFF0099CCFF0066CC
      FF0033CCFF0000CCFF00FF99FF00CC99FF009999FF006699FF003399FF000099
      FF00FF66FF00CC66FF009966FF006666FF003366FF000066FF00FF33FF00CC33
      FF009933FF006633FF003333FF000033FF00CC00FF009900FF006600FF003300
      FF00FFFFCC00CCFFCC0099FFCC0066FFCC0066FFCC0033FFCC0000FFCC00FFCC
      CC00CCCCCC0099CCCC0066CCCC0033CCCC0000CCCC00FF99CC00CC99CC009999
      CC006699CC003399CC000099CC00FF66CC00CC66CC009966CC006666CC003366
      CC000066CC00FF33CC00CC33CC009933CC006633CC003333CC000033CC00FF00
      CC00CC00CC009900CC006600CC003300CC000000CC00FFFF9900CCFF990099FF
      990066FF990033FF990000FF9900FFCC9900CCCC990099CC990066CC990033CC
      990000CC9900FF999900CC99990099999900669999003399990000999900FF66
      9900CC66990099669900666699003366990000669900FF339900CC3399009933
      9900663399003333990000339900FF009900CC00990099009900660099003300
      990000009900FFFF6600CCFF660099FF660066FF660033FF660000FF6600FFCC
      6600CCCC660099CC660066CC660033CC660000CC6600FF996600CC9966009999
      6600669966003399660000996600FF666600CC66660099666600666666003366
      660000666600FF336600CC33660099336600663366003333660000336600FF00
      6600CC00660099006600660066003300660000006600FFFF3300CCFF330099FF
      330066FF330033FF330000FF3300FFCC3300CCCC330099CC330066CC330033CC
      330000CC3300FF993300CC99330099993300669933003399330000993300FF66
      3300CC66330099663300666633003366330000663300FF333300CC3333009933
      3300663333003333330000333300FF003300CC00330099003300660033003300
      330000003300CCFF000099FF000066FF000033FF0000FFCC0000CCCC000099CC
      000066CC000033CC000000CC0000FF990000CC99000099990000669900003399
      000000990000FF660000CC66000099660000666600000066000033660000FF33
      0000CC33000099330000663300003333000000330000CC000000990000006600
      0000330000000000DD000000BB000000AA000000880000007700000055000000
      44000000220000DD000000BB000000AA00000088000000770000005500000044
      000000220000DDDDDD0055555500777777007777770044444400222222001111
      110077000000550000004400000022000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232320000000032323232323232323232323232323232323232
      323232323232320000DEDEDEDE00003232323232323232323232323232323232
      32323232323200DEDE7272DEDEDEDE0032323232323232323232323232323232
      32323232323200DE72DDDDDD7272720032323232323232323232323232323232
      323232323200DEDEDD4E4E4EDDDD72DE00323232323232323232323232323232
      323232323200DEDD4EDBDB4EDBDD72DE00323232323232323232323232323232
      323232323200DD4EF9F9F9DBDBDD72DE00323232323232323232323232323232
      323232323200DD4EF9FFF9DBDBDDDDDE00323232323232323232323232323232
      32323232323200DBF9F9F9DB4EDDDE0032323232323232323232323232323232
      32323232323200DDDBDBDBDDDEDEDE0032323232323232323232323232323232
      3232323232323200000000DEDE00003232323232323232323232323232323232
      32323232323232323200DE000032323232323232323232323232323232323232
      323232323232323200DBDEDE0032323232323232323232323232323232323232
      323232323232323200DBDEDEDE00323232323232323232323232323232323232
      3232323232323200DBDBDEDEDE00323232323232323232323232323232323232
      3232323232323200DBDBDBDEDE00323232323232323232323232323232323232
      3232323232323200DBDBDBDEDEDE003232323232323232323232323232323232
      3232323232323200DBDBDBDEDEDE003232323232323232323232323232323232
      32323232323200DBDBDBDBDBDEDE003232323232323232323232323232323232
      32323232323200DBDBDBDBDBDEDEDE0032323232323232323232323232323232
      32323232323200DBDBDBDBDBDEDEDE0032323232323232323232323232323232
      323232323200DBDBDBDBDBDBDBDEDEDE00323232323232323232323232323232
      323232323200DBDBDBDBDB1D1D1DDEDE00323232323232323232323232323232
      323232323200DBDBDB1D1DDBDBDB1DDE00323232323232323232323232323232
      323232323200DB1D1DDBDBDBDBDBDB1DDE003232323232323232323232323232
      32323232001D1DDBDBDBDBDBDBDBDBDB1D003232323232323232323232323232
      3232323200DBDBDBDBDBDBDBDBDBDBDBDB003232323232323232323232323232
      323232323200DBDBDBDBDBDBDBDBDB0000323232323232323232323232323232
      32323232323200DBDBDBDBDBDB00003232323232323232323232323232323232
      3232323232323200DBDBDB000032323232323232323232323232323232323232
      3232323232323232000000323232323232323232323232323232}
  end
  object Radio_GraghSave: ZIniRadioGroup
    Left = 440
    Top = 56
    Width = 137
    Height = 125
    Caption = #9654' '#44536#47000#54532' '#51200#51109
    ItemIndex = 0
    Items.Strings = (
      #47784#46160' '#51200#51109
      #50577#54408' '#51200#51109
      #48520#47049' '#51200#51109
      #51200#51109' '#50504#54632)
    TabOrder = 4
    IniKey = 'GraghSave'
    IniDataSource = INI
  end
  object gbx2: TGroupBox
    Left = 8
    Top = 55
    Width = 279
    Height = 370
    Caption = #9654' '#52769#51221#50741#49496
    TabOrder = 5
    object Label5: TLabel
      Left = 158
      Top = 216
      Width = 9
      Height = 12
      Caption = '~'
    end
    object Label7: TLabel
      Left = 14
      Top = 170
      Width = 91
      Height = 12
      Caption = 'DIAG COUNT :  '
    end
    object Label10: TLabel
      Left = 158
      Top = 248
      Width = 9
      Height = 12
      Caption = '~'
    end
    object chkNgStop: ZIniCheckBox
      Left = 16
      Top = 24
      Width = 88
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = 'NG STOP'
      TabOrder = 0
      IniKey = 'chkNgStop'
      IniDataSource = INI
    end
    object Cb_UseBarcode: ZIniCheckBox
      Left = 16
      Top = 48
      Width = 88
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = #48148#53076#46300' '#49324#50857
      TabOrder = 1
      IniKey = 'UseBarcode'
      IniDataSource = INI
    end
    object Cb_PrevCheck: ZIniCheckBox
      Left = 16
      Top = 72
      Width = 117
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = #51060#51204#44277#51221' '#44160#49324
      TabOrder = 2
      IniKey = 'PrevCheck'
      IniDataSource = INI
    end
    object Cb_AutoModelChange: ZIniCheckBox
      Left = 136
      Top = 24
      Width = 133
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = #51088#46041' '#47784#45944#48320#44221
      TabOrder = 3
      IniKey = 'AutoModelChange'
      IniDataSource = INI
    end
    object Cb_UseITAC: ZIniCheckBox
      Left = 136
      Top = 48
      Width = 133
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = 'ITAC '#49324#50857
      TabOrder = 4
      IniKey = 'UseITAC'
      IniDataSource = INI
    end
    object Cb_AutoNGStop_: ZIniCheckBox
      Left = 16
      Top = 96
      Width = 221
      Height = 17
      Hint = #54260#45908#51060#47492' '#51088#46041#49373#49457
      Caption = '               '#54924' '#50672#49549#48520#47049' '#49884' '#51109#48708' '#51221#51648
      TabOrder = 5
      Visible = False
      IniKey = 'AutoNgStop'
      IniDataSource = INI
    end
    object Ed_NgStopCount_: ZIniSpinEdit
      Left = 34
      Top = 93
      Width = 56
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 0
      Visible = False
      IniKey = 'NgStopCount'
      IniDataSource = INI
    end
    object Cb_CounterAutoReset: ZIniCheckBox
      Tag = 100
      Left = 16
      Top = 120
      Width = 124
      Height = 17
      Caption = #52852#50868#53552' '#51088#46041#47532#49483
      Checked = True
      State = cbChecked
      TabOrder = 7
      IniKey = 'CounterAutoReset'
      IniDataSource = INI
    end
    object DateTimePicker: TDateTimePicker
      Tag = 100
      Left = 136
      Top = 117
      Width = 105
      Height = 20
      Date = 40463.000000000000000000
      Time = 40463.000000000000000000
      ImeName = 'Microsoft Office IME 2007'
      Kind = dtkTime
      TabOrder = 8
    end
    object Cb_JigModelCheck: ZIniCheckBox
      Left = 136
      Top = 74
      Width = 117
      Height = 17
      Caption = #51648#44536#47784#45944#44048#51648
      TabOrder = 9
      Visible = False
      IniKey = 'JigModelCheck'
      IniDataSource = INI
    end
    object cb_TempSpec: ZIniCheckBox
      Left = 15
      Top = 190
      Width = 224
      Height = 17
      Caption = 'HOT '#50728#46020' spec'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      IniKey = 'cb_TempSpec'
      IniDataSource = INI
    end
    object edt_TempLowSpec: ZIniRealSpinEdit
      Left = 89
      Top = 210
      Width = 61
      Height = 21
      Increment = 1.000000000000000000
      TabOrder = 11
      IniKey = 'edt_TempLowSpec'
      IniDataSource = INI
    end
    object edt_TempMaxSpec: ZIniRealSpinEdit
      Left = 175
      Top = 210
      Width = 61
      Height = 21
      Increment = 1.000000000000000000
      TabOrder = 12
      IniKey = 'edt_TempMaxSpec'
      IniDataSource = INI
    end
    object Edt_StartDiag: ZIniEdit
      Left = 109
      Top = 166
      Width = 132
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 13
      Text = '0'
      IniKey = 'Edt_StartDiag'
      IniDataSource = INI
      MoveCursor = False
    end
    object cbCPuse: ZIniCheckBox
      Left = 16
      Top = 146
      Width = 117
      Height = 17
      Caption = 'CP USE'
      TabOrder = 14
      IniKey = 'CPUSE'
      IniDataSource = INI
    end
    object cb_TempConn: ZIniCheckBox
      Left = 16
      Top = 269
      Width = 224
      Height = 17
      Caption = #50728#46020' '#44228#52769#44592' '#53685#49888#54869#51064
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      IniKey = 'cb_TempConn'
      IniDataSource = INI
    end
    object cb_TempSpec2: ZIniCheckBox
      Left = 15
      Top = 229
      Width = 224
      Height = 17
      Caption = #49345#50728' '#50728#46020' spec'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      IniKey = 'cb_TempSpec2'
      IniDataSource = INI
    end
    object edt_TempLowSpec2: ZIniRealSpinEdit
      Left = 89
      Top = 244
      Width = 61
      Height = 21
      Increment = 1.000000000000000000
      TabOrder = 17
      IniKey = 'edt_TempLowSpec2'
      IniDataSource = INI
    end
    object edt_TempMaxSpec2: ZIniRealSpinEdit
      Left = 175
      Top = 244
      Width = 61
      Height = 21
      Increment = 1.000000000000000000
      TabOrder = 18
      IniKey = 'edt_TempMaxSpec2'
      IniDataSource = INI
    end
    object cbAutoReset: ZIniCheckBox
      Left = 16
      Top = 298
      Width = 257
      Height = 17
      Caption = #53580#49828#53944' '#51221#51648#54980'             '#48516' '#51060#49345' '#51088#46041' '#52488#44592#54868
      TabOrder = 19
      IniKey = 'cbAutoReset'
      IniDataSource = INI
    end
    object edtAutoReset: ZIniEdit
      Left = 112
      Top = 295
      Width = 48
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 20
      Text = '0'
      IniKey = 'edtAutoReset'
      IniDataSource = INI
      MoveCursor = False
    end
    object cb_PCBcheck: ZIniCheckBox
      Left = 16
      Top = 325
      Width = 224
      Height = 17
      Caption = 'PCB BCD CHECK'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      IniKey = 'cb_PCBcheck'
      IniDataSource = INI
    end
  end
  object GroupBox2: TGroupBox
    Left = 240
    Top = 120
    Width = 177
    Height = 25
    Caption = #9654' MASTER '#49444#51221
    TabOrder = 6
    Visible = False
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 113
      Height = 12
      Caption = 'MASTER BARCODE'
    end
    object Label4: TLabel
      Left = 144
      Top = 24
      Width = 81
      Height = 12
      Caption = 'MODEL CODE'
    end
    object BtnMasterAdd: TSpeedButton
      Left = 16
      Top = 64
      Width = 57
      Height = 21
      Caption = #52628#44032
      OnClick = BtnMasterAddClick
    end
    object BtnMasterDelete: TSpeedButton
      Left = 73
      Top = 64
      Width = 57
      Height = 21
      Caption = #49325#51228
      OnClick = BtnMasterDeleteClick
    end
    object Ed_MasterSerial: TEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 0
    end
    object Ed_MasterModelCode: TEdit
      Left = 144
      Top = 40
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      TabOrder = 1
    end
    object VList_Master: TValueListEditor
      Left = 16
      Top = 88
      Width = 249
      Height = 169
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
      TabOrder = 2
      TitleCaptions.Strings = (
        'BARCODE'
        'MODEL CODE')
      ColWidths = (
        126
        117)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 41
    Align = alTop
    TabOrder = 7
    object Lb_Status: TdpbLabel
      Left = 7
      Top = 5
      Width = 163
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = 'NORMAL'
      Color = clTeal
      EdgeStyle = desBump
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      ShadowColor = clBlack
      TextStyle = dtsShadow
    end
    object BtnLoadDefault: TXiButton
      Left = 173
      Top = 4
      Width = 89
      Height = 33
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = 6447714
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 10921638
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 7697781
      OverColorText = clBlack
      DownColorFace = 13290186
      DownColorGrad = 14342874
      DownColorDark = 15329769
      DownColorLight = 8158332
      DownColorBorder = 5131854
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 11382189
      ColorScheme = csNeoSilver
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Default '#49444#51221
      TabOrder = 0
      OnClick = BtnLoadDefaultClick
    end
    object BtnLoadMaster: TXiButton
      Left = 261
      Top = 4
      Width = 89
      Height = 33
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = 6447714
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 10921638
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 7697781
      OverColorText = clBlack
      DownColorFace = 13290186
      DownColorGrad = 14342874
      DownColorDark = 15329769
      DownColorLight = 8158332
      DownColorBorder = 5131854
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 11382189
      ColorScheme = csNeoSilver
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Master '#49444#51221
      TabOrder = 1
      OnClick = BtnLoadMasterClick
    end
    object BtnSaveDefault: TXiButton
      Left = 397
      Top = 4
      Width = 89
      Height = 33
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = 6447714
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 10921638
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 7697781
      OverColorText = clBlack
      DownColorFace = 13290186
      DownColorGrad = 14342874
      DownColorDark = 15329769
      DownColorLight = 8158332
      DownColorBorder = 5131854
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 11382189
      ColorScheme = csNeoSilver
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Default '#51200#51109
      TabOrder = 2
      OnClick = BtnSaveDefaultClick
    end
    object BtnSaveMaster: TXiButton
      Left = 485
      Top = 4
      Width = 89
      Height = 33
      ColorFace = 15987699
      ColorGrad = 12369084
      ColorDark = 10987431
      ColorLight = 16250871
      ColorBorder = 6447714
      ColorText = clBlack
      OverColorFace = 15790320
      OverColorGrad = 10921638
      OverColorDark = 10658466
      OverColorLight = 15658734
      OverColorBorder = 7697781
      OverColorText = clBlack
      DownColorFace = 13290186
      DownColorGrad = 14342874
      DownColorDark = 15329769
      DownColorLight = 8158332
      DownColorBorder = 5131854
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 11382189
      ColorScheme = csNeoSilver
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Caption = 'Master '#51200#51109
      TabOrder = 3
      OnClick = BtnSaveMasterClick
    end
  end
  object Edit_OldDate: ZIniEdit
    Left = 304
    Top = 308
    Width = 121
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 8
    Visible = False
    IniKey = 'Edit_OldDate'
    IniDataSource = TraceINI
    MoveCursor = False
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'STARTOPTION'
    Left = 440
    Top = 312
  end
  object TraceINI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'TRACECOUNT'
    Left = 496
    Top = 312
  end
end
