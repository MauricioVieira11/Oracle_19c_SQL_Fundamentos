-- Seção 7 
-- Restringindo e Ordenando Dados
-- Aula 1
--
-- Utilizando a cláusula WHERE, retorna o que for veradeiro
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 100;

SELECT employee_id, last_name, job_id, department_id
FROM   employees
WHERE  job_id = 'IT_PROG' and department_id = 60;

-- Utilizando Strings de caractere na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King'; --CASE SENSITIVE UTILIZANDO ''

-- Utilizando Strings de caractere com datas na cláusula WHERE UTILIZADA NO BRASIL:DD/MM/YY OU DD/MM/RR
SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

-- Utilizando operadores de comparação na cláusula WHERE

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

-- Selecionando faixas de valores utilizando o operador BETWEEN
--TRABALHA COM FAIXA DE VALORES
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

-- Selecionando valores dentro de uma lista utilizando o operador IN
--COMPARA COM UMA LISTA DE VALORES ENTRE PARÊNTESES SEPARADOS POR VÍRGULAS
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP') ;

-- Utilizando o operador LIKE
-- UTILIZA PERCENT, "CARACTERES MÁGICOS"
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de vários caracteres curinga
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%'; --SEGUNDA LETRA a seguido por alguma coisa

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a'; --última letra do nome é a

-- Comparações com valor NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL; --precisa utilizar operador is nul

-- Utilizando a expressão de comparação IS NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- Utilizando o operador AND, comparações complexas
--retorna verdadeiro quando as duas condições for verdadeiro
SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
AND   job_id =  'IT_PROG';

-- Utilizando o operador OR
--retorna quando uma das comparações for rverdadeiro
SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
OR   job_id =  'IT_PROG';

--Utilizando o operador NOT
--negação da expressão lógica 
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Regras de Precedência
-- ver documentação, pois são muitas regras de precedência
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'  OR job_id = 'IT_PROG' AND salary > 10000;

-- Utilizando parênteses para sobrepor as regras de precedência
-- utiliza-se parêntese para dividir certo as regras de precedência
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'  OR
               job_id = 'IT_PROG')
AND salary > 10000;

-- Utilizando a cláusula ORDER BY - Ordem Ascendente
-- ordenar a saída dos resultados
--asc ou desc
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;  --asc é opcional 

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Utilizando a cláusula ORDER BY – Ordem Descendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;  --ordem descendente

-- Utilizando a cláusula ORDER BY – Referenciando ALIAS da coluna se existir
-- 
SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cláusula ORDER BY – Referenciando a Posição da coluna ou expressão
--
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4; --ordenar pela posição da coluna nesse caso é (hire_date)

-- Utilizando a cláusula ORDER BY – Múltiplas colunas ou expressões
--
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC; --department_id de forma ascendente e depois pelo salário descendente

-- Utilizando Variáveis de Substituição - &
-- --tem que ser digitado o valor de pois de executar a query
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id; --no início do valor que quer digitar

-- Utilizando Variáveis de Substituição - &&
-- && a ferramenta só ped o valor na primeira vez, na segunda vez ele não pede o valor
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Variáveis de substituição com valores tipo (Character e Date) ATENÇÃO!
-- TEM QUE COLOCAR DENTRO DE ASPAS SIMPLES
SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id' ;

-- Utilizando o comando DEFINE E UNDEFINE
-- DEFINIR VARIÁVEIS ANTES DE RODAR A QUERY, PODE USAR DENTRO DE UM COMANDO GRANDE
DEFINE employee_id = 101;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id ;

DEFINE employee_id;

UNDEFINE employee_id;