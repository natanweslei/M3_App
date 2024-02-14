object FrameManutencaoVenda: TFrameManutencaoVenda
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
    object buttonVendaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Venda'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 7
      OnClick = buttonVendaVeiculoClick
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
  object gridVenda: TUniDBGrid
    Left = 0
    Top = 128
    Width = 980
    Height = 499
    Hint = ''
    DataSource = dsVenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    Columns = <
      item
        FieldName = 'venda_id'
        Title.Caption = 'Venda'
        Width = 64
        Sortable = True
      end
      item
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
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
        FieldName = 'data_venda'
        Title.Caption = ' Data Venda'
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
  object dsVenda: TDataSource
    DataSet = queryVenda
    Left = 636
    Top = 433
  end
  object queryVenda: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 636
    Top = 361
  end
end
