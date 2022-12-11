use company_constraints;
select * from employee;
select * from departament;

delimiter //
create procedure procedure_test()
begin
-- procedimento

-- instrucoes sql
end ;

-- First Example

delimiter $$
create procedure info_employee()
begin 
	select * from employee;
end $$
delimiter ;
call info_employee;

drop procedure info_employee;

-- Second Example

delimiter $$
create procedure info_employee()
begin 
	select * from employee inner join departament on Ssn = Mgr_Ssn;
end $$
delimiter ;
call info_employee;
