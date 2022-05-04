# Questões e Respostas do Pset N° 2

## Questão 1

  É possível tirar a média dos salários da tabela funcionário por meio do comando avg (average), embutido no MySQL. Sendo assim, acionaremos ele utilizando a estrutura do comando: select avg(<coluna>) from <tabela>. Inserindo as informações na estrutura, formará o seguinte comando: select avg(salario) from funcionario. Posterior à isso, o MariaDB retornará o seguinte resultado: 
  
+--------------+
| avg(salario) |
+--------------+
| 35125.000000 |
+--------------+
  
  Demonstrando assim que a média salarial é de exatamente 35.125,00.
  
## Questão 2
  
  Para obtermos uma média separada pela orientação do campo 'sexo', primeiro devemos estabelecer o cálculo matemático dentro do MariaDB, para depois realizar uma projeção com esse cálculo, e assim, associar à uma condição em que deve ser obedecida para a projeção, que no caso seria o campo 'sexo'. Dando continuidade, precisamos pensar no cálculo, que tem a estrutura baseada na matemática comum, sendo esta:
  
  _Média Aritmética:_ Soma do valor das coisas que você descobrir a média / Quantas coisas realmente estão associadas.
  
  Assim, aplicando no MariaDB para um cálculo concreto, utilizaremos a propriedade de soma, chamada de 'sum'.
  
  _Média Aritmética:_ (sum(salario)/count(*))
  
  O valor total das coisas que você quer descobrir a média é estabelecido pela propriedade de soma, 'sum', especificando os valores inseridos na coluna 'salario'. Agora, para a segunda parte do cálculo, utilizamos a barra para estabelecer uma divisão entre valores, sendo que a propriedade 'count' é feita para contar quantas coisas estão associadas. É importante notar que é preciso dizer quantas coisas você quer que a propriedade 'count' envolva no cálculo, e como nesse caso queremos contar todas, representaremos com o símbolo de generalização (*). Entretanto, para que o cálculo obedeça a restrição de calcular usando os valores separados entre o gênero, ainda é preciso adicionar mais algumas coisas no linha de código.
