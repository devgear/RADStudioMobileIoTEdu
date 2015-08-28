object dmData: TdmData
  OldCreateOrder = False
  Height = 263
  Width = 409
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Lectures\201508_mobile_iot\resource\EMPLOYEE.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 48
    Top = 24
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 48
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 160
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 160
    Top = 104
  end
end
