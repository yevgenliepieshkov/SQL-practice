/* QUERY 1 */

USE library;

DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS computer;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS branch_staff;

CREATE TABLE staff (
	staff_id INT(6) NOT NULL,
    fname VARCHAR(15) NOT NULL,
    lname VARCHAR(15) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(30),
    PRIMARY KEY (staff_id)
) ENGINE = INNODB;

CREATE TABLE computer (
	serial_number INT(7) NOT NULL,
    make VARCHAR(15) NOT NULL,
    model VARCHAR(20) NOT NULL,
    processor_type VARCHAR(20),
    speed DECIMAL(4,2),
    main_memory VARCHAR(20),
    disk_size VARCHAR(20),
	PRIMARY KEY (serial_number)
)ENGINE = INNODB;


CREATE TABLE computer_staff (
	serial_number INT(7) NOT NULL,
    staff_id INT(6) NOT NULL,
    date_assigned DATE,
    PRIMARY KEY (serial_number, staff_id),
    FOREIGN KEY (serial_number) REFERENCES computer (serial_number),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
) ENGINE = INNODB;


CREATE TABLE branch_staff (
	branch_id INT(5) NOT NULL,
	contact VARCHAR(15),
    staff_id INT(6) NOT NULL,
    PRIMARY KEY (branch_id, staff_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
)ENGINE = INNODB;



CREATE TABLE branch_staff (
	branch_id INT(8) NOT NULL,
	contact VARCHAR(30),
	staff_id INT(20) NOT NULL,
	CONSTRAINT branch_staff_pk PRIMARY KEY (branch_id, staff_id),
	CONSTRAINT branch_staff_branch_id_fk FOREIGN KEY (branch_id)
	REFERENCES branch (branch_id),
	CONSTRAINT branch_staff_staff_id_fk FOREIGN KEY (staff_id)
	REFERENCES staff (staff_id)
) ENGINE=INNODB;


/* QUERY 2 */

USE library;

INSERT INTO staff VALUES(
	10001,'Stuart', 'Anne', '206-527-0010', 'Anne.Stuart@libray.com');
INSERT INTO staff VALUES(
	10002,'Stuart', 'George', '206-527-0011', 'George.Stuart@library.com');
INSERT INTO staff VALUES(
	10004,'Stuart', 'Mary', '206-527-0012', 'Mary.Stuart@library.com');
INSERT INTO staff VALUES(
	10005,'Orange', 'William', '206-527-0013', 'William.Orange@library.com');
INSERT INTO staff VALUES(
	10006,'Matt', 'John', '206-527-0014', 'John.Griffith@library.com');
    INSERT INTO staff VALUES(
	10007,'Stuart', 'Jack', '206-527-0012', 'Jack.Stuart@library.com');
INSERT INTO staff VALUES(
	10008,'Orange', 'Chris', '206-527-0013', 'Chris.Orange@library.com');
INSERT INTO staff VALUES(
	10009,'Alexander', 'John', '206-527-0014', 'John.Alexanderh@library.com');
    
    INSERT INTO staff VALUES(
	10010,'William', 'Bradley', '206-527-0013', 'Bradley.William@library.com');
INSERT INTO staff VALUES(
	10011,'Neil', ' Simon', '206-527-0014', ' Simon.Neilh@library.com');
	
INSERT INTO computer VALUES(
		9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871289, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541001, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541002, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541003, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541004, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541005, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541006, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');

		
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871256, 10006, '2015-09-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871267, 10001, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871278, 10002, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
	    VALUES(9871289, 10004, '2015-09-21');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541001, 10005, '2015-10-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541002, 10007, '2015-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541003, 10008, '2015-10-21');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541004, 10009, '2015-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871234, 10011, '2015-11-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871245, 10010, '2015-11-14');
		
		
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(91234, 10001, '510-714-8321');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(92345 , 10010, '510-987-0000 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(93456 , 10009, '510-555-9743');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567  , 10008, '510-666-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567, 10007, '510-645-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(95678 , 10010, '8510-111-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(96789  , 10011, '510-999-9743 ');


/* QUERY 3 */

SELECT
       serial_number,
       model
FROM computer;


/*QUERY 4.1*/

ALTER TABLE books
ADD date_added DATETIME;


/* QUERY 4.2*/

DESC books;


/* QUERY 5.1 */

ALTER TABLE staff 
MODIFY lname VARCHAR(30) NOT NULL;


/* QUERY 5.2 */

DESC staff;


/* QUERY 6 */

ALTER TABLE staff
ADD salary DECIMAL(7,2);


/* QUERY 7 */

SELECT
	serial_number,
    staff_id,
    date_assigned 
FROM computer_staff;


/* QUERY 8 */

ALTER TABLE books
DROP date_added;


/* QUERY 9.1 */

CREATE TABLE books_archive LIKE books;

/* QUERY 9.2 */

SHOW TABLES;


/* QUERY 10.1 */

DROP TABLE books_archive;

/* QUERY 10.2 */

SHOW TABLES;