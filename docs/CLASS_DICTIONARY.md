# Dicionário de Classes e Interfaces

Este documento serve como referência técnica (dicionário) para todas as estruturas orientadas a objetos desenvolvidas no projeto Calculadora. Ele explica a responsabilidade isolada de cada classe e seu respectivo papel arquitetural.

---

## 📂 Camada de Contratos (Interfaces)

### `ICalculatorStrategy`
- **Arquivo:** `src/Interfaces/Calculator.Strategy.pas`
- **Responsabilidade:** Interface base do padrão *Strategy*. Define o contrato rigoroso de como uma operação matemática deve se comportar. 
- **Métodos Principais:**
  - `Execute(AFirst, ASecond: Double): Double`: Realiza o cálculo em si.
  - `GetOperationName: string`: Retorna o nome da operação em texto livre para ser lido pela UI.
- **Papel no SOLID:** Viabiliza o Princípio de Substituição de Liskov (LSP) e a Inversão de Dependência (DIP).

---

## 📂 Camada de Domínio (Estratégias / Operações)

Todas as classes abaixo implementam `ICalculatorStrategy` e herdam de `TInterfacedObject` (para gestão automática de memória ARC).

### `TAdditionOperation`
- **Arquivo:** `src/Operations/Calculator.Operation.Addition.pas`
- **Responsabilidade:** Única e exclusiva para somar dois números. Retorna o nome "Adição".

### `TSubtractionOperation`
- **Arquivo:** `src/Operations/Calculator.Operation.Subtraction.pas`
- **Responsabilidade:** Responsável por calcular a diferença entre dois números. Retorna o nome "Subtração".

### `TMultiplicationOperation`
- **Arquivo:** `src/Operations/Calculator.Operation.Multiplication.pas`
- **Responsabilidade:** Calcula o produto de dois operandos. Retorna "Multiplicação".

### `TDivisionOperation`
- **Arquivo:** `src/Operations/Calculator.Operation.Division.pas`
- **Responsabilidade:** Realiza o cálculo de divisão. Possui uma responsabilidade defensiva extra: levanta a exceção `EDivByZero` caso o segundo operando (divisor) seja igual a zero. Retorna "Divisão".

---

## 📂 Camada de Orquestração e Construção

### `TOperationFactory`
- **Arquivo:** `src/Factory/Calculator.Factory.pas`
- **Responsabilidade:** Atua como o padrão *Factory Method / Service Locator*. É o "catálogo" central do sistema.
- **Métodos Principais:**
  - `RegisterOperation(AStrategy)`: Adiciona uma nova estratégia à sua lista interna.
  - `GetOperations: TArray`: Retorna todas as operações ativas. Útil para a View montar telas de forma dinâmica baseada no domínio, sem acoplamento direto.

### `TCalculatorEngine`
- **Arquivo:** `src/Engine/Calculator.Engine.pas`
- **Responsabilidade:** Atua como o **Context** no padrão *Strategy*. Seu objetivo é segurar a referência de uma operação matemática ativa e simplesmente delegar as contas para ela.
- **Métodos Principais:**
  - `SetStrategy(AStrategy)`: Troca dinamicamente a "peça" de matemática que o motor vai usar.
  - `Calculate(...)`: Aciona a estratégia atual. Levanta erro `EInvalidOpException` se nenhuma estiver definida.

---

## 📂 Camada de Visualização (View)

### `TfrmCalculator`
- **Arquivo:** `View/View.Calculator.pas`
- **Responsabilidade:** Interagir com o usuário humano.
  - Carrega dinamicamente o `TComboBox` consumindo a `TOperationFactory`.
  - Captura os cliques, faz o *parse* (conversão de String para Double garantindo tratamento de `.` e `,`).
  - Passa os valores convertidos e a estratégia selecionada para o `TCalculatorEngine`.
  - Formata e exibe visualmente o sucesso (cor verde) ou a exceção (cor vermelha).
- **Regra de Ouro:** Não contém regras de negócio. Se a regra da Divisão mudar, este arquivo sequer precisará ser recompilado isoladamente.
