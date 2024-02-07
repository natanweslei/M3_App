unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TUniMainModule = class(TUniGUIMainModule)
    Conexao: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    dsCadastroVeiculo: TDataSource;
    dsCadastroFornecedor: TDataSource;
    queryCadastroFornecedor: TFDQuery;
    queryCadastroVeiculo: TFDQuery;
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

initialization
  RegisterMainModuleClass(TUniMainModule);

end.
