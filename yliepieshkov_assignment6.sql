USE bookstore;


/* QUERY 1 */

SELECT 
	count(*),
    sum(tax_amount) 
FROM orders;


/* QUERY 2 */

SELECT 
	product_id,
    sum(quantity)
FROM orderitems 
GROUP BY product_id;


/* QUERY 3 */

SELECT
	c.category_name,
    COUNT(c.category_id) product_count,
    MAX(p.list_price) most_expensive_product
FROM category c
JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC;


/* QUERY 4 */

SELECT
	c.email_address,
    SUM(oi.item_price * oi.quantity) item_price_total,
    SUM(oi.discount_amount * oi.quantity) discount_amount_total
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY item_price_total DESC;
	

/* QUERY 5 */

SELECT
	c.email_address,
    COUNT(*) AS order_count,
    SUM((oi.item_price - oi.discount_amount)* oi.quantity) order_total
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING COUNT(*)>1
ORDER BY order_total DESC;


/* QUERY 6 */

SELECT
	c.email_address,
    COUNT(*) AS order_count,
    SUM((oi.item_price - oi.discount_amount)* oi.quantity) order_total
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
WHERE oi.item_price > 400
GROUP BY c.email_address
HAVING COUNT(*)>1
ORDER BY order_total DESC;


/* QUERY 7 */

SELECT
	c.email_address,
    COUNT(*) AS number_of_products
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING COUNT(*)>1;
    

/* QUERY 8 */

SELECT
	v.vendor_id,
    count(*)
FROM vendor v
JOIN product p
ON v.vendor_id = p.vendor_id
WHERE p.list_price > 100
GROUP BY v.vendor_id;


/* QUERY 9 */

SELECT
	v.vendor_id,
    p.category_id,
    count(*) number_of_products,
    AVG (p.list_price)
FROM vendor v
JOIN product p
ON v.vendor_id = p.vendor_id
GROUP BY v.vendor_id ASC, p.category_id
HAVING COUNT(*) > 1;


/* QUERY 10 */

SELECT
	COUNT(*) printer_product
FROM product p
JOIN category c
ON p.category_id = c.category_id
WHERE c.category_name = 'printer';


/* QUERY 11 */

SELECT
	c.customer_id,
    SUM((oi.item_price - oi.discount_amount) * quantity) total_profit
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderitems oi
ON o.order_id = oi.order_id
WHERE c.customer_id = 77779;


/* QUERY 12 */

SELECT
	card_number,
    LENGTH(card_number) card_number_length,
    SUBSTR(card_number,12,4) last_four_digits,
    CONCAT('XXXX-XXXX-XXXX-', SUBSTR(card_number,12,4)) formatted_number
FROM orders;