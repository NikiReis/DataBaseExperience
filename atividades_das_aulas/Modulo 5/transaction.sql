-- table used in the transactions example
CREATE DATABASE TransactionExample;

USE TransactionExample;

CREATE TABLE Orders (
  OrderNumbers int auto_increment,
  OrderDate date,
  RequireDate date,
  ShippeDate date,
  orderStatus ENUM('Despacho','Em progresso','Entregue'),
  CustomerNumber int,
  Constraint pk_orders Primary Key (OrderNumbers)
);

Alter table Orders modify column OrderNumbers int;

Desc Orders;

CREATE TABLE OrdersDetails(
  OrderNumbers int auto_increment,
  ProductCode varchar(255),
  QuantityOrder int,
  Price varchar(255),
  Constraint fk_orderdetails foreign key (orderNumbers) references orders(orderNumbers),
  Constraint pk_orderdatails primary key (orderNumbers, productCode)
);


Desc OrdersDetails;

SELECT * FROM OrdersDetails;
SELECT * FROM Orders;

SELECT * FROM Orders JOIN OrderDetails Using(OrderNumbers);
-- creating the '@@autocommit' variable
SELECT @@autocommit;

-- setting the autocommit = off, or false or 0
SET @@autocommit = 0;

START TRANSACTION;

  SELECT @orderNumber:= max(orderNumber) += 1;
  FROM Orders;

-- SELECT @orderNumber as Number;

INSERT INTO Orders VALUES(@orderNumbers,'2005-05-31','2005-06-11','Em Progresso',1);
INSERT INTO Orders VALUES(@orderNumbers + 1,'2005-05-31','2005-06-11','Em Progresso',1);

INSERT INTO orderDetails VALUES(@orderNumbers,'18_1749',30,'136.00'),
  (@orderNumbers,'18_2249',50,'55.09');

-- rollback

SELECT * FROM OrdersDetails;
COMMIT;