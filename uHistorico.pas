unit uHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmHistorico = class(TfrmBase)
    grpPesquisa: TGroupBox;
    edtPCodigo: TLabeledEdit;
    edtPDescricao: TLabeledEdit;
    btnFiltrar: TBitBtn;
    grpDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    grdHistorico: TDBGrid;
    Label3: TLabel;
    edtPTipo: TComboBox;
    DBComboBox1: TDBComboBox;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDataSourceStateChange(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistorico: TfrmHistorico;

implementation

{$R *.dfm}

uses uDm, uPrincipal;

procedure TfrmHistorico.btnFiltrarClick(Sender: TObject);
var
  ids, desc, tipo : string;
begin
  inherited;
  ids  := Trim(edtPCodigo.Text);
  desc := Trim(edtPDescricao.Text);
  tipo := edtPTipo.Items[edtPTipo.ItemIndex];

  dm.resetQrySql(SQL_HISTORICO, dm.qryHistorico);

  if ids <> '' then
    dm.addWhere(dm.qryHistorico, 'HISTORICO IN (' + ids +')');

  if desc <> '' then
    dm.addWhere(dm.qryHistorico, '(DESCRICAO LIKE ''%' + desc + '%'')');

  if tipo <> '' then
    dm.addWhere(dm.qryHistorico, '(TIPO_LIG = ''' + tipo + ''' )');

  dm.openDat(dm.datHistorico);
end;

procedure TfrmHistorico.FDataSourceStateChange(Sender: TObject);
begin
  inherited;
  if FDataSource.State in [dsInsert, dsEdit] then
    edtDescricao.SetFocus;
end;

procedure TfrmHistorico.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrincipal.DBNavigator1.DataSource := FDataSource;
end;

procedure TfrmHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmHistorico := nil;
  frmPrincipal.DBNavigator1.DataSource := nil;
end;

procedure TfrmHistorico.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSource := dm.dsHistorico;
  FDataSource.OnStateChange := FDataSourceStateChange;
end;

end.
