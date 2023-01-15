create database if not exists mecanica;
use mecanica; 

create table cliente(
	id_cliente int not null unique primary key,
    nome_cliente varchar(125) not null unique,
    endereco varchar(70) not null,
    email varchar(80) not null,
    telefone char(12) not null
);

create table carro(
	id_carro int not null unique primary key,
    modelo varchar(50) not null,
    ano date not null,
    montadora varchar(50) not null unique,
    valor_carro float not null,
    id_cliente int not null,
    constraint fk_id_cliente foreign key (id_cliente) references cliente(id_cliente)
);

create table mecanico(
	id_mecanico int not null unique primary key,
    nome_mecanico varchar(125) not null unique,
    especialidade varchar(70) not null
);

create table estoque(
	idEstoque int not null unique primary key,
    localidade varchar(80) not null unique,
    disponibilidade int not null
);

create table pecas(
	id_peca int not null unique primary key,
	nome_peca varchar(70) not null unique,
    marca varchar(60) not null,
    valor float not null
);

create table servico_prestado(
	idServico int not null unique primary key,
	Nome varchar(80) not null,
    descricao varchar(500) not null,
	valor float not null 
);

create table ordem_de_servico (
	id_OS int not null unique primary key,
	data_emissao date not null,
	valor_pecas float not null,
    status_os enum('Concluido','Em execucao','Em análise'),
    data_conclusao date not null,
    valor_mao_obra float not null,
    valor_total float not null,
    descricao varchar(500) not null
);

-- tabelas de relação N:M

create table mecanico_analisa_carro(
	id_mecanico int not null,
	idcarro int not null,
    carro_id_cliente int not null,
    constraint fk_id_mecanico_analista foreign key (id_mecanico) references mecanico(id_mecanico),
    constraint fk_id_carro_analisado foreign key (idcarro) references carro(id_carro),
    constraint fk_id_carro_id_cliente foreign key (carro_id_cliente) references carro(id_cliente)
);

create table estoque_contem_pecas(
	id_estoque int not null,
	id_peca int not null,
	constraint fk_id_do_estoque foreign key (id_estoque) references estoque(idEstoque),
    constraint fk_id_da_peca foreign key (id_peca) references pecas(id_peca)
);

create table mecanico_preenche_os (
	id_mecanico int not null,
	id_ordem int not null,
	constraint fk_id_mecanico_que_preenche foreign key (id_mecanico) references mecanico(id_mecanico),
    constraint fk_id_ordem_preenchida foreign key (id_ordem) references ordem_de_servico(id_OS)
);


create table mecanico_executa_os(
	id_ordemOS int not null,
	id_mecanico int not null,
	constraint fk_id_mecanico_que_executa foreign key (id_mecanico) references mecanico(id_mecanico),
    constraint fk_id_ordem_executada foreign key (id_ordemOS) references ordem_de_servico(id_OS)
);

create table cliente_solicita_os (
	id_ordemServico int not null,
	id_cliente int not null,
    constraint fk_id_ordem_servico_solicitada foreign key (id_ordemServico) references ordem_de_servico(id_OS),
    constraint fk_id_cliente_solicitante foreign key (id_cliente) references cliente(id_cliente)
    
);

create table OS_tem_Lista_de_Servicos(
	id_ordem_servico int not null,
	id_servico int not null,
	constraint fk_id_ordem_de_servico_servicos foreign key (id_ordem_servico) references ordem_de_servico(id_OS),
    constraint fk_id_servico_solicitado foreign key (id_servico) references servico_prestado(idServico)
);

create table servicos_mecanico(
	id_servico int not null,
	id_mecanico int not null,
	constraint fk_id_servico_prestado foreign key (id_servico) references servico_prestado(idServico),
    constraint fk_id_mecanico_prestador foreign key (id_mecanico) references mecanico(id_mecanico)
);
