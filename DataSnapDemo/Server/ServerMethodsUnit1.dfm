object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 282
  Width = 378
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\16.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 56
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 184
    Top = 56
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 280
    Top = 56
  end
  object dspEmployee: TDataSetProvider
    DataSet = FDQuery1
    Left = 56
    Top = 160
  end
end
