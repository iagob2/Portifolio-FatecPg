-- ============================================================================
-- EXERCÍCIO 02 - JUNÇÃO DE TABELAS (JOINs)
-- ============================================================================
-- Este exercício demonstra a criação de tabelas relacionadas e diferentes
-- formas de realizar junções (JOINs) entre elas para consultar dados.
--
-- ESTRUTURA DO BANCO:
--   CURSO (1) ───────── (N) FUNCIONARIO (1) ───────── (N) HOLLERITH
--
-- ============================================================================

-- ============================================================================
-- PARTE 1: CRIAÇÃO DAS TABELAS (DDL - Data Definition Language)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABELA: CURSO
-- Armazena os cursos disponíveis na instituição.
-- Relacionamento: Um curso pode ter VÁRIOS funcionários (1:N)
-- ----------------------------------------------------------------------------
CREATE TABLE CURSO (
    sg_curso VARCHAR(10) PRIMARY KEY, -- Sigla do Curso (Chave Primária)
    nm_curso VARCHAR(100) NOT NULL    -- Nome do Curso (Obrigatório)
);

-- ----------------------------------------------------------------------------
-- TABELA: FUNCIONARIO
-- Armazena os dados dos funcionários.
-- Relacionamento: 
--   - Cada funcionário pertence a UM curso (N:1 com CURSO)
--   - Um funcionário pode ter VÁRIOS hollerith (1:N com HOLLERITH)
-- ----------------------------------------------------------------------------
CREATE TABLE FUNCIONARIO (
    cd_funcionario INT PRIMARY KEY,       -- Código do Funcionário (PK)
    nm_funcionario VARCHAR(150) NOT NULL, -- Nome do Funcionário
    sg_curso VARCHAR(10),                 -- Sigla do Curso (FK para CURSO)
    
    -- Constraint de Chave Estrangeira com nome personalizado
    -- Isso facilita a identificação em mensagens de erro
    CONSTRAINT fk_funcionario_curso 
        FOREIGN KEY (sg_curso) 
        REFERENCES CURSO(sg_curso)
);

-- ----------------------------------------------------------------------------
-- TABELA: HOLLERITH (Folha de Pagamento)
-- Armazena o histórico de salários dos funcionários por data.
-- Relacionamento: Cada hollerith pertence a UM funcionário (N:1)
-- 
-- OBSERVAÇÃO IMPORTANTE:
--   A Chave Primária é COMPOSTA (dt_hollerith + cd_funcionario)
--   Isso permite que um funcionário tenha vários registros de salário
--   em datas diferentes, mas apenas um registro por data.
-- ----------------------------------------------------------------------------
CREATE TABLE HOLLERITH (
    dt_hollerith DATE,                    -- Data do Hollerith
    vl_salario DECIMAL(10, 2) NOT NULL,   -- Valor do Salário
    cd_funcionario INT,                   -- Código do Funcionário (FK)
    
    -- Chave Primária Composta: garante unicidade da combinação data + funcionário
    CONSTRAINT hollerith_pk 
        PRIMARY KEY(dt_hollerith, cd_funcionario), 

    -- Chave Estrangeira: vincula o hollerith ao funcionário
    CONSTRAINT fk_hollerith_funcionario
        FOREIGN KEY (cd_funcionario) 
        REFERENCES FUNCIONARIO(cd_funcionario)
);


-- ============================================================================
-- PARTE 2: INSERÇÃO DE DADOS (DML - Data Manipulation Language)
-- ============================================================================

-- Inserir Cursos (deve ser primeiro devido à integridade referencial)
INSERT INTO CURSO VALUES
('TADS', 'Tecnologia em Análise e Desenvolvimento de Sistemas'),
('ECON', 'Economia'),
('DIRE', 'Direito'),
('MKTG', 'Marketing Digital'),
('PSIC', 'Psicologia');

-- Inserir Funcionários (após CURSO, pois referencia sg_curso)
INSERT INTO FUNCIONARIO (CD_FUNCIONARIO, nm_funcionario, sg_curso) VALUES
(1001, 'Ana Silva', 'TADS'),
(1002, 'Bruno Mendes', 'TADS'),
(2003, 'Carla Oliveira', 'ECON'),
(3004, 'David Rocha', 'DIRE'),
(4005, 'Elisa Gomes', 'MKTG'),
(4006, 'Fábio Costa', 'MKTG'),
(5007, 'Gabriela Santos', 'PSIC'),
(5008, 'Henrique Lima', 'PSIC'),
(1009, 'Igor Ferreira', 'TADS'),
(2010, 'Júlia Pires', 'ECON');

