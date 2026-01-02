# Banco de Dados Relacional - Documentação Completa

Este diretório contém todo o material desenvolvido durante o estudo de **Banco de Dados Relacional**, incluindo exercícios de pesquisa pessoal e atividades sugeridas pelo professor.

---

## 📁 Estrutura do Diretório

```
bd-relacional/
├── exercicios/          # Exercícios desenvolvidos através de pesquisa pessoal
├── Atividades/          # Atividades sugeridas pelo professor
├── contéudo/            # Material de apoio (PDFs das aulas)
└── README.md            # Este arquivo
```

---

## 📚 Conteúdo das Pastas

### 📖 `/contéudo` - Material de Apoio

Esta pasta contém os PDFs das aulas ministradas pelo professor, servindo como material de referência e estudo:

- **BDRAula00ProblemasLiveSQL.pdf** - Problemas e exercícios práticos no LiveSQL
- **BDRAula01Funcoes.pdf** - Funções SQL (agregação, conversão, formatação)
- **BDRAula02JuncaoTabelas.pdf** - Junção de tabelas (JOINs)
- **BDR-Aula02JuncaoTabelasExtra.pdf** - Material complementar sobre JOINs
- **BDRAula03SubConsultas.pdf** - Subconsultas SQL
- **BDRAula08VisaoSinonimoSequenciaIndice.pdf** - Objetos do banco de dados
- **BDRAula09GruposUsuariosPrivilegios.pdf** - Segurança e permissões
- **BDRAula10PLSQLBlocosAnonimos.pdf** - PL/SQL básico
- **BDRAula11PLSQLProceduresFunctions.pdf** - Procedures e Functions em PL/SQL

---

## 🎯 `/Atividades` - Atividades do Professor

Esta seção contém as atividades práticas sugeridas pelo professor, organizadas por número de atividade.

### **Atividade 01 - Modelagem Lógica**

**Arquivo:** `atividade01.md`

**Descrição:** Exercício de modelagem de dados para um sistema de controle de Ordens de Serviço (OS), gerenciamento de Clientes e consumo de Materiais.

**Conceitos Praticados:**
- Modelagem Lógica de Dados (MER/DER)
- Relacionamentos entre entidades
- Resolução de relacionamento Muitos-para-Muitos através de tabela associativa

**Estrutura do Modelo:**
- **CLIENTE:** Armazena dados de quem solicita o serviço (CPF/CNPJ, Endereço, Telefone)
- **ORDEM_SERVICO:** Registra a solicitação, data/hora e vincula ao cliente
- **MATERIA (Estoque):** Cadastro dos tipos de materiais disponíveis
- **SERVICO_MATERIA:** Tabela de ligação que registra quantidade e preço de materiais utilizados

**Ferramentas Utilizadas:**
- Figma (para criação do diagrama)

**Diagrama:** Disponível em `imagens_diagmas/bd_01.png`

---

### **Atividade 02 - DDL (Data Definition Language)**

**Arquivo:** `atividade02.sql`

**Descrição:** Criação de tabelas e prática com comandos DDL, incluindo criação de constraints, alterações de estrutura e manipulação de colunas.

**Conceitos Praticados:**
- Criação de tabelas (`CREATE TABLE`)
- Definição de chaves primárias (simples e compostas)
- Definição de chaves estrangeiras (`FOREIGN KEY`)
- Modificação de estrutura (`ALTER TABLE`)
  - Adicionar colunas (`ADD`)
  - Modificar colunas (`MODIFY`)
  - Renomear colunas (`RENAME COLUMN`)
- Constraints:
  - `CHECK` - Validação de valores permitidos
  - `UNIQUE` - Garantia de unicidade
  - `PRIMARY KEY` - Chave primária
  - `FOREIGN KEY` - Integridade referencial
- Visualização de estrutura (`DESC`)

**Estrutura Criada:**
- **PRODUTO:** Armazena informações dos produtos (código, nome, valor, quantidade)
- **CLIENTE:** Armazena dados dos clientes (código, nome, telefone, data cadastro, email, tipo)
- **COMPRA:** Registra compras realizadas (chave primária composta: data + cliente)
- **ITEM_COMPRA:** Tabela associativa N:N entre COMPRA e PRODUTO (chave primária composta de 3 colunas)

