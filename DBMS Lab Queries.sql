create database example;
use example;

-- ---------------------------------------------------- Query 1-----------------------------------------------------------------------
create table Employee(
empno varchar(20),
emp_name varchar(20),
dept varchar(20),
salary int,
doj varchar(50),
branch varchar(20)
);
-- ---------------------------------------------------- Query 2-----------------------------------------------------------------------
INSERT INTO Employee(empno, emp_name, dept, salary, doj, branch) Values
('E001', 'Amit', 'Production', 45000, '12-March-2000', 'Bangalore'),
('E002', 'Amit', 'HR', 70000, '3-Kuly-2002', 'Bangalore'),
('E003', 'Sunita', 'Management', 120000, '11-Jan-2001', 'Mysore'),
('E004', 'Suntia', 'IT', 67000, '2-1-Aug-2001', 'Mysore'),
('E005', 'Mahesh', 'Civil', 145000, '20-Sep-2003', 'Mumbai');
-- ---------------------------------------------------- Query 3-----------------------------------------------------------------------
Select*from Employee;
-- ---------------------------------------------------- Query 4-----------------------------------------------------------------------
Select empno, salary from Employee;
-- ---------------------------------------------------- Query 5-----------------------------------------------------------------------
Select avg(salary) from Employee;
-- ---------------------------------------------------- Query 6-----------------------------------------------------------------------
Select count(*) from Employee;
-- ---------------------------------------------------- Query 7-----------------------------------------------------------------------
Select count(distinct emp_name)from Employee;
-- ---------------------------------------------------- Query 8-----------------------------------------------------------------------
Select emp_name, sum(salary), count(*) from Employee group by(emp_name) having sum(salary)>120000;
-- ---------------------------------------------------- Query 9----------------------------------------------------------------------
Select emp_name from Employee order by emp_name;
-- ---------------------------------------------------- Query 10-----------------------------------------------------------------------
Select*from Employee where emp_name='Amit' and salary>50000;
-- ---------------------------------------------------- Query 11-----------------------------------------------------------------------
SELECT CURRENT_DATE;
SELECT EXTRACT(YEAR FROM SYSDATE);
SELECT YEAR(CURDATE())
-- ---------------------------------------------------- Query 12-----------------------------------------------------------------------
SELECT EXTRACT(DAY FROM CURDATE());
-- ---------------------------------------------------- Query 13-----------------------------------------------------------------------
SELECT EXTRACT(MONTH FROM CURDATE());
SELECT MONTH(CURDATE());
-- ---------------------------------------------------- Query 14-----------------------------------------------------------------------
SELECT CURDATE();
SELECT NOW();
-- ---------------------------------------------------- Query 15-----------------------------------------------------------------------
SELECT ASCII('a');
SELECT ASCII('A');
SELECT ASCII('Z');
SELECT ASCII('z');
-- ---------------------------------------------------- Query 16-----------------------------------------------------------------------
SELECT UPPER('bldeasb arts and kcp science college');
-- ---------------------------------------------------- Query 17----------------------------------------------------------------------
SELECT LOWER('WELCOME TO DBMSLAB');
-- ---------------------------------------------------- Query 18-----------------------------------------------------------------------
SELECT REPLACE('HELLO', 'H', 'K');
-- ---------------------------------------------------- Query 19-----------------------------------------------------------------------
SELECT REPLACE('COMPUTER', 'C', 'K');
-- ---------------------------------------------------- Query 20-----------------------------------------------------------------------
SELECT REPLACE('HELLO', 'L', 'A');
-- ---------------------------------------------------- Query 21-----------------------------------------------------------------------
SELECT TRIM(BOTH 'A' FROM 'ANACONDA');
-- ---------------------------------------------------- Query 22-----------------------------------------------------------------------
SELECT SUBSTRING('ANACONDA' FROM 2); 
-- ---------------------------------------------------- Query 23-----------------------------------------------------------------------
SELECT SUBSTRING('ANIL' FROM 2);
-- ---------------------------------------------------- Query 24-----------------------------------------------------------------------
SELECT LEFT('ANITA', LENGTH('ANITA') - 1);
-- ---------------------------------------------------- Query 25-----------------------------------------------------------------------
CREATE TABLE Student1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    admission_no VARCHAR(45) NOT NULL UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    age INT,
    city VARCHAR(25) NOT NULL
);
-- ---------------------------------------------------- Query 26-----------------------------------------------------------------------
CREATE TABLE Fee (
    admission_no VARCHAR(45) NOT NULL,
    course VARCHAR(45) NOT NULL,
    amount_paid INT
    
);
-- ---------------------------------------------------- Query 27-----------------------------------------------------------------------
INSERT INTO Student1 (admission_no, first_name, last_name, age, city)
VALUES (3354,'Luisa', 'Evans', 13, 'Texas'),
(2135, 'Paul', 'Ward', 15, 'Alaska'),
(4321, 'Peter', 'Bennett', 14, 'California'),
(4213,'Carlos', 'Patterson', 17, 'New York'),
(5112, 'Rose', 'Huges', 16, 'Florida'),
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),
(7555,'Antonio', 'Butler', 14, 'New York'),
(8345, 'Diego', 'Cox', 13, 'California');
-- ---------------------------------------------------- Query 28-----------------------------------------------------------------------
INSERT INTO Fee (admission_no, course, amount_paid) VALUES (3354,'Java', 20000),
(7555, 'Android', 22000),
(4321, 'Python', 18000),	
(8345,'SQL', 15000),
(5112, 'Machine Learning', 30000);
-- ---------------------------------------------------- Query 29-----------------------------------------------------------------------
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 INNER JOIN Fee ON Student1.admission_no = Fee.admission_no;
-- ---------------------------------------------------- Query 30-----------------------------------------------------------------------
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 LEFT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;
-- ---------------------------------------------------- Query 31-----------------------------------------------------------------------
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 RIGHT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;
-- ---------------------------------------------------- Query 32-----------------------------------------------------------------------

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
LEFT JOIN Fee ON Student1.admission_no = Fee.admission_no
UNION
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
RIGHT JOIN Fee ON Student1.admission_no = Fee.admission_no;
-- ---------------------------------------------------- Query 33-----------------------------------------------------------------------
CREATE TABLE EMPLOYEE1 (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(50) NOT NULL,
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id INT,
    Designation VARCHAR(50),
    Salary DECIMAL(10,2)
);
-- ---------------------------------------------------- Query 34-----------------------------------------------------------------------
INSERT INTO EMPLOYEE1 (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary)
VALUES 
(101, 'Alice Johnson', '123 Main St', '9876543210', 1, 'HR', 201, 'MANAGER', 75000.00),
(102, 'Bob Smith', '456 Elm St', '8765432109', 2, 'IT', 202, 'ENGINEER', 60000.00),
(103, 'Charlie Brown', '789 Oak St', '7654321098', 3, 'Finance', 203, 'MANAGER', 80000.00);
-- ---------------------------------------------------- Query 34-----------------------------------------------------------------------
SELECT Emp_no, E_name, Salary
FROM EMPLOYEE1
WHERE Designation = 'MANAGER';
-- ---------------------------------------------------- Query 35-----------------------------------------------------------------------
SELECT * FROM EMPLOYEE1 WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE1 WHERE Dept_name = 'IT PROFF');
-- ---------------------------------------------------- Query 36-----------------------------------------------------------------------
ALTER TABLE EMPLOYEE1 ADD Joining_Date DATE;
SELECT * FROM EMPLOYEE1 WHERE YEAR(Joining_Date) > 1981 ORDER BY Designation ASC;
-- ---------------------------------------------------- Query 37-----------------------------------------------------------------------
SELECT Emp_no, E_name, 
       TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) AS Experience, 
       Salary / 30 AS Daily_Salary 
FROM EMPLOYEE1;
-- ---------------------------------------------------- Query 38-----------------------------------------------------------------------
SELECT * FROM EMPLOYEE1 WHERE Designation IN ('CLERK', 'ANALYST');