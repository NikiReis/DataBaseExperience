DESC DEPARTAMENT;
use company;
/* Thinking in how the company will grow, at some point we'll need
	new departaments */
    
drop procedure new_departament;

DELIMITER //
create procedure new_departament(
	in Dname_p varchar(30),
	in Dnumber_p int,
	in Dept_create_date_p date
)
	begin
			insert into departament (Dname,Dnumber,Dept_create_date) 
				values(
					Dname_p,Dnumber_p,Dept_create_date_p
				);
	end //
DELIMITER ;

call new_departament('Financeiro',7,null);