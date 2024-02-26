inherited FormModalEntrada: TFormModalEntrada
  Caption = 'FormModalEntrada'
  OnShow = UniFormShow
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    inherited buttonExcluir: TUniButton
      OnClick = nil
    end
  end
  object scrollEntrada: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 792
    Height = 483
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 104
    ExplicitWidth = 256
    ExplicitHeight = 256
    ScrollHeight = 313
    ScrollWidth = 777
    object groupDados: TUniGroupBox
      Left = 16
      Top = 131
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
    object groupEntrada: TUniGroupBox
      Left = 16
      Top = 9
      Width = 761
      Height = 112
      Hint = ''
      Caption = ''
      TabOrder = 1
      object editDataEntrada: TUniDBDateTimePicker
        Left = 504
        Top = 20
        Width = 244
        Hint = ''
        DataField = 'data_entrada'
        DataSource = dsManutencao
        DateTime = 45328.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        FieldLabel = 'Data da Entrada'
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
        FieldLabel = 'Fornecedor'
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
    object memoObservacaoEntrada: TUniDBMemo
      Left = 16
      Top = 224
      Width = 761
      Height = 89
      Hint = ''
      DataField = 'observacao_entrada'
      DataSource = dsManutencao
      TabOrder = 2
      FieldLabel = 'Observa'#231#227'o da Entrada'
      FieldLabelAlign = laTop
    end
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    OnNewRecord = queryManutencaoNewRecord
  end
end
