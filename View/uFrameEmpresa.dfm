inherited FrameEmpresa: TFrameEmpresa
  Width = 1058
  ExplicitWidth = 1058
  inherited PageControlModelo: TUniPageControl
    Width = 1058
    ActivePage = tsManutencao
    ExplicitWidth = 1058
    inherited tsConsulta: TUniTabSheet
      ExplicitWidth = 1050
      inherited gridConsulta: TUniDBGrid
        Width = 1050
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
        ExplicitWidth = 1050
      end
    end
    inherited tsManutencao: TUniTabSheet
      ExplicitWidth = 1050
      object panelGeral: TUniPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 128
        Hint = ''
        Align = alTop
        TabOrder = 0
        Title = 'Dados Gerais'
        Caption = ''
        object editNomeEmpresa: TUniDBEdit
          Left = 12
          Top = 26
          Width = 725
          Height = 22
          Hint = ''
          DataField = 'nome_fantasia'
          DataSource = dsManutencao
          TabOrder = 1
          FieldLabel = 'Nome Fantasia'
        end
        object editRazaoSocial: TUniDBEdit
          Left = 12
          Top = 56
          Width = 725
          Height = 22
          Hint = ''
          DataField = 'nome_social'
          DataSource = dsManutencao
          TabOrder = 2
          FieldLabel = 'Raz'#227'o Social'
        end
        object editCnpj: TUniDBEdit
          Left = 12
          Top = 87
          Width = 725
          Height = 22
          Hint = ''
          DataField = 'cnpj'
          DataSource = dsManutencao
          TabOrder = 3
          FieldLabel = 'CNPJ'
        end
      end
      object panelTelefones: TUniPanel
        Left = 0
        Top = 128
        Width = 1050
        Height = 88
        Hint = ''
        Align = alClient
        TabOrder = 1
        Title = 'Telefones'
        Caption = ''
        object editTelefoneComercial: TUniDBEdit
          Left = 12
          Top = 23
          Width = 410
          Height = 22
          Hint = ''
          DataField = 'telefone_comercial'
          DataSource = dsManutencao
          TabOrder = 1
          FieldLabel = 'Telefone Comercial'
        end
        object editTelefoneCelular: TUniDBEdit
          Left = 12
          Top = 53
          Width = 410
          Height = 22
          Hint = ''
          DataField = 'telefone_celular'
          DataSource = dsManutencao
          TabOrder = 2
          FieldLabel = 'Telefone Celular'
        end
      end
      object panelEndereco: TUniPanel
        Left = 0
        Top = 216
        Width = 1050
        Height = 266
        Hint = ''
        Align = alBottom
        TabOrder = 2
        Title = 'Endere'#231'o'
        Caption = ''
        object editLogradouro: TUniDBEdit
          Left = 12
          Top = 24
          Width = 410
          Height = 22
          Hint = ''
          DataField = 'logradouro'
          DataSource = dsManutencao
          TabOrder = 1
          FieldLabel = 'Logradouro'
        end
        object editBairro: TUniDBEdit
          Left = 12
          Top = 55
          Width = 410
          Height = 22
          Hint = ''
          DataField = 'bairro'
          DataSource = dsManutencao
          TabOrder = 2
          FieldLabel = 'Bairro'
        end
        object editQuadra: TUniDBEdit
          Left = 12
          Top = 86
          Width = 200
          Height = 22
          Hint = ''
          DataField = 'quadra'
          DataSource = dsManutencao
          TabOrder = 3
          FieldLabel = 'Quadra'
        end
        object editLote: TUniDBEdit
          Left = 222
          Top = 86
          Width = 200
          Height = 22
          Hint = ''
          DataField = 'lote'
          DataSource = dsManutencao
          TabOrder = 4
          FieldLabel = 'Lote'
        end
      end
    end
  end
  inherited containerBotoes: TUniContainerPanel
    Width = 1058
    ExplicitWidth = 1058
    inherited buttonGravar: TUniButton
      Left = 922
      ExplicitLeft = 922
    end
  end
  inherited dsManutencao: TDataSource
    DataSet = nil
  end
end
