unit Calculator.Strategy;

{
  Unit   : Calculator.Strategy
  Desc   : Define o contrato ICalculatorStrategy — interface central do
           padrao Strategy. Qualquer nova operacao deve implementar esta
           interface, sem alterar codigo existente (principio Open/Closed).
  Author : Calc Project
}

interface

type
  /// <summary>
  ///   Contrato para todas as operacoes matematicas da calculadora.
  ///   Implementa o papel de "Strategy" no padrao homonimo.
  /// </summary>
  ICalculatorStrategy = interface
    ['{3B4F6E2A-91C7-4D8B-A0F3-55E8C2D7B1A9}']
    /// <summary>Executa a operacao sobre os dois operandos.</summary>
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    /// <summary>Retorna o nome legivel da operacao (exibido no ComboBox).</summary>
    function GetOperationName: string;
  end;

implementation

end.
