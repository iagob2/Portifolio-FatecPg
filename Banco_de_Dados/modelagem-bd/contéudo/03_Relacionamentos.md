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

