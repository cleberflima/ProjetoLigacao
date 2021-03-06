object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 422
  Width = 475
  object db: TIBDatabase
    DatabaseName = 'ligacao.fdb'
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
    Left = 216
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
    AfterDelete = datClienteAfterPost
    Left = 88
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
    Left = 152
    Top = 64
  end
  object sqlGenCliente: TIBSQL
    Database = db
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_CLIENTE_ID, 1) AS GEN_CLIENTE_ID FROM RDB$DATA' +
        'BASE')
    Transaction = tr
    Left = 288
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
    AfterDelete = datHistoricoAfterPost
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
  object dsMovLig: TDataSource
    DataSet = datMovLig
    Left = 24
    Top = 176
  end
  object datMovLig: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovLig'
    AfterInsert = datMovLigAfterInsert
    AfterPost = datMovLigAfterPost
    AfterDelete = datMovLigAfterPost
    Left = 88
    Top = 176
    object datMovLigMOV_LIG_ID: TIntegerField
      FieldName = 'MOV_LIG_ID'
      Origin = '"MOV_LIG"."MOV_LIG_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object datMovLigCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = '"MOV_LIG"."CLIENTE_ID"'
    end
    object datMovLigDATA_LIG: TDateTimeField
      FieldName = 'DATA_LIG'
      Origin = '"MOV_LIG"."DATA_LIG"'
    end
  end
  object dspMovLig: TDataSetProvider
    DataSet = qryMovLig
    Left = 152
    Top = 176
  end
  object qryMovLig: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from MOV_LIG')
    Left = 216
    Top = 176
  end
  object qryMovDet: TIBQuery
    Database = db
    Transaction = tr
    BeforeOpen = qryMovDetBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM MOV_DETALHE'
      'WHERE MOV_DETALHE_ID IS NOT NULL'
      '    AND MOV_LIG_ID = :MOV_LIG_ID')
    Left = 216
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MOV_LIG_ID'
        ParamType = ptUnknown
      end>
  end
  object sqlGenMovDet: TIBSQL
    Database = db
    SQL.Strings = (
      'SELECT GEN_ID(GEN_MOV_DETALHE, 1) AS ID_GERADO FROM RDB$DATABASE')
    Transaction = tr
    Left = 288
    Top = 232
  end
  object datMovDet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovDet'
    AfterInsert = datMovDetAfterInsert
    AfterPost = datMovDetAfterPost
    AfterDelete = datMovDetAfterPost
    Left = 88
    Top = 232
    object datMovDetMOV_DETALHE_ID: TIntegerField
      FieldName = 'MOV_DETALHE_ID'
      Origin = '"MOV_DETALHE"."MOV_DETALHE_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object datMovDetMOV_LIG_ID: TIntegerField
      FieldName = 'MOV_LIG_ID'
      Origin = '"MOV_DETALHE"."MOV_LIG_ID"'
      Required = True
    end
    object datMovDetHISTORICO_ID: TIntegerField
      FieldName = 'HISTORICO_ID'
      Origin = '"MOV_DETALHE"."HISTORICO_ID"'
    end
    object datMovDetOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Origin = '"MOV_DETALHE"."OBSERVACAO"'
      Size = 60
    end
    object datMovDetHISTORICO: TStringField
      FieldKind = fkLookup
      FieldName = 'HISTORICO'
      LookupDataSet = datHistorico
      LookupKeyFields = 'HISTORICO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'HISTORICO_ID'
      ProviderFlags = [pfInWhere]
      Size = 30
      Lookup = True
    end
  end
  object dsMovDet: TDataSource
    DataSet = datMovDet
    Left = 24
    Top = 232
  end
  object dspMovDet: TDataSetProvider
    DataSet = qryMovDet
    Left = 152
    Top = 232
  end
  object datTodosClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = datClienteAfterInsert
    AfterPost = datClienteAfterPost
    Left = 376
    Top = 64
    object IntegerField1: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = '"CLIENTE"."CLIENTE_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 30
    end
    object WideStringField2: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIENTE"."TELEFONE"'
      Size = 11
    end
  end
  object datTodosHistoricos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = datHistoricoAfterInsert
    AfterPost = datHistoricoAfterPost
    Left = 376
    Top = 120
    object IntegerField2: TIntegerField
      FieldName = 'HISTORICO'
      Origin = '"HISTORICO"."HISTORICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object WideStringField3: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"HISTORICO"."DESCRICAO"'
      Size = 30
    end
    object WideStringField4: TWideStringField
      FieldName = 'TIPO_LIG'
      Origin = '"HISTORICO"."TIPO_LIG"'
      FixedChar = True
      Size = 1
    end
  end
  object sqlGenMovLig: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT GEN_ID(gen_mov_lig, 1) as gen_mov_lig'
      'FROM RDB$DATABASE')
    Left = 288
    Top = 176
  end
  object qryConsulta: TIBQuery
    Database = db
    Transaction = tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT'
      ' MDET.MOV_DETALHE_ID,'
      ' CL.NOME,'
      ' MLIG.DATA_LIG,'
      ' MDET.OBSERVACAO,'
      ' HIST.DESCRICAO,'
      ' HIST.TIPO_LIG'
      'FROM MOV_DETALHE MDET'
      'LEFT JOIN MOV_LIG MLIG ON MLIG.MOV_LIG_ID = MDET.MOV_LIG_ID'
      'LEFT JOIN CLIENTE CL ON CL.CLIENTE_ID = MLIG.CLIENTE_ID'
      'LEFT JOIN HISTORICO HIST ON HIST.HISTORICO = MDET.HISTORICO_ID'
      'WHERE   MDET.MOV_DETALHE_ID IS NOT NULL')
    Left = 216
    Top = 296
  end
  object datConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 88
    Top = 296
    object datConsultaMOV_DETALHE_ID: TIntegerField
      FieldName = 'MOV_DETALHE_ID'
      Origin = '"MOV_DETALHE"."MOV_DETALHE_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object datConsultaNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 30
    end
    object datConsultaDATA_LIG: TDateTimeField
      FieldName = 'DATA_LIG'
      Origin = '"MOV_LIG"."DATA_LIG"'
      DisplayFormat = 'dd/MM/yyyy hh:nn:ss'
    end
    object datConsultaOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Origin = '"MOV_DETALHE"."OBSERVACAO"'
      Size = 60
    end
    object datConsultaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"HISTORICO"."DESCRICAO"'
      Size = 30
    end
    object datConsultaTIPO_LIG: TWideStringField
      FieldName = 'TIPO_LIG'
      Origin = '"HISTORICO"."TIPO_LIG"'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta: TDataSource
    DataSet = datConsulta
    Left = 24
    Top = 296
  end
  object dspConsulta: TDataSetProvider
    DataSet = qryConsulta
    Left = 152
    Top = 296
  end
end
