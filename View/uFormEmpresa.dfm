inherited FormEmpresa: TFormEmpresa
  Hint = 'Empresa'
  ClientHeight = 385
  ClientWidth = 610
  Caption = 'Cadastro de Empresa'
  BorderStyle = bsSingle
  ExplicitWidth = 616
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlModelo: TUniPageControl
    Width = 610
    Height = 344
    inherited tsConsulta: TUniTabSheet
      inherited gridConsulta: TUniDBGrid
        Width = 602
        Height = 211
      end
      inherited panelFiltros: TUniPanel
        Width = 602
      end
    end
  end
  inherited panelBotoes: TUniPanel
    Top = 344
    Width = 610
  end
end
