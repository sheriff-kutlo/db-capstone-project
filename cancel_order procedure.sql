use LittleLemonDB;

delimiter //

create procedure if not exists CancelOrder(in orderid BIGINT)
	begin
		delete from orders where order_id = orderid;
        select concat("Order ", orderid, " is cancelled") as Confirmation;
	end //

delimiter ;