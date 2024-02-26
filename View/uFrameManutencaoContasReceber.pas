unit uFrameManutencaoContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniGUITypes, uFramePainelFiltro, UniDateTimePicker, DateUtils,
  uniRadioGroup, uniCheckBox, uniColorButton;

type
  TFrameManutencaoContasReceber = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonContaReceber: TUniButton;
    queryContasReceber: TFDQuery;
    dsContasReceber: TDataSource;
    panelFiltro: TUniPanel;
    gridContaReceber: TUniDBGrid;
    buttonStatusFinanceiro: TUniButton;
    FramePainelFiltro: TFramePainelFiltro;
    checkAberto: TUniCheckBox;
    checkVencido: TUniCheckBox;
    checkPago: TUniCheckBox;
    panelStatusPago: TUniSimplePanel;
    panelStatusAberto: TUniSimplePanel;
    panelStatusVencido: TUniSimplePanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonContaReceberClick(Sender: TObject);
    procedure buttonStatusFinanceiroClick(Sender: TObject);
    procedure gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure FramePainelFiltroradioIgualClick(Sender: TObject);
    procedure FramePainelFiltrocomboVeiculoChange(Sender: TObject);
    procedure checkAbertoChange(Sender: TObject);
    procedure FramePainelFiltroeditDataInicialChange(Sender: TObject);
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
    FormModalContasReceber.FinanceiroId := queryContasReceber.FieldByName('financeiro_id').AsInteger;

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
  queryContasReceber.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryContasReceber.SQL.Add('    financeiro.pessoa_id || '' - '' || pessoa.nome as cliente');
  queryContasReceber.SQL.Add('from');
  queryContasReceber.SQL.Add('    financeiro');

  queryContasReceber.SQL.Add('inner join veiculo');
  queryContasReceber.SQL.Add('on veiculo.veiculo_id = financeiro.veiculo_id');

  queryContasReceber.SQL.Add('inner join pessoa');
  queryContasReceber.SQL.Add('on pessoa.pessoa_id = financeiro.pessoa_id');

  if not FramePainelFiltro.comboVeiculo.ListSource.DataSet.IsEmpty then
  begin
    if FramePainelFiltro.comboVeiculo.KeyValue > 0 then
      LFiltro := WhereAnd + 'financeiro.veiculo_id = ' + FramePainelFiltro.comboVeiculo.KeyValueStr;
  end;

  if not FramePainelFiltro.comboPessoa.ListSource.DataSet.IsEmpty then
  begin
    if FramePainelFiltro.comboPessoa.KeyValue > 0 then
      LFiltro := LFiltro + WhereAnd + 'financeiro.pessoa_id = ' + FramePainelFiltro.comboPessoa.KeyValueStr;
  end;

  if not checkAberto.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''ABERTO''';

  if not checkVencido.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''VENCIDO''';

  if not checkPago.Checked then
    LFiltro := LFiltro + WhereAnd + 'financeiro.status_financeiro <> ''PAGO''';

  if FramePainelFiltro.radioIgual.Checked then
    LFiltro := LFiltro + WhereAnd + 'to_char(financeiro.data_vencimento, ''dd/mm/yyyy'') = ' + QuotedStr(DateToStr(FramePainelFiltro.editDataInicial.DateTime));

  if FramePainelFiltro.radioEntre.Checked then
  begin
    LFiltro := LFiltro +
               WhereAnd +
               'financeiro.data_vencimento between to_date(' + QuotedStr(DateToStr(FramePainelFiltro.editDataInicial.DateTime)) + ', ''dd/mm/yyyy'')' +
               ' and to_date(' + QuotedStr(DateToStr(FramePainelFiltro.editDataFinal.DateTime)) + ', ''dd/mm/yyyy'')';
  end;

  queryContasReceber.SQL.Add(LFiltro);

  queryContasReceber.SQL.Add('order by');
  queryContasReceber.SQL.Add('    financeiro.veiculo_id,');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento');

  queryContasReceber.Open;
end;

procedure TFrameManutencaoContasReceber.FramePainelFiltrocomboVeiculoChange(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.FramePainelFiltroeditDataInicialChange(Sender: TObject);
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
  FramePainelFiltro.editDataInicial.DateTime := StartOfTheMonth(Now);
  FramePainelFiltro.editDataFinal.DateTime := EndOfTheMonth(Now);
  FramePainelFiltro.radioNaoFiltrar.Checked := True;
  FramePainelFiltroradioIgualClick(nil);
  ExecutaPesquisa;
end;

procedure TFrameManutencaoContasReceber.FramePainelFiltroradioIgualClick(Sender: TObject);
begin
  FramePainelFiltro.editDataInicial.Enabled := FramePainelFiltro.radioIgual.Checked or FramePainelFiltro.radioEntre.Checked;
  FramePainelFiltro.editDataFinal.Enabled := FramePainelFiltro.radioEntre.Checked;
  ExecutaPesquisa;
end;

initialization
  RegisterClass(TFrameManutencaoContasReceber);

end.
