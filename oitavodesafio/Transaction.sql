-- Part 1
select @@autocommit;
set @@autocommit = 0;

show session variables like '%isolation';
set session transaction isolation level read committed;

start transaction;
select concat(Fname,'',Minit,'. ',Lname) as Name,
		Sex,Salary,Dependent_Name 
        from employee e
        Inner Join Dependent d on
        e.Ssn = d.Essn and Salary > 30000;
commit;

start transaction;
update employee set salary = 30000 where 
	Dno = 1;
commit;

-- Part 2
delimiter *
create procedure new_employe(Proname varchar(15),Num int,Ploc varchar(15),Dnum int)
begin
    declare exit handler for sqlexception
    begin
		show errors limit 1;
        rollback to savepoint before_last_insert;
    end;
    start transaction;
	savepoint before_last_insert;
	insert into project values(Proname,Num,Ploc,Dnum);
    commit;
end *
delimiter ;
call new_employe('','','','');
-- Part 3

