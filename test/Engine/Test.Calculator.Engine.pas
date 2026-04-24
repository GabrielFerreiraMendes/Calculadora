unit Test.Calculator.Engine;

interface

uses
  DUnitX.TestFramework,
  Calculator.Engine,
  Calculator.Strategy;

type
  { Um Stub simples para testar o contexto sem depender de estrategias reais }
  TStubStrategy = class(TInterfacedObject, ICalculatorStrategy)
  public
    function Execute(const AFirstOperand, ASecondOperand: Double): Double;
    function GetOperationName: string;
  end;

  [TestFixture]
  TTestCalculatorEngine = class
  private
    FEngine: TCalculatorEngine;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestCalculateWithoutStrategyRaisesException;

    [Test]
    procedure TestCalculateWithStrategyDelegatesExecution;

    [Test]
    procedure TestGetActiveOperationName;
  end;

implementation

uses
  System.SysUtils;

{ TStubStrategy }

function TStubStrategy.Execute(const AFirstOperand, ASecondOperand: Double): Double;
begin
  Result := 999.0; // Valor fixo para validar se o Engine chama este stub
end;

function TStubStrategy.GetOperationName: string;
begin
  Result := 'Stub';
end;

{ TTestCalculatorEngine }

procedure TTestCalculatorEngine.Setup;
begin
  FEngine := TCalculatorEngine.Create;
end;

procedure TTestCalculatorEngine.TearDown;
begin
  FEngine.Free;
end;

procedure TTestCalculatorEngine.TestCalculateWithoutStrategyRaisesException;
begin
  Assert.WillRaise(
    procedure
    begin
      FEngine.Calculate(1, 1);
    end,
    EInvalidOpException,
    'Calcular sem estrategia nao lancou EInvalidOpException.'
  );
end;

procedure TTestCalculatorEngine.TestCalculateWithStrategyDelegatesExecution;
var
  LStub: ICalculatorStrategy;
  LResult: Double;
begin
  LStub := TStubStrategy.Create;
  FEngine.SetStrategy(LStub);
  
  LResult := FEngine.Calculate(0, 0);
  
  Assert.AreEqual(999.0, LResult, 0.0001, 'A execucao nao foi delegada para a estrategia corretamente.');
end;

procedure TTestCalculatorEngine.TestGetActiveOperationName;
var
  LStub: ICalculatorStrategy;
begin
  Assert.AreEqual('', FEngine.GetActiveOperationName, 'Sem estrategia o nome deveria ser vazio.');

  LStub := TStubStrategy.Create;
  FEngine.SetStrategy(LStub);

  Assert.AreEqual('Stub', FEngine.GetActiveOperationName, 'Nome da operacao nao corresponde ao da estrategia.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalculatorEngine);

end.
