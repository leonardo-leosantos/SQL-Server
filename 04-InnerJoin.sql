--SOMA DOS VALORES DOS PRODUTOS--

SELECT * FROM tb_ProdutoVenda
SELECT * FROM tb_Produtos

--INNER JOIN--
/*
SELECT [colunas_selecionadas]
FROM [nome_tabela] AS [apelido_tabela] INNER JOIN [nome_tabela_comparacao] AS [apelido_tabela_comparacao]
ON [condicao/regra]
*/

SELECT P.Id, P.Codigo , PV.QtdProduto, P.Valor
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto

--INNER JOIN MAIS DE DUAS TABELAS--

SELECT C.NomeCliente, V.Id, P.Id, P.Codigo , PV.QtdProduto, P.Valor
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto
INNER JOIN tb_Vendas V ON PV.IdVenda = V.Id
INNER JOIN tb_Clientes C ON V.IdCliente = C.Id

/*
A quantidade de JOINs que eu preciso para unir dados de diferentes tabelas é igual a 
quantidade de tabelas -1. Por exemplo, para unir quatro tabelas eu preciso de três JOINs;
Para unir 15 tabelas eu preciso de 14 JOINs
*/