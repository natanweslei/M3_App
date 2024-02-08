unit uFrameManutencaoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoVeiculo = class(TUniFrame)
    panelBotoes: TUniPanel;
    gridVeiculo: TUniDBGrid;
    buttonCadastroVeiculo: TUniButton;
    buttonEntradaVeiculo: TUniButton;
    buttonVendaVeiculo: TUniButton;
    buttonGastosVeiculo: TUniButton;
    queryVeiculo: TFDQuery;
    dsVeiculo: TDataSource;
    ImageListManutencaoVeiculo: TUniNativeImageList;
    PageControlVeiculo: TUniPageControl;
    tsVeiculo: TUniTabSheet;
    tsGastos: TUniTabSheet;
    gridGasto: TUniDBGrid;
    tsEntrada: TUniTabSheet;
    tsVenda: TUniTabSheet;
    tsFinanceiro: TUniTabSheet;
    PageControlFinanceiro: TUniPageControl;
    tsContasPagar: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    dsEntrada: TDataSource;
    queryEntrada: TFDQuery;
    gridEntrada: TUniDBGrid;
    dsVenda: TDataSource;
    queryVenda: TFDQuery;
    gridVenda: TUniDBGrid;
    dsGasto: TDataSource;
    queryGasto: TFDQuery;
    panelFiltro: TUniPanel;
    procedure buttonEntradaVeiculoClick(Sender: TObject);
    procedure buttonVendaVeiculoClick(Sender: TObject);
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
    procedure queryVeiculoAfterScroll(DataSet: TDataSet);
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalModelo, uFormModalVeiculo, uFormModalEntrada, uFormModalVenda, uFormModalGasto;

procedure TFrameManutencaoVeiculo.buttonCadastroVeiculoClick(Sender: TObject);
begin
  if queryVeiculo.Active then
    FormModalVeiculo.VeiculoId := queryVeiculo.FieldByName('veiculo_id').AsInteger;

  FormModalVeiculo.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      queryVeiculo.Refresh;
    end
  );

  PageControlVeiculo.ActivePage := tsVeiculo;
end;

procedure TFrameManutencaoVeiculo.buttonEntradaVeiculoClick(Sender: TObject);
begin
  if queryEntrada.Active then
    FormModalEntrada.EntradaId := queryEntrada.FieldByName('entrada_id').AsInteger;

  FormModalEntrada.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryEntrada.Refresh;
    end
  );

  PageControlVeiculo.ActivePage := tsEntrada;
end;

procedure TFrameManutencaoVeiculo.buttonVendaVeiculoClick(Sender: TObject);
begin
  if queryVenda.Active then
    FormModalVenda.VendaId := queryVenda.FieldByName('venda_id').AsInteger;

  FormModalVenda.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryVenda.Refresh;
    end
  );

  PageControlVeiculo.ActivePage := tsVenda;
end;

procedure TFrameManutencaoVeiculo.buttonGastosVeiculoClick(Sender: TObject);
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

  PageControlVeiculo.ActivePage := tsGastos;
end;

procedure TFrameManutencaoVeiculo.queryVeiculoAfterScroll(DataSet: TDataSet);
begin
  queryEntrada.Close;
  queryEntrada.SQL.Clear;
  queryEntrada.SQL.Add('select');
  queryEntrada.SQL.Add('    entrada.entrada_id,');
  queryEntrada.SQL.Add('    entrada.data_entrada,');
  queryEntrada.SQL.Add('    entrada.valor_veiculo,');
  queryEntrada.SQL.Add('    entrada.veiculo_id,');
  queryEntrada.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryEntrada.SQL.Add('    entrada.pessoa_id || '' - '' || pessoa.nome as fornecedor');
  queryEntrada.SQL.Add('from entrada');

  queryEntrada.SQL.Add('inner join veiculo');
  queryEntrada.SQL.Add('on veiculo.veiculo_id = entrada.veiculo_id');

  queryEntrada.SQL.Add('inner join pessoa');
  queryEntrada.SQL.Add('on pessoa.pessoa_id = entrada.pessoa_id');

  if queryVeiculo.RecordCount > 0 then
  begin
    queryEntrada.SQL.Add('where entrada.veiculo_id = :pveiculo_id');
    queryEntrada.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;
  end;
  queryEntrada.Open;

  queryVenda.Close;
  queryVenda.SQL.Clear;
  queryVenda.SQL.Add('select');
  queryVenda.SQL.Add('    venda.venda_id,');
  queryVenda.SQL.Add('    venda.data_venda,');
  queryVenda.SQL.Add('    venda.valor_veiculo,');
  queryVenda.SQL.Add('    venda.veiculo_id,');
  queryVenda.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryVenda.SQL.Add('    venda.pessoa_id || '' - '' || pessoa.nome as cliente');
  queryVenda.SQL.Add('from venda');

  queryVenda.SQL.Add('inner join veiculo');
  queryVenda.SQL.Add('on veiculo.veiculo_id = venda.veiculo_id');

  queryVenda.SQL.Add('inner join pessoa');
  queryVenda.SQL.Add('on pessoa.pessoa_id = venda.pessoa_id');

  if queryVeiculo.RecordCount > 0 then
  begin
    queryVenda.SQL.Add('where venda.veiculo_id = :pveiculo_id');
    queryVenda.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;
  end;
  queryVenda.Open;

  queryGasto.Close;
  queryGasto.SQL.Clear;
  queryGasto.SQL.Add('select');
  queryGasto.SQL.Add('    gasto.gasto_id,');
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

  if queryVeiculo.RecordCount > 0 then
  begin
    queryGasto.SQL.Add('where gasto.veiculo_id = :pveiculo_id');
    queryGasto.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;
  end;
  queryGasto.Open;
end;

procedure TFrameManutencaoVeiculo.UniFrameCreate(Sender: TObject);
begin
  queryVeiculo.Close;
  queryVeiculo.SQL.Clear;
  queryVeiculo.SQL.Add('select * from veiculo');
  queryVeiculo.Open;

  PageControlVeiculo.ActivePage := tsVeiculo;
end;

initialization
  RegisterClass(TFrameManutencaoVeiculo);

end.
