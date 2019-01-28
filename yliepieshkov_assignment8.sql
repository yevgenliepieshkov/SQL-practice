USE bookstore;


/* QUERY 1 */

CREATE VIEW customer_address
AS SELECT 
	c.customer_id,
    email_address,
    last_name,
    first_name,
    line1 AS ship_line1,
    line2 AS ship_line2,
    city AS ship_city,
    state AS ship_state,
    zip_code AS ship_zip
FROM customer c 
JOIN address a
ON c.customer_id = a.customer_id;


SELECT 
	customer_id,
    last_name,
    first_name,
    ship_city,
    ship_state
FROM customer_address;


/* QUERY 2 */

UPDATE 
	customer_address
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 11119;


/* QUERY 3 */

CREATE VIEW product_summary (product_id, order_count, order_total)
AS SELECT product_id, SUM(quantity), SUM(item_price * quantity)
FROM orderitems
GROUP BY product_id;


SELECT product_id, order_count, order_total from product_summary;


/* QUERY 4 */

CREATE VIEW cheap_products
AS SELECT *
FROM product
WHERE list_price < 40
WITH CHECK OPTION;


SELECT * FROM cheap_products;


/* QUERY 5 */

INSERT INTO cheap_products
VALUES (17888, 41, 'book db', 'Fundamental of Database Systems', 
				'Fundamental of Database Systems Elmasri', 45.99, 20.00,
                '2015-06-01 11:12:59', 2);

                
SELECT * FROM cheap_products;


/* QUERY 6 */

CREATE VIEW contact (first_name, phone)
AS SELECT DISTINCT contact_fname, phone
FROM vendor;


SELECT * FROM contact;


/* QUERY 7 */

CREATE VIEW order_items (order_id, order_date,tax_amount, ship_date,
												item_price, discount_amount, final_price,
                                                quantity, item_total, product_name)
AS SELECT 
	o.order_id,
    o.order_date,
    o.tax_amount,
    o.ship_date,
    oi.item_price,
    oi.discount_amount,
    (oi.item_price - oi.discount_amount) final_price,
    oi.quantity,
    (oi.item_price - oi.discount_amount) * oi.quantity item_total,
    p.product_name
FROM orders o
JOIN orderitems oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.product_id;


SELECT * from order_items;


/* QUERY 8 */

CREATE VIEW reorder_info
AS SELECT
	p.product_id,
    p.product_name,
    v.contact_fname,
    v.phone
FROM product p
JOIN vendor v
ON p.vendor_id = v.vendor_id;


SELECT * FROM reorder_info;
