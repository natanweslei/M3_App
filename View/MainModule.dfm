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
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
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
    Left = 233
    Top = 280
  end
  object queryCadastroPessoa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pessoa')
    Left = 233
    Top = 208
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
    Left = 369
    Top = 280
  end
  object queryCadastroTipoGasto: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pessoa')
    Left = 369
    Top = 208
  end
end
