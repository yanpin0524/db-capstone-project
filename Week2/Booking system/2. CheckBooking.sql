DELIMITER $$

CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    SET @booking_count := -1;

    SELECT COUNT(bookingID) INTO @booking_count
    FROM Bookings
    WHERE date = booking_date AND tableNumber = table_number;
    
    IF @booking_count > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked') AS message;
    ELSE
        SELECT CONCAT('Table ', table_number, ' can be booked') AS message;
    END IF;

END$$