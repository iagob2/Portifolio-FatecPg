# Exercício: Modelo Lógico - Sistema de Ordem de Serviço

Este repositório contém o exercício de modelagem de dados para um sistema de controle de Ordens de Serviço (OS), gerenciamento de Clientes e consumo de Materiais.

## 📸 Diagrama do Modelo Lógico

Abaixo está a representação visual do relacionamento entre as entidades:

![Diagrama do Banco de Dados](imagens/bd_01.png)

> **Nota:** O diagrama ilustra o relacionamento **Muitos-para-Muitos** entre *Ordem de Serviço* e *Materiais*, resolvido através da tabela associativa `SERVICO_MATERIA`.

## 🗂 Estrutura das Entidades

O modelo foi estruturado com as seguintes tabelas principais:

1.  **CLIENTE:**
    * Responsável por armazenar os dados de quem solicita o serviço (CPF/CNPJ, Endereço, Telefone).
2.  **ORDEM_SERVICO:**
    * Tabela principal que registra a solicitação, data/hora e vincula ao cliente solicitante.
3.  **MATERIA (Estoque):**
    * Cadastro dos tipos de materiais disponíveis para uso (com descrição e tipo).
4.  **SERVICO_MATERIA:**
    * Tabela de ligação que registra exatamente **quanto** de cada material foi utilizado em uma ordem específica e o preço praticado no momento.

## 🛠 Tecnologias / Ferramentas
* Modelagem Lógica de Dados (MER/DER)
* figma 

---
*Desenvolvido como parte dos exercícios da disciplina de Banco de Dados.