unit Test.Calculator.Operation.Multiplication;

interface

uses
  DUnitX.TestFramework,
  Calculator.Strategy,
  Calculator.Operation.Multiplication;

type
  [TestFixture]
  TTestMultiplicationOperation = class
  private
    FStrategy: ICalculatorStrategy;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Positive Numbers', '4,5,20')]
    [TestCase('By Zero', '5,0,0')]
    [TestCase('Negative Numbers', '-2,-3,6')]
    [TestCase('Positive and Negative', '5,-2,-10')]
    procedure TestExecute(const A, B, ExpectedResult: Double);

    [Test]
    procedure TestOperationName;
  end;

implementation

procedure TTestMultiplicationOperation.Setup;
begin
  FStrategy := TMultiplicationOperation.Create;
end;

procedure TTestMultiplicationOperation.TearDown;
begin
  FStrategy := nil;
end;

procedure TTestMultiplicationOperation.TestExecute(const A, B, ExpectedResult: Double);
var
  LResult: Double;
begin
  LResult := FStrategy.Execute(A, B);
  Assert.AreEqual(ExpectedResult, LResult, 0.0001, 'Erro no calculo de multiplicacao.');
end;

procedure TTestMultiplicationOperation.TestOperationName;
begin
  Assert.AreEqual('Multiplica' + #231 + #227 + 'o', FStrategy.GetOperationName, 'Nome da operacao incorreto.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestMultiplicationOperation);

end.
