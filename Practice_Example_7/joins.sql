-- Find customers who ordered items with amount greater than 300.


select c.first_name, o.amount
from customers c
join orders o
where c.customer_id = o.customer_id
and o.amount > 30


-- Find customers who have shipping but no orders.

select distinct c.customer_id, c.first_name
from customers c
join shippings s
on c.customer_id = s.customer
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null

-- Find customer names with their order item and shipping status.

select c.first_name, o.item, s.status
from customers c
join orders o
on c.customer_id = o.customer_id
join shippings s
on o.customer_id = s.custom
