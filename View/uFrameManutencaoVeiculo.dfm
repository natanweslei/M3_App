object FrameManutencaoVeiculo: TFrameManutencaoVeiculo
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
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Ve'#237'culo'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 3
      OnClick = buttonCadastroVeiculoClick
    end
    object buttonGastosVeiculo: TUniButton
      AlignWithMargins = True
      Left = 118
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Gastos'
      TabOrder = 2
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
  object PageControlVeiculo: TUniPageControl
    Left = 0
    Top = 128
    Width = 980
    Height = 499
    Hint = ''
    ActivePage = tsContasReceber
    Align = alClient
    TabOrder = 2
    object tsVeiculo: TUniTabSheet
      Hint = ''
      Caption = 'Ve'#237'culo'
      object gridVeiculo: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 471
        Hint = ''
        DataSource = dsVeiculo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'veiculo_id'
            Title.Caption = 'Ve'#237'culo'
            Width = 64
            Sortable = True
          end
          item
            FieldName = 'marca'
            Title.Caption = 'Marca'
            Width = 101
            Sortable = True
          end
          item
            FieldName = 'modelo'
            Title.Caption = 'Modelo'
            Width = 155
            Sortable = True
          end
          item
            FieldName = 'placa'
            Title.Caption = 'Placa'
            Width = 73
            Sortable = True
          end
          item
            FieldName = 'ano_fabricacao'
            Title.Caption = 'Ano Fabrica'#231#227'o'
            Width = 97
            Sortable = True
          end
          item
            FieldName = 'ano_modelo'
            Title.Caption = 'Ano Modelo'
            Width = 96
            Sortable = True
          end>
      end
    end
    object tsGasto: TUniTabSheet
      Hint = ''
      Caption = 'Gastos'
      object gridGasto: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 471
        Hint = ''
        DataSource = dsGasto
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
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
    end
    object tsContasReceber: TUniTabSheet
      Hint = ''
      Caption = 'Contas a Receber'
      object gridContaReceber: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 471
        Hint = ''
        DataSource = dsContasReceber
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
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
    end
  end
  object queryVeiculo: TFDQuery
    AfterScroll = queryVeiculoAfterScroll
    Connection = UniMainModule.Conexao
    Left = 872
    Top = 344
  end
  object dsVeiculo: TDataSource
    DataSet = queryVeiculo
    Left = 872
    Top = 424
  end
  object queryGasto: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 748
    Top = 361
  end
  object dsGasto: TDataSource
    DataSet = queryGasto
    Left = 748
    Top = 433
  end
  object dsContasReceber: TDataSource
    DataSet = queryContasReceber
    Left = 640
    Top = 432
  end
  object queryContasReceber: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 640
    Top = 352
  end
end
