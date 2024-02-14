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
    queryVeiculo: TFDQuery;
    dsVeiculo: TDataSource;
    panelFiltro: TUniPanel;
    PageControlVeiculo: TUniPageControl;
    tsVeiculo: TUniTabSheet;
    tsGasto: TUniTabSheet;
    gridGasto: TUniDBGrid;
    queryGasto: TFDQuery;
    dsGasto: TDataSource;
    buttonGastosVeiculo: TUniButton;
    tsContasReceber: TUniTabSheet;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
    procedure queryVeiculoAfterScroll(DataSet: TDataSet);
    procedure buttonGastosVeiculoClick(Sender: TObject);
  private
    procedure ExecutaPesquisa(AFiltro: string);
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalVeiculo, uFormModalGasto;

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
end;

procedure TFrameManutencaoVeiculo.ExecutaPesquisa(AFiltro: string);
begin
  queryVeiculo.Close;
  queryVeiculo.SQL.Clear;
  queryVeiculo.SQL.Add('select * from veiculo');

  if AFiltro <> EmptyStr then
    queryVeiculo.SQL.Add(AFiltro);

  queryVeiculo.Open;
end;

procedure TFrameManutencaoVeiculo.queryVeiculoAfterScroll(DataSet: TDataSet);
begin
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

  queryGasto.SQL.Add('where gasto.veiculo_id = :pveiculo_id');

  if queryVeiculo.RecordCount = 0 then
    queryGasto.ParamByName('pveiculo_id').AsInteger := 0
  else
    queryGasto.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;

  queryGasto.Open;
end;

procedure TFrameManutencaoVeiculo.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoVeiculo);

end.
