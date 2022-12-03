--
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 1 - Sub-Consultas Single-Row

-- Sub-Consultas Single-Row
/* A subconsulta deve ficar entre parênteses, A direita do operador de comparação 
subconsultas devem retornar uma linha, a subconsulta geralmente é executada primeiro
OBS: se a subconsulta retonar mais de uma linha dá erro!!!!
*/

SELECT first_name, last_name, job_id, salary
FROM   employees
WHERE  salary >
                (SELECT AVG(NVL(salary,0))
                 FROM employees);              

-- Utilizando Sub-consultas na Cláusula HAVING
-- 
SELECT e1.department_id, MAX(e1.salary)
FROM   employees e1
GROUP BY e1.department_id
HAVING MAX(salary) <  (SELECT AVG(e2.salary)
                       FROM   employees e2);
                                                  
-- Erros utilizando Sub-consultas Single-Row
--OBS: se a subconsulta retonar mais de uma linha dá erro!!!!

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary =
                (SELECT    AVG(NVL(salary,0))
                 FROM      employees
                 GROUP BY  department_id);

-- O que ocorre quando a Sub-Consulta retorna nenhuma linha?
-- se a subconsulta não retornar nenhuma linha, logo retorna nulo(nada)
SELECT employee_id, first_name, last_name
FROM   employees
WHERE  last_name =  (SELECT last_name
                     FROM   employees
                     WHERE  last_name = 'Suzuki');

         