**Diagrama:** Disponível em `imagens_diagmas/atividade02.md` (formato ASCII)

---

### **Atividade 03 - DML (Data Manipulation Language) Básico**

**Arquivo:** `atividade03.sql`

**Descrição:** Introdução aos comandos DML, focando em inserção de dados e controle de transações.

**Conceitos Praticados:**
- Criação de tabela simples (`CREATE TABLE`)
- Inserção de dados:
  - **Inserção Implícita:** Valores para todas as colunas na ordem definida
  - **Inserção Explícita:** Especificação das colunas que receberão valores
  - **Inserção com Variáveis de Substituição:** Uso de `&` para entrada interativa
- Controle de transações (`COMMIT`)
- Consulta de dados (`SELECT`)
- Reexecução de comandos (`/`)

**Estrutura Criada:**
- **MEDICO:** Tabela simples com código CRM (chave primária) e nome do médico

---

### **Atividade 04 - Funções SQL e Agregação**

**Arquivo:** `atividade04.SQL`

**Descrição:** Exercícios práticos sobre funções SQL, formatação de dados, manipulação de strings, datas e funções de agregação.

**Conceitos Praticados:**

**1. Funções de Formatação e Cálculo:**
- Cálculo de aumentos percentuais
- Formatação de valores monetários (`LPAD`, `TO_CHAR`)
- Manipulação de strings (`INITCAP`, `LENGTH`)
- Operador de concatenação (`||`)

**2. Funções de Data:**
- `MONTHS_BETWEEN` - Cálculo de diferença em meses
- `ADD_MONTHS` - Adição de meses a uma data
- `TO_CHAR` com formatação de datas
- `ROUND` - Arredondamento de valores

**3. Funções de Agregação:**
- `MAX`, `MIN`, `SUM`, `AVG` - Estatísticas básicas
- `COUNT` - Contagem de registros
- `GROUP BY` - Agrupamento de resultados
- `CEIL`, `ROUND` - Arredondamento de médias

**4. Funções Condicionais:**
- `CASE WHEN` - Estruturas condicionais
- Tratamento de valores `NULL`

**5. Ordenação:**
- `ORDER BY` - Ordenação de resultados
- Ordenação por dia da semana usando formatação de data

**Exercícios Resolvidos:**
1. Cálculo de novo salário com aumento de 15%
2. Cálculo da diferença entre salários antigo e novo
3. Formatação de sobrenomes (primeira letra maiúscula) e filtro por inicial
4. Cálculo de meses de contratação
5. Formatação de datas em português
6. Concatenação de strings para relatório salarial
7. Formatação de salário com símbolo de moeda
8. Exibição do dia da semana de admissão
9. Tratamento de comissões nulas
10. Estatísticas globais de salários
11. Estatísticas de salários por cargo
12. Contagem de pessoas por cargo
13. Contagem de gerentes
14. Cálculo da diferença entre maior e menor salário

**Tabela Utilizada:**
- **FUNCIONARIO:** Criada a partir de `HR.EMPLOYEES` (schema padrão do Oracle)

---

### **Atividade 05 - Junção de Tabelas (JOINs)**

**Arquivo:** `atividade05.sql`

**Descrição:** Exercício completo sobre diferentes formas de realizar junções entre tabelas, comparando sintaxe tradicional (proprietária) com sintaxe ANSI SQL-99.

**Conceitos Praticados:**

**1. Criação de Estrutura Relacional:**
- Tabela **CURSO:** Armazena cursos (sigla e nome)
- Tabela **FUNCIONARIO:** Armazena funcionários vinculados a cursos
- Tabela **HOLLERITH:** Armazena histórico de salários por funcionário e data (chave primária composta)

**2. Sintaxe Tradicional (WHERE):**
- Junção através de condições na cláusula `WHERE`
- Produto cartesiano filtrado por igualdade de chaves

**3. Sintaxe ANSI SQL-99:**
- **JOIN ON:** Junção explícita com condição personalizada
- **JOIN USING:** Junção quando colunas têm mesmo nome
- **NATURAL JOIN:** Junção automática por colunas de mesmo nome

