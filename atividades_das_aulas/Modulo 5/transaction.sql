SELECT @@autocommit;

SET @@autocommit=0;

START TRANSACTION;

	SELECT @orderNumbers:=max(orderNumbers) + 1
		FROM Orders;

 SELECT @orderNumbers as Number;

INSERT INTO Orders VALUES(@orderNumbers,'2005-05-31','2005-06-11','Em Progresso',1);
INSERT INTO Orders VALUES(@orderNumbers + 1,'2005-05-31','2005-06-11','Em Progresso',1);

INSERT INTO orderDetails VALUES(@orderNumbers,'18_1749',30,'136.00'),
  (@orderNumbers,'18_2249',50,'55.09');

-- rollback