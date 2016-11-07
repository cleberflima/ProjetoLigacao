object dm: Tdm
  OldCreateOrder = False
  Height = 233
  Width = 412
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
    Left = 24
    Top = 16
  end
  object tr: TIBTransaction
    Active = True
    DefaultDatabase = db
    Left = 64
    Top = 16
  end
  object qryCliente: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'WHERE CLIENTE_ID IS NOT NULL')
    Left = 200
    Top = 64
  end
  object dsCliente: TDataSource
    DataSet = datCliente
    Left = 24
    Top = 64
  end
  object datCliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    AfterInsert = datClienteAfterInsert
    AfterPost = datClienteAfterPost
    Left = 80
    Top = 64
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
    Left = 144
    Top = 64
  end
  object sqlGenCliente: TIBSQL
    Database = db
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_CLIENTE_ID, 1) AS GEN_CLIENTE_ID FROM RDB$DATA' +
        'BASE')
    Transaction = tr
    Left = 264
    Top = 64
  end
  object qryHistorico: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM HISTORICO'
      'WHERE HISTORICO.HISTORICO IS NOT NULL')
    Left = 216
    Top = 120
  end
  object dsHistorico: TDataSource
    DataSet = datHistorico
    Left = 24
    Top = 120
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Left = 152
    Top = 120
  end
  object sqlGenHistorico: TIBSQL
    Database = db
    SQL.Strings = (
      'SELECT GEN_ID(GEN_HISTORICO, 1) AS ID_GERADO FROM RDB$DATABASE')
    Transaction = tr
    Left = 288
    Top = 120
  end
  object datHistorico: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico'
    AfterInsert = datHistoricoAfterInsert
    AfterPost = datHistoricoAfterPost
    Left = 88
    Top = 120
    object datHistoricoHISTORICO: TIntegerField
      FieldName = 'HISTORICO'
      Origin = '"HISTORICO"."HISTORICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object datHistoricoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"HISTORICO"."DESCRICAO"'
      Size = 30
    end
    object datHistoricoTIPO_LIG: TWideStringField
      FieldName = 'TIPO_LIG'
      Origin = '"HISTORICO"."TIPO_LIG"'
      FixedChar = True
      Size = 1
    end
  end
end
