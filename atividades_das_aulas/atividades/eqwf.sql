use company_constraints;

show tables;

select * from departament;


select Fname, Salary, Dno from employee;

update employee set Salary = 
	case 
		when Dno=4 then Salary + 2500
		when Dno=1 then Salary + 1300
        when Dno=5 then Salary + 3500
        else Salary + 0 
    end;
    
select * from works_on;
    
select e.fname, e.lname, p.pname from employee as e join project p;
 
    