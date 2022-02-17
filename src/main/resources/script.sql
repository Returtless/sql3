select o.product_name from orders o
                               inner join customers c on c.id = o.customer_id
where upper(c.name) = upper(:parameter) LIMIT 1;