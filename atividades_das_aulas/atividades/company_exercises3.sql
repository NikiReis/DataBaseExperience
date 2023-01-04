select distinct * from works_on
	where(Pno,Hours) in (select Pno,Hours
		from works_on where Essn='123456789');
        
Select concat(Fname,' ',Lname) as Employee_Name,Dependent_Name from employee as e, dependent as d
where exists (select * from dependent
where e.Ssn = d.Essn);

select concat(Fname,' ',Lname) as Employee_Name from employee as e 
where exists (select * from dependent as d 
where e.Ssn = d.Essn);

select concat(Fname,' ',Lname) as Employee_Name, Dependent_Name,
Relationship from employee as e, dependent as d
where exists (select * from dependent 
where e.Ssn = d.Essn and d.Relationship='Daughter');

select concat(Fname,' ',Lname) as Employee_Name, Dependent_Name,
Relationship from employee as e, dependent as d
where exists (select * from dependent 
where e.Ssn = d.Essn);

select concat(Fname,' ',Lname) as Employee_Name from employee as e 
where not exists (select * from dependent as d 
where e.Ssn = d.Essn);

select concat(e.Fname,' ',e.Lname) as Employee_Name from employee as e, departament as d
where (e.Ssn = d.Mgr_ssn) and exists (select * from dependent as d where e.Ssn = d.Essn);

select concat(e.Fname,' ',e.Lname) as Employee_Name from employee as e
where (select count(*)from dependent where Ssn = Essn)>2;

select fname, lname, dno from employee
where dno =  5 order by (lname) desc limit 4;

select distinct d.Dname, concat(e.Fname,' ',e.Lname) as Manager,
Address from departament as d, employee as e, works_on as wk, project as p
where (d.Dnumber = e.Dno and e.Ssn = d.Mgr_ssn and wk.Pno = p.Pnumber)
order by Manager;

select d.Dname as Department, concat(e.Fname,' ',e.Lname) as employee,
p.Pname as Project_Name, Address from departament as d, employee as e,
works_on as wk, project as p where (d.Dnumber = e.Dno and e.Ssn = wk.Essn
and wk.Pno = p.Pnumber) order by Dno;
