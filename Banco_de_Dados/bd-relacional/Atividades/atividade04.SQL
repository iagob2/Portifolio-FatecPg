CREATE TABLE FUNCIONARIO AS
SELECT *
FROM HR.EMPLOYEES;

-- 1. Exiba o número do funcionário, o nome, o salário e o aumento salarial de 15% expresso como número inteiro. Coloque um label na coluna Novo Salário.


ALTER TABLE FUNCIONARIO ADD NOVO_SALARIO NUMBER(10,2);

UPDATE FUNCIONARIO SET NOVO_SALARIO = SALARY + SALARY * 0.15;

SELECT EMPLOYEE_ID , FIRST_NAME , SALARY, NOVO_SALARIO FROM FUNCIONARIO  ;

-- 2. Alterar o exercício 1 para adicionar uma coluna que subtrairá o salário antigo do novo salário. Coloque um label na coluna Diferença. Execute novamente a consulta.

ALTER TABLE FUNCIONARIO ADD DIFERENCA NUMBER(10,2);
UPDATE FUNCIONARIO SET DIFERENCA = NOVO_SALARIO - SALARY ;
SELECT SALARY , NOVO_SALARIO , DIFERENCA FROM FUNCIONARIO ; 

--3.Crie uma consulta que exiba os sobrenomes dos funcionários, a primeira letra maiúscula e o tamanho dos nomes para todos os funcionários cujo nome seja iniciado por A, J ou M. Classifique os resultados em ordem alfabética.

SELECT
    LAST_NAME, -- Sobrenome original
    INITCAP(LAST_NAME) AS Sobrenome_Formatado, -- Primeira letra maiúscula
    LENGTH(LAST_NAME) AS Tamanho_Sobrenome -- Tamanho do sobrenome
FROM
    FUNCIONARIO -- Substitua por 'FUNCIONARIO' se for o nome da sua tabela
WHERE
    LAST_NAME LIKE 'A%' OR
    LAST_NAME LIKE 'J%' OR
    LAST_NAME LIKE 'M%'
ORDER BY
    LAST_NAME ASC;

-- 4.  Exiba o sobrenome de cada funcionário e calcule a quantidade de meses entre a data atual e a data em que o funcionário foi admitido. Classifique pela quantidade de meses. Obs. Arredonde o número de meses para o número inteiro mais próximo.
SELECT
    LAST_NAME,
    -- 1. Calcula a diferença em meses entre a data atual (SYSDATE ou current_date) e a data de contratação.
    -- 2. Arredonda o resultado para o número inteiro mais próximo.
    ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS Meses_Contratacao
FROM
    FUNCIONARIO 
ORDER BY
    Meses_Contratacao ASC; -- Classifica pelo número de meses

--5.Exiba o nome do funcionário, a data de admissão que é a primeira após seis meses de serviço. Formate as datas que aparecem um formato semelhante a “Domingo, 31 julho 2007”.
SELECT
    FIRST_NAME, -- Nome do funcionário
    -- 1. Calcula a data seis meses após a admissão
    -- 2. Formata essa data para o padrão solicitado
    TO_CHAR(
        ADD_MONTHS(HIRE_DATE, 6),
        'Day, DD Month YYYY',
        'NLS_DATE_LANGUAGE=PORTUGUESE' -- Garante que o dia/mês apareça em português
    ) AS Data_Apos_Seis_Meses
FROM
    FUNCIONARIO; 

-- 6.Crie uma consulta que produza as seguintes informações para cada funcionário: <nome do funcionário recebe <salário> mensalmente, mas deseja <salário multiplicado por 3>. Coloque um label na coluna.
SELECT
    FIRST_NAME || ' ' || LAST_NAME || ' recebe ' || SALARY || ' mensalmente, mas deseja ' || (SALARY * 3) || '.'
    AS Relatorio_Salarial
FROM
    FUNCIONARIO; 

-- 7.Crie uma consulta que exiba o nome e o salário de todos os funcionários. Formate o salário para ter 15 caracteres e apresentar o cifrão à esquerda. Coloque um label na coluna Salário.
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS Nome_Completo,
    LPAD('$' || SALARY, 15, '$') AS Salario_Formatado
