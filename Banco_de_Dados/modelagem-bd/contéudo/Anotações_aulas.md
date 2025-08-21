# Modelos Lógicos de Dados

Um modelo lógico de dados descreve detalhadamente a estrutura das informações de um sistema, especificando entidades, atributos, relacionamentos e restrições, sem abordar aspectos físicos de armazenamento. Ele serve como referência para a implementação do banco de dados, facilitando o entendimento e o desenvolvimento do sistema.

Uma característica fundamental do modelo lógico é **evitar redundância**: cada dado ou atributo deve aparecer apenas uma vez. O modelo precisa ser claro, padronizado e compreensível para todos os envolvidos.

---

## Entidade

- Representa um objeto ou conceito do mundo real, com existência independente (instâncias ou tuplas).
- **Regras de nomeação:**
  - Letras maiúsculas
  - Apenas substantivos
  - Sem preposições ou conjunções
  - Nome no singular
  - Sem cedilha ou acento
  - Palavras compostas separadas por underline (`_`)

---

## Entidade Associativa

- Não existe isoladamente no MER; depende de duas ou mais entidades.

---

## Categoria

- Representa a relação entre superclasse (entidade principal) e subclasse.

---

## Tupla

- Conjunto ordenado de atributos (linha de uma tabela).

---

## Instância

- Registro de uma entidade em determinado momento.

---

## Atributo

- Propriedade ou característica de uma entidade, associada e armazenada no sistema.

---

## Relacionamento

- Associação entre entidades, representada por uma linha unindo os objetos.

---

## Dado

- Informação atômica sobre um objeto tratada pelo sistema.

---

## Tipos de Dados

- **Natural:** Descreve o objeto, independente do uso no sistema.  
  *Exemplo:* `nm_funcionario`, `dt_nascimento`
- **Derivado ou Calculado:** Obtido a partir de outros dados naturais.  
  *Exemplo:* `qt_idade_funcionario` (calculado a partir de `dt_nascimento_funcionario`)
- **Artificial:** Criado para identificação interna ao sistema.  
  *Exemplo:* `id_funcionario`

---

## Processo

- Sequência de atividades que manipulam e transformam dados, sem armazená-los.

---

## Fluxo de Dados

- Caminho percorrido pelos dados no sistema, transferindo informações entre processos.

---

## Mnemônicos

- Abreviações padronizadas para entidades ou atributos.

| Prefixo         | Significado                        |
|-----------------|-----------------------------------|
| nm_             | Nome do objeto                     |
| ds_             | Descrição                         |
| cd_             | Código (caractere)                 |
| dt_             | Data (dia, mês, ano)               |
| mm_ / aa_ / hr_ | Mês / Ano / Hora                   |
| dd_             | Dia (número ou dia da semana)      |
| ic_             | Indicador de conteúdo              |
| id_             | Identificador (chave primária)     |
| num_ / vl_ / qt_| Número / Valor / Quantidade        |

---

> **Dica:** Use sempre nomes claros, padronizados e sem ambiguidades para facilitar a manutenção e o entendimento do modelo de dados.

## Tipos de Atributos Identificadores

Atributos identificadores garantem a unicidade de cada ocorrência (tupla) em uma entidade:

- **Chave Primária:** Identifica de forma única cada registro.
- **Chave Secundária:** Facilita acesso, pesquisa ou classificação; geralmente índices.
- **Chave Candidata:** Atributos com valores únicos, aptos a serem chave primária.
- **Chave Alternativa:** Chaves candidatas não escolhidas como chave primária.
- **Superchave:** Qualquer conjunto de atributos que identifica exclusivamente uma tupla.
- **Chave Composta:** Combinação de dois ou mais atributos que garantem unicidade.

> **Observação:** A escolha adequada dos atributos identificadores é fundamental para a integridade e eficiência do modelo de dados.

### Resumo dos principais tipos

- **Chave primária:** Garante unicidade das ocorrências.
- **Chave secundária:** Facilita acesso e pesquisa; geralmente índices.
- **Chave candidata:** Conteúdos únicos, aptos a serem chave primária.
- **Chave alternativa:** Chaves candidatas não escolhidas.
- **Superchave:** Identifica exclusivamente cada tupla.
- **Chave composta:** Dois ou mais atributos que identificam uma tupla.

## Descrição do Fluxo de Dados

- **Processo:** Direciona o fluxo de dados.
- **Elementos de dados:** Atributos que circulam entre processos.

---

## Nomenclatura dos Elementos

Principais símbolos para atributos e suas características no fluxo de dados:

| Símbolo   | Significado                                                                 | Exemplo                                      |
|-----------|-----------------------------------------------------------------------------|----------------------------------------------|
| `+`       | Concatenação: união de elementos a partir do segundo                        | `nm_funcionario + dt_nascimento`             |
| `()`      | Opcional: atributo não obrigatório                                          | `nm_funcionario (nm_apelido)`                |
| `{}`      | Múltiplas ocorrências: atributo pode aparecer várias vezes                  | `{nm_dependente}`                            |
| `[/]`     | Ou: será preenchido um atributo ou outro                                    | `nm_funcionario [/] nm_empresa`              |
| `</>`     | E/ou: nenhum, um ou ambos atributos podem ser preenchidos                   | `nm_funcionario </> nm_apelido`              |
| `=`       | Dicionário: conjunto de elementos que compõem um dado                       | `endereco = nm_rua + num_residencia`         |
| `@`       | Indica atributo chave (identificador)                                       | `@id_funcionario`                            |

> **Observação:** Se o atributo chave não estiver no protótipo, não é necessário acrescentar o símbolo `@`.

---

**Dica:** Use nomes claros e padronizados para os elementos do fluxo de dados.

# O modelo conceitual

O modelo conceitual de dados é uma representação abstrata e de alto nível da estrutura de informações de um sistema. Ele descreve entidades, relacionamentos e regras de negócio sem se preocupar com detalhes técnicos ou de implementação, servindo como base para o desenvolvimento dos modelos lógico e físico. O objetivo principal é garantir que todos os requisitos do negócio estejam corretamente refletidos, facilitando a comunicação entre usuários, analistas e desenvolvedores.

No modelo conceitual, os relacionamentos entre entidades são definidos de forma bidirecional: cada relacionamento possui dois sentidos, ida e volta. O nome do relacionamento de ida deve ser expresso em voz ativa, enquanto o de volta deve ser em voz passiva, tornando a interpretação mais clara e precisa.

## Cardinalidade

Cardinalidade indica o número máximo de ocorrências de uma entidade que pode estar associada a outra em um relacionamento. Por exemplo, um departamento pode ter vários funcionários, mas cada funcionário pertence a apenas um departamento.

## Modalidade

Modalidade (ou participação mínima) define o número mínimo de ocorrências de uma entidade em um relacionamento. Por exemplo, um funcionário pode ou não estar associado a um projeto, indicando modalidade mínima zero.

## Combinações possíveis

| Mínimo      | Máximo      | Representação | Desenho   |
|-------------|-------------|--------------|-----------|
| 0 ou 1      | 1 ou vários | (1), 1, (n), n | O, I, II, ok, k |

---

## Diferenças entre modelos conceitual, lógico e físico

- **Modelo Conceitual:** Foca na estrutura e nas regras de negócio, sem detalhes técnicos. Utiliza diagramas como MER (Modelo Entidade-Relacionamento) para representar entidades, atributos e relacionamentos. É independente de qualquer tecnologia ou SGBD, facilitando o entendimento entre todas as partes envolvidas no projeto.
- **Modelo Lógico:** Traduz o modelo conceitual para uma estrutura mais detalhada, já considerando restrições de integridade, tipos de dados, relacionamentos e normalização. O modelo lógico é específico para um tipo de SGBD, mas ainda não aborda detalhes de implementação física, como índices ou partições.
- **Modelo Físico:** Define como os dados serão armazenados no SGBD escolhido, incluindo tabelas, índices, tipos de dados específicos, partições, métodos de acesso, performance e segurança. O modelo físico considera limitações e características do hardware e do software, sendo fundamental para a implementação eficiente do banco de dados.

#### Exemplo ilustrativo

