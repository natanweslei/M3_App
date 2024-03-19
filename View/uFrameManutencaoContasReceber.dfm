object FrameManutencaoContasReceber: TFrameManutencaoContasReceber
  Left = 0
  Top = 0
  Width = 980
  Height = 672
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object panelBotoes: TUniPanel
    Left = 0
    Top = 627
    Width = 980
    Height = 45
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object buttonContaReceber: TUniButton
      AlignWithMargins = True
      Left = 12
      Top = 6
      Width = 141
      Height = 32
      Hint = ''
      Caption = 'Contas a Receber'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 3
      OnClick = buttonContaReceberClick
    end
    object buttonStatusFinanceiro: TUniButton
      Left = 184
      Top = 6
      Width = 161
      Height = 32
      Hint = ''
      Caption = 'Alterar Status Financeiro'
      TabOrder = 2
      Images = UniMainModule.ImageListMain
      ImageIndex = 16
      OnClick = buttonStatusFinanceiroClick
    end
  end
  object panelFiltro: TUniPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 128
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    object comboPessoa: TUniDBLookupComboBox
      Left = 15
      Top = 51
      Width = 346
      Hint = ''
      ListField = 'pessoa_id;nome'
      ListSource = UniMainModule.dsCadastroPessoa
      KeyField = 'pessoa_id'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'pessoa_id'
      TabOrder = 0
      Color = clWindow
      FieldLabel = 'Cliente'
      FieldLabelWidth = 60
      FieldLabelAlign = laRight
      ForceSelection = True
      OnChange = comboPessoaChange
    end
    object comboVeiculo: TUniDBLookupComboBox
      Left = 15
      Top = 16
      Width = 346
      Hint = ''
      ListField = 'veiculo_id;modelo;marca'
      ListSource = UniMainModule.dsCadastroVeiculo
      KeyField = 'veiculo_id'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'veiculo_id'
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Ve'#237'culo'
      FieldLabelWidth = 60
      FieldLabelAlign = laRight
      OnChange = comboVeiculoChange
    end
    object groupData: TUniGroupBox
      Left = 367
      Top = 3
      Width = 314
      Height = 81
      Hint = ''
      Caption = 'Data Vencimento'
      TabOrder = 9
      object editDataFinal: TUniDateTimePicker
        Left = 82
        Top = 48
        Width = 166
        Hint = ''
        DateTime = 45343.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        FieldLabel = 'Data Final'
        FieldLabelWidth = 70
        FieldLabelAlign = laRight
        OnChange = editDataInicialChange
      end
      object editDataInicial: TUniDateTimePicker
        Left = 82
        Top = 13
        Width = 166
        Hint = ''
        DateTime = 45343.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
        FieldLabel = 'Data Inicial'
        FieldLabelWidth = 70
        FieldLabelAlign = laRight
        OnChange = editDataInicialChange
      end
      object radioIgual: TUniRadioButton
        Left = 8
        Top = 35
        Width = 45
        Height = 17
        Hint = ''
        Caption = 'Igual'
        TabOrder = 3
        OnClick = radioIgualClick
      end
      object radioEntre: TUniRadioButton
        Left = 8
        Top = 56
        Width = 48
        Height = 17
        Hint = ''
        Caption = 'Entre'
        TabOrder = 4
        OnClick = radioIgualClick
      end
      object radioNaoFiltrar: TUniRadioButton
        Left = 8
        Top = 15
        Width = 67
        Height = 17
        Hint = ''
        Caption = 'N'#227'o filtrar'
        TabOrder = 5
        OnClick = radioIgualClick
      end
    end
    object checkAberto: TUniCheckBox
      Left = 107
      Top = 96
      Width = 57
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Aberto'
      TabOrder = 2
      OnChange = checkAbertoChange
    end
    object checkVencido: TUniCheckBox
      Left = 240
      Top = 96
      Width = 64
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Vencido'
      TabOrder = 3
      OnChange = checkAbertoChange
    end
    object checkPago: TUniCheckBox
      Left = 376
      Top = 96
      Width = 65
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Pago'
      TabOrder = 4
      OnChange = checkAbertoChange
    end
    object panelStatusPago: TUniSimplePanel
      Left = 344
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clGreen
      TabOrder = 5
    end
    object panelStatusAberto: TUniSimplePanel
      Left = 75
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clBlue
      TabOrder = 6
    end
    object panelStatusVencido: TUniSimplePanel
      Left = 208
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clRed
      TabOrder = 7
    end
  end
  object gridContaReceber: TUniDBGrid
    Left = 0
    Top = 128
    Width = 980
    Height = 499
    Hint = ''
    DataSource = dsContasReceber
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    OnDrawColumnCell = gridContaReceberDrawColumnCell
    Columns = <
      item
        FieldName = 'financeiro_id'
        Title.Caption = 'Financeiro'
        Width = 71
        Sortable = True
      end
      item
        FieldName = 'status_financeiro'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Width = 92
        Font.Height = -13
        Font.Style = [fsBold]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 145
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 124
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'data_vencimento'
        Title.Caption = 'Data Vencimento'
        Width = 98
        Sortable = True
      end
      item
        FieldName = 'valor_documento'
        Title.Caption = 'Valor Documento'
        Width = 103
        Font.Height = -13
        Sortable = True
      end
      item
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o do Gasto'
        Width = 124
        Sortable = True
      end
      item
        FieldName = 'data_lancamento'
        Title.Caption = ' Data Lan'#231'amento'
        Width = 105
        Sortable = True
      end
      item
        FieldName = 'quantidade_parcelas'
        Title.Caption = 'Total Parcelas'
        Width = 75
        Sortable = True
      end
      item
        FieldName = 'numero_parcela'
        Title.Caption = 'Parcela'
        Width = 52
        Sortable = True
      end>
  end
  object queryContasReceber: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 872
    Top = 344
  end
  object dsContasReceber: TDataSource
    DataSet = queryContasReceber
    Left = 872
    Top = 424
  end
end
