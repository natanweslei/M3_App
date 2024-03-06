unit uFormAlertaFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniRadioGroup,
  uniPanel, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormAlertaFinanceiro = class(TUniForm)
    buttonConfirmar: TUniButton;
    gridContaReceber: TUniDBGrid;
    panelBotoes: TUniPanel;
    dsContasReceber: TDataSource;
    queryContasReceber: TFDQuery;
    procedure buttonConfirmarClick(Sender: TObject);
    procedure gridContaReceberDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormShow(Sender: TObject);
  end;

function FormAlertaFinanceiro: TFormAlertaFinanceiro;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormAlertaFinanceiro: TFormAlertaFinanceiro;
begin
  Result := TFormAlertaFinanceiro(UniMainModule.GetFormInstance(TFormAlertaFinanceiro));
end;

procedure TFormAlertaFinanceiro.buttonConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormAlertaFinanceiro.gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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

procedure TFormAlertaFinanceiro.UniFormShow(Sender: TObject);
begin
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

  queryContasReceber.SQL.Add('where financeiro.status_financeiro = ''VENCIDO''');

  queryContasReceber.SQL.Add('order by');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento');

  queryContasReceber.Open;
end;

end.
