object FormStatusFinanceiro: TFormStatusFinanceiro
  Left = 0
  Top = 0
  ClientHeight = 210
  ClientWidth = 343
  Caption = 'Status Financeiro'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object radioStatusFinanceiro: TUniRadioGroup
    Left = 24
    Top = 16
    Width = 297
    Height = 145
    Hint = ''
    Items.Strings = (
      'ABERTO'
      'VENCIDO'
      'PAGO')
    Caption = 'Status Financeiro'
    TabOrder = 0
  end
  object buttonConfirmar: TUniButton
    Left = 24
    Top = 177
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = buttonConfirmarClick
  end
  object buttonCancelar: TUniButton
    Left = 246
    Top = 177
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = buttonCancelarClick
  end
end
