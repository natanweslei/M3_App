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
    Top = 128
    Width = 980
    Height = 499
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
    Height = 128
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = ''
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
