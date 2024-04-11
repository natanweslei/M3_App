object UniMainModule: TUniMainModule
  OldCreateOrder = False
  Theme = 'gray'
  MonitoredKeys.Keys = <>
  Height = 604
  Width = 800
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=garagem'
      'User_Name=postgres'
      'Password=0207'
      'Server=192.168.1.129'
      'DriverID=PG')
    Left = 104
    Top = 96
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\M3_App\lib\libpq.dll'
    Left = 232
    Top = 96
  end
  object dsCadastroVeiculo: TDataSource
    DataSet = queryCadastroVeiculo
    Left = 96
    Top = 280
  end
  object dsCadastroPessoa: TDataSource
    AutoEdit = False
    DataSet = queryCadastroPessoa
    Left = 97
    Top = 432
  end
  object queryCadastroPessoa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pessoa')
    Left = 97
    Top = 360
  end
  object queryCadastroVeiculo: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from veiculo')
    Left = 96
    Top = 208
  end
  object dsCadastroTipoGasto: TDataSource
    AutoEdit = False
    DataSet = queryCadastroTipoGasto
    Left = 233
    Top = 280
  end
  object queryCadastroTipoGasto: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from tipo_gasto')
    Left = 233
    Top = 208
  end
  object ImageListMain: TUniNativeImageList
    Left = 368
    Top = 96
    Images = {
      12000000000000000608000000686F6D653B66613B0000000006080000007573
      65723B66613B00000000060C000000696E6475737472793B66613B0000000006
      070000006361723B66613B00000000060C00000073657474696E67733B66613B
      00000000060A000000696E626F783B66615F3B0000000006090000006D6F6E65
      793B66613B00000000061200000073686F7070696E672D636172743B66615F3B
      00000000060C0000007369676E2D6F75743B66613B00000000060B000000666F
      6C6465723B66615F3B00000000060A000000646F6C6C61723B66613B00000000
      06080000006575726F3B66613B000000000612000000616464726573732D6361
      72642D6F3B66613B00000000060A000000696D6167653B66615F3B0000000006
      0A000000636865636B3B66615F3B00000000060800000062616E3B66615F3B00
      000000060B0000007369676E616C3B66615F3B0000000006090000006C6F636B
      3B66615F3B}
  end
  object queryCadastroEmpresa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from empresa')
    Left = 385
    Top = 208
  end
  object dsCadastroEmpresa: TDataSource
    AutoEdit = False
    DataSet = queryCadastroEmpresa
    Left = 385
    Top = 280
  end
  object dsCadastroVendedor: TDataSource
    AutoEdit = False
    DataSet = queryCadastroVendedor
    Left = 233
    Top = 433
  end
  object queryCadastroVendedor: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pessoa where vendedor')
    Left = 233
    Top = 360
  end
  object dsAcessoOperador: TDataSource
    AutoEdit = False
    DataSet = queryAcessoOperador
    Left = 377
    Top = 433
  end
  object queryAcessoOperador: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pessoa where vendedor')
    Left = 377
    Top = 360
  end
end
