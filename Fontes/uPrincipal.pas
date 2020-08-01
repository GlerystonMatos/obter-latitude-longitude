unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, cefvcl, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btnPesquisar: TButton;
    WebBrowser: TWebBrowser;
    lbPesquisa: TLabel;
    lbLogradouro: TLabel;
    edtLogradouro: TEdit;
    lbBairro: TLabel;
    edtBairro: TEdit;
    edtCidade: TEdit;
    lbCidade: TLabel;
    lbEstado: TLabel;
    edtEstado: TEdit;
    lbCEP: TLabel;
    edtCep: TEdit;
    lbNumero: TLabel;
    edtNumero: TEdit;
    tPesquisa: TTimer;
    btnSair: TButton;
    tErro: TTimer;
    lbSearchTimeout: TLabel;
    edtSearchTimeout: TEdit;
    btnParar: TButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure tPesquisaTimer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tErroTimer(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    { Private declarations }
    Contador: Integer;
    ContadorErro: Integer;
    UrlPesquisa: string;
    Pesquisando: Boolean;
    procedure NavigateComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    function GetUrl: string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnPararClick(Sender: TObject);
begin
  lbPesquisa.Caption := 'Pesquisa Interrompida';
  tErro.Enabled := False;
  tPesquisa.Enabled := False;
  Pesquisando := False;
  WebBrowser.Stop;
  WebBrowser.Navigate('about:blank');
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  Contador := 0;
  ContadorErro := 0;
  Pesquisando := True;
  UrlPesquisa := GetUrl;
  tPesquisa.Enabled := True;
  tErro.Enabled := True;
  WebBrowser.Navigate(UrlPesquisa);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if (Pesquisando) then
    ShowMessage('A pesquisa está sendo executada.')
  else
    Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Pesquisando := False;
  WebBrowser.OnNavigateComplete2 := NavigateComplete;
  WebBrowser.Silent := True;
  WebBrowser.Navigate('about:blank');
end;

function TfrmPrincipal.GetUrl: string;
var
  logradouro: string;
  bairro: string;
  cidade: string;
  estado: string;
  cep: string;
  numero: string;
begin
  logradouro := StringReplace(Trim(edtLogradouro.Text), ' ', '+', [rfReplaceAll]);
  bairro := StringReplace(Trim(edtBairro.Text), ' ', '+', [rfReplaceAll]);
  cidade := StringReplace(Trim(edtCidade.Text), ' ', '+', [rfReplaceAll]);
  estado := StringReplace(Trim(edtEstado.Text), ' ', '+', [rfReplaceAll]);
  cep := StringReplace(Trim(edtCep.Text), ' ', '+', [rfReplaceAll]);
  numero := StringReplace(Trim(edtNumero.Text), ' ', '+', [rfReplaceAll]);
  Result := 'https://www.google.com.br/maps/place/' + logradouro + '+' + numero + '+' + bairro + '+' + cidade + '+' + estado + '+' + cep;
end;

procedure TfrmPrincipal.NavigateComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
  novaUrl: string;
  latitude: string;
  longitude: string;
  locationURL: string;
const
  marcaInicialLatitude = '!8m2!3d';
  marcaInicialLongitude = '!4d';
begin
  locationURL := (ASender as TWebBrowser).locationURL;
  if (locationURL <> '') and (locationURL <> UrlPesquisa) and (locationURL <> 'about:blank') then
  begin
    novaUrl := locationURL;
    Delete(novaUrl, 1, (Pos(marcaInicialLatitude, novaUrl) + (length(marcaInicialLatitude) - 1)));
    latitude := Copy(novaUrl, 0, (Pos(marcaInicialLongitude, novaUrl) - 1));
    longitude := Copy(novaUrl, (Pos(marcaInicialLongitude, novaUrl) + length(marcaInicialLongitude)), Length(novaUrl));
    tErro.Enabled := False;
    tPesquisa.Enabled := False;
    Pesquisando := False;

    if (Trim(latitude) <> '') and (Trim(longitude) <> '') then
    begin
      lbPesquisa.Caption := 'Latitude: ' + latitude + ', Longitude: ' + longitude;
    end
    else
    begin
      lbPesquisa.Caption := 'Endereço não localizado.';
    end;
  end;
end;

procedure TfrmPrincipal.tErroTimer(Sender: TObject);
begin
  if (ContadorErro = StrToInt(edtSearchTimeout.Text)) then
  begin
    lbPesquisa.Caption := 'A pesquisa demorou muito tempo!';
    tErro.Enabled := False;
    tPesquisa.Enabled := False;
    Pesquisando := False;
    WebBrowser.Stop;
    WebBrowser.Navigate('about:blank');
  end
  else
  begin
    Inc(ContadorErro);
  end;
end;

procedure TfrmPrincipal.tPesquisaTimer(Sender: TObject);
begin
  if (Contador = 0) then
  begin
    lbPesquisa.Caption := 'Obtendo dados.';
    Inc(Contador);
  end
  else if (Contador = 1) then
  begin
    lbPesquisa.Caption := 'Obtendo dados..';
    Inc(Contador);
  end
  else if (Contador = 2) then
  begin
    lbPesquisa.Caption := 'Obtendo dados...';
    Contador := 0;
  end
end;

end.
