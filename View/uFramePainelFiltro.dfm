object FramePainelFiltro: TFramePainelFiltro
  Left = 0
  Top = 0
  Width = 832
  Height = 162
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object comboPessoa: TUniDBLookupComboBox
    Left = 15
    Top = 51
    Width = 346
    Hint = ''
    ListField = 'pessoa_id;nome'
    ListSource = UniMainModule.dsCadastroPessoa
    KeyField = 'pessoa_id'
    ListFieldIndex = 0
    ClearButton = True
    DataField = 'pessoa_id'
    TabOrder = 0
    Color = clWindow
    FieldLabel = 'Cliente'
    FieldLabelWidth = 60
    FieldLabelAlign = laRight
    ForceSelection = True
  end
  object comboVeiculo: TUniDBLookupComboBox
    Left = 15
    Top = 16
    Width = 346
    Hint = ''
    ListField = 'veiculo_id;modelo;marca'
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
  end
  object editPesquisa: TUniEdit
    Left = 15
    Top = 88
    Width = 498
    Hint = ''
    Text = ''
    TabOrder = 2
    EmptyText = 'Digite para pesquisar'
    FieldLabel = 'Pesquisa'
    FieldLabelWidth = 60
    FieldLabelAlign = laRight
  end
  object groupData: TUniGroupBox
    Left = 367
    Top = 3
    Width = 314
    Height = 81
    Hint = ''
    Caption = 'Data'
    TabOrder = 3
    object editDataFinal: TUniDateTimePicker
      Left = 82
      Top = 48
      Width = 166
      Hint = ''
      DateTime = 45343.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
      FieldLabel = 'Data Final'
      FieldLabelWidth = 70
      FieldLabelAlign = laRight
    end
    object editDataInicial: TUniDateTimePicker
      Left = 82
      Top = 13
      Width = 166
      Hint = ''
      DateTime = 45343.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
      FieldLabel = 'Data Inicial'
      FieldLabelWidth = 70
      FieldLabelAlign = laRight
    end
    object radioIgual: TUniRadioButton
      Left = 8
      Top = 36
      Width = 45
      Height = 17
      Hint = ''
      Caption = 'Igual'
      TabOrder = 3
    end
    object radioEntre: TUniRadioButton
      Left = 8
      Top = 56
      Width = 48
      Height = 17
      Hint = ''
      Caption = 'Entre'
      TabOrder = 4
    end
    object radioNaoFiltrar: TUniRadioButton
      Left = 8
      Top = 15
      Width = 67
      Height = 17
      Hint = ''
      Caption = 'N'#227'o filtrar'
      TabOrder = 5
    end
  end
end
