-- Seção 10 
-- Agregando dados utilizando Funções de Grupo
--
-- Aula 2
-- 

-- Criado Grupos utilizando a Cláusula GROUP BY
--GROUP BY:
--ORDER BY:
SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id --EXPRESSÃO QUE FORMA GRUPO POR CÓDIGO DE DEPARTAMENTO
ORDER BY department_id; -- ORDENA A SAÍDA

-- Utilizando a clásula Group by com mais de uma Coluna ou Expressão
/*-- OBS: SÓ PODE USAR GROUP BY COM MAIS DE DOIS VAORES SE ESTIVER EXPRESSO NO INÍCIO DO SELECT
E TAMBÉM SE TIVER UMA FUNÇÃO DE GRUPO COMO NO EXEMPLO SUM*/
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando Funções de Grupo
SELECT department_id, AVG(salary)
FROM   employees;
-- Corrigindo consultas incorretas utilizando Funções de Grupo
SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas incorretas utilizando Funções de Grupo
-- WHERE: NÃO PODE REFRENCIAR FUNÇÕES DE GRUPOS
-- EXEMPLO ABAIXO DA ERRO
SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;
-- Corrigindo consultas incorretas utilizando Funções de Grupo
-- Restringindo Grupos utilizando a cláusula HAVING
--o HAVING CORRIGE O ERRO ACIMA
SELECT department_id, MAX(salary)
FROM   employees
GROUP BY department_id
HAVING MAX(salary)>10000;

SELECT job_id, SUM(salary) TOTAL
FROM   employees
WHERE  job_id <> 'SA_REP'
GROUP BY job_id
HAVING   SUM(salary) > 10000
ORDER BY SUM(salary);

-- Aninhando Funções de Grupo
SELECT MAX(AVG(salary)) --PRIMEIRO FAZ A MÉDIA E DEPOIS CALCULA O VALOR MÁXIMO
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM   employees
GROUP BY department_id;