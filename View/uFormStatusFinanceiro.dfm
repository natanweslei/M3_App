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
    Left = 231
    Top = 174
    Width = 90
    Height = 28
    Hint = ''
    Caption = 'Confirmar'
    TabOrder = 1
    Images = UniMainModule.ImageListMain
    ImageIndex = 14
    OnClick = buttonConfirmarClick
  end
  object buttonCancelar: TUniButton
    Left = 24
    Top = 174
    Width = 90
    Height = 28
    Hint = ''
    Caption = 'Cancelar'
    TabOrder = 2
    Images = UniMainModule.ImageListMain
    ImageIndex = 15
    OnClick = buttonCancelarClick
  end
end
