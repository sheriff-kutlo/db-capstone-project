use LittleLemonDB;

delimiter //

create procedure if not exists CancelBooking(in bookingID BIGINT)
	begin
		delete from bookings where booking_id = bookingID;
        
        select concat("Booking ", bookingID, " cancelled") as Confirmation;
        
    end //

delimiter ;