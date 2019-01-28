/* Assignment 2.sql
   Yevgen Liepieshkov
   CS 31A, Fall 2018*/
     
/* put the database name into this command */
USE bookstore;

/* Query 0 */
SELECT user(), current_date();

/* QUERY 1 */
SELECT last_name, first_name, customer_id 
FROM customer
WHERE customer_id != 77779;

/* Query 2 */
SELECT  product_name, description 
FROM product
WHERE category_id > 21;

/* Query 3 */
SELECT last_name, first_name, customer_id, email_address
FROM customer
WHERE customer_id = 11119;

/* Query 4 */
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total,
discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity as item_total
FROM orderitems
WHERE  (item_price - discount_amount) * quantity > 900;

/* Query 5 */
SELECT store_id, region_id, region_name
FROM store;

/* Query 6 */
SELECT customer_id, email_address
FROM customer;

/* Query 7 */
SELECT customer_id
FROM orders
GROUP BY customer_id;

/* Query 8 */
SELECT customer_id, line1, line2, CONCAT(city ," ,", state) as location, zip_code
FROM address;

/* Query 9 */
SELECT product_name, list_price, discount_percent, list_price / 100 * discount_percent AS discount_amount, list_price - (list_price / 100 * discount_percent) AS discount_price
FROM product
ORDER BY discount_price DESC
LIMIT 5;

/* Query 10 */
SELECT CONCAT(last_name, ", ", first_name) as full_name 
FROM customer;

/* Query 11 */
SELECT category_id, product_name
FROM product;

/* Query 12 */
SELECT product_name, list_price, list_price * 1.2 AS new_list_price
FROM product;

