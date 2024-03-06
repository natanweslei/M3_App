inherited FormModalVeiculo: TFormModalVeiculo
  Caption = 'Ve'#237'culo'
  OnShow = UniFormShow
  OnCreate = UniFormCreate
  ExplicitWidth = 798
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  object scrollVeiculo: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 792
    Height = 483
    Hint = ''
    Align = alClient
    TabOrder = 1
    ScrollHeight = 414
    ScrollWidth = 770
    object memoObservacaoVeiculo: TUniDBMemo
      Left = 18
      Top = 260
      Width = 360
      Height = 154
      Hint = ''
      DataField = 'observacao_veiculo'
      DataSource = dsManutencao
      TabOrder = 2
      FieldLabel = 'Observa'#231#227'o do Ve'#237'culo'
      FieldLabelAlign = laTop
    end
    object memoObservacao: TUniDBMemo
      Left = 410
      Top = 260
      Width = 360
      Height = 154
      Hint = ''
      DataField = 'observacao'
      DataSource = dsManutencao
      TabOrder = 3
      FieldLabel = 'Observa'#231#227'o'
      FieldLabelAlign = laTop
    end
    object groupDados: TUniGroupBox
      Left = 18
      Top = 152
      Width = 752
      Height = 88
      Hint = ''
      Caption = ''
      TabOrder = 1
      object editRenavam: TUniDBEdit
        Left = 18
        Top = 28
        Width = 255
        Height = 22
        Hint = ''
        DataField = 'renavam'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 0
        FieldLabel = 'Renavam'
        FieldLabelAlign = laRight
      end
      object editNumeroCrv: TUniDBEdit
        Left = 389
        Top = 28
        Width = 255
        Height = 22
        Hint = ''
        DataField = 'numero_crv'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 1
        FieldLabel = 'N'#250'mero CRV'
        FieldLabelAlign = laRight
      end
      object comboCombustivel: TUniDBComboBox
        Left = 18
        Top = 56
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
        TabOrder = 2
        FieldLabel = 'Combust'#237'vel'
        FieldLabelAlign = laRight
        IconItems = <>
      end
      object editChassi: TUniDBEdit
        Left = 389
        Top = 56
        Width = 255
        Height = 22
        Hint = ''
        DataField = 'chassi'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 3
        FieldLabel = 'Chassi'
        FieldLabelAlign = laRight
      end
    end
    object groupVeiculo: TUniGroupBox
      Left = 18
      Top = 19
      Width = 752
      Height = 127
      Hint = ''
      Caption = ''
      TabOrder = 0
      object comboMarca: TUniDBComboBox
        Left = 18
        Top = 31
        Width = 320
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
        ClearButton = True
        ForceSelection = True
        IconItems = <>
      end
      object comboSituacao: TUniDBComboBox
        Left = 389
        Top = 31
        Width = 255
        Hint = ''
        DataField = 'situacao'
        DataSource = dsManutencao
        Style = csDropDownList
        Items.Strings = (
          'EM ESTOQUE'
          'VENDIDO')
        ItemIndex = 0
        TabOrder = 1
        FieldLabel = 'Situa'#231#227'o'
        FieldLabelAlign = laRight
        ClearButton = True
        ForceSelection = True
        IconItems = <>
      end
      object editAnoFabricacao: TUniDBEdit
        Left = 389
        Top = 60
        Width = 255
        Height = 22
        Hint = ''
        DataField = 'ano_fabricacao'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 3
        InputMask.Mask = '9999'
        FieldLabel = 'Ano Fabrica'#231#227'o'
        FieldLabelAlign = laRight
      end
      object editAnoModelo: TUniDBEdit
        Left = 389
        Top = 89
        Width = 255
        Height = 22
        Hint = ''
        DataField = 'ano_modelo'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 6
        InputMask.Mask = '9999'
        FieldLabel = 'Ano Modelo'
        FieldLabelAlign = laRight
      end
      object editModelo: TUniDBEdit
        Left = 18
        Top = 60
        Width = 320
        Height = 22
        Hint = ''
        DataField = 'modelo'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 2
        FieldLabel = 'Modelo'
        FieldLabelAlign = laRight
      end
      object editPlaca: TUniDBEdit
        Left = 18
        Top = 89
        Width = 160
        Height = 22
        Hint = ''
        DataField = 'placa'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 4
        InputMask.Mask = '***-9*99'
        FieldLabel = 'Placa'
        FieldLabelAlign = laRight
      end
      object editVersao: TUniDBEdit
        Left = 178
        Top = 89
        Width = 160
        Height = 22
        Hint = ''
        DataField = 'versao'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 5
        FieldLabel = 'Vers'#227'o'
        FieldLabelAlign = laRight
      end
    end
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
  end
end
