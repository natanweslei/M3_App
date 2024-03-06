inherited FrameTipoGasto: TFrameTipoGasto
  inherited PageControlModelo: TUniPageControl
    inherited tsConsulta: TUniTabSheet
      inherited panelFiltros: TUniPanel
        Visible = False
      end
    end
    inherited tsManutencao: TUniTabSheet
      object panelDados: TUniPanel
        Left = 0
        Top = 0
        Width = 837
        Height = 81
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        object editDescricao: TUniDBEdit
          Left = 16
          Top = 24
          Width = 521
          Height = 22
          Hint = ''
          DataField = 'descricao'
          DataSource = dsManutencao
          CharCase = ecUpperCase
          TabOrder = 1
          FieldLabel = 'Descri'#231#227'o'
          FieldLabelAlign = laRight
        end
        object checkAtivo: TUniDBCheckBox
          Left = 576
          Top = 28
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'ativo'
          DataSource = dsManutencao
          ValueChecked = 'true'
          ValueUnchecked = 'false'
          Caption = 'Ativo'
          TabOrder = 2
          ParentColor = False
          Color = clBtnFace
        end
      end
      object gridManutencao: TUniDBGrid
        Left = 0
        Top = 81
        Width = 837
        Height = 401
        Hint = ''
        DataSource = dsManutencao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 2
        Columns = <
          item
            FieldName = 'tipogasto_id'
            Title.Caption = 'Tipo de Gasto'
            Width = 88
            Sortable = True
          end
          item
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 547
            Sortable = True
          end
          item
            FieldName = 'ativo'
            Title.Caption = 'Ativo'
            Width = 110
            Sortable = True
          end>
      end
    end
  end
  inherited queryManutencao: TFDQuery
    BeforePost = queryManutencaoBeforePost
    AfterPost = queryManutencaoAfterPost
    OnNewRecord = queryManutencaoNewRecord
  end
end
