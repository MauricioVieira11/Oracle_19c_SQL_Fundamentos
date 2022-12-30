--
-- Seção 15 
-- Comandos DDL 
--
-- Aula 1 - Criando e Gerenciando Tabelas
--

-- Consultando os objetos do schema do usuario HR
/*Principais objetos: tabelas, views, sequence, índices, sinonimos*/

SELECT *
FROM   user_objects
ORDER BY Object_type;

-- Criando Tabelas

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 DESC projects
 
 SELECT *
 FROM projects;
 
DROP TABLE TEAMS;

CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL);

-- Consultando a Estrutura da Tabela

DESC projects

DESC teams;

-- Tipo ROWID
-- ROWID É O ENDEREÇO LÓGICO DA LINHA, MÉTODO DE ACESSO MAIS RÁPIDO DO ORACLE
--
DESC employees

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees
WHERE rowid = 'AAAR6YAAEAAALBbAAE';

-- Consultando as Tabelas existentes pelo Dicionário de Dados
--DBAs E DESENVOLVEDORES
DESC user_tables
--visão de dicionário de dados do Oracle
SELECT table_name
FROM   user_tables;

-- Consultando os Objetos do tipo TABLE do usuário

DESC user_objects

SELECT object_name, object_type
FROM   user_objects
WHERE  object_type = 'TABLE';

-- Criando uma Tabela utilizando uma Sub-consulta
-- create table as
DROP TABLE employees_department60;

CREATE TABLE employees_department60
AS
SELECT employee_id, last_name,salary*12 ANNSAL, hire_date
FROM employees
WHERE department_id = 60;

DESC employees_department60

SELECT *
FROM   employees_department60;

-- TRUNCATE TABLE: Comando DDL, não pode fazer rowback
-- deleta todas as linhas da tabela, deixar a tabela  vaziaa
--
TRUNCATE TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- DROP TABLE
-- remove a tabela e coloca a tabela na lixeira recicle bin
--não remove se a tabela tiver referências a não ser que tenha comando cascade constraints
DROP TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- Consultando a Lixeira
-- para recuperar uma tabela do recicle bin tem que usa o comando flashback
SELECT *
FROM user_recyclebin;

--ALTER TABLE: ADICIONAR COLUNA
alter table projects add (department_id NUMBER(4) NOT NULL);

DESC PROJECTS

--REMOVER COLUNA
ALTER TABLE PROJECTS DROP COLUMN DEPARTMENT_ID;

--MODIFICAR COLUNAS
--ATENÇÃO: PODE AUMENTAR PRA MAIS, SE FOR PRA MENOS ATENTAR COM OS DADOS JÁ EXISTENTES
ALTER TABLE PROJECTS MODIFY (PROJECT_CODE VARCHAR(2));

--RENOMEAR UMA COLUNA
ALTER TABLE PROJECTS RENAME COLUMN PROJECT_NAME TO NAME;

DESC PROJECTS

--ALTER TABLE READ ONLY
-- NÃO PERMITE COMANDOS DDL E DML
ALTER TABLE EMPLOYEES READ ONLY;

--ALTER TABLE READ WRITE
--PERMITE COMANDOS DDL E DML
ALTER TABLE EMPLOYEES READ WRITE;

