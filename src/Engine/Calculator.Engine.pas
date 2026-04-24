unit Calculator.Engine;

{
  Unit   : Calculator.Engine
  Desc   : Contexto do padrao Strategy. Mantem a referencia a estrategia
           ativa e delega o calculo a ela, isolando completamente a View
           de qualquer logica de negocio (DIP — a View depende desta
           abstracao, nao de classes concretas).
  Author : Calc Project
}

interface

uses
  Calculator.Strategy;

type
  /// <summary>
  ///   Motor da calculadora — "Context" no padrao Strategy.
  ///   Recebe uma ICalculatorStrategy e delega a ela o calculo.
  /// </summary>
  TCalculatorEngine = class
  strict private
    FStrategy: ICalculatorStrategy;
  public
    /// <summary>Define a estrategia ativa a ser usada no proximo calculo.</summary>
    procedure SetStrategy(const AStrategy: ICalculatorStrategy);

    /// <summary>
    ///   Executa o calculo delegando a estrategia ativa.
    ///   Lanca EInvalidOperation se nenhuma estrategia foi definida.
    /// </summary>
    function Calculate(const AFirstOperand, ASecondOperand: Double): Double;

    /// <summary>Nome da operacao ativa; vazio se nenhuma foi definida.</summary>
    function GetActiveOperationName: string;
  end;

implementation

uses
  System.SysUtils;

{ TCalculatorEngine }

procedure TCalculatorEngine.SetStrategy(const AStrategy: ICalculatorStrategy);
begin
  FStrategy := AStrategy;
end;

function TCalculatorEngine.Calculate(const AFirstOperand,
  ASecondOperand: Double): Double;
begin
  if not Assigned(FStrategy) then
    raise EInvalidOpException.Create(
      'Nenhuma opera' + #231 + #227 + 'o selecionada.');

  Result := FStrategy.Execute(AFirstOperand, ASecondOperand);
end;

function TCalculatorEngine.GetActiveOperationName: string;
begin
  if Assigned(FStrategy) then
    Result := FStrategy.GetOperationName
  else
    Result := '';
end;

end.
