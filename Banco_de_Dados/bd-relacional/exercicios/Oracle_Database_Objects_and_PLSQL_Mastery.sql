-- USAREMOS tabelas EMPLOYEES, DEPARTMENTS e JOBS DO LIVESQL

-- Bloco 1: SEQUENCES (Automação de IDs)
-- Cenário: O sistema de cadastro de novos funcionários está falhando porque múltiplos usuários tentam cadastrar IDs manuais ao mesmo tempo, gerando conflitos. 
-- O gerente de TI pediu para automatizar a geração desses números.

--Desafio 1.1 (Criação): Crie um objeto de sequência chamado MEU_ID_SEQ. Para evitar conflitos com IDs antigos, a numeração deve começar em 1000. Ela deve crescer de 10 em 10 unidades.
--Defina um teto máximo de 1050 para teste e garanta que os números não fiquem pré-carregados na memória (NOCACHE) para evitar saltos em caso de queda do servidor.

CREATE SEQUENCE  MEU_ID_SEQ 
    START WITH 1000
    INCREMENT BY 10
    MAXVALUE  1050
    NOCACHE ; 

-- Desafio 1.2 (Aplicação): Simule a contratação de um novo funcionário (Ex: Sobrenome 'Silva', cargo 'IT_PROG'). No comando de inserção, utilize a sequência criada para gerar o ID automaticamente.
CREATE TABLE FUNCIONARIO AS SELECT * FROM HR.EMPLOYEES ;

INSERT INTO FUNCIONARIO (employee_id, last_name, email, hire_date, job_id) 
VALUES (MEU_ID_SEQ.NEXTVAL, 'Silva', 'silva@email.com', SYSDATE, 'IT_PROG');

-- Desafio 1.3 (Verificação): O auditor precisa saber qual foi o último número gerado pela sequência na sua sessão atual para validar a inserção. Exiba esse valor.

SELECT MEU_ID_SEQ.CURRVAL FROM dual;


--Bloco 2: VIEWS (Visões e Relatórios)
--Cenário: O diretor financeiro pede relatórios constantes, mas não sabe escrever SQL. Além disso, a equipe de estagiários precisa ver dados dos funcionários, 
--mas não pode ter acesso para alterar nada.

--Desafio 2.1 (Relatório Simples): Crie uma visão chamada V_SALARIOS_ALTO que funcione como um filtro permanente. Ela deve listar apenas o ID,
--Nome e Salário dos funcionários que ganham acima de 10.000.

CREATE TABLE FUNCIONARIO AS SELECT * FROM HR.EMPLOYEES ;
DESC FUNCIONARIO ;

CREATE OR REPLACE VIEW  V_SALARIOS_ALTO AS 
SELECT EMPLOYEE_ID , FIRST_NAME first_name , LAST_NAME , SALARY FROM FUNCIONARIO WHERE SALARY > 10000 ;


SELECT * FROM  V_SALARIOS_ALTO ;


-- Desafio 2.2 (Relatório Analítico): O financeiro precisa monitorar o custo médio por setor. Crie uma visão V_MEDIA_DEPARTAMENTO 
-- que exiba o ID do departamento e a média salarial daquele setor, arredondada para 2 casas decimais.




CREATE OR REPLACE VIEW V_MEDIA_DEPARTAMENTO AS SELECT DEPARTMENT_ID , ROUND(AVG(SALARY),2) AS MEDIA_SALARIAL
FROM FUNCIONARIO GROUP BY DEPARTMENT_ID ;

SELECT * FROM V_MEDIA_DEPARTAMENTO;


-- Desafio 2.3 (Segurança de Dados): Crie uma visão chamada V_SEGURA para os estagiários. Ela deve mostrar dados básicos (ID, Sobrenome, Cargo),
-- mas deve conter uma trava de segurança (READ ONLY) que impeça qualquer comando DELETE ou UPDATE através desta visão.

