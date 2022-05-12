use uvv;

-- Questão 1

select avg(salario) from funcionario;

-- Questão 2

-- Média para as mulheres:

select (sum(salario)/count(*)) as Média_F from funcionario
where sexo = 'F';
  
-- Média para os homens:
  
select (sum(salario)/count(*)) as Média_M from funcionario
where sexo = 'M';

-- Questão 3
  
select concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as "nome_completo", departamento.nome_departamento, funcionario.data_nascimento, funcionario.idade, funcionario.salario 
from departamento 
inner join funcionario on departamento.numero_departamento = funcionario.numero_departamento;

-- Questão 4
  
-- Adiciona uma coluna para armazenar as informações do salario reajustado:

alter table funcionario
add column salario_reajustado decimal(10,2);
   
   
-- Atualizando as informações automaticamente seguindo as condições do CASE:

update funcionario
set salario_reajustado=
case when salario < 35000 then salario * 1.20
when salario >= 35000 then salario * 1.15
end;

-- Projetando a nova coluna que armazena o valor do salário reajustado:

select concat(primeiro_nome, " ", nome_meio, " ", ultimo_nome) as "nome_completo", idade, salario, salario_reajustado
from funcionario;
  
-- Questão 5
   
select *
from (select concat("Gerente do departamento ", departamento.nome_departamento) as nome_departamento, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
from departamento
inner join funcionario on departamento.numero_departamento = funcionario.numero_departamento
where cpf_gerente = cpf
order by nome_departamento asc) as gerente
union
select *
from (select departamento.nome_departamento, concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where not cpf_gerente = cpf
order by salario desc) as funcionario;

-- Questão 6

select departamento.nome_departamento, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, " ",funcionario.ultimo_nome) as nome_completo_funcionario, concat(dependente.nome_dependente, " ",funcionario.nome_meio, " ",funcionario.ultimo_nome) as nome_completo_dependente, year(curdate()) - year(dependente.data_nascimento) as idade_dependente,
case dependente.sexo
when 'M' then 'Masculino'
when 'F' then 'Feminino'
end as sexo_dependente
from dependente
left join funcionario on (dependente.cpf_funcionario=funcionario.cpf)
inner join departamento on (funcionario.numero_departamento=departamento.numero_departamento);

-- Questão 7
   
select departamento.nome_departamento, concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo_funcionario,
funcionario.salario from funcionario
left join dependente on funcionario.cpf = dependente.cpf_funcionario
inner join departamento on funcionario.numero_departamento = departamento.numero_departamento
where dependente.cpf_funcionario is null;

-- Questão 8
   
select concat("Departamento ", departamento.numero_departamento, " ", departamento.nome_departamento) as departamento_e_nome, projeto.nome_projeto,
concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo_funcionario, trabalha_em.horas from funcionario
inner join departamento on funcionario.numero_departamento = departamento.numero_departamento
inner join projeto as p on departamento.numero_departamento = p.numero_departamento
inner join trabalha_em on funcionario.cpf = trabalha_em.cpf_funcionario
inner join projeto on trabalha_em.numero_projeto = projeto.numero_projeto
where funcionario.numero_departamento = projeto.numero_departamento
group by departamento_e_nome, nome_projeto, nome_completo_funcionario, horas;

 -- Questão 9
   
select distinct departamento.nome_departamento, projeto.nome_projeto, sum(trabalha_em.horas) as soma_das_horas from (departamento, projeto, trabalha_em)
inner join departamento as d on (projeto.numero_departamento = d.numero_departamento)
inner join trabalha_em as tb on (projeto.numero_projeto = tb.numero_projeto)
group by nome_projeto, nome_departamento;

-- Questão 10
   
-- Esta questão está repetida. Portanto, eu vou responder da mesma maneira que eu consegui responder a questão que é igual a esta, a qual seria a de n° 1.
   
-- O comando que responde a questão é exatamente este, mas para saber da explicação, recomenda-se lê-la na resposta 1:
   
select avg(salario) from funcionario;

-- Questão 11
   
select concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo_funcionario, projeto.nome_projeto,
trabalha_em.horas, sum(trabalha_em.horas)*0.50 as recebimento_horas from (funcionario, projeto, trabalha_em)
inner join departamento as d on (projeto.numero_departamento = d.numero_departamento)
inner join trabalha_em as tb on (projeto.numero_projeto = tb.numero_projeto)
where funcionario.cpf = trabalha_em.cpf_funcionario
group by nome_completo_funcionario, nome_projeto, nome_departamento, horas;

-- Questão 12
   
select concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo, departamento.nome_departamento,
projeto.nome_projeto from (funcionario, departamento, projeto)
inner join funcionario as f on (departamento.cpf_gerente = f.cpf)
inner join projeto as p on (departamento.numero_departamento = p.numero_departamento)
inner join trabalha_em as tb on (p.numero_projeto = tb.numero_projeto)
where tb.horas = 0.0 and funcionario.cpf = tb.cpf_funcionario
group by projeto.nome_projeto, departamento.nome_departamento, nome_completo;

-- Questão 13
   
select concat(funcionario.primeiro_nome, " ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo_funcionario, concat(dependente.nome_dependente,
" ", funcionario.nome_meio, " ", funcionario.ultimo_nome) as nome_completo_dependente, funcionario.sexo as sexo_funcionario, dependente.sexo as sexo_dependente,
concat(funcionario.idade, " anos") as idade_funcionario,  concat(year(curdate())-year(dependente.data_nascimento)," anos") as idade_dependente from (funcionario,
dependente)
inner join dependente as d on (funcionario.cpf = d.cpf_funcionario)
where d.cpf_funcionario = funcionario.cpf
group by nome_completo_funcionario, nome_completo_dependente, idade_funcionario, idade_dependente
order by idade_funcionario desc, idade_dependente desc;

-- Questão 14
   
select concat("Departamento ", departamento.numero_departamento, " ", departamento.nome_departamento) as departamento, count(funcionario.cpf) as
numero_de_funcionarios from (departamento, funcionario)
inner join funcionario as f on (departamento.numero_departamento = f.numero_departamento)
where funcionario.cpf = departamento.cpf_gerente
group by departamento.numero_departamento;

-- Questão 15

select concat(f.primeiro_nome, " ", f.nome_meio, " ", f.ultimo_nome) as nome_completo, concat("Departamento ", d.numero_departamento, " ", d.nome_departamento) as
departamento, concat("Projeto N° ", p.numero_projeto, " ", p.nome_projeto) as projeto from (departamento as d) inner join projeto as p inner join trabalha_em as tb
inner join funcionario as f where d.numero_departamento = f.numero_departamento and p.numero_projeto = tb.numero_projeto and tb.cpf_funcionario = f.cpf;














