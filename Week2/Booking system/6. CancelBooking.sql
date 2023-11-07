DELIMITER $$

create procedure CancelBooking(
	IN booking_id INT
)
begin

	delete from Bookings
    where bookingID = booking_id;

	select CONCAT('Booking ', booking_id, ' cancelled') as Confirmation;

end$$