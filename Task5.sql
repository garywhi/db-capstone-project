PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';

SET @id = 1;
CALL CancelOrder(@id)