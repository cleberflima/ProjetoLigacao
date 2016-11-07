object dm: Tdm
  OldCreateOrder = False
  Height = 233
  Width = 282
  object db: TIBDatabase
    Connected = True
    DatabaseName = 'd:\db\ligacao.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = tr
    ServerType = 'IBServer'
    Left = 8
    Top = 8
  end
  object tr: TIBTransaction
    Active = True
    DefaultDatabase = db
    Left = 48
    Top = 8
  end
  object qryCliente: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    Left = 192
    Top = 72
  end
  object dsCliente: TDataSource
    DataSet = datCliente
    Left = 16
    Top = 72
  end
  object datCliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 72
    Top = 72
    object datClienteCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = '"CLIENTE"."CLIENTE_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object datClienteNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 30
    end
    object datClienteTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIENTE"."TELEFONE"'
      Size = 11
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = qryCliente
    Left = 136
    Top = 72
  end
end
