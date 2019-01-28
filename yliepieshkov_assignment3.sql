/*  Assignment 3.sql
    Yevgen Liepieshkov
    CS 31A, Fall 2018 */

/* Query 0 */
SELECT user(), current_date();


USE bookstore;

/* QUERY 1 */
SELECT 
	last_name,
    first_name,
    customer_id
FROM customer
WHERE customer_id BETWEEN 22220 AND 66669;
 
/* QUERY 2 */ 
SELECT 
	first_name,
    last_name,
    salary
FROM employee
WHERE salary NOT IN (3400, 3000, 6000)
AND last_name LIKE 'S%';

/* QUERY 3 */
SELECT 
	order_id,
    order_date,
    ship_date
FROM orders
WHERE ship_date IS NULL;

/* QUERY 4 */
SELECT  
	last_name,
    first_name
FROM customer
WHERE last_name LIKE '%in%'
ORDER BY last_name, first_name;

/* QUERY 5 */
SELECT 
	product_id,
    product_name,
    list_price 
FROM product
WHERE list_price > 30 AND list_price < 900;

/* QUERY 6  v1*/
SELECT 
	order_id,
	order_date,
    ship_date
FROM orders
WHERE order_date BETWEEN '2015-03-01' AND '2015-04-01'
ORDER BY order_date DESC;

/* QUERY 6  v2*/
SELECT 
	order_id,
    order_date,
    ship_date
FROM orders
WHERE order_date LIKE '2015-03%'
ORDER BY order_date DESC;

/* QUERY 6  v3*/
SELECT 
	order_id,
    order_date,
    ship_date
FROM orders
WHERE order_date >= '2015-03-01' AND order_date < '2015-04-01'
ORDER BY order_date DESC;

/* QUERY 7 */
SELECT 
	product_id,
    product_code,
    product_name
FROM product
WHERE product_name LIKE '_E_L%'
ORDER BY product_code DESC;

/* QUERY 8 */
SELECT 
	product_id, 
	category_id,
	vendor_id,
    list_price
FROM product
WHERE (category_id = 11 OR category_id = 61)
AND (vendor_id = 2 OR vendor_id = 3)
AND list_price >= 100;

/* QUERY 9 */
SELECT 
	order_id,
	customer_id,
    order_date
FROM orders
WHERE ship_date IS NOT NULL;

/* QUERY 10 */
INSERT INTO category
VALUES (71, 'Video Game');

/* QUERY 10.2*/
UPDATE category 
SET category_name =  'Camera'
WHERE category_id = 71;
 
 /* QUERY 11*/
INSERT INTO product (product_id, category_id,product_code, product_name, description,
									  list_price, discount_percent, date_added,vendor_id)
VALUES (17234, 71, 'Camera640', 'Canon', 'Canon EOS Rebel T5 DSLR Camera',
				755.99, 0,  '2015-04-30 13:14:15', 2);

/* QUERY 12.0 */
DELETE FROM product
WHERE category_id = 71;

/* QUERY 12 */
DELETE FROM category
WHERE category_id = 71 AND  category_name = 'Camera';

/* QUERY 13 */
UPDATE orders 
SET card_type = 'American Express'
WHERE order_id = 9;

/* QUERY 14 */
UPDATE employee
SET salary = 6500
WHERE salary = 6000;

/* QUERY 15 */
INSERT INTO customer (customer_id, email_address, password, first_name, last_name)
VALUES (99999, 'rick@raven.com', '', 'Rick', 'Raven');

/* QUERY 16 */
RENAME TABLE administrators TO administrators_backup;

SHOW TABLES;
