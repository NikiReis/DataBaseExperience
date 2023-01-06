/*Save point example*/
/* A pratical example of a Savepoint */
START TRANSACTION ;
UPDATE PRODUCT SET date_retired = CURRENT_TIMESTAMP() WHERE product_cd = 'XYZ';
  SAVEPOINT before_close_accounts;

  UPDATE account SET status = 'CLOSED',close_date = CURRENT_TIMESTAMP(),
  last_activity_date = CURRENT_TIMESTAMP()
  WHERE product_cd = 'XYZ';
  ROLLBACK TO SAVEPOINT before_close_accounts;
  COMMIT;