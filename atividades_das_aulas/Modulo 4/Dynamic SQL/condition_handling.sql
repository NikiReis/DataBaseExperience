-- example of condition_handling 
DECLARE condition_name CONDITION FOR condition_value
	condition_value: {
		my_sqlerror_code
	  | SQLSTATE [VALUE] sqlstate_value
    }
    
-- example 
-- ERROR 1146(4S02): Table 'table_name' doesn't exist
-- Error Number: 1002
-- Symbol: ER_NO; SQLSTATE: HY000
-- Message: NO
-- Used in the construction of other messages.

-- declare handler

DECLARE handler_condition HANDLER
	FOR condition_value[, condition_value] ...
    statement
    
handler_action: {
	CONTINUE
    |EXIT
    |UNDO
}

condition_value: {
	mysql_error_code
    | SQLSTATE [VALUE] sqlstate_value
    | condition_name
    | SQLWARNING 
    | NOT FOUND
    | SQLEXCEPTION
}

-- HANDLER_ACTIONS
-- + CONTINUE
-- + EXIT 
-- + UNDO

-- Simple examples
DECLARE CONTINUE HANDLER FOR NOT FOUND
	BEGIN
		-- body of handler
	END
    
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN 
		-- body of handler
	END
    
DECLARE no_such_table CONDITION FOR 1051 (ERROR CODE)
DECLARE CONTINUE HANDLER FOR no_such_table
	BEGIN 
		-- body of handler
	END
    
DECLARE no_such_table CONDITION FOR SQLSTATE '42S02'
DECLARE CONTINUE HANDLER FOR no_such_table
	BEGIN
		-- body of handler
	END;