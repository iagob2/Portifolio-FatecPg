# 📊 Modelagem de Banco de Dados

Este diretório contém materiais de estudo sobre **Modelagem de Banco de Dados**, abordando desde conceitos fundamentais até implementação prática em SQL.

---

## 📁 Estrutura do Diretório

```
modelagem-bd/
├── README.md
├── contéudo/
│   ├── 00_Anotações_aulas.md      # Índice geral dos materiais
│   ├── 01_Modelos_Logicos_de_Dados.md
│   ├── 02_Modelo_Conceitual.md
│   ├── 03_Relacionamentos.md
│   ├── 04_SQL.md
│   └── BDRAula00RevisaoModelagemBD.pdf
└── Atividades/
    └── 00-cinema.png              # Exercício prático de modelagem
```

---

## 📚 Conteúdo por Módulo

### 1. [Modelos Lógicos de Dados](./contéudo/01_Modelos_Logicos_de_Dados.md)

Introdução aos fundamentos da modelagem de dados:

| Tópico | Descrição |
|--------|-----------|
| **Entidade** | Representação de objetos do mundo real com regras de nomeação |
| **Atributo** | Propriedades e características das entidades |
| **Tupla/Instância** | Registros e linhas em tabelas |
| **Tipos de Dados** | Natural, Derivado e Artificial |
| **Mnemônicos** | Prefixos padronizados (`nm_`, `dt_`, `id_`, `vl_`, etc.) |
| **Tipos de Chaves** | Primária, Secundária, Candidata, Alternativa, Composta |

---

### 2. [Modelo Conceitual](./contéudo/02_Modelo_Conceitual.md)

Fundamentos da modelagem abstrata e de alto nível:

| Tópico | Descrição |
|--------|-----------|
| **Cardinalidade** | Número máximo de ocorrências em relacionamentos |
| **Modalidade** | Participação mínima em relacionamentos |
| **MER/DER** | Modelo e Diagrama Entidade-Relacionamento |
| **SGBD** | Sistema de Gerenciamento de Banco de Dados |
| **Níveis de Modelo** | Conceitual → Lógico → Físico |

**Comparativo dos Modelos:**
- **Conceitual:** Foco no negócio, independente de tecnologia
- **Lógico:** Estrutura detalhada, normalizado, tipos de dados
- **Físico:** Implementação real no SGBD com otimizações

---

### 3. [Relacionamentos](./contéudo/03_Relacionamentos.md)

Tipos de conexões entre entidades:

| Cardinalidade | Descrição | Exemplo |
|---------------|-----------|---------|
| **1:1** (Um para Um) | Um registro se relaciona com apenas um | Pessoa ↔ CPF |
| **1:N** (Um para Muitos) | Um registro se relaciona com vários | Cliente → Pedidos |
| **N:N** (Muitos para Muitos) | Vários registros se relacionam com vários | Alunos ↔ Disciplinas |

> ⚠️ **Importante:** Relacionamentos N:N sempre devem ser resolvidos através de uma **tabela intermediária**.

---

### 4. [SQL - Linguagem de Consulta Estruturada](./contéudo/04_SQL.md)

Comandos e categorias da linguagem SQL:

| Categoria | Sigla | Função Principal |
|-----------|-------|------------------|
| **DDL** | Data Definition Language | Criar, alterar, excluir estruturas |
| **DML** | Data Manipulation Language | Inserir, atualizar, deletar dados |
| **DQL** | Data Query Language | Consultar e recuperar dados |
| **DCL** | Data Control Language | Controle de permissões e acessos |
| **TCL** | Transaction Control Language | Gerenciamento de transações |

**Principais Comandos:**
- `CREATE`, `ALTER`, `DROP` (DDL)
- `INSERT`, `UPDATE`, `DELETE` (DML)
- `SELECT` (DQL)
- `GRANT`, `REVOKE` (DCL)
- `COMMIT`, `ROLLBACK`, `SAVEPOINT` (TCL)

**Propriedades ACID:**
- **A**tomicidade - Transação indivisível
- **C**onsistência - Integridade mantida
- **I**solamento - Transações independentes
- **D**urabilidade - Alterações permanentes

---

## 🎯 Atividades Práticas

A pasta `Atividades/` contém exercícios práticos de modelagem:

| Arquivo | Descrição |
|---------|-----------|
| `00-cinema.png` | Exercício de modelagem de sistema de cinema |

---

## 📖 Material de Apoio

- [BDRAula00RevisaoModelagemBD.pdf](./contéudo/BDRAula00RevisaoModelagemBD.pdf) - Material de revisão em PDF

---

## 🗺️ Mapa de Aprendizado Sugerido

```
┌─────────────────────────────────────────────────────────────┐
│                    JORNADA DE ESTUDO                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1️⃣  Modelos Lógicos    →   Entender entidades, atributos  │
│                              e tipos de chaves              │
│                              ↓                              │
│  2️⃣  Modelo Conceitual  →   Aprender cardinalidade e       │
│                              diferenças entre modelos       │
│                              ↓                              │
│  3️⃣  Relacionamentos    →   Dominar 1:1, 1:N e N:N         │
│                              ↓                              │
│  4️⃣  SQL                →   Implementar na prática         │
│                              ↓                              │
│  5️⃣  Atividades         →   Exercitar com casos reais      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 💡 Conceitos-Chave para Revisão Rápida

### Mnemônicos (Prefixos de Atributos)
| Prefixo | Significado |
|---------|-------------|
| `nm_` | Nome |
| `dt_` | Data |
| `id_` | Identificador (PK) |
| `cd_` | Código |
| `vl_` | Valor |
| `qt_` | Quantidade |
| `ds_` | Descrição |

### Regras de Nomeação de Entidades
- ✅ Letras maiúsculas
- ✅ Substantivos no singular
- ✅ Sem acentos ou cedilha
- ✅ Palavras compostas com underline (`_`)

---

## 📝 Observações

Este material foi desenvolvido para a disciplina de **Modelagem de Banco de Dados** e faz parte do portfólio acadêmico da FATEC-PG.

---

> **Dica:** Comece pelo arquivo `00_Anotações_aulas.md` na pasta `contéudo/` para ter uma visão geral organizada de todo o conteúdo.

