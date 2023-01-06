SELECT @@autocommit;
SET @@autocommit = 0;
delimiter ?? 
CREATE PROCEDURE sql_fail1()
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
		-- ERROR HANDLER DECLARATION DEPRECATED SINCE V5.5
		GET DIAGNOSTICS CONDITION 1
			@P2 = MESSAGE_TEXT;
            SELECT @P2 as Transaction_Error;
            ROLLBACK;
    END;
    START TRANSACTION;
    
     -- SELECT @nextorder := max(orderNumbers) + 1 as Next_Number
		-- FROM orders;
    
    INSERT INTO orders VALUES(14,'2012-09-21','2012-09-21','2012-09-27','Despachado',4);
	INSERT INTO ordersdetails VALUES(14,'21_623',27,57.69),(14,'11_623',13,31.69);
    COMMIT;
    
END ??
DELIMITER ;

drop procedure sql_fail1;
call sql_fail1();