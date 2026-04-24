# Calculadora OOP — Documentação Técnica

## 🎯 Propósito do Projeto
Este projeto foi desenvolvido como uma demonstração técnica de proficiência na linguagem **Delphi**, focando primariamente em qualidade de software, arquitetura limpa e nas melhores práticas de Orientação a Objetos. Trata-se de uma calculadora simples que processa as quatro operações fundamentais (Adição, Subtração, Multiplicação e Divisão). 

A premissa principal do desenvolvimento não foi apenas calcular resultados, mas construir uma base de código **escalável, manutenível e extensível**, livre de forte acoplamento e pronta para crescer (ex: adição de novas operações matemáticas) sem gerar impactos colaterais (regressão) no código existente.

---

## 🛠 Tecnologias e Frameworks
- **Linguagem:** Delphi (Object Pascal)
- **Framework UI:** VCL (Visual Component Library)
- **Framework de Testes:** DUnitX (Testes Unitários Automatizados)

---

## 🧠 Paradigmas e Abordagens
O projeto foi construído sob o paradigma da **Programação Orientada a Objetos (POO)** pura, abandonando construções procedurais clássicas (como grandes blocos de `case..of` ou `if..else`) em favor do polimorfismo e injeção de dependências.

### Os 4 Pilares da POO Aplicados:
1. **Abstração:** O uso da interface `ICalculatorStrategy` foca no contrato ("O que faz") escondendo a complexidade matemática ("Como faz") da interface com o usuário.
2. **Polimorfismo:** O método `Execute()` se comporta de 4 formas diferentes de maneira dinâmica. O `TCalculatorEngine` chama esse método sem precisar saber se a operação ativa está somando ou dividindo.
3. **Encapsulamento:** Uso rigoroso da diretiva `strict private` nas classes (como `FStrategy` na Engine e `FOperations` na View) impedindo que o estado interno seja adulterado sem passar pelos métodos injetores oficiais.
4. **Herança:** O formulário herda de `TForm` (reaproveitando o motor de UI da VCL) e as estratégias herdam de `TInterfacedObject` (reaproveitando a gestão automática de memória ARC do Delphi).

### Princípios SOLID Aplicados:
1. **Single Responsibility Principle (SRP):** Cada classe tem uma única razão para mudar. A View apenas renderiza componentes, o Engine apenas orquestra cálculos, e cada operação matemática possui sua própria classe dedicada (ex: `TAdditionOperation`).
2. **Open/Closed Principle (OCP):** O sistema está aberto para extensão, mas fechado para modificação. Para adicionar uma nova operação matemática (como Potenciação), o desenvolvedor precisa apenas criar uma nova classe `TStrategy` e registrá-la na Factory, sem alterar uma única linha do `TCalculatorEngine` ou do formulário principal (`View`).
3. **Liskov Substitution Principle (LSP):** O Engine e a View manipulam apenas o contrato `ICalculatorStrategy`. Qualquer implementação concreta pode ser injetada sem quebrar a aplicação.
4. **Dependency Inversion Principle (DIP):** Módulos de alto nível (View) dependem de abstrações (Interfaces/Engine) e não de instâncias concretas (classes de cálculo).

---

## 📐 Padrões de Projeto (Design Patterns)

Foram implementados dois padrões do *GoF (Gang of Four)* para solucionar os desafios arquiteturais:

### 1. Strategy Pattern
Em vez de aninhar regras de negócio em blocos condicionais, cada operação matemática foi encapsulada em uma classe própria que implementa a interface `ICalculatorStrategy`. Isso transforma cada cálculo em uma "estratégia" que o motor principal (`TCalculatorEngine`) executa de forma intercambiável (polimorfismo).

### 2. Factory Method
A classe `TOperationFactory` é responsável por centralizar o registro, ciclo de vida e fornecimento de todas as estratégias matemáticas disponíveis. Isso permite que a View consulte a Factory para montar dinamicamente o `TComboBox` na tela, eliminando "Textos Hardcoded" na UI.

---

## 📝 Convenções de Código (Clean Code)

