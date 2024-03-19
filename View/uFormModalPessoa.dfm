inherited FormModalPessoa: TFormModalPessoa
  ClientHeight = 557
  ClientWidth = 869
  Caption = 'Pessoa'
  OnShow = UniFormShow
  ExplicitWidth = 875
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    Top = 512
    Width = 869
    ExplicitTop = 512
    ExplicitWidth = 869
  end
  object panelGeral: TUniPanel [1]
    Left = 0
    Top = 0
    Width = 869
    Height = 512
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    object groupDadosGerais: TUniGroupBox
      Left = 12
      Top = 3
      Width = 841
      Height = 114
      Hint = ''
      Caption = 'Dados Gerais'
      TabOrder = 1
      object editCpf: TUniDBEdit
        Left = 20
        Top = 53
        Width = 301
        Height = 22
        Hint = ''
        DataField = 'cpf'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 2
        ClearButton = True
        InputMask.Mask = '999.999.999-99'
        FieldLabel = 'CPF'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editNome: TUniDBEdit
        Left = 20
        Top = 25
        Width = 613
        Height = 22
        Hint = ''
        DataField = 'nome'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 1
        ClearButton = True
        FieldLabel = 'Nome '
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editDataNascimento: TUniDBDateTimePicker
        Left = 20
        Top = 81
        Width = 301
        Hint = ''
        DataField = 'data_nascimento'
        DataSource = dsManutencao
        DateTime = 45320.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
        FieldLabel = 'Data de Nascimento'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editRegistroGeral: TUniDBEdit
        Left = 327
        Top = 53
        Width = 306
        Height = 22
        Hint = ''
        DataField = 'registro_geral'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 3
        ClearButton = True
        FieldLabel = 'Registro Geral'
        FieldLabelAlign = laRight
      end
    end
    object groupTrabalho: TUniGroupBox
      Left = 12
      Top = 238
      Width = 841
      Height = 150
      Hint = ''
      Caption = 'Trabalho'
      TabOrder = 2
      object editContato: TUniDBEdit
        Left = 435
        Top = 22
        Width = 240
        Height = 22
        Hint = ''
        DataField = 'nome_contato'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 5
        ClearButton = True
        FieldLabel = 'Contato'
        FieldLabelWidth = 60
        FieldLabelAlign = laRight
      end
      object editContato2: TUniDBEdit
        Left = 435
        Top = 51
        Width = 240
        Height = 22
        Hint = ''
        DataField = 'nome_contato_2'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 7
        ClearButton = True
        FieldLabel = 'Contato 2'
        FieldLabelWidth = 60
        FieldLabelAlign = laRight
      end
      object editContato3: TUniDBEdit
        Left = 435
        Top = 80
        Width = 240
        Height = 22
        Hint = ''
        DataField = 'nome_contato_3'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 9
        ClearButton = True
        FieldLabel = 'Contato 3'
        FieldLabelWidth = 60
        FieldLabelAlign = laRight
      end
      object editContato4: TUniDBEdit
        Left = 435
        Top = 109
        Width = 240
        Height = 22
        Hint = ''
        DataField = 'nome_contato_4'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 11
        ClearButton = True
        FieldLabel = 'Contato 4'
        FieldLabelWidth = 60
        FieldLabelAlign = laRight
      end
      object editEmpresaTrabalho: TUniDBEdit
        Left = 20
        Top = 22
        Width = 394
        Height = 22
        Hint = ''
        DataField = 'empresa_trabalho'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 1
        ClearButton = True
        FieldLabel = 'Empresa'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editEnderecoTrabalho: TUniDBEdit
        Left = 20
        Top = 109
        Width = 394
        Height = 22
        Hint = ''
        DataField = 'endereco_trabalho'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 4
        ClearButton = True
        FieldLabel = 'Endere'#231'o'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editProfissaoTrabalho: TUniDBEdit
        Left = 20
        Top = 51
        Width = 394
        Height = 22
        Hint = ''
        DataField = 'profissao_trabalho'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 2
        ClearButton = True
        FieldLabel = 'Profiss'#227'o'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editTelefoneContato: TUniDBEdit
        Left = 678
        Top = 22
        Width = 146
        Height = 22
        Hint = ''
        DataField = 'telefone_contato'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 6
        ClearButton = True
        InputMask.Mask = '(99)-99999-9999'
        FieldLabelAlign = laRight
      end
      object editTelefoneContato2: TUniDBEdit
        Left = 678
        Top = 51
        Width = 146
        Height = 22
        Hint = ''
        DataField = 'telefone_contato_2'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 8
        ClearButton = True
        InputMask.Mask = '(99)-99999-9999'
        FieldLabelAlign = laRight
      end
      object editTelefoneContato3: TUniDBEdit
        Left = 678
        Top = 80
        Width = 146
        Height = 22
        Hint = ''
        DataField = 'telefone_contato_3'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 10
        ClearButton = True
        InputMask.Mask = '(99)-99999-9999'
        FieldLabelAlign = laRight
      end
      object editTelefoneContato4: TUniDBEdit
        Left = 678
        Top = 109
        Width = 146
        Height = 22
        Hint = ''
        DataField = 'telefone_contato_4'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 12
        ClearButton = True
        InputMask.Mask = '(99)-99999-9999'
        FieldLabelAlign = laRight
      end
      object editTelefoneTrabalho: TUniDBEdit
        Left = 20
        Top = 80
        Width = 394
        Height = 22
        Hint = ''
        DataField = 'telefone_trabalho'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 3
        ClearButton = True
        FieldLabel = 'Telefone'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
    end
    object groupEnderecos: TUniGroupBox
      Left = 12
      Top = 117
      Width = 841
      Height = 122
      Hint = ''
      Caption = 'Endere'#231'o'
      TabOrder = 3
      object editLogradouro: TUniDBEdit
        Left = 20
        Top = 26
        Width = 410
        Height = 22
        Hint = ''
        DataField = 'logradouro'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 1
        ClearButton = True
        FieldLabel = 'Logradouro'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editBairro: TUniDBEdit
        Left = 20
        Top = 56
        Width = 410
        Height = 22
        Hint = ''
        DataField = 'bairro'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 2
        ClearButton = True
        FieldLabel = 'Bairro'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editQuadra: TUniDBEdit
        Left = 40
        Top = 86
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'quadra'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 3
        ClearButton = True
        FieldLabel = 'Quadra'
        FieldLabelAlign = laRight
      end
      object editLote: TUniDBEdit
        Left = 230
        Top = 86
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'lote'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 4
        ClearButton = True
        FieldLabel = 'Lote'
        FieldLabelAlign = laRight
      end
      object editEmail: TUniDBEdit
        Left = 436
        Top = 26
        Width = 385
        Height = 22
        Hint = ''
        DataField = 'email'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 5
        ClearButton = True
        InputMask.RemoveWhiteSpace = True
        FieldLabel = 'e-mail'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editTelefoneCelular: TUniDBEdit
        Left = 436
        Top = 56
        Width = 385
        Height = 22
        Hint = ''
        DataField = 'telefone_celular'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 6
        ClearButton = True
        InputMask.Mask = '(99)-99999-9999'
        InputMask.RemoveWhiteSpace = True
        FieldLabel = 'Telefone Celular'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editTelefoneComercial: TUniDBEdit
        Left = 436
        Top = 86
        Width = 385
        Height = 22
        Hint = ''
        DataField = 'telefone_comercial'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 7
        ClearButton = True
        InputMask.Mask = '(99)-9999-9999'
        InputMask.UnmaskText = True
        InputMask.RemoveWhiteSpace = True
        FieldLabel = 'Telefone Comercial'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
    end
    object groupOperador: TUniGroupBox
      Left = 432
      Top = 394
      Width = 421
      Height = 91
      Hint = ''
      Caption = 'Operador'
      TabOrder = 5
      object editUsuario: TUniDBEdit
        Left = 20
        Top = 21
        Width = 349
        Height = 22
        Hint = ''
        DataField = 'usuario'
        DataSource = dsManutencao
        CharCase = ecUpperCase
        TabOrder = 1
        InputType = 'text'
        FieldLabel = 'Usu'#225'rio'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
      object editSenha: TUniDBEdit
        Left = 20
        Top = 49
        Width = 349
        Height = 22
        Hint = ''
        DataField = 'senha'
        DataSource = dsManutencao
        PasswordChar = '*'
        TabOrder = 2
        FieldLabel = 'Senha'
        FieldLabelWidth = 120
        FieldLabelAlign = laRight
      end
    end
    object groupConfiguracoes: TUniGroupBox
      Left = 12
      Top = 394
      Width = 414
      Height = 91
      Hint = ''
      Caption = 'Configura'#231#245'es'
      TabOrder = 4
      object checkVendedor: TUniDBCheckBox
        Left = 20
        Top = 54
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'vendedor'
        DataSource = dsManutencao
        Caption = 'Vendedor'
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
      end
      object checkOperador: TUniDBCheckBox
        Left = 20
        Top = 26
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'operador'
        DataSource = dsManutencao
        Caption = 'Operador'
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        OnClick = checkOperadorClick
      end
    end
  end
  inherited dsManutencao: TDataSource
    Left = 784
    Top = 224
  end
  inherited queryManutencao: TFDQuery
    OnNewRecord = queryManutencaoNewRecord
    Left = 784
    Top = 144
  end
  inherited imageListFormModalModelo: TUniNativeImageList
    Left = 787
    Top = 299
  end
end
