unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, uniGUIBaseClasses, uniGUIClasses, uniImageList;

type
  TStatus_Financeiro = (sf_ABERTO, sf_VENCIDO, sf_PAGO);

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
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject; var Handled: Boolean);
  public
    GlobalOperadorId: Integer;
    GlobalNomeOperador: string;
    function GerarSequence(ASequence: string): Integer;
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

procedure TUniMainModule.UniGUIMainModuleBeforeLogin(Sender: TObject; var Handled: Boolean);
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
