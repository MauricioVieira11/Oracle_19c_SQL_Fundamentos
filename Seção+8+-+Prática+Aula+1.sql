--
-- Seção 8 
-- Utilizando Funções Single Row
--
-- Aula 1
--

-- Funções de conversão Maiúsculo & Minúsculo
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING'; --case sensitive, não retorna nada
-- cada cláusula é independente, mas a exibição é last_name
SELECT employee_id, last_name, department_id
FROM employees
WHERE UPPER(last_name) = 'KING'; --encontra determinado funcionario independente de como está escrito

-- Funções de Manipulação de Caracteres

SELECT CONCAT(' Curso: ','Introdução ORACLE 19c'), SUBSTR('Introdução ORACLE 19c',1,11),
       LENGTH('Introdução ORACLE 19c'), INSTR('Introdução ORACLE 19c','ORACLE')
FROM dual; --tabela que sempre existe no banco para retornar o valor, possui uma linha

SELECT first_name "Nome", LPAD(first_name, 20, ' ') "Nome alinhado a direita", RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM   employees;

SELECT job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM jobs
WHERE  job_title = 'President';

-- Funções tipo NUMBER
--
SELECT ROUND(45.923,2), ROUND(45.923,0) --arredonda com precisão e arredonda
FROM dual;

SELECT TRUNC(45.923,2), TRUNC(45.923,0) --corta a casa decimal sem arredondamento
FROM dual;

SELECT MOD(1300,600) RESTO --MOD mostra o resto divisão
FROM dual;

SELECT ABS(-9), SQRT(9) --ABS retorna valor absoluto, SORT retorna raíz quadrada de um número
FROM dual;

-- Funções tipo DATE 
SELECT sysdate --exibe a data atual uma vez
FROM dual;

DESC dual

SELECT *
FROM dual; --só tem uma linha. 

SELECT 30000 * 1.25 --pde fazer cálculo com essa tabela 
FROM dual;

-- Cálculos com Datas

SELECT sysdate, sysdate + 30, sysdate + 60, sysdate - 30 --+ dias
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO'"
FROM employees;

-- Outras Funções tipo DATE

SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date),2) "MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), NEXT_DAY(SYSDATE,'SEXTA FEIRA'), LAST_DAY(SYSDATE) --adiciona 3 meses a partir da data
FROM   dual;

SELECT sysdate, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR'), 
       TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
FROM   dual;
       
SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE),'DD/MM/YYYY HH24:MI:SS')
FROM  dual;