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

