unit uFrameManutencaoContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniGUITypes, UniDateTimePicker, DateUtils, uniRadioGroup, uniCheckBox,
  uniColorButton, uniRadioButton, uniGroupBox, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TFrameManutencaoContasReceber = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonContaReceber: TUniButton;
    queryContasReceber: TFDQuery;
    dsContasReceber: TDataSource;
    panelFiltro: TUniPanel;
    gridContaReceber: TUniDBGrid;
    buttonStatusFinanceiro: TUniButton;
    checkAberto: TUniCheckBox;
    checkVencido: TUniCheckBox;
    checkPago: TUniCheckBox;
    panelStatusPago: TUniSimplePanel;
    panelStatusAberto: TUniSimplePanel;
    panelStatusVencido: TUniSimplePanel;
    comboPessoa: TUniDBLookupComboBox;
    comboVeiculo: TUniDBLookupComboBox;
    editDataInicial: TUniDateTimePicker;
    editDataFinal: TUniDateTimePicker;
    groupData: TUniGroupBox;
    radioIgual: TUniRadioButton;
    radioEntre: TUniRadioButton;
    radioNaoFiltrar: TUniRadioButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonContaReceberClick(Sender: TObject);
    procedure buttonStatusFinanceiroClick(Sender: TObject);
    procedure gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure radioIgualClick(Sender: TObject);
    procedure comboVeiculoChange(Sender: TObject);
    procedure checkAbertoChange(Sender: TObject);
    procedure editDataInicialChange(Sender: TObject);
    procedure comboPessoaChange(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    procedure ExecutaPesquisa;
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalContasReceber, uFormStatusFinanceiro;

procedure TFrameManutencaoContasReceber.buttonContaReceberClick(Sender: TObject);
begin
  if queryContasReceber.Active then
  begin
    if queryContasReceber.FieldByName('venda_id').AsInteger = 0 then
      FormModalContasReceber.FinanceiroId := queryContasReceber.FieldByName('financeiro_id').AsInteger;
  end;

  FormModalContasReceber.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryContasReceber.Refresh;
    end
  );
end;

procedure TFrameManutencaoContasReceber.buttonStatusFinanceiroClick(Sender: TObject);
begin
  if queryContasReceber.Active then
    FormStatusFinanceiro.FinanceiroId := queryContasReceber.FieldByName('financeiro_id').AsInteger;

  FormStatusFinanceiro.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        UniMainModule.AlterarStatusFinanceiro;
        queryContasReceber.Refresh;
    end
  );
end;

procedure TFrameManutencaoContasReceber.ExecutaPesquisa;
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
  queryContasReceber.SQL.Add('    financeiro.venda_id,');
  queryContasReceber.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryContasReceber.SQL.Add('    financeiro.pessoa_id || '' - '' || pessoa.nome as cliente');
  queryContasReceber.SQL.Add('from');
  queryContasReceber.SQL.Add('    financeiro');

  queryContasReceber.SQL.Add('inner join veiculo');
  queryContasReceber.SQL.Add('on veiculo.veiculo_id = financeiro.veiculo_id');

  queryContasReceber.SQL.Add('inner join pessoa');
  queryContasReceber.SQL.Add('on pessoa.pessoa_id = financeiro.pessoa_id');

  if not comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'financeiro.veiculo_id = ' + comboVeiculo.KeyValueStr;
  end;

  if not comboPessoa.ListSource.DataSet.IsEmpty then
  begin
    if comboPessoa.KeyValue > 0 then
      LFiltro := LFiltro + WhereAnd + 'financeiro.pessoa_id = ' + comboPessoa.KeyValueStr;
  end;

  if not checkAberto.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''ABERTO''';

  if not checkVencido.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''VENCIDO''';

  if not checkPago.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''PAGO''';

  if radioIgual.Checked then
    LFiltro := LFiltro + WhereAnd + 'to_char(financeiro.data_vencimento, ''dd/mm/yyyy'') = ' + QuotedStr(DateToStr(editDataInicial.DateTime));

  if radioEntre.Checked then
  begin
    LFiltro := LFiltro +
               WhereAnd +
               'financeiro.data_vencimento between to_date(' + QuotedStr(DateToStr(editDataInicial.DateTime)) + ', ''dd/mm/yyyy'')' +
               ' and to_date(' + QuotedStr(DateToStr(editDataFinal.DateTime)) + ', ''dd/mm/yyyy'')';
  end;

  queryContasReceber.SQL.Add(LFiltro);

  queryContasReceber.SQL.Add('order by');
  queryContasReceber.SQL.Add('    financeiro.veiculo_id,');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento');

  queryContasReceber.Open;

  queryContasReceber.FieldByName('venda_id').Visible := False;
end;

procedure TFrameManutencaoContasReceber.comboPessoaChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.comboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.editDataInicialChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.checkAbertoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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

procedure TFrameManutencaoContasReceber.UniFrameCreate(Sender: TObject);
begin
  UniMainModule.AlterarStatusFinanceiro;

  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');

  editDataInicial.DateTime := StartOfTheMonth(Now);
  editDataFinal.DateTime := EndOfTheMonth(Now);

  radioNaoFiltrar.Checked := True;
  radioIgualClick(nil);

  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.UniFrameDestroy(Sender: TObject);
begin
  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;

  if UniMainModule.queryCadastroVeiculo.Active then
    UniMainModule.queryCadastroVeiculo.Close;
end;

procedure TFrameManutencaoContasReceber.radioIgualClick(Sender: TObject);
begin
  if Sender = radioIgual then
    editDataInicial.DateTime := Now;

  editDataInicial.Enabled := radioIgual.Checked or radioEntre.Checked;
  editDataFinal.Enabled := radioEntre.Checked;
  ExecutaPesquisa;
end;

initialization
  RegisterClass(TFrameManutencaoContasReceber);

end.
