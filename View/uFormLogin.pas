unit uFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses,
  uniImage, Vcl.Imaging.pngimage, uniEdit, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg;

type
  TFormLogin = class(TUniLoginForm)
    UniImage1: TUniImage;
    edtUsuario: TUniEdit;
    edtSenha: TUniEdit;
    btnLogin: TUniButton;
    procedure btnLoginClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  end;

function FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars,
  MainModule,
  uniGUIApplication;

function FormLogin: TFormLogin;
begin
  Result := TFormLogin(UniMainModule.GetFormInstance(TFormLogin));
end;

procedure TFormLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnLoginClick(nil);
end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
var
  qryLogin: TFDQuery;
begin
  if Trim(edtUsuario.Text) = EmptyStr then
  begin
    ShowMessage('Informe o usuário!');
    Exit;
  end;

  if Trim(edtSenha.Text) = EmptyStr then
  begin
    ShowMessage('Informe a senha!');
    Exit;
  end;

  qryLogin := TFDQuery.Create(nil);
  qryLogin.Connection := UniMainModule.Conexao;
  qryLogin.SQL.Clear;
  qryLogin.SQL.Add('select pessoa_id, nome');
  qryLogin.SQL.Add('from pessoa');
  qryLogin.SQL.Add('where operador');
  qryLogin.SQL.Add('and usuario = :pusuario');
  qryLogin.SQL.Add('and senha = :psenha');

  qryLogin.ParamByName('pusuario').Value := edtUsuario.Text;
  qryLogin.ParamByName('psenha').Value := edtSenha.Text;

  qryLogin.Open;

  if qryLogin.RecordCount = 0 then
  begin
    ShowMessage('Usuário ou senha incorreto!');
    Exit;
  end;

  UniMainModule.GlobalOperadorId := qryLogin.FieldByName('pessoa_id').AsInteger;
  UniMainModule.GlobalNomeOperador := qryLogin.FieldByName('nome').AsString;

  UniMainModule.CarregarAcessoOperador;

  qryLogin.Free;

  ModalResult := mrOk;
end;

initialization
  RegisterAppFormClass(TFormLogin);

end.
