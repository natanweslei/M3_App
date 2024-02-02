inherited FormModalVeiculo: TFormModalVeiculo
  Caption = 'FormModalVeiculo'
  OnShow = UniFormShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object scrollVeiculo: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 798
    Height = 512
    Hint = ''
    Align = alClient
    TabOrder = 1
    ScrollHeight = 409
    ScrollWidth = 681
    object comboMarca: TUniDBComboBox
      Left = 18
      Top = 23
      Width = 255
      Hint = ''
      DataField = 'marca'
      DataSource = dsManutencao
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
      TabOrder = 0
      FieldLabel = 'Marca'
      FieldLabelAlign = laRight
      ForceSelection = True
      IconItems = <>
    end
    object editModelo: TUniDBEdit
      Left = 288
      Top = 23
      Width = 193
      Height = 22
      Hint = ''
      DataField = 'modelo'
      DataSource = dsManutencao
      TabOrder = 1
      FieldLabel = 'Modelo'
      FieldLabelAlign = laRight
    end
    object editVersao: TUniDBEdit
      Left = 496
      Top = 23
      Width = 185
      Height = 22
      Hint = ''
      DataField = 'versao'
      DataSource = dsManutencao
      TabOrder = 2
      FieldLabel = 'Vers'#227'o'
      FieldLabelAlign = laRight
    end
    object editPlaca: TUniDBEdit
      Left = 18
      Top = 51
      Width = 255
      Height = 22
      Hint = ''
      DataField = 'placa'
      DataSource = dsManutencao
      CharCase = ecUpperCase
      TabOrder = 3
      InputMask.Mask = '***-9*99'
      FieldLabel = 'Placa'
      FieldLabelAlign = laRight
    end
    object editAnoFabricacao: TUniDBEdit
      Left = 288
      Top = 51
      Width = 193
      Height = 22
      Hint = ''
      DataField = 'ano_fabricacao'
      DataSource = dsManutencao
      TabOrder = 4
      InputMask.Mask = '9999'
      FieldLabel = 'Ano Fabrica'#231#227'o'
      FieldLabelAlign = laRight
    end
    object editAnoModelo: TUniDBEdit
      Left = 496
      Top = 51
      Width = 185
      Height = 22
      Hint = ''
      DataField = 'ano_modelo'
      DataSource = dsManutencao
      TabOrder = 5
      InputMask.Mask = '9999'
      FieldLabel = 'Ano Modelo'
      FieldLabelAlign = laRight
    end
    object editRenavam: TUniDBEdit
      Left = 18
      Top = 79
      Width = 255
      Height = 22
      Hint = ''
      DataField = 'renavam'
      DataSource = dsManutencao
      TabOrder = 6
      FieldLabel = 'Renavam'
      FieldLabelAlign = laRight
    end
    object editNumeroCrv: TUniDBEdit
      Left = 288
      Top = 79
      Width = 193
      Height = 22
      Hint = ''
      DataField = 'numero_crv'
      DataSource = dsManutencao
      TabOrder = 7
      FieldLabel = 'N'#250'mero CRV'
      FieldLabelAlign = laRight
    end
    object editChassi: TUniDBEdit
      Left = 496
      Top = 79
      Width = 185
      Height = 22
      Hint = ''
      DataField = 'chassi'
      DataSource = dsManutencao
      TabOrder = 8
      FieldLabel = 'Chassi'
      FieldLabelAlign = laRight
    end
    object comboCombustivel: TUniDBComboBox
      Left = 18
      Top = 120
      Width = 255
      Hint = ''
      DataField = 'combustivel'
      DataSource = dsManutencao
      Items.Strings = (
        #193'LCOOL / GASOLINA'
        'GASOLINA'
        #193'LCOOL'
        'DIESEL'
        'GNV'
        'ELERICIDADE')
      TabOrder = 9
      FieldLabel = 'Combust'#237'vel'
      FieldLabelAlign = laRight
      IconItems = <>
    end
    object memoObservacaoVeiculo: TUniDBMemo
      Left = 18
      Top = 208
      Width = 327
      Height = 201
      Hint = ''
      DataField = 'observacao_veiculo'
      DataSource = dsManutencao
      TabOrder = 10
      FieldLabel = 'Observa'#231#227'o do Ve'#237'culo'
      FieldLabelAlign = laTop
    end
    object memoObservacao: TUniDBMemo
      Left = 392
      Top = 208
      Width = 289
      Height = 201
      Hint = ''
      DataField = 'observacao'
      DataSource = dsManutencao
      TabOrder = 11
      FieldLabel = 'Observa'#231#227'o'
      FieldLabelAlign = laRight
    end
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
  end
end
