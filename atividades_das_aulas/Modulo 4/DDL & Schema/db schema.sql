-- modelo de alter database
alter {database/schema}[db_name] alter_option..
-- alter modelo
alter_option{
[default] character set [=] charset_name
[default] collate [=] collattion_name
[default] encryption [=] {Y/N}
read only [=] default /0/1}
}

check (select count(*) from turmaaluno 
group by idturma having count(*) <= 40);

check (select * from empregado e,gerente g
where e.Id_gerente = g.id and e.salario < 
g.salario)

select table_name,table_type from information_schema.tables
where table_schema = 'sakila' order by 1;

select table_name, table_type from information_schema.tables
where table_schema = 'sakila' and table_type = 'base table'
order by 1;

select column_name, data_type, character_maximum_lenght char_max_len,
numeric_precision num_prcsn, numeric_scale num_scale
from information_schema.columns where table_schema = 'sakila' and table_name
= 'film' order by ordinal_position;

show databases;

use sys;

show tables like 'schema%';

select * from schema_auto_increment_columns;
select * from schema_index_statistics;
select * from sys.hosts_summary_by_file_io;
select * from sys.hosts_summary;

show create view sys.session;
show tables like '%list';
select * from ecomerce.processlist;

show tables like '%session';
select * from ecomerce.session;

-- infrmation schema
show databases;
show tables like '%constraints';
select * from information_schema.keywords;
select * from information_schema.tables where table_schema = 'company_constraints';
select * from information_schema.CHECK_CONSTRAINTS;
select * from information_schema.referential_constraints where constraint_schema = 'company_constraints';
