--
-- Seção 10 
-- Agregando dados utilizando Funções de Grupo
--
-- Aula 1
--
-- Utilizando as Funções AVG e SUM
-- AVG: retorna a média, dados nunméricos
--SUM: somátório
SELECT AVG(salary), SUM(salary)
FROM   employees;

-- Utilizando as Funções MIN e MAX
--Min: retorna menor mínimo. trabalha com números, strings e datas
--max: retorna valor máximo. trabalha com números, strings e datas
SELECT MIN(hire_date), MAX(hire_date)
FROM   employees;

SELECT MIN(salary), MAX(salary)
FROM   employees;

-- Utilizando a Função COUNT
-- conta número de linhas. depende do argumento que passar
SELECT COUNT(*)
FROM   employees;

SELECT COUNT(commission_pct) --ATENÇÃO: retorna número de linahs diferente de nulos!
FROM   employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0)) --nvl coloca 0 e asim retorna a contagem de todas as linhas
FROM employees;

-- Utilizando a Função COUNT com DISTINCT
--DISTINCT: número de linhas distinta
SELECT COUNT(DISTINCT department_id)
FROM   employees;

SELECT COUNT(department_id)
FROM   employees;

-- Funções de Grupo e valores NULOS
-- FUNÇÕES DE GRUPOS IGNORAM VALORES NULOS
SELECT AVG(commission_pct)
FROM   employees;
-- Tratamento de NULOS em Funções de Grupo 
-- AGORA ASSIM O CÁLCULO DA MÉDIA ESTÁ CERTA COLOCANDO O NVL
SELECT AVG(NVL(commission_pct, 0))
FROM   employees;

