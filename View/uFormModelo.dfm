object FormModelo: TFormModelo
  Left = 0
  Top = 0
  ClientHeight = 576
  ClientWidth = 905
  Caption = 'Modelo'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlModelo: TUniPageControl
    Left = 0
    Top = 0
    Width = 905
    Height = 535
    Hint = ''
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 996
    ExplicitHeight = 996
    object tsConsulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
      ExplicitWidth = 988
      ExplicitHeight = 968
      object gridConsulta: TUniDBGrid
        Left = 0
        Top = 105
        Width = 897
        Height = 402
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
      object panelFiltros: TUniPanel
        Left = 0
        Top = 0
        Width = 897
        Height = 105
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 769
      end
    end
    object tsManutencao: TUniTabSheet
      Hint = ''
      Caption = 'Manuten'#231#227'o'
      ExplicitWidth = 988
      ExplicitHeight = 968
    end
  end
  object panelBotoes: TUniPanel
    Left = 0
    Top = 535
    Width = 905
    Height = 41
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitLeft = 4
    ExplicitTop = 508
    ExplicitWidth = 988
  end
end
