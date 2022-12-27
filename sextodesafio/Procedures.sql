desc departament;
use company;
/* Thinking in how the company will grow, at some point we'll need
	new departaments */
    
drop procedure new_departament;

delimiter //
create procedure new_departament(Dname_p varchar(30),Dnumber_p int,Dept_create_date_p date)
	begin
		insert into departament (Dname,Dnumber,Dept_create_date) values(Dname_p,Dnumber_p,Dept_create_date_p);
	end //
delimiter ;

call new_departament('Financeiro',7,null);

delimiter ||
create procedure data_manipulation(num int, dpt_num int,in dept_loc varchar(40))
begin
    
	case num
		when 1 then
			insert into departament(Dnumber,Dname,Dept_create_date) values (dpt_num,dept_loc,current_date());
            select * from company.departament;
		when 2 then 
			delete from departament where Dnumber = dept_num;
            select * from company.departament;
		when 3 then
			update departament set Dname = 'Research' where Dnumber = dept_num;
            select * from company.departament;
		else
			select * from company.departament;
	END CASE;
end ||
delimiter ;
drop procedure data_manipulation;
call data_manipulation(null,null,'');
