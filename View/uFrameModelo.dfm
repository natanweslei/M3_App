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
    object tsConsulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
      object gridConsulta: TUniDBGrid
        Left = 0
        Top = 105
        Width = 837
        Height = 444
        Hint = ''
        DataSource = dsConsulta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
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
      object containerBotoes: TUniContainerPanel
        Left = 0
        Top = 482
        Width = 837
        Height = 67
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          837
          67)
        object buttonGravar: TUniButton
          AlignWithMargins = True
          Left = 152
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Gravar'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Images = imageListFrameModelo
          ImageIndex = 1
          OnClick = buttonGravarClick
        end
        object buttonNovo: TUniButton
          AlignWithMargins = True
          Left = 16
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Novo'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Images = imageListFrameModelo
          ImageIndex = 0
          OnClick = buttonNovoClick
        end
        object buttonExcluir: TUniButton
          AlignWithMargins = True
          Left = 288
          Top = 8
          Width = 130
          Height = 50
          Hint = ''
          Caption = 'Excluir'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
          Images = imageListFrameModelo
          ImageIndex = 2
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
          Images = imageListFrameModelo
          ImageIndex = 3
          OnClick = buttonCancelarClick
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
    OnStateChange = dsManutencaoStateChange
    Left = 548
    Top = 200
  end
  object queryConsulta: TFDQuery
    AfterScroll = queryConsultaAfterScroll
    Connection = UniMainModule.Conexao
    Left = 444
    Top = 280
  end
  object queryManutencao: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 548
    Top = 280
  end
  object imageListFrameModelo: TUniNativeImageList
    Left = 731
    Top = 323
    Images = {
      0400000000000000060800000066696C653B66613B000000000610000000706C
      61792D636972636C653B66615F3B00000000060900000074726173683B66613B
      00000000060700000062616E3B66613B}
  end
end
