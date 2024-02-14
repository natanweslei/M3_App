object FrameManutencaoGasto: TFrameManutencaoGasto
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
