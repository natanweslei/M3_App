object UniMainModule: TUniMainModule
  OldCreateOrder = False
  Theme = 'gray'
  MonitoredKeys.Keys = <>
  Height = 328
  Width = 401
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=garagem'
      'User_Name=postgres'
      'Password=0207'
      'Server=127.0.0.1'
      'DriverID=PG')
    Left = 72
    Top = 96
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\M3_App\lib\libpq.dll'
    Left = 184
    Top = 96
  end
end
