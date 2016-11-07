unit uDm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBSQL;

const SQL_CLIENTE : string = 'SELECT * FROM CLIENTE' + #13#10 + 'WHERE CLIENTE_ID IS NOT NULL';
const SQL_HISTORICO : string = 'SELECT * FROM HISTORICO' + #13#10 + 'WHERE HISTORICO.HISTORICO IS NOT NULL';

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
    procedure datClienteAfterInsert(DataSet: TDataSet);
    procedure datClienteAfterPost(DataSet: TDataSet);
    procedure datHistoricoAfterInsert(DataSet: TDataSet);
    procedure datHistoricoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure resetQrySql(const sql:string; qry:TIBQuery); //restaura a sql qryCliente.sql para SQL_CLIENTE
    procedure addWhere(qry:TIBQuery; s: string);    //adiciona 'AND s' no qry.sql
    procedure openDat(dat: TClientDataSet);                                 //Fecha e abre a o datset recarregando a consulta que está no qryCliente.sql
    procedure commit;                                      //Aplica as pendências no banco contida na transação tr.
    function getGeneratorCliente: Integer;                 //Função que pega o próximo generator da tabela CLIENTE
    function getGeneratorHistorico: Integer;               //Função que pega o próximo generator da tabela HISTORICO
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

procedure Tdm.datClienteAfterInsert(DataSet: TDataSet);
begin
  datClienteCLIENTE_ID.Value := getGeneratorCliente;
end;

procedure Tdm.datClienteAfterPost(DataSet: TDataSet);
begin
  datCliente.ApplyUpdates(0);
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

procedure Tdm.openDat(dat: TClientDataSet);
begin
  dat.Close;
  dat.Open;
end;

procedure Tdm.resetQrySql(const sql: string; qry: TIBQuery);
begin
  qry.SQL.Clear;
  qry.SQL.Add(sql);
end;

end.
