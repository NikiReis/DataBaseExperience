-- Looping
-- example of a loop inside of a procedure 

[begin_label:]LOOP
	statement_list
END LOOP[end_label]

CREATE PROCEDURE do_iterate(p1 INT)
	BEGIN 
		label1: LOOP
			SET p1 = p1 + 1;
			IF p1 < 10 THEN 
				ITERATE label1;
			END IF;
			LEAVE label1;
		END LOOP label1;
        SET @x = p1;
	END;
    
-- example of REPEAT LOOP
[begin_label:]REPEAT
	statement_list
UNTIL serach_condition
END REPEAT[end_label]

-- example of a repeat inside of a procedure
DELIMITER ||
CREATE PROCEDURE do_repeat(p1 INT)
	BEGIN 
		SET @x = 0;
        REPEAT 
			SET @x = @x + 1;
		UNTIL @x > p1 END REPEAT;
	END ||
CALL do_repeat(1000)||

SELECT @x ||
	
-- example of a while inside  a procedure
[begin_label:] WHILE search_condition DO
	statement_list
END WHILE[end_label]

CREATE PROCEDURE do_while()
BEGIN 
	DECLARE v1 INT DEFAULT 5;
    WHILE v1 > 0 DO
		...
        SET v1 = v1 - 1;
	END WHILE;
END;

call do_while;
select v1;


-- ITERATE label : Keeps the loop
-- LEAVE lavel : Stop condition
-- RETURN label : Ends and return