unit uFrameManutencaoContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniGUITypes;

type
  TFrameManutencaoContasReceber = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonContaReceber: TUniButton;
    queryContasReceber: TFDQuery;
    dsContasReceber: TDataSource;
    panelFiltro: TUniPanel;
    gridContaReceber: TUniDBGrid;
    buttonStatusFinanceiro: TUniButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonContaReceberClick(Sender: TObject);
    procedure buttonStatusFinanceiroClick(Sender: TObject);
    procedure gridContaReceberDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridContaReceberTitleClick(Column: TUniDBGridColumn);
  private
    procedure ExecutaPesquisa(AFiltro: string);
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormStatusFinanceiro;

procedure TFrameManutencaoContasReceber.buttonContaReceberClick(Sender: TObject);
begin
//
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

procedure TFrameManutencaoContasReceber.ExecutaPesquisa(AFiltro: string);
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

  if AFiltro <> EmptyStr then
    queryContasReceber.SQL.Add(AFiltro);

  queryContasReceber.SQL.Add('order by');
  queryContasReceber.SQL.Add('    financeiro.veiculo_id,');
  queryContasReceber.SQL.Add('    financeiro.data_vencimento');

  queryContasReceber.Open;
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

procedure TFrameManutencaoContasReceber.gridContaReceberTitleClick(Column: TUniDBGridColumn);
begin
  if queryContasReceber.IndexFieldNames = Column.FieldName then
    queryContasReceber.IndexFieldNames := Column.FieldName + ':D'
  else
    queryContasReceber.IndexFieldNames := Column.FieldName;
end;

procedure TFrameManutencaoContasReceber.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoContasReceber);

end.
