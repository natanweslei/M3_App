unit uFormModalContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf, uniDBEdit, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses, uniScrollBox, uniButton,
  uniGUIBaseClasses, uniPanel, uniImageList, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker, uniEdit,
  uniGroupBox;

type
  TFormModalContasReceber = class(TFormModalModelo)
    scrollContasReceber: TUniScrollBox;
    comboCliente: TUniDBLookupComboBox;
    comboVeiculo: TUniDBLookupComboBox;
    editDataVencimento: TUniDBDateTimePicker;
    editValorDocumento: TUniDBFormattedNumberEdit;
    comboTipoGasto: TUniDBLookupComboBox;
    editDescricao: TUniDBEdit;
    groupDados: TUniGroupBox;
    groupDados3: TUniGroupBox;
    groupDados2: TUniGroupBox;
    comboEmpresa: TUniDBLookupComboBox;
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFinanceiroId: Integer;
  protected
    procedure VerificarDados; override;
  public
    property FinanceiroId: Integer read FFinanceiroId write FFinanceiroId;
  end;

function FormModalContasReceber: TFormModalContasReceber;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalContasReceber: TFormModalContasReceber;
begin
  Result := TFormModalContasReceber(UniMainModule.GetFormInstance(TFormModalContasReceber));
end;

procedure TFormModalContasReceber.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('financeiro_id').AsInteger := UniMainModule.GerarSequence('seq_financeiro_id');
  queryManutencao.FieldByName('data_lancamento').AsDateTime := Now;
  queryManutencao.FieldByName('data_vencimento').AsDateTime := Now;
  queryManutencao.FieldByName('quantidade_parcelas').AsInteger := 1;
  queryManutencao.FieldByName('numero_parcela').AsInteger := 1;
  queryManutencao.FieldByName('tipo_financeiro').AsString := 'CONTA_RECEBER';
  queryManutencao.FieldByName('status_financeiro').AsString := 'ABERTO';
end;

procedure TFormModalContasReceber.UniFormShow(Sender: TObject);
begin
  inherited;
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from financeiro');
  queryManutencao.SQL.Add('where financeiro_id = :pfinanceiro_id');
  queryManutencao.ParamByName('pfinanceiro_id').AsInteger := FFinanceiroId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
  UniMainModule.queryCadastroTipoGasto.Open('select * from tipo_gasto');
  UniMainModule.queryCadastroEmpresa.Open('select * from empresa');
end;

procedure TFormModalContasReceber.VerificarDados;
begin
  inherited;

  if queryManutencao.FieldByName('pessoa_id').AsInteger = 0 then
  begin
    MessageDlg('É necessário selecionar o cliente!', mtWarning, [mbOK]);

    if comboCliente.CanFocus then
      comboCliente.SetFocus;

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

  if editDataVencimento.DateTime = 0 then
  begin
    MessageDlg('É necessário selecionar a data do vencimento!', mtWarning, [mbOK]);

    if editDataVencimento.CanFocus then
      editDataVencimento.SetFocus;

    Abort;
  end;

  if queryManutencao.FieldByName('valor_documento').AsInteger = 0 then
  begin
    MessageDlg('É necessário informar o valor do documento!', mtWarning, [mbOK]);

    if editValorDocumento.CanFocus then
      editValorDocumento.SetFocus;

    Abort;
  end;

  if Trim(queryManutencao.FieldByName('descricao').AsString) = EmptyStr then
  begin
    MessageDlg('É necessário informar a descrição do documento!', mtWarning, [mbOK]);

    if editDescricao.CanFocus then
      editDescricao.SetFocus;

    Abort;
  end;
end;

procedure TFormModalContasReceber.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if queryManutencao.Active then
    queryManutencao.Close;

  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;

  if UniMainModule.queryCadastroVeiculo.Active then
    UniMainModule.queryCadastroVeiculo.Close;

  if UniMainModule.queryCadastroTipoGasto.Active then
    UniMainModule.queryCadastroTipoGasto.Close;

  if UniMainModule.queryCadastroEmpresa.Active then
    UniMainModule.queryCadastroEmpresa.Close;
end;

end.
