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
  uniDBEdit;

type
  TFormModalVenda = class(TFormModalModelo)
    groupVenda: TUniGroupBox;
    groupDados: TUniGroupBox;
    editDataVenda: TUniDBDateTimePicker;
    memoObservacaoVenda: TUniDBMemo;
    comboPessoa: TUniDBLookupComboBox;
    scrollVenda: TUniScrollBox;
    comboVeiculo: TUniDBLookupComboBox;
    editValorVeiculo: TUniDBFormattedNumberEdit;
    editTaxa: TUniDBFormattedNumberEdit;
    editQuantidadeParcelas: TUniDBFormattedNumberEdit;
    editValorParcela: TUniDBFormattedNumberEdit;
    editValorEntrada: TUniDBFormattedNumberEdit;
    editValorFinanciado: TUniDBFormattedNumberEdit;
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
    procedure buttonFecharClick(Sender: TObject);
    procedure editValorVeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FVendaId: Integer;
    procedure AbreQuery;
  public
    property VendaId: Integer read FVendaId write FVendaId;
  end;

function FormModalVenda: TFormModalVenda;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, CalculadoraFinanciamento;

function FormModalVenda: TFormModalVenda;
begin
  Result := TFormModalVenda(UniMainModule.GetFormInstance(TFormModalVenda));
end;

procedure TFormModalVenda.buttonFecharClick(Sender: TObject);
begin
  AbreQuery;
  inherited;
end;

procedure TFormModalVenda.editValorVeiculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  editValorParcela.Value := CalculadoraFinanciamento.CalcularValorParcela;
  CalculadoraFinanciamento.Free;
end;

procedure TFormModalVenda.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('venda_id').AsInteger := UniMainModule.GerarSequence('seq_venda_id');
end;

procedure TFormModalVenda.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('data_venda').AsDateTime := Now;
end;

procedure TFormModalVenda.UniFormShow(Sender: TObject);
begin
  inherited;
  AbreQuery;
end;

procedure TFormModalVenda.AbreQuery;
begin
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from venda');
  queryManutencao.SQL.Add('where venda_id = :pvenda_id');
  queryManutencao.ParamByName('pvenda_id').AsInteger := FVendaId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.SQL.Text := 'select * from pessoa';
  UniMainModule.queryCadastroPessoa.Open;

  UniMainModule.queryCadastroVeiculo.SQL.Text := 'select * from veiculo';
  UniMainModule.queryCadastroVeiculo.Open;
end;

end.
