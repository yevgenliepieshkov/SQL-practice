/* QUERY 1 */

SELECT 
	b.title,
	p.name,
    p.phone
FROM books b
JOIN publisher p
ON b.pub_id = p.pub_id;


/* QUERY 2 */

SELECT 
	b.title
FROM books b
JOIN bookauthor ba
ON b.isbn = ba.isbn
JOIN author a
ON ba.author_id = a.author_id
WHERE a.last_name = 'Steven';


/* QUERY 3 */

SELECT 
	a.author_id,
	a.first_name,
    a.last_name
FROM author a
JOIN bookauthor ba
ON a.author_id = ba.author_id
JOIN bookloans bl
ON ba.isbn = bl.isbn
JOIN borrower br
ON bl.card_no = br.card_no
WHERE br.first_name = 'Leila' 
AND br.last_name = 'Smith';


/* QUERY 4 */

SELECT 
	MAX(pub_date)
FROM books;


/* QUERY 5 */

SELECT 
	MIN(b.list_price)
FROM books b
JOIN categories c
ON b.category_id = c.category_id
WHERE c.category_desc = 'Computer Science';


/* QUERY 6 */

SELECT 
	MAX(b.list_price)
FROM books b
JOIN bookauthor ba
ON b.isbn = ba.isbn
JOIN author a
ON ba.author_id = a.author_id
WHERE a.last_name = 'Tim' 
AND a.first_name = 'Carlos';


/* QUERY 7 */

SELECT
	b.title,
	COUNT(*)
FROM bookloans bl
JOIN  books b
ON bl.isbn = b.isbn
GROUP BY bl.isbn;


/* QUERY 8 */

SELECT
	COUNT(*)
FROM bookloans bl
GROUP BY bl.isbn
HAVING bl.isbn = '0401140733';