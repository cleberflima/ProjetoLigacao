unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ToolWin, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    CadastrodeCliente1: TMenuItem;
    CadastrodeHistrico1: TMenuItem;
    ConsultadeLigao1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeCliente1Click(Sender: TObject);
    procedure CadastrodeHistrico1Click(Sender: TObject);
    procedure ConsultadeLigao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriaForm(formClass: TComponentClass; var referencia);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDm, uBase, uCliente, uHistorico, uConsulta;

procedure TfrmPrincipal.CadastrodeCliente1Click(Sender: TObject);
begin
  CriaForm(TfrmCliente, frmCliente);
end;

procedure TfrmPrincipal.CadastrodeHistrico1Click(Sender: TObject);
begin
  CriaForm(TfrmHistorico, frmHistorico);
end;

procedure TfrmPrincipal.ConsultadeLigao1Click(Sender: TObject);
begin
  CriaForm(TfrmConsulta, frmConsulta);
end;

procedure TfrmPrincipal.CriaForm(formClass: TComponentClass; var referencia);
var
  form : TForm;
  criado: Boolean;
begin
  form := TForm(referencia);
  criado := Assigned(form);
  if not criado then
    Application.CreateForm(formClass, referencia);
  ShowWindow(TForm(referencia).Handle, SW_SHOWMAXIMIZED);
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja sair do Sistema de Liga��o', 'Saindo...', MB_YESNO + MB_ICONQUESTION) = mrNo then
    CanClose := False;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
