unit uFormModalSimulador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList, uniEdit,
  uniGroupBox;

type
  TFormModalSimulador = class(TFormModalModelo)
    groupSimulador: TUniGroupBox;
    editValorVeiculo: TUniFormattedNumberEdit;
    editQuantidadeParcelas: TUniFormattedNumberEdit;
    editTaxa: TUniFormattedNumberEdit;
    editValorParcela: TUniFormattedNumberEdit;
    editValorParcelaPrice: TUniFormattedNumberEdit;
    procedure editValorVeiculoExit(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private

  end;

function FormModalSimulador: TFormModalSimulador;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, CalculadoraFinanciamento, CalculadoraPrice;

function FormModalSimulador: TFormModalSimulador;
begin
  Result := TFormModalSimulador(UniMainModule.GetFormInstance(TFormModalSimulador));
end;

procedure TFormModalSimulador.editValorVeiculoExit(Sender: TObject);
var
  CalculadoraPrice: TCalculadoraPrice;
  Prestacao, TotalPago, SaldoDevedor: Double;

  CalculadoraFinanciamento: TCalculadoraFinanciamento;
begin
  inherited;

  if editValorVeiculo.Value = 0 then
    Exit;

  if editTaxa.Value = 0 then
    Exit;

  CalculadoraFinanciamento := TCalculadoraFinanciamento.Create(editValorVeiculo.Value, editTaxa.Value, editQuantidadeParcelas.Value);
  editValorParcela.Value := CalculadoraFinanciamento.CalcularValorParcela;
  CalculadoraFinanciamento.Free;

  CalculadoraPrice := TCalculadoraPrice.Create(editValorVeiculo.Value, editTaxa.Value, editQuantidadeParcelas.Value);
  editValorParcelaPrice.Value := CalculadoraPrice.CalcularPrestacao;
  TotalPago := CalculadoraPrice.CalcularTotalPago;
  SaldoDevedor := CalculadoraPrice.CalcularSaldoDevedor(6);
  CalculadoraPrice.Free;
end;

procedure TFormModalSimulador.UniFormShow(Sender: TObject);
begin
  inherited;
//
end;

procedure TFormModalSimulador.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//
end;

end.

//  if not CharInSet(Key, ['0'..'9', ',', '.']) then
//  begin
//    Key := #0;
//  end
//  else if (Key = '.') and (Pos('.', editValorVeiculo.Text) > 0) then
//  begin
//    Key := #0;
//  end
//  else if (Key = ',') and (Pos(',', editValorVeiculo.Text) > 0) then
//  begin
//    Key := '.';
//  end;
