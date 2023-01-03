DESC employee;

alter table employee add index employee_salary(Salary);
alter table employee add index employee_department(Dno);
alter table employee add index employee_name(Fname);
alter table dependent add index father_mother_code(Essn);
alter table dependent add index relation_dependent(Relationship);
alter table project add index project_location(Plocation);
alter table departament add index mgr_start_at_dept_idx(Mgr_start_date);
alter table departament add index dept_create_dt_idx(Dept_create_date);

/* What is the department with more employees */
select count(*) as Qtd_Pessoas,Dnumber, Dname, 
	Dept_create_date from departament d 
    left join employee e on e.Dno = d.Dnumber
    group by Dnumber order by Qtd_Pessoas desc;
    
/* What are the departments by City */
select Dnumber,Dname,Dlocation from 
	dept_locations natural join
	departament order by Dnumber desc;

/* Relation of employee by department */
	select Dnumber,Dname,CONCAT(Fname,' ',Minit,' ',Lname) as 
		Employee_Name from Employee e Left Join
		Departament d on e.Dno = d.Dnumber
        order by d.Dnumber desc;
    
/* Top 5 most well payed employees */
select Ssn,CONCAT(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Salary,Dnumber,Dname from employee e 
    Left Join Departament d on e.Dno = d.Dnumber
    order by Salary desc Limit 5;

/* Project's name and their respective department order by city*/
select Pnumber,Pname,Plocation,Dname
	from project p Inner Join departament d
    on p.Dnum = d.Dnumber order by Pnumber,Plocation;

/* Relation of Employees and their dependents*/    
select Essn as ID_Employee,CONCAT(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Dependent_name,Relationship
    from dependent d Inner Join Employee e
    on d.Essn = e.Ssn order by Essn;
    
/* Employees and the projects that they're on */
select Ssn as ID_Employee,
	concat(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Pname,Plocation,Dname 
    from employee e inner join departament d
    on e.Dno = d.Dnumber inner
    join project p on p.Dnum = d.Dnumber
    order by ID_Employee;

/* Employees and the projects that they're on 
that the city location is Houston */    
select Ssn as ID_Employee,
	concat(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Pname,Plocation,Dname 
    from employee e inner join departament d
    on e.Dno = d.Dnumber inner
    join project p on p.Dnum = d.Dnumber
    where Plocation = 'Houston'
    order by ID_Employee;
    
    
    
