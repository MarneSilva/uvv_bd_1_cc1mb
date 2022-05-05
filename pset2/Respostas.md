# Questões e Respostas do Pset N° 2

## Questão 1

  É possível tirar a média dos salários da tabela funcionário por meio do comando avg (average), embutido no MySQL. Sendo assim, acionaremos ele utilizando a estrutura do comando: select avg(coluna) from tabela. Inserindo as informações na estrutura, formará o seguinte comando: select avg(salario) from funcionario. Posterior à isso, o MariaDB retornará o seguinte resultado: 
  
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
  
  O valor total das coisas que você quer descobrir a média é estabelecido pela propriedade de soma, 'sum', especificando os valores inseridos na coluna 'salario'. Agora, para a segunda parte do cálculo, utilizamos a barra para estabelecer uma divisão entre valores, sendo que a propriedade 'count' é feita para contar quantas coisas estão associadas. É importante notar que é preciso dizer quantas coisas você quer que a propriedade 'count' envolva no cálculo, e como nesse caso queremos contar todas, representaremos com o símbolo de generalização (*). Entretanto, para que o cálculo obedeça a restrição de calcular usando os valores separados entre o gênero, ainda é preciso adicionar mais algumas coisas na linha de código. Estas mudanças podem ser ilustradas como:
  
  select (sum(salario)/count(*)) as Média from funcionario
  where sexo = 'F';
  
  Ao realizar estas mudanças no código, estabelecemos que a projeção recebe um apelido de 'Média', e que deve ser retirada da tabela 'funcionaro', com a condição de retirar também apenas os valores em que tenha a coluna sexo como 'F', proporcionando assim, a divisão da média salarial entre masculino e feminino, por meio da mudança da condição 'where'. Conclusivamente, caso queira saber a média salarial das mulheres, você utilizará o comando:
  
  select (sum(salario)/count(*)) as Média_F from funcionario
  where sexo = 'F';
  
  E caso queira saber a média salarial dos homens, tem de utilizar o comando:
  
  select (sum(salario)/count(*)) as Média_M from funcionario
  where sexo = 'M';
  
  Depois de executar estes dois comandos, o MariaDB retornará valores sobre o resultado do cálculo, demonstrando que as médias são: 31.000,00 para as mulheres, e para os homens, 37.600,00.
  
# Questão 3
  
  Para o Marne do futuro que ainda vai anotar a resposta no dia depois: É preciso realizar uma operação de junção de tabelas, a inner join, consistindo também na criação de uma coluna que liste a idade na tabela funcionario, assim como tem que calcular a idade dos funcionario subtraindo a data de nascimento deles com a data de hoje, utilizando o comando 'select datediff'. Além disso, também é necessário arredondar as idades por meio do comando 'select ceil(numero) from tabela'.
  
# Questão 4

 Ideias para esta questão: create procedure Aumentar_Porcentagem(INOUT numero INT) begin set salario = salario * 0.35; end$$ delimiter;
 Uma procedure que aplica uma operação matemática em uma variável. Agora só falta saber como ativar a variável, e mostrar as condições de quando chamar.
