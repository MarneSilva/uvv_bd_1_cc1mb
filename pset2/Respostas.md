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
   
   SELECT CONCAT(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) AS "nome_completo", departamento.nome_departamento, funcionario.data_nascimento, funcionario.idade, funcionario.salario
FROM departamento 
INNER JOIN funcionario ON departamento.numero_departamento = funcionario.numero_departamento;

   Isto fará com que o MariaDB retorne uma projeção contendo todas as informações que queríamos, possuindo tanto o nome de cada departamento, como também o nome completo dos funcionários, vinculados ao suas respectivas idades, seus salários e suas datas de nascimento.
  
# Questão 4

   Primeiramente, para projetarmos o reajuste de salário junto as informações que também queremos, é necessário criar uma coluna, dentro da tabela funcionario, para que sejam armazenadas os dados dos reajustes salariais. Esta ação consiste em um comando básico de manipulação de dados do MySQL, o comando ALTER TABLE. Dando sequência, o comando há de ter esta estrutura:
 
   ALTER TABLE funcionario
   ADD COLUMN salario_reajustado decimal(10,2);
   
   É importante notar que a coluna nova deve ter o mesmo tipo de dado que a coluna salario, para que quando realizarmos a projeção, os dois dados estejam iguais, com a separação da casa decimal de maneira idêntica.
   
   Prosseguindo, agora é preciso inserir o conteúdo dos dados nesta nova coluna, para que sejam gravados os valores dos novos salários, reajustados. Como nós já criamos a coluna 'salario_reajustado', porém não inserindo qualquer dado, todos os valores das tuplas estão como NULL. Para inserir os dados nas tuplas de NULL, nós usaremos um comando básico, também de manipulação de dados, do MySQL. Este comando é o UPDATE, que realiza atualizações de valores em colunas já criadas dentro uma dada tabela. Além de usar um comando para inserir os novos valores na coluna 'salario_reajustado', também usaremos um operador SQL para que ele verifique os valores dos salarios, e decida quais salarios é preciso multiplicar, seguindo as nossas instruções. Este operador é chamado de CASE, e utilizaremos da seguinte maneira:
    
   UPDATE funcionario
   SET salario_reajustado=
   CASE WHEN salario < 35000 THEN salario * 1.20
   WHEN salario >= 35000 THEN salario * 1.15
   END;
   
   A maneira com o operador CASE funciona é decidida por condições especificadas dentro dele mesmo. Neste caso, as condições foram representadas pelas operações WHEN. 'When', na tradução literal para o português, significa 'Quando', o que sugere a ideia de uma condição, e é exatamente assim que as condições funcionam. Com esta estrutura de código, nós estamos dizendo ao comando UPDATE para que atualize a coluna 'salario_reajustado', para quando o valor do salario é menor que 35000, preencher a coluna com o valor resultado da operação matemática de aumento de 20 porcento, e quando é maior ou igual a 35000, preencher a coluna com um aumento de 15 porcento, apenas. Conclusivamente, agora é só projetarmos as informações que queríamos com o comando SELECT, lembrando de utilizar o CONCAT para realizar a junção dos nomes principais, do meio e ultimos nomes para que fique em apenas uma única coluna de nome completo:

   SELECT CONCAT(primeiro_nome, " ", nome_meio, " ", ultimo_nome) AS "nome_completo", idade, salario, salario_reajustado
   FROM funcionario;
   
   Sendo assim, projetando todos as informações necessárias para a resposta da questão.
   
   # Questão 5
   
   Para obtermos os resultados necessários, é preciso realizar múltiplas seleções, entra elas, seleções de seleções com características um pouco mais especificas, para que os valores não se repitam quando não precisam se repetir em diferentes partes da coluna. A primeira seleção de uma seleção é feita para filtrar quais são os gerentes que trabalham em quais departamentos, e exibir esta informação em uma INNER JOIN que especifique as restrições. Desse modo, a seleção é feita deste jeito:
   
   SELECT *
   FROM (SELECT CONCAT("Gerente do departamento ", departamento.nome_departamento) AS nome_departamento, CONCAT(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) AS nome_completo_funcionario
   FROM departamento
   INNER JOIN funcionario ON departamento.numero_departamento = funcionario.numero_departamento
   WHERE cpf_gerente = cpf
   ORDER BY nome_departamento asc) AS gerente

  Note que também é preciso especificar a ordem de exibição com o comando ORDER BY ao final deste código, para que seja cumprido a restrição da ordem, que a pergunta exige dentre as repostas. Note também que neste caso, o comando WHERE limita os resultados em que se encontrem na instância de que o cpf do gerente há de ser o mesmo que o cpf do funcionario, dessa maneira, permitindo a INNER JOIN a acontecer sem repetições de cpfs. Entrentanto, agora que selecionamos o que nós queremos deste comando SELECT, é preciso recuperar os resultados provenientes dele e juntar a outros resultados da segunda seleção, que ainda hei de mostrar. Sendo assim, apenas colocaremos um comando UNION, que junta os dois resultados de comandos SELECT, no meio entre eles:

   UNION

   Agora, para que a união seja feita, é preciso da outra parte do resultado de outro SELECT, sendo este o segundo a ser digitado. Este SELECT tem a função de agrupar as mesmas informações que o primeiro SELECT agrupou, porém, desta vez só é necessário exibir os cpfs que não são de gerentes, já que esta ação foi feita pelo primeiro comando SELECT. Deste modo:

   SELECT *
   FROM (SELECT departamento.nome_departamento, CONCAT(funcionario.primeiro_nome, " ", funcionario.nome_meio, ". ",funcionario.ultimo_nome) AS nome_completo_funcionario FROM departamento
   INNER JOIN funcionario ON departamento.numero_departamento=funcionario.numero_departamento
   WHERE NOT cpf_gerente = cpf
   ORDER BY salario desc) AS funcionario;
   
   Por final, este SELECT também possui a função ORDER BY, entretanto agora configurado para projetar em ordem decrescente todos os salários da tabela funcionario. Além disso, como a função deste SELECT é exibir todos os restantes dos cpfs que não são de gerente, o comando WHERE retorna, mas desta vez, com a forma de WHERE NOT, para especificar a aplicação do SELECT apenas em tuplas em que a coluna cpf_gerente seja diferente de cpf, da tabela funcionario. Para concluir, basta apenas juntar os dois comandos de SELECT, e colocar o comando UNION bem no meio entre eles, para que assim seja feita a união e a projeção exigida:
   
   SELECT *
   FROM (SELECT CONCAT("Gerente do departamento ", departamento.nome_departamento) AS nome_departamento, CONCAT(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) AS nome_completo_funcionario
   FROM departamento
   INNER JOIN funcionario ON departamento.numero_departamento = funcionario.numero_departamento
   WHERE cpf_gerente = cpf
   ORDER BY nome_departamento asc) AS gerente
   **UNION**  <---
   SELECT *
   FROM (SELECT departamento.nome_departamento, CONCAT(funcionario.primeiro_nome, " ", funcionario.nome_meio, ". ",funcionario.ultimo_nome) AS nome_completo_funcionario FROM departamento
   INNER JOIN funcionario ON departamento.numero_departamento=funcionario.numero_departamento
   WHERE NOT cpf_gerente = cpf
   ORDER BY salario desc) AS funcionario;
   
   # Questão 6
   
   A príncipio, é preciso selecionar todas as colunas de maneira com que seja especificadas as tabelas em que precisamos para exibir as informações. Portanto, é possível alcançar esta seleção com o comando SELECT, primordialmente presente no vocabulário do MySQL. Porém, é preciso também selecionar uma chave em comum para que dois conjuntos sejam identificados, já que ambas as seleções utilizam dados de múltiplas tabelas. Sendo assim, após listar todas as colunas que queremos exibir, junto ao SELECT, é preciso interligá-las com as chaves em comum, para que as informações se juntem na exibição.
   
   Geralmente, quando queremos de fato unir tabelas ou comandos SELECT uns com os outros, utilizamos o comando UNION, mas dessa maneira, existem informações que irão se repetir, e o comando UNION limita-nos a obrigatoriamente selecionar as mesmas quantidades de tabelas para que possamos prosseguir com a união. Porém, o mesmo resultado pode ser alcançado utilizando os comandos JOIN do MySQL, e nesse caso, para ligar as tabelas com suas chaves em comum, utilizamos a INNER JOIN, e a LEFT JOIN, de modo que estas estabelecem quais tabelas precisam ser ofuscadas na hora da exibição, mas que precisam estar ali para conectar as informações das tabelas.
   
   Infelizmente, não muito como destrinchar este código, uma vez que ele é a junção das JOINs com o comando SELECT e suas colunas selecionadas. Entretanto, é possível mostrar a estrutura, que possui o seguinte formato:  
  
  SELECT departamento.nome_departamento, CONCAT(funcionario.primeiro_nome, " ",funcionario.nome_meio, " ",funcionario.ultimo_nome) AS nome_completo_funcionario, CONCAT(dependente.nome_dependente, " ",funcionario.nome_meio, " ",funcionario.ultimo_nome) AS nome_completo_dependente, year(curdate()) - year(dependente.data_nascimento) AS idade_dependente,
    CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           WHEN 'F' THEN 'Feminino'
     END AS sexo_dependente
     FROM dependente
