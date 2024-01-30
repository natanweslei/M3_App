inherited FramePessoa: TFramePessoa
  Width = 1023
  Height = 602
  ExplicitWidth = 1023
  ExplicitHeight = 602
  inherited PageControlModelo: TUniPageControl
    Width = 1023
    Height = 602
    ActivePage = tsConsulta
    inherited tsConsulta: TUniTabSheet
      inherited gridConsulta: TUniDBGrid
        Top = 73
        Width = 1015
        Height = 501
        OnDblClick = gridConsultaDblClick
        Columns = <
          item
            FieldName = 'pessoa_id'
            Filtering.Enabled = True
            Title.Caption = 'Pessoa'
            Width = 64
            Sortable = True
          end
          item
            FieldName = 'nome'
            Filtering.Enabled = True
            Title.Caption = 'Nome'
            Width = 179
            Sortable = True
          end
          item
            FieldName = 'cpf'
            Filtering.Enabled = True
            Title.Caption = ' CPF'
            Width = 82
            Sortable = True
          end
          item
            FieldName = 'registro_geral'
            Filtering.Enabled = True
            Title.Caption = 'Registro Geral'
            Width = 85
            Sortable = True
          end
          item
            FieldName = 'data_nascimento'
            Filtering.Enabled = True
            Title.Caption = 'Data de Nascimento'
            Width = 101
            Sortable = True
          end
          item
            FieldName = 'telefone_celular'
            Filtering.Enabled = True
            Title.Caption = ' Telefone Celular'
            Width = 92
            Sortable = True
          end
          item
            FieldName = 'logradouro'
            Filtering.Enabled = True
            Title.Caption = ' Logradouro'
            Width = 125
            Sortable = True
          end
          item
            FieldName = 'bairro'
            Filtering.Enabled = True
            Title.Caption = 'Bairro'
            Width = 95
            Sortable = True
          end
          item
            FieldName = 'quadra'
            Filtering.Enabled = True
            Title.Caption = ' Quadra'
            Width = 64
            Sortable = True
          end
          item
            FieldName = 'lote'
            Filtering.Enabled = True
            Title.Caption = 'Lote'
            Width = 64
            Sortable = True
          end>
      end
      inherited panelFiltros: TUniPanel
        Width = 1015
        Height = 73
        ExplicitHeight = 73
        object editCampoFiltro: TUniEdit
          Left = 9
          Top = 24
          Width = 568
          Hint = ''
          Text = ''
          TabOrder = 1
          EmptyText = 'Filtre por Nome ou CPF'
          OnKeyPress = editCampoFiltroKeyPress
        end
      end
    end
    inherited tsManutencao: TUniTabSheet
      inherited containerBotoes: TUniContainerPanel
        Top = 507
        Width = 1015
      end
      object panelGeral: TUniPanel
        Left = 0
        Top = 0
        Width = 1015
        Height = 507
        Hint = ''
        Align = alClient
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 400
        ExplicitTop = 152
        ExplicitWidth = 256
        ExplicitHeight = 128
        object groupDadosGerais: TUniGroupBox
          Left = 12
          Top = 7
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
            TabOrder = 2
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
            TabOrder = 1
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
            TabOrder = 3
            FieldLabel = 'Registro Geral'
            FieldLabelAlign = laRight
          end
        end
        object groupTelefones: TUniGroupBox
          Left = 12
          Top = 126
          Width = 841
          Height = 92
          Hint = ''
          Caption = 'Telefones'
          TabOrder = 2
          object editTelefoneCelular: TUniDBEdit
            Left = 20
            Top = 53
            Width = 410
            Height = 22
            Hint = ''
            DataField = 'telefone_celular'
            DataSource = dsManutencao
            TabOrder = 2
            InputMask.Mask = '(99)-99999-9999'
            InputMask.RemoveWhiteSpace = True
            FieldLabel = 'Telefone Celular'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
          object editTelefoneComercial: TUniDBEdit
            Left = 20
            Top = 21
            Width = 410
            Height = 22
            Hint = ''
            DataField = 'telefone_comercial'
            DataSource = dsManutencao
            TabOrder = 1
            InputMask.Mask = '(99)-9999-9999'
            InputMask.RemoveWhiteSpace = True
            FieldLabel = 'Telefone Comercial'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
        end
        object groupEnderecos: TUniGroupBox
          Left = 12
          Top = 222
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
            TabOrder = 1
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
            TabOrder = 2
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
            TabOrder = 3
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
            TabOrder = 4
            FieldLabel = 'Lote'
            FieldLabelAlign = laRight
          end
        end
        object groupOperador: TUniGroupBox
          Left = 432
          Top = 350
          Width = 421
          Height = 107
          Hint = ''
          Caption = 'Operador'
          TabOrder = 5
          object editUsuario: TUniDBEdit
            Left = 20
            Top = 26
            Width = 349
            Height = 22
            Hint = ''
            DataField = 'usuario'
            DataSource = dsManutencao
            TabOrder = 1
            FieldLabel = 'Usu'#225'rio'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
          object editSenha: TUniDBEdit
            Left = 20
            Top = 54
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
          Top = 350
          Width = 414
          Height = 107
          Hint = ''
          Caption = 'Configura'#231#245'es'
          TabOrder = 4
          object checkVendedor: TUniDBCheckBox
            Left = 76
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
            Left = 76
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
          end
        end
      end
    end
  end
  inherited dsConsulta: TDataSource
    Left = 884
    Top = 448
  end
  inherited dsManutencao: TDataSource
    Left = 988
    Top = 448
  end
  inherited queryConsulta: TFDQuery
    Left = 884
    Top = 528
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    Left = 988
    Top = 528
  end
end
