create database if not exists custumer_management;
use custumer_management;

create table if not exists custumer(
	id_custumer int auto_increment primary key,
    custumer_name varchar(25),
    email varchar(40),
    cpf char(9),
    credit_card char(13),
    contact char(9),
    address varchar(30)
);

show tables;
show index from custumer;


-- simple example of how create an index in MySQL
-- to create an index in an existent table we have to use the
-- alter table statement, like below

alter table custumer add index index_email(email);
