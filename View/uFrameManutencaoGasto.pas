unit uFrameManutencaoGasto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoGasto = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonGastosVeiculo: TUniButton;
    gridGasto: TUniDBGrid;
    dsGasto: TDataSource;
    queryGasto: TFDQuery;
    panelFiltro: TUniPanel;
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    procedure ExecutaPesquisa(AFiltro: string);
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

procedure TFrameManutencaoGasto.ExecutaPesquisa(AFiltro: string);
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

  if AFiltro <> EmptyStr then
    queryGasto.SQL.Add(AFiltro);

  queryGasto.Open;
end;

procedure TFrameManutencaoGasto.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoGasto);

end.
