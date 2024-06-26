unit uFormModalEntrada;

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
  TFormModalEntrada = class(TFormModalModelo)
    groupEntrada: TUniGroupBox;
    groupDados: TUniGroupBox;
    editDataEntrada: TUniDBDateTimePicker;
    memoObservacaoEntrada: TUniDBMemo;
    comboPessoa: TUniDBLookupComboBox;
    scrollEntrada: TUniScrollBox;
    comboVeiculo: TUniDBLookupComboBox;
    editValorVeiculo: TUniDBFormattedNumberEdit;
    editTaxa: TUniDBFormattedNumberEdit;
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
  private
    FEntradaId: Integer;
  public
    property EntradaId: Integer read FEntradaId write FEntradaId;
  end;

function FormModalEntrada: TFormModalEntrada;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalEntrada: TFormModalEntrada;
begin
  Result := TFormModalEntrada(UniMainModule.GetFormInstance(TFormModalEntrada));
end;

procedure TFormModalEntrada.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;

  queryManutencao.FieldByName('entrada_id').AsInteger := UniMainModule.GerarSequence('seq_entrada_id');
  queryManutencao.FieldByName('data_entrada').AsDateTime := Now;
end;

procedure TFormModalEntrada.UniFormShow(Sender: TObject);
begin
  inherited;

  queryManutencao.Close;
  queryManutencao.SQL.Add('select * from entrada');
  queryManutencao.SQL.Add('where entrada_id = :pentrada_id');
  queryManutencao.ParamByName('pentrada_id').AsInteger := FEntradaId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
end;

end.
