use LittleLemonDB;

select m.name from menus as m where m.menu_id = any (select o.menu_id from orders as o where o.quantity > 2);