object FormMain: TFormMain
  Left = 0
  Top = 0
  ClientHeight = 599
  ClientWidth = 983
  Caption = 'FormMain'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
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
  object UniTreeMenu1: TUniTreeMenu
    Left = 0
    Top = 0
    Width = 249
    Height = 599
    Hint = ''
    Items.FontData = {0100000000}
    SourceMenu = UniMenuItems1
  end
  object UniMenuItems1: TUniMenuItems
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
    object MenuManutencaoVeiculos: TUniMenuItem
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 3
      object subVeiculo: TUniMenuItem
        Caption = 'Ve'#237'culo'
        ImageIndex = 3
        OnClick = subVeiculoClick
      end
      object subEntrada: TUniMenuItem
        Caption = 'Entrada'
        ImageIndex = 5
        OnClick = subEntradaClick
      end
      object subVenda: TUniMenuItem
        Caption = 'Venda'
        ImageIndex = 7
        OnClick = subVendaClick
      end
      object subGastos: TUniMenuItem
        Caption = 'Gasto'
        ImageIndex = 2
        OnClick = subGastosClick
      end
    end
    object menuFinanceiro: TUniMenuItem
      Caption = 'Financeiro'
      ImageIndex = 10
      object subContasReceber: TUniMenuItem
        Caption = 'Contas a Receber'
        ImageIndex = 11
        OnClick = subContasReceberClick
      end
    end
    object menuSimulador: TUniMenuItem
      Caption = 'Simulador'
      ImageIndex = 6
      OnClick = menuSimuladorClick
    end
    object menuSair: TUniMenuItem
      Caption = 'Sair'
      ImageIndex = 8
      OnClick = menuSairClick
    end
  end
end
