object FormAlertaFinanceiro: TFormAlertaFinanceiro
  AlignWithMargins = True
  Left = 0
  Top = 0
  ClientHeight = 514
  ClientWidth = 1035
  Caption = 'Alerta Financeiro'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object gridContaReceber: TUniDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1029
    Height = 464
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
  object panelBotoes: TUniPanel
    Left = 0
    Top = 470
    Width = 1035
    Height = 44
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitTop = 456
    ExplicitWidth = 722
    object buttonConfirmar: TUniButton
      Left = 485
      Top = 6
      Width = 91
      Height = 31
      Hint = ''
      Caption = 'Confirmar'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 14
      OnClick = buttonConfirmarClick
    end
  end
  object dsContasReceber: TDataSource
    DataSet = queryContasReceber
    Left = 915
    Top = 275
  end
  object queryContasReceber: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 912
    Top = 216
  end
end