O código fonte obedece rigorosamente às convenções de *Clean Code*:
- **Pascal Case (Convenção Adotada):** O projeto adota rigorosamente a convenção `PascalCase` em toda a sua extensão. Sendo o padrão idiomático oficial do Delphi, essa regra foi aplicada de forma consistente em nomes de Arquivos e Units (`Calculator.Operation.Addition`), declarações de Classes e Interfaces (`TCalculatorEngine`, `ICalculatorStrategy`), além de propriedades, métodos e funções (`GetActiveOperationName`, `RegisterOperation`). A adoção estrita desta convenção garante uma legibilidade impecável e familiaridade imediata para qualquer engenheiro de software avaliando o projeto.
- **Padrões de Nomenclatura:** 
  - `T` como prefixo para Tipos/Classes.
  - `I` como prefixo para Interfaces.
  - `F` como prefixo para Fields (variáveis privadas da classe).
  - `A` (Argument) como prefixo para parâmetros recebidos em métodos (ex: `const AFirstOperand: Double`).
- **Evitar Números/Strings Mágicos:** Uso de constantes explícitas (`CLR_HEADER`, `CLR_FORM_BG`) para definições estéticas e comportamentais.
- **Linguagem Ubíqua e Auto-documentada:** Variáveis e métodos possuem nomes descritivos em inglês no código (ex: `GetActiveOperationName`, `FStrategy`), garantindo clareza internacional de leitura. Comentários explicativos focam no "Por que" (razão arquitetural) e não no "O que".
- **Sem acentuação em código fonte:** Todos os comentários, documentações internas (`/// <summary>`) e logs não contêm acentos (`ç`, `ã`) para previnir qualquer problema de colisão de charset (*encoding*) entre IDEs ou servidores de Versionamento (Git).

---

## 🏗 Arquitetura e Estrutura de Pastas

A separação lógica dos arquivos isola as camadas da aplicação:

- `src/Interfaces/`: Contém os contratos globais (como `ICalculatorStrategy`).
- `src/Operations/`: Classes concretas contendo as regras de negócio de cálculo (Domínio).
- `src/Engine/`: Motor orquestrador. Age como *Context* do padrão Strategy.
- `src/Factory/`: Módulo criador/construtor das instâncias (Injeção de dependência rudimentar).
- `View/`: Contém apenas o `.pas` e `.dfm` da interface com o usuário. Zero lógica de cálculo.
- `test/`: Espelho estrutural da pasta `src`, abrigando o projeto secundário rodando *DUnitX*.

---

## 🧪 Qualidade e Testes (DUnitX)

O projeto conta com um ecossistema secundário (`CalculadoraTests.dproj`) puramente para **Testes Unitários Automatizados**. 
- Todas as operações possuem suítes garantindo o *Happy Path* e *Edge Cases* (Cenários limites, ex: somar números negativos).
- Defesa contra comportamento indefinido: A `TDivisionOperation` garante que divisões por zero disparam uma `Exception` tratada (`EDivByZero`), e isso é explicitamente testado pela validação `Assert.WillRaise` no DUnitX. 
- A Engine possui testes baseados em injeção de *Stubs* (falsificadores), provando que ela orquestra o cálculo sem precisar estar acoplada à matemática real.

---

## 🤖 Uso de Inteligência Artificial e Autoria

Como parte de uma abordagem moderna de desenvolvimento de software, atuei como o engenheiro e arquiteto principal deste projeto, utilizando ferramentas de **Inteligência Artificial (IA)** estritamente como aceleradoras de produtividade (assistentes) para as seguintes tarefas operacionais:
- **Estilização de Telas (UI/UX):** Definição da paleta de cores, espaçamentos e estilização limpa da interface *VCL* via código.
- **Documentação de Código:** Geração ágil das strings de documentação interna (`/// <summary>`) e formatação preliminar deste documento.
- **Boilerplate de Testes:** Estruturação inicial do código base do *DUnitX* e mapeamento preliminar de *Edge Cases*.

É importante ressaltar que **toda a concepção arquitetural**, as escolhas de *Design Patterns* (Strategy/Factory), a aplicação dos princípios SOLID e a revisão rigorosa de todas as lógicas de negócio foram **concebidas, direcionadas e auditadas exclusivamente por mim**, garantindo que o projeto reflita fielmente o meu conhecimento técnico e rigor analítico.
