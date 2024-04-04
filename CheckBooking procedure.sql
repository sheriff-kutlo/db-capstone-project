use LittleLemonDB;

delimiter //

create procedure if not exists CheckBooking(in booking_date datetime, in table_no int)
	begin
		declare status int;
        declare msg varchar(100);
		select count(booking_id) into status from bookings where date = booking_date
			and table_number = table_no;
            
		if status != 0 then set msg = concat("Table ", table_no, " is already booked");
        else set msg = concat("Table ", table_no, " is available");
        end if;
        
        select msg as Booking_status;
	end //
    
    
delimiter ;