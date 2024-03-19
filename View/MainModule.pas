unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, uniGUIBaseClasses, uniGUIClasses, uniImageList;

type
  TAcessoOperador = record
    PessoaId: Integer;
    CadastroEmpresa: Boolean;
    CadastroPessoa: Boolean;
    CadastroTipoGasto: Boolean;
    ManutencaoVeiculo: Boolean;
    ManutencaoEntrada: Boolean;
    ManutencaoVenda: Boolean;
    ManutencaoGasto: Boolean;
    ManutencaoContasReceber: Boolean;
    Simulador: Boolean;
    AlertaFinanceiroVencido: Boolean;
  end;

  TUniMainModule = class(TUniGUIMainModule)
    Conexao: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    dsCadastroVeiculo: TDataSource;
    dsCadastroPessoa: TDataSource;
    queryCadastroPessoa: TFDQuery;
    queryCadastroVeiculo: TFDQuery;
    dsCadastroTipoGasto: TDataSource;
    queryCadastroTipoGasto: TFDQuery;
    ImageListMain: TUniNativeImageList;
    queryCadastroEmpresa: TFDQuery;
    dsCadastroEmpresa: TDataSource;
    dsCadastroVendedor: TDataSource;
    queryCadastroVendedor: TFDQuery;
    dsAcessoOperador: TDataSource;
    queryAcessoOperador: TFDQuery;
  public
    GlobalOperadorId: Integer;
    GlobalNomeOperador: string;
    GlobalAcessoOperador: TAcessoOperador;
    function GerarSequence(ASequence: string): Integer;
    function TemFinanceiroVencido: Integer;
    procedure AlterarStatusFinanceiro;
    procedure CarregarAcessoOperador;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, ConexaoPostgreSQL;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.CarregarAcessoOperador;
var
  LQueryAcesso: TFDQuery;
begin
  LQueryAcesso := TFDQuery.Create(nil);
  LQueryAcesso.Connection := Conexao;

  LQueryAcesso.Close;
  LQueryAcesso.SQL.Clear;
  LQueryAcesso.SQL.Add('select * from acesso where pessoa_id = :ppessoa_id');
  LQueryAcesso.ParamByName('ppessoa_id').AsInteger := GlobalOperadorId;
  LQueryAcesso.Open;

  if not LQueryAcesso.IsEmpty then
  begin
    GlobalAcessoOperador.PessoaId := LQueryAcesso.FieldByName('pessoa_id').AsInteger;
    GlobalAcessoOperador.CadastroEmpresa := LQueryAcesso.FieldByName('cadastro_empresa').AsBoolean;
    GlobalAcessoOperador.CadastroPessoa := LQueryAcesso.FieldByName('cadastro_pessoa').AsBoolean;
    GlobalAcessoOperador.CadastroTipoGasto := LQueryAcesso.FieldByName('cadastro_tipo_gasto').AsBoolean;
    GlobalAcessoOperador.ManutencaoVeiculo := LQueryAcesso.FieldByName('manutencao_veiculo').AsBoolean;
    GlobalAcessoOperador.ManutencaoEntrada := LQueryAcesso.FieldByName('manutencao_entrada').AsBoolean;
    GlobalAcessoOperador.ManutencaoVenda := LQueryAcesso.FieldByName('manutencao_venda').AsBoolean;
    GlobalAcessoOperador.ManutencaoGasto := LQueryAcesso.FieldByName('manutencao_gasto').AsBoolean;
    GlobalAcessoOperador.ManutencaoContasReceber := LQueryAcesso.FieldByName('manutencao_contas_receber').AsBoolean;
    GlobalAcessoOperador.Simulador := LQueryAcesso.FieldByName('simulador').AsBoolean;
    GlobalAcessoOperador.AlertaFinanceiroVencido := LQueryAcesso.FieldByName('alerta_financeiro_vencido').AsBoolean;
  end;

  LQueryAcesso.Free;
end;

function TUniMainModule.GerarSequence(ASequence: string): Integer;
var
  LQuerySequence: TFDQuery;
begin
  LQuerySequence := TFDQuery.Create(nil);
  LQuerySequence.Connection := Conexao;

  LQuerySequence.Close;
  LQuerySequence.SQL.Clear;
  LQuerySequence.Open('select nextval(' + QuotedStr(ASequence) + ') as sequence');

  Result := LQuerySequence.FieldByName('sequence').AsInteger;
  LQuerySequence.Free;
end;

function TUniMainModule.TemFinanceiroVencido: Integer;
var
  LQueryVencido: TFDQuery;
begin
  LQueryVencido := TFDQuery.Create(nil);
  LQueryVencido.Connection := Conexao;
  LQueryVencido.Open('select count(*) from financeiro where status_financeiro = ''VENCIDO''');

  Result := LQueryVencido.RecordCount;

  LQueryVencido.Free;
end;

procedure TUniMainModule.AlterarStatusFinanceiro;
var
  queryStatusFinanceiro: TFDQuery;
begin
  queryStatusFinanceiro := TFDQuery.Create(nil);
  queryStatusFinanceiro.Connection := UniMainModule.Conexao;
  queryStatusFinanceiro.ExecSQL('CALL alterar_status_financeiro();');
  queryStatusFinanceiro.Free;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);

end.
