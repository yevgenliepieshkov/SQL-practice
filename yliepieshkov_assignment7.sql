/* QUERY 0*/

USE bookstore;

/* QUERY 1*/

SELECT 
	DISTINCT category_name 
FROM category c 
WHERE c.category_id 
IN (
		SELECT 
			category_id
		FROM product
    )
ORDER BY category_name;


/* QUERY 2*/

SELECT 
	product_name,
    list_price
FROM product
WHERE list_price > 
			(
				SELECT 
					AVG(list_price)
				FROM product
            )
ORDER BY list_price DESC;


/* QUERY 3*/

SELECT 
	category_name
FROM category c 
WHERE EXISTS 
	(
		SELECT 
			category_id
		FROM product 
		WHERE category_id = c.category_id
	);


/* QUERY 4*/

SELECT 
	c.email_address,
    o.order_id,
    oi.order_total
FROM orders o
JOIN 
	(
		SELECT 
			email_address,
            customer_id
		FROM customer c 
	) AS c
ON o.customer_id = c.customer_id
JOIN 
	(
		SELECT 
			SUM((item_price-discount_amount)*quantity) AS order_total,
            order_id
		FROM orderitems
        GROUP BY order_id
	) AS oi
ON o.order_id = oi.order_id
GROUP BY email_address, order_id;


/* QUERY 5*/

SELECT 
	c.email_address,
    o.order_id,
    o.order_date
FROM customer c
LEFT JOIN 
	(
		SELECT 
			MIN(order_id) AS order_id,
            MIN(order_date) AS order_date,
            customer_id
		FROM orders 
        GROUP BY customer_id
	) AS o
ON c.customer_id = o.customer_id;


/* QUERY 6*/

SELECT
	p.product_id,
    p.product_name,
    p.list_price
FROM product p
WHERE 
	(
		SELECT 
        COUNT(product_id) 
        FROM orderitems oi 
        WHERE oi.product_id = p.product_id
	) > 1;


/* QUERY 7*/

SELECT
	c.last_name,
    c.first_name
FROM	customer c
JOIN (
		SELECT 
			oi.item_price AS item_price,
            o.customer_id
        FROM orderitems oi
        JOIN orders o
        ON oi.order_id = o.order_id
        ) AS ip
ON c.customer_id = ip.customer_id
WHERE ip.item_price > 300
GROUP BY c.first_name, c.last_name;
    
    
/* QUERY 8*/

SELECT
	c.last_name,
    c.first_name,
    c.email_address
FROM customer c
JOIN (
		SELECT 
			o.customer_id,
            o.order_id 
		FROM orders o
        WHERE o.order_id IN (1,2,3)
        ) as o
ON c.customer_id = o.customer_id
GROUP BY c.email_address;


/* QUERY 9*/

SELECT
	c.last_name,
    c.first_name,
    c.email_address
FROM customer c
JOIN (
		SELECT 
			o.customer_id,
            o.order_id
		FROM orders o
        JOIN orderitems oi
        ON o.order_id = oi.order_id
        JOIN product p
        ON oi.product_id = p.product_id
        JOIN vendor v
        ON p.vendor_id = v.vendor_id
        WHERE v.company_name LIKE 'H%'
        ) as o
ON c.customer_id = o.customer_id
GROUP BY c.email_address;


/* QUERY 10*/

SELECT
	p.product_id,
    p.product_name,
    p.list_price
FROM product p
JOIN (
	SELECT 
		SUM(quantity) as sum_quantity,
        product_id
	FROM orderitems 
    GROUP BY product_id
    ) oi
ON p.product_id = oi.product_id
WHERE p.product_id = oi.product_id
AND sum_quantity > 2;


/* QUERY 11*/

SELECT 
	order_id,
    SUM((item_price-discount_amount) * quantity)
FROM
	orderitems oi
GROUP BY order_id
HAVING 
	SUM((item_price-discount_amount) * quantity) 
    > (
		SELECT 
			SUM((item_price-discount_amount) * quantity)
		FROM orderitems oi
        WHERE oi.order_id = 7
        );


/* QUERY 12*/

SELECT
	order_id,
    order_date,
    ship_date
FROM orders o
WHERE ship_date IS NOT NULL 
AND DATEDIFF(order_date, ship_date) = 
		(
			SELECT 
				MIN(DATEDIFF(order_date, ship_date))
			FROM orders o
		);