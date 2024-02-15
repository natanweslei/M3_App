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
    editValorEntrada: TUniFormattedNumberEdit;
    editValorFinanciado: TUniFormattedNumberEdit;
    procedure editValorVeiculoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

procedure TFormModalSimulador.editValorVeiculoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  CalculadoraFinanciamento: TCalculadoraFinanciamento;
begin
  inherited;

  if editValorVeiculo.Value = 0 then
    Exit;

  editValorFinanciado.Value := editValorVeiculo.Value - editValorEntrada.Value;

  if editTaxa.Value = 0 then
    Exit;

  CalculadoraFinanciamento := TCalculadoraFinanciamento.Create(
    editValorVeiculo.Value - editValorEntrada.Value,
    editTaxa.Value,
    editQuantidadeParcelas.Value
  );
  editValorParcela.Value := CalculadoraFinanciamento.CalcularValorParcela;
  CalculadoraFinanciamento.Free;
end;

end.
