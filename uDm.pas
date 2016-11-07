unit uDm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBSQL;

const SQL_CLIENTE : string = 'SELECT * FROM CLIENTE' + #13#10 + 'WHERE CLIENTE_ID IS NOT NULL';

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
    procedure datClienteAfterInsert(DataSet: TDataSet);
    procedure datClienteAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FsqlCliente: string;
  public
    { Public declarations }
    procedure resetSqlCliente;              //restaura a sql qryCliente.sql para SQL_CLIENTE
    procedure addWhereCliente(s: string);   //adiciona 'AND s' no qryCliente.sql
    procedure openCliente;                  //Fecha e abre a o datset recarregando a consulta que está no qryCliente.sql
    function getGeneratorCliente: Integer;  //Função que pega o próximo generator da tabela CLIENTE
    procedure commit;                       //Aplica as pendências no banco contida na transação tr.

  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdm }

procedure Tdm.addWhereCliente(s: string);
begin
  qryCliente.SQL.Add('AND ' + s);
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

function Tdm.getGeneratorCliente: Integer;
begin
  sqlGenCliente.Close;
  sqlGenCliente.ExecQuery;
  Result := sqlGenCliente.FieldByName('GEN_CLIENTE_ID').AsInteger;
end;

procedure Tdm.openCliente;
begin
  datCliente.Close;
  datCliente.Open;
end;

procedure Tdm.resetSqlCliente;
begin
  qryCliente.SQL.Clear;
  qryCliente.SQL.Add(SQL_CLIENTE);
end;

end.
