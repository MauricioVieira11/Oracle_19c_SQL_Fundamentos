--
-- Seção 19 
-- Criando e Gerenciando Índices
--
-- Aula 1 - Criando e Gerenciando Índices
--
-- indice é um objeto que é separado da tabela, serve para melhorar a performance da recuperação de linhas de uma consulta
-- mantido automaticamente pelo Oracle
-- criado automaticamente quando usado pela primary key ou unique na definição da tabela
-- criado manualmente para outras colunas muito usadas por consultas de select
-- Analize o custo do comando no plano de execução

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Criando um Indice Simples
--verificar plano de execução do select para depois criar um índice
CREATE INDEX employees_last_name_idx
ON employees(last_name);

-- Analize o custo do comando no plano de execução

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Criando um Indice Composto
--verificar plano de execução do select para depois criar um índice
CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

-- Analize o custo do comando no plano de execução
-- quem decide se vai usar o índice é o oracle
SELECT *
FROM  employees
WHERE last_name = 'Himuro' AND 
      first_name = 'Guy';

-- Reconstruindo e reorganizando um Índice
-- após as deleções de índices, pode onerar a performance
-- usa-se o rebuild para reconstruir o índice e reorganizar
ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Removendo um Índice

DROP INDEX employees_last_name_idx;

-- Consultando Indices

SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Removendo um Índice

DROP INDEX employees_last_name_idx;

DROP INDEX employees_last_name_first_name_idx;