/*PROBLEMA
Lanchonete vende lanches e sucos

* Dados dos clientes:
	Nome (texto)
	nascimento (dados dd / mm / aaaa)
	sexo (número)
	endereço
		Rua (texto)
		cidade (texto)
		Estado (texto)
	Telefones (texto)

* Dados das vendas
	Número da venda (número)
	cliente que comprou (texto)
	preço total

* Dados do produto
	Nome (texto)
	Preço (número)*/

CREATE DATABASE dbLANCHONETE;


CREATE TABLE tb_Clientes(
	Id uniqueidentifier PRIMARY KEY NOT NULL, --IDENTITY(1,1),
	NomeCliente VARCHAR(50) NOT NULL,
	DataNascimento DATE,
	Sexo VARCHAR(1) NOT NULL,
	Endereco VARCHAR(50),
	Cidade VARCHAR(50),
	Estado VARCHAR(50),
	Telefone VARCHAR(15),
	Celular VARCHAR(15),
)

CREATE TABLE tb_Produtos(
	Id UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	Codigo VARCHAR(20) NOT NULL,
	Descricao VARCHAR(50) NOT NULL,
	Valor DECIMAL(6,2) NOT NULL
)

CREATE TABLE tb_Vendas(
	Id UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	IdProduto UNIQUEIDENTIFIER NOT NULL,
	IdCliente UNIQUEIDENTIFIER NOT NULL,
) 
GO

---CONSTRAINT---

--ADD FOREIGN KEY--

/*
ALTER TABLE [nome_tabela] ADD CONSTRAINT [nome_regra FK_tbREFERENCIA_tbRECEBE]
FOREIGN KEY ([id_tabela])
REFERENCES [nome_tabelaReferencia] ([id_tabelaReferencia])
*/

ALTER TABLE tb_Vendas ADD CONSTRAINT FK_Produtos_Vendas
FOREIGN KEY (IdProduto)
REFERENCES tb_Produtos (Id)

GO

ALTER TABLE tb_Vendas ADD CONSTRAINT FK_Clientes_Vendas
FOREIGN KEY (IdCliente)
REFERENCES tb_Clientes (Id)
