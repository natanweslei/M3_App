object FormModalModelo: TFormModalModelo
  Left = 0
  Top = 0
  ClientHeight = 557
  ClientWidth = 798
  Caption = 'Modelo'
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = UniFormClose
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
      Images = imageListFormModalModelo
      ImageIndex = 3
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
      Images = imageListFormModalModelo
      ImageIndex = 0
      OnClick = buttonNovoClick
    end
    object buttonGravar: TUniButton
      AlignWithMargins = True
      Left = 147
      Top = 3
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Gravar'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 3
      Images = imageListFormModalModelo
      ImageIndex = 1
      OnClick = buttonGravarClick
    end
    object buttonExcluir: TUniButton
      AlignWithMargins = True
      Left = 283
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Excluir'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 4
      Images = imageListFormModalModelo
      ImageIndex = 2
      OnClick = buttonExcluirClick
    end
    object buttonFechar: TUniButton
      Left = 696
      Top = 6
      Width = 75
      Height = 30
      Hint = ''
      Caption = 'Fechar'
      TabOrder = 5
      Images = imageListFormModalModelo
      ImageIndex = 4
      OnClick = buttonFecharClick
    end
  end
  object dsManutencao: TDataSource
    DataSet = queryManutencao
    OnStateChange = dsManutencaoStateChange
    Left = 696
    Top = 248
  end
  object queryManutencao: TFDQuery
    Connection = UniMainModule.Conexao
    Left = 696
    Top = 168
  end
  object imageListFormModalModelo: TUniNativeImageList
    Left = 699
    Top = 323
    Images = {
      0500000000000000060800000066696C653B66613B000000000610000000706C
      61792D636972636C653B66615F3B00000000060900000074726173683B66613B
      00000000060700000062616E3B66613B00000000060C0000007369676E2D6F75
      743B66613B}
  end
end
