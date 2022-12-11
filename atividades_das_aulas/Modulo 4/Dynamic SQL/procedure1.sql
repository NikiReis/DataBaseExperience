-- This one is the CASE STATEMENT
CASE WHEN search_condition THEN statement_list
	[WHEN search_condition THEN statement_list]...
    [ELSE statement_list]
END CASE

	!=
    
-- And this one is a CASE OPERATOR, the're completely different
SELECT CASE 1 WHEN 1 THEN 'one'
	WHEN 2 THEN 'two' ELSE 'more' END;
SELECT CASE WHEN 1>0 THEN 'true' ELSE 'false' END;
SELECT CASE BINARY 'B'
	WHEN 'a' THEN 1 WHEN 'b' THEN 2 END;
    
Delimiter |
CREATE PROCEDURE P()
	BEGIN 
		DECLARE v INT DEFAULT 1;
        SET v = 2;
		CASE v
			WHEN 2 THEN SELECT v;
            WHEN 3 THEN SELECT 0;
            ELSE
				BEGIN
                END;
		END CASE;
	END;
|

