object FormModalModelo: TFormModalModelo
  Left = 0
  Top = 0
  ClientHeight = 557
  ClientWidth = 798
  Caption = 'Modelo'
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object panelBotoes: TUniPanel
    Left = 0
    Top = 512
    Width = 798
    Height = 45
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    ExplicitTop = 496
    object buttonConfirmar: TUniButton
      Left = 306
      Top = 10
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = buttonConfirmarClick
    end
    object buttonCancelar: TUniButton
      Left = 387
      Top = 10
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = buttonCancelarClick
    end
  end
end
