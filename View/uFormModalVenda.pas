unit uFormModalVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList,
  uniDateTimePicker, uniDBDateTimePicker, uniGroupBox, uniMemo, uniDBMemo,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit,
  uniDBEdit, uniBasicGrid, uniDBGrid, Datasnap.DBClient;

type
  TFormModalVenda = class(TFormModalModelo)
    groupVenda: TUniGroupBox;
    groupDados: TUniGroupBox;
    editDataVenda: TUniDBDateTimePicker;
    memoObservacaoVenda: TUniDBMemo;
    comboPessoa: TUniDBLookupComboBox;
    comboVeiculo: TUniDBLookupComboBox;
    editValorVeiculo: TUniDBFormattedNumberEdit;
    editTaxa: TUniDBFormattedNumberEdit;
    editQuantidadeParcelas: TUniDBFormattedNumberEdit;
    editValorParcela: TUniDBFormattedNumberEdit;
    editValorEntrada: TUniDBFormattedNumberEdit;
    editValorFinanciado: TUniDBFormattedNumberEdit;
    gridContasReceber: TUniDBGrid;
    dsContasReceber: TDataSource;
    queryContasReceber: TFDQuery;
    editPrimeiraParcela: TUniDBDateTimePicker;
    cdParcelas: TClientDataSet;
    cdParcelasdata_vencimento: TDateField;
    cdParcelasquantidade_parcelas: TIntegerField;
    cdParcelasnumero_parcela: TIntegerField;
    cdParcelasvalor_documento: TFloatField;
    comboEmpresa: TUniDBLookupComboBox;
    comboVendedor: TUniDBLookupComboBox;
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
    procedure buttonFecharClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonNovoClick(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure editValorEntradaChangeValue(Sender: TObject);
    procedure editQuantidadeParcelasChange(Sender: TObject);
    procedure editValorVeiculoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editPrimeiraParcelaChange(Sender: TObject);
  private
    FVendaId: Integer;
    procedure AbreQuery;
    procedure CalcularValorParcela;
    procedure GerarFinanceiro;
    procedure ExcluirFinanceiro;
    function TemFinanceiroPago: Integer;
  protected
    procedure VerificarDados; override;
  public
    property VendaId: Integer read FVendaId write FVendaId;
  end;

function FormModalVenda: TFormModalVenda;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, CalculadoraFinanciamento, Math;

function FormModalVenda: TFormModalVenda;
begin
  Result := TFormModalVenda(UniMainModule.GetFormInstance(TFormModalVenda));
end;

procedure TFormModalVenda.buttonExcluirClick(Sender: TObject);
begin
  ExcluirFinanceiro;
  cdParcelas.EmptyDataSet;
  inherited;
end;

procedure TFormModalVenda.buttonFecharClick(Sender: TObject);
begin
  AbreQuery;
  inherited;
end;

procedure TFormModalVenda.CalcularValorParcela;
var
  CalculadoraFinanciamento: TCalculadoraFinanciamento;
begin
  inherited;

  if editValorVeiculo.Value = 0 then
    Exit;

  editValorFinanciado.Value := editValorVeiculo.Value - editValorEntrada.Value;

  if editTaxa.Value = 0 then
    Exit;

  if editQuantidadeParcelas.Value = 0 then
    Exit;

  CalculadoraFinanciamento := TCalculadoraFinanciamento.Create(
    editValorVeiculo.Value - editValorEntrada.Value,
    editTaxa.Value,
    editQuantidadeParcelas.Value
  );
  try
    editValorParcela.Value := CalculadoraFinanciamento.CalcularValorParcela;
  finally
    CalculadoraFinanciamento.Free;
  end;
end;

procedure TFormModalVenda.GerarFinanceiro;
var
  i: Integer;
begin
  inherited;

  cdParcelas.EmptyDataSet;

  if editValorVeiculo.Value = 0 then
    Exit;

  if editTaxa.Value = 0 then
    Exit;

  if editQuantidadeParcelas.Value = 0 then
    Exit;

  if editValorParcela.Value <= 0 then
    Exit;

  if editPrimeiraParcela.DateTime = 0 then
    Exit;

  for i := 1 to Round(editQuantidadeParcelas.Value) do
  begin
    cdParcelas.Append;

    cdParcelasvalor_documento.Value := RoundTo(editValorParcela.Value, -2);

    if i = 1 then
      cdParcelasdata_vencimento.Value := editPrimeiraParcela.DateTime
    else
      cdParcelasdata_vencimento.Value := IncMonth(editPrimeiraParcela.DateTime, i -1);

    cdParcelasquantidade_parcelas.Value := Round(editQuantidadeParcelas.Value);
    cdParcelasnumero_parcela.Value := i;

    cdParcelas.Post;
  end;
end;

procedure TFormModalVenda.ExcluirFinanceiro;
var
  queryContasReceberDelete: TFDQuery;
begin
  queryContasReceberDelete := TFDQuery.Create(nil);
  queryContasReceberDelete.Connection := UniMainModule.Conexao;
  queryContasReceberDelete.SQL.Clear;
  queryContasReceberDelete.SQL.Add('delete from financeiro where venda_id = :pvenda_id');
  queryContasReceberDelete.ParamByName('pvenda_id').AsInteger := FVendaId;
  queryContasReceberDelete.ExecSQL;
  queryContasReceberDelete.Free;
end;

procedure TFormModalVenda.buttonGravarClick(Sender: TObject);
begin
  inherited;

  ExcluirFinanceiro;

  cdParcelas.First;

  while not cdParcelas.Eof do
  begin
    queryContasReceber.Append;

    queryContasReceber.FieldByName('financeiro_id').AsInteger := UniMainModule.GerarSequence('seq_financeiro_id');
    queryContasReceber.FieldByName('tipogasto_id').AsInteger := 1;
    queryContasReceber.FieldByName('descricao').AsString := ' VENDA: ' + queryManutencao.FieldByName('venda_id').AsString;
    queryContasReceber.FieldByName('valor_documento').AsFloat := cdParcelasvalor_documento.Value;
    queryContasReceber.FieldByName('data_lancamento').AsDateTime := Now;
    queryContasReceber.FieldByName('data_vencimento').AsDateTime := cdParcelasdata_vencimento.Value;
    queryContasReceber.FieldByName('pessoa_id').AsInteger := comboPessoa.DataSource.DataSet.FieldByName('pessoa_id').AsInteger;
    queryContasReceber.FieldByName('quantidade_parcelas').AsInteger := cdParcelasquantidade_parcelas.Value;
    queryContasReceber.FieldByName('numero_parcela').AsInteger := cdParcelasnumero_parcela.Value;
    queryContasReceber.FieldByName('veiculo_id').AsInteger := comboVeiculo.DataSource.DataSet.FieldByName('veiculo_id').AsInteger;
    queryContasReceber.FieldByName('tipo_financeiro').AsString := 'CONTA_RECEBER';
    queryContasReceber.FieldByName('status_financeiro').AsString := 'ABERTO';
    queryContasReceber.FieldByName('venda_id').AsInteger := queryManutencao.FieldByName('venda_id').AsInteger;

    queryContasReceber.Post;
    cdParcelas.Next;
  end;
end;

procedure TFormModalVenda.buttonNovoClick(Sender: TObject);
begin
  cdParcelas.EmptyDataSet;

  inherited;
end;

procedure TFormModalVenda.editPrimeiraParcelaChange(Sender: TObject);
begin
  inherited;
  CalcularValorParcela;
  GerarFinanceiro;
end;

procedure TFormModalVenda.editQuantidadeParcelasChange(Sender: TObject);
begin
  inherited;
  GerarFinanceiro;
end;

procedure TFormModalVenda.editValorEntradaChangeValue(Sender: TObject);
begin
  inherited;
  if (Sender as TUniDBFormattedNumberEdit).Value < 0 then
    (Sender as TUniDBFormattedNumberEdit).Value := 0;
end;

procedure TFormModalVenda.editValorVeiculoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularValorParcela;
  GerarFinanceiro;
end;

procedure TFormModalVenda.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;

  queryManutencao.FieldByName('venda_id').AsInteger := UniMainModule.GerarSequence('seq_venda_id');
  queryManutencao.FieldByName('data_venda').AsDateTime := Now;
  queryManutencao.FieldByName('primeira_parcela').AsDateTime := Now;
end;

procedure TFormModalVenda.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if queryManutencao.Active then
    queryManutencao.Close;

  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;

  if UniMainModule.queryCadastroVeiculo.Active then
    UniMainModule.queryCadastroVeiculo.Close;

  if UniMainModule.queryCadastroEmpresa.Active then
    UniMainModule.queryCadastroEmpresa.Close;

  if queryContasReceber.Active then
    queryContasReceber.Close;

  cdParcelas.EmptyDataSet;
end;

procedure TFormModalVenda.UniFormShow(Sender: TObject);
begin
  inherited;
  AbreQuery;
end;

function TFormModalVenda.TemFinanceiroPago: Integer;
var
  LQueryVencido: TFDQuery;
begin
  LQueryVencido := TFDQuery.Create(nil);
  LQueryVencido.Connection := UniMainModule.Conexao;
  LQueryVencido.Close;
  LQueryVencido.SQL.Clear;
  LQueryVencido.SQL.Add('select count(*) from financeiro where venda_id = :pvenda_id and status_financeiro = ''PAGO''');
  LQueryVencido.ParamByName('pvenda_id').AsInteger := queryManutencao.FieldByName('venda_id').AsInteger;

  LQueryVencido.Open;

  Result := LQueryVencido.RecordCount;

  LQueryVencido.Free;
end;

procedure TFormModalVenda.VerificarDados;
begin
  inherited;

  if TemFinanceiroPago > 0 then
  begin
    MessageDlg('Existe financeiro PAGO gerado para esta venda!', mtWarning, [mbOK]);
    Abort;
  end;

  if queryManutencao.FieldByName('pessoa_id').AsInteger = 0 then
  begin
    MessageDlg('É necessário selecionar o cliente!', mtWarning, [mbOK]);

    if comboPessoa.CanFocus then
      comboPessoa.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('vendedor_id').AsInteger = 0 then
  begin
    MessageDlg('É necessário selecionar o vendedor!', mtWarning, [mbOK]);

    if comboVendedor.CanFocus then
      comboVendedor.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('veiculo_id').AsInteger = 0 then
  begin
    MessageDlg('É necessário selecionar o veículo!', mtWarning, [mbOK]);

    if comboVeiculo.CanFocus then
      comboVeiculo.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('empresa_id').AsInteger = 0 then
  begin
    MessageDlg('É necessário selecionar a empresa!', mtWarning, [mbOK]);

    if comboEmpresa.CanFocus then
      comboEmpresa.SetFocus;

    Abort;
  end;

  if editDataVenda.DateTime = 0 then
  begin
    MessageDlg('É necessário selecionar a data da venda!', mtWarning, [mbOK]);

    if editDataVenda.CanFocus then
      editDataVenda.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('valor_veiculo').AsInteger = 0 then
  begin
    MessageDlg('É necessário informar o valor do veículo!', mtWarning, [mbOK]);

    if editValorVeiculo.CanFocus then
      editValorVeiculo.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('quantidade_parcelas_veiculo').AsInteger = 0 then
  begin
    MessageDlg('É necessário informar a quantidade de parcelas!', mtWarning, [mbOK]);

    if editQuantidadeParcelas.CanFocus then
      editQuantidadeParcelas.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('taxa_veiculo').AsInteger = 0 then
  begin
    MessageDlg('É necessário informar a taxa!', mtWarning, [mbOK]);

    if editTaxa.CanFocus then
      editTaxa.SetFocus;

    Abort;
  end;
end;

procedure TFormModalVenda.AbreQuery;
begin
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from venda');
  queryManutencao.SQL.Add('where venda_id = :pvenda_id');
  queryManutencao.ParamByName('pvenda_id').AsInteger := FVendaId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
  UniMainModule.queryCadastroEmpresa.Open('select * from empresa');

  queryContasReceber.Open('select * from financeiro where financeiro_id is null');

  GerarFinanceiro;
end;

end.
