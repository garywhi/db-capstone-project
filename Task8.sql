DELIMITER //
DROP PROCEDURE CheckBooking;

CREATE PROCEDURE CheckBooking(booking_date DATE, table_no INT)
BEGIN

	with CTE as (SELECT CASE WHEN BookingID IS NULL THEN 0
						ELSE 1
                        END as BookingStatus
					FROM Bookings
					WHERE BookingDate = booking_date
					AND TableNumber = table_no)
                    
	SELECT CASE WHEN BookingStatus = 1 THEN CONCAT("Table ", table_no," is already booked")
				ELSE CONCAT("Table ", table_no," is not booked yet")
                END as 'Booking Status'
			FROM CTE;
            -- WHERE BookingID in (SELECT BookingID FROM CTE);
		
    
END;
//
DELIMITER ;