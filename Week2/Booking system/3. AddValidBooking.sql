DELIMITER $$

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT
)
BEGIN

	START TRANSACTION;
    SET @booking_count := -1;

    SELECT COUNT(bookingID) INTO @booking_count
    FROM Bookings
    WHERE date = booking_date AND tableNumber = table_number;
    
    insert into Bookings (date, tableNumber, customerID)
	values
	(booking_date, table_number, customer_id);
    
    IF @booking_count > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked - booking cancelled') AS message;
        ROLLBACK;
    ELSE
        SELECT *
		FROM Bookings
		WHERE date = booking_date AND tableNumber = table_number;
        
        COMMIT;
    END IF;

END$$