unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmCliente = class(TfrmBase)
    grpPesquisa: TGroupBox;
    edtPCodigo: TLabeledEdit;
    edtPNome: TLabeledEdit;
    edtPFone: TLabeledEdit;
    btnFiltrar: TBitBtn;
    grpDados: TGroupBox;
    edtNome: TDBEdit;
    edtFone: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    grdClientes: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FDataSourceStateChange(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses uDm, uPrincipal;

procedure TfrmCliente.btnFiltrarClick(Sender: TObject);
var
  ids, nome, tel  : string;
begin
  ids  := Trim(edtPCodigo.Text);
  nome := Trim(edtPNome.Text);
  tel  := Trim(edtPFone.Text);

  dm.resetSqlCliente;

  if ids <> '' then
    dm.addWhereCliente('CLIENTE_ID IN (' + ids +')');

  if nome <> '' then
    dm.addWhereCliente('(NOME LIKE ''%' + nome + '%'')');

  if tel <> '' then
    dm.addWhereCliente('(TELEFONE = ''' + tel + ''' )');

  dm.openCliente;
end;

procedure TfrmCliente.FDataSourceStateChange(Sender: TObject);
begin
  if FDataSource.State in [dsInsert, dsEdit] then
    edtNome.SetFocus;
end;

procedure TfrmCliente.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrincipal.DBNavigator1.DataSource := FDataSource;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCliente := nil;
  frmPrincipal.DBNavigator1.DataSource := nil;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSource := dm.dsCliente;
  FDataSource.OnStateChange := FDataSourceStateChange;
end;

end.
