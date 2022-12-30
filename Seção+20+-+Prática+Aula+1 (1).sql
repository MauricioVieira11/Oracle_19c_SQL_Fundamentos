--
-- Seção 20 
-- Criando Sinônimos
--
-- Aula 1 - Criando Sinônimos: públicos e privados
--
--objeto do oracle que serve para dar outro nome a um objeto, pode criar um nome mais fácil para um objeto
--criar nome lógico

-- Criando Sinonimos Privados
-- obter grant para criar sinônimos
CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando Sinônimos

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos
-- nada acontece com o objeto original
DROP SYNONYM departamentos;

DROP SYNONYM dept;

-- Criando Sinônimos Públicos para Tabelas em outro Schema
-- o DBA pode criar sinônimos públicos para todos os usuários do banco

-- Conecte-se como SYS
-- cria para todos os usuários
CREATE PUBLIC SYNONYM departamentos
FOR hr.departments;

CREATE PUBLIC SYNONYM dept
FOR hr.departments;

-- Conecte-se como SYS

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Conecte-se como HR

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos Públicos

-- Conecte-se como SYS

DROP PUBLIC SYNONYM departamentos;

DROP PUBLIC SYNONYM dept;