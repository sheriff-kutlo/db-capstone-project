use LittleLemonDB;

delimiter //

create procedure if not exists AddValidBooking(in booking_date datetime, in table_no int, in customerID BIGINT)
	begin
		declare status int;
		declare msg varchar(100);
        
		start transaction;
        
			select count(booking_id) into status from bookings where date = booking_date
				and table_number = table_no;
                
			if status != 0 then set msg = concat("Table ", table_no, " is already booked - booking cancelled");
            else 
				insert into bookings(date, table_number, customer_id) 
					values (booking_date, table_no, customerID);
				set msg = concat("Table ", table_no, " is available");
                commit;
			end if;
            
            select msg as "Booking status";
            
        end //
    
delimiter ;