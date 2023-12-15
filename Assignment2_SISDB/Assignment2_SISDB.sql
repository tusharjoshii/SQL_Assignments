CREATE DATABASE SISDB;

USE SISDB;

-------------------------------------------------

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE
);

-----------------------------------------------------------------------------------------------------------------

ALTER TABLE Courses
ADD CONSTRAINT FK_Courses_Teacher FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id);

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Students FOREIGN KEY (student_id) REFERENCES Students(student_id);
ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (course_id) REFERENCES Courses(course_id);

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Students FOREIGN KEY (student_id) REFERENCES Students(student_id);

-----------------------------------------------------------------------------------------------------------------

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Ravi', 'Kumar', '2000-01-01', 'ravi.kumar@example.com', '9876543210'),
(2, 'Priya', 'Sharma', '2000-02-02', 'priya.sharma@example.com', '9876543211'),
(3, 'Amit', 'Gupta', '2000-03-03', 'amit.gupta@example.com', '9876543212'),
(4, 'Sneha', 'Patel', '2000-04-04', 'sneha.patel@example.com', '9876543213'),
(5, 'Rahul', 'Verma', '2000-05-05', 'rahul.verma@example.com', '9876543214'),
(6, 'Anjali', 'Mishra', '2000-06-06', 'anjali.mishra@example.com', '9876543215'),
(7, 'Vikas', 'Singh', '2000-07-07', 'vikas.singh@example.com', '9876543216'),
(8, 'Pooja', 'Agarwal', '2000-08-08', 'pooja.agarwal@example.com', '9876543217'),
(9, 'Rohit', 'Jain', '2000-09-09', 'rohit.jain@example.com', '9876543218'),
(10, 'Aman', 'Gupta', '2000-10-10', 'aman.gupta@example.com', '9876543219');

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Mathematics', 4, 1),
(2, 'Physics', 4, 2),
(3, 'Chemistry', 4, 3),
(4, 'Biology', 4, 4),
(5, 'English', 4, 5),
(6, 'History', 4, 6),
(7, 'Geography', 4, 7),
(8, 'Computer Science', 4, 8),
(9, 'Economics', 4, 9),
(10, 'Business Studies', 4, 10);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 2, '2023-01-02'),
(3, 3, 3, '2023-01-03'),
(4, 4, 4, '2023-01-04'),
(5, 5, 5, '2023-01-05'),
(6, 6, 6, '2023-01-06'),
(7, 7, 7, '2023-01-07'),
(8, 8, 8, '2023-01-08'),
(9, 9, 9, '2023-01-09'),
(10, 10, 10, '2023-01-10');

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Suresh', 'Verma', 'suresh.verma@example.com'),
(2, 'Anita', 'Mishra', 'anita.mishra@example.com'),
(3, 'Ramesh', 'Patel', 'ramesh.patel@example.com'),
(4, 'Sunita', 'Gupta', 'sunita.gupta@example.com'),
(5, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com'),
(6, 'Rekha', 'Sharma', 'rekha.sharma@example.com'),
(7, 'Raj', 'Singh', 'raj.singh@example.com'),
(8, 'Seema', 'Agarwal', 'seema.agarwal@example.com'),
(9, 'Ravi', 'Jain', 'ravi.jain@example.com'),
(10, 'Anjana', 'Verma', 'anjana.verma@example.com');

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 1000.00, '2023-01-01'),
(2, 2, 2000.00, '2023-01-02'),
(3, 3, 3000.00, '2023-01-03'),
(4, 4, 4000.00, '2023-01-04'),
(5, 5, 5000.00, '2023-01-05'),
(6, 6, 6000.00, '2023-01-06'),
(7, 7, 7000.00, '2023-01-07'),
(8, 8, 8000.00, '2023-01-08'),
(9, 9, 9000.00, '2023-01-09'),
(10, 10, 10000.00, '2023-01-10');

-------------------------------------------------------------------------------------------------------------------------------

--1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890
INSERT INTO Students VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
--insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments VALUES (11, 1, 4, GETDATE());

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
--modify their email address.
UPDATE Teacher
SET email = 'verma.anjana@example.com'
WHERE teacher_id = 10;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
--an enrollment record based on student and course.
DELETE FROM Enrollments
WHERE student_id = 5 AND course_id = 5;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
--teacher from the respective tables
UPDATE Courses
SET teacher_id = 1
WHERE course_id = 1;