-- Inserir Hollerith (após FUNCIONARIO, pois referencia cd_funcionario)
-- Nota: Nem todos os funcionários têm hollerith registrado
INSERT INTO HOLLERITH (dt_hollerith, vl_salario, cd_funcionario) VALUES
('2025-11-05', 8500.00, 1001),  -- Ana Silva - Nov/2025
('2025-11-05', 6200.50, 2003),  -- Carla Oliveira - Nov/2025
('2025-11-05', 9500.00, 3004),  -- David Rocha - Nov/2025
('2025-12-05', 8500.00, 1001),  -- Ana Silva - Dez/2025
('2025-12-05', 6200.50, 2003),  -- Carla Oliveira - Dez/2025
('2025-12-05', 4500.00, 4005),  -- Elisa Gomes - Dez/2025
('2026-01-05', 7200.00, 1002),  -- Bruno Mendes - Jan/2026
('2026-01-05', 5200.00, 5007),  -- Gabriela Santos - Jan/2026
('2026-01-05', 7200.00, 1009),  -- Igor Ferreira - Jan/2026
('2026-01-05', 5200.00, 5008);  -- Henrique Lima - Jan/2026


-- ============================================================================
-- PARTE 3: CONSULTAS DE VERIFICAÇÃO
-- ============================================================================

SELECT * FROM CURSO;
SELECT * FROM FUNCIONARIO;
SELECT * FROM HOLLERITH;


-- ============================================================================
-- PARTE 4: CONSULTAS COM JUNÇÃO DE TABELAS (JOINs)
-- ============================================================================

-- ============================================================================
-- EXERCÍCIO 1: Exibir nome do curso e nome dos funcionários
-- ============================================================================

-- ----------------------------------------------------------------------------
-- MÉTODO 1.0: Sintaxe Tradicional (WHERE)
-- ----------------------------------------------------------------------------
-- A junção é feita na cláusula WHERE igualando as chaves.
-- É a forma mais antiga de fazer JOIN, ainda funciona mas não é recomendada.
-- 
-- FUNCIONAMENTO:
--   1. O banco faz um produto cartesiano (todas combinações possíveis)
--   2. O WHERE filtra apenas as combinações onde as chaves são iguais
-- ----------------------------------------------------------------------------
SELECT 
    c.nm_curso, 
    f.nm_funcionario 
FROM 
    curso c, 
    FUNCIONARIO f 
WHERE 
    c.sg_curso = f.sg_curso;

-- ----------------------------------------------------------------------------
-- MÉTODO 1.1: ANSI SQL com JOIN ON
-- ----------------------------------------------------------------------------
-- Sintaxe moderna e recomendada (padrão ANSI SQL-92).
-- A condição de junção fica explícita após a palavra ON.
-- 
-- VANTAGENS:
--   - Separa claramente a lógica de junção (ON) dos filtros (WHERE)
--   - Mais legível e fácil de manter
--   - Suporta todos os tipos de JOIN (INNER, LEFT, RIGHT, FULL)
-- ----------------------------------------------------------------------------
SELECT 
    c.nm_curso, 
    f.nm_funcionario 
FROM 
    curso c 
JOIN 
    FUNCIONARIO f ON (f.sg_curso = c.sg_curso);

-- ----------------------------------------------------------------------------
-- MÉTODO 1.2: ANSI SQL com JOIN USING
-- ----------------------------------------------------------------------------
-- Usado quando a coluna de junção tem o MESMO NOME em ambas as tabelas.
-- Sintaxe mais limpa, pois não precisa qualificar a coluna com alias.
-- 
-- IMPORTANTE:
--   - A coluna especificada em USING deve existir com o mesmo nome
--     nas duas tabelas sendo unidas.
-- ----------------------------------------------------------------------------
SELECT 
    c.nm_curso, 
    f.nm_funcionario 
FROM 
    FUNCIONARIO f 
