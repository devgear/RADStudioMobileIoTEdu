object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 306
  Width = 354
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
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 32
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 184
    Top = 96
  end
  object dspEmployee: TDataSetProvider
    DataSet = FDQuery1
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 56
    Top = 200
  end
end
