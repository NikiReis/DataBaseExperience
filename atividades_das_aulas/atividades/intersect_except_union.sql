create database if not exists test;
use test;

create table R(
	A char(2)
);

create table S(
	A char(2)
);

insert into R(A) values ('a1'),('a2'),('a3');
insert into S(A) values ('a1'),('a2'),('a3'),('a4'),('a5');

-- exemplo de operador except
select * from S where A not in (select A from R);

-- union
select distinct R.A from R
	union
    select distinct S.A from S;
    
-- intersect 
select R.A from R where R.a in (select S.a from S);
-- intersect 
select R.A as Valores_Comuns from R inner join S on R.a = S.a;
-- intersect 
select * from R inner join S on R.a = S.a;


