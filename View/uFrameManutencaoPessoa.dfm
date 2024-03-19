object FrameManutencaoPessoa: TFrameManutencaoPessoa
  Left = 0
  Top = 0
  Width = 1023
  Height = 602
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object panelFiltro: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1017
    Height = 22
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    AlwaysOnTop = True
  end
  object panelBotoes: TUniPanel
    Left = 0
    Top = 557
    Width = 1023
    Height = 45
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object buttonCadastroPessoa: TUniButton
      AlignWithMargins = True
      Left = 12
      Top = 3
      Width = 125
      Height = 35
      Hint = ''
      Caption = 'Pessoa'
      TabOrder = 1
      Images = UniMainModule.ImageListMain
      ImageIndex = 1
      OnClick = buttonCadastroPessoaClick
    end
    object buttonAcesso: TUniButton
      AlignWithMargins = True
      Left = 143
      Top = 3
      Width = 122
      Height = 35
      Hint = ''
      Caption = 'Acessos'
      TabOrder = 2
      Images = UniMainModule.ImageListMain
      ImageIndex = 17
      OnClick = buttonAcessoClick
    end
  end
  object gridPessoa: TUniDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 31
    Width = 1017
    Height = 523
    Hint = ''
    DataSource = dsPessoa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    OnDrawColumnCell = gridPessoaDrawColumnCell
    Columns = <
      item
        FieldName = 'pessoa_id'
        Title.Caption = 'Pessoa'
        Width = 64
        Sortable = True
      end
      item
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 229
        Sortable = True
      end
      item
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Width = 104
        Sortable = True
      end
      item
        FieldName = 'data_nascimento'
        Title.Caption = 'Data de Nascimento'
        Width = 107
        Sortable = True
      end
      item
        FieldName = 'telefone_celular'
        Title.Caption = 'Telefone Celular'
        Width = 103
        Sortable = True
      end
      item
        FieldName = 'telefone_comercial'
        Title.Caption = 'Telefone'
        Width = 107
        Sortable = True
      end>
  end
  object dsPessoa: TDataSource
    DataSet = queryPessoa
    Left = 944
    Top = 384
  end
  object queryPessoa: TFDQuery
    AfterScroll = queryPessoaAfterScroll
    Connection = UniMainModule.Conexao
    Left = 944
    Top = 312
  end
end
