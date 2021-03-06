unit uMovLigacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmMovDetalhe = class(TfrmBase)
    grpDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TDBEdit;
    edtFone: TDBEdit;
    grdClientes: TDBGrid;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtObservacao: TDBEdit;
    edtHistorico: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edtDataHora: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FDataSourceStateChange(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovDetalhe: TfrmMovDetalhe;

implementation

{$R *.dfm}

uses uDm, uPrincipal;

procedure TfrmMovDetalhe.FDataSourceStateChange(Sender: TObject);
begin
  inherited;
  if FDataSource.State in [dsInsert, dsEdit] then
    edtHistorico.SetFocus;
end;

procedure TfrmMovDetalhe.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrincipal.DBNavigator1.DataSource := FDataSource;
end;

procedure TfrmMovDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmMovDetalhe := nil;
  frmPrincipal.DBNavigator1.DataSource := nil;
end;

procedure TfrmMovDetalhe.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSource := dm.dsMovDet;
  FDataSource.OnStateChange := FDataSourceStateChange;
  dm.openDat(dm.datMovDet);
  edtDataHora.Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', dm.FDataHoraLigacao);
end;

end.
