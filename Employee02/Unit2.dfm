object dmData: TdmData
  OldCreateOrder = False
  Height = 253
  Width = 317
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Lectures\201508_mobile_iot\resource\EMPLOYEE.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 48
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 152
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 88
  end
end
