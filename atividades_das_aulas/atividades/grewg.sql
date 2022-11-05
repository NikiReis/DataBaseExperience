select nm_assinante as Nome_Assinante, concat(ddd,' ',fone_num) as Telefone,count(*)
from assinante as a inner join endereco as e on e.cd_assinante = a.cd_assinante
join telefone as t on e.cd_endereco = t.cd_endereco having count(t.cd_endereco)>2;


select nm_assinante as Nome_Assinante, concat(ddd,' ',fone_num) as Telefone
from assinante as a inner join endereco as e on e.cd_assinante = a.cd_assinante
join telefone as t on e.cd_endereco = t.cd_endereco having count(nm_assinante)>1;

select nm_assinante as Nome_Assinante, concat(ddd,' ',fone_num) as Telefone
from assinante as a inner join endereco as e on e.cd_assinante = a.cd_assinante
join telefone as t on e.cd_endereco = t.cd_endereco having count(t.cd_endereco)>2;
 
 
 use company_constraints;
 
 
select concat(Fname,' ',Lname) as Employee_Name, Dno as Departament_Name,
Pname as Project_Name, Pno as Project_Number, Plocation as Project_Location
from employee inner join works_on on Ssn = Essn
inner join project on Pno = Pnumber
where Pname like 'Product%'
group by Pnumber
order by Pnumber;

select * from departament 
inner join dept_locations using(Dnumber)
Inner Join employee on Ssn = Mgr_Ssn;

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary,
round(Salary*0.05,2) as Bonus from departament inner join dept_locations
using(Dnumber) Inner join employee on Ssn = Mgr_Ssn;


select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary,
round(Salary*0.05,2) as Bonus from departament inner join dept_locations
using(Dnumber) Inner join employee on Ssn = Mgr_Ssn group by Dnumber;

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary,
round(Salary*0.05,2) as Bonus from departament inner join dept_locations
using(Dnumber) Inner join employee on Ssn = Mgr_Ssn group by Dnumber
having count(*)>1;

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary,
round(Salary*0.05,2) as Bonus from departament inner join dept_locations
using(Dnumber) Inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_Ssn
group by Dnumber
having count(*)>1;

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary,
round(Salary*0.05,2) as Bonus from departament inner join dept_locations
using(Dnumber) Inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_Ssn
group by Dnumber;