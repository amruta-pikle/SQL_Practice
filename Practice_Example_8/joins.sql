-- Find customers who ordered items costing less than 500.

select c.first_name, o.amount
from customers c
join orders o
on c.customer_id = o.customer_id
where o.amount < 500


--Find customers who have shipping but did NOT place any orders

select c.customer_id, c.first_name
from customers c
join shippings s
on c.customer_id = s.customer
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null


-- Find customers who have Delivered orders.

select c.first_name, o.item
from customers c
join shippings s
on c.customer_id = s.customer
join orders o
on c.customer_id = o.customer_id
where s.status = "Delivered"
