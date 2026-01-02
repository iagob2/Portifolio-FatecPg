-- 1. EQUIJOIN (Relacionamento Direto)
-- Liste o nome completo  do funcionário e o nome do departamento onde ele trabalha.

SELECT  e.first_name || ' ' || e.last_name as nome_completo  as nome_completo, d.department_name  as departamento FROM HR.EMPLOYEES e , HR.DEPARTMENTS d WHERE e.department_id = d.department_id ;

--2. NOEQUIJOIN (Intervalo de Valores)
-- Liste o nome do funcionário e o nível salarial dele (usando a tabela JOB_GRADES, se disponível, ou comparando salários com faixas).

SELECT  e.first_name || ' ' || e.last_name as nome_completo, e.salary as salario , j.min_salary as salario_minimo , j.max_salary as salario_maximo 
FROM HR.EMPLOYEES e , HR.JOBS j WHERE e.job_id = j.job_id AND e.salary BETWEEN j.min_salary AND j.max_salary ;



--3. OUTERJOIN (Operador (+))
-- Liste todos os departamentos e seus funcionários. Se um departamento não tiver funcionários, exiba nulo no nome do funcionário.

SELECT d.department_name as departamento, e.first_name || ' ' || e.last_name as nome_completo
FROM HR.DEPARTMENTS d, HR.EMPLOYEES e
WHERE d.department_id = e.department_id(+);    -- O (+) no lado do funcionário torna o Departamento o lado forte (Left)

--4. SELFJOIN (Hierarquia)
-- Liste o nome do funcionário e o nome do seu respectivo gerente.  --MANAGER_ID

SELECT  e.first_name || ' ' || e.last_name as Funcionário , g.first_name || ' ' || g.last_name as Gerente 
FROM  HR.EMPLOYEES e , HR.EMPLOYEES g WHERE e.manager_id = g.employee_id;


--Bloco 2: Junções ANSI SQL-99 (Sintaxe Moderna)
-- Nesta sintaxe, as regras de junção ficam separadas do filtro WHERE, aumentando a legibilidade.

-- 5. NATURAL JOIN (Colunas de mesmo nome)

SELECT e.first_name || ' ' || e.last_name as nome_completo , J.job_title as Trabalho FROM HR.EMPLOYEES E  NATURAL JOIN HR.JOBS J;
    
-- 6. JOIN com USING
-- Una funcionários e departamentos especificando a coluna comum department_id.
SELECT e.first_name || ' ' || e.last_name as nome_completo , d.department_name as Departamento FROM HR.EMPLOYEES e  JOIN HR.DEPARTMENTS d USING(department_id);

-- 7. JOIN com ON (Explicitamente)
-- Liste o nome do funcionário e a cidade onde ele trabalha, ligando DEPARTMENTS e LOCATIONS.
-- Relacionando Funcionários -> Departamentos -> Localizações explicitamente.

SELECT 
    e.first_name || ' ' || e.last_name AS nome_completo, 
    d.department_name AS departamento, 
    l.city AS cidade
FROM 
    HR.EMPLOYEES e
JOIN 
    HR.DEPARTMENTS d ON (e.department_id = d.department_id) 
JOIN 
    HR.LOCATIONS l ON (d.location_id = l.location_id);     

-- 8. LEFT OUTER JOIN
--Liste todos os funcionários e seus departamentos, incluindo funcionários que ainda não foram alocados a nenhum departamento.

SELECT e.first_name || ' ' || e.last_name AS nome_completo,  d.department_name as departamentos 
FROM HR.EMPLOYEES e 
LEFT OUTER JOIN HR.DEPARTMENTS d ON (e.department_id = d.department_id);

-- 9. RIGHT OUTER JOIN
-- Liste todos os departamentos, inclusive aqueles que não possuem nenhum funcionário vinculado
SELECT e.first_name || ' ' || e.last_name AS nome_completo,  d.department_name as departamentos 
FROM HR.EMPLOYEES e 
RIGHT OUTER JOIN HR.DEPARTMENTS d ON (e.department_id = d.department_id);

--10. FULL OUTER JOIN
-- Exiba uma lista completa: todos os funcionários (mesmo sem depto) e todos os departamentos (mesmo sem funcionários).
SELECT e.first_name || ' ' || e.last_name AS nome_completo,  d.department_name as departamentos 
FROM HR.EMPLOYEES e 
FULL OUTER JOIN HR.DEPARTMENTS d ON (e.department_id = d.department_id);

--EXTRA: CROSS JOIN (Produto Cartesiano)
--Exercício: Crie uma combinação de todas as linhas de cargos com todas as regiões (útil para relatórios estatísticos vazios).
SELECT j.job_title, r.region_name
FROM HR.JOBS j CROSS JOIN HR.REGIONS r;
