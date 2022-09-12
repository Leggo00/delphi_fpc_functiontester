object FrmOption: TFrmOption
  Left = 351
  Top = 152
  BorderStyle = bsDialog
  Caption = #50741#49496
  ClientHeight = 486
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 4
    Top = 4
    Width = 605
    Height = 443
    ActivePage = TabSheet5
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = #46356#51088#51064#54268
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 48
        Top = 87
        Width = 243
        Height = 141
        TabOrder = 0
        object dpbLabel2: TdpbLabel
          Left = 48
          Top = 84
          Width = 46
          Height = 12
          Alignment = taCenter
          Caption = #9679' Width'
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object dpbLabel3: TdpbLabel
          Left = 48
          Top = 110
          Width = 51
          Height = 12
          Alignment = taCenter
          Caption = #9679' Height'
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object dpbLabel4: TdpbLabel
          Left = 48
          Top = 31
          Width = 36
          Height = 12
          Alignment = taCenter
          Caption = #9679' Left'
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object dpbLabel5: TdpbLabel
          Left = 48
          Top = 57
          Width = 38
          Height = 12
          Alignment = taCenter
          Caption = #9679' Top'
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object edtFormWidth: ZIniSpinEdit
          Left = 124
          Top = 79
          Width = 73
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
          IniKey = 'FormWidth'
          IniDataSource = IniOption
        end
        object edtFormHeight: ZIniSpinEdit
          Left = 124
          Top = 105
          Width = 73
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          IniKey = 'FormHeight'
          IniDataSource = IniOption
        end
        object edtFormLeft: ZIniSpinEdit
          Left = 124
          Top = 26
          Width = 73
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
          IniKey = 'FormLeft'
          IniDataSource = IniOption
        end
        object edtFormTop: ZIniSpinEdit
          Left = 124
          Top = 52
          Width = 73
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          IniKey = 'FormTop'
          IniDataSource = IniOption
        end
        object chkChangeFormSize: ZIniCheckBox
          Left = 6
          Top = -2
          Width = 150
          Height = 17
          Caption = 'Form '#50948#52824'/'#53356#44592' '#48320#44221
          TabOrder = 4
          OnClick = chkChangeFormSizeClick
          IniKey = 'ChangeFormSize'
          IniDataSource = IniOption
        end
      end
      object GroupBox2: TGroupBox
        Left = 48
        Top = 12
        Width = 243
        Height = 67
        Caption = #52980#54252#45324#53944
        TabOrder = 1
        object dpbLabel1: TdpbLabel
          Left = 48
          Top = 32
          Width = 64
          Height = 12
          Alignment = taCenter
          Caption = #9679' '#51060#46041#44036#44201
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object edtMovePixel: ZIniSpinEdit
          Left = 124
          Top = 27
          Width = 73
          Height = 21
          MaxValue = 20
          MinValue = 2
          TabOrder = 0
          Value = 2
          IniKey = 'MovePixel'
          IniDataSource = IniOption
        end
      end
      object GroupBox3: TGroupBox
        Left = 48
        Top = 234
        Width = 243
        Height = 67
        Caption = #51088#49437#54952#44284
        TabOrder = 2
        object dpbLabel6: TdpbLabel
          Left = 48
          Top = 32
          Width = 64
          Height = 12
          Alignment = taCenter
          Caption = #9679' '#51217#44540#44036#44201
          Color = clWhite
          Layout = tlCenter
          ParentColor = False
          ShadowColor = clGray
          Transparent = True
        end
        object edtSnapWidth: ZIniSpinEdit
          Left = 124
          Top = 27
          Width = 73
          Height = 21
          MaxValue = 50
          MinValue = 10
          TabOrder = 0
          Value = 10
          IniKey = 'SnapWidth'
          IniDataSource = IniOption
        end
      end
    end
  end
  object btnOk: TBitBtn
    Left = 444
    Top = 449
    Width = 81
    Height = 32
    Caption = #54869#51064
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 526
    Top = 449
    Width = 81
    Height = 32
    Caption = #52712#49548
    TabOrder = 2
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object IniOption: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'Option'
    Left = 16
    Top = 44
  end
end
