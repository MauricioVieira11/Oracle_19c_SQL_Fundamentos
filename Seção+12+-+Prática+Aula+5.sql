--
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 5 - Utilizando Sub-consultas Multiple-Column 
-- 
-- Utilizando Sub-consultas Multiple-Column 
-- RETORNAM MAIS DE UMA COLUNA. 
-- A EXPRESSÃO TEM QUE TER O MESMO NUMERO DE COLUNAS DA SUBCUNSULTA.
-- A COMPARAÇÃO SERÁ AOS PARES E SE FOR VERDADEIRAS.
SELECT e1.employee_id, e1.first_name, e1.job_id, e1.salary
FROM   employees e1
WHERE (e1.job_id, e1.salary) IN (SELECT   e2.job_id, MAX(e2.salary)
                                 FROM     employees e2
                                 GROUP by e2.job_id);  

								 
