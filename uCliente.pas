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
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    btnFiltrar: TBitBtn;
    grpDados: TGroupBox;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCliente := nil;
end;

end.
