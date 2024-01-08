DELIMITER //

CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN

	DELETE
		FROM Bookings
        WHERE BookingID = booking_id;
	
    SELECT CONCAT('Booking ', booking_id, ' cancelled') as Confirmation;

END;
//

DELIMITER ;