unit Calculator.Operation.Multiplication;

{
  Unit   : Calculator.Operation.Multiplication
  Desc   : Concrete Strategy — implementa a operacao de Multiplicacao.
  Author : Calc Project
}

interface

uses
  Calculator.Strategy;

type
  /// <summary>
  ///   Estrategia concreta de multiplicacao.
  /// </summary>
  TMultiplicationOperation = class(TInterfacedObject, ICalculatorStrategy)
  public
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    function GetOperationName: string;
  end;

implementation

{ TMultiplicationOperation }

function TMultiplicationOperation.Execute(const AFirstOperand,
  ASecondOperand: Double): Double;
begin
  Result := AFirstOperand * ASecondOperand;
end;

function TMultiplicationOperation.GetOperationName: string;
begin
  Result := 'Multiplica' + #231 + #227 + 'o';
end;

end.
