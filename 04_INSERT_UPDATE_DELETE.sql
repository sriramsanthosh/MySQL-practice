-- INSERT UPDATE AND DELETE DATA
USE sql_store;

INSERT INTO customers
VALUES (
	DEFAULT, 
	'Pawan', 
    'Kalyan', 
    '1968-09-02',
    NULL,
    'Pitapuram',
    'East Godavari',
    'AP',
    DEFAULT
);

SELECT * from customers;

INSERT INTO customers(
	first_name, 
    last_name,
    birth_date, 
    address,
    city,
    state
)
VALUES (
	'Mahesh', 
    'Babu', 
    '1975-08-09',
    'Madras',
    'Chennai',
    'TN'
);


-- FOR MULTIPLE VALUES,
-- INSERT INTO shippers (name)
-- VALUES ('Shipper_name1'),
-- 		  ('Shipper_name2'),
--		  ('Shipper_name3'); 

SELECT * 
FROM products;

INSERT INTO products(
	name, 
    quantity_in_stock,
    unit_price
)
VALUES (
	'Complan',
    80,
    3.22
),(
	'Horlicks',
    75,
    3.16
),(
	'Born Vita',
    '85',
    3.26
);

-- Insert data into multiple tables
USE sql_store;
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);

INSERT INTO order_items
VALUES 
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 2, 1, 3.95);

SELECT last_insert_id();

-- Creating table copy
CREATE TABLE orders_archived AS 
SELECT * FROM orders;

INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date<'2019-01-01';

USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client, 
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c 
	USING (client_id)
WHERE payment_date IS NOT NULL