FROM
    FUNCIONARIO; 

--8.Exiba o nome, a data de admissão e o dia da semana que o funcionário começou a trabalhar. Coloque um label na coluna SEMANA. Ordene os resultados por dia da semana, iniciando por segunda-feira.
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS Nome_Completo,
    HIRE_DATE AS Data_de_Admissao,
    -- Exibe o nome do dia da semana em Português
    TO_CHAR(HIRE_DATE, 'Day', 'NLS_DATE_LANGUAGE=PORTUGUESE') AS SEMANA,
    -- Exibe o número do dia da semana (necessário para ordenação)
    TO_CHAR(HIRE_DATE, 'D') AS NUMERO_SEMANA
FROM
    FUNCIONARIO 
ORDER BY
    NUMERO_SEMANA ASC;
    FUNCIONARIO; 
-- 9. Crie uma consulta que exibirá o nome do funcionário e o valor da comissão. Se o funcionário não receber comissão, coloque “Não há comissão”. Coloque um label na coluna COMM.
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS Nome_Completo,
    CASE
        WHEN COMMISSION_PCT IS NULL THEN 'Não há comissão'
        ELSE TO_CHAR(SALARY * COMMISSION_PCT) -- Converte o valor numérico para texto
    END AS COMM
FROM
    FUNCIONARIO;

--10. Exiba os salários maior, médio, menor e a soma de todos os salários de todos os funcionários. Coloque um label[1] nas colunas Máximo, Mínimo, Soma e Média, respectivamente. Arredonde os resultados para o número inteiro mais próximo.
SELECT 
  MAX(SALARY) AS MAXIMO, 
  MIN(SALARY) AS MINIMO , 
  SUM(SALARY) AS SOMA , 
  CEIL(AVG(SALARY)) AS MEDIA 
FROM 
  FUNCIONARIO ; 

-- 11.Alterar o  exercício 1 para exibir o salário maior, médio, menor e a soma de todos os salários para cada tipo de cargo.

SELECT
    JOB_ID AS Cargo, -- Tipo de cargo
    MAX(SALARY) AS Salario_Maximo,
    MIN(SALARY) AS Salario_Minimo,
    SUM(SALARY) AS Soma_Total_Salarios,
    -- Usamos ROUND ou TRUNC para arredondar a média, CEIL funciona, mas ROUND/TRUNC é mais comum
    ROUND(AVG(SALARY), 2) AS Salario_Medio
FROM
    FUNCIONARIO 
GROUP BY
    JOB_ID -- Agrupa os resultados pelo tipo de cargo
ORDER BY
    JOB_ID;

--12. Crie uma consulta para exibir o número de pessoas com o mesmo cargo.
SELECT
    JOB_ID, -- Exibe o tipo de cargo (chave de agrupamento)
    COUNT(JOB_ID) AS Total_Pessoas -- Alias corrigido sem espaços
FROM
    FUNCIONARIO
GROUP BY
    JOB_ID
ORDER BY
    JOB_ID;

--13. Determine o número de gerentes sem listá-los. Coloque um label na coluna Número de Gerentes.
SELECT
    COUNT(JOB_ID) AS nUMEOR_GERENTES
FROM
    FUNCIONARIO
WHERE JOB_ID = 'ST_MAN'; 

--14.Crie uma consulta para exibir a diferença entre os maiores e menores salários; coloque um label na coluna DIFERENCA.

SELECT
    JOB_ID AS Cargo,
    MAX(SALARY) AS Salario_Maximo,
    MIN(SALARY) AS Salario_Minimo,
    MAX(SALARY) - MIN(SALARY) AS DIFERENCA -- Cálculo da diferença
FROM
    FUNCIONARIO
GROUP BY
    JOB_ID
ORDER BY
    JOB_ID;


--Opção 2: Diferença Global (Geralmente o objetivo de questões como esta)
SELECT
    MAX(SALARY) AS Salario_Maximo,
    MIN(SALARY) AS Salario_Minimo,
    MAX(SALARY) - MIN(SALARY) AS DIFERENCA -- Cálculo da diferença global
FROM
    FUNCIONARIO;
