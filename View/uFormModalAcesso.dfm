object FormModalAcesso: TFormModalAcesso
  Left = 0
  Top = 0
  ClientHeight = 558
  ClientWidth = 799
  Caption = 'Acesso'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  BorderIcons = []
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object panelBotoes: TUniPanel
    Left = 0
    Top = 513
    Width = 799
    Height = 45
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    DesignSize = (
      799
      45)
    object buttonCancelar: TUniButton
      AlignWithMargins = True
      Left = 523
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
    object buttonGravar: TUniButton
      AlignWithMargins = True
      Left = 387
      Top = 6
      Width = 130
      Height = 30
      Hint = ''
      Caption = 'Gravar'
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Images = imageListFormModalModelo
      ImageIndex = 1
      OnClick = buttonGravarClick
    end
    object buttonFechar: TUniButton
      Left = 688
      Top = 6
      Width = 100
      Height = 30
      Hint = ''
      Caption = 'Fechar'
      TabOrder = 3
      Images = imageListFormModalModelo
      ImageIndex = 4
      OnClick = buttonFecharClick
    end
  end
  object UniDBCheckBox1: TUniDBCheckBox
    Left = 24
    Top = 72
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'cadastro_empresa'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Cadastro Empresa'
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox2: TUniDBCheckBox
    Left = 24
    Top = 95
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'cadastro_pessoa'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Cadastro Pessoa'
    TabOrder = 2
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox3: TUniDBCheckBox
    Left = 24
    Top = 118
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'cadastro_tipo_gasto'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Cadastro Tipo de Gasto'
    TabOrder = 3
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox4: TUniDBCheckBox
    Left = 24
    Top = 141
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'manutencao_veiculo'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Manuten'#231#227'o de Ve'#237'culo'
    TabOrder = 4
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox5: TUniDBCheckBox
    Left = 24
    Top = 164
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'manutencao_entrada'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Manuten'#231#227'o de Entrada'
    TabOrder = 5
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox6: TUniDBCheckBox
    Left = 24
    Top = 187
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'manutencao_venda'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Manuten'#231#227'o de Venda'
    TabOrder = 6
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox7: TUniDBCheckBox
    Left = 24
    Top = 210
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'manutencao_gasto'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Manuten'#231#227'o de Gasto'
    TabOrder = 7
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox8: TUniDBCheckBox
    Left = 24
    Top = 233
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'manutencao_contas_receber'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Manuten'#231#227'o de Contas a Receber'
    TabOrder = 8
    ParentColor = False
    Color = clBtnFace
  end
  object UniDBCheckBox9: TUniDBCheckBox
    Left = 24
    Top = 256
    Width = 200
    Height = 17
    Hint = ''
    DataField = 'simulador'
    DataSource = dsManutencao
    ValueChecked = 'true'
    Caption = 'Simulador'
    TabOrder = 9
    ParentColor = False
    Color = clBtnFace
  end
  object comboPessoa: TUniDBLookupComboBox
    Left = 24
    Top = 15
    Width = 401
    Hint = ''
    ListField = 'pessoa_id;nome'
    ListSource = UniMainModule.dsCadastroPessoa
    KeyField = 'pessoa_id'
    ListFieldIndex = 0
    ClearButton = True
    DataField = 'pessoa_id'
    DataSource = dsManutencao
    TabOrder = 10
    ReadOnly = True
    Color = clWindow
    FieldLabel = 'Operador'
    FieldLabelAlign = laTop
    ForceSelection = True
  end
  object checkAlertaFinanceiroVencido: TUniDBCheckBox
    Left = 387
    Top = 72
    Width = 174
    Height = 17
    Hint = ''
    DataField = 'alerta_financeiro_vencido'
    DataSource = dsManutencao
    ValueChecked = 'true'
    ValueUnchecked = 'false'
    Caption = 'Alerta Finaneiro Vencido'
    TabOrder = 11
    ParentColor = False
    Color = clBtnFace
  end
  object dsManutencao: TDataSource
    DataSet = queryManutencao
    OnStateChange = dsManutencaoStateChange
    Left = 696
    Top = 248
  end
  object queryManutencao: TFDQuery
    OnNewRecord = queryManutencaoNewRecord
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
