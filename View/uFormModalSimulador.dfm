inherited FormModalSimulador: TFormModalSimulador
  ClientHeight = 350
  ClientWidth = 395
  Caption = 'FormModalSimulador'
  ActiveControl = editValorVeiculo
  ExplicitWidth = 395
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    Top = 305
    Width = 395
    TabOrder = 1
    ExplicitTop = 305
    ExplicitWidth = 395
    inherited buttonCancelar: TUniButton
      Left = 40
      Visible = False
      ExplicitLeft = 40
    end
    inherited buttonNovo: TUniButton
      Left = 19
      Visible = False
      ExplicitLeft = 19
    end
    inherited buttonGravar: TUniButton
      Left = 40
      Visible = False
      ExplicitLeft = 40
    end
    inherited buttonExcluir: TUniButton
      Left = 48
      Visible = False
      ExplicitLeft = 48
    end
    inherited buttonFechar: TUniButton
      Left = 311
      Top = 8
      ExplicitLeft = 311
      ExplicitTop = 8
    end
  end
  object groupSimulador: TUniGroupBox [1]
    Left = 8
    Top = 8
    Width = 377
    Height = 297
    Hint = ''
    Caption = 'Simulador'
    TabOrder = 0
    object editQuantidadeParcelas: TUniFormattedNumberEdit
      Left = 40
      Top = 84
      Width = 297
      Hint = ''
      TabOrder = 1
      SelectOnFocus = True
      FieldLabel = 'Parcelas'
      FieldLabelAlign = laRight
      DecimalPrecision = 0
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editTaxa: TUniFormattedNumberEdit
      Left = 40
      Top = 112
      Width = 297
      Hint = ''
      TabOrder = 2
      SelectOnFocus = True
      FieldLabel = 'Taxa (a.m)'
      FieldLabelAlign = laRight
      DecimalPrecision = 5
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnKeyUp = editValorVeiculoKeyUp
    end
    object editValorParcela: TUniFormattedNumberEdit
      Left = 40
      Top = 160
      Width = 297
      Hint = ''
      BorderStyle = ubsNone
      TabOrder = 3
      ReadOnly = True
      FieldLabel = 'Valor da Parcela'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object editValorVeiculo: TUniFormattedNumberEdit
      Left = 40
      Top = 56
      Width = 297
      Hint = ''
      BodyRTL = False
      TabOrder = 0
      SelectOnFocus = True
      FieldLabel = 'Valor do Ve'#237'culo'
      FieldLabelAlign = laRight
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnKeyUp = editValorVeiculoKeyUp
    end
  end
end
