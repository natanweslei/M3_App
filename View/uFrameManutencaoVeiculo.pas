unit uFrameManutencaoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniGUITypes, uFramePainelFiltro, uniDBImage,
  uniFileUpload, uniImage, uniDBNavigator;

type
  TFrameManutencaoVeiculo = class(TUniFrame)
    panelBotoes: TUniPanel;
    gridVeiculo: TUniDBGrid;
    buttonCadastroVeiculo: TUniButton;
    queryVeiculo: TFDQuery;
    dsVeiculo: TDataSource;
    panelFiltro: TUniPanel;
    gridGasto: TUniDBGrid;
    queryGasto: TFDQuery;
    dsGasto: TDataSource;
    buttonGastosVeiculo: TUniButton;
    gridContaReceber: TUniDBGrid;
    dsContasReceber: TDataSource;
    queryContasReceber: TFDQuery;
    FramePainelFiltro: TFramePainelFiltro;
    panelCentro: TUniPanel;
    imageVeiculos: TUniDBImage;
    buttonImagens: TUniFileUploadButton;
    queryImagensVeiculo: TFDQuery;
    dsImagensVeiculo: TDataSource;
    navigaterImagensVeiculo: TUniDBNavigator;
    panelBotton: TUniPanel;
    panelImagemLeft: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
    procedure queryVeiculoAfterScroll(DataSet: TDataSet);
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure FramePainelFiltro1comboVeiculoChange(Sender: TObject);
    procedure buttonImagensCompleted(Sender: TObject; AStream: TFileStream);
  private
    procedure ExecutaPesquisa;
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

procedure TFrameManutencaoVeiculo.buttonImagensCompleted(Sender: TObject; AStream: TFileStream);
begin
  if queryVeiculo.FieldByName('veiculo_id').AsInteger = 0 then
  begin
    MessageDlg('Nenhum veículo selecionado!', mtWarning, [mbOK]);
    Exit;
  end;

  imageVeiculos.LoadFromStream(AStream);

  queryImagensVeiculo.Insert;
  queryImagensVeiculo.FieldByName('imagem_id').AsInteger := UniMainModule.GerarSequence('seq_imagem_id');
  queryImagensVeiculo.FieldByName('veiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;
  TBlobField(queryImagensVeiculo.FieldByName('imagem')).LoadFromStream(AStream);
  queryImagensVeiculo.Post;
end;

procedure TFrameManutencaoVeiculo.ExecutaPesquisa;
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

  queryVeiculo.Close;
  queryVeiculo.SQL.Clear;
  queryVeiculo.SQL.Add('select * from veiculo');

  if not FramePainelFiltro.comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if FramePainelFiltro.comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'veiculo_id = ' + FramePainelFiltro.comboVeiculo.KeyValueStr;
  end;

  queryVeiculo.SQL.Add(LFiltro);

  queryVeiculo.Open;

//  queryVeiculoAfterScroll(nil);
end;

procedure TFrameManutencaoVeiculo.FramePainelFiltro1comboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoVeiculo.gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if Column.FieldName = 'status_financeiro' then
  begin
    if Column.Field.Value = 'ABERTO' then
      Attribs.Font.Color := clBlue
    else if Column.Field.Value = 'VENCIDO' then
      Attribs.Font.Color := clRed
    else if Column.Field.Value = 'PAGO' then
      Attribs.Font.Color := clGreen;
  end;

  if Odd(gridContaReceber.DataSource.DataSet.RecNo) then
    Attribs.Color := $00E9E9E9
  else
    Attribs.Color := clWhite;
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

  queryContasReceber.Close;
  queryContasReceber.SQL.Clear;
  queryContasReceber.SQL.Add('select');
  queryContasReceber.SQL.Add('    financeiro.financeiro_id,');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento,');
  queryContasReceber.SQL.Add('    financeiro.quantidade_parcelas,');
  queryContasReceber.SQL.Add('    financeiro.numero_parcela,');
  queryContasReceber.SQL.Add('    financeiro.status_financeiro,');
  queryContasReceber.SQL.Add('    financeiro.descricao,');
  queryContasReceber.SQL.Add('    financeiro.data_lancamento,');
  queryContasReceber.SQL.Add('    financeiro.valor_documento,');
  queryContasReceber.SQL.Add('    financeiro.veiculo_id,');
  queryContasReceber.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryContasReceber.SQL.Add('    financeiro.pessoa_id || '' - '' || pessoa.nome as cliente');
  queryContasReceber.SQL.Add('from');
  queryContasReceber.SQL.Add('    financeiro');

  queryContasReceber.SQL.Add('inner join veiculo');
  queryContasReceber.SQL.Add('on veiculo.veiculo_id = financeiro.veiculo_id');

  queryContasReceber.SQL.Add('inner join pessoa');
  queryContasReceber.SQL.Add('on pessoa.pessoa_id = financeiro.pessoa_id');

  queryContasReceber.SQL.Add('where financeiro.veiculo_id = :pveiculo_id');

  if queryVeiculo.RecordCount = 0 then
    queryContasReceber.ParamByName('pveiculo_id').AsInteger := 0
  else
    queryContasReceber.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;

  queryContasReceber.SQL.Add('order by');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento');

  queryContasReceber.Open;

  queryImagensVeiculo.Close;
  queryImagensVeiculo.SQL.Clear;
  queryImagensVeiculo.SQL.Add('select * from imagens_veiculo');
  queryImagensVeiculo.SQL.Add('where veiculo_id = :pveiculo_id');

  if queryVeiculo.RecordCount = 0 then
    queryImagensVeiculo.ParamByName('pveiculo_id').AsInteger := 0
  else
    queryImagensVeiculo.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;

  queryImagensVeiculo.Open;
end;

procedure TFrameManutencaoVeiculo.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa;
  UniMainModule.AlterarStatusFinanceiro;
end;

initialization
  RegisterClass(TFrameManutencaoVeiculo);

end.
