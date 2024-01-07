SELECT c.CustomerID,
		c.CustomerName,
        o.OrderID,
        o.TotalCost,
        m.ItemName
	FROM Customer as c
    INNER JOIN Bookings as b ON c.CustomerID = b.CustomerID
    INNER JOIN Orders as o ON b.BookingID = o.BookingID
    INNER JOIN Menu as m ON m.ItemID = o.ItemID
    WHERE o.TotalCost > 150