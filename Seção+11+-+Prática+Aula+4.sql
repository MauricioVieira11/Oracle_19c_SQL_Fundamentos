--
-- Seção 11 
-- Exibindo dados a partir de Múltiplas Tabelas
--
-- Aula 4 - 
--OUTER JOINS: retorna registros que não correspondem a condição de JOIN utilizando outer join

-- LEFT OUTER JOIN
-- tras todas a linhas correspondentes e também as linhas em que apontando a tabela a esquerda(left)...
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- RIGHT OUTER JOIN
-- fixa na direita e procura as linhas que não tem correspondente na esquerda
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM employees e RIGHT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- FULL OUTER JOIN
-- mostra quando não tiver correspondente na esquerda e na direita e traz o inner join também
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM   employees e FULL OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;


