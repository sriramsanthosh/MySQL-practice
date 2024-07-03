USE sql_store;

SELECT * 
FROM customers
-- where customer_id = 1
order by first_name;

SELECT 
	last_name,
    first_name,
    points,
	(points+10*100) AS 'discount factor'
FROM customers;

SELECT DISTINCT state;

SELECT * FROM products;

SELECT
	name,
	unit_price,
    (unit_price*1.1) AS 'new price'
FROM products;

SELECT * FROM customers
WHERE points>3000;

-- > >= < <= != <> =

SELECT * FROM customers
WHERE state!="va";


SELECT * FROM customers
WHERE birth_date>'1980-10-22';

SELECT * FROM orders
WHERE order_date>='2019-01-01';

SELECT * FROM customers
WHERE (birth_date>'1990-01-01' OR points>1000);

SELECT * from orders;

SELECT * from order_items
WHERE order_id = 6 AND (unit_price*quantity)>30;

-- AND >> OR, NOT, 

SELECT * FROM customeRs 
WHERE state NOT IN ('VA','IN', 'GA') ;

SELECT * FROM products
WHERE quantity_in_stock IN (49, 38, 72);

SELECT * FROM customers
WHERE points>=1000 AND points<=3000;

SELECT * FROM customers
WHERE points BETWEEN 1000 AND 3000;

SELECT * FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT * FROM customers
-- WHERE last_name LIKE 'b%'
-- WHERE last_name LIKE '%b%'
-- WHERE last_name LIKE '%y'
WHERE last_name LIKE 'b____y';

-- % is used for any number of characters
-- _ is used for any single character

SELECT * FROM customers
-- WHERE phone LIKE '%9';
WHERE address LIKE '%trail%' OR address LIKE '%avenue%' ;

-- REGULAR EXPRESSIONS replace LIKE operator

SELECT * FROM customers
WHERE last_name REGEXP '^d|[a-h]e|y$';

-- ^ used for stating beginning letter
-- $ used for stating last letter of the word
-- | logical or 
-- [abcd]s used for getting words that contains letter s and just before it, any character a or b or c or d 
-- [a-f] instead of writing abcdef

SELECT * FROM customers
WHERE 
-- first _name regexp 'ELKA|AMBUR';
-- last_name regexp 'EY$|ON$';
-- last_name regexp '^MY|^ON';
last_name regexp 'B[ru]';

SELECT * FROM customers 
-- WHERE phone IS NULL;
WHERE phone IS NOT NULL;

SELECT * FROM orders
WHERE shipped_date IS NULL;

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

SELECT * FROM customers
-- LIMIT 5; for first 5 records
LIMIT 6, 3; -- For 3 records after 6 i.e 7, 8, 9

SELECT * FROM CUSTOMERS
ORDER BY points DESC 
LIMIT 3;


-- Order of the clauses to be followed
 
-- SELECT *
-- FROM customers
-- WHERE conditions
-- ORDER BY points DESC
-- LIMIT 3;
 

