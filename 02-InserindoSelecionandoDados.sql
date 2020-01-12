---INSERINDO DADOS---

/*
INSERT INTO [nome_tabela] ([coluna1],[coluna2],...)
VALUES ([valor1],[valor2],...)
*/

INSERT INTO tb_Produtos VALUES(
	NEWID(),'SUCONATURAL','Suco de frutas natural',4.50
)

INSERT INTO tb_Clientes VALUES(
	NEWID(),'JOAO DA SILVA','1977-05-14','M','RUA JARDINS, 307','EMBU','SP',
	'1147259635','11980256097'
)

INSERT INTO tb_Vendas VALUES(
	NEWID(),(select Id from tb_Produtos where Codigo = 'SUCONATURAL'),(select Id from tb_Clientes where NomeCliente = 'JOAO DA SILVA')
)

--SELECIONANDO DADOS--
/*
SELECT [nome_coluna] FROM [nome_tabela] WHERE [condicao]
*/


SELECT
PROD.Id AS IDPROD,
CLI.Id AS IDCLIENTE,
VEND.*
FROM tb_Produtos AS PROD, tb_Clientes AS CLI, tb_Vendas AS VEND