object FrmKMIComm: TFrmKMIComm
  Left = 268
  Top = 112
  BorderStyle = bsDialog
  Caption = 'KMI COMMNUNICATION'
  ClientHeight = 680
  ClientWidth = 912
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object dpbLabel8: TdpbLabel
    Left = 8
    Top = 401
    Width = 95
    Height = 12
    Caption = 'COMMAND LIST'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 41
    Align = alTop
    TabOrder = 0
    object dpbLabel1: TdpbLabel
      Left = 12
      Top = 12
      Width = 48
      Height = 12
      Caption = #53685#49888#54252#53944
    end
    object BtnConnect: TSpeedButton
      Left = 144
      Top = 4
      Width = 65
      Height = 33
      Caption = #54252#53944#50672#44208
      OnClick = BtnConnectClick
    end
    object BtnClose: TSpeedButton
      Left = 836
      Top = 4
      Width = 65
      Height = 33
      Caption = #45803#44592
      OnClick = BtnCloseClick
    end
    object BtnClear: TSpeedButton
      Left = 212
      Top = 4
      Width = 77
      Height = 33
      Caption = #54252#53944#52488#44592#54868
      OnClick = BtnClearClick
    end
    object BtnOpen: TSpeedButton
      Left = 298
      Top = 4
      Width = 77
      Height = 33
      Caption = #54028#51068#50676#44592
      OnClick = BtnOpenClick
    end
    object SpeedButton1: TSpeedButton
      Left = 377
      Top = 4
      Width = 77
      Height = 33
      Caption = #51221#48372#51200#51109
      OnClick = SpeedButton1Click
    end
    object Edit_Comport: ZIniSpinEdit
      Left = 72
      Top = 8
      Width = 65
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      IniKey = 'COMPORT'
      IniDataSource = INI
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 661
    Width = 912
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 912
    Height = 620
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'K-LINE'
      object dpbLabel9: TdpbLabel
        Left = 76
        Top = 0
        Width = 21
        Height = 12
        Caption = 'Fmt'
      end
      object dpbLabel10: TdpbLabel
        Left = 116
        Top = 0
        Width = 18
        Height = 12
        Caption = 'Tgt'
      end
      object dpbLabel11: TdpbLabel
        Left = 156
        Top = 0
        Width = 19
        Height = 12
        Caption = 'Src'
      end
      object dpbLabel12: TdpbLabel
        Left = 44
        Top = 48
        Width = 19
        Height = 12
        Caption = 'SID'
      end
      object dpbLabel13: TdpbLabel
        Left = 20
        Top = 72
        Width = 49
        Height = 12
        Caption = 'PARAM1'
      end
      object BtnKWPConnect: TSpeedButton
        Left = 200
        Top = 8
        Width = 65
        Height = 27
        Caption = #50672#44208
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtnKWPConnectClick
      end
      object BtnKWPSend: TSpeedButton
        Left = 368
        Top = 8
        Width = 65
        Height = 27
        Caption = #51204#49569
        OnClick = BtnKWPSendClick
      end
      object dpbLabel15: TdpbLabel
        Left = 20
        Top = 96
        Width = 49
        Height = 12
        Caption = 'PARAM2'
      end
      object dpbLabel16: TdpbLabel
        Left = 4
        Top = 120
        Width = 65
        Height = 12
        Caption = 'COMMAND'
      end
      object BtnKWPDisconnect: TSpeedButton
        Left = 264
        Top = 8
        Width = 65
        Height = 27
        Caption = #54644#51228
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtnKWPDisconnectClick
      end
      object Edit_Fmt: ZIniEdit
        Left = 72
        Top = 16
        Width = 33
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 0
        Text = '00'
        IniKey = 'FMT'
        IniDataSource = INI
        MoveCursor = False
      end
      object Edit_Tgt: ZIniEdit
        Left = 112
        Top = 16
        Width = 33
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 1
        Text = '00'
        IniKey = 'TGT'
        IniDataSource = INI
        MoveCursor = False
      end
      object Edit_Src: ZIniEdit
        Left = 152
        Top = 16
        Width = 33
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 2
        Text = '00'
        IniKey = 'SRC'
        IniDataSource = INI
        MoveCursor = False
      end
      object ComboBox_SID: TComboBox
        Left = 72
        Top = 40
        Width = 361
        Height = 24
        Style = csDropDownList
        DropDownCount = 30
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 16
        ParentFont = False
        TabOrder = 3
        OnChange = ComboBox_SIDChange
      end
      object ComboBox_Param1: TComboBox
        Left = 72
        Top = 64
        Width = 361
        Height = 24
        Style = csDropDownList
        DropDownCount = 30
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        OnChange = ComboBox_Param1Change
      end
      object Memo_KWP: TMemo
        Left = 0
        Top = 144
        Width = 433
        Height = 441
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 5
        WordWrap = False
      end
      object Edit_Frame: ZIniEdit
        Left = 72
        Top = 112
        Width = 361
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 6
        Text = '00'
        MoveCursor = False
      end
      object ComboBox_Param2: TComboBox
        Left = 72
        Top = 88
        Width = 361
        Height = 24
        DropDownCount = 30
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 16
        ParentFont = False
        TabOrder = 7
        OnChange = ComboBox_Param2Change
      end
      object PageControl2: TPageControl
        Left = 440
        Top = 0
        Width = 464
        Height = 593
        ActivePage = TabSheet4
        Align = alRight
        TabOrder = 8
        object TabSheet3: TTabSheet
          Caption = #47700#49464#51648' '#51221#48372
          object MemoMsg: TMemo
            Left = 0
            Top = 0
            Width = 456
            Height = 566
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            ParentFont = False
            TabOrder = 0
            WordWrap = False
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Request'
          ImageIndex = 1
          object MemoTx: TMemo
            Left = 0
            Top = 0
            Width = 456
            Height = 566
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            ParentFont = False
            TabOrder = 0
            WordWrap = False
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Response'
          ImageIndex = 2
          object MemoRx: TMemo
            Left = 0
            Top = 0
            Width = 456
            Height = 566
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            ParentFont = False
            TabOrder = 0
            WordWrap = False
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'KMI COMM'
      ImageIndex = 1
      object dpbLabel2: TdpbLabel
        Left = 52
        Top = 0
        Width = 32
        Height = 12
        Caption = 'ADDR'
      end
      object BtnSend: TSpeedButton
        Left = 408
        Top = 16
        Width = 89
        Height = 25
        Caption = 'SEND'
        OnClick = BtnSendClick
      end
      object dpbLabel3: TdpbLabel
        Left = 4
        Top = 0
        Width = 32
        Height = 12
        Caption = 'HEAD'
      end
      object dpbLabel4: TdpbLabel
        Left = 364
        Top = 0
        Width = 24
        Height = 12
        Caption = 'LEN'
      end
      object dpbLabel5: TdpbLabel
        Left = 588
        Top = 28
        Width = 17
        Height = 12
        Caption = 'CS'
      end
      object dpbLabel6: TdpbLabel
        Left = 100
        Top = 0
        Width = 65
        Height = 12
        Caption = 'COMMAND'
      end
      object dpbLabel7: TdpbLabel
        Left = 8
        Top = 52
        Width = 32
        Height = 12
        Caption = 'DATA'
      end
      object Memo: TMemo
        Left = 0
        Top = 242
        Width = 904
        Height = 351
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Edit_Addr: ZIniEdit
        Left = 48
        Top = 16
        Width = 41
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 1
        Text = '00'
        IniKey = 'ADDR'
        IniDataSource = INI
        MoveCursor = False
      end
      object Edit_Header: ZIniEdit
        Left = 0
        Top = 16
        Width = 41
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 2
        Text = '00'
        IniKey = 'HEADER'
        IniDataSource = INI
        MoveCursor = False
      end
      object Edit_Len: ZIniEdit
        Left = 360
        Top = 16
        Width = 41
        Height = 24
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 3
        Text = '00'
        MoveCursor = False
      end
      object Edit_Data: ZIniEdit
        Left = 48
        Top = 44
        Width = 521
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 4
        Text = '00'
        MoveCursor = False
      end
      object Edit_Cs: ZIniEdit
        Left = 572
        Top = 44
        Width = 41
        Height = 24
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 5
        Text = '00'
        MoveCursor = False
      end
      object ComboBox_Cmd: TComboBox
        Left = 96
        Top = 16
        Width = 257
        Height = 24
        DropDownCount = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 16
        ParentFont = False
        TabOrder = 6
        Items.Strings = (
          '01 : AAA'
          '02 : BBB')
      end
    end
  end
  object INI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'CONFIG.INI'
    IniSection = 'KMICOMM'
    Left = 48
    Top = 292
  end
  object Comm: TCommPortDriver
    OnReceiveData = CommReceiveData
    LPTMode = False
    Left = 100
    Top = 293
  end
  object ScieCalc: TScieCalc
    Left = 232
    Top = 296
  end
  object OpenDialog: TOpenDialog
    Left = 468
    Top = 8
  end
end
