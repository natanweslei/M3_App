unit uFrameManutencaoEntrada;

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
  TFrameManutencaoEntrada = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonEntradaVeiculo: TUniButton;
    dsEntrada: TDataSource;
    queryEntrada: TFDQuery;
    gridEntrada: TUniDBGrid;
    panelFiltro: TUniPanel;
    comboVeiculo: TUniDBLookupComboBox;
    comboPessoa: TUniDBLookupComboBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonEntradaVeiculoClick(Sender: TObject);
    procedure comboVeiculoChange(Sender: TObject);
    procedure comboPessoaChange(Sender: TObject);
  private
    procedure ExecutaPesquisa;
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalEntrada;

procedure TFrameManutencaoEntrada.buttonEntradaVeiculoClick(Sender: TObject);
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
end;

procedure TFrameManutencaoEntrada.ExecutaPesquisa;
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

  if not comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'entrada.veiculo_id = ' + comboVeiculo.KeyValueStr;
  end;

  if not comboPessoa.ListSource.DataSet.IsEmpty then
  begin
    if comboPessoa.KeyValue > 0 then
      LFiltro := LFiltro + WhereAnd + 'entrada.pessoa_id = ' + comboPessoa.KeyValueStr;
  end;

  queryEntrada.SQL.Add(LFiltro);

  queryEntrada.Open;
end;

procedure TFrameManutencaoEntrada.comboPessoaChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoEntrada.comboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoEntrada.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa;
end;

initialization
  RegisterClass(TFrameManutencaoEntrada);

end.
