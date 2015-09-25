object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 300
  Width = 391
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Lectures\201508_mobile_iot\resource\EMPLOYEE.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 56
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 56
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 304
    Top = 40
  end
  object dspEmployee: TDataSetProvider
    DataSet = FDQuery1
    Left = 56
    Top = 184
  end
end
