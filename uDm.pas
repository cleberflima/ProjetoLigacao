unit uDm;

interface

uses
  System.SysUtils, System.Classes, Dialogs, IBX.IBDatabase, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBSQL;

const SQL_CLIENTE : string = 'SELECT * FROM CLIENTE' + #13#10 + 'WHERE CLIENTE_ID IS NOT NULL';
const SQL_HISTORICO : string = 'SELECT * FROM HISTORICO' + #13#10 + 'WHERE HISTORICO.HISTORICO IS NOT NULL';
const SQL_CONSULTA : string = 'SELECT ' + #13#10 +
                              '   MDET.MOV_DETALHE_ID, ' + #13#10 +
                              '   CL.NOME, ' + #13#10 +
                              '   MLIG.DATA_LIG, ' + #13#10 +
                              '   MDET.OBSERVACAO, ' + #13#10 +
                              '   HIST.DESCRICAO, ' + #13#10 +
                              '   HIST.TIPO_LIG ' + #13#10 +
                              'FROM MOV_DETALHE MDET ' + #13#10 +
                              'LEFT JOIN MOV_LIG MLIG ON MLIG.MOV_LIG_ID = MDET.MOV_LIG_ID ' + #13#10 +
                              'LEFT JOIN CLIENTE CL ON CL.CLIENTE_ID = MLIG.CLIENTE_ID ' + #13#10 +
                              'LEFT JOIN HISTORICO HIST ON HIST.HISTORICO = MDET.HISTORICO_ID ' + #13#10 +
                              'WHERE MDET.MOV_DETALHE_ID IS NOT NULL ';

  FMT_FIREBIRD_DATA : string = 'MM/dd/yyyy';

type
  Tdm = class(TDataModule)
    db: TIBDatabase;
    tr: TIBTransaction;
    qryCliente: TIBQuery;
    dsCliente: TDataSource;
    datCliente: TClientDataSet;
    dspCliente: TDataSetProvider;
    datClienteCLIENTE_ID: TIntegerField;
    datClienteNOME: TWideStringField;
    datClienteTELEFONE: TWideStringField;
    sqlGenCliente: TIBSQL;
    qryHistorico: TIBQuery;
    dsHistorico: TDataSource;
    dspHistorico: TDataSetProvider;
    sqlGenHistorico: TIBSQL;
    datHistorico: TClientDataSet;
    datHistoricoHISTORICO: TIntegerField;
    datHistoricoDESCRICAO: TWideStringField;
    datHistoricoTIPO_LIG: TWideStringField;
    dsMovLig: TDataSource;
    datMovLig: TClientDataSet;
    dspMovLig: TDataSetProvider;
    qryMovLig: TIBQuery;
    qryMovDet: TIBQuery;
    sqlGenMovDet: TIBSQL;
    datMovDet: TClientDataSet;
    dsMovDet: TDataSource;
    dspMovDet: TDataSetProvider;
    datMovDetMOV_DETALHE_ID: TIntegerField;
    datMovDetMOV_LIG_ID: TIntegerField;
    datMovDetHISTORICO_ID: TIntegerField;
    datMovDetOBSERVACAO: TWideStringField;
    datMovDetHISTORICO: TStringField;
    datTodosClientes: TClientDataSet;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    datTodosHistoricos: TClientDataSet;
    IntegerField2: TIntegerField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    datMovLigMOV_LIG_ID: TIntegerField;
    datMovLigCLIENTE_ID: TIntegerField;
    datMovLigDATA_LIG: TDateTimeField;
    sqlGenMovLig: TIBQuery;
    qryConsulta: TIBQuery;
    datConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    dspConsulta: TDataSetProvider;
    datConsultaMOV_DETALHE_ID: TIntegerField;
    datConsultaNOME: TWideStringField;
    datConsultaDATA_LIG: TDateTimeField;
    datConsultaOBSERVACAO: TWideStringField;
    datConsultaDESCRICAO: TWideStringField;
    datConsultaTIPO_LIG: TWideStringField;
    procedure datClienteAfterInsert(DataSet: TDataSet);
    procedure datClienteAfterPost(DataSet: TDataSet);
    procedure datHistoricoAfterInsert(DataSet: TDataSet);
    procedure datHistoricoAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure datMovDetAfterInsert(DataSet: TDataSet);
    procedure qryMovDetBeforeOpen(DataSet: TDataSet);
    procedure datMovLigAfterInsert(DataSet: TDataSet);
    procedure datMovLigAfterPost(DataSet: TDataSet);
    procedure datMovDetAfterPost(DataSet: TDataSet);
    procedure datHistoricoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FClienteId : Integer;
    FDataHoraLigacao : TDateTime;
    FMovLigId   : Integer;
    procedure resetQrySql(const sql:string; qry:TIBQuery); //restaura a sql qryCliente.sql para SQL_CLIENTE
    procedure addWhere(qry:TIBQuery; s: string);           //adiciona 'AND s' no qry.sql
    procedure openDat(dat: TClientDataSet);                //Fecha e abre a o datset recarregando a consulta que est� no qryCliente.sql
    procedure commit;                                      //Aplica as pend�ncias no banco contida na transa��o tr.
    function getGeneratorCliente: Integer;                 //Fun��o que pega o pr�ximo generator da tabela CLIENTE
    function getGeneratorHistorico: Integer;               //Fun��o que pega o pr�ximo generator da tabela HISTORICO
    function getGeneratorMovLigacao: Integer;              //Fun��o que pega o pr�ximo generator da tabela MOV_LIG
    function getGeneratorMovDetalhe: Integer;              //Fun��o que pega o pr�ximo generator da tabela MOV_DETALHE

  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdm }


