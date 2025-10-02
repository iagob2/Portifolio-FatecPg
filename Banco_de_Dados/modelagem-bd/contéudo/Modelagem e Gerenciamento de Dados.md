# Modelagem e Gerenciamento de Dados (Completo)

## 1. Modelos Lógicos de Dados (MLD)

Um modelo lógico de dados descreve detalhadamente a **estrutura das informações** de um sistema, especificando entidades, atributos, relacionamentos e restrições, **sem abordar aspectos físicos** de armazenamento. Ele serve como referência para a implementação do banco de dados.

**Característica Fundamental:** O modelo lógico deve **evitar redundância**. Cada dado ou atributo deve aparecer apenas uma vez.

### 1.1. Componentes Essenciais

| Componente | Definição Detalhada |
| :--- | :--- |
| **Entidade** | Representa um objeto ou conceito do mundo real, com existência independente (instâncias ou tuplas). |
| **Entidade Associativa** | Não existe isoladamente no MER; depende de duas ou mais entidades (resolve N:N). |
| **Categoria** | Representa a relação entre superclasse (entidade principal) e subclasse. |
| **Tupla** | Conjunto ordenado de atributos (**linha de uma tabela** ou registro). |
| **Instância** | Registro de uma entidade em determinado momento. |
| **Atributo** | Propriedade ou característica de uma entidade, associada e armazenada no sistema. |
| **Dado** | Informação atômica sobre um objeto tratada pelo sistema. |
| **Processo** | Sequência de atividades que manipulam e transformam dados, **sem armazená-los**. |
| **Fluxo de Dados** | Caminho percorrido pelos dados no sistema, transferindo informações entre processos. |

### 1.2. Tipos de Dados

* **Natural:** Descreve o objeto, independente do uso no sistema. (*Exemplo: `nm_funcionario`*)
* **Derivado ou Calculado:** Obtido a partir de outros dados naturais. (*Exemplo: `qt_idade_funcionario`*)
* **Artificial:** Criado para **identificação interna** ao sistema. (*Exemplo: `id_funcionario`*)

### 1.3. Regras de Nomeação de Entidades

* Letras **maiúsculas**.
* Apenas **substantivos**.
* Nome no **singular**.
* Sem preposições, conjunções, cedilha ou acento.
* Palavras compostas separadas por **underline** (`_`).

### 1.4. Mnemônicos (Prefixo de Atributos)

| Prefixo | Significado |
| :--- | :--- |
| **id_** | **Identificador (Chave Primária)** |
| **nm_** | Nome do objeto |
| **ds_** | Descrição |
| **dt_** | Data (dia, mês, ano) |
| **cd_** | Código (caractere) |
| **vl_ / qt_** | Valor / Quantidade |

### 1.5. Nomenclatura dos Elementos no Fluxo de Dados

| Símbolo | Significado | Exemplo |
| :--- | :--- | :--- |
| `+` | **Concatenação** (união de elementos). | `nm_funcionario + dt_nascimento` |
| `()` | **Opcional** (atributo não obrigatório). | `nm_funcionario (nm_apelido)` |
| `{}` | **Múltiplas ocorrências** (atributo pode aparecer várias vezes). | `{nm_dependente}` |
| `[/]` | **Ou** (será preenchido um atributo ou outro). | `nm_funcionario [/] nm_empresa` |
| `</>` | **E/ou** (nenhum, um ou ambos atributos podem ser preenchidos). | `nm_funcionario </> nm_apelido` |
| `=` | **Dicionário** (conjunto de elementos que compõem um dado). | `endereco = nm_rua + num_residencia` |
| `@` | Indica **atributo chave** (identificador). | `@id_funcionario` |

## 2. Tipos de Atributos Identificadores (Chaves)

Atributos identificadores garantem a **unicidade** de cada ocorrência (tupla) em uma entidade.

* **Chave Primária (PK):** Identifica de forma única cada registro.
* **Chave Secundária:** Facilita acesso, pesquisa ou classificação; geralmente **índices**.
* **Chave Candidata:** Atributos com valores únicos, aptos a serem PK.
* **Chave Alternativa:** Chaves candidatas não escolhidas como PK.
* **Superchave:** Qualquer conjunto de atributos que identifica exclusivamente uma tupla. (**Toda chave primária é uma superchave**).
* **Chave Composta:** Combinação de dois ou mais atributos que garantem unicidade.
* **Chave Estrangeira (FK):** Chave primária de uma tabela copiada para outra para estabelecer o **relacionamento**.

