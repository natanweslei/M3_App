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
    ExplicitTop = 624
    object buttonSaidaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 228
      Top = 11
      Width = 100
      Height = 25
      Hint = ''
      Caption = 'Sa'#237'da'
      TabOrder = 1
      OnClick = buttonSaidaVeiculoClick
    end
    object buttonGastosVeiculo: TUniButton
      AlignWithMargins = True
      Left = 334
      Top = 11
      Width = 100
      Height = 25
      Hint = ''
      Caption = 'Gastos'
      TabOrder = 2
      OnClick = buttonGastosVeiculoClick
    end
    object buttonEntradaVeiculo: TUniButton
      AlignWithMargins = True
      Left = 122
      Top = 11
      Width = 100
      Height = 25
      Hint = ''
      Caption = 'Entrada'
      TabOrder = 3
      OnClick = buttonEntradaVeiculoClick
    end
    object buttonCadastroVeiculo: TUniButton
      AlignWithMargins = True
      Left = 16
      Top = 11
      Width = 100
      Height = 25
      Hint = ''
      Caption = 'Ve'#237'culo'
      TabOrder = 4
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
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 129
    Width = 980
    Height = 498
    Hint = ''
    DataSource = dsConsulta
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
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
end
