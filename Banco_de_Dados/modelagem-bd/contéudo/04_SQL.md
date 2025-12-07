# Linguagem de Consulta Estruturada

## SQL (Structured Query Language)

Estabeleceu-se como a **linguagem padrão** de banco de dados relacional, sendo utilizada para gerenciar e manipular dados em sistemas de banco de dados relacionais.

## Categorias da Linguagem SQL

### 1. **DDL - Data Definition Language (Linguagem de Definição de Dados)**

Fornece comandos para **definir esquemas de relações**, excluir relações e modificar esquemas de banco de dados.

#### Comandos DDL:

| Comando | Função | Exemplo |
|---------|--------|---------|
| **CREATE** | Criar objetos (banco, tabela, índice) | `CREATE TABLE usuarios (id INT, nome VARCHAR(50));` |
| **ALTER** | Alterar estrutura de objetos existentes | `ALTER TABLE usuarios ADD COLUMN email VARCHAR(100);` |
| **DROP** | Remover permanentemente objetos do sistema | `DROP TABLE usuarios;` |
| **RENAME** | Modificar nome de tabelas | `RENAME TABLE usuarios TO clientes;` |
| **TRUNCATE** | Remover todos os registros mantendo a estrutura | `TRUNCATE TABLE usuarios;` |
| **COMMENT** | Adicionar anotações a objetos do banco | `COMMENT ON TABLE usuarios IS 'Tabela de usuários do sistema';` |
| **FLASHBACK** | Retornar o banco a um estado anterior | `FLASHBACK TABLE usuarios TO TIMESTAMP...` |

### 2. **DML - Data Manipulation Language (Linguagem de Manipulação de Dados)**

Possui consultas baseadas na **álgebra relacional** e no **cálculo relacional de tuplas**. Possui comandos de inserção, exclusão e modificação das tuplas do banco de dados.

#### Comandos DML:

| Comando | Função | Exemplo |
|---------|--------|---------|
| **INSERT** | Inserir dados em tabelas | `INSERT INTO usuarios (nome, email) VALUES ('João', 'joao@email.com');` |
| **UPDATE** | Atualizar dados existentes | `UPDATE usuarios SET email = 'novo@email.com' WHERE id = 1;` |
| **DELETE** | Deletar registros específicos | `DELETE FROM usuarios WHERE id = 1;` |
| **MERGE** | Operação combinada (INSERT/UPDATE/DELETE) | `MERGE INTO usuarios u USING novos_usuarios n ON u.id = n.id...` |

### 3. **DQL - Data Query Language (Linguagem de Consulta de Dados)**

Permite a **recuperação de informações** do banco de dados através de consultas.

#### Comando DQL:

| Comando | Função | Exemplo |
|---------|--------|---------|
| **SELECT** | Selecionar e recuperar dados | `SELECT nome, email FROM usuarios WHERE ativo = 1;` |

### 4. **DCL - Data Control Language (Linguagem de Controle de Dados)**

Concede ou revoga **direitos de acesso** ao banco de dados e às estruturas contidas nele.

#### Comandos DCL:

| Comando | Função | Exemplo |
|---------|--------|---------|
| **GRANT** | Conceder privilégios de acesso | `GRANT SELECT, INSERT ON usuarios TO usuario_app;` |
| **REVOKE** | Remover permissões previamente concedidas | `REVOKE DELETE ON usuarios FROM usuario_app;` |

### 5. **TCL - Transaction Control Language (Linguagem de Controle de Transação)**

Especifica início e fim das transações, gerenciando as alterações feitas por instruções DML que podem ser agrupadas em **transações lógicas**.

#### Comandos TCL:

| Comando | Função | Exemplo |
|---------|--------|---------|
| **COMMIT** | Confirmar e tornar permanentes as alterações | `COMMIT;` |
| **ROLLBACK** | Desfazer alterações e restaurar estado anterior | `ROLLBACK;` |
| **SAVEPOINT** | Definir ponto de retorno dentro da transação | `SAVEPOINT ponto1;` |

## Exemplo Prático de Transação

```sql
-- Início da transação
BEGIN TRANSACTION;

-- Criar savepoint
SAVEPOINT inicio_operacao;

-- Operações DML
INSERT INTO usuarios (nome, email) VALUES ('Maria', 'maria@email.com');
UPDATE usuarios SET ativo = 1 WHERE nome = 'João';

-- Verificar se tudo está correto
SELECT * FROM usuarios WHERE nome IN ('Maria', 'João');

-- Se tudo estiver OK, confirmar
COMMIT;

-- Se houver erro, desfazer até o savepoint
-- ROLLBACK TO SAVEPOINT inicio_operacao;
```

## Características Importantes

### ✅ **Propriedades ACID das Transações:**
- **Atomicidade:** Toda transação é indivisível
- **Consistência:** Mantém integridade dos dados
- **Isolamento:** Transações não interferem entre si
- **Durabilidade:** Alterações confirmadas são permanentes

### 🔧 **Vantagens do SQL:**
- **Padrão universal** para bancos relacionais
- **Facilidade de aprendizado**
- **Portabilidade** entre diferentes SGBDs
- **Flexibilidade** para consultas complexas      

---

## Tipos de Dados

- **CHAR:** alfanumérico de tamanho fixo 255 max 
- **VARCHAR:** alfanumérico. O que não foi utilizado não ocupa espaço no banco de dados 2000 max 
- **NUMBER( ):** Numérico. Utilizado com casas decimais, primeiro o número total de dígitos (incluindo as casas decimais) 38
- **LONG:** alfanumérico. Tamanho não precisa ser informado, só pode existir um por tabela e não pode ser utilizado em consultas 26
- **RAW:** armazena valores hexadecimais com tamanho variável 2k (armazena imagens)
- **LONG RAW:** armazena valores hexadecimais com tamanhos variáveis. 2G (armazena imagens)
- **DATE:** serão armazenados com século, ano, mês, dia, hora, minuto e segundo 
- **TIMESTAMP:** armazena data, hora, minuto, segundo
- **BLOB:** dados binários (1,0)
- **BFILE:** dados binários armazenados em um arquivo externo 
- **ROWID:** um sistema numérico de base 64 que representa o endereço exclusivo de uma linha na tabela correspondente
- **INTERVAL YEAR TO MONTH:** armazena um período usando os campos de data/hora year e month 
- **INTERVAL DAY TO SECOND:** armazena um período em termos de dias, horas, minutos e segundos
- **INTEGER:** Números inteiros, não aceita limitação de tamanho do campo 38 dígitos 

---

## Observações Importantes

- **CREATE TABLE:** para criar uma tabela no banco 

- **CONSTRAINTS:** restrições são regras para o preenchimento de uma ou mais colunas da tabela e são definidas ao final da especificação de cada coluna ou no final do comando. Toda restrição possui um nome que pode ser definido pelo usuário por meio da opção constraint, caso contrário receberá um nome padronizado 

- **DEFAULT:** informar um valor padrão, mesmo quando não for fornecido pelo usuário 

- **CHECK:** define um conjunto de valores permitidos ou condição para inserção de valores em uma determinada coluna 

- **NOT NULL:** indica que é obrigatória a inserção de algum valor

- **Informações sobre restrições:** as informações das restrições ficam armazenadas em uma tabela de controle, atualizada automaticamente. Esta tabela é chamada de User_constraints

