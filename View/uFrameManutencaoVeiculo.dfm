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
  object panel: TUniPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 89
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
  end
  object PageControlVeiculo: TUniPageControl
    Left = 0
    Top = 89
    Width = 980
    Height = 538
    Hint = ''
    ActivePage = tsVeiculo
    Align = alClient
    TabOrder = 2
    ExplicitTop = 129
    ExplicitHeight = 498
    object tsVeiculo: TUniTabSheet
      Hint = ''
      Caption = 'Ve'#237'culo'
      ExplicitHeight = 470
      object gridVeiculo: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 510
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
    object tsEntrada: TUniTabSheet
      Hint = ''
      Caption = 'Entrada'
      ExplicitHeight = 470
      object gridEntrada: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 161
        Hint = ''
        DataSource = dsEntrada
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alTop
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
      object gridContasPagar: TUniDBGrid
        Left = 0
        Top = 304
        Width = 972
        Height = 206
        Hint = ''
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alBottom
        TabOrder = 1
      end
    end
    object tsVenda: TUniTabSheet
      Hint = ''
      Caption = 'Venda'
      ExplicitHeight = 470
    end
    object tsDespesas: TUniTabSheet
      Hint = ''
      Caption = 'Despesas'
      ExplicitHeight = 470
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 510
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
    end
    object tsFinanceiro: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro'
      ExplicitHeight = 470
      object PageControlFinanceiro: TUniPageControl
        Left = 0
        Top = 0
        Width = 972
        Height = 510
        Hint = ''
        ActivePage = UniTabSheet2
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 470
        object tsContasPagar: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Pagar'
          ExplicitHeight = 442
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Receber'
          ExplicitHeight = 442
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
end
