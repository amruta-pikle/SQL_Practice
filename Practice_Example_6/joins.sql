-- Find customers who ordered Keyboard.

select c.first_name, o.item
from customers c
join orders o
on c.customer_id = o.customer_id
where o.item = 'Keyboard'


-- Find customers who have orders but no shipping record.

select c.first_name
from customers c
left join shippings s
on c.customer_id = s.customer
where s.shipping_id is null


