USE library;

/*1*/
SELECT 
	last_name,
    first_name,
    card_no
FROM borrower
WHERE card_no NOT IN 
	(
		SELECT card_no
		FROM bookloans
	);


/*2*/

SELECT 
	first_name,
	bl.card_no
FROM borrower br
JOIN bookloans bl
ON br.card_no = bl.card_no
JOIN bookauthor ba
ON bl.isbn = ba.isbn
WHERE ba.author_id = (SELECT author_id FROM author  WHERE last_name = 'White');

/*3*/

SELECT title
FROM books
WHERE pub_id = (
		SELECT pub_id
		FROM books
		WHERE title = 'Intro to DB Systems-7th Ed'
    );
    
    
/*4*/

SELECT 
	last_name,
    first_name,
    address
FROM borrower br
JOIN bookloans bl
ON br.card_no = bl.card_no
JOIN books b
ON bl.isbn = b.isbn
WHERE pub_id = (SELECT pub_id FROM publisher WHERE name LIKE 'P%')
GROUP BY last_name, first_name, address;


/*5*/

SELECT 
	title,
	category_id, 
	list_price
FROM books
WHERE list_price <= (SELECT AVG(list_price) FROM books);