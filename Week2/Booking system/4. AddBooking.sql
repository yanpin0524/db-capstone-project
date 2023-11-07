DELIMITER $$

create procedure AddBooking(
	IN booking_id INT,
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT
)
begin

	insert into Bookings (bookingID, date, tableNumber, customerID)
	values
	(booking_id ,booking_date, table_number, customer_id);

	select 'New booking added' as Confirmation;

end$$