![Exemplo de modelos de dados](https://raw.githubusercontent.com/microsoft/PowerPlatformConnectors/master/docs/images/data-models-example.png)

| Modelo           | Representação                                                                                      |
|------------------|---------------------------------------------------------------------------------------------------|
| Conceitual       | Diagrama MER: <br>**Entidade:** Funcionário <br>**Atributos:** Nome, Data de Nascimento           |
| Lógico           | Tabela: FUNCIONARIO <br>**Colunas:** NM_FUNCIONARIO (varchar), DT_NASCIMENTO (date)               |
| Físico           | SQL para criação: <br>`CREATE TABLE FUNCIONARIO (NM_FUNCIONARIO VARCHAR(100), DT_NASCIMENTO DATE);`|

### p.s. SGBD (Sistema de Gerenciamento de Banco de Dados)

- Software responsável por gerenciar, armazenar, recuperar e proteger os dados de um banco de dados.
- Exemplos: MySQL, PostgreSQL, Oracle, SQL Server, SQLite, MongoDB.
- Principais funções:
  - Controle de acesso: gerenciamento de usuários e permissões.
  - Integridade dos dados: aplicação de regras e restrições para garantir consistência.
  - Backup e recuperação: proteção contra perda de dados.
  - Concorrência: gerenciamento de múltiplos acessos simultâneos.
  - Segurança: proteção contra acessos não autorizados.
  - Otimização de consultas: uso de índices e planos de execução para melhorar a performance.
  - Suporte a transações: garantia de operações atômicas, consistentes, isoladas e duráveis (ACID).

## Linguagem de Modelagem

Utilizada para construir um modelo de dados, pode ser apresentada de forma **textual** ou **gráfica**. Um modelo de dados pode ser representado de várias formas, conhecidas como "esquema de banco de dados". O modelo deve respeitar o nível de conhecimento dos usuários que irá atender. Para o usuário final, o modelo não deve conter detalhes técnicos de implementação, que são necessários apenas para usuários mais avançados do sistema.

## Banco de Dados

Conjunto de registros (dados) organizados em tabelas, permitindo o armazenamento e a produção de informações. Um banco de dados normalmente agrupa registros com o mesmo objetivo e é mantido e acessado por meio de um software chamado **SGBD** (Sistema de Gerenciamento de Banco de Dados), que auxilia na administração das bases de dados.

## Modelo de Dados

Descrição dos tipos de informações que estão armazenadas em um banco de dados.

## Modelo Conceitual

Registra **que dados podem aparecer** no banco de dados, mas **não registra como esses dados estão armazenados** em nível de SGBD. A técnica mais difundida de modelagem conceitual é a abordagem **Entidade-Relacionamento (ER)**. Um modelo conceitual é representado através de um diagrama, chamado **Diagrama Entidade-Relacionamento (DER)**.

### Características:
- **Independente de tecnologia**
- **Focado no negócio**
- **Representação gráfica através do DER**

### Componentes principais:
- **Entidades**
- **Atributos** 
- **Relacionamentos**

> **Nota importante:** Toda chave primária é, necessariamente, uma superchave.

**Exemplo:**

## Modelo Lógico

É uma representação lógica das informações da área de negócios. **Não é um banco de dados**, é independente do modelo físico. Este é o conceito chave da modelagem de dados lógicos: ele deve ser **independente da tecnologia implementada**. Os componentes desse modelo devem estar intimamente ligados aos negócios, não à tecnologia.

### Características:
- **Ser completamente normalizado**
- **Conter descrição sucinta** das entidades, atributos e relacionamentos
- **Independente de SGBD específico**
- **Foco na estrutura lógica dos dados**

**Exemplo:**

## Modelo Físico

No modelo físico fazemos a **modelagem física** do modelo de banco de dados. Levam-se em conta as limitações impostas pelo SGBD escolhido e deve ser criado sempre com base nos exemplos de modelagem de dados produzidos no item anterior (modelo lógico).

### Características:
- **Dependente do SGBD escolhido**
- **Considera limitações técnicas**
- **Implementação real do banco**
- **Otimizações específicas da plataforma**

**Exemplo:**


# Relacionamentos 

## Relacionamento 1:1 (Um para Um)

Um relacionamento de um para um existe entre duas tabelas (entidades) quando um único registro da primeira tabela está relacionado a um único registro da segunda tabela e vice-versa. São bastante difíceis de serem caracterizados, pois qualquer mudança de interpretação ou versão pode fazer com que facilmente eles sejam questionados e até reconsiderados.

### Características:
- **Raridade:** Relacionamentos 1:1 são pouco comuns
- **Complexidade:** Difícil de manter e validar
- **Flexibilidade:** Podem ser questionados facilmente

### Implementação:
No relacionamento do tipo 1:1, quem determina qual é a entidade forte (pai) é o **administrador de dados**. Então a chave primária (Primary Key - PK) desta entidade é copiada para a entidade fraca (filho) como atributo estrangeiro (Foreign Key - FK).

**Exemplo:**
```
┌─────────────────┐         ┌─────────────────┐
│    FUNCIONÁRIO  │   1:1   │   DEPARTAMENTO  │
├─────────────────┤         ├─────────────────┤
│ • ID_FUNC (PK)  │◄────────│ • ID_DEPT (PK)  │
│ • Nome          │         │ • Nome          │
│ • Cargo         │         │ • Localização   │
│ • ID_DEPT (FK)  │         └─────────────────┘
└─────────────────┘
```

## Relacionamento 1:N (Um para Muitos)

Gera um atributo estrangeiro que é o elo de ligação entre duas instâncias. É sua existência que indica que há um relacionamento da instância de um objeto com outra instância de outro objeto, ou de maneira simples, indica que há um relacionamento entre dois objetos. O objeto dependente (filho) herda a chave do objeto de origem (pai) como atributo estrangeiro.

### Características:
- **Mais comum:** Relacionamento mais frequente
- **Navegação:** Criação do FK no objeto destino
- **Hierarquia:** Objeto pai → Objeto filho

### Implementação:
Chamamos de **navegação** no modelo de dados a criação do atributo estrangeiro (FK) no objeto destino, baseado na chave primária do objeto de origem.

> **Nota importante:** No relacionamento de 1:N, a entidade que está com "1" é o pai.

**Exemplo:**
```
┌─────────────────┐         ┌─────────────────┐
│    CLIENTE      │   1:N   │     PEDIDO      │
├─────────────────┤         ├─────────────────┤
│ • CPF (PK)      │◄────────│ • ID_PEDIDO (PK)│
│ • Nome          │         │ • Data          │
│ • Email         │         │ • Valor         │
│ • Telefone      │         │ • CPF_FK (FK)   │
└─────────────────┘         └─────────────────┘
```

## Relacionamento N:N (Muitos para Muitos)

Esta cardinalidade **não gera atributos ou chaves estrangeiras** diretamente, mas é necessário haver a navegação. É possível a resolução deste relacionamento. Este tipo de relacionamento **desaparece** e em seu lugar surge um **objeto de resolução**.

### Características:
- **Complexidade:** Requer tabela intermediária
- **Resolução:** Sempre precisa ser resolvido
- **Flexibilidade:** Permite múltiplas associações

### Processo de Resolução:

1. **Identificação:** O relacionamento N:N é identificado
2. **Criação da Tabela Intermediária:** Surge uma nova entidade
3. **Movimentação das Cardinalidades:** Os objetos-pai passam a ter cardinalidade mínima e máxima de 1
4. **Criação das Chaves Estrangeiras:** Na tabela intermediária

### Exemplo Prático: Alunos e Disciplinas

**Antes da Resolução (N:N):**
```
┌─────────────────┐    N:N   ┌─────────────────┐
│     ALUNO       │◄────────►│   DISCIPLINA    │
├─────────────────┤          ├─────────────────┤
│ • ID_ALUNO (PK) │          │ • ID_DISC (PK)  │
│ • Nome          │          │ • Nome          │
│ • Email         │          │ • Carga_Horária │
└─────────────────┘          └─────────────────┘
```

**Após a Resolução (1:N + N:1):**
```
┌─────────────────┐    1:N   ┌─────────────────┐   N:1   ┌─────────────────┐
│     ALUNO       │◄─────────│  MATRICULA      │────────►│   DISCIPLINA    │
├─────────────────┤          ├─────────────────┤         ├─────────────────┤
│ • ID_ALUNO (PK) │          │ • ID_MAT (PK)   │         │ • ID_DISC (PK)  │
│ • Nome          │          │ • ID_ALUNO (FK) │         │ • Nome          │
│ • Email         │          │ • ID_DISC (FK)  │         │ • Carga_Horária │
└─────────────────┘          │ • Data_Mat      │         └─────────────────┘
                             │ • Nota          │
                             └─────────────────┘
```

### Outro Exemplo: Produtos e Fornecedores

**Tabela Intermediária: FORNECIMENTO**
```
┌─────────────────┐    1:N   ┌─────────────────┐   N:1   ┌─────────────────┐
│   FORNECEDOR    │◄─────────│  FORNECIMENTO   │────────►│    PRODUTO      │
├─────────────────┤          ├─────────────────┤         ├─────────────────┤
│ • ID_FORN (PK)  │          │ • ID_FORN (FK)  │         │ • ID_PROD (PK)  │
│ • Nome          │          │ • ID_PROD (FK)  │         │ • Nome          │
│ • CNPJ          │          │ • Preço         │         │ • Descrição     │
│ • Telefone      │          │ • Data_Contrato │         │ • Categoria     │
└─────────────────┘          └─────────────────┘         └─────────────────┘
```

### Vantagens da Resolução N:N:

1. **Flexibilidade:** Permite múltiplas associações
2. **Dados Adicionais:** Pode armazenar informações do relacionamento
3. **Normalização:** Mantém a integridade dos dados
4. **Consultas Eficientes:** Facilita operações de busca

### Regras Importantes:

- ✅ **Sempre resolver** relacionamentos N:N
- ✅ **Criar tabela intermediária** com FK para ambas as entidades
- ✅ **Considerar dados adicionais** do relacionamento
- ✅ **Manter integridade referencial**


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