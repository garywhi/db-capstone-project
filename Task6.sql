DELIMITER //
CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN
DELETE
	FROM Orders
    WHERE OrderID = order_ID;
    
SELECT CONCAT("Order ", order_id, " is cancelled") as Confirmation;
END
//

DELIMITER ;