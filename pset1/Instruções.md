# INSTRUÇÕES
## Instruções e ordens para a execução dos scripts.

***Aviso:*** É importante que estas instruções sejam seguidas à risca, de maneira a garantir a boa execução dos scripts e torná-los 100% funcionais. Caso não sejam seguidas
com extremo detalhamento, pode ocorrer o risco dos scripts não funcionarem da maneira que deviam ou nem funcionarem.

- __Scripts do MariaDB__

   Em relação aos scripts que criam o banco de dados do MariaDB, eles são dividos em duas partes, ambas renomeadas com uma ordem numérica. Os scripts do MariaDB são
   os nomeados 'SQL Script 1.sql' e 'SQL Script 2.sql', e eles devem ser executados seguindo a ordem numérica do número 1, e depois o número 2. Entretanto, não é apenas
   isso a totalidade das instruções, existe uma sequência de passos que deve ser obedecida.
   
   1. Abra o terminal do Linux, e escreva depois execute o comando 'mysql -u root -p'.
   2. Insira a senha padrão do seu MariaDB. (No meu caso, foi configurado pelo professor a senha "computacao@raiz", porém, pode acontecer de a sua senha necessitar ainda de configuração).
   3. Com o login feito, copie e cole o conteúdo do arquivo 'SQL Script 1.sql' e certifique-se de que todos os comandos presentes receberam a confirmação do botão 'enter'. Caso exista algum comando deste conteúdo que não tenha sido executado, apenas execute-o apertando a tecla Enter.
   4. Agora, digite no terminal o comando 'exit', para realizar o fechamento do MariaDB.
   5. Após isto, volte a logar no MariaDB, mas dessa vez com o comando 'mysql -u marne -p', de modo a logar no novo perfil de usuário.
   6. Insira a senha que se encontra no conteúdo do arquivo 'SQL Script 1.sql', composta de '12345'.
   7. Já com o novo usuário logado, apenas copie e cole o conteúdo do arquivo 'SQL Script 2.sql', para que seja criado o próprio banco de dados.
   8. Por final, teste as funções de delete, update, create, alter, etc. para que seja possível este usuário realizar todas as operações que sejam necessárias com as informações no banco.
   9. Apenas aproveite e dê uma olhada no conteúdo das tabelas com o comando select.

   Seguindo estes passos, é garantido a conclusão do procedimento correto para a execução dos scripts criados por mim, como também a sua funcionalidade planejada.
 
- __Scripts do PostgreSQL__

    Já em relação aos scripts que criam o banco de dados do Postgres, estes são dividos da mesma forma que os direcionados para o MariaDB, mas dessa vez, é preciso realizar alguns passos a mais, devido ao maior leque de operações que precisam ser realizados pelo operador de maneira manual para entrar e sair de usuários no Postgres. Portanto, é preciso seguir esta ordem de passos:
    
    1. Abra o terminal do Linux, e escreva depois execute o comando 'psql -U postgres -W'.
    2. Insira a senha padrão do seu Postgres. (No meu caso, foi configurado pelo professor a senha "computacao@raiz", porém, pode acontecer de a sua senha necessitar ainda de configuração).
    3. Feito o login, é preciso copiar e colar o conteúdo do arquivo 'Postgres Script 1.sql'. É preciso ter certeza, novamente, de que qualquer comando que não tenha sido executado, seja executado apertando a tecla enter.
    4. Agora, digite no terminal o comando 'exit' ou '\q', para sair do Postgres.
    5. Com isso feito, agora é preciso logar no banco de dados incialmente criado, porém, com o novo usuário. Para isso, digite no terminal o comando 'psql -U marne uvv -W'.
    6. Após isso, insira a senha que está contida dentro do arquivo 'Postgres Script 1.sql', que é composta por '12345'.
    7. Com o novo usuário logado, juntamente com o novo banco de dados 'uvv', copie e cole o conteúdo do arquivo 'Postgres Script 2.sql', e novamente, tenha certeza de dar enter caso necessário.
    8. Conclusivamente, com o conteúdo das tabelas já criado e inserido, falta apenas acessá-los com o comando select, uma vez que seu usuário já tem a permissão de alterar e excluir tabelas, se for preciso.


Por fim, estes são os passos que apontam para a conclusão dos procedimentos corretos, garantindo a inicialização e a funcionalidade deles.
    
