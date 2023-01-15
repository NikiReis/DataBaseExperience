
create database if not exists ecomerce;
use ecomerce;

create table cliente(
    id_cliente int  primary key auto_increment not null,
    nome_cliente varchar (80) not null,
    endereco varchar(80) not null,
    email varchar(50) not null,
    telefone char(12) not null,
    CPF char(14) not null unique,
    data_nascimento date not null unique
);

create table Pessoa_Fisica(
    CPF int not null unique,
    idade int not null,
    data_nascimento date not null unique,
    id_cliente int not null,
    constraint fk_id_de_cliente foreign key (id_cliente) references cliente(id_cliente)
);

create table Pessoa_Juridica(
    CNPJ int not null unique,
    id_cliente int not null,
    constraint fk_id_de_cliente_pj foreign key (id_cliente) references cliente(id_cliente)
);

create table pedido(
    id_pedido int not null unique primary key,
    valor_total float not null,
    frete float default 20,
    descricao varchar(350),
    data_pedido date not null,
    id_cliente int not null,
    status_pedido enum('Cancelado','Processando','Concluido') not null,
    id_pagamento int not null,
    id_transportadora int not null,
    id_pagamento_id_cliente int not null

);

create table produto(
    nome_produto varchar(80),
    id_produto int primary key auto_increment,
    descricao varchar(800),
    marca varchar(45) not null,
    preco float not null,
    size varchar(10),
    for_kids bool default false ,
    avaliacao float default 0,
    categoria varchar(30)
);


create table pagamento(
    id_pagamento int unique not null primary key,
    status_pagamento enum('Falhou','Concluido','Processando') not null,
    metodo_pagamento enum('Pix','Credito','Debito','Boleto'),
    id_cliente int not null,
    constraint fk_pagamento_de_cliente foreign key (id_cliente) references cliente(id_cliente)
);

create table estoque(
	id_estoque int not null primary key,
	endereco varchar (70) not null,
	disponibilidade smallint not null
);

create table fornecedor(
    id_fornecedor int not null primary key,
    endereco varchar(70) not null,
    nome_fornecedor varchar(60) not null,
    telefone char(12) not null,
    email varchar(50) not null,
    CNPJ char(18) not null
);

create table transportadora(
     id_transportadora int not null primary key,
     nome_transportadora varchar(80) not null unique,
     email varchar(60) not null,
     endereco varchar(80) not null,
     telefone char(12) not null,
     CNPJ char(18) not null unique
);


create table entrega(
    codigo_rastreio varchar(18) not null unique primary key,
    id_transportadora int not null,
    status_entrega enum('Entregue ao destinatario', 'Falhou ao entregar para o destinatario', 'Saiu para a entrega  ao destinatario', 'Objeto em transito, por favor aguarde', 'Objeto postado, por favor aguarde','Processando') default 'Processando',
    data_prevista datetime not null,
    data_entrega datetime not null,
	
    constraint fk_id_transpotadora_entrega foreign key (id_transportadora) references transportadora(id_transportadora)
);

create table fonecimento_produto(
    id_fornecedor int not null,
    id_produto int not null,
    constraint fk_produto_fornecido foreign key (id_produto) references produto(id_produto),
    constraint fk_fornecedor_produto foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table estoque_tem_produto(
    id_produto int not null,
    id_estoque int not null,
    quantidade_produto int not null,
    constraint fk_produto_no_estoque foreign key (id_produto) references produto(id_produto),
    constraint fk_estoque_de_produto foreign key (id_estoque) references estoque(id_estoque)
);

create table pedido_contem_produto(
    id_pedido int not null,
    id_produto int not null,
    preco_produto float not null,
    quantidade_produto tinyint not null default 1,
    constraint fk_pedido_has_prod_id_pedido foreign key(id_pedido) references pedido(id_pedido),
    constraint fk_pedido_has_prod_id_prod foreign key(id_produto) references produto(id_produto)

);

alter table pedido_contem_produto add constraint fk_id_do_pedido foreign key (id_pedido) references pedido(id_pedido);
alter table pedido_contem_produto add constraint fk_id_do_produto_pedido foreign key (id_produto) references produto(id_produto);

alter table pedido add constraint fk_id_cliente_pedido foreign key (id_cliente) references cliente(id_cliente);
alter table pedido add constraint fk_id_pagamento foreign key (id_pagamento) references pagamento(id_pagamento);
alter table pedido add constraint fk_id_pagamento_id_cliente foreign key (id_pagamento_id_cliente) references pagamento(id_cliente);
alter table pedido add constraint fk_id_transportadora_leva_produto foreign key (id_transportadora) references transportadora (id_transportadora);
