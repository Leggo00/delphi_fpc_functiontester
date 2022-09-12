object FrmDBConnect: TFrmDBConnect
  Left = 605
  Top = 294
  BorderStyle = bsDialog
  Caption = 'DB '#49444#51221
  ClientHeight = 253
  ClientWidth = 329
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
  object Label4: TLabel
    Left = 35
    Top = 24
    Width = 286
    Height = 13
    AutoSize = False
    Caption = #45936#51060#53552#48288#51060#49828#50640' '#50672#44208#54624' '#50672#44208' '#51221#48372#47484' '#51077#47141#54633#45768#45796'.'
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      0000200000000100040000000000000200000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00555555555555555555555555555555555555555555555000005555555555
      5555550F0000000003BF30000000000F0555558F8888888883BF30888888888F
      8555557F77777777733330777777777F75555555555555555578055555555555
      5555555555555555557805555555555555555555555555555507055555555555
      5555555555555000000000005555555555555555555578888888888705555555
      5555555555557888888899877055555555555555555578888888888777055555
      5555555555557888888888877705555555555555555578888888888777055555
      5555555555557888888888877705555555555555555578888888888777055555
      555555555555788888888887770555555555555555557FFFFFFFFFF877055555
      5555555555557777777777708705555555555555555578888888888708055555
      5555555555557888888888877005555555555555555578888888888777055555
      5555555555557FFFFFFFFFF87705555555555555555577777777777087055555
      5555555555557888888888870805555555555555555578888888888770055555
      5555555555557888888888877705555555555555555578888888888777055555
      5555555555557FFFFFFFFFF77705555555555555555557888888888877055555
      5555555555555578888888888705555555555555555555577777777777555555
      5555}
    Transparent = True
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 47
    Width = 254
    Height = 160
    Caption = #50672#44208' '#49444#51221
    TabOrder = 0
    object Label2: TLabel
      Left = 43
      Top = 100
      Width = 56
      Height = 13
      Caption = #47196#44536#51064' ID :'
    end
    object Label3: TLabel
      Left = 44
      Top = 124
      Width = 54
      Height = 13
      Caption = #48708#48128#48264#54840' :'
    end
    object Label5: TLabel
      Left = 28
      Top = 29
      Width = 72
      Height = 13
      Caption = #54840#49828#53944' '#51060#47492' : '
    end
    object Label1: TLabel
      Left = 20
      Top = 53
      Width = 78
      Height = 13
      Caption = #45936#51060#53440#48288#51060#49828' :'
    end
    object Label6: TLabel
      Left = 66
      Top = 77
      Width = 30
      Height = 13
      Caption = 'PORT'
    end
    object edtHostName: TEdit
      Left = 106
      Top = 25
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object edtDBName: TEdit
      Left = 106
      Top = 49
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
    end
    object edtLoginID: TEdit
      Left = 106
      Top = 97
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
    end
    object edtPassWord: TEdit
      Left = 106
      Top = 121
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
    end
    object edtPort: TEdit
      Left = 106
      Top = 73
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 136
    Top = 218
    Width = 75
    Height = 25
    Caption = #54869#51064
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnClose: TButton
    Left = 215
    Top = 218
    Width = 75
    Height = 25
    Caption = #45803#44592
    Default = True
    TabOrder = 2
    OnClick = btnCloseClick
  end
end
