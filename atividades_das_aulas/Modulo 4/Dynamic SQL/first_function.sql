show databases;
use company_constraints;
show tables;

create function first_function (numa decimal(10,2),numb int)
	returns int deterministic 
    return numa *numb;
    
select first_function(9.3,4) as multiply;