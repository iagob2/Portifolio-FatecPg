┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│   CLIENTE   │──1:N──│   COMPRA    │──N:N──│   PRODUTO   │
├─────────────┤       ├─────────────┤       ├─────────────┤
│ cd_cliente  │       │ dt_compra   │       │ cd_produto  │
│ nm_cliente  │       │ cd_cliente  │       │ nm_produto  │
│ cd_telefone │       │ vl_compra   │       │ vl_produto  │
│ dt_cadastro │       └──────┬──────┘       │ qt_produto  │
│ nm_email    │              │              └─────────────┘
│ ic_tipo     │              │
└─────────────┘       ┌──────┴──────┐
                      │ ITEM_COMPRA │ (Tabela Associativa)
                      ├─────────────┤
                      │ cd_cliente  │
                      │ dt_compra   │
                      │ cd_produto  │
                      │ qt_compra   │
                      └─────────────┘