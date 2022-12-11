-- CREATING OPERATIONS ABOUT DATA INSIDE A PROCEDURE ON MYSQL

call insert_into_employee2(
'Joaquim','C','Diesmtricht','57849682','1995-03-11','731-Fondren-houston-TX','M','55000.0','123456789','2'
);

SELECT * FROM EMPLOYEE;

CREATE DATABASE test_proc;
USE test_proc;

CREATE TABLE USER(
	id int auto_increment primary key not null,
    nome varchar(20) not null,
    senha varchar(40) not null,
    data_cadastro datetime
);

desc user;

DELIMITER ||
CREATE PROCEDURE procedure_test(
	IN nome_p varchar(20),
    IN senha_p varchar(10)
)
BEGIN
	IF(LENGTH(SENHA_P) < 10 AND LENGTH(SENHA_P) > 7) THEN
		INSERT INTO USER (NOME,SENHA,DATA_CADASTRO) VALUES(NOME_P,md5(SENHA_P),NOW());
		SELECT * FROM USER;
	ELSE
		SELECT 'FAVOR, FORNCA UMA SENHA MAIS FORTE' AS MESSAGE_ERROR;
	END IF;
END ||
DELIMITER ;

CALL procedure_test('Linek','FrpxtZzy12@,%zyqwe%$&');

SELECT MD5('Ssqk12@') AS SENHA;

SELECT LENGTH('FEFWEASDA') AS SENHA;
