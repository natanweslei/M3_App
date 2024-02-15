object FrameManutencaoContasReceber: TFrameManutencaoContasReceber
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
    object buttonCadastroVeiculo: TUniButton
      AlignWithMargins = True
      Left = 12
      Top = 3
      Width = 141
      Height = 35
      Hint = ''
      Caption = 'Contas a Receber'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 3
      OnClick = buttonCadastroVeiculoClick
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
  end
  object gridGasto: TUniDBGrid
    Left = 0
    Top = 128
    Width = 980
    Height = 499
    Hint = ''
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    Columns = <
      item
        FieldName = 'financeiro_id'
        Title.Caption = 'Financeiro'
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
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 226
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'data_lancamento'
        Title.Caption = ' Data Lan'#231'amento'
        Width = 107
        Sortable = True
      end
      item
        FieldName = 'valor_documento'
        Title.Caption = 'Valor Documento'
        Width = 120
        Sortable = True
      end>
  end
  object queryContasReceber: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 872
    Top = 344
  end
  object dsContasReceber: TDataSource
    Left = 872
    Top = 424
  end
end
