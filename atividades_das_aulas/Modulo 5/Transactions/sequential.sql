-- this file is a continuation of the transaction_table

-- sequential transaction
-- first transaction

START TRANSACTION;
  SELECT orderNumbers
  AS 
    ID,
  orderStatus
  AS
    Status,
  ProductCode
  AS
    Product,
  round(Price * 0.10,2)
  AS
    Shipp_Valeu
  FROM Orders NATURAL JOIN OrdersDetails;
COMMIT;


-- second transaction 
START TRANSACTION;
  SELECT orderNumbers
  AS 
    ID,
  orderStatus
  AS
    Status,
  ProductCode
  AS
    Product,
  round(Price * 0.10,2)
  AS
    Shipp_Valeu
  FROM Orders NATURAL JOIN OrdersDetails;
  UPDATE Orders  SET orderStatus = 'Entregue' WHERE orderNumbers = 10;
  ROLLBACK;
COMMIT;

