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
    inline FramePainelFiltro: TFramePainelFiltro
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 972
      Height = 120
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Background.Picture.Data = {00}
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 972
      ExplicitHeight = 120
      inherited comboPessoa: TUniDBLookupComboBox
        AlignWithMargins = True
        Top = 48
        OnChange = FramePainelFiltrocomboVeiculoChange
        ExplicitTop = 48
      end
      inherited comboVeiculo: TUniDBLookupComboBox
        AlignWithMargins = True
        Top = 13
        OnChange = FramePainelFiltrocomboVeiculoChange
        ExplicitTop = 13
      end
      inherited editPesquisa: TUniEdit
        AlignWithMargins = True
        Left = 832
        Top = 11
        Width = 137
        Visible = False
        ExplicitLeft = 832
        ExplicitTop = 11
        ExplicitWidth = 137
      end
      inherited groupData: TUniGroupBox
        Top = 0
        Width = 266
        Height = 75
        Caption = 'Data Vencimento'
        ExplicitTop = 0
        ExplicitWidth = 266
        ExplicitHeight = 75
        inherited editDataFinal: TUniDateTimePicker
          Top = 47
          OnChange = FramePainelFiltroeditDataInicialChange
          ExplicitTop = 47
        end
        inherited editDataInicial: TUniDateTimePicker
          OnChange = FramePainelFiltroeditDataInicialChange
        end
        inherited radioIgual: TUniRadioButton
          Top = 33
          OnClick = FramePainelFiltroradioIgualClick
          ExplicitTop = 33
        end
        inherited radioEntre: TUniRadioButton
          Top = 51
          OnClick = FramePainelFiltroradioIgualClick
          ExplicitTop = 51
        end
        inherited radioNaoFiltrar: TUniRadioButton
          OnClick = FramePainelFiltroradioIgualClick
        end
      end
    end
    object checkAberto: TUniCheckBox
      Left = 107
      Top = 96
      Width = 57
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Aberto'
      TabOrder = 2
      OnChange = checkAbertoChange
    end
    object checkVencido: TUniCheckBox
      Left = 240
      Top = 96
      Width = 64
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Vencido'
      TabOrder = 3
      OnChange = checkAbertoChange
    end
    object checkPago: TUniCheckBox
      Left = 376
      Top = 96
      Width = 65
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Pago'
      TabOrder = 4
      OnChange = checkAbertoChange
    end
    object panelStatusPago: TUniSimplePanel
      Left = 344
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clGreen
      TabOrder = 5
    end
    object panelStatusAberto: TUniSimplePanel
      Left = 75
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clBlue
      TabOrder = 6
    end
    object panelStatusVencido: TUniSimplePanel
      Left = 208
      Top = 93
      Width = 26
      Height = 22
      Hint = ''
      ParentColor = False
      Color = clRed
      TabOrder = 7
    end
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
        Font.Height = -13
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
