unit uFrameManutencaoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoVenda = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonVendaVeiculo: TUniButton;
    dsVenda: TDataSource;
    queryVenda: TFDQuery;
    gridVenda: TUniDBGrid;
    panelFiltro: TUniPanel;
    procedure buttonVendaVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    procedure ExecutaPesquisa(AFiltro: string);
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalVenda;

procedure TFrameManutencaoVenda.buttonVendaVeiculoClick(Sender: TObject);
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
end;

procedure TFrameManutencaoVenda.ExecutaPesquisa(AFiltro: string);
begin
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

  if AFiltro <> EmptyStr then
    queryVenda.SQL.Add(AFiltro);

  queryVenda.Open;
end;

procedure TFrameManutencaoVenda.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoVenda);

end.
