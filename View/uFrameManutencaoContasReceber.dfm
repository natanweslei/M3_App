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
    OnTitleClick = gridContaReceberTitleClick
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