procedure Tdm.addWhere(qry: TIBQuery; s: string);
begin
  qry.SQL.Add('AND ' + s);
end;

procedure Tdm.commit;
begin
  try
    tr.Commit;
  finally
    if not tr.InTransaction then
      tr.StartTransaction;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  db.Open;
  tr.Active := True;
  datCliente.Open;
  datHistorico.Open;
  datMovLig.Open;
  datMovDet.Open;
  datConsulta.Open;
  datTodosClientes.CloneCursor(datCliente,False,True);
  datTodosHistoricos.CloneCursor(datHistorico, False, True);
end;

procedure Tdm.datClienteAfterInsert(DataSet: TDataSet);
begin
  datClienteCLIENTE_ID.Value := getGeneratorCliente;
end;

procedure Tdm.datClienteAfterPost(DataSet: TDataSet);
begin
  datCliente.ApplyUpdates(0);
  commit;
end;

procedure Tdm.datHistoricoAfterDelete(DataSet: TDataSet);
begin
  commit;
end;

procedure Tdm.datHistoricoAfterInsert(DataSet: TDataSet);
begin
  datHistoricoHISTORICO.Value := getGeneratorHistorico;
end;

procedure Tdm.datHistoricoAfterPost(DataSet: TDataSet);
begin
  datHistorico.ApplyUpdates(0);
  commit;
end;

procedure Tdm.datMovDetAfterInsert(DataSet: TDataSet);
begin
  datMovDetMOV_DETALHE_ID.value := getGeneratorMovDetalhe;
  datMovDetMOV_LIG_ID.Value     := FMovLigId;
end;

procedure Tdm.datMovDetAfterPost(DataSet: TDataSet);
begin
  datMovDet.ApplyUpdates(0);
  commit;
end;

procedure Tdm.datMovLigAfterInsert(DataSet: TDataSet);
begin
  datMovLigMOV_LIG_ID.Value    := getGeneratorMovLigacao;
  FMovLigId                    := datMovLigMOV_LIG_ID.AsInteger;
  datMovLigCLIENTE_ID.Value    := FClienteId;
  datMovLigDATA_LIG.AsDateTime := FDataHoraLigacao;
end;

procedure Tdm.datMovLigAfterPost(DataSet: TDataSet);
begin
  datMovLig.ApplyUpdates(0);
  commit;
end;

function Tdm.getGeneratorCliente: Integer;
begin
  sqlGenCliente.Close;
  sqlGenCliente.ExecQuery;
  Result := sqlGenCliente.FieldByName('GEN_CLIENTE_ID').AsInteger;
end;

function Tdm.getGeneratorHistorico: Integer;
begin
  sqlGenHistorico.Close;
  sqlGenHistorico.ExecQuery;
  Result := sqlGenHistorico.FieldByName('ID_GERADO').AsInteger;
end;

function Tdm.getGeneratorMovDetalhe: Integer;
begin
  sqlGenMovDet.Close;
  sqlGenMovDet.ExecQuery;
  Result := sqlGenMovDet.FieldByName('ID_GERADO').AsInteger;
end;

function Tdm.getGeneratorMovLigacao: Integer;
begin
  sqlGenMovLig.Close;
  sqlGenMovLig.Open;
  Result := sqlGenMovLig.FieldByName('gen_mov_lig').AsInteger;
end;

procedure Tdm.openDat(dat: TClientDataSet);
begin
  dat.Close;
  dat.Open;
end;

procedure Tdm.qryMovDetBeforeOpen(DataSet: TDataSet);
begin
  qryMovDet.ParamByName('MOV_LIG_ID').Value := FMovLigId;
end;

procedure Tdm.resetQrySql(const sql: string; qry: TIBQuery);
begin
  qry.SQL.Clear;
  qry.SQL.Add(sql);
end;

end.
