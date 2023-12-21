--1
CREATE DATABASE SIS

--2
--Q1
CREATE TABLE Students (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
dob DATE,
email VARCHAR(50),
phone_number CHAR(10)
);
CREATE TABLE Teacher (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
credits INT,
teacher_id INT FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) on delete cascade
);
CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY (student_id) REFERENCES Students(student_id) on delete cascade,
course_id INT FOREIGN KEY (course_id) REFERENCES Courses(course_id) on delete cascade,
enrollment_date DATE
);
CREATE TABLE Payments (
payment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY (student_id) REFERENCES Students(student_id) on delete cascade,
amount INT,
payment_date DATE,
);

--3.DML 
--Q.a
-- Insert 10 sample records into Students table
INSERT INTO Students VALUES
(1, 'John', 'Cena', '1991-01-15', 'john.cena@email.com', '9934567890'),
(2, 'Jane', 'Smith', '1992-05-20', 'jane.smith@email.com', '9876543210'),
(3, 'Eva', 'Miller', '1991-08-10', 'eva.miller@email.com', '4567890123'),
(4, 'Sam', 'Johnson', '1993-11-25', 'sam.johnson@email.com', '7890123456'),
(5, 'Alice', 'Brown', '1995-03-03', 'alice.brown@email.com', '0123456789'),
(6, 'Bob', 'White', '1989-06-18', 'bob.white@email.com', '3216549870'),
(7, 'Chris', 'Taylor', '1994-09-12', 'chris.taylor@email.com', '6549870123'),
(8, 'Olivia', 'Davis', '1998-02-28', 'olivia.davis@email.com', '9870123456'),
(9, 'Max', 'Moore', '1996-07-07', 'max.moore@email.com', '2105436789'),
(10, 'Sophia', 'Wilson', '1997-12-22', 'sophia.wilson@email.com', '5438769012');

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 3, 1),
(102, 'Web Development Basics', 4, 2),
(103, 'Machine Learning Fundamentals', 5, 1),
(104, 'Database Management', 3, 3),
(105, 'Java Programming', 4, 2),
(106, 'Operating Systems', 3, 3),
(107, 'Basics of Python', 5, 1),
(108, 'Computer Networks', 4, 3),
(109, 'Cybersecurity Basics', 3, 2),
(110, 'Advanced Data Structures', 5, 1);

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2023-01-01'),
(1002, 2, 101, '2023-02-02'),
(1003, 3, 102, '2023-03-03'),
(1004, 4, 103, '2023-04-04'),
(1005, 5, 104, '2023-05-05'),
(1006, 6, 105, '2023-06-06'),
(1007, 7, 106, '2023-07-07'),
(1008, 8, 107, '2023-08-08'),
(1009, 9, 108, '2023-09-09'),
(1010, 10, 109, '2023-10-10');

INSERT INTO Teacher VALUES
(1, 'David', 'Johnson', 'david.johnson@email.com'),
(2, 'Amy', 'Smith', 'amy.smith@email.com'),
(3, 'Michael', 'Williams', 'michael.williams@email.com'),
(4, 'Emily', 'Brown', 'emily.brown@email.com'),
(5, 'Daniel', 'Davis', 'daniel.davis@email.com'),
(6, 'Sophie', 'Jones', 'sophie.jones@email.com'),
(7, 'Ryan', 'Miller', 'ryan.miller@email.com'),
(8, 'Emma', 'Wilson', 'emma.wilson@email.com'),
(9, 'Matthew', 'Taylor', 'matthew.taylor@email.com'),
(10, 'Olivia', 'Moore', 'olivia.moore@email.com');

INSERT INTO Payments VALUES
(10001, 1, 50, '2023-01-01'),
(10002, 2, 75, '2023-02-02'),
(10003, 3, 100, '2023-03-03'),
(10004, 4, 125, '2023-04-04'),
(10005, 5, 150, '2023-05-05'),
(10006, 6, 175, '2023-06-06'),
(10007, 7, 200, '2023-07-07'),
(10008, 8, 225, '2023-08-08'),
(10009, 9, 250, '2023-09-09'),
(10010, 10, 275, '2023-10-10');

--Q.b
--Q1
INSERT INTO Students VALUES
(11, 'John', 'Doe', '1995-08-15', 'john.cena@example.com', '1234567890')
--Q2
INSERT INTO Enrollments VALUES
(1011, 1, 107, '2023-11-30')
--Q3
UPDATE Teacher
SET email='matthew.taylor123@email.com'
where teacher_id=9
--Q4
DELETE Enrollments
where student_id=2 and course_id=101
--Q5
UPDATE Courses 
SET teacher_id=1 
WHERE course_id=108
--Q6
DELETE Students
WHERE student_id=3
--Q7
UPDATE Payments
SET amount=500
WHERE payment_id=10009

--3.Joins
--Q1
SELECT p.student_id,first_name,last_name,count(payment_id) as total_payments from Students as s
inner join Payments as p on s.student_id=p.student_id
where p.student_id=7
group by p.student_id, first_name,last_name
--Q2
SELECT C.course_id,C.COURSE_NAME,COUNT(E.STUDENT_ID) AS STUDENTS_ENROLLED FROM Courses AS C
INNER JOIN Enrollments AS E ON C.course_id=E.course_id
GROUP BY C.course_id,C.course_name
--Q3
SELECT S.student_id,S.first_name,S.last_name, COUNT(course_id) AS COURSES_ENROLLED FROM Students AS S
LEFT JOIN Enrollments AS E ON S.student_id=E.student_id
GROUP BY S.student_id,S.first_name,S.last_name
HAVING COUNT(course_id) = 0
--Q4
SELECT enrollment_id,first_name,last_name,course_name FROM Students AS S
INNER JOIN Enrollments AS E ON S.student_id=E.student_id
INNER JOIN Courses AS C ON C.course_id=E.course_id
GROUP BY enrollment_id,first_name,last_name,course_name
--Q5
SELECT t.teacher_id,t.first_name,t.last_name,c.course_name FROM Courses AS C
INNER JOIN Teacher AS T ON C.teacher_id=T.teacher_id
GROUP BY t.teacher_id,t.first_name,t.last_name,c.course_name
--Q6
SELECT course_name,S.student_id,first_name,last_name,enrollment_date FROM Students AS S
INNER JOIN Enrollments AS E ON E.student_id=S.student_id
INNER JOIN Courses AS C ON C.course_id=E.course_id
GROUP BY course_name,S.student_id,first_name,last_name,enrollment_date
--Q7
SELECT S.student_id,first_name,last_name FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id=P.student_id
WHERE P.student_id IS NULL
--Q8
SELECT C.course_id,course_name FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id=E.course_id
WHERE E.course_id IS NULL
--Q9
SELECT enrollment_id,student_id,COUNT(student_id) AS COURSES_ENROLLED FROM Enrollments
GROUP BY enrollment_id,student_id
HAVING COUNT(student_id)>1
--Q10
SELECT t.teacher_id,t.first_name,t.last_name FROM Courses AS C
RIGHT JOIN Teacher AS T ON C.teacher_id=T.teacher_id
WHERE course_id IS NULL

--AGGREGATES
--Q1
SELECT C.course_id,C.course_name,AVG(ENROLLMENT_COUNT) AS AVERAGE_STUDENTS_ENROLLED FROM Courses AS C
LEFT JOIN (SELECT course_id,COUNT(student_id) AS ENROLLMENT_COUNT FROM Enrollments
GROUP BY course_id
)AS E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name;
--Q2
SELECT * FROM Students AS S
INNER JOIN Payments AS P ON S.student_id=P.student_id
WHERE amount=(SELECT MAX(amount) FROM Payments)
--Q3
SELECT Q.course_id,Q.course_name,Q.TOTAL_ENROLLMENTS FROM 
(SELECT C.course_id,C.course_name,COUNT(enrollment_id) AS TOTAL_ENROLLMENTS FROM Courses AS C
INNER JOIN Enrollments AS E ON C.course_id=E.course_id
GROUP BY C.course_id,C.course_name) AS Q
ORDER BY Q.TOTAL_ENROLLMENTS DESC
--Q4
SELECT Q.teacher_id,Q.first_name,Q.last_name,SUM(amount) AS TOTAL_AMOUNT_FROM_COURSES FROM Payments AS P INNER JOIN(
SELECT enrollment_id,C.teacher_id,T.first_name,T.last_name,C.course_name,E.student_id FROM Teacher AS T
INNER JOIN COURSES AS C ON C.teacher_id=T.teacher_id
INNER JOIN Enrollments AS E ON E.course_id=C.course_id
GROUP BY enrollment_id,C.teacher_id,T.first_name,T.last_name,C.course_name,E.student_id) AS Q ON Q.student_id=P.student_id
GROUP BY Q.teacher_id,Q.first_name,Q.last_name
--Q5
SELECT Q.student_id,Q.first_name,Q.last_name,C.course_name FROM COURSES AS C
INNER JOIN (SELECT S.student_id,course_id,first_name,last_name FROM Students AS S
INNER JOIN Enrollments AS E ON S.student_id=E.student_id) AS Q ON C.course_id=Q.course_id
GROUP BY Q.student_id,Q.first_name,Q.last_name,C.course_name
--Q6
SELECT Q.first_name,Q.last_name FROM(
SELECT T.first_name,T.last_name,C.course_id FROM Teacher AS T
LEFT JOIN Courses AS C ON C.teacher_id=T.teacher_id) AS Q
WHERE Q.course_id IS NULL
--Q7
SELECT AVG(A.AGE) AS AVEREAGE_AGE FROM (
SELECT student_id,first_name,last_name,dob,DATEDIFF(YEAR,DOB,GETDATE()) AS AGE FROM STUDENTS) AS A 
--Q8
SELECT C.course_id,course_name FROM Enrollments AS E
RIGHT JOIN(SELECT * FROM Courses) AS C ON C.course_id=E.course_id
WHERE E.course_id IS NULL
--Q9
SELECT S.student_id,course_name,S.first_name,S.last_name,SUM(amount) AS TOTAL_SPENT FROM Courses AS C
INNER JOIN Enrollments AS E ON E.course_id=C.course_id
INNER JOIN Students AS S ON S.student_id=E.student_id
LEFT JOIN(SELECT * FROM Payments) AS P ON P.student_id=S.student_id
GROUP BY S.student_id,course_name,S.first_name,S.last_name
ORDER BY student_id 
--Q10
SELECT first_name,last_name,TOTAL_PAYMENTS FROM Students AS S
INNER JOIN(
SELECT student_id,COUNT(payment_id) AS TOTAL_PAYMENTS FROM Payments
GROUP BY student_id) AS T ON T.student_id=S.student_id
WHERE TOTAL_PAYMENTS>1
GROUP BY S.student_id,first_name,last_name,T.TOTAL_PAYMENTS
--Q11
SELECT first_name,last_name,SUM(amount) AS TOTAL_PAYMENT FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id= P.student_id
GROUP BY first_name,last_name
--Q12
SELECT course_name,COUNT(E.student_id) AS STUDENTS_ENROLLED FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id=E.course_id
GROUP BY course_name
--Q13
SELECT S.student_id,first_name,last_name,AVG(P.amount) AS AVERAGE_AMOUNT_SPENT FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id=P.student_id
GROUP BY S.student_id,S.first_name,S.last_name


