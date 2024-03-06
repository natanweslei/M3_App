unit uFrameManutencaoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox;

type
  TFrameManutencaoVenda = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonVendaVeiculo: TUniButton;
    dsVenda: TDataSource;
    queryVenda: TFDQuery;
    gridVenda: TUniDBGrid;
    panelFiltro: TUniPanel;
    comboVeiculo: TUniDBLookupComboBox;
    comboPessoa: TUniDBLookupComboBox;
    procedure buttonVendaVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure comboVeiculoChange(Sender: TObject);
    procedure comboPessoaChange(Sender: TObject);
  private
    procedure ExecutaPesquisa;
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

procedure TFrameManutencaoVenda.ExecutaPesquisa;
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

  if not comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'venda.veiculo_id = ' + comboVeiculo.KeyValueStr;
  end;

  if not comboPessoa.ListSource.DataSet.IsEmpty then
  begin
    if comboPessoa.KeyValue > 0 then
      LFiltro := LFiltro + WhereAnd + 'venda.pessoa_id = ' + comboPessoa.KeyValueStr;
  end;

  queryVenda.SQL.Add(LFiltro);

  queryVenda.Open;
end;

procedure TFrameManutencaoVenda.comboPessoaChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoVenda.comboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoVenda.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa;
end;

initialization
  RegisterClass(TFrameManutencaoVenda);

end.
