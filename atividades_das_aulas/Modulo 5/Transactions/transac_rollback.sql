select @@autocommit;
set @@autocommit = 0;

start transaction;
	select @nextorder := max(ordernumbers) + 1 as "Next Number"
		from orders;

	insert into orders values(@nextorder,'2005-5-31','2005-6-10','2005-6-11','Despachado',3);
    
    select orderNumbers from orders;
    savepoint insert_order_save;
    
    
    -- New Insert Into OrdersDetails
    
    insert into ordersdetails values (@nextorder,19213,25,126.78);
    
    savepoint insert_ordersdetails_save;
    rollback to savepoint insert_order_save;
    rollback; -- total rollback
    commit;