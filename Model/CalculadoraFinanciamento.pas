unit CalculadoraFinanciamento;

interface

type
  TCalculadoraFinanciamento = class
  private
    FValorTotal: Double;
    FTaxaJuros: Double;
    FQuantidadeParcelas: Double;
    function CalcularJurosCompostos: Double;
  public
    constructor Create(ValorTotal: Double; TaxaJuros: Double; QuantidadeParcelas: Double);
    function CalcularValorParcela: Double;
  end;

implementation

uses
  Math;

constructor TCalculadoraFinanciamento.Create(ValorTotal: Double; TaxaJuros: Double; QuantidadeParcelas: Double);
begin
  FValorTotal := ValorTotal;
  FTaxaJuros := TaxaJuros;
  FQuantidadeParcelas := QuantidadeParcelas;
end;

function TCalculadoraFinanciamento.CalcularJurosCompostos: Double;
begin
  Result := FValorTotal * Power(1 + (FTaxaJuros * 0.01), FQuantidadeParcelas);
end;

function TCalculadoraFinanciamento.CalcularValorParcela: Double;
begin
  Result := 0;

  if FQuantidadeParcelas > 0 then
    Result := CalcularJurosCompostos / FQuantidadeParcelas;
end;

end.

