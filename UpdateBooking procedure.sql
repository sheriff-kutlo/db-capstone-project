delimiter //

create procedure if not exists UpdateBooking(in bookingID BIGINT, in booking_date datetime)
	begin
		update bookings set date = booking_date where booking_id = bookingID;
        
        select concat("Booking ", bookingID, " updated");
        
    end //

delimiter ;