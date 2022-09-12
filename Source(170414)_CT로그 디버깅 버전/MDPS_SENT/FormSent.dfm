object FrmSent: TFrmSent
  Left = 613
  Top = 157
  BorderStyle = bsDialog
  Caption = 'KSENT Simulator'
  ClientHeight = 543
  ClientWidth = 542
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 128
    Top = 208
    Width = 21
    Height = 12
    Caption = 'Len'
  end
  object Label2: TLabel
    Left = 184
    Top = 208
    Width = 26
    Height = 12
    Caption = 'CRC'
  end
  object Label3: TLabel
    Left = 248
    Top = 208
    Width = 29
    Height = 12
    Caption = 'TUnit'
  end
  object Label4: TLabel
    Left = 304
    Top = 208
    Width = 52
    Height = 12
    Caption = 'DiagCom'
  end
  object Label5: TLabel
    Left = 368
    Top = 208
    Width = 56
    Height = 12
    Caption = 'SpecCom'
  end
  object Label6: TLabel
    Left = 128
    Top = 124
    Width = 17
    Height = 12
    Caption = 'CH'
  end
  object Label7: TLabel
    Left = 184
    Top = 124
    Width = 36
    Height = 12
    Caption = 'Cyclic'
  end
  object Label8: TLabel
    Left = 248
    Top = 124
    Width = 32
    Height = 12
    Caption = 'DATA'
  end
  object Label9: TLabel
    Left = 304
    Top = 272
    Width = 53
    Height = 12
    Caption = 'SyncLow'
  end
  object Label10: TLabel
    Left = 416
    Top = 272
    Width = 54
    Height = 12
    Caption = 'SyncHigh'
  end
  object Label11: TLabel
    Left = 128
    Top = 319
    Width = 17
    Height = 12
    Caption = 'CH'
  end
  object Label12: TLabel
    Left = 184
    Top = 319
    Width = 22
    Height = 12
    Caption = 'Typ'
  end
  object Label13: TLabel
    Left = 240
    Top = 319
    Width = 21
    Height = 12
    Caption = 'Len'
  end
  object Label14: TLabel
    Left = 240
    Top = 360
    Width = 29
    Height = 12
    Caption = 'Sync'
  end
  object Label15: TLabel
    Left = 304
    Top = 360
    Width = 37
    Height = 12
    Caption = 'TStmp'
  end
  object Label16: TLabel
    Left = 456
    Top = 124
    Width = 26
    Height = 12
    Caption = 'CRC'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 41
    Align = alTop
    Caption = 'KSENT SIMULATION'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Narkisim'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EdtListDevice: TEdit
    Left = 111
    Top = 49
    Width = 146
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object CmdOpen: TComboBox
    Left = 112
    Top = 78
    Width = 145
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 12
    TabOrder = 2
  end
  object BtnListDevice: TButton
    Left = 16
    Top = 46
    Width = 75
    Height = 25
    Caption = 'ListDevices'
    TabOrder = 3
    OnClick = BtnListDeviceClick
  end
  object BtnOpen: TButton
    Left = 16
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = BtnOpenClick
  end
  object BtnClose: TButton
    Left = 16
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = BtnCloseClick
  end
  object BtnRxInit: TButton
    Left = 16
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Rx Init'
    TabOrder = 6
  end
  object BtnTxInit: TButton
    Left = 16
    Top = 249
    Width = 75
    Height = 25
    Caption = 'Tx Init'
    TabOrder = 7
    OnClick = BtnTxInitClick
  end
  object BtnTx: TButton
    Left = 16
    Top = 140
    Width = 75
    Height = 25
    Caption = 'TX1'
    TabOrder = 8
    OnClick = BtnTxClick
  end
  object BtnRx: TButton
    Left = 16
    Top = 336
    Width = 75
    Height = 25
    Caption = 'RX'
    TabOrder = 9
  end
  object Edit17: TEdit
    Left = 112
    Top = 336
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 10
  end
  object Edit18: TEdit
    Left = 176
    Top = 336
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 11
  end
  object Edit19: TEdit
    Left = 232
    Top = 336
    Width = 49
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 12
  end
  object Edit20: TEdit
    Left = 232
    Top = 376
    Width = 49
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 13
  end
  object Edit21: TEdit
    Left = 296
    Top = 376
    Width = 153
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 14
  end
  object Edit22: TEdit
    Left = 288
    Top = 336
    Width = 230
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 15
  end
  object EdtRxLen: ZIniEdit
    Left = 112
    Top = 224
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 16
    IniKey = 'EdtRxLen'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtRxCRC: ZIniEdit
    Left = 176
    Top = 224
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 17
    IniKey = 'EdtRxCRC'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtRxTunit: ZIniEdit
    Left = 240
    Top = 224
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 18
    IniKey = 'EdtRxTunit'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtRxDiag: ZIniEdit
    Left = 304
    Top = 224
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 19
    IniKey = 'EdtRxDiag'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtRxSpec: ZIniEdit
    Left = 368
    Top = 224
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 20
    IniKey = 'EdtRxSpec'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxLen: ZIniEdit
    Left = 112
    Top = 248
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 21
    IniKey = 'EdtTxLen'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxCRC: ZIniEdit
    Left = 176
    Top = 248
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 22
    IniKey = 'EdtTxCRC'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxTunit: ZIniEdit
    Left = 240
    Top = 248
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 23
    IniKey = 'EdtTxTunit'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxDiag: ZIniEdit
    Left = 304
    Top = 248
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 24
    IniKey = 'EdtTxDiag'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxSpec: ZIniEdit
    Left = 368
    Top = 248
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 25
    IniKey = 'EdtTxSpec'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtSyncLow: ZIniEdit
    Left = 272
    Top = 289
    Width = 105
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 26
    IniKey = 'EdtSyncLow'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtSyncHigh: ZIniEdit
    Left = 384
    Top = 288
    Width = 105
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 27
    IniKey = 'EdtSyncHigh'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxCh1: ZIniEdit
    Left = 112
    Top = 140
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 28
    Text = '0'
    IniKey = 'EdtTxCh1'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxCyclic1: ZIniEdit
    Left = 176
    Top = 140
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 29
    Text = '12825'
    IniKey = 'EdtTxCyclic1'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTXData1: ZIniEdit
    Left = 240
    Top = 140
    Width = 201
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 30
    IniKey = 'EdtTXData1'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 408
    Width = 529
    Height = 129
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 31
  end
  object EdtTxCh2: ZIniEdit
    Left = 112
    Top = 164
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 32
    Text = '1'
    IniKey = 'EdtTxCh2'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTxCyclic2: ZIniEdit
    Left = 176
    Top = 164
    Width = 49
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 33
    Text = '12825'
    IniKey = 'EdtTxCyclic2'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtTXData2: ZIniEdit
    Left = 240
    Top = 164
    Width = 201
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 34
    IniKey = 'EdtTXData2'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object Button1: TButton
    Left = 16
    Top = 164
    Width = 75
    Height = 25
    Caption = 'TX2'
    TabOrder = 35
    OnClick = Button1Click
  end
  object EdtCRC1: ZIniEdit
    Left = 448
    Top = 140
    Width = 65
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 36
    IniKey = 'EdtCRC1'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object EdtCRC2: ZIniEdit
    Left = 448
    Top = 164
    Width = 65
    Height = 20
    Color = clBtnFace
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 37
    IniKey = 'EdtCRC2'
    IniDataSource = KsentINI
    MoveCursor = False
  end
  object KsentINI: ZIniData
    Enable = False
    IniFileDir = dirExefile
    IniFileName = 'Config.ini'
    IniSection = 'KSENT'
    Left = 496
    Top = 8
  end
end
