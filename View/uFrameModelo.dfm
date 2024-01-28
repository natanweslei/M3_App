object FrameModelo: TFrameModelo
  Left = 0
  Top = 0
  Width = 845
  Height = 577
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object PageControlModelo: TUniPageControl
    Left = 0
    Top = 0
    Width = 845
    Height = 577
    Hint = ''
    ActivePage = tsManutencao
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 510
    object tsConsulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
      ExplicitHeight = 482
      object gridConsulta: TUniDBGrid
        Left = 0
        Top = 105
        Width = 837
        Height = 444
        Hint = ''
        DataSource = dsConsulta
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnDblClick = gridConsultaDblClick
      end
      object panelFiltros: TUniPanel
        Left = 0
        Top = 0
        Width = 837
        Height = 105
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
      end
    end
    object tsManutencao: TUniTabSheet
      Hint = ''
      Caption = 'Manuten'#231#227'o'
      ExplicitHeight = 482
      object containerBotoes: TUniContainerPanel
        Left = 0
        Top = 482
        Width = 837
        Height = 67
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 510
        ExplicitWidth = 845
        DesignSize = (
          837
          67)
        object buttonGravar: TUniButton
          AlignWithMargins = True
          Left = 701
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Gravar'
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          OnClick = buttonGravarClick
          ExplicitLeft = 709
        end
        object buttonIncluir: TUniButton
          AlignWithMargins = True
          Left = 16
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Incluir'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          OnClick = buttonIncluirClick
        end
        object buttonExcluir: TUniButton
          AlignWithMargins = True
          Left = 288
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Exluir'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
          OnClick = buttonExcluirClick
        end
        object buttonCancelar: TUniButton
          AlignWithMargins = True
          Left = 424
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Cancelar'
          Cancel = True
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 4
          OnClick = buttonCancelarClick
        end
        object buttonAlterar: TUniButton
          AlignWithMargins = True
          Left = 152
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Alterar'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 5
          OnClick = buttonAlterarClick
        end
      end
    end
  end
  object dsConsulta: TDataSource
    AutoEdit = False
    DataSet = queryConsulta
    Left = 444
    Top = 200
  end
  object dsManutencao: TDataSource
    DataSet = queryManutencao
    Left = 548
    Top = 200
  end
  object queryConsulta: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 444
    Top = 280
  end
  object queryManutencao: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 548
    Top = 280
  end
end
