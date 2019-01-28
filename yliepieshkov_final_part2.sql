/*QUERY 0*/
USE university;

/*QUERY 1*/
SELECT 
	s.course_id,
    s.section_id,
    s.term_id
FROM section s
JOIN term t
ON s.term_id = t.term_id
WHERE t.term_desc LIKE 'FALL 2017';


/*QUERY 2.1*/
ALTER TABLE course
MODIFY title VARCHAR(50);

/*QUERY 2.2*/
UPDATE course
SET title = 'Introduction to Relational Databases'
WHERE course_id = 'CIS253';


/*QUERY 3*/
SELECT 
	s.section_id,
	s.course_id,
    COUNT(*)
FROM section s
JOIN registration r
ON s.section_id = r.section_id
WHERE s.section_id = 1205
GROUP BY s.section_id, s.course_id;


/*QUERY 4*/
SELECT 
	s.course_id,
    s.section_id,
    st.last_name,
    st.first_name
FROM section s
JOIN registration r
ON s.section_id = r.section_id 
JOIN student st 
ON r.student_id = st.student_id 
JOIN faculty f 
ON s.faculty_id = f.faculty_id
WHERE f.name = 'Mobley';


/*QUERY 5*/
SELECT 
	d.dept_name,
    COUNT(*) tot_num_of_instructors
FROM department d
JOIN faculty f 
ON d.dept_id = f.dept_id 
GROUP BY f.dept_id;

/*QUERY 6*/

SELECT 
	faculty_id, 
    name, 
    dept_id
FROM faculty
WHERE dept_id IN (1,3);

/*QUERY 7*/

SELECT 
	s.course_id,
    s.section_id,
    f.name
FROM section s
JOIN faculty f
ON s.faculty_id = f.faculty_id
WHERE s.term_id = 
	(SELECT 
			term_id
	FROM term
    WHERE term_desc = 'WINTER 2017');


/*QUERY 8*/

SELECT 
	s.first_name,
    s.last_name
FROM student s
JOIN registration r
ON s.student_id = r.student_id
JOIN section sc
ON r.section_id = sc.section_id
WHERE sc.term_id = (SELECT 
			term_id
	FROM term
    WHERE term_desc = 'SPRING 2017')
AND r.final_grade = 'A';


/*QUERY 9*/

SELECT
	COUNT(*) total_enrolled
FROM registration
WHERE section_id IN 
	(SELECT 
		section_id
	FROM section
    WHERE course_id = 'AC265');


/*QUERY 10*/

SELECT course_id, COUNT(section_id), SUM(max_count)
FROM section
GROUP BY course_id
HAVING COUNT(section_id) > 1;

/*QUERY 11*/

CREATE VIEW course_sections
AS SELECT section_id, section_number
FROM section
WHERE course_id = (
	SELECT 
		course_id
    FROM course 
    WHERE title = 'Accounting');


/*QUERY 12*/

SELECT 
	s.course_id,
    r.section_id,
    COUNT(r.student_id)
FROM registration r
JOIN section s
ON r.section_id = s.section_id
GROUP BY r.section_id, s.course_id;


/*QUERY 13*/

SELECT 
	s.section_id,
    s.course_id,
    c.title
FROM section s
JOIN course c
ON s.course_id = c.course_id;


/*QUERY 14*/

SELECT
	section_id,
    course_id,
    section_number
FROM section
WHERE term_id =  (SELECT 
			term_id
	FROM term
    WHERE term_desc = 'SPRING 2017');

/*QUERY 15*/

SELECT
	CONCAT(s.first_name, ' ', s.last_name) name,
    m.major_desc
FROM student s
JOIN major m
ON s.major_id = m.major_id;











