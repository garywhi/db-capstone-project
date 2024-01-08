DELIMITER //

CREATE PROCEDURE AddBooking(booking_id INT, customer_id INT, booking_date DATE, table_no INT)
BEGIN
	INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID) VALUES
    (booking_id, booking_date, table_no, customer_id);
    
    SELECT 'New booking added' as Confirmation;
    
END;
//
DELIMITER ;