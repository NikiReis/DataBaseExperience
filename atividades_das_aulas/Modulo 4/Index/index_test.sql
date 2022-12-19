create database if not exists index_test;
use index_test;

create table customer_v2(
  customer_id smallint unsigned not null auto_increment.
  store_id tinyint unsigned not null,
  first_name varchar(60) not null,
  last_name varchar(60) not null,
  email varchar(50) not null,
  address_id smallint int unsigned not null ,
  ativo boolean not null default true,
  create_date datetime not null,
  last_update timestamp default current_timestamp,
  primary key (customer_id),
  key idx_fk_store_id (store_id),
  key idx_fk_address_id (address_id),
  key idx_last_name (last_name),
);

show tables;
show indexes from customer_v2;

alter table database_name.customer_v2 add hash index active_dustomers_index (ativo); -- won't run because the table is usign the MySQL's default engine "InnoDB" that doesn't support the creation of a hash index.
create index indx on database_name.customer_v2 (ativo) usign hash; -- -- won't run because the RDMS will convert to a Btree

create index indx on database_name.customer_v2 (ativo);

/* The default engine of MySQL doesn't support the
creation of a hash index, to turn this possible, at 
the creation of the table that we'll change we need to set the db engine that we want to use on that table, like the example below
*/

create table example(
  id int primary key auto_increment,
  nome varchar(60),
  ativo boolean not null default true,
  email varchar(80)
)engine = MEMORY;

/* Now we can create a hash index */
create index idx_hash_ativo on example(ativo) using hash;

create index idx_btree_id on example(id) using btree;
show index from examples;