---

## 3. Os Três Níveis de Modelagem

| Modelo | Foco Principal | Características | Dependência |
| :--- | :--- | :--- | :--- |
| **Conceitual** | Foca na **estrutura** e nas **regras de negócio**. | Abstrato, Focado no negócio. Representado por **DER**. | **Independente** de SGBD. |
| **Lógico** | Foca na **estrutura lógica** e **normalização**. | Deve ser **completamente normalizado**. Foco na **estrutura lógica** dos dados. | **Independente** de SGBD **Específico**. |
| **Físico** | Foca na **implementação real** e **otimização**. | Dependente do SGBD, considera limitações técnicas e **índices**. | **Dependente** do SGBD escolhido. |

---

## 4. Relacionamentos entre Entidades

Relacionamentos definem a associação e interação entre entidades.

### Cardinalidade e Modalidade

* **Cardinalidade:** Número **máximo** de ocorrências associadas.
* **Modalidade (Participação Mínima):** Número **mínimo** de ocorrências associadas (0 ou 1).

| Mínimo | Máximo |
| :--- | :--- |
| 0 ou 1 | 1 ou N |

### Tipos de Relacionamento e Resolução

| Tipo | Característica | Regra de Implementação |
| :--- | :--- | :--- |
| **1:1** (Um para Um) | Pouco comum. | PK da entidade forte (Pai) vai como FK na entidade fraca (Filho). |
| **1:N** (Um para Muitos) | Mais frequente. | **PK da entidade "1" (Pai) vai como FK na entidade "N" (Filho).** (Navegação). |
| **N:N** (Muitos para Muitos) | Complexo. | **Sempre resolvido**. Cria-se uma **Entidade Associativa** que herda as FKs das entidades originais. |

---

## 5. Structured Query Language (SQL)

SQL é a **linguagem padrão** para gerenciamento e manipulação de dados em sistemas de banco de dados relacionais (SGBD).

### 5.1. Categorias de Comandos SQL

| Categoria | Definição | Comandos Principais |
| :--- | :--- | :--- |
| **DDL** (Definition) | Define **esquemas de relações** e modifica estruturas. | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` |
| **DML** (Manipulation) | **Manipulação** dos dados (registros/tuplas). | `INSERT`, `UPDATE`, `DELETE`, `MERGE` |
| **DQL** (Query) | **Consulta** e recuperação de dados. | `SELECT` |
| **DCL** (Control) | Concede ou revoga **direitos de acesso** e privilégios. | `GRANT`, `REVOKE` |
| **TCL** (Transaction) | Gerencia alterações agrupadas em **transações lógicas**. | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

### 5.2. Transações (TCL) e Propriedades ACID

| Propriedades ACID | Definição |
| :--- | :--- |
| **Atomicidade** | Toda transação é **indivisível** (tudo ou nada). |
| **Consistência** | Mantém a **integridade** dos dados. |
| **Isolamento** | Transações não interferem umas nas outras. |
| **Durabilidade** | Alterações confirmadas (`COMMIT`) são **permanentes**. |

### 5.3. Tipos de Dados Comuns

| Tipo | Descrição | Limite Típico/Comentário |
| :--- | :--- | :--- |
| **CHAR(n)** | Alfanumérico, **tamanho fixo**. | 255 (máx) |
| **VARCHAR(n)** | Alfanumérico, **tamanho variável**. | 2000 (máx) |
| **NUMBER(p,s)** | Numérico com precisão. | 38 dígitos |
| **INTEGER** | Números inteiros. | 38 dígitos |
| **DATE** | Armazena data, hora, minuto e segundo. | - |
| **BLOB** | Dados binários (1,0). | - |
| **LONG** | Alfanumérico grande. **Um por tabela**. Não pode ser usado em consultas. | - |

### 5.4. Restrições de Integridade (`CONSTRAINTS`)

Restrições são regras para o preenchimento de colunas.

* **CONSTRAINTS:** Regras definidas para colunas. Armazenadas na tabela **USer\_constraints**.
* **NOT NULL:** Indica que a inserção de valor é **obrigatória**.
* **DEFAULT:** Informa um **valor padrão**.
* **CHECK:** Define um conjunto de **valores permitidos** ou condição.