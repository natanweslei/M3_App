object FrameManutencaoVeiculo: TFrameManutencaoVeiculo
  Left = 0
  Top = 0
  Width = 980
  Height = 672
  OnCreate = UniFrameCreate
  TabOrder = 0
  object panelBotoes: TUniPanel
    Left = 0
    Top = 627
    Width = 980
    Height = 45
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object buttonVendaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 228
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Venda'
      TabOrder = 1
      Images = ImageListManutencaoVeiculo
      OnClick = buttonVendaVeiculoClick
    end
    object buttonDespesasVeiculo: TUniButton
      AlignWithMargins = True
      Left = 334
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Despesas'
      TabOrder = 2
      Images = ImageListManutencaoVeiculo
      OnClick = buttonDespesasVeiculoClick
    end
    object buttonEntradaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 122
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Entrada'
      TabOrder = 3
      Images = ImageListManutencaoVeiculo
      OnClick = buttonEntradaVeiculoClick
    end
    object buttonCadastroVeiculo: TUniButton
      AlignWithMargins = True
      Left = 16
      Top = 3
      Width = 100
      Height = 35
      Hint = ''
      Caption = 'Ve'#237'culo'
      TabOrder = 4
      Images = ImageListManutencaoVeiculo
      ImageIndex = 0
      OnClick = buttonCadastroVeiculoClick
    end
  end
  object panel: TUniPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 129
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
  end
  object PageControlVeiculo: TUniPageControl
    Left = 0
    Top = 129
    Width = 980
    Height = 498
    Hint = ''
    ActivePage = tsVeiculo
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 440
    ExplicitTop = 184
    ExplicitWidth = 289
    ExplicitHeight = 193
    object tsVeiculo: TUniTabSheet
      Hint = ''
      Caption = 'Ve'#237'culo'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 980
      ExplicitHeight = 498
      object gridVeiculo: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 470
        Hint = ''
        DataSource = dsConsulta
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
    end
    object tsEntrada: TUniTabSheet
      Hint = ''
      Caption = 'Entrada'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 980
      ExplicitHeight = 498
    end
    object tsVenda: TUniTabSheet
      Hint = ''
      Caption = 'Venda'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 980
      ExplicitHeight = 498
    end
    object tsDespesas: TUniTabSheet
      Hint = ''
      Caption = 'Despesas'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 980
      ExplicitHeight = 498
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 470
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
    end
    object tsFinanceiro: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 980
      ExplicitHeight = 498
      object PageControlFinanceiro: TUniPageControl
        Left = 0
        Top = 0
        Width = 972
        Height = 470
        Hint = ''
        ActivePage = UniTabSheet2
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 168
        ExplicitTop = 112
        ExplicitWidth = 289
        ExplicitHeight = 193
        object tsContasPagar: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Pagar'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 972
          ExplicitHeight = 470
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Contas a Receber'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 972
          ExplicitHeight = 470
        end
      end
    end
  end
  object queryConsulta: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 872
    Top = 344
  end
  object dsConsulta: TDataSource
    DataSet = queryConsulta
    Left = 872
    Top = 424
  end
  object ImageListManutencaoVeiculo: TUniNativeImageList
    Left = 888
    Top = 488
    Images = {
      050000000000000006080000006361723B66615F3B00000000060F0000004E65
      7749636F6E436C733B66615F3B00000000060F0000004E657749636F6E436C73
      3B66615F3B00000000060F0000004E657749636F6E436C733B66615F3B000000
      00060F0000004E657749636F6E436C733B66615F3B}
  end
end
