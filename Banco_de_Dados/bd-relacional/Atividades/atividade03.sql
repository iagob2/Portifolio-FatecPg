-- criar a tabela medico 
CREATE TABLE MEDICO (
    cd_crm INTEGER PRIMARY KEY ,
    nm_medico VARCHAR(30) NOT NULL 
    );

 DESC MEDICO ;

-- inserir regjistro(informações) na tabela medica 
-- a) implicito : valor para todos as colunas 

-- B) explicito : valor  OBRIGATORIO para colunas 
-- de chave primaria e not null 
-- informar as colunas que tera valor 

INSERT INTO MEDICO (cd_crm , nm_medico) values (2,'vitor ');

-- confimar a transação 
COMMIT;

-- c) usando variavel de substituiçõ (&) 

INSERT INTO MEDICO VALUES (&crm , '&nome_medico');

--repetir o ultimo comado sql executado :
sq<>/

-- exivir todos os registros da tabela medico 
SELECT * FROM MEDICO ;

COMMIT ; -- CONFIMAR A TRANSAÇÃO 