**4. Tipos de JOIN:**
- **INNER JOIN:** Apenas registros com correspondência
- **LEFT JOIN:** Todos da tabela esquerda + correspondências
- **RIGHT JOIN:** Todos da tabela direita + correspondências
- **FULL JOIN:** Todos de ambas as tabelas
- **CROSS JOIN:** Produto cartesiano

**5. Consultas Especiais:**
- Identificação de cursos sem funcionários (usando `LEFT JOIN` + `WHERE IS NULL`)

**Exercícios Resolvidos:**
1. Exibir nome do curso e nome dos funcionários (4 métodos diferentes)
2. Exibir código, nome do funcionário e valor do salário
3. Exibir cursos que não têm funcionários

**Diagrama:** Disponível em `imagens_diagmas/atividade05_JUNCAO_TABELAS.png`

---

## 🔍 `/exercicios` - Exercícios de Pesquisa Pessoal

Esta seção contém exercícios desenvolvidos através de pesquisa e estudo autônomo, aprofundando conceitos aprendidos em aula.

### **1. SQL_Joins_Proprietary_vs_ANSI99.sql**

**Descrição:** Comparação detalhada entre a sintaxe proprietária do Oracle e a sintaxe padrão ANSI SQL-99 para junção de tabelas.

**Conceitos Abordados:**

**Sintaxe Proprietária (Oracle):**
- **EQUIJOIN:** Junção por igualdade de chaves na cláusula `WHERE`
- **NOEQUIJOIN:** Junção por intervalo de valores (`BETWEEN`)
- **OUTERJOIN:** Uso do operador `(+)` para junções externas
- **SELFJOIN:** Junção de uma tabela com ela mesma (hierarquias)

**Sintaxe ANSI SQL-99:**
- **NATURAL JOIN:** Junção automática por colunas de mesmo nome
- **JOIN USING:** Especificação explícita de coluna comum
- **JOIN ON:** Condição de junção explícita e personalizada
- **LEFT OUTER JOIN:** Todos da esquerda + correspondências
- **RIGHT OUTER JOIN:** Todos da direita + correspondências
- **FULL OUTER JOIN:** União completa de ambas as tabelas
- **CROSS JOIN:** Produto cartesiano explícito

**Exercícios Práticos:**
1. Listar funcionários e seus departamentos (EQUIJOIN)
2. Listar funcionários e níveis salariais (NOEQUIJOIN)
3. Listar todos os departamentos, incluindo sem funcionários (OUTERJOIN)
4. Listar funcionários e seus gerentes (SELFJOIN)
5. NATURAL JOIN entre funcionários e cargos
6. JOIN USING entre funcionários e departamentos
7. JOIN ON explícito (funcionários → departamentos → localizações)
8. LEFT OUTER JOIN (funcionários sem departamento)
9. RIGHT OUTER JOIN (departamentos sem funcionários)
10. FULL OUTER JOIN (todos os registros)
11. CROSS JOIN (combinação de cargos e regiões)

**Tabelas Utilizadas:**
- `HR.EMPLOYEES` - Funcionários
- `HR.DEPARTMENTS` - Departamentos
- `HR.JOBS` - Cargos
- `HR.LOCATIONS` - Localizações
- `HR.REGIONS` - Regiões

---

### **2. Subconsultas_SQL_(Oracle Schema).sql**

**Descrição:** Exercícios completos sobre subconsultas SQL, desde subconsultas escalares até subconsultas correlacionadas e emparelhadas.

**Conceitos Abordados:**

**1. Subconsultas Escalares:**
- Retornam uma única linha e uma única coluna
- Usadas em comparações diretas (`=`, `>`, `<`, etc.)
- Exemplos: encontrar salário igual ao de um funcionário específico

**2. Subconsultas com Múltiplas Linhas:**
- **IN:** Verifica se o valor está em uma lista
- **ANY:** Comparação com qualquer valor da subconsulta
- **ALL:** Comparação com todos os valores da subconsulta

**3. Subconsultas Emparelhadas vs. Não Emparelhadas:**
- **Não Emparelhada:** Compara uma única coluna por vez
- **Emparelhada:** Compara múltiplas colunas simultaneamente

**4. Subconsultas Correlacionadas:**
- A subconsulta referencia colunas da consulta externa
- Executada uma vez para cada linha da consulta externa
- Útil para comparações complexas e filtros condicionais

