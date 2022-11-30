--
-- Seção 11 
-- Exibindo dados a partir de Múltiplas Tabelas
--
-- Aula 1 - Exibindo dados a partir de Múltiplas Tabelas

-- Utilizando Prefixos Coluna com Nomes de Tabela 
--pra não ter embiguidade, utiliza-se prefixo referenciando as tabelas
--JOIN: COM CLÁUSULA on
SELECT employees.employee_id, employees.last_name, 
       employees.department_id, departments.department_name
FROM   employees JOIN departments 
       ON (employees.department_id = departments.department_id);

-- Utilizando Alias de Tabela
-- ALIAS DE TABELA É DEFINIDO NA CLÁUSUA FROM
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id); --(O PARÊNTESE MELHORA O ENTENDIMENTO)

-- Utilizando Natural Joins: LIGA DUAS TABELAS BASEADO EM COLUNAS COM NOMES NAS DUAS TABELAS ENVOLVIDAS
-- COLUNAS TEM QUE TER MESMO NOME E MESMO TIPO DE DADOS
SELECT  department_id, department_name, location_id, city
FROM    departments
NATURAL JOIN locations;

-- JOIN com a Cláusula USING: 
--using: NOME DA COLUNA COM O MESMO NOME NAS TABELAS

SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
  JOIN departments d USING (department_id); -- a coluna usada na cláusula USING não pode ser prefixada 

-- Join com a Cláusula ON
-- 
SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

-- Joins utilizando várias tabelas com a Cláusula ON
-- cuidado: descobri a condição de ligação entre tabelas
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
  JOIN jobs        j ON (e.job_id = j.job_id)
  JOIN departments d ON (e.department_id = d.department_id)
  JOIN locations   l ON (d.location_id = l.location_id)
ORDER BY e.employee_id;
  
-- Incluindo condições adicionais a condição de Join na cláusula WHERE
-- where: fica mais claro, separado e seguro na pesquisa
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON  (e.department_id = d.department_id)
WHERE (e.salary BETWEEN 10000 AND 15000);

-- Incluindo condições adicionais a condição de Join utilizando AND
-- 
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id) AND
   (e.salary BETWEEN 10000 AND 15000);
   
-- Self Join Utilizando a Cláusula ON
-- 
SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente --o alias deixa mais legível
ON (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;



