# Modelos Lógicos de Dados

Um modelo lógico de dados detalha a estrutura dos dados de um sistema, especificando entidades, atributos, relacionamentos e restrições, sem considerar aspectos físicos de armazenamento. Ele serve como base para a implementação do banco de dados, facilitando o entendimento e o desenvolvimento do sistema.

Uma característica essencial de um modelo de dados é **evitar redundância**: cada dado ou atributo deve aparecer apenas uma vez no modelo. O modelo precisa ser claro e compreensível para seus usuários.

---

## Entidade

- Representa um objeto ou conceito do mundo real, com existência independente (instâncias ou tuplas).
- **Regras para nomeação:**
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

- Propriedade ou característica de uma entidade.
- Associado a uma entidade e armazenado no sistema.

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

## Linguagem de modelagem

É utilizada para construir um modelo de dados, podendo ser apresentada de forma textual ou gráfica. Um modelo de dados pode ser representado de várias formas, conhecidas como "esquema de banco de dados". O modelo deve respeitar o nível de conhecimento dos usuários que irá atender. Para o usuário final, o modelo não deve conter detalhes técnicos de implementação, que são necessários apenas para usuários mais avançados do sistema.

## Banco de dados

É um conjunto de registros (dados) organizados em tabelas, permitindo o armazenamento e a produção de informações. Um banco de dados normalmente agrupa registros com o mesmo objetivo e é mantido e acessado por meio de um software chamado SGBD, que auxilia na administração das bases de dados.

## Modelo de dados

É uma descrição dos tipos de informações que estão armazenadas em um banco de dados.