object dmData: TdmData
  OldCreateOrder = False
  Height = 310
  Width = 342
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Lectures\201508_mobile_iot\resource\EMPLOYEE.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 32
    Top = 88
    object FDQuery1IDX: TFDAutoIncField
      FieldName = 'IDX'
      Origin = 'IDX'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQuery1NAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 16
    end
    object FDQuery1TITLE: TStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      Size = 50
    end
    object FDQuery1PHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 30
    end
    object FDQuery1IMAGE: TBlobField
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
    end
    object FDQuery1THUMB: TBlobField
      FieldName = 'THUMB'
      Origin = 'THUMB'
    end
    object FDQuery1SITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 100
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    ScreenCursor = gcrDefault
    Left = 56
    Top = 160
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 56
    Top = 216
  end
end
