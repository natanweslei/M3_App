inherited FormModalGasto: TFormModalGasto
  Caption = 'Gastos'
  OnShow = UniFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    inherited buttonExcluir: TUniButton
      OnClick = nil
    end
    inherited buttonFechar: TUniButton
      Left = 704
      ExplicitLeft = 704
    end
  end
  object scrollGasto: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 799
    Height = 513
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 798
    ExplicitHeight = 512
    ScrollHeight = 153
    object panelTipoGasto: TUniPanel
      Left = 0
      Top = 0
      Width = 797
      Height = 153
      Hint = ''
      Align = alTop
      TabOrder = 0
      Caption = ''
      object comboResponsavel: TUniDBLookupComboBox
        Left = 23
        Top = 83
        Width = 482
        Hint = ''
        ListField = 'pessoa_id;nome'
        ListSource = UniMainModule.dsCadastroPessoa
        KeyField = 'pessoa_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'pessoa_id'
        DataSource = dsManutencao
        TabOrder = 3
        Color = clWindow
        FieldLabel = 'Respons'#225'vel'
        FieldLabelAlign = laRight
        ForceSelection = True
      end
      object comboVeiculo: TUniDBLookupComboBox
        Left = 23
        Top = 115
        Width = 482
        Hint = ''
        ListField = 'veiculo_id;modelo;marca'
        ListSource = UniMainModule.dsCadastroVeiculo
        KeyField = 'veiculo_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'veiculo_id'
        DataSource = dsManutencao
        TabOrder = 5
        Color = clWindow
        FieldLabel = 'Ve'#237'culo'
        FieldLabelAlign = laRight
      end
      object editDataEntrada: TUniDBDateTimePicker
        Left = 520
        Top = 20
        Width = 244
        Hint = ''
        DataField = 'data_gasto'
        DataSource = dsManutencao
        DateTime = 45328.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
        FieldLabel = 'Data da Gasto'
        FieldLabelAlign = laRight
      end
      object editValorGasto: TUniDBFormattedNumberEdit
        Left = 520
        Top = 52
        Width = 244
        Height = 22
        Hint = ''
        DataField = 'valor_gasto'
        DataSource = dsManutencao
        TabOrder = 4
        MaxValue = 900000.000000000000000000
        MinValue = 1.000000000000000000
        FieldLabel = 'Valor Gasto'
        FieldLabelAlign = laRight
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object comboTipoGasto: TUniDBLookupComboBox
        Left = 23
        Top = 52
        Width = 482
        Hint = ''
        ListField = 'tipogasto_id;descricao'
        ListSource = UniMainModule.dsCadastroTipoGasto
        KeyField = 'tipogasto_id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'tipogasto_id'
        DataSource = dsManutencao
        TabOrder = 1
        Color = clWindow
        FieldLabel = 'Tipo de Gasto'
        FieldLabelAlign = laRight
      end
      object editDescricaoGasto: TUniDBEdit
        Left = 23
        Top = 20
        Width = 482
        Height = 22
        Hint = ''
        DataField = 'descricao'
        DataSource = dsManutencao
        TabOrder = 6
        ClearButton = True
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laRight
      end
    end
    object gridTipoGasto: TUniDBGrid
      Left = 0
      Top = 153
      Width = 797
      Height = 358
      Hint = ''
      DataSource = dsManutencao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'gasto_id'
          Title.Caption = 'Gasto'
          Width = 64
          Sortable = True
        end
        item
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o do Gasto'
          Width = 206
          Sortable = True
        end
        item
          FieldName = 'data_gasto'
          Title.Caption = ' Data do Gasto'
          Width = 112
          Sortable = True
        end
        item
          FieldName = 'valor_gasto'
          Title.Caption = 'Valor Gasto'
          Width = 134
          Sortable = True
        end>
    end
  end
  inherited queryManutencao: TFDQuery
    OnNewRecord = queryManutencaoNewRecord
    Top = 200
  end
end
