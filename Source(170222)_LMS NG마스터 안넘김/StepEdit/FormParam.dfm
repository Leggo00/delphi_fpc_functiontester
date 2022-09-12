object FrmParam: TFrmParam
  Left = 887
  Top = 489
  BorderStyle = bsDialog
  Caption = 'Parameter '#49444#51221
  ClientHeight = 356
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    307
    356)
  PixelsPerInch = 96
  TextHeight = 12
  object dpbLabel1: TdpbLabel
    Left = 13
    Top = 12
    Width = 48
    Height = 12
    Alignment = taRightJustify
    Caption = #51088#50896#51060#47492
  end
  object BitBtn1: TBitBtn
    Left = 129
    Top = 313
    Width = 83
    Height = 32
    Anchors = [akRight]
    Caption = #54869#51064
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 313
    Width = 83
    Height = 32
    Anchors = [akRight]
    Caption = #52712#49548
    TabOrder = 1
    Kind = bkCancel
  end
  object pageParam: TPageControl
    Left = 9
    Top = 35
    Width = 289
    Height = 276
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet3: TTabSheet
      Caption = 'POWER SUPPLY'
      ImageIndex = 2
      object dpbLabel5: TdpbLabel
        Left = 12
        Top = 21
        Width = 72
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #9679' '#54805'      '#49885
      end
      object dpbLabel10: TdpbLabel
        Left = 12
        Top = 48
        Width = 72
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #9679' '#51204' '#47448' (A)'
      end
      object cmbPowerSupplyType: ZIniComboBox
        Left = 91
        Top = 17
        Width = 145
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        Items.Strings = (
          'CP-323'
          'SORENSEN'
          'EP-305')
        SaveItems = False
      end
      object edtPowerSupplyCurrent: ZIniRealSpinEdit
        Left = 91
        Top = 44
        Width = 145
        Height = 21
        Increment = 1.000000000000000000
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'POWER METER'
      ImageIndex = 1
      DesignSize = (
        281
        249)
      object dpbLabel4: TdpbLabel
        Left = 12
        Top = 21
        Width = 72
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #9679' '#54805'      '#49885
      end
      object cmbPowerMeterType: ZIniComboBox
        Left = 91
        Top = 17
        Width = 145
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        OnChange = cmbPowerMeterTypeChange
        Items.Strings = (
          'WT230'
          'WT3000 MAIN'
          'WT3000 HSG')
        SaveItems = False
      end
      object pagePowerMeter: TPageControl
        Left = 6
        Top = 44
        Width = 264
        Height = 199
        ActivePage = TabSheet22
        Anchors = [akLeft, akTop, akRight, akBottom]
        MultiLine = True
        TabOrder = 1
        TabPosition = tpBottom
        object TabSheet8: TTabSheet
          Caption = 'READ'
          ImageIndex = 1
          object Label2: TLabel
            Left = 9
            Top = 9
            Width = 64
            Height = 12
            Caption = #9679' '#52769#51221#54637#47785
          end
          object Label5: TLabel
            Left = 9
            Top = 33
            Width = 64
            Height = 12
            Caption = #9679' '#54952#50984#51064#49688
          end
          object Label8: TLabel
            Left = 9
            Top = 57
            Width = 64
            Height = 12
            Caption = #9679' '#50741#49483' (%)'
          end
          object cmbPowerMeterItems: ZIniComboBox
            Left = 80
            Top = 5
            Width = 145
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ItemIndex = 0
            TabOrder = 0
            Text = 'V1'
            Items.Strings = (
              'V1'
              'V2'
              'V3'
              'C1'
              'C2'
              'C3'
              'W1'
              'W2'
              'W3')
            SaveItems = False
          end
          object cmbPowerMeterIndex: ZIniComboBox
            Left = 80
            Top = 31
            Width = 145
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ItemIndex = 0
            TabOrder = 1
            Text = '1'
            Items.Strings = (
              '1'
              '2'
              '3')
            SaveItems = False
          end
          object cmbPowerMeterOffset: ZIniRealSpinEdit
            Left = 80
            Top = 53
            Width = 145
            Height = 21
            Increment = 1.000000000000000000
            TabOrder = 2
          end
        end
        object TabSheet22: TTabSheet
          Caption = 'SEND'
          ImageIndex = 1
          object Label9: TLabel
            Left = 9
            Top = 9
            Width = 64
            Height = 12
            Caption = #9679' '#52769#51221#54637#47785
          end
          object cmbPowerMeteSendMode: ZIniComboBox
            Left = 80
            Top = 5
            Width = 145
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 0
            Items.Strings = (
              #52769#51221
              #51204#50517#48276#50948'-1'
              #51204#50517#48276#50948'-2,3,4'
              #51204#47448#48276#50948'-1'
              #51204#47448#48276#50948'-2,3,4')
            SaveItems = False
          end
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = #51200#54637' '#53580#51060#48660' '#52280#51312
      ImageIndex = 5
      object dpbLabel14: TdpbLabel
        Left = 12
        Top = 48
        Width = 72
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #9679' '#53580#51060#48660#47749
      end
      object dpbLabel12: TdpbLabel
        Left = 12
        Top = 21
        Width = 72
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #9679' '#52280#51312#47784#45944
      end
      object cmbRoModel: ZIniComboBox
        Left = 91
        Top = 17
        Width = 145
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 0
        TabOrder = 0
        OnSelect = cmbRoModelSelect
        SaveItems = False
      end
      object cmbRoTable: ZIniComboBox
        Left = 91
        Top = 44
        Width = 145
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 0
        TabOrder = 1
        SaveItems = False
      end
    end
  end
  object edtResName: ZIniEdit
    Left = 64
    Top = 7
    Width = 232
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 3
    MoveCursor = False
  end
end
