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
