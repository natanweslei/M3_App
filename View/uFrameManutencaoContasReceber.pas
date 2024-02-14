unit uFrameManutencaoContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoContasReceber = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonCadastroVeiculo: TUniButton;
    queryContasReceber: TFDQuery;
    dsContasReceber: TDataSource;
    panelFiltro: TUniPanel;
    gridGasto: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
  private
    procedure ExecutaPesquisa(AFiltro: string);
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFrameManutencaoContasReceber.buttonCadastroVeiculoClick(Sender: TObject);
begin
//
end;

procedure TFrameManutencaoContasReceber.ExecutaPesquisa(AFiltro: string);
begin
  queryContasReceber.Close;
  queryContasReceber.SQL.Clear;
  queryContasReceber.SQL.Add('select');
  queryContasReceber.SQL.Add('    financeiro.financeiro_id,');
  queryContasReceber.SQL.Add('    financeiro.descricao,');
  queryContasReceber.SQL.Add('    financeiro.data_lancamento,');
  queryContasReceber.SQL.Add('    financeiro.valor_documento,');
  queryContasReceber.SQL.Add('    financeiro.veiculo_id,');
  queryContasReceber.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryContasReceber.SQL.Add('    financeiro.pessoa_id || '' - '' || pessoa.nome as cliente,');
  queryContasReceber.SQL.Add('    financeiro.tipogasto_id || '' - '' || tipo_gasto.descricao as tipogasto');
  queryContasReceber.SQL.Add('from financeiro');

  queryContasReceber.SQL.Add('inner join veiculo');
  queryContasReceber.SQL.Add('on veiculo.veiculo_id = gasto.veiculo_id');

  queryContasReceber.SQL.Add('inner join pessoa');
  queryContasReceber.SQL.Add('on pessoa.pessoa_id = gasto.pessoa_id');

  queryContasReceber.SQL.Add('inner join tipo_gasto');
  queryContasReceber.SQL.Add('on tipo_gasto.tipogasto_id = gasto.tipogasto_id');

  if AFiltro <> EmptyStr then
    queryContasReceber.SQL.Add(AFiltro);

  queryContasReceber.Open;
end;

procedure TFrameManutencaoContasReceber.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoContasReceber);

end.
