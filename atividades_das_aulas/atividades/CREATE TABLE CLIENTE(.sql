CREATE TABLE CLIENTE(
	cliente_id INT(5),
	primeiro_nome VARCHAR(45),
    ultimo_nome VARCHAR(45),
    email VARCHAR(50),
    ativo TINYINT(1),
    data_criacao datetime,
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (cliente_id)
);
CREATE TABLE FUNCIONARIO(
	id_funcionario TINYINT(3),
	primeiro_nome  VARCHAR(45),
    ultimo_nome VARCHAR(45),
    foto BLOB,
    email VARCHAR(50),
    ativo TINYINT(1),
    usuario VARCHAR(16),
    senha VARCHAR(40),
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (id_funcionario)
);

CREATE TABLE ATOR(
	ator_id SMALLINT(5),
    primeiro_nome VARCHAR(45),
    ultimo_nome VARCHAR(45),
    utima_atualizacao TIMESTAMP,
    PRIMARY KEY (ator_id)
);

CREATE TABLE FILME_ATOR(
	ator_id SMALLINT(5),
    filme_id SMALLINT(5),
    ultima_atualizacao TIMESTAMP
);

CREATE TABLE FILME(
	id_filme SMALLINT(5),
    titulo VARCHAR(255),
    descricao TEXT,
    ano_de_lacamento YEAR(4),
    duracao_da_locacao TINYINT(3),
    preco_da_locacao DECIMAL(4,2),
    duracao_do_filme SMALLINT(5),
    custo_de_substituicao DECIMAL(5,2),
    classificacao VARCHAR(35),
    recursos_especiais TEXT,
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY(id_filme)
);

CREATE TABLE IDIOMA(
	id_idioma TINYINT(3),
    nome CHAR(20),
    ultima_atualizacao TIMESTAMP,
	PRIMARY KEY (id_idioma)
);

CREATE TABLE LOJA(
	loja_id TINYINT(3),
    gerente_id TINYINT(3),
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY(loja_id)
);

CREATE TABLE CIDADE(
	cidade_id SMALLINT(5),
    cidade VARCHAR(50),
    ultima_atualizacao TIMESTAMP
);
 
CREATE TABLE PAIS(
	pais_id SMALLINT(5),
    pais VARCHAR(50),
    ultima_atualizacao TIMESTAMP,
	PRIMARY KEY (pais_id)
);

CREATE TABLE CATEGORIA(
	categoria_id TINYINT(3),
    nome VARCHAR(25),
    ultima_atualizacao TIMESTAMP
);

CREATE TABLE FILME_CATEGORIA(
	ultima_atualizacao TIMESTAMP
);

CREATE TABLE FILME_TEXTO(
	filme_id SMALLINT(6),
    titulo VARCHAR(255),
    descricao TEXT
);

CREATE TABLE ALUGUEL(
    aluguel_id INT(11),
    data_de_aluguel DATETIME,
    data_de_devolucao DATETIME,
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (aluguel_id)
);

CREATE TABLE INVENTARIO(

    inventario_id MEDIUMINT(8),
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (inventario_id)
);

CREATE TABLE PAGAMENTO(
    pagamento_id SMALLINT(5),
    valor DECIMAL (5,2),
    aluguel_id INT(11),
    data_de_pagamento DATETIME,
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (pagamento_id)
);

CREATE TABLE ENDERECO(
    endereco_id SMALLINT(5),
    endereco VARCHAR(50),
    endereco2 VARCHAR(50),
    bairro VARCHAR(20),
    cep VARCHAR(10),
    telefone VARCHAR(20),
    ultima_atualizacao TIMESTAMP,
    PRIMARY KEY (endereco_id)
);