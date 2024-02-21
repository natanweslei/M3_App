inherited FormModalVenda: TFormModalVenda
  Caption = 'FormModalVenda'
  OnShow = UniFormShow
  ExplicitWidth = 798
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  object groupDados: TUniGroupBox [1]
    Left = 16
    Top = 117
    Width = 761
    Height = 92
    Hint = ''
    Caption = ''
    TabOrder = 1
    object editValorVeiculo: TUniDBFormattedNumberEdit
      Left = 15
      Top = 23
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'valor_veiculo'
      DataSource = dsManutencao
      TabOrder = 1
      Color = clBtnFace
      MaxValue = 900000.000000000000000000
      SelectOnFocus = True
      FieldLabel = 'Valor Ve'#237'culo'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editTaxa: TUniDBFormattedNumberEdit
      Left = 15
      Top = 51
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'taxa_veiculo'
      DataSource = dsManutencao
      TabOrder = 5
      MaxValue = 100.000000000000000000
      SelectOnFocus = True
      FieldLabel = 'Taxa'
      FieldLabelAlign = laRight
      DecimalPrecision = 5
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editQuantidadeParcelas: TUniDBFormattedNumberEdit
      Left = 191
      Top = 51
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'quantidade_parcelas_veiculo'
      DataSource = dsManutencao
      TabOrder = 6
      MaxValue = 360.000000000000000000
      SelectOnFocus = True
      FieldLabel = 'Parcelas'
      FieldLabelAlign = laRight
      DecimalPrecision = 0
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editValorParcela: TUniDBFormattedNumberEdit
      Left = 370
      Top = 51
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'valor_parcela'
      DataSource = dsManutencao
      TabOrder = 7
      ReadOnly = True
      SelectOnFocus = True
      FieldLabel = 'Valor Parcela'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
    end
    object editValorEntrada: TUniDBFormattedNumberEdit
      Left = 191
      Top = 23
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'valor_entrada'
      DataSource = dsManutencao
      TabOrder = 2
      MaxValue = 900000.000000000000000000
      SelectOnFocus = True
      FieldLabel = 'Valor Entrada'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editValorFinanciado: TUniDBFormattedNumberEdit
      Left = 370
      Top = 23
      Width = 170
      Height = 22
      Hint = ''
      DataField = 'valor_financiado'
      DataSource = dsManutencao
      TabOrder = 3
      ReadOnly = True
      MaxValue = 900000.000000000000000000
      SelectOnFocus = True
      FieldLabel = 'Valor Financiado'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnChangeValue = editValorEntradaChangeValue
    end
    object editPrimeiraParcela: TUniDBDateTimePicker
      Left = 546
      Top = 23
      Width = 205
      Hint = ''
      DataField = 'primeira_parcela'
      DataSource = dsManutencao
      DateTime = 45341.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
      FieldLabel = 'Primeira Parcela'
      FieldLabelAlign = laRight
      OnChange = editPrimeiraParcelaChange
    end
  end
  object groupVenda: TUniGroupBox [2]
    Left = 16
    Top = 10
    Width = 761
    Height = 95
    Hint = ''
    Caption = ''
    TabOrder = 2
    object editDataVenda: TUniDBDateTimePicker
      Left = 504
      Top = 23
      Width = 244
      Hint = ''
      DataField = 'data_venda'
      DataSource = dsManutencao
      DateTime = 45328.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
      FieldLabel = 'Data da Venda'
      FieldLabelAlign = laRight
    end
    object comboPessoa: TUniDBLookupComboBox
      Left = 15
      Top = 23
      Width = 465
      Hint = ''
      ListField = 'pessoa_id;nome'
      ListSource = UniMainModule.dsCadastroPessoa
      KeyField = 'pessoa_id'
      ListFieldIndex = 0
      DataField = 'pessoa_id'
      DataSource = dsManutencao
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Cliente'
      FieldLabelAlign = laRight
      ForceSelection = True
    end
    object comboVeiculo: TUniDBLookupComboBox
      Left = 15
      Top = 52
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
  object memoObservacaoVenda: TUniDBMemo [3]
    Left = 16
    Top = 430
    Width = 761
    Height = 73
    Hint = ''
    DataField = 'observacao_venda'
    DataSource = dsManutencao
    TabOrder = 3
    FieldLabel = 'Observa'#231#227'o da Venda'
    FieldLabelAlign = laTop
  end
  object gridContasReceber: TUniDBGrid [4]
    Left = 16
    Top = 217
    Width = 761
    Height = 194
    Hint = ''
    DataSource = dsContasReceber
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    TabOrder = 4
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    OnNewRecord = queryManutencaoNewRecord
  end
  object dsContasReceber: TDataSource
    AutoEdit = False
    DataSet = cdParcelas
    Left = 720
    Top = 448
  end
  object queryContasReceber: TFDQuery
    ConstraintsEnabled = True
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      '')
    Left = 720
    Top = 392
  end
  object cdParcelas: TClientDataSet
    PersistDataPacket.Data = {
      7D0000009619E0BD0100000018000000040000000000030000007D000F646174
      615F76656E63696D656E746F0400060000000000137175616E7469646164655F
      70617263656C617304000100000000000E6E756D65726F5F70617263656C6104
      000100000000000F76616C6F725F646F63756D656E746F080004000000000000
      00}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 456
    object cdParcelasdata_vencimento: TDateField
      DisplayLabel = 'Data do Vencimento'
      DisplayWidth = 22
      FieldName = 'data_vencimento'
    end
    object cdParcelasquantidade_parcelas: TIntegerField
      DisplayLabel = 'Total de Parcelas'
      DisplayWidth = 22
      FieldName = 'quantidade_parcelas'
    end
    object cdParcelasnumero_parcela: TIntegerField
      DisplayLabel = 'N'#250'mero da Parcela'
      DisplayWidth = 25
      FieldName = 'numero_parcela'
    end
    object cdParcelasvalor_documento: TFloatField
      DisplayLabel = 'Valor do Documento'
      DisplayWidth = 21
      FieldName = 'valor_documento'
    end
  end
end
