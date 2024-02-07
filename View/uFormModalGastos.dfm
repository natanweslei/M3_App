inherited FormModalTipoGasto: TFormModalTipoGasto
  Caption = 'FormModalGastos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    inherited buttonExcluir: TUniButton
      OnClick = nil
    end
  end
  object scrollGasto: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 798
    Height = 512
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 136
    ExplicitWidth = 256
    ExplicitHeight = 256
  end
end
