USE `LittleLemonDB`;
CREATE  OR REPLACE VIEW `OrdersView` AS select order_id as OrderID, quantity as Quantity, total_cost as Cost from orders where quantity > 2;