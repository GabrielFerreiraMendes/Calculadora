unit Test.Calculator.Operation.Addition;

interface

uses
  DUnitX.TestFramework,
  Calculator.Strategy,
  Calculator.Operation.Addition;

type
  [TestFixture]
  TTestAdditionOperation = class
  private
    FStrategy: ICalculatorStrategy;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Positive Numbers', '2,3,5')]
    [TestCase('Negative Numbers', '-2,-3,-5')]
    [TestCase('Positive and Negative', '5,-2,3')]
    [TestCase('Decimals', '2.5,2.5,5')]
    procedure TestExecute(const A, B, ExpectedResult: Double);

    [Test]
    procedure TestOperationName;
  end;

implementation

procedure TTestAdditionOperation.Setup;
begin
  FStrategy := TAdditionOperation.Create;
end;

procedure TTestAdditionOperation.TearDown;
begin
  FStrategy := nil;
end;

procedure TTestAdditionOperation.TestExecute(const A, B, ExpectedResult: Double);
var
  LResult: Double;
begin
  LResult := FStrategy.Execute(A, B);
  Assert.AreEqual(ExpectedResult, LResult, 0.0001, 'Erro no calculo de adicao.');
end;

procedure TTestAdditionOperation.TestOperationName;
begin
  Assert.AreEqual('Adi' + #231 + #227 + 'o', FStrategy.GetOperationName, 'Nome da operacao incorreto.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestAdditionOperation);

end.
