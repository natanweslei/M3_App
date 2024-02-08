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
    object buttonVendaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 228
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Venda'
      TabOrder = 1
      Images = ImageListManutencaoVeiculo
      OnClick = buttonVendaVeiculoClick
    end
    object buttonGastosVeiculo: TUniButton
      AlignWithMargins = True
      Left = 334
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Gastos'
      TabOrder = 2
      Images = ImageListManutencaoVeiculo
      OnClick = buttonGastosVeiculoClick
    end
    object buttonEntradaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 122
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Entrada'
      TabOrder = 3
      Images = ImageListManutencaoVeiculo
      OnClick = buttonEntradaVeiculoClick
    end
    object buttonCadastroVeiculo: TUniButton
      AlignWithMargins = True
      Left = 16
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Ve'#237'culo'
      TabOrder = 4
      Images = ImageListManutencaoVeiculo
      ImageIndex = 0
      OnClick = buttonCadastroVeiculoClick
    end
  end
  object PageControlVeiculo: TUniPageControl
    Left = 0
    Top = 0
    Width = 980
    Height = 627
    Hint = ''
    ActivePage = tsVeiculo
    Align = alClient
    TabOrder = 1
    ExplicitTop = 89
    ExplicitHeight = 538
    object tsVeiculo: TUniTabSheet
      Hint = ''
      Caption = 'Ve'#237'culo'
      ExplicitHeight = 510
      object gridVeiculo: TUniDBGrid
        Left = 0
        Top = 128
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
      object panelFiltro: TUniPanel
        Left = 0
        Top = 0
        Width = 972
        Height = 128
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 96
        ExplicitTop = 40
        ExplicitWidth = 256
      end
    end
    object tsEntrada: TUniTabSheet
      Hint = ''
      Caption = 'Entrada'
      ExplicitHeight = 510
      object gridEntrada: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 599
        Hint = ''
        DataSource = dsEntrada
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
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
    end
    object tsVenda: TUniTabSheet
      Hint = ''
      Caption = 'Venda'
      ExplicitHeight = 510
      object gridVenda: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 599
        Hint = ''
        DataSource = dsVenda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
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
    end
    object tsGastos: TUniTabSheet
      Hint = ''
      Caption = 'Gastos'
      ExplicitHeight = 510
      object gridGasto: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 599
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
    object tsFinanceiro: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro'
      ExplicitHeight = 510
      object PageControlFinanceiro: TUniPageControl
        Left = 0
        Top = 0
        Width = 972
        Height = 599
        Hint = ''
        ActivePage = UniTabSheet2
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 510
        object tsContasPagar: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Pagar'
          ExplicitHeight = 482
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Receber'
          ExplicitHeight = 482
        end
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
  object ImageListManutencaoVeiculo: TUniNativeImageList
    Left = 888
    Top = 488
    Images = {
      050000000000000006080000006361723B66615F3B00000000060F0000004E65
      7749636F6E436C733B66615F3B00000000060F0000004E657749636F6E436C73
      3B66615F3B00000000060F0000004E657749636F6E436C733B66615F3B000000
      00060F0000004E657749636F6E436C733B66615F3B}
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
