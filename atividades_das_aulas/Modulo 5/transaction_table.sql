-- tabela utilizada no exemplo de transações
-- DROP database transactionExample;
CREATE DATABASE transactionExample;

USE transactionExample;
-- DROP TABLE orders;

CREATE TABLE orders(
	orderNumbers INT ,
    orderDate date,
    requiredDate date,
    shippedDate date,
    orderStatus ENUM('DESPACHADO','EM PROGRESSO','ENTREGUE'),
    customerNumber int,
    CONSTRAINT pk_orders PRIMARY KEY (orderNumbers) 
);

DESC orders;

CREATE TABLE ordersDetails(
	orderNumbers int ,
    productCode varchar(255),
    quantityOrder int,
    price varchar(255),
	constraint fk_orderdetails foreign key (orderNumbers) references orders(orderNumbers),
    constraint pk_orderdatails primary key (orderNumbers, productCode)
);

DESC ordersDetails;

SELECT * FROM ordersDetails;
SELECT * FROM orders;

SELECT * FROM orders JOIN ordersDetails USING(orderNumbers);

SET @@autocommit = 1;
SELECT @@autocommit;

START TRANSACTION;

	SELECT @orderNumbers:=max(orderNumbers) + 1
		FROM Orders;

SELECT @orderNumbers as Number;

INSERT INTO Orders VALUES(@orderNumbers,'2005-05-31','2005-05-31','2005-06-11','Em Progresso',1);
INSERT INTO Orders VALUES(@orderNumbers + 1,'2005-05-31','2005-05-31','2005-06-11','Em Progresso',1);

INSERT INTO ordersDetails VALUES(@orderNumbers,'18_1749',30,'136.00'),
  (@orderNumbers,'18_2249',50,'55.09');

 rollback;
 
 commit;
