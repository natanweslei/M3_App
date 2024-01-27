object FormModelo: TFormModelo
  Left = 0
  Top = 0
  ClientHeight = 615
  ClientWidth = 921
  Caption = 'Modelo'
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlModelo: TUniPageControl
    Left = 0
    Top = 0
    Width = 921
    Height = 574
    Hint = ''
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 905
    ExplicitHeight = 535
    object tsConsulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
      ExplicitWidth = 897
      ExplicitHeight = 507
      object gridConsulta: TUniDBGrid
        Left = 0
        Top = 105
        Width = 913
        Height = 441
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
      object panelFiltros: TUniPanel
        Left = 0
        Top = 0
        Width = 913
        Height = 105
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 897
      end
    end
    object tsManutencao: TUniTabSheet
      Hint = ''
      Caption = 'Manuten'#231#227'o'
      ExplicitWidth = 897
      ExplicitHeight = 507
    end
  end
  object panelBotoes: TUniPanel
    Left = 0
    Top = 574
    Width = 921
    Height = 41
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitTop = 535
    ExplicitWidth = 905
  end
end
