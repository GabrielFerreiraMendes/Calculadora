unit Test.Calculator.Factory;

interface

uses
  DUnitX.TestFramework,
  Calculator.Factory,
  Calculator.Strategy,
  Calculator.Operation.Addition; // Apenas para criar um stub real para testar

type
  [TestFixture]
  TTestOperationFactory = class
  private
    FFactory: TOperationFactory;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestRegisterOperationIncrementsCount;

    [Test]
    procedure TestGetOperationsReturnsArray;
  end;

implementation

procedure TTestOperationFactory.Setup;
begin
  FFactory := TOperationFactory.Create;
end;

procedure TTestOperationFactory.TearDown;
begin
  FFactory.Free;
end;

procedure TTestOperationFactory.TestRegisterOperationIncrementsCount;
var
  LOperations: TArray<ICalculatorStrategy>;
  LInitialCount, LFinalCount: Integer;
begin
  LOperations := FFactory.GetOperations;
  LInitialCount := Length(LOperations);

  FFactory.RegisterOperation(TAdditionOperation.Create);

  LOperations := FFactory.GetOperations;
  LFinalCount := Length(LOperations);

  Assert.AreEqual(LInitialCount + 1, LFinalCount, 'O registro nao incrementou o total de operacoes.');
end;

procedure TTestOperationFactory.TestGetOperationsReturnsArray;
var
  LOperations: TArray<ICalculatorStrategy>;
begin
  FFactory.RegisterOperation(TAdditionOperation.Create);
  LOperations := FFactory.GetOperations;
  
  Assert.IsTrue(Length(LOperations) > 0, 'O array retornado esta vazio ou nulo.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestOperationFactory);

end.
