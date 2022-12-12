create database if not exists triggersdb;
use triggersdb;

create table accounts(
	id int primary key,
	acc_num int not null,
	amount decimal(10,2)
);

create trigger chk_acc_amount before insert on accounts
for each row
	set @sum = @sum + new.amount;
    
set @sum = 0;
select * from accounts;
insert into accounts values(1,6373432,300.0),(2,5437523,0),(31,43432,-300.0);

delimiter ||
create trigger upd_check before update on accounts
	for each row
		begin
			if new.amount < 0 then 
				set new.amount = 0;
			elseif new.amount > 100 then
				set new.amount = 100;
			end if;
		end ||
delimiter ;

select * from accounts;
update accounts set amount = -50 where id = 1;