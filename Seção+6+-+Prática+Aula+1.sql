--
-- Seção 6 
--describe: mostra a estrutura das tabelas
describe employees;
describe departments;
desc employees;
desc jobs, locations;

-- select básico
select * from employees;
select * from jobs;

--selecionar colunas específicas
select department_id, first_name from employees;

-- Operadores aritméticos
select first_name, last_name, salary, salary * 1.15 from employees;
select first_name, last_name, salary, salary + 100, salary * 1.15 from employees;
select first_name, last_name, salary, (salary + 100) * 1.15 from employees;

--Null: ausência de valor
SELECT  first_name, last_name, job_id, salary,  commission_pct
FROM    employees;
--null e nvl
SELECT  first_name, last_name, job_id, salary,  nvl(commission_pct, 0)
FROM    employees;

--Valores Nulos em expressões aritméticas
SELECT  first_name, last_name, job_id, commission_pct, 200000 * commission_pct
FROM    employees
WHERE   commission_pct IS NULL;

--Alias de Coluna nomeadas expressamente

SELECT first_name AS nome, last_name AS sobrenome, salary AS salário
FROM employees;
--Alias de Coluna nomeadas implicitamente
SELECT first_name nome, last_name  sobrenome, salary salário
FROM employees;
--Alias com várias palavras e letras maiúsculas ou minúsculas e caracteres epeciais utilizando aspas duplas
SELECT first_name "Nome", last_name "Sobrenome", salary "Salário ($)", commission_pct "Percentual de comissão"
FROM   employees;

-- Utilizando Operador de concatenação, junta valores de colunas
SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM   employees;

-- Utilizando Operador de concatenação e Strings de caracteres 
SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionário"
FROM   employees;

-- Utilizando Operador alternativo para aspas. quando tem aspas dentro da string de caracter
SELECT department_name || q'[ Department's Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;

-- Linhas duplicadas
SELECT department_id
FROM employees;

-- Utilizando DISTINCT para eliminar linhas duplicadas
SELECT DISTINCT department_id 
FROM employees;

SELECT DISTINCT last_name
FROM employees;

-- Utilizando DISTINCT para eliminar linhas duplicadas das duas colunas
SELECT DISTINCT last_name, first_name
FROM employees;