LEFT JOIN funcionario ON (dependente.cpf_funcionario=funcionario.cpf)
INNER JOIN departamento ON (funcionario.numero_departamento=departamento.numero_departamento);

   # Questão 7
   
   SELECT departamento.nome_departamento, CONCAT(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) AS nome_completo_funcionario,
   funcionario.salario FROM funcionario
   LEFT JOIN dependente ON funcionario.cpf = dependente.cpf_funcionario
   INNER JOIN departamento ON funcionario.numero_departamento = departamento.numero_departamento
   WHERE dependente.cpf_funcionario IS null;

   # Questão 8
   
   SELECT CONCAT("Departamento ", departamento.numero_departamento, " ", departamento.nome_departamento) AS departamento_e_nome, projeto.nome_projeto,
   CONCAT(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) AS nome_completo_funcionario, trabalha_em.horas FROM funcionario
   INNER JOIN departamento ON funcionario.numero_departamento = departamento.numero_departamento
   INNER JOIN projeto AS p ON departamento.numero_departamento = p.numero_departamento
   INNER JOIN trabalha_em ON funcionario.cpf = trabalha_em.cpf_funcionario
   INNER JOIN projeto ON trabalha_em.numero_projeto = projeto.numero_projeto
   WHERE funcionario.numero_departamento = projeto.numero_departamento
   GROUP BY departamento_e_nome, nome_projeto, nome_completo_funcionario, horas;

   # Questão 9
   
   SELECT DISTINCT departamento.nome_departamento, projeto.nome_projeto, sum(trabalha_em.horas) AS soma_das_horas FROM (departamento, projeto, trabalha_em)
   INNER JOIN departamento AS d ON (projeto.numero_departamento = d.numero_departamento)
   INNER JOIN trabalha_em AS tb ON (projeto.numero_projeto = tb.numero_projeto)
   GROUP BY nome_projeto, nome_departamento;
   
   # Questão 10
   
   












   
   
    
  
  
  
  

   
   
