use company_constraints;

desc employee;
desc works_on;


-- cross join
select * from employee join works_on on Ssn = Essn;

select * from employee, works_on where employee.Ssn = works_on.Essn;

select * from employee join departament on Ssn = Mgr_ssn;

select Fname, Lname, Address from 
(employee e join departament on Dno = Dnumber)
where Dname = 'Research';

select * from dept_locations;
select * from departament;

select Dname,Dept_create_date,Dlocation from
(departament join dept_locations using (Dnumber))
order by Dept_create_date;


