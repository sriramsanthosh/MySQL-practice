USE sql_store;
-- inner join / join 
SELECT *
FROM orders
JOIN customers 
	ON orders.customer_id = customers.customer_id;
    
SELECT order_id, orders.customer_id, first_name, last_name
FROM orders
JOIN customers 
	ON orders.customer_id = customers.customer_id;
    
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c 
	ON o.customer_id = c.customer_id;
    
SELECT * 
-- FROM order_items;
FROM products;

SELECT 
	order_id,
    oi.product_id,
	name
FROM order_items oi
JOIN products p 
		ON oi.product_id = p.product_id;