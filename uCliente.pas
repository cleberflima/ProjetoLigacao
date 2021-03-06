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
    Panel1: TPanel;
    btnMovLiga��o: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FDataSourceStateChange(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);
    procedure btnMovLiga��oClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses uDm, uPrincipal, uMovLigacao;

procedure TfrmCliente.btnFiltrarClick(Sender: TObject);
var
  ids, nome, tel  : string;
begin
  ids  := Trim(edtPCodigo.Text);
  nome := Trim(edtPNome.Text);
  tel  := Trim(edtPFone.Text);

  dm.resetQrySql(SQL_CLIENTE, dm.qryCliente);

  if ids <> '' then
    dm.addWhere(dm.qryCliente, 'CLIENTE_ID IN (' + ids +')');

  if nome <> '' then
    dm.addWhere(dm.qryCliente, '(NOME LIKE ''%' + nome + '%'')');

  if tel <> '' then
    dm.addWhere(dm.qryCliente, '(TELEFONE = ''' + tel + ''' )');

  dm.openDat(dm.datCliente);
end;

procedure TfrmCliente.btnMovLiga��oClick(Sender: TObject);
var
  agora : TDateTime;
  mens : PWideChar;
  movLigId : Integer;
begin
  inherited;
  agora := now;
  mens := PWideChar('Deseja regitrar para o cliente ' + #13#10 +  dm.datClienteNOME.AsString + ' �s ' + FormatDateTime('dd/MM/YYYY hh:nn:ss', agora));
  if Application.MessageBox(mens, 'Registrar Liga��o', MB_YESNO + MB_ICONQUESTION ) = mrYes then
  begin
    try
      movLigId := dm.getGeneratorMovLigacao;
      dm.FClienteId := dm.datClienteCLIENTE_ID.AsInteger;
      dm.FDataHoraLigacao := agora;
      dm.openDat(dm.datMovLig);
      dm.datMovLig.Append;
      dm.datMovLigDATA_LIG.Value := agora;
      dm.datMovLig.Post;
      frmPrincipal.CriaForm(TfrmMovDetalhe, frmMovDetalhe);
    except on E: Exception do
      showMessage('Erro ao registrar liga��o ' + #13#10 + e.Message);
    end;
  end;
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
  dm.openDat(dm.datCliente);
end;

end.

