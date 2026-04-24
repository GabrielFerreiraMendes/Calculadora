unit Calculator.Factory;

{
  Unit   : Calculator.Factory
  Desc   : Implementa o padrao Factory Method para registro e recuperacao
           de estrategias de calculo.
           - Centraliza a criacao e o ciclo de vida de cada ICalculatorStrategy.
           - Para adicionar uma nova operacao: criar a classe + chamar
             RegisterOperation — nenhum codigo existente precisa mudar (OCP).
  Author : Calc Project
}

interface

uses
  System.Generics.Collections,
  Calculator.Strategy;

type
  /// <summary>
  ///   Factory responsavel pelo registro e fornecimento de estrategias.
  ///   Implementa o papel de "Creator" no padrao Factory Method.
  /// </summary>
  TOperationFactory = class
  strict private
    FOperations: TList<ICalculatorStrategy>;
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>Registra uma nova estrategia na fabrica.</summary>
    procedure RegisterOperation(const AStrategy: ICalculatorStrategy);

    /// <summary>
    ///   Retorna todas as estrategias registradas como array.
    ///   Usado pela View para popular o TComboBox dinamicamente.
    /// </summary>
    function GetOperations: TArray<ICalculatorStrategy>;
  end;

implementation

{ TOperationFactory }

constructor TOperationFactory.Create;
begin
  inherited Create;
  FOperations := TList<ICalculatorStrategy>.Create;
end;

destructor TOperationFactory.Destroy;
begin
  FOperations.Free;
  inherited Destroy;
end;

procedure TOperationFactory.RegisterOperation(
  const AStrategy: ICalculatorStrategy);
begin
  FOperations.Add(AStrategy);
end;

function TOperationFactory.GetOperations: TArray<ICalculatorStrategy>;
begin
  Result := FOperations.ToArray;
end;

end.