**5. Subconsultas na Cláusula FROM:**
- Subconsultas como tabelas derivadas (inline views)
- Úteis para cálculos intermediários e simplificação de consultas complexas

**6. Operadores EXISTS e NOT EXISTS:**
- Verificação de existência de registros
- Mais eficiente que `IN` em alguns casos

**Exercícios Práticos:**
1. Subconsulta escalar: salário igual ao funcionário ID 145
2. Subconsulta escalar: departamento com maior manager_id
3. Subconsulta com IN: funcionários em Seattle (múltiplas tabelas)
4. Subconsulta com ANY: salários maiores que qualquer min_salary
5. Subconsulta com ALL: salários maiores que todos os max_salary
6. Subconsulta não emparelhada: mesmo job_id e department_id que funcionário 201
7. Subconsulta emparelhada: mesma combinação job_id + department_id
8. Subconsulta correlacionada: funcionários com salário maior que a média do departamento
9. Subconsulta na FROM: cálculo de médias por departamento
10. EXISTS: verificação de existência de registros relacionados

**Tabelas Utilizadas:**
- `HR.EMPLOYEES` - Funcionários
- `HR.DEPARTMENTS` - Departamentos
- `HR.JOBS` - Cargos
- `HR.LOCATIONS` - Localizações

---

### **3. Oracle_Database_Objects_and_PLSQL_Mastery.sql**

**Descrição:** Exercícios avançados sobre objetos do banco de dados Oracle e programação PL/SQL, incluindo sequences, views, sinônimos, índices e blocos anônimos.

**Conceitos Abordados:**

**1. SEQUENCES (Sequências):**
- Automação de geração de IDs
- Configuração de valores iniciais, incrementos e limites
- Uso de `NEXTVAL` e `CURRVAL`
- Configuração de cache (`NOCACHE`)

**2. VIEWS (Visões):**
- Criação de visões simples para filtros permanentes
- Visões analíticas com agregações
- Visões de segurança (`WITH READ ONLY`)
- Técnica TOP-N para rankings
- `CREATE OR REPLACE VIEW` para atualização

**3. SINÔNIMOS:**
- Criação de apelidos para tabelas
- Facilitação de escrita de queries
- Sinônimos públicos e privados

**4. ÍNDICES:**
- Criação de índices para otimização de consultas
- Índices em colunas frequentemente usadas em `WHERE`
- Verificação de índices criados
- Remoção de índices (`DROP INDEX`)

**5. PL/SQL Básico:**
- **Blocos Anônimos:** Estrutura básica de programação
- **Variáveis:** Declaração e atribuição
- **Estruturas Condicionais:** `IF-THEN-ELSE`
- **Loops:** `FOR`, `WHILE`
- **Cursors:** Manipulação de conjuntos de dados
- **Tratamento de Exceções:** `EXCEPTION WHEN`

**Exercícios Práticos:**

**Bloco 1 - Sequences:**
1. Criação de sequência `MEU_ID_SEQ` (início: 1000, incremento: 10, máximo: 1050)
2. Inserção de funcionário usando sequência
3. Verificação do último valor gerado (`CURRVAL`)

**Bloco 2 - Views:**
1. Visão de salários altos (`V_SALARIOS_ALTO`)
2. Visão analítica de média por departamento (`V_MEDIA_DEPARTAMENTO`)
3. Visão de segurança somente leitura (`V_SEGURA`)
4. Visão TOP-5 maiores salários

**Bloco 3 - Performance:**
1. Criação de sinônimo `EMP` para `HR.EMPLOYEES`
2. Criação de índice em `DEPARTMENT_ID`

**Bloco 4 - PL/SQL:**
1. Bloco anônimo para captura de dados (nome e salário)
2. Estruturas condicionais para classificação de salários
3. Loops para processamento de múltiplos registros
4. Cursors para iteração sobre resultados
5. Tratamento de exceções

**Tabelas Utilizadas:**
- `HR.EMPLOYEES` - Funcionários
- `HR.DEPARTMENTS` - Departamentos
- `HR.JOBS` - Cargos

---

## 🎓 Resumo dos Conceitos Aprendidos

### **DDL (Data Definition Language)**
- ✅ Criação de tabelas (`CREATE TABLE`)
- ✅ Modificação de estrutura (`ALTER TABLE`)
- ✅ Constraints (PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE)
- ✅ Chaves primárias simples e compostas
- ✅ Integridade referencial

