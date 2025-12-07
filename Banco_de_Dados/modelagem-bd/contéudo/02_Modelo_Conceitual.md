# O Modelo Conceitual

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

## Modelo Lógico

É uma representação lógica das informações da área de negócios. **Não é um banco de dados**, é independente do modelo físico. Este é o conceito chave da modelagem de dados lógicos: ele deve ser **independente da tecnologia implementada**. Os componentes desse modelo devem estar intimamente ligados aos negócios, não à tecnologia.

### Características:
- **Ser completamente normalizado**
- **Conter descrição sucinta** das entidades, atributos e relacionamentos
- **Independente de SGBD específico**
- **Foco na estrutura lógica dos dados**

## Modelo Físico

No modelo físico fazemos a **modelagem física** do modelo de banco de dados. Levam-se em conta as limitações impostas pelo SGBD escolhido e deve ser criado sempre com base nos exemplos de modelagem de dados produzidos no item anterior (modelo lógico).

### Características:
- **Dependente do SGBD escolhido**
- **Considera limitações técnicas**
- **Implementação real do banco**
- **Otimizações específicas da plataforma**

