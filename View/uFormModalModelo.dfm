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
    DesignSize = (
      798
      45)
    object buttonCancelar: TUniButton
      AlignWithMargins = True
      Left = 419
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = buttonCancelarClick
    end
    object buttonNovo: TUniButton
      AlignWithMargins = True
      Left = 11
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Novo'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
    end
    object buttonGravar: TUniButton
      AlignWithMargins = True
      Left = 147
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Gravar'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 3
      OnClick = buttonGravarClick
    end
    object buttonExcluir: TUniButton
      AlignWithMargins = True
      Left = 283
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Exluir'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 4
    end
  end
  object scrollModelo: TUniScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 792
    Height = 506
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 454
  end
  object dsManutencao: TDataSource
    DataSet = queryManutencao
    Left = 728
    Top = 248
  end
  object queryManutencao: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 728
    Top = 168
  end
end
