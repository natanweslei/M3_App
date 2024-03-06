unit uFormModalContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf, uniDBEdit, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses, uniScrollBox, uniButton,
  uniGUIBaseClasses, uniPanel, uniImageList, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker, uniEdit;

type
  TFormModalContasReceber = class(TFormModalModelo)
    scrollGasto: TUniScrollBox;
    panelTipoGasto: TUniPanel;
    gridTipoGasto: TUniDBGrid;
    comboResponsavel: TUniDBLookupComboBox;
    comboVeiculo: TUniDBLookupComboBox;
    editDataEntrada: TUniDBDateTimePicker;
    editValorGasto: TUniDBFormattedNumberEdit;
    comboTipoGasto: TUniDBLookupComboBox;
    editDescricaoGasto: TUniDBEdit;
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
  private
    FFinanceiroId: Integer;
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

procedure TFormModalContasReceber.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('gasto_id').AsInteger := UniMainModule.GerarSequence('seq_gasto_id');
end;

procedure TFormModalContasReceber.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('data_gasto').AsDateTime := Now;
end;

procedure TFormModalContasReceber.UniFormShow(Sender: TObject);
begin
  inherited;

  queryManutencao.Close;
  queryManutencao.SQL.Add('select * from gasto');
  queryManutencao.SQL.Add('where gasto_id = :pgasto_id');
  queryManutencao.ParamByName('pgasto_id').AsInteger := FFinanceiroId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.Open('select * from pessoa where operador');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
  UniMainModule.queryCadastroTipoGasto.Open('select * from tipo_gasto');
end;

end.
