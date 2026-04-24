program Calculadora;

{
  Program : Calculadora
  Desc    : Ponto de entrada da aplicacao.
            Registra as units e inicializa o formulario principal.
  Author  : Calc Project
}

uses
  Vcl.Forms,
  View.Calculator            in 'View\View.Calculator.pas'            {frmCalculator},
  Calculator.Strategy        in 'src\Interfaces\Calculator.Strategy.pas',
  Calculator.Operation.Addition
                             in 'src\Operations\Calculator.Operation.Addition.pas',
  Calculator.Operation.Subtraction
                             in 'src\Operations\Calculator.Operation.Subtraction.pas',
  Calculator.Operation.Multiplication
                             in 'src\Operations\Calculator.Operation.Multiplication.pas',
  Calculator.Operation.Division
                             in 'src\Operations\Calculator.Operation.Division.pas',
  Calculator.Factory         in 'src\Factory\Calculator.Factory.pas',
  Calculator.Engine          in 'src\Engine\Calculator.Engine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Calculadora';
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
