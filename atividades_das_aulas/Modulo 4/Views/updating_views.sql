-- update de modificacao / atualizacao de insancia

create or replace view active_custumer_vw
(custumer_id,first_name,last_name,email)
as 
select custumer_id,first_name,last_name,
concat(substr(email,1,2)'*****',substr(email,-4))email 
from custumer ;

update custumer_vw 
set last_name = 'SMITH-ALLEN'
where custumer_id = 1;

select first_name,last_name,email
from custumer 
where custumer_id = 1;

-- -=-=-=-=-=-=-=-=-

use company_constraints;
show tables;

select * from employees_salary_27000_view;

update employees_salary_27000_view
	set Dept_number = 1
    where Salary = 30000.00;
    
    update employees_salary_27000_view
	set Dept_number = 5
    where Name = 'JohnBSmith';
    
select * from employees_dependent_view;

-- gera um erro por tentar atualizar duas tables ao mesmo tempo
update employees_dependent_view
	set Dependent  = 'John' and Name = 'Father'
    where Departament = 4;