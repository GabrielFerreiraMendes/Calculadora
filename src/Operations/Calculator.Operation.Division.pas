unit Calculator.Operation.Division;

{
  Unit   : Calculator.Operation.Division
  Desc   : Concrete Strategy — implementa a operacao de Divisao.
           Protege contra divisao por zero lancando EDivByZero com
           mensagem clara ao usuario.
  Author : Calc Project
}

interface

uses
  Calculator.Strategy;

type
  /// <summary>
  ///   Estrategia concreta de divisao.
  ///   Lanca EDivByZero quando o divisor for zero.
  /// </summary>
  TDivisionOperation = class(TInterfacedObject, ICalculatorStrategy)
  public
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    function GetOperationName: string;
  end;

implementation

uses
  System.SysUtils;

{ TDivisionOperation }

function TDivisionOperation.Execute(const AFirstOperand,
  ASecondOperand: Double): Double;
begin
  if ASecondOperand = 0 then
    raise EDivByZero.Create('Divis' + #227 + 'o por zero n' + #227
      + 'o ' + #233 + ' permitida.');

  Result := AFirstOperand / ASecondOperand;
end;

function TDivisionOperation.GetOperationName: string;
begin
  Result := 'Divis' + #227 + 'o';
end;

end.
