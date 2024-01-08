DELIMITER //
CREATE PROCEDURE AddValidBooking(booking_date DATE, table_no INT)
BEGIN
	DECLARE booking_status INT;
    DECLARE next_bookingID INT;
    
    START TRANSACTION;
    
    SELECT MAX(BookingID) + 1 INTO next_bookingID FROM Bookings;
        
    with CTE as (
		SELECT CASE WHEN BookingID IS NULL THEN 0   -- 0 means table is not booked on given date
				ELSE 1 								-- 1 means table is booked on given date
                END as booked
			FROM Bookings
            WHERE BookingDate = booking_date
				AND TableNumber = table_no
    )
    
    SELECT booked INTO booking_status
    FROM CTE;
    
	INSERT INTO Bookings(BookingID, BookingDate, TableNumber) VALUES (next_bookingID, booking_date, table_no);

    IF booking_status = 1 THEN
		SELECT CONCAT('Table ', table_no, ' is already booked- booking cancelled') as 'Booking Status';
		ROLLBACK;
	ELSE
		SELECT CONCAT('Table ', table_no, ' is not yet booked- booking created') as 'Booking Status';
		COMMIT;
	END IF;
    
END;
//
DELIMITER ;