### **DML (Data Manipulation Language)**
- ✅ Inserção de dados (`INSERT`)
- ✅ Consulta de dados (`SELECT`)
- ✅ Atualização de dados (`UPDATE`)
- ✅ Exclusão de dados (`DELETE`)
- ✅ Controle de transações (`COMMIT`, `ROLLBACK`)

### **Funções SQL**
- ✅ Funções de agregação (`MAX`, `MIN`, `SUM`, `AVG`, `COUNT`)
- ✅ Funções de string (`INITCAP`, `LENGTH`, `LPAD`, concatenação)
- ✅ Funções de data (`MONTHS_BETWEEN`, `ADD_MONTHS`, `TO_CHAR`)
- ✅ Funções numéricas (`ROUND`, `CEIL`, `TRUNC`)
- ✅ Funções condicionais (`CASE WHEN`, `NVL`, `COALESCE`)

### **Junção de Tabelas**
- ✅ Sintaxe tradicional (WHERE)
- ✅ Sintaxe ANSI SQL-99 (JOIN ON, JOIN USING, NATURAL JOIN)
- ✅ Tipos de JOIN (INNER, LEFT, RIGHT, FULL, CROSS)
- ✅ OUTER JOIN com operador `(+)`
- ✅ SELF JOIN para hierarquias

### **Subconsultas**
- ✅ Subconsultas escalares
- ✅ Subconsultas com múltiplas linhas (IN, ANY, ALL)
- ✅ Subconsultas emparelhadas e não emparelhadas
- ✅ Subconsultas correlacionadas
- ✅ EXISTS e NOT EXISTS

### **Objetos do Banco de Dados**
- ✅ Sequences (sequências)
- ✅ Views (visões)
- ✅ Sinônimos
- ✅ Índices

### **PL/SQL**
- ✅ Blocos anônimos
- ✅ Variáveis e tipos de dados
- ✅ Estruturas condicionais
- ✅ Loops
- ✅ Cursors
- ✅ Tratamento de exceções

### **Modelagem de Dados**
- ✅ Modelagem lógica (MER/DER)
- ✅ Relacionamentos (1:1, 1:N, N:N)
- ✅ Tabelas associativas
- ✅ Normalização

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

- **SGBD:** Oracle Database
- **Ambiente de Desenvolvimento:** LiveSQL (Oracle)
- **Linguagem:** SQL, PL/SQL
- **Modelagem:** Figma (para diagramas)
- **Versionamento:** Git

---

## 📝 Observações Importantes

1. **Schema HR:** A maioria dos exercícios utiliza o schema `HR` padrão do Oracle, que contém tabelas de exemplo (EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, etc.).

2. **Compatibilidade:** Os scripts foram desenvolvidos e testados no ambiente Oracle Database. Algumas sintaxes podem não ser compatíveis com outros SGBDs (MySQL, PostgreSQL, SQL Server).

3. **Nomenclatura:** Os arquivos seguem uma convenção de nomenclatura que identifica o tipo de conteúdo:
   - `atividade##.sql` - Atividades do professor
   - `SQL_*.sql` - Exercícios de pesquisa sobre SQL
   - `Oracle_*.sql` - Exercícios específicos do Oracle

4. **Diagramas:** Os diagramas estão armazenados na pasta `imagens_diagmas/` dentro de `Atividades/`.

---

## 🚀 Como Utilizar Este Material

1. **Para Estudar:** Leia os arquivos na ordem sugerida (atividades 01-05, depois exercícios).
2. **Para Praticar:** Execute os scripts no LiveSQL ou em um ambiente Oracle Database.
3. **Para Referência:** Use os PDFs da pasta `contéudo/` como material de apoio.
4. **Para Revisão:** Consulte os diagramas e comentários nos arquivos SQL.

---

## 📚 Referências

- Material de aula fornecido pelo professor (PDFs em `/contéudo`)
- Documentação oficial do Oracle Database
- LiveSQL (Oracle) - Ambiente de prática online
- Pesquisas e tutoriais sobre SQL e PL/SQL

---

*Este material foi desenvolvido como parte do portfólio acadêmico da disciplina de Banco de Dados Relacional.*

