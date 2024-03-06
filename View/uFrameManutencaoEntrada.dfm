object FrameManutencaoEntrada: TFrameManutencaoEntrada
  Left = 0
  Top = 0
  Width = 980
  Height = 672
  OnCreate = UniFrameCreate
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
    object buttonEntradaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Entrada'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 5
      OnClick = buttonEntradaVeiculoClick
    end
  end
  object gridEntrada: TUniDBGrid
    Left = 0
    Top = 73
    Width = 980
    Height = 554
    Hint = ''
    DataSource = dsEntrada
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        FieldName = 'entrada_id'
        Title.Caption = 'Entrada'
        Width = 64
        Sortable = True
      end
      item
        FieldName = 'fornecedor'
        Title.Caption = 'Fornecedor'
        Width = 108
        DisplayMemo = True
      end
      item
        FieldName = 'veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 242
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'data_entrada'
        Title.Caption = ' Data Entrada'
        Width = 105
        Sortable = True
      end
      item
        FieldName = 'valor_veiculo'
        Title.Caption = 'Valor Ve'#237'culo'
        Width = 112
        Sortable = True
      end>
  end
  object panelFiltro: TUniPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 73
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = ''
    object comboVeiculo: TUniDBLookupComboBox
      Left = 15
      Top = 24
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
    object comboPessoa: TUniDBLookupComboBox
      Left = 375
      Top = 24
      Width = 346
      Hint = ''
      ListField = 'pessoa_id;nome'
      ListSource = UniMainModule.dsCadastroPessoa
      KeyField = 'pessoa_id'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'pessoa_id'
      TabOrder = 2
      Color = clWindow
      FieldLabel = 'Fornecedor'
      FieldLabelWidth = 70
      FieldLabelAlign = laRight
      ForceSelection = True
      OnChange = comboPessoaChange
    end
  end
  object dsEntrada: TDataSource
    DataSet = queryEntrada
    Left = 716
    Top = 433
  end
  object queryEntrada: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 716
    Top = 361
  end
end
