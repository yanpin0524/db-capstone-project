DELIMITER $$

create procedure UpdateBooking(
	IN booking_id INT,
    IN booking_date DATE
)
begin

	update Bookings
    set bookingID = booking_id, date = booking_date
    where bookingID = booking_id;

	select CONCAT('Booking ', booking_id, ' updated') as Confirmation;

end$$