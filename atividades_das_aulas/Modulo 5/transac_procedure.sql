SELECT @@autocommit;
SET @@autocommit = 0;
delimiter ?? 
CREATE PROCEDURE sql_fail()
BEGIN 
	-- BETTER ERROR HANDLER DECLARATION, THIS ONE ISN'T DEPRECATED
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS LIMIT 1;
		ROLLBACK;
    END;
    START TRANSACTION;
    
   -- SELECT @nextorder := max(orderNumbers) + 1 as Next_Number
	-- FROM orders;
    
    INSERT INTO orders VALUES(@nextorder,'2012-09-21','2012-09-21','2012-09-27','Despachado',4);
	INSERT INTO ordersdetails VALUES(@nextorder,'21_623',27,57.69),(@nextorder,'11_623',13,31.69);
    COMMIT;
    
END ??
DELIMITER ;

call sql_fail();