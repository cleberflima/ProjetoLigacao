unit uDm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, IBX.IBCustomDataSet, IBX.IBQuery;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
