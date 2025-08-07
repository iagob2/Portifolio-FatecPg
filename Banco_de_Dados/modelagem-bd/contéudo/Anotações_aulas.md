# Modelos Lógicos de Dados

Uma característica essencial de um modelo de dados é **não conter nenhuma redundância de dados**. Um determinado dado ou atributo deve aparecer em um único lugar no modelo. O modelo precisa ser compreensível e de fácil entendimento para seus usuários.

---

## Entidade

- Representa um objeto ou coisa, concreta ou abstrata, do mundo real, com existência independente (instâncias ou tuplas).
- **Regras para nomeação:**
  - Todas as letras maiúsculas
  - Formado apenas por substantivos
  - Sem preposições ou conjunções
  - Nome no singular
  - Sem cedilha ou acento
  - Palavras compostas separadas por underline (`_`)

---

## Entidade Associativa

- Não existe no MER por si só; sua existência depende de duas ou mais entidades.

---

## Categoria

- Representa a relação entre superclasse (entidade principal) e subclasse.

---

## Tupla

- Conjunto de atributos ordenados em pares de domínio e valor (linha de uma tabela).

---

## Instância

- Coleção de informações armazenadas em determinado momento (registro de uma entidade).

---

## Atributo

- Propriedade ou característica de uma entidade que o sistema precisa conhecer.
- Todo atributo está associado a uma entidade.
- Os dados dos atributos são armazenados no sistema.

---

## Relacionamento

- Associação entre uma ou mais entidades, representada por uma linha unindo os objetos.

---

## Dado

- Característica de algum objeto tratada pelo sistema.
- Informação no nível atômico (menor parte da informação).

---

## Tipos de Dados

- **Natural:** Descreve o objeto e sua existência, independente do uso no sistema.  
  *Exemplo:* `nm_funcionario`, `dt_nascimento`
- **Derivado ou Calculado:** Criado a partir de outros dados naturais, por necessidade do sistema.  
  *Exemplo:* `qt_idade_funcionario` (calculado a partir de `dt_nascimento_funcionario`)
- **Artificial:** Criado para possibilitar identificação interna ao sistema, geralmente quando não há dados naturais adequados para identificar ocorrências.  
  *Exemplo:* `id_funcionario`

---

## Processo

- Sequência de atividades para cumprir uma função no sistema.
- Manipula e transforma dados, mas não os armazena.

---

## Fluxo de Dados

- Caminho percorrido pelos dados dentro do sistema.
- Responsável por transferir dados entre processos, podendo ser manual ou automatizado.

---

## Mnemônicos

- Abreviações padronizadas para entidades ou atributos, facilitando a identificação.

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
