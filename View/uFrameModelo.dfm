object FrameModelo: TFrameModelo
  Left = 0
  Top = 0
  Width = 777
  Height = 577
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object PageControlModelo: TUniPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 536
    Hint = ''
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 610
    ExplicitHeight = 344
    object tsConsulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
      ExplicitWidth = 602
      ExplicitHeight = 316
      object gridConsulta: TUniDBGrid
        Left = 0
        Top = 105
        Width = 769
        Height = 403
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
        ExplicitWidth = 602
      end
    end
    object tsManutencao: TUniTabSheet
      Hint = ''
      Caption = 'Manuten'#231#227'o'
      ExplicitWidth = 602
      ExplicitHeight = 316
    end
  end
  object panelBotoes: TUniPanel
    Left = 0
    Top = 536
    Width = 777
    Height = 41
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitTop = 344
    ExplicitWidth = 610
  end
end
