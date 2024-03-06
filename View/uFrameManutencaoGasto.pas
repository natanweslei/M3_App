unit uFrameManutencaoGasto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TFrameManutencaoGasto = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonGastosVeiculo: TUniButton;
    gridGasto: TUniDBGrid;
    dsGasto: TDataSource;
    queryGasto: TFDQuery;
    panelFiltro: TUniPanel;
    comboVeiculo: TUniDBLookupComboBox;
    comboPessoa: TUniDBLookupComboBox;
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure comboVeiculoChange(Sender: TObject);
    procedure comboPessoaChange(Sender: TObject);
  private
    procedure ExecutaPesquisa;
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalGasto;

procedure TFrameManutencaoGasto.buttonGastosVeiculoClick(Sender: TObject);
begin
  if queryGasto.Active then
    FormModalGasto.GastoId := queryGasto.FieldByName('gasto_id').AsInteger;

  FormModalGasto.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryGasto.Refresh;
    end
  );
end;

procedure TFrameManutencaoGasto.ExecutaPesquisa;
var
  LFiltro: string;

  function WhereAnd: string;
  begin
    if LFiltro = EmptyStr then
      Result := ' where '
    else
      Result := ' and ';
  end;
begin
  LFiltro := EmptyStr;

  queryGasto.Close;
  queryGasto.SQL.Clear;
  queryGasto.SQL.Add('select');
  queryGasto.SQL.Add('    gasto.gasto_id,');
  queryGasto.SQL.Add('    gasto.descricao,');
  queryGasto.SQL.Add('    gasto.data_gasto,');
  queryGasto.SQL.Add('    gasto.valor_gasto,');
  queryGasto.SQL.Add('    gasto.veiculo_id,');
  queryGasto.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryGasto.SQL.Add('    gasto.pessoa_id || '' - '' || pessoa.nome as responsavel,');
  queryGasto.SQL.Add('    gasto.tipogasto_id || '' - '' || tipo_gasto.descricao as tipogasto');
  queryGasto.SQL.Add('from gasto');

  queryGasto.SQL.Add('inner join veiculo');
  queryGasto.SQL.Add('on veiculo.veiculo_id = gasto.veiculo_id');

  queryGasto.SQL.Add('inner join pessoa');
  queryGasto.SQL.Add('on pessoa.pessoa_id = gasto.pessoa_id');

  queryGasto.SQL.Add('inner join tipo_gasto');
  queryGasto.SQL.Add('on tipo_gasto.tipogasto_id = gasto.tipogasto_id');

  if not comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'gasto.veiculo_id = ' + comboVeiculo.KeyValueStr;
  end;

  if not comboPessoa.ListSource.DataSet.IsEmpty then
  begin
    if comboPessoa.KeyValue > 0 then
      LFiltro := LFiltro + WhereAnd + 'gasto.pessoa_id = ' + comboPessoa.KeyValueStr;
  end;

  queryGasto.SQL.Add(LFiltro);

  queryGasto.Open;
end;

procedure TFrameManutencaoGasto.comboPessoaChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoGasto.comboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoGasto.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa;
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
end;

procedure TFrameManutencaoGasto.UniFrameDestroy(Sender: TObject);
begin
  if UniMainModule.queryCadastroVeiculo.Active then
    UniMainModule.queryCadastroVeiculo.Close;

  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;
end;

initialization
  RegisterClass(TFrameManutencaoGasto);

end.
