use LittleLemonDB;

delimiter //

create procedure if not exists AddBooking(in bookingID BIGINT, in customerID BIGINT, 
in booking_date datetime, in table_no int)

	begin
		insert into bookings(booking_id, date, table_number, customer_id)
			values(bookingID, booking_date, table_no, customerID);
            
		select concat("New booking added") as Confirmation;
    
    end // 

delimiter ;