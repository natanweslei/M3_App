inherited FormModalVenda: TFormModalVenda
  Caption = 'FormModalVenda'
  OnShow = UniFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    inherited buttonGravar: TUniButton
      Images = UniMainModule.ImageListMain
      ImageIndex = 10
      IconCls = 'reply'
    end
    inherited buttonExcluir: TUniButton
      OnClick = nil
    end
  end
  object scrollVenda: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 798
    Height = 512
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 104
    ExplicitWidth = 256
    ExplicitHeight = 256
    ScrollHeight = 297
    ScrollWidth = 777
    object groupDados: TUniGroupBox
      Left = 16
      Top = 128
      Width = 761
      Height = 65
      Hint = ''
      Caption = ''
      TabOrder = 0
      object editValorVeiculo: TUniDBFormattedNumberEdit
        Left = 15
        Top = 23
        Width = 244
        Height = 22
        Hint = ''
        DataField = 'valor_veiculo'
        DataSource = dsManutencao
        TabOrder = 1
        MaxValue = 900000.000000000000000000
        MinValue = 1.000000000000000000
        FieldLabel = 'Valor Ve'#237'culo'
        FieldLabelAlign = laRight
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object editTaxa: TUniDBFormattedNumberEdit
        Left = 267
        Top = 23
        Width = 152
        Height = 22
        Hint = ''
        DataField = 'taxa_veiculo'
        DataSource = dsManutencao
        TabOrder = 2
        MaxValue = 100.000000000000000000
        FieldLabel = 'Taxa'
        FieldLabelAlign = laRight
        DecimalPrecision = 5
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object editQuantidadeParcelas: TUniDBFormattedNumberEdit
        Left = 427
        Top = 23
        Width = 175
        Height = 22
        Hint = ''
        DataField = 'quantidade_parcelas_veiculo'
        DataSource = dsManutencao
        TabOrder = 3
        MaxValue = 360.000000000000000000
        MinValue = 1.000000000000000000
        FieldLabel = 'Parcelas'
        FieldLabelAlign = laRight
        DecimalPrecision = 0
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object groupVenda: TUniGroupBox
      Left = 16
      Top = 9
      Width = 761
      Height = 104
      Hint = ''
      Caption = ''
      TabOrder = 1
      object editDataVenda: TUniDBDateTimePicker
        Left = 504
        Top = 20
        Width = 244
        Hint = ''
        DataField = 'data_venda'
        DataSource = dsManutencao
        DateTime = 45328.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        FieldLabel = 'Data da Venda'
        FieldLabelAlign = laRight
      end
      object comboPessoa: TUniDBLookupComboBox
        Left = 15
        Top = 20
        Width = 465
        Hint = ''
        ListField = 'pessoa_id;nome'
        ListSource = UniMainModule.dsCadastroPessoa
        KeyField = 'pessoa_id'
        ListFieldIndex = 0
        DataField = 'pessoa_id'
        DataSource = dsManutencao
        TabOrder = 2
        Color = clWindow
        FieldLabel = 'Cliente'
        FieldLabelAlign = laRight
        ForceSelection = True
      end
      object comboVeiculo: TUniDBLookupComboBox
        Left = 15
        Top = 49
        Width = 465
        Hint = ''
        ListField = 'veiculo_id;modelo;marca'
        ListSource = UniMainModule.dsCadastroVeiculo
        KeyField = 'veiculo_id'
        ListFieldIndex = 0
        DataField = 'veiculo_id'
        DataSource = dsManutencao
        TabOrder = 3
        Color = clWindow
        FieldLabel = 'Ve'#237'culo'
        FieldLabelAlign = laRight
      end
    end
    object memoObservacaoVenda: TUniDBMemo
      Left = 16
      Top = 208
      Width = 761
      Height = 89
      Hint = ''
      DataField = 'observacao_venda'
      DataSource = dsManutencao
      TabOrder = 2
      FieldLabel = 'Observa'#231#227'o da Venda'
      FieldLabelAlign = laTop
    end
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    OnNewRecord = queryManutencaoNewRecord
  end
  inherited imageListFormModalModelo: TUniNativeImageList
    Images = {
      0600000000000000060800000066696C653B66613B0000000006070000006164
      643B66613B00000000060900000074726173683B66613B000000000607000000
      62616E3B66613B00000000060C0000007369676E2D6F75743B66613BFFFFFF1F
      043A01000089504E470D0A1A0A0000000D494844520000003000000030080600
      00005702F987000000097048597300000B1300000B1301009A9C18000000EC49
      444154789CED96B10AC2301445F33542DD9437F42F1CFD1DC1C5B5936FB5FE80
      9B14D445846EB18320D45DFFA0634444A81090DA2426F51EB87339DCFB688400
      00002F212ED52BD124D366B53B180BD5BE47F37216B6001B90302DD01BC66FF9
      28C02D25BC10E01612DE08F097125E0970A92010A18118136A44FD80FAD3AD76
      428BF5DEC84F2CCD72BB473C480AADC428D9B49648B35C8D9727BB023E444080
      D180C2849AD0A9232E6E9572CDF15A9913F8150401D63720CF172B71D640F002
      AE2008704727244317700541803B3A2119BA802B0802FC6CE0F1B4758D34F99C
      F621E2EF04000040B8E00E0124C169E0C196DB0000000049454E44AE426082}
  end
end
