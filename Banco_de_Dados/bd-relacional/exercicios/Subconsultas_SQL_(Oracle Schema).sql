-- Lista de Exercícios de Subconsultas SQL (Oracle Schema)

-- Tabelas de Referência: EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS.

-- 1. Subconsulta Escalar (Retorna Uma Linha)
-- Conceito a praticar: Subconsultas que retornam uma coluna e no máximo uma linha. Elas são usadas como condição de comparação, geralmente no lado direito.

-- Exercício 1.1: Crie uma consulta que retorne o last_name (sobrenome) e o salary (salário) de todos os empregados que ganham exatamente o mesmo salário que o empregado de employee_id = 145.

SELECT last_name AS nome, salary AS salario FROM HR.EMPLOYEES
 WHERE
    salary = (
        -- Subconsulta: Encontra o salário do empregado com ID 145
        SELECT salary
        FROM HR.EMPLOYEES
        WHERE employee_id = 145
    );


-- Exercício 1.2: Crie uma consulta que encontre o department_name e o location_id do departamento que possui o maior manager_id (assuma que este ID é único e pode ser comparado).

SELECT department_name as nome_departamento , location_id as id FROM HR.DEPARTMENTS 
WHERE 
  manager_id = (
        -- Subconsulta: Encontra o valor máximo de manager_id em toda a tabela
        SELECT MAX(manager_id)
        FROM HR.DEPARTMENTS
    );

-- 2. Subconsultas com Múltiplas Linhas (Operadores IN, ANY, ALL)
-- Conceito a praticar: Utilização de operadores que retornam uma linha ou mais de uma linha, como IN, ANY e ALL.

-- Exercício 2.1 (IN): Escreva uma consulta que retorne o last_name de todos os empregados que trabalham em departamentos (department_id) localizados na cidade de 'Seattle' 
--(você precisará consultar as tabelas DEPARTMENTS e LOCATIONS).
SELECT
    last_name AS nome_empregado
FROM
    HR.EMPLOYEES
WHERE
    department_id IN (
        -- Subconsulta 1 (Intermediária): Encontra os department_id que estão em Seattle
        SELECT department_id
        FROM HR.DEPARTMENTS
        WHERE location_id IN (
            -- Subconsulta 2 (Interna): Encontra os location_id da cidade de 'Seattle'
            SELECT location_id
            FROM HR.LOCATIONS
            WHERE city = 'Seattle'
        )
    );

-- Exercício 2.2 (ANY): Crie uma consulta que encontre todos os empregados que ganham um salário maior que o min_salary de qualquer cargo (Job) listado na tabela JOBS (Utilize o operador >ANY). 
-- Isso retornará empregados que ganham mais que o salário mínimo de pelo menos um cargo.
SELECT
    last_name AS empregados,
    salary  -- Incluído o salário para facilitar a verificação
FROM
    HR.EMPLOYEES
WHERE
    SALARY > ANY (
        -- Subconsulta: Retorna a lista de todos os salários mínimos
        SELECT min_salary
        FROM HR.JOBS
    );

-- Exercício 2.3 (ALL): Crie uma consulta que retorne o last_name e o salary dos empregados cujo salário seja maior que o max_salary de todos os cargos juntos (Utilize o operador >ALL).
-- Isso garantirá que o salário do funcionário seja maior que o maior max_salary encontrado no conjunto da subconsulta.

SELECT
    last_name AS empregados,
    salary  -- Incluído o salário para facilitar a verificação
FROM
    HR.EMPLOYEES
WHERE
    SALARY > ALL (
        -- Subconsulta: Retorna a lista de todos os salários mínimos
        SELECT  max_salary
        FROM HR.JOBS
    );

-- 3. Subconsulta Emparelhada vs. Não Emparelhada
-- Conceito a praticar: Comparação de uma única coluna (Não Emparelhada) versus a comparação simultânea de duas ou mais colunas (Emparelhada).

-- Exercício 3.1 (Não Emparelhada): Encontre os empregados que possuem o mesmo job_id que o empregado 201 E que trabalham no mesmo department_id que o empregado 201. Use duas subconsultas separadas na cláusula WHERE.
SELECT
    last_name AS empregados,
    job_id,        -- Adicionei job_id e department_id para conferência
    department_id
FROM
    HR.EMPLOYEES
WHERE
    -- 1. Condição para job_id: Deve ser igual ao job_id do empregado 201
    job_id = (
        SELECT job_id
        FROM HR.EMPLOYEES
        WHERE employee_id = 201
    )
AND -- Usamos o operador lógico AND
    -- 2. Condição para department_id: Deve ser igual ao department_id do empregado 201
    department_id = (
        SELECT department_id
        FROM HR.EMPLOYEES
        WHERE employee_id = 201
    )
-- Opcional: Excluir o próprio empregado 201 da lista de resultados
AND employee_id <> 201;

SELECT
    last_name AS empregado,
    job_id,
    department_id
FROM
    EMPLOYEES
WHERE
    -- Compara o PAR de colunas (job_id, department_id)
    (job_id, department_id) = ( 
        -- Subconsulta: Retorna o PAR (job_id, department_id) do empregado 201
        SELECT job_id, department_id
        FROM EMPLOYEES
        WHERE employee_id = 201
    )
AND employee_id <> 201; -- Exclui o próprio empregado 201


-- 4. Subconsulta Correlacionada
-- Conceito a praticar: Subconsultas que se unem a uma tabela a partir da consulta "pai" (externa), sendo frequentemente usadas em comandos DQL.
-- Exercício 4.1: Escreva uma consulta que liste o department_id, o last_name e o salary do empregado que possui o salário mais alto dentro de cada departamento.

SELECT
    E1.department_id,
    E1.last_name AS nome,
    E1.salary AS salario
FROM
    HR.EMPLOYEES E1
WHERE
    NOT EXISTS (
        SELECT 1
        FROM HR.EMPLOYEES E2
        -- 1. Condição de Correlação: A subconsulta se refere ao departamento da consulta externa (E1)
        WHERE E2.department_id = E1.department_id
        -- 2. Condição de Filtro: Procura por um salário maior no mesmo departamento
        AND E2.salary > E1.salary
    );
