inherited FormModalContasReceber: TFormModalContasReceber
  Caption = 'Contas a Receber'
  OnShow = UniFormShow
  ExplicitWidth = 805
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    inherited buttonExcluir: TUniButton
      OnClick = nil
    end
    inherited buttonFechar: TUniButton
      Left = 704
      ExplicitLeft = 704
    end
  end
  object scrollContasReceber: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 799
    Height = 513
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 798
    ExplicitHeight = 512
    ScrollHeight = 256
    ScrollWidth = 778
    object groupDados: TUniGroupBox
      Left = 11
      Top = 20
      Width = 439
      Height = 125
      Hint = ''
      Caption = ''
      TabOrder = 0
      object comboCliente: TUniDBLookupComboBox
        Left = 10
        Top = 25
        Width = 402
        Hint = ''
        ListField = 'pessoa_id;nome'
        ListSource = UniMainModule.dsCadastroPessoa
        KeyField = 'pessoa_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'pessoa_id'
        DataSource = dsManutencao
        TabOrder = 1
        Color = clWindow
        FieldLabel = 'Cliente'
        FieldLabelAlign = laRight
        ForceSelection = True
      end
      object comboVeiculo: TUniDBLookupComboBox
        Left = 10
        Top = 54
        Width = 402
        Hint = ''
        ListField = 'veiculo_id;modelo;marca'
        ListSource = UniMainModule.dsCadastroVeiculo
        KeyField = 'veiculo_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'veiculo_id'
        DataSource = dsManutencao
        TabOrder = 2
        Color = clWindow
        FieldLabel = 'Ve'#237'culo'
        FieldLabelAlign = laRight
      end
      object comboEmpresa: TUniDBLookupComboBox
        Left = 10
        Top = 82
        Width = 402
        Hint = ''
        ListField = 'empresa_id;nome_fantasia'
        ListSource = UniMainModule.dsCadastroEmpresa
        KeyField = 'empresa_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'empresa_id'
        DataSource = dsManutencao
        TabOrder = 3
        Color = clWindow
        FieldLabel = 'Empresa'
        FieldLabelAlign = laRight
      end
    end
    object groupDados3: TUniGroupBox
      Left = 11
      Top = 151
      Width = 439
      Height = 105
      Hint = ''
      Caption = ''
      TabOrder = 1
      object editDescricao: TUniDBEdit
        Left = 10
        Top = 66
        Width = 402
        Height = 22
        Hint = ''
        DataField = 'descricao'
        DataSource = dsManutencao
        TabOrder = 1
        ClearButton = True
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laRight
      end
      object comboTipoGasto: TUniDBLookupComboBox
        Left = 10
        Top = 37
        Width = 402
        Hint = ''
        ListField = 'tipogasto_id;descricao'
        ListSource = UniMainModule.dsCadastroTipoGasto
        KeyField = 'tipogasto_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'tipogasto_id'
        DataSource = dsManutencao
        TabOrder = 2
        Color = clWindow
        FieldLabel = 'Tipo de Gasto'
        FieldLabelAlign = laRight
      end
    end
    object groupDados2: TUniGroupBox
      Left = 456
      Top = 20
      Width = 322
      Height = 125
      Hint = ''
      Caption = ''
      TabOrder = 2
      object editValorDocumento: TUniDBFormattedNumberEdit
        Left = 49
        Top = 67
        Width = 244
        Height = 22
        Hint = ''
        DataField = 'valor_documento'
        DataSource = dsManutencao
        TabOrder = 2
        MaxValue = 900000.000000000000000000
        MinValue = 1.000000000000000000
        FieldLabel = 'Valor Documento'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object editDataVencimento: TUniDBDateTimePicker
        Left = 49
        Top = 38
        Width = 244
        Hint = ''
        DataField = 'data_vencimento'
        DataSource = dsManutencao
        DateTime = 45328.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        FieldLabel = 'Data do Vencimento'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
    end
  end
  inherited queryManutencao: TFDQuery
    OnNewRecord = queryManutencaoNewRecord
    Top = 200
  end
end
