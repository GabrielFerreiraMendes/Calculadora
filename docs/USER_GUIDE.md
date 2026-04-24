# Manual de Uso — Calculadora Financeira

Este documento descreve como utilizar a aplicação Calculadora, abrangendo desde a sua inicialização até a realização de operações e tratamento de exceções.

## 🚀 Como Iniciar a Aplicação

1. Certifique-se de que o projeto foi compilado com sucesso no Delphi (tecla `F9` ou `Shift + F9` no arquivo `Calculadora.dproj`).
2. Ao executar o binário gerado, a janela principal da **Calculadora** será exibida imediatamente.
3. A interface gráfica é simples, limpa e apresenta um esquema visual moderno focado em usabilidade.

## 🧮 Realizando um Cálculo

A interface é dividida em campos lógicos:
1. **Primeiro Número:** Campo de texto onde você deve inserir o valor numérico base.
2. **Operação:** Um menu suspenso (`ComboBox`) contendo todas as operações matemáticas disponíveis no sistema (Adição, Subtração, Multiplicação, Divisão).
3. **Segundo Número:** Campo de texto para inserir o segundo valor numérico que interagirá com o primeiro.
4. **Botão Calcular:** Botão de ação que engatilha o processamento.
5. **Resultado:** Área inferior reservada para exibir a resposta matemática.

### Passo a Passo:
1. Digite um número válido no campo **Primeiro Número** (ex: `150`). Pode conter decimais (a aplicação aceita tanto ponto `.` quanto vírgula `,`).
2. Selecione a operação desejada no menu suspenso (ex: `Multiplicação`).
3. Digite o número complementar no campo **Segundo Número** (ex: `2`).
4. Clique no botão **Calcular**.
5. O resultado (`300`) aparecerá em cor **Verde** logo abaixo.

## ⚠️ Validações e Tratamento de Erros

A aplicação possui um motor robusto de validação para evitar o fechamento abrupto (*crashes*). Caso um erro ocorra, a mensagem será exibida na área de **Resultado** com a cor **Vermelha**.

Cenários previstos:
- **Campos Vazios ou Inválidos:** Se você digitar letras ou deixar campos em branco, ao clicar em "Calcular", o sistema exibirá: *"Digite números válidos nos dois campos"*.
- **Divisão por Zero:** A matemática não permite divisões por zero. Se você tentar dividir `10` por `0`, a regra de negócio bloqueará o cálculo e exibirá: *"Divisão por zero não é permitida"*.
- **Operação Não Selecionada:** Caso o ComboBox seja limpo ou invalidado, o sistema alertará: *"Selecione uma operação"*.

---
*Fim do Manual do Usuário.*
