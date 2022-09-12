object IbDM: TIbDM
  OldCreateOrder = False
  Left = 573
  Top = 251
  Height = 281
  Width = 141
  object IBDatabase: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 40
    Top = 40
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 40
    Top = 88
  end
  object Query1: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 136
  end
end
