object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 506
  Top = 163
  Height = 150
  Width = 215
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\User\Downloads\libmysql.dll'
    Left = 24
    Top = 40
  end
  object zqrysatuan: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 88
    Top = 8
  end
  object dssatuan: TDataSource
    DataSet = zqrysatuan
    Left = 88
    Top = 64
  end
end
