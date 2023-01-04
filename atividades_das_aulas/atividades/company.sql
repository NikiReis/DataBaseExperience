create schema if not exists company_constraints;
use company_constraints;

CREATE TABLE employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary> 2000.0),
    constraint pk_employee primary key (Ssn)
);

alter table employee 
	add constraint fk_employee 
	foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

alter table employee modify Dno int not null default 1;

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
    constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn),
    foreign key (Mgr_ssn) references employee(Ssn)
);


create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);


create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);


insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5),

							('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000,123456789, 5),
                            ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
                            ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, null, 4),
                            ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 987654321, 5),
                            ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
                            ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 123456789, 4),
                            ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, 333445555, 1);
                            
insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');                          
                            
 insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

insert into dept_locations values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');                           
                            
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4)
;

insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
                            (666884444, 3, 40.0),
                            (453453453, 1, 20.0),
                            (453453453, 2, 20.0),
                            (333445555, 2, 10.0),
                            (333445555, 3, 10.0),
                            (333445555, 10, 10.0),
                            (333445555, 20, 10.0),
                            (999887777, 30, 30.0),
                            (999887777, 10, 10.0),
                            (987987987, 10, 35.0),
                            (987987987, 30, 5.0),
                            (987654321, 30, 20.0),
                            (987654321, 20, 15.0),
                            (888665555, 20, 0.0);
-- gerentes e seus departamentos
select SSn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- trabalhadores e seus respectivos dependentes
select Fname,Dependent_name,Relationship from employee, dependent where employee.Ssn = dependent.Essn;

-- procura por pessoa específica
select Bdate, Address from employee
		where Fname = 'John' and Minit = 'B' and Lname = 'Smith';

-- recuperando departamento específico
select * from departament where Dname = 'Research';

-- recupera os nome dos empregados do departamento 'Research'
select Ssn,Fname, Minit, Lname,Address from employee, departament
	where employee.Dno = departament.Dnumber and Dname = 'Research';
    
select Pname,Ssn,Fname, Hours 
from project, works_on,employee 
where Pnumber = Pno
and Essn = Ssn;

desc departament;
desc dept_locations;

select * from departament;
select * from dept_locations;

select Dname, l.Dlocation as Department_name from departament as d, dept_locations as l
	where d.Dnumber = l.Dnumber;
 
-- recupera os nomes dos empregados, junto com os seus salários e os seus salários com um aumento de 10%
select concat(Fname,' ',Minit,'. ',Lname) as Employee_Name,Salary,
	round(Salary*1.1,2) as Employee_New_Salary from employee;


-- recupera os nomes dos egrentes que trabalham em um projeto associado a um produto específico 
	-- e dá um acréscimo de 10% no salário
    
select concat(Fname,' ',Minit,'. ',Lname) as Employee_Name,Ssn,Bdate,Address,Salary,round(Salary*1.1,2) as New_Salary
	from employee e,works_on wo,project p
	where e.Ssn = wo.Essn and wo.Pno = p.Pnumber and p.Pname = 'ProductX';


desc project;