CREATE OR REPLACE VIEW V_SEGURA AS
SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' || LAST_NAME AS NOME_COMPLETO,
       JOB_ID
FROM FUNCIONARIO
WITH READ ONLY;


-- Desafio 2.4 (Ranking): A diretoria quer premiar os talentos mais caros. Crie uma consulta usando a técnica de TOP-N para listar os 5 maiores salários da empresa.

CREATE OR REPLACE VIEW TOP_5 AS SELECT last_name, salary, ROWNUM as ranking
FROM (SELECT last_name, salary FROM HR.EMPLOYEES ORDER BY salary DESC) 
WHERE ROWNUM <= 5;

SELECT * FROM TOP_5; 


--Bloco 3: Performance e Usabilidade
--Cenário: O sistema está lento ao filtrar funcionários por departamento e os desenvolvedores reclamam que o nome da tabela EMPLOYEES é muito longo para digitar toda hora.

--Desafio 3.1 (Sinônimo): Crie um apelido (sinônimo) público ou privado chamado EMP que aponte para a tabela EMPLOYEES, facilitando a escrita de queries ad-hoc.

CREATE SYNONYM EMP FOR HR.EMPLOYEES ;
SELECT * FROM EMP ;

--Desafio 3.2 (Otimização/Índice): O relatório de "Funcionários por Departamento" é o mais acessado do sistema. 
--Crie um índice na coluna DEPARTMENT_ID da tabela de funcionários para acelerar as buscas que utilizam essa coluna no WHERE.
CREATE TABLE FUNCIONARIO AS SELECT *  FROM HR.EMPLOYEES ;
CREATE INDEX IDX_DEP_ID ON FUNCIONARIO (department_id);

SELECT index_name, table_name
FROM user_indexes
WHERE index_name = 'IDX_DEP_ID';

--Limpeza do índice
DROP INDEX IDX_DEP_ID;


--Bloco 4: PL/SQL Básico (Lógica Procedural)
--Cenário: O SQL padrão não é suficiente. Precisamos criar scripts que tomem decisões baseadas nos dados retornados (ex: classificar salários automaticamente).

--Desafio 4.1 (Captura de Dados): Crie um bloco anônimo PL/SQL. O objetivo é buscar o nome e o salário do funcionário de ID 100 e armazená-los em variáveis.
--Requisito Técnico: Use o atributo %TYPE ao declarar as variáveis para garantir que elas tenham o mesmo tipo de dado das colunas da tabela, 
--mesmo que a tabela mude no futuro. Exiba o resultado na tela.

SET SERVEROUTPUT ON;

DECLARE 
  v_nome FUNCIONARIO.first_name%TYPE;
  v_salario FUNCIONARIO.salary%TYPE;
BEGIN
   SELECT first_name , salary 
   INTO v_nome , v_salario
   FROM FUNCIONARIO WHERE employee_id = 100;

  DBMS_OUTPUT.PUT_LINE('Funcionário: ' || v_nome || ' - Salário: ' || v_salario);

END;

--Desafio 4.2 (Lógica Condicional): Aproveitando o bloco anterior, adicione uma lógica de decisão (IF/ELSE). Se o salário capturado for maior que 15.000,
--o sistema deve imprimir "Salário Alto". Caso contrário, imprima "Salário Padrão".

DECLARE 
  v_nome     FUNCIONARIO.first_name%TYPE;
  v_salario  FUNCIONARIO.salary%TYPE;
BEGIN
   SELECT first_name, salary
   INTO v_nome, v_salario
   FROM FUNCIONARIO
   WHERE employee_id = 100;

   IF v_salario > 15000 THEN
      DBMS_OUTPUT.PUT_LINE('Salário Alto');
      DBMS_OUTPUT.PUT_LINE('Funcionário: ' || v_nome || ' - Salário: ' || v_salario);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Salário Padrão');
      DBMS_OUTPUT.PUT_LINE('Funcionário: ' || v_nome || ' - Salário: ' || v_salario);
   END IF;
END;


