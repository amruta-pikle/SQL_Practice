-- Find customer names along with the items they ordered.

select c.first_name, c.last_name, o.item
from customers c
join orders o
on c.customer_id = o.customer_id


--Find customers who never placed any orders.

select c.customer_id, c.first_name
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null


--Find customers whose shipping status is 'Pending'.

select c.first_name, s.status
from customers c
join shippings s
on c.customer_id = s.customer
where s.status = "Pending"