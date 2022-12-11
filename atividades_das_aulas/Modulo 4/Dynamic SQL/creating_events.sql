select * from 
delimiter % 
create procedure insert_into_employee()
begin 
-- Fname,Minit,Lname, Ssn, Bdate, Address, Sex, Salary, Super_Ssn, Dno
	insert into employee values('Maria','B','Smith','123456824','1965-08-10','731-Fondren-houston-TX','F','35000.0','123456789','5');
end %
delimiter ;

desc employee;

call insert_into_employee;
select * from employee;


delimiter ||
create procedure insert_into_employee2(
	in Fname_p varchar(30),
    in Minit_p char(1),
    in Lname_p varchar(30),
    in Ssn_p char(9),
    in Bdate_p date, 
    in Address_p varchar(40), 
    in Sex_p char(1), 
    in Salary_p decimal(10,2), 
    in Super_Ssn_p char(9), 
    in Dno_p int
)    
begin
    insert into employee(Fname,Minit,Lname, Ssn, Bdate, Address, Sex, Salary, Super_Ssn, Dno)
    values(Fname_p,Minit_p,Lname_p, Ssn_p, Bdate_P, Address_p, Sex_p, Salary_P, Super_Ssn_P, Dno_p);
    
   -- select 'Insercao bem sucedidas' as Message;
   -- select 'Insercao bem sucedidas' as Message,Fname,Ssn from employee where Ssn = Ssn_p;
   select * from employee; 
end ||
delimiter ;

call insert_into_employee2('Joaquim','C','Diesmtricht','57849682','1995-03-11','731-Fondren-houston-TX','M','55000.0','123456789','2');