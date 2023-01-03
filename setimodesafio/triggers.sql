/* creating a table to set the possibles errors of insert statment
	activated by an 'after insert' trigger
*/
create table if not exists alerts_error_box(
	Ssn char(9) not null,
    message varchar(220),
    error_date date
);

-- before delete trigger
/*
creating a table to save the data of future fired employees
*/
create table if not exists fired_employees(
	Ssn char(9),
    Fname varchar(40),
    Minit varchar(30),
    Lname varchar(40),
    Bdate date,
    Address Varchar(70),
    Genre char(1),
    Salary decimal(10,2),
    Super_Ssn char(9),
    Departament_Number int
);

delimiter %%

/*
this trigger save all the data of the employee that is going to be 
	fired into 'fired_employees' table before his data get deleted 
    from the active (and main) employees table.
*/
create trigger chk_user_data before delete on employee
	for each row
    begin 
		insert into fired_employees(Ssn,Fname,Minit,Lname,Bdate,Address,Genre,Salary,Super_Ssn,Departament_Number) 
        values (
					old.Ssn,
					old.Fname,
					old.Minit,
					old.Lname,
					old.Bdate,
					old.Address,
					old.Sex,
                    			old.Salary,
                    			old.Super_ssn,
                    			old.Dno
				);
	end %%
delimiter ;

delete from fired_employees where Ssn = '121254321';
drop table fired_employees;
drop trigger chk_user_data;

insert into employee values ('Linek','F','Reis','121254321','2001-12-12','ZP-181-65-Brasilia-DF','M',450000.00,'123456789',5);
delete from employee where Ssn = '121254321';

SELECT * FROM company.employee;
SELECT * FROM company.fired_employees;

select * from information_schema.triggers;
select * from information_schema.triggers where trigger_schema = 'Company';

-- before update trigger
/*
	This trigger has the objective of deny any try of update salary
    of e employee to a null value, if a try is going to be done, this trigger 
    will set the salary to a default value of 30 thousand
    dollars, and this way dening a null value in the table
*/
delimiter ??
create trigger employee_salary before update on employee
	for each row
    begin
		if new.Salary is null then
			set new.Salary = 30000;
        end if;
    end ??
delimiter ;

update company.employee set Salary = null where Ssn = '121254321';
drop trigger employee_salary;

-- after insert 
/*
	This trigger will insert into alerts_error_box an error message
    that explains that the salary of the new employee or the address, or even them both
    were set as null, and a update is required, this trigger will insert the date 
	of this error has occurred, and also the Ssn of the related employee.
*/
delimiter {}
create trigger new_employee before insert on employee
	for each row
    begin
		if (new.Salary is Null or new.Address is Null) then 
			insert into alerts_error_box values(
					new.Ssn,
					concat("Please,",New.Lname,", update your salary or your address, one or both of the attributes was set as NULL"),
					current_date()
                );
		end if;
	end {}
delimiter ;

drop trigger new_employee;

-- script to test the after insert trigger 
insert into employee values ('Kenil','F','Seir','998754321','2001-12-12','ZP-181-65-Sao Paulo-SP','M',NULL,'123456789',5);

/* updating the date of an error in the alerts_error table
to validate a schedule event that every day deletes error messages 
that are older than 60 days.
*/
update alerts_error_box set error_date='2022-12-22' where Ssn = '998754321';


/*
create a daily event that delete those error messages that 
are older than 60 days from the alerts_error_box table.
*/
create event rmv_msg 
	on schedule
		every 1 day
	comment 'Removing old messages'
    do
		delete from alerts_error_box where current_date - error_date > 60;

drop event rmv_msg;
