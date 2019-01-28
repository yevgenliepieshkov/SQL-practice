/*  Assignment 5.sql
    Yevgen Liepieshkov
    CS 31A, Fall 2018 */

/* Query 0 */
SELECT user(), current_date();

USE bookstore;


/* QUERY 1 */

SELECT 
	category_name,
    product_name,
    list_price
FROM category c
JOIN product p
ON c.category_id = p.category_id
ORDER BY category_name, product_name ASC;


/* QUERY 2 */

SELECT 
	first_name,
	last_name,
	line1,
    city,
    state,
    zip_code
FROM customer c
JOIN address a
ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';


/* QUERY 3 */

SELECT 
	first_name,
	last_name,
	line1,
    city,
    state,
    zip_code
FROM customer c
JOIN address a
ON c.shipping_address_id = a.address_id;


/* QUERY 4 */

SELECT
	last_name,
    first_name,
    order_date,
    product_name,
    item_price,
    quantity
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.product_id;



/* QUERY 5 */

SELECT
	p.product_name,
	p.list_price,
    p1.product_name,
    p1.list_price
FROM product p
JOIN product p1
ON p.product_id <> p1.product_id AND p.list_price = p1.list_price;


/* QUERY 6 */

SELECT 
	product_id,
    product_name,
    list_price,
    company_name as 'Vendor name',
    category_name
FROM product p
JOIN vendor v
ON p.vendor_id = v.vendor_id
JOIN category c
ON p.category_id = c.category_id
ORDER BY product_id;


/* QUERY 7 */

SELECT 
	product_id,
    product_name,
    list_price
FROM product p
JOIN category c
ON p.category_id = c.category_id
WHERE c.category_name = 'Computer'
ORDER BY product_id;


/* QUERY 8 */

SELECT
	o.order_id,
    order_date,
    product_name,
    quantity,
    (oi.quantity * oi.item_price) as amount
FROM orders o
JOIN orderitems oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.product_id;


/* QUERY 9 */

SELECT
	first_name,
    last_name,
    order_id,
    order_date,
    ship_date
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
WHERE ship_date IS NULL
ORDER BY order_date;


/* QUERY 10 */

SELECT
	last_name,
    first_name
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
WHERE item_price > 1500;


/* QUERY 11 */

SELECT
	product_name
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.product_id
WHERE first_name = 'Christine' AND last_name = 'Brown';

