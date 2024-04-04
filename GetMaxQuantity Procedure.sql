use LittleLemonDB;

create procedure if not exists GetMaxQuantity() 
select max(total_cost) as "Max Quantity In Order" from orders;