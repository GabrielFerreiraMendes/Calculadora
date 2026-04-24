unit Test.Calculator.Operation.Subtraction;

interface

uses
  DUnitX.TestFramework,
  Calculator.Strategy,
  Calculator.Operation.Subtraction;

type
  [TestFixture]
  TTestSubtractionOperation = class
  private
    FStrategy: ICalculatorStrategy;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Standard', '5,3,2')]
    [TestCase('Resulting in Negative', '3,5,-2')]
    [TestCase('Negative Numbers', '-5,-3,-2')]
    [TestCase('Zeros', '0,0,0')]
    procedure TestExecute(const A, B, ExpectedResult: Double);

    [Test]
    procedure TestOperationName;
  end;

implementation

procedure TTestSubtractionOperation.Setup;
begin
  FStrategy := TSubtractionOperation.Create;
end;

procedure TTestSubtractionOperation.TearDown;
begin
  FStrategy := nil;
end;

procedure TTestSubtractionOperation.TestExecute(const A, B, ExpectedResult: Double);
var
  LResult: Double;
begin
  LResult := FStrategy.Execute(A, B);
  Assert.AreEqual(ExpectedResult, LResult, 0.0001, 'Erro no calculo de subtracao.');
end;

procedure TTestSubtractionOperation.TestOperationName;
begin
  Assert.AreEqual('Subtra' + #231 + #227 + 'o', FStrategy.GetOperationName, 'Nome da operacao incorreto.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSubtractionOperation);

end.
