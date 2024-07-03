USE sql_invoicing;

SELECT 
	payment_id,
	c.client_id,
    c.name,
    city,
    pm.name AS payment_method
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

USE sql_store;

SELECT * 
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
    
-- IMPLICIT JOIN SYNTAX (similar to inner join)
SELECT * 
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;



SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Outer Join (2 types => LEFT JOIN and RIGHT JOIN)
-- (all the customers are displayed irrespective of whether they have order or not)

-- Simply => LEFT JOIN => all the records on the first table will be returned not depending on the condition ON
--        => Right JOIN => all the records on the second table will be returned not depending on the condition ON
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o 
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- JOIN Keyword => INNER JOIN
-- LEFT JOIN / RIGHT JOIN Keyword =>  OUTER JOIN

-- Writing LEFT OUTER JOIN or RIGHT OUTER JOIN is optional because anyway left and right joins are outer joins, so do not need to declare the outer keyword.

-- products JOIN orderitems

SELECT 
	p.product_id,
    name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
    
    
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- For best practice and visualization prefer => left joins, over using => (left , right , left, ....) joins

SELECT 
	order_id,
    order_date,
    first_name,
    sh.name AS shipper,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY o.order_id;
	
-- Self Outer Joins

USE sql_hr;

SELECT *
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id    
ORDER BY e.employee_id;

-- if column name is same in two tables, we can use USING keyword

USE sql_store;

SELECT 
	o.order_id,
    c.first_name
FROM orders o
JOIN customers c
	USING (customer_id)
LEFT JOIN shippers sh
	USING (shipper_id);
    
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id AND
		oi.product_id = oin.product_id;
        
        
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id, product_id);
    
USE sql_invoicing;

SELECT 
	date,
    c.name,
    amount,
    pm.name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
JOIN clients c
	USING (client_id);
    
-- NATURAL JOIN, CROSS JOIN 

USE sql_store;

SELECT 
	sh.name AS shipper,
    p.name AS product
FROM shippers sh, products p
ORDER BY sh.name;


SELECT 
	sh.name AS shipper,
    p.name AS product
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name;

-- UNIONS

SELECT 
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date>='2019-01-01'
UNION
SELECT 
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date<'2019-01-01';


SELECT
	first_name AS full_name
FROM customers
UNION
SELECT 
	name
FROM shippers;

SELECT 
	customer_id,
    first_name,
    points,
    'Gold' AS type
FROM customers
WHERE points>3000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    'Bronze' AS type
FROM customers
WHERE points< 2000
ORDER BY first_name;


