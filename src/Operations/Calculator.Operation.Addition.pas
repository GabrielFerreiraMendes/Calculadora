unit Calculator.Operation.Addition;

{
  Unit   : Calculator.Operation.Addition
  Desc   : Concrete Strategy — implementa a operacao de Adicao.
           Responsabilidade unica: somar dois operandos (SRP).
  Author : Calc Project
}

interface

uses
  Calculator.Strategy;

type
  /// <summary>
  ///   Estrategia concreta de adicao.
  ///   Herda de TInterfacedObject para suporte automatico a contagem de
  ///   referencias (gerenciamento de memoria via interfaces).
  /// </summary>
  TAdditionOperation = class(TInterfacedObject, ICalculatorStrategy)
  public
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    function GetOperationName: string;
  end;

implementation

{ TAdditionOperation }

function TAdditionOperation.Execute(const AFirstOperand,
  ASecondOperand: Double): Double;
begin
  Result := AFirstOperand + ASecondOperand;
end;

function TAdditionOperation.GetOperationName: string;
begin
  Result := 'Adi' + #231 + #227 + 'o';
end;

end.