JOIN 
    CURSO c USING (sg_curso);

-- ----------------------------------------------------------------------------
-- MÉTODO 1.3: NATURAL JOIN
-- ----------------------------------------------------------------------------
-- O banco automaticamente identifica colunas com mesmo nome e faz a junção.
-- 
-- ⚠️ CUIDADO: 
--   - Use apenas quando houver UMA ÚNICA coluna em comum
--   - Se houver múltiplas colunas com mesmo nome, todas serão usadas na junção
--   - Pode gerar resultados inesperados se a estrutura das tabelas mudar
-- ----------------------------------------------------------------------------
SELECT 
    c.nm_curso, 
    f.nm_funcionario 
FROM 
    curso c 
NATURAL JOIN 
    FUNCIONARIO f;

-- P.S: Devemos usar o NATURAL JOIN apenas quando houver uma única relação
--      (uma coluna em comum) entre as tabelas.


-- ============================================================================
-- EXERCÍCIO 2: Exibir código, nome do funcionário e valor do salário
-- ============================================================================

-- Usando NATURAL JOIN pois FUNCIONARIO e HOLLERITH compartilham
-- apenas a coluna cd_funcionario
-- 
-- RESULTADO: Mostra apenas funcionários que têm hollerith registrado
--            (INNER JOIN implícito - exclui quem não tem correspondência)
SELECT 
    f.cd_funcionario, 
    f.nm_funcionario,
    h.vl_salario 
FROM 
    FUNCIONARIO f 
NATURAL JOIN 
    HOLLERITH h;


-- ============================================================================
-- EXERCÍCIO 3: Exibir cursos que NÃO têm funcionários
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Usando LEFT JOIN + WHERE IS NULL
-- ----------------------------------------------------------------------------
-- LEFT JOIN retorna TODOS os registros da tabela à esquerda (CURSO),
-- mesmo que não haja correspondência na tabela à direita (FUNCIONARIO).
-- 
-- FUNCIONAMENTO:
--   1. LEFT JOIN traz todos os cursos
--   2. Para cursos sem funcionários, as colunas de FUNCIONARIO ficam NULL
--   3. WHERE f.sg_curso IS NULL filtra apenas esses casos
-- 
-- DIAGRAMA:
--   ┌─────────────┐
--   │   CURSO     │     ┌─────────────┐
--   │  ┌───────┐  │     │ FUNCIONARIO │
--   │  │ AQUI  │  │     │             │
--   │  │ (sem  │  │     │             │
--   │  │ match)│  │     │             │
--   │  └───────┘  │     │             │
--   └─────────────┘     └─────────────┘
-- ----------------------------------------------------------------------------
SELECT
    c.nm_curso
FROM
    CURSO c
LEFT JOIN
    FUNCIONARIO f ON c.sg_curso = f.sg_curso
WHERE
    f.sg_curso IS NULL;

-- RESULTADO ESPERADO: Nenhum registro (todos os cursos têm funcionários)
-- Se houvesse um curso sem funcionários, ele apareceria aqui.


-- ============================================================================
-- RESUMO DOS TIPOS DE JOIN
-- ============================================================================
--
-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ TIPO DE JOIN        │ DESCRIÇÃO                                        │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ INNER JOIN (ou JOIN)│ Retorna apenas registros com correspondência     │
-- │                     │ em AMBAS as tabelas                              │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ LEFT JOIN           │ Retorna TODOS da tabela esquerda + matches       │
-- │ (LEFT OUTER JOIN)   │ da direita (NULL se não houver correspondência)  │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ RIGHT JOIN          │ Retorna TODOS da tabela direita + matches        │
-- │ (RIGHT OUTER JOIN)  │ da esquerda (NULL se não houver correspondência) │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ FULL JOIN           │ Retorna TODOS de ambas as tabelas                │
-- │ (FULL OUTER JOIN)   │ (NULL onde não houver correspondência)           │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ CROSS JOIN          │ Produto cartesiano (todas combinações possíveis) │
-- ├─────────────────────────────────────────────────────────────────────────┤
-- │ NATURAL JOIN        │ JOIN automático por colunas de mesmo nome        │
-- └─────────────────────────────────────────────────────────────────────────┘
--
-- ============================================================================
