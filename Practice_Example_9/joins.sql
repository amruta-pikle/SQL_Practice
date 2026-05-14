-- Find customer names along with their shipping status.

select c.first_name, s.status
from customers c
join shippings s
on c.customer_id = s.customer


-- Find customers who do not have any orders.

select c.customer_id, c.first_name
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null


-- Find number of orders placed by each customer.

select c.customer_id, count(o.order_id) as order_count
from customers c
join orders o
on c.customer_id = o.customer_id
group by o.customer_id
