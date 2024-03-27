USE LittleLemonDB;

select c.customer_id, c.name, o.order_id, o.total_cost, m.name, mi.courses, mi.starters
from customers as c inner join orders as o on c.customer_id = o.customer_id
inner join menus as m on m.menu_id = o.menu_id
inner join menu_items as mi on mi.menu_items_id = m.menu_items_id 
where o.total_cost > 30 order by o.total_cost asc;