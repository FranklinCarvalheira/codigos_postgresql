/*######################################################################################################
Modelos de queries utilizadas no treinamento de Banco de Dados - Sertãozinho (12/03/2021 - 13/03/2021)
######################################################################################################*/


/*CRIAÇÃO DE DATABASE*/
CREATE DATABASE treinamento_stz
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


/*CRIAÇÃO DE TABELAS E DEFINIÇÃO DE ATRIBUTOS*/
CREATE TABLE public.tb_lote
(
	id integer NOT NULL, --Estrutura: nome_atributo type_atributo
	inscricao varchar(50) NOT NULL,
	num_lote integer NOT NULL, 
	proprietario varchar (60) NOT NULL,
	
	CONSTRAINT tb_lote PRIMARY KEY (id)
);

ALTER TABLE public.tb_lote
  OWNER TO postgres;
  

/*CRIAÇÃO DE SEQUENCES*/
CREATE SEQUENCE tb_lote_id_seq
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1;
	
	
/*UTILIZANDO O COMANDO INSERT*/
--INSERT INTO nome_tabela (atributo1, atributo2)VALUES(valor1,valor2);
INSERT INTO tb_lote (id,inscricao,num_lote,proprietario) VALUES (1,'001.002.003.004',10,'José');

--INSERT COM MULTIPLOS VALORES
INSERT INTO tb_lote (id,inscricao,num_lote,proprietario)
VALUES
(1,'001.002.003.004',10,'José');
(2,'001.002.003.010',10,'Maria');
(3,'001.002.003.100',10,'Larissa');
(4,'001.002.003.110',NULL,'Israel');


/*UTILIZANDO DELETE*/
--DELETE FROM nome_tabela WHERE atributo = 'valor';
DELETE FROM tb_lote WHERE inscricao = '001.002.003.004';


/*UTILIZANDO DROP*/
--DROP estrutura(database, table, view...) nome 
DROP TABLE public.tb_lote


/*UTILIZANDO ALTER*/
ALTER TABLE tb_lote RENAME COLUMN inscricao TO insc_padrao;
ALTER TABLE public.tb_lote DROP COLUMN area_lote;
ALTER TABLE public.tb_lote ADD COLUMN nome_proprietario varchar(60);


/*UTILIZANDO UPDATE*/
--UPDATE nome_tabela SET nome_atributo WHERE condição
UPDATE tb_lote SET nome_proprietario = 'Maria' WHERE id = 1;


/*UTILIZANDO TRUNCATE (Esvaziar)*/
TRUNCATE TABLE tb_lote


/*UTILIZANDO SELECT*/
--SELECT *todos_campos* FROM
SELECT * FROM tb_lote;

--SELECT por campos
SELECT insc_padrao,num_lote FROM tb_lote;

--SELECT com WHERE clause
SELECT * FROM tb_lote WHERE nome_proprietario = 'Maria ';
SELECT * FROM tb_lote WHERE insc_padrao = '001.002.003.005' AND nome_proprietario = 'Maria'
SELECT * FROM tb_lote WHERE insc_padrao = '001.002.003.005' OR nome_proprietario = 'Maria'

--SELECT com DISTINCT
SELECT DISTINCT nome_proprietario,num_lote FROM tb_lote;

--SELECT com ORDER BY
SELECT nome_proprietario FROM  tb_lote ORDER BY nome_proprietario DESC;
SELECT nome_proprietario FROM  tb_lote ORDER BY nome_proprietario ASC;

--SELECT com LIMIT
SELECT * FROM tb_lote ORDER BY id DESC LIMIT 3;
SELECT TOP 3 * FROM tb_lote; --SQL SERVER

--Utilizando Like
SELECT * FROM tb_lote WHERE nome_proprietario like 'Ma%';


/*UTILIZANDO JOIN*/
--INNER JOIN
SELECT tbl_lote.endereco, tb_proprietario.cpf, tbl_lote.loteamento
FROM tb_lote
INNER JOIN tb_proprietario ON tb_lote.nome_proprietario=tb_proprietario.nome_proprietario;

--Aqui estão os diferentes tipos de JOINs em SQL:

--INNER JOIN: Retorna registros que possuem valores correspondentes em ambas as tabelas
--LEFT JOIN: Retorna todos os registros da tabela da esquerda e os registros correspondentes da tabela da direita
--RIGHT JOIN: Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda
--FULL JOIN: Retorna todos os registros quando há uma correspondência na tabela da esquerda ou da direita


/*CRIAR EXTENSÃO POSTGIS*/
--Extensão para manipular dados com referencia espacial no banco de dados
CREATE EXTENSION postgis;