--Bloco 5: PL/SQL Avançado (Loops e Tratamento de Erros)
--Cenário: Precisamos processar lotes de funcionários e o sistema precisa ser robusto o suficiente para não travar se buscarmos um ID inexistente.

--Este fluxo ilustra como o cursor deve abrir, buscar dados linha a linha, verificar se acabou e depois fechar, conforme pedido no desafio 5.1.

--Desafio 5.1 (Processamento em Lote): Crie um bloco PL/SQL que utilize um Cursor Explícito. O script deve carregar todos os funcionários do departamento 90 na memória. 
--Em seguida, use um loop para percorrer linha por linha, exibindo o nome e salário de cada um, até que não haja mais registros.

DECLARE 
  CURSOR c_departamento IS 
     SELECT FIRST_NAME , SALARY  FROM FUNCIONARIO WHERE department_id = 90;
    
  v_nome     FUNCIONARIO.first_name%TYPE;
  v_salario  FUNCIONARIO.salary%TYPE;

BEGIN 
  OPEN c_departamento ;
  LOOP 
        FETCH c_departamento INTO v_nome, v_salario; 
        EXIT WHEN c_departamento%NOTFOUND; 
        DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' | Salário: ' || v_salario); 
    END LOOP;

  CLOSE c_departamento ;
END ;


--Desafio 5.2 (Tratamento de Exceção): Crie um script de busca por ID. Propositalmente, tente buscar o funcionário de ID 9999 (que não existe).
--O script não pode travar com erro de banco de dados; ele deve capturar o erro (NO_DATA_FOUND) e exibir uma mensagem amigável e personalizada ao usuário.

DECLARE 
  v_nome FUNCIONARIO.first_name%TYPE;
BEGIN 
  SELECT first_name || last_name into v_nome from funcionario WHERE employee_id = 9999;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('AVISO: ID do funcionário não existe no sistema.'); 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Ocorreu um problema inesperado.');
END;

--Bloco 6: Objetos Nomeados (Procedures e Functions)
--Cenário: A lógica de "Boas Vindas" e "Cálculo de Imposto" está espalhada por vários scripts diferentes. Precisamos centralizar isso em objetos reutilizáveis no banco.

--Desafio 6.1 (Procedure): Crie um procedimento armazenado chamado SAUDA_EMPREGADO. Ele deve receber um ID de funcionário como parâmetro de entrada, 
--buscar o nome dessa pessoa e imprimir a mensagem "Olá, [Nome]! Bem-vindo ao portal.".
CREATE OR REPLACE PROCEDURE SAUDA_EMPREGADO(p_id FUNCIONARIO.employee_id%TYPE) is 
  v_nome FUNCIONARIO.first_name%TYPE;
BEGIN 
  SELECT first_name ||' ' || last_name into v_nome from funcionario WHERE employee_id = p_id;
  DBMS_OUTPUT.PUT_LINE('Olá, ' || v_nome || ' ! Bem-vindo ao portal de RH.');
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('AVISO: ID do funcionário não existe no sistema.'); 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Ocorreu um problema inesperado.');
END;
EXECUTE SAUDA_EMPREGADO(8);

--Desafio 6.2 (Function): Crie uma função chamada CALCULA_IR para padronizar a regra fiscal. Ela deve receber um valor de salário, 
--aplicar uma alíquota de 15% e retornar o valor do imposto calculado.
CREATE OR REPLACE FUNCTION CALCULA_IR(p_salario IN NUMBER) 
RETURN NUMBER IS 
BEGIN 
    RETURN p_salario * 0.15 ;
END;



--Desafio 6.3 (Integração SQL): Demonstre o poder da sua função utilizando-a diretamente dentro de um comando SELECT. Liste o nome, 
--o salário bruto e o imposto calculado (chamando a função CALCULA_IR) para todos os funcionários do departamento 60.

SELECT first_name, salary, CALCULA_IR(salary) AS imposto_retido 
FROM FUNCIONARIO
WHERE department_id = 60;