--6. Delete a specific student from the "Students" table and remove all their enrollment records 
--from the "Enrollments" table. Be sure to maintain referential integrity.
DELETE FROM Enrollments
WHERE student_id = 6;

DELETE FROM Payments
WHERE student_id = 6;

DELETE FROM Students
WHERE student_id = 6;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
--payment record and modify the payment amount.
UPDATE Payments
SET amount = 500.00
WHERE payment_id = 7;

--Joins:
--1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
--join the "Payments" table with the "Students" table based on the student's ID.
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
WHERE S.student_id = 1 GROUP BY S.first_name, S.last_name;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;


--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
--without enrollments.
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.student_id IS NULL;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
--courses they are enrolled in. Use JOIN operations between the "Students" table and the 
--"Enrollments" and "Courses" tables.
SELECT S.first_name, S.last_name, C.course_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
--"Teacher" table with the "Courses" table.
SELECT T.first_name, T.last_name, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id;

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
--"Students" table with the "Enrollments" and "Courses" tables.
SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_id = 1;

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
--"Students" table and the "Payments" table and filter for students with NULL payment records.
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.student_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
--enrollment records.
SELECT C.course_name
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.course_id IS NULL;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
--table to find students with multiple enrollment records.
SELECT DISTINCT S.first_name, S.last_name
FROM Students S
JOIN Enrollments e1 ON S.student_id = e1.student_id
JOIN Enrollments e2 ON S.student_id = e2.student_id
WHERE e1.course_id != e2.course_id;
	
--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
--table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT T.first_name, T.last_name
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.teacher_id IS NULL;

--5. Aggregate Functions and Subqueries:
--1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
--aggregate functions and subqueries to achieve this.
SELECT course_id, AVG(student_count) as average_students
FROM (
    SELECT course_id, COUNT(student_id) as student_count
    FROM Enrollments
    GROUP BY course_id
) AS subquery
GROUP BY course_id;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
--payment amount and then retrieve the student(s) associated with that amount.
SELECT student_id, amount
FROM Payments
WHERE amount = (
    SELECT MAX(amount)
    FROM Payments
);

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
--course(s) with the maximum enrollment count.
SELECT course_id, COUNT(*) as student_count
FROM Enrollments
GROUP BY course_id
HAVING COUNT(*) = (
    SELECT MAX(student_count)
    FROM (
        SELECT course_id, COUNT(*) as student_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
--payments for each teacher's courses.
SELECT T.teacher_id, SUM(P.amount) as total_payments, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id
JOIN Enrollments E ON C.course_id = E.course_id
JOIN Payments P ON E.student_id = P.student_id
GROUP BY T.teacher_id, C.course_name;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
--student's enrollments with the total number of courses.
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(course_id) = (
    SELECT COUNT(*)
    FROM Courses
);

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
--find teachers with no course assignments.
SELECT teacher_id
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT teacher_id
    FROM Courses
);

SELECT T.first_name, T.last_name FROM Teacher T LEFT JOIN Courses C ON T.teacher_id=C.teacher_id WHERE C.course_id IS NULL

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
--based on their date of birth.
SELECT AVG(age) as average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) as age
    FROM Students
) AS subquery;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
--records.
SELECT course_id
FROM Courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM Enrollments
);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use 
--subqueries and aggregate functions to sum payments.
SELECT student_id, course_id, total_payments
FROM (
    SELECT E.student_id, E.course_id, SUM(P.amount) as total_payments
    FROM Enrollments E
    JOIN Payments P ON E.student_id = P.student_id
    GROUP BY E.student_id, E.course_id
) AS subquery;

--10. Identify students who have made more than one payment. Use subqueries and aggregate 
--functions to count payments per student and filter for those with counts greater than one.
select p.student_id, count(*) as number_of_payments from payments p
group by p.student_id
having count(*) > 1

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
--student.
SELECT S.first_name, S.last_name, SUM(P.amount) as total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
--count enrollments.
SELECT C.course_name, COUNT(E.student_id) as student_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the 
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT S.first_name, S.last_name, AVG(P.amount) as average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;
