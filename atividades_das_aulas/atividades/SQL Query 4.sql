select count(*) from employee;
select count(*) from employee, departament
	where Dno=Dnumber and Dname = 'Research';
    
select Dno, count(*), round(avg(Salary),2) as Company_Average_Salary from employee
group by Dno;

select Dno, count(*) as Number_of_Employees, round(avg(Salary),2) as Salary_AVG from employee
group by Dno;

select Pnumber, Pname, count(*) as Number_of_Employees_by_Project
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname;

select count(distinct Salary) as Company_Distincts_Salaries from employee;
select sum(Salary) as Total_Salary, max(Salary) as Maximum_Salary, round(avg(Salary),2) as Average_Salary_of_Employees from employee;

Select sum(Salary), max(Salary), min(Salary), avg(Salary)
from employee join departament on Dno = Dnumber where Dname =
'Research';

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname
having count(*) > 2;



