-- This one is the IF Statement 
IF search_condition THEN statement_list
  [ELSEIF search_condition THEN statement_list]...
  [ELSE statement_list]
END IF;
	
  !=

-- And this one is IF Function, the're COMPLETELY DIFFERENT
SELECT IF(1>2,2,3);
SELECT IF(1<2,'yes','no');
SELECT IF(STRCMP('test','test1'),'yes','no');

-- IF Function 
create table tmp select IFNULL(1,'TEST') as test;
describe tmp;

-- IF inside function

DELIMITER //
CREATE FUNCTION SimpleCompare(n INT,m INT)
	RETURNS VARCHAR(20)
    BEGIN 
		DECLARE s VARCHAR(20);
        IF n > m THEN SET s = '>';
			ELSEIF n = m THEN SET s = '=';
			ELSE SET s = '<';
		END IF;
        SET s = CONCAT(n, ' ',s,' ',m);
		RETURN s;
	END //
DELIMITER ;