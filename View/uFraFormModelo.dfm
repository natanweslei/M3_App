object FraFormModelo: TFraFormModelo
  Left = 0
  Top = 0
  Width = 777
  Height = 577
  TabOrder = 0
  object PageControlModelo: TUniPageControl
    Left = 0
    Top = 0
    Width = 777
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
        Width = 769
        Height = 444
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
      object panelFiltros: TUniPanel
        Left = 0
        Top = 0
        Width = 769
        Height = 105
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
      end
    end
    object tsManutencao: TUniTabSheet
      Hint = ''
      Caption = 'Manuten'#231#227'o'
      object panelBotoes: TUniPanel
        Left = 0
        Top = 508
        Width = 769
        Height = 41
        Hint = ''
        Align = alBottom
        TabOrder = 0
        Caption = ''
      end
    end
  end
end
