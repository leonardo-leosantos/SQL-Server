--SOMA DOS VALORES DOS PRODUTOS--

SELECT * FROM tb_ProdutoVenda
SELECT * FROM tb_Produtos
select * from tb_Clientes
select * from tb_Vendas

--INNER JOIN MAIS DE DUAS TABELAS : retornando todos os dados relacionados entre cliente, venda e produto--
SELECT C.NomeCliente, V.Id AS IdVenda, P.Id AS IdProduto, P.Codigo , PV.QtdProduto, P.Valor, PV.QtdProduto*P.Valor AS ValorTotal
FROM tb_Produtos P 
INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto
INNER JOIN tb_Vendas V ON PV.IdVenda = V.Id
INNER JOIN tb_Clientes C ON V.IdCliente = C.Id


--SOMAR QUANTIDADE DE PRODUTOS AGRUPADOS POR CLIENTE : soma de qtd de produtos por cliente --
SELECT C.NomeCliente, SUM(PV.QtdProduto) AS QtdProduto
FROM tb_Produtos P 
INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto
INNER JOIN tb_Vendas V ON PV.IdVenda = V.Id
INNER JOIN tb_Clientes C ON V.IdCliente = C.Id
GROUP BY C.NomeCliente


--SOMAR QTD DE PRODUTOS E VALOR TOTAL POR CLIENTE : soma de qtd de produtos por cliente  e soma do valor total do cliente por produto consumido --
SELECT C.NomeCliente, SUM(PV.QtdProduto) AS QtdProduto, P.Codigo, SUM(P.Valor * PV.QtdProduto)
FROM tb_Produtos P 
INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto
INNER JOIN tb_Vendas V ON PV.IdVenda = V.Id
INNER JOIN tb_Clientes C ON V.IdCliente = C.Id
GROUP BY P.Codigo, C.NomeCliente

/*OBS: a ordem do GROUP BY é importante, pois a ordem do resultado apresentado seguirá o ultimo critério informado. no caso, o C.NomeCliente*/

--SOMAR VALOR TOTAL VENDA POR CLIENTE E QTD DE PRODUTOS--
SELECT C.NomeCliente, SUM(PV.QtdProduto) AS QtdProduto, SUM(P.Valor * PV.QtdProduto)
FROM tb_Produtos P 
INNER JOIN tb_ProdutoVenda PV ON P.Id = PV.IdProduto
INNER JOIN tb_Vendas V ON PV.IdVenda = V.Id
INNER JOIN tb_Clientes C ON V.IdCliente = C.Id
GROUP BY C.NomeCliente