unit uConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmConsulta = class(TfrmBase)
    grpPesquisa: TGroupBox;
    edtPNome: TLabeledEdit;
    btnFiltrar: TBitBtn;
    edtPDataIni: TDateTimePicker;
    edtPDataFim: TDateTimePicker;
    grdClientes: TDBGrid;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

uses uDm, uPrincipal;

procedure TfrmConsulta.btnFiltrarClick(Sender: TObject);
var
  dataIni, nome, dataFim : string;
begin
  nome := Trim(edtPNome.Text);

  dm.resetQrySql(SQL_CONSULTA, dm.qryConsulta);


  if nome <> '' then
    dm.addWhere(dm.qryConsulta, '(NOME LIKE ''%' + nome + '%'')');

  dataIni := '(CAST(MLIG.DATA_LIG AS DATE) >= ('''  + FormatDateTime(FMT_FIREBIRD_DATA, edtPDataIni.Date) + '''))';
  dm.addWhere(dm.qryConsulta, dataIni);

  dataFim := '(CAST(MLIG.DATA_LIG AS DATE) < ('''  + FormatDateTime(FMT_FIREBIRD_DATA, edtPDataFim.Date+1) + '''))';
  dm.addWhere(dm.qryConsulta, dataFim);

  if DebugHook <> 0 then
    dm.qryConsulta.SQL.SaveToFile('C:\sqlConsulta.txt');

  dm.openDat(dm.datConsulta);

end;

procedure TfrmConsulta.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrincipal.DBNavigator1.DataSource := nil;
end;

procedure TfrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmConsulta := nil;
  frmPrincipal.DBNavigator1.DataSource := nil;
  dm.openDat(dm.datConsulta);
end;

end.
