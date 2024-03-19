object FormMain: TFormMain
  Left = 0
  Top = 0
  ClientHeight = 599
  ClientWidth = 983
  Caption = 'FormMain'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMain: TUniPageControl
    Left = 249
    Top = 0
    Width = 734
    Height = 599
    Hint = ''
    ActivePage = TabSheetMain
    Align = alClient
    TabOrder = 0
    object TabSheetMain: TUniTabSheet
      Hint = ''
      Caption = 'Home'
    end
  end
  object UniTreeMenu: TUniTreeMenu
    Left = 0
    Top = 0
    Width = 249
    Height = 599
    Hint = ''
    Items.FontData = {0100000000}
    SourceMenu = UniMenuItems
  end
  object UniMenuItems: TUniMenuItems
    Images = UniMainModule.ImageListMain
    Left = 36
    Top = 520
    object menuCadastro: TUniMenuItem
      Caption = 'Cadastro'
      ImageIndex = 9
      object submenuEmpresa: TUniMenuItem
        Caption = 'Empresa'
        ImageIndex = 0
        OnClick = submenuEmpresaClick
      end
      object submenuPessoa: TUniMenuItem
        Caption = 'Pessoa'
        ImageIndex = 1
        OnClick = submenuPessoaClick
      end
      object submenuTipoGasto: TUniMenuItem
        Caption = 'Tipo de Gasto'
        ImageIndex = 2
        OnClick = submenuTipoGastoClick
      end
    end
    object MenuManutencao: TUniMenuItem
      Caption = 'Manuten'#231#227'o'
      GroupIndex = 1
      ImageIndex = 3
      object submenuVeiculo: TUniMenuItem
        Caption = 'Ve'#237'culo'
        ImageIndex = 3
        OnClick = submenuVeiculoClick
      end
      object submenuEntrada: TUniMenuItem
        Caption = 'Entrada'
        ImageIndex = 5
        Visible = False
        OnClick = submenuEntradaClick
      end
      object submenuVenda: TUniMenuItem
        Caption = 'Venda'
        ImageIndex = 7
        OnClick = submenuVendaClick
      end
      object submenuGastos: TUniMenuItem
        Caption = 'Gasto'
        ImageIndex = 2
        OnClick = submenuGastosClick
      end
    end
    object menuFinanceiro: TUniMenuItem
      Caption = 'Financeiro'
      GroupIndex = 2
      ImageIndex = 10
      object submenuContasReceber: TUniMenuItem
        Caption = 'Contas a Receber'
        ImageIndex = 11
        OnClick = submenuContasReceberClick
      end
    end
    object menuSimulador: TUniMenuItem
      Caption = 'Simulador'
      GroupIndex = 3
      ImageIndex = 6
      OnClick = menuSimuladorClick
    end
    object menuSair: TUniMenuItem
      Caption = 'Sair'
      GroupIndex = 4
      ImageIndex = 8
      OnClick = menuSairClick
    end
  end
end
