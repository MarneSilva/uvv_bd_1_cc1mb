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
  
  SELECT (sum(salario)/count(*)) AS Média FROM funcionario
  WHERE sexo = 'F';
  
  Ao realizar estas mudanças no código, estabelecemos que a projeção recebe um apelido de 'Média', e que deve ser retirada da tabela 'funcionaro', com a condição de retirar também apenas os valores em que tenha a coluna sexo como 'F', proporcionando assim, a divisão da média salarial entre masculino e feminino, por meio da mudança da condição 'where'. Conclusivamente, caso queira saber a média salarial das mulheres, você utilizará o comando:
  
  SELECT (sum(salario)/count(*)) AS Média_F FROM funcionario
  WHERE sexo = 'F';
  
  E caso queira saber a média salarial dos homens, tem de utilizar o comando:
  
  SELECT (sum(salario)/count(*)) AS Média_M FROM funcionario
  WHERE sexo = 'M';
  
  Depois de executar estes dois comandos, o MariaDB retornará valores sobre o resultado do cálculo, demonstrando que as médias são: 31.000,00 para as mulheres, e para os homens, 37.600,00.
  
# Questão 3
  
  Para o Marne do futuro que ainda vai anotar a resposta no dia depois: É preciso realizar uma operação de junção de tabelas, a inner join, consistindo também na criação de uma coluna que liste a idade na tabela funcionario, assim como tem que calcular a idade dos funcionario subtraindo a data de nascimento deles com a data de hoje, utilizando o comando 'select datediff'. Além disso, também é necessário arredondar as idades por meio do comando 'select ceil(numero) from tabela'.
  
  Para realizar uma projeção com todas estas informações, primeiro de tudo é preciso checar se todos os campos que queremos exibir estão, de fato, criados no banco de dados. Dando sequência, ao verificar se todos existem, notamos que não há a existência de um campo específico, que não estava originalmente no projeto do Elmasri, mas que é preciso para exibir a informação da idade dos funcionários. Portanto, como é necessário, executaremos o comando para a criação da coluna 'idade', dentro da tabela 'funcionario', do projeto do Elmasri, adicionando ao script:
  
  CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                numero_departamento INT NOT NULL,
                cpf_supervisor CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(40),
                _**idade INTEGER,**_          <----
                sexo CHAR(1),
                salario DECIMAL(10,2),
                PRIMARY KEY (cpf)
  );                
                
   Depois de ter feito isso, prosseguindo em direção à projeção das informações, agora teremos de calcular a diferença das datas entre o dia de hoje e a data de nascimento de cada funcionário cadastrado. Isso fará com que obtemos aproximadamente a idade dos funcionários que foram calculados. Com base nisso, iremos repetir este comando a seguir para todos os funcionários:
   
   SELECT datediff ('2022-05-02','1965-01-09')/365 AS 'Idade_João';
   
   Este comando utiliza a propriedade 'datediff' do MySQL, a qual tem a função de calcular a diferença numérica entre uma dada data e outra. É notável que utilizamos um apelido para a exibição dos resultados, de modo que a tabela que nos entregue os mesmos seja chamada de 'Idade_João'. Entretanto, há um problema ao terminar de calcular, já que o MariaDB retorna um valor 'quebrado', isto é, com casas decimais, e não um valor inteiro, que é o ideal para nossa projeção. Em favor disso, nós temos de arredondar os valores númericos que são retornados pelo MariaDB, para que todos sejam números inteiros. Para isso, é necessário utilizar o seguinte comando, que também invoca outra propriedade importante do MariaDB:
   
   SELECT ceil(valor) FROM tabela WHERE coluna da condição = valor da condição;
   
   Encaixando nossos parâmetros de acordo com a estrutura, obteremos:
   
   SELECT ceil(57.3479) FROM funcionario WHERE primeiro_nome = 'João';
   
   Isso retornará um arredondamento para o valor da idade calculada para João (57.3479), sendo que a propriedade arredondou para o número inteiro 58. Por fim, apenas nos falta atualizar a coluna designada para a inserção deste tipo de informação, a coluna 'idade'. É possível atualizar uma coluna de uma tabela após sua criação, com a execução do comando 'update', uma operação comum do MySQL:
   
   UPDATE funcionario SET idade = '58' WHERE primeiro_nome = 'João';
   
   Conclusivamente, executaremos esta sequência de comandos para todos os funcionários da tabela 'funcionario', tanto como o cálculo de suas respectivas idades, como o arredondamento e a atualização dos valores no campo 'idade'. Realizando isso, agora só é preciso realizar a projeção das informações que desejamos, e para isso, temos de juntar uma tabela à outra, fazendo uso do comando 'inner join', veja:
   
   SELECT departamento.nome_departamento, funcionario.primeiro_nome, funcionario.nome_meio, funcionario.ultimo_nome, funcionario.data_nascimento, funcionario.idade, funcionario.salario
FROM departamento 
INNER JOIN funcionario ON departamento.numero_departamento = funcionario.numero_departamento;

   Isto fará com que o MariaDB retorne uma projeção contendo todas as informações que queríamos, possuindo tanto o nome de cada departamento, como também o nome completo dos funcionários, vinculados ao suas respectivas idades, seus salários e suas datas de nascimento.
  
# Questão 4

 Ideias para esta questão: create procedure Aumentar_Porcentagem(INOUT numero INT) begin set salario = salario * 0.35; end$$ delimiter;
 Uma procedure que aplica uma operação matemática em uma variável. Agora só falta saber como ativar a variável, e mostrar as condições de quando chamar.
 
 
 
 1° passo:
 alter table funcionario
    -> add column salario_reajustado varchar(50);
