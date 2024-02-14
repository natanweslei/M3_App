unit CalculadoraPrice;

interface

type
  TCalculadoraPrice = class
  private
    FCapital: Double;
    FTaxaJuros: Double;
    FPeriodos: Double;
  public
    constructor Create(Capital: Double; TaxaJuros: Double; Periodos: Double);
    function CalcularPrestacao: Double;
    function CalcularTotalPago: Double;
    function CalcularSaldoDevedor(Mes: Integer): Double;
  end;

implementation

uses
  Math;

{ TCalculadoraPrice }

constructor TCalculadoraPrice.Create(Capital: Double; TaxaJuros: Double; Periodos: Double);
begin
  FCapital := Capital;
  FTaxaJuros := TaxaJuros / 100; // Converte a taxa de juros para decimal
  FPeriodos := Periodos;
end;

function TCalculadoraPrice.CalcularPrestacao: Double;
var
  TaxaMensal: Double;
begin
  TaxaMensal := Power(1 + FTaxaJuros, FPeriodos);
  Result := FCapital * (FTaxaJuros * TaxaMensal) / (TaxaMensal - 1);
end;

function TCalculadoraPrice.CalcularTotalPago: Double;
begin
  Result := CalcularPrestacao * FPeriodos;
end;

function TCalculadoraPrice.CalcularSaldoDevedor(Mes: Integer): Double;
var
  TaxaMensal: Double;
  PagamentosAnteriores: Double;
begin
  TaxaMensal := Power(1 + FTaxaJuros, FPeriodos);
  PagamentosAnteriores := CalcularPrestacao * ((Power(1 + FTaxaJuros, Mes) - 1) / FTaxaJuros);
  Result := FCapital * (TaxaMensal - (Power(1 + FTaxaJuros, Mes) / TaxaMensal)) - PagamentosAnteriores;
end;

end.

