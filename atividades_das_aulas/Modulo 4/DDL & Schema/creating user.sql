use mysql;
show tables;
select * from user;

create user 'geral'@localhost identified by '123456';
-- aplica todos os privilégios para em cima de todas as tabelas do bd 'testuser' para o usuário 'geral';
grant all privileges on testuser.* to 'geral'@localhost;

-- garante acesso a todos os banco de dados e consequentemente a todas as tabelas de todos os bancos de dados
-- para o usuário 'geral'
grant all privileges on *.* to 'geral'@localhost;

