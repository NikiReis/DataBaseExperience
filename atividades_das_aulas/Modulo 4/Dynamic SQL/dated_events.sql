-- DATED EVENTS
CREATE
	[DEFINER = 'user']
    EVENT
    [IF 'NOT' EXISTS]
    'event_name'
    ON SCHEDULE 'schedule'
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE|DISABLE|DISABLE ON SLAVE]
    [COMMENT 'STRING']
    do event_body;
    
'schedule:':{
	AT timestamp [+ INTERVAL interval] ...
		|EVERY INTERVAL
			[STARTS 'timestamp' [+ INTERVAL 'interval']...]
            [ENDS 'timestamp' [+ INTERVAL 'interval']...]
}

'interval':
	quantity {'YEAR'|QUARTER|MONTH|DAY|HOUR|MINUTE|
				WEEK|SECOND|YEAR_MONTH|DAY_HOUR|DAY_MINUTE|
                DAY_SECOND|HOUR_MINUTE|HOUR_SECOND|MINUTE_SECOND
			 }
             
-- ALTER TABLE IN EXISTING EVENT
ALTER EVENT 'no_such_event'
	ON SCHEDULE
		EVERY '2:3' DAY_HOUR;
-- BUT THIS WILL RETURN AN ERROR 
-- TO MYSQL PERMITS THAT WE CAN CREATE AN EVENT INSIDE THE DBMS
-- WE HAVE TO DISABLE THE '--EVENT-SCHEDULER', JUST LIKE THE SAFE MODE
-- WE CAN DO THIS BY COMMAND LINE
-- "EVENT-SCHEDULER = DISABLE"

-- PERMISSION EXAMPLE
GRANT EVENT ON myschema.*TO jon@ghidora;
REVOKE EVENT ON myschema.*FROM jon@ghidora;

-- MODIFING AN EVENT 
ALTER
	[DEFINER = 'user']
	EVENT 'event_name'
    [ON SCHEDULE 'schedule']
    [ON COMPLETION ['NOT'] PRESERVE]
    [RENAME TO 'new_event_name']
    [ENABLE|DISABLE|DISABLE ON SLAVE]
    [COMMENT 'string']
    [DO event_body]
    
-- MODIFING AN EVENT EXAMPLE
ALTER EVENT total_de_employees
	ON SCHEDULE
		EVERY 1 DAY
        STARTS CURRENT_TIME + INTERVAL 1 SECOND ;
        
-- CREATING AN EVENT EXAMPLE
CREATE EVENT e_hourly
	ON SCHEDULE
		EVERY 1 HOUR
	COMMENT 'Clears out session table each hour'
    DO
		DELETE FROM site_activity.sessions;
        
    
    