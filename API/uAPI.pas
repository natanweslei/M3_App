unit uAPI;

interface

uses
  Rest.Client;

type
  TAPI = class
  private
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
    FLogradouro: string;
    FLocalidade: string;
    FUF: string;
    FErro: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure BuscarDadosEndereco(ACep: string);
    property Logradouro: string read FLogradouro write FLogradouro;
    property Localidade: string read FLocalidade write FLocalidade;
    property UF: string read FUF write FUF;
    property Erro: Boolean read FErro write FErro;
  end;

implementation

uses
  Rest.Types,
  System.SysUtils,
  Classes,
  System.JSON;

constructor TAPI.Create;
begin
  FClient := TRESTClient.Create(nil);
  FRequest := TRESTRequest.Create(nil);
  FResponse := TRESTResponse.Create(nil);

  FRequest.Client := FClient;
  FRequest.Response := FResponse;

  FLogradouro := EmptyStr;
  FLocalidade := EmptyStr;
  FUF := EmptyStr;
  FErro := False;
end;

procedure TAPI.BuscarDadosEndereco(ACep: string);
const
  CUrlBase = 'https://viacep.com.br/ws/%s/json';
var
  FEndereco: TJSONObject;
begin
  try
    FClient.BaseURL := Format(CUrlBase, [ACep]);

    FRequest.Method := rmGet;
    FRequest.Timeout:= 50000;
    try
      FRequest.Execute;
    except
      on E: Exception do
      begin
        raise Exception.Create('Falha ao realizar requisição!' + sLineBreak + E.Message);
      end;
    end;

    if FResponse.StatusCode = 200 then
    begin
      FEndereco := FRequest.Response.JSONValue as TJSONObject;

      FErro := FRequest.Response.Content.IndexOf('erro') >= 0;

      if FErro then
        raise Exception.Create('Código de retorno: ' + FResponse.StatusCode.ToString)
      else
      begin
        FLogradouro := FEndereco.GetValue('logradouro').Value;
        FLocalidade := FEndereco.GetValue('localidade').Value;
        FUF := FEndereco.GetValue('uf').Value;
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Falha ao buscar CEP!' + sLineBreak + E.Message);
    end;
  end;
end;

destructor TAPI.Destroy;
begin
  FResponse.Free;
  FClient.Free;
  FRequest.Free;

  inherited;
end;

end.
