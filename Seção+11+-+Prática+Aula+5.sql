--
-- Seção 11 
-- Exibindo dados a partir de Múltiplas Tabelas

-- Aula 5 - Produto Cartesiano

-- Gerando um Produto Cartesiano utilizando Cross Join
--combinação N pra N
--Cross Join para realizar o produto carteziano

SELECT last_name, department_name
FROM   employees
  CROSS JOIN departments;


