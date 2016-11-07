program Ligacao;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDm in 'uDm.pas' {dm: TDataModule},
  uBase in 'uBase.pas' {frmBase},
  uCliente in 'uCliente.pas' {frmCliente},
  uHistorico in 'uHistorico.pas' {frmHistorico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
