--1. 테이블 생성하기
--4개
--2. 조인문 사용하기 3개
--3. SELECT문을 사용하여 데이터 탐색하기 3개
CREATE TABLE course(
	id serial,
	name varchar(50),
	teacher_id serial
);
INSERT INTO course (id, name, teacher_id)
VALUES (1,'Database design',1),
		(2,'English literature',2),
		(3,'Python programming',1);
CREATE TABLE student(
	id serial,
	first_name varchar(20),
	last_name varchar(50)
);
INSERT INTO student (id, first_name, last_name)
VALUES (1,'Shreya','Bain'),
		(2,'Rianna','Foster'),
		(3,'Yosef','Naylor');

CREATE TABLE teacher(
	id integer,
	first_name varchar(20),
	last_name varchar(50)
);
INSERT INTO teacher (id, first_name, last_name)
VALUES (1,'Taylah','Booker'),
		(2,'Sarah_Louise','Blake');

CREATE TABLE student_course(
	student_id integer,
	course_id integer
);

INSERT INTO student_course (student_id, course_id)
VALUES (1, 1),  -- Shreya가 Database design 수업을 수강
       (2, 2),  -- Rianna가 English literature 수업을 수강
       (3, 3),  -- Yosef가 Python programming 수업을 수강
       (1, 3);  -- Shreya가 Python programming 수업도 수강
SELECT * from student;
SELECT * from course;
SELECT * from student_course;

SELECT s.id AS student_id, s.first_name, s.last_name, sc.course_id
FROM student s
JOIN student_course sc ON s.id = sc.student_id;

SELECT t.id AS teacher_id, t.first_name, t.last_name, c.name AS course_name
FROM teacher t
JOIN course c ON t.id = c.teacher_id;

SELECT c.id AS course_id, c.name AS course_name, sc.student_id
FROM course c
JOIN student_course sc ON c.id = sc.course_id;

SELECT * FROM student id JOIN student_course id ON id.student_id = course.student_id;
SELECT 
    s.student_id AS student_id,
    s.name AS student_name,
    sc.course_id AS course_id,
    sc.enrollment_date
FROM student s
JOIN student_course sc ON s.student_id = sc.student_id;
SELECT * from teacher;

SELECT student_name 
FROM students 
WHERE course_id = (SELECT course_id FROM courses WHERE course_name = 'Database Design');

SELECT course_name 
FROM courses 
WHERE instructor_id = (SELECT instructor_id FROM instructors WHERE instructor_name = 'Taylah Brooker');

SELECT student_name 
FROM students 
WHERE last_name LIKE 'B%';

SELECT instructor_name 
FROM instructors 
WHERE last_name LIKE 'B%';
