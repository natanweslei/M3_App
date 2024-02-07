inherited FormModalSimulador: TFormModalSimulador
  ClientHeight = 350
  ClientWidth = 395
  Caption = 'FormModalSimulador'
  OnShow = UniFormShow
  ExplicitWidth = 395
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelBotoes: TUniPanel
    Top = 305
    Width = 395
    ExplicitTop = 305
    ExplicitWidth = 400
    inherited buttonCancelar: TUniButton
      Left = 43
      Top = 12
      Visible = False
      ExplicitLeft = 43
      ExplicitTop = 12
    end
    inherited buttonNovo: TUniButton
      Visible = False
    end
    inherited buttonGravar: TUniButton
      Left = 3
      Top = 14
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 14
    end
    inherited buttonExcluir: TUniButton
      Left = 0
      Top = 3
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 3
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
    TabOrder = 1
    object editTaxa: TUniNumberEdit
      Left = 32
      Top = 124
      Width = 315
      Hint = ''
      TabOrder = 3
      BlankValue = 0
      FieldLabel = 'Taxa (a.m)'
      FieldLabelWidth = 130
      FieldLabelAlign = laRight
      DecimalPrecision = 6
      DecimalSeparator = ','
      OnExit = editValorVeiculoExit
    end
    object editValorParcela: TUniNumberEdit
      Left = 32
      Top = 216
      Width = 315
      Hint = ''
      TabOrder = 4
      ReadOnly = True
      FieldLabel = 'Valor da Parcela'
      FieldLabelWidth = 130
      FieldLabelAlign = laRight
      DecimalSeparator = ','
    end
    object editValorVeiculo: TUniNumberEdit
      Left = 32
      Top = 64
      Width = 315
      Hint = ''
      TabOrder = 1
      MaxValue = 900000.000000000000000000
      MinValue = 1.000000000000000000
      BlankValue = 0
      FieldLabel = 'Valor do Ve'#237'culo'
      FieldLabelWidth = 130
      FieldLabelAlign = laRight
      DecimalUseOSDefault = True
      OnExit = editValorVeiculoExit
    end
    object editQuantidadeParcelas: TUniNumberEdit
      Left = 32
      Top = 95
      Width = 315
      Hint = ''
      TabOrder = 2
      Value = 1.000000000000000000
      MaxValue = 500.000000000000000000
      MinValue = 1.000000000000000000
      BlankValue = 0
      FieldLabel = 'Quantidade de Parcelas'
      FieldLabelWidth = 130
      DecimalSeparator = ','
      OnExit = editValorVeiculoExit
    end
  end
end
