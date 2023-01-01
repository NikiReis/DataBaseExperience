-- Numero de empregados por departamento e cidade
create or replace view number_of_empl
	AS 
	select 
		count(distinct(Ssn)) AS "Quantity",
		Dname AS "Department's Name",
		Dlocation AS "Department's Location"
	from 
		employee e 
	left join 
		departament d on e.Dno = d.Dnumber 
	inner join
		dept_locations dl on d.Dnumber = dl.Dnumber
	group by d.Dname;
    
-- chama a view    
select * from number_of_empl;

-- Lista de departamentos e seus gerentes 
create or replace view Mgr_Dept
    AS
	select 
		concat(substr(Mgr_ssn,1,2),'*****',substr(Mgr_ssn,-2)) AS "Manager's ID", 
		concat(Fname,' ',Minit,'. ',Lname) as "Manager",
		Dnumber AS "Department's Number", 
		Dname AS "Department's Name"
	from 
		employee e,departament d
	where
		d.Mgr_ssn = e.Ssn 
	order by Dnumber desc;
            
-- chama a view
select * from Mgr_Dept;

-- Projetos com maior número de empregados (ex: por ordenação desc) 
create or replace view Emp_Project 
	AS
	select 
		count(Ssn) AS "Quantity",
		Pno AS "Project's Number",
		Pname AS "Project's Name",
		Dnum AS "Department's Number"
    from 
		employee e
	left join works_on wk on 
		e.Ssn = wk.Essn 
	inner join project p
		on wk.Pno = p.Pnumber
    group by p.Pnumber order by Pno desc;
    
-- chama a view    
select * from Emp_Project;

-- Lista de projetos,departamentos e gerentes
create or replace view dept_mgr_prj_list 
	AS
	select 
		Pname AS "Project's Name",
		Plocation AS "Project's Location",
		Dname AS "Department's Name",
		concat(substr(Mgr_ssn,1,2),'*****',substr(Mgr_ssn,-2)) as "Manager Department's ID"
    from 
		departament d
    left join project p on
		d.Dnumber = p.Dnum
	order by
		Dname,Pname
	desc;
    
-- chama a view  
select * from dept_mgr_prj_list ;


-- Quais empregados possuem dependentes e se são gerentes
create or replace view emp_dependent
	AS
    select 
		concat(Fname,' ',Minit,'. ',Lname) AS "Employee's Name",
        Super_ssn AS "Employee's Manager",
		Dependent_Name as "Dependent's Name",
        Relationship 
	from
		employee e
	inner join dependent d on
		e.Ssn = d.Essn
	order by
		Super_Ssn 
	asc;

-- chama a view             
select * from emp_dependent;

-- Creating,granting and revoking privileges (to/from) users;

create user 'linek'@localhost identified by 'ZZghtq12';
create user 'company_owner'@localhost identified by 'Manager123';

grant all privileges on company.* to 'company_owner'@localhost;
grant select on company.* to 'linek'@localhost;

revoke select on company.* from 'linek'@localhost;
grant select on company.mgr_dept to 'linek'@localhost;



