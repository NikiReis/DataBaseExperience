-- EXAMPLE OF A TRIGGER
-- WE CAN SEARCH THE TRIGGERS THAT WE HAVE BY USING MYSQL.TRIGGERS STATEMENT

-- EXAMPLE
SELECT TRIGGER_NAME,EVENT_MANIPULATION,EVENT_OBJECT_TABLE,ACTION_STATEMENT
FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_SCHEMA='DBNAME';

-- ANOTHER EXAMPLE
CREATE TABLE ACCOUNT (ACC_NUM INT,AMOUNT DECIMAL(10,2));
CREATE TRIGGER INS_NUM BEFORE INSERT ON ACCOUNT
	FOR EACH ROW SET @num = @sum + NEW.amount;
    
USE COMPANY_CONSTRAINTS;
SHOW TABLES;
DESC EMPLOYEE;
SELECT * FROM EMPLOYEE;
/*
CREATE 
	[DEFINE = user]
    TRIGGER [IF NOT EXISTS] trigger_name
    trigger_time trigger_event
    ON table_name FOR EACH ROW
    [trigger_order]
    trigger_body
    
    trigger_time: {BEFORE|AFTER}
    trigger_event: {INSERT|UPDATE|DELETE}
    trigger_order: {FOLLOWS|PRECEDES} other_trigger_name
*/
-- BEFORE STATEMENT  EXAMPLE
# SETTING MANAGERS BY DEPARTMENT

DELIMITER ||
CREATE TRIGGER MRG_EMPLOYEE_CHECK BEFORE INSERT ON
EMPLOYEE FOR EACH ROW
	BEGIN
		CASE NEW.Dno
			WHEN 1 THEN SET NEW.SUPER_SSN = '333445555';
			WHEN 2 THEN SET NEW.SUPER_SSN = NULL;
			WHEN 3 THEN SET NEW.SUPER_SSN = NULL;
			WHEN 4 THEN SET NEW.SUPER_SSN = '123456789';
            WHEN 5 THEN SET NEW.SUPER_SSN = '987654321';
		END CASE;
    END ||
DELIMITER ;

DELIMITER ||
CREATE TRIGGER MRG_DEPART_CHECK BEFORE INSERT ON
DEPARTAMENT FOR EACH ROW
	BEGIN
		CASE Dno
			WHEN 1 THEN SET NEW.MGR_SSN = '333445555';
			WHEN 2 THEN SET NEW.MGR_SSN = NULL;
			WHEN 3 THEN SET NEW.MGR_SSN = NULL;
			WHEN 4 THEN SET NEW.MGR_SSN = '123456789';
            WHEN 5 THEN SET NEW.MGR_SSN = '987654321';
		END CASE;
    END ||
DELIMITER ;

SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('João', 'B', 'Smith', '123456759', '1965-01-09', '731-Fondren-Houston-TX', 'M', '32000.00', NULL, '5'); 
SHOW TRIGGERS FROM COMPANY_CONSTRAINTS;

-- AFTER INSERT TRIGEGRS
-- VERIFIES IF SOME NULL VALUE THAT 'ALTER' WASN'T PASS
-- ADD A MESSAGE FOR THE USER

CREATE TABLE USER_MESSAGES(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    MESSAGE VARCHAR(120),
    SSN CHAR(9),
	CONSTRAINT FK_SSN_MESSAGE FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN)
);

DELIMITER $$
CREATE TRIGGER NULL_VALUE_CHK AFTER INSERT ON EMPLOYEE
FOR EACH ROW 
	BEGIN -- NOT NECESSARY USE THE 'BEGIN' STATEMENT, BUT FOR A PERSONAL PREFERENCE I USED
		IF(NEW.Address IS NULL) THEN 
			INSERT INTO USER_MESSAGES (MESSAGE,SSN) VALUES(CONCAT('PLESE ',NEW.FNAME,', UPDATE YOUR ADDRES'),NEW.SSN);
        ELSE
			INSERT INTO USER_MESSAGES (MESSAGE,SSN) VALUES(CONCAT('ERROR ',NEW.FNAME),NEW.SSN);
        END IF;
	END $$
DELIMITER ;

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  
VALUES ('FERWE', 'B', 'Smith', '143489824', '1965-08-10', 'FSDFWEGWE', 'F', '35000.00', '123456789', '5');

SELECT * FROM EMPLOYEE;
SELECT * FROM USER_MESSAGES;



-- before update statement
# Atribuindo aumento de salário para um dept específico = 1 salary = salary * 1.20;


-- before delete statement
# salvando em outra tabela os employees demitidos
# old.attribute



create database if not exists triggersdb;
use triggersdb;

create table accounts(
	id int primary key,
	acc_num int not null,
	amount decimal(10,2)
);

create trigger chk_acc_amount before insert on accounts
for each row
	set @sum = @sum + new.amount;
    
set @sum = 0;
select * from accounts;
insert into accounts values(1,6373432,300.0),(2,5437523,0),(31,43432,-300.0);

delimiter ||
create trigger upd_check before update on accounts
	for each row
		begin
			if new.amount < 0 then 
				set new.amount = 0;
			elseif new.amount > 100 then
				set new.amount = 100;
			end if;
		end ||
delimiter ;

select * from accounts;
update accounts set amount = -50 where id = 1;
