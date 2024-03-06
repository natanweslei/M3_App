object FrameManutencaoVeiculo: TFrameManutencaoVeiculo
  Left = 0
  Top = 0
  Width = 980
  Height = 672
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
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
      Left = 223
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
    object buttonImagens: TUniFileUploadButton
      AlignWithMargins = True
      Left = 118
      Top = 3
      Width = 99
      Height = 35
      Hint = ''
      Caption = 'Imagens'
      Filter = 'image/*'
      Images = UniMainModule.ImageListMain
      ImageIndex = 13
      Messages.Uploading = 'Uploading...'
      Messages.PleaseWait = 'Aguarde'
      Messages.UploadError = 'Upload Error'
      Messages.UploadTimeout = 'Timeout occurred...'
      Messages.MaxSizeError = 'File is bigger than maximum allowed size'
      Messages.MaxFilesError = 'You can upload maximum %d files.'
      OnCompleted = buttonImagensCompleted
    end
  end
  object panelFiltro: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 974
    Height = 70
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    AlwaysOnTop = True
    object comboVeiculo: TUniDBLookupComboBox
      Left = 15
      Top = 24
      Width = 346
      Hint = ''
      ListField = 'modelo;marca'
      ListSource = UniMainModule.dsCadastroVeiculo
      KeyField = 'veiculo_id'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'veiculo_id'
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Ve'#237'culo'
      FieldLabelWidth = 60
      FieldLabelAlign = laRight
      Style = csDropDown
      OnChange = comboVeiculoChange
    end
    object comboMarca: TUniComboBox
      Left = 367
      Top = 24
      Width = 250
      Hint = ''
      Text = ''
      Items.Strings = (
        'FIAT'
        'CHEVROLET'
        'VOLKSWAGEN'
        'FORD'
        'HONDA'
        'TOYOTA'
        'HYUNDAI'
        'NISSAN'
        'RENAULT'
        'PEUGEOT'
        'CITRO'#203'N'
        'JEEP'
        'MITSUBISHI'
        'MERCEDES-bENZ'
        'BMW'
        'AUDI')
      TabOrder = 2
      ForceSelection = True
      CharCase = ecUpperCase
      ClearButton = True
      FieldLabel = 'Marca'
      FieldLabelAlign = laRight
      IconItems = <>
      OnChange = comboMarcaChange
    end
  end
  object panelCentro: TUniPanel
    Left = 0
    Top = 76
    Width = 980
    Height = 345
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = ''
    object gridVeiculo: TUniDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 632
      Height = 337
      Hint = ''
      DataSource = dsVeiculo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
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
          Width = 82
          Sortable = True
        end
        item
          FieldName = 'ano_modelo'
          Title.Caption = 'Ano Modelo'
          Width = 68
          Sortable = True
        end>
    end
    object panelImagemLeft: TUniPanel
      Left = 639
      Top = 1
      Width = 340
      Height = 343
      Hint = ''
      Align = alRight
      TabOrder = 2
      Caption = ''
      DesignSize = (
        340
        343)
      object imageVeiculos: TUniDBImage
        Left = 1
        Top = 1
        Width = 338
        Height = 341
        Hint = ''
        DataField = 'imagem'
        DataSource = dsImagensVeiculo
        Proportional = True
        Align = alClient
      end
      object navigaterImagensVeiculo: TUniDBNavigator
        Left = 114
        Top = 312
        Width = 108
        Height = 19
        Hint = ''
        DataSource = dsImagensVeiculo
        VisibleButtons = [nbPrior, nbNext]
        Anchors = [akLeft, akRight]
        TabOrder = 2
      end
    end
  end
  object panelBotton: TUniPanel
    Left = 0
    Top = 421
    Width = 980
    Height = 206
    Hint = ''
    Align = alBottom
    TabOrder = 3
    Caption = ''
    object gridContaReceber: TUniDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 629
      Height = 198
      Hint = ''
      DataSource = dsContasReceber
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
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
    object gridGasto: TUniDBGrid
      AlignWithMargins = True
      Left = 639
      Top = 4
      Width = 337
      Height = 198
      Hint = ''
      DataSource = dsGasto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alRight
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
  end
  object queryVeiculo: TFDQuery
    AfterScroll = queryVeiculoAfterScroll
    Connection = UniMainModule.Conexao
    Left = 816
    Top = 456
  end
  object dsVeiculo: TDataSource
    DataSet = queryVeiculo
    Left = 816
    Top = 528
  end
  object queryGasto: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 756
    Top = 465
  end
  object dsGasto: TDataSource
    DataSet = queryGasto
    Left = 764
    Top = 529
  end
  object dsContasReceber: TDataSource
    DataSet = queryContasReceber
    Left = 688
    Top = 528
  end
  object queryContasReceber: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 688
    Top = 448
  end
  object queryImagensVeiculo: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 896
    Top = 472
  end
  object dsImagensVeiculo: TDataSource
    DataSet = queryImagensVeiculo
    Left = 896
    Top = 528
  end
end
