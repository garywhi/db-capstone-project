DELIMITER //

CREATE PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN

	UPDATE Bookings SET BookingDate = booking_date
		WHERE BookingID = booking_id;
        
	SELECT CONCAT('Booking ', booking_id, ' updated') as Confirmation;

END;
//
DELIMITER ;