inherited FrameEmpresa: TFrameEmpresa
  Width = 1058
  ExplicitWidth = 1058
  inherited PageControlModelo: TUniPageControl
    Width = 1058
    ExplicitWidth = 1058
    inherited tsConsulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1050
      ExplicitHeight = 549
      inherited gridConsulta: TUniDBGrid
        Width = 1050
        OnDblClick = gridConsultaDblClick
        Columns = <
          item
            FieldName = 'empresa_id'
            Title.Caption = 'Empresa'
            Width = 64
            Sortable = True
          end
          item
            FieldName = 'nome_fantasia'
            Title.Caption = 'Nome Fantasia'
            Width = 136
          end
          item
            FieldName = 'nome_social'
            Title.Caption = ' Raz'#227'o Social'
            Width = 129
          end
          item
            FieldName = 'cnpj'
            Title.Caption = 'CNPJ'
            Width = 99
          end
          item
            FieldName = 'telefone_comercial'
            Title.Caption = ' Telefone Comercial'
            Width = 104
          end
          item
            FieldName = 'telefone_celular'
            Title.Caption = 'Telefone Celular'
            Width = 101
          end
          item
            FieldName = 'logradouro'
            Title.Caption = 'Logradouro'
            Width = 89
          end
          item
            FieldName = 'quadra'
            Title.Caption = 'Quadra'
            Width = 54
          end
          item
            FieldName = 'lote'
            Title.Caption = ' Lote'
            Width = 44
          end
          item
            FieldName = 'bairro'
            Title.Caption = 'Bairro'
            Width = 122
          end>
      end
      inherited panelFiltros: TUniPanel
        Width = 1050
        Visible = False
        ExplicitWidth = 1050
      end
    end
    inherited tsManutencao: TUniTabSheet
      ExplicitWidth = 1050
      inherited containerBotoes: TUniContainerPanel
        Width = 1050
        TabOrder = 1
        ExplicitWidth = 1050
      end
      object panelGeral: TUniPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 482
        Hint = ''
        Align = alClient
        TabOrder = 0
        TitleVisible = True
        Title = 'Dados Gerais'
        Caption = ''
        object groupDadosGerais: TUniGroupBox
          Left = 12
          Top = 7
          Width = 841
          Height = 140
          Hint = ''
          Caption = 'Dados Gerais'
          TabOrder = 1
          object editRazaoSocial: TUniDBEdit
            Left = 20
            Top = 67
            Width = 797
            Height = 22
            Hint = ''
            DataField = 'nome_social'
            DataSource = dsManutencao
            CharCase = ecUpperCase
            TabOrder = 2
            FieldLabel = 'Raz'#227'o Social'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
          object editCnpj: TUniDBEdit
            Left = 20
            Top = 102
            Width = 797
            Height = 22
            Hint = ''
            DataField = 'cnpj'
            DataSource = dsManutencao
            CharCase = ecUpperCase
            TabOrder = 3
            InputMask.Mask = '99.999.999/9999-99'
            FieldLabel = 'CNPJ'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
          object editNomeEmpresa: TUniDBEdit
            Left = 20
            Top = 34
            Width = 797
            Height = 22
            Hint = ''
            DataField = 'nome_fantasia'
            DataSource = dsManutencao
            CharCase = ecUpperCase
            TabOrder = 1
            FieldLabel = 'Nome Fantasia'
            FieldLabelWidth = 120
            FieldLabelAlign = laRight
          end
        end
        object groupTelefones: TUniGroupBox
          Left = 12
          Top = 158
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
            CharCase = ecUpperCase
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
            CharCase = ecUpperCase
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
          Top = 262
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
            FieldLabel = 'Lote'
            FieldLabelAlign = laRight
          end
        end
      end
    end
  end
  inherited dsConsulta: TDataSource
    Left = 852
    Top = 224
  end
  inherited dsManutencao: TDataSource
    Left = 956
    Top = 216
  end
  inherited queryConsulta: TFDQuery
    Left = 836
    Top = 288
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    Left = 956
  end
end
