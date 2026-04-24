unit Test.Calculator.Operation.Division;

interface

uses
  DUnitX.TestFramework,
  Calculator.Strategy,
  Calculator.Operation.Division;

type
  [TestFixture]
  TTestDivisionOperation = class
  private
    FStrategy: ICalculatorStrategy;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Standard', '10,2,5')]
    [TestCase('Result Decimal', '5,2,2.5')]
    [TestCase('Negative', '-10,2,-5')]
    procedure TestExecute(const A, B, ExpectedResult: Double);

    [Test]
    procedure TestDivideByZero;

    [Test]
    procedure TestOperationName;
  end;

implementation

uses
  System.SysUtils;

procedure TTestDivisionOperation.Setup;
begin
  FStrategy := TDivisionOperation.Create;
end;

procedure TTestDivisionOperation.TearDown;
begin
  FStrategy := nil;
end;

procedure TTestDivisionOperation.TestExecute(const A, B, ExpectedResult: Double);
var
  LResult: Double;
begin
  LResult := FStrategy.Execute(A, B);
  Assert.AreEqual(ExpectedResult, LResult, 0.0001, 'Erro no calculo de divisao.');
end;

procedure TTestDivisionOperation.TestDivideByZero;
begin
  Assert.WillRaise(
    procedure
    begin
      FStrategy.Execute(10, 0);
    end,
    EDivByZero,
    'Divisao por zero nao lancou a excecao EDivByZero.'
  );
end;

procedure TTestDivisionOperation.TestOperationName;
begin
  Assert.AreEqual('Divis' + #227 + 'o', FStrategy.GetOperationName, 'Nome da operacao incorreto.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestDivisionOperation);

end.
