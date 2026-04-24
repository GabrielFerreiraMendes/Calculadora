unit Calculator.Operation.Subtraction;

{
  Unit   : Calculator.Operation.Subtraction
  Desc   : Concrete Strategy — implementa a operacao de Subtracao.
  Author : Calc Project
}

interface

uses
  Calculator.Strategy;

type
  /// <summary>
  ///   Estrategia concreta de subtracao.
  /// </summary>
  TSubtractionOperation = class(TInterfacedObject, ICalculatorStrategy)
  public
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    function GetOperationName: string;
  end;

implementation

{ TSubtractionOperation }

function TSubtractionOperation.Execute(const AFirstOperand,
  ASecondOperand: Double): Double;
begin
  Result := AFirstOperand - ASecondOperand;
end;

function TSubtractionOperation.GetOperationName: string;
begin
  Result := 'Subtra' + #231 + #227 + 'o';
end;

end.
