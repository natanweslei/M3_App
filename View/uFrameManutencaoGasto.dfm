object FrameManutencaoGasto: TFrameManutencaoGasto
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
    object buttonGastosVeiculo: TUniButton
      AlignWithMargins = True
      Left = 8
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Gastos'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 2
      OnClick = buttonGastosVeiculoClick
    end
  end
  object panelFiltro: TUniPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 73
    Hint = ''
    Align = alTop
    TabOrder = 1
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
      FieldLabel = 'Respons'#225'vel'
      FieldLabelWidth = 70
      FieldLabelAlign = laRight
      ForceSelection = True
      OnChange = comboPessoaChange
    end
  end
  object gridGasto: TUniDBGrid
    Left = 0
    Top = 73
    Width = 980
    Height = 554
    Hint = ''
    DataSource = dsGasto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    Columns = <
      item
        FieldName = 'gasto_id'
        Title.Caption = 'Gasto'
        Width = 58
        Sortable = True
      end
      item
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o do Gasto'
        Width = 117
        Sortable = True
      end
      item
        FieldName = 'tipogasto'
        Title.Caption = 'Tipo de Gasto'
        Width = 145
        Sortable = True
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
        FieldName = 'responsavel'
        Title.Caption = ' Respons'#225'vel'
        Width = 226
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'data_gasto'
        Title.Caption = ' Data do Gasto'
        Width = 107
        Sortable = True
      end
      item
        FieldName = 'valor_gasto'
        Title.Caption = 'Valor Gasto'
        Width = 120
        Sortable = True
      end>
  end
  object dsGasto: TDataSource
    DataSet = queryGasto
    Left = 564
    Top = 433
  end
  object queryGasto: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 564
    Top = 361
  end
end
