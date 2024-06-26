unit ConexaoPostgreSQL;

interface

uses
  System.SysUtils,
  System.Classes,
  MainModule,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.PG,
  FireDAC.Phys.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait;

type
  TConexaoPostgreSQL = class
  private
    FConexao: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    function Conectar: Boolean;
    procedure Desconectar;
    property Conexao: TFDConnection read FConexao;
  end;

implementation

{ TConexaoPostgreSQL }

constructor TConexaoPostgreSQL.Create;
begin
  // Certifique-se de que o driver PostgreSQL esteja vinculado globalmente
  if not Assigned(UniMainModule.FDPhysPgDriverLink1) then
    UniMainModule.FDPhysPgDriverLink1 := TFDPhysPgDriverLink.Create(nil);

  FConexao := TFDConnection.Create(nil);
  FConexao.DriverName := 'PG';
  FConexao.Params.Add('Database=seu_banco');    // Coloque o nome do seu banco de dados
  FConexao.Params.Add('User_Name=seu_usuario'); // Coloque o nome do usu�rio
  FConexao.Params.Add('Password=sua_senha');     // Coloque a senha do usu�rio
  FConexao.Params.Add('Server=seu_servidor');    // Coloque o endere�o do seu servidor PostgreSQL
end;

destructor TConexaoPostgreSQL.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TConexaoPostgreSQL.Conectar: Boolean;
begin
  try
    FConexao.Connected := True;
    Result := FConexao.Connected;
  except
    Result := False;
  end;
end;

procedure TConexaoPostgreSQL.Desconectar;
begin
  FConexao.Connected := False;
end;

end.

