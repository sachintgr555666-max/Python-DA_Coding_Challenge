-- ============================================================
-- DAY 34: PROCEDURES & VIEWS
-- ============================================================

CREATE DATABASE Dep;

USE Dep;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(12,2)
);

INSERT INTO Departments VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance');

INSERT INTO Employees VALUES
    (101, 'Arun Kumar', 1),
    (102, 'Priya Sharma', 2),
    (103, 'Kumar Raj', 3);

INSERT INTO Salaries VALUES
    (1, 101, 60000.00),
    (2, 102, 50000.00),
    (3, 103, 55000.00);


-- SQL Question 1: Stored Procedure
-- Task: Fetch employee details by EmployeeID.

DELIMITER $$

CREATE PROCEDURE GetEmployeeByID(IN p_EmployeeID INT)
BEGIN
    SELECT *
    FROM Employees
    WHERE EmployeeID = p_EmployeeID;
END$$

DELIMITER ;

CALL GetEmployeeByID(101);


-- SQL Question 2: Simple View
-- Task: View employee name and department.

CREATE VIEW Employee_Department_View AS
SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;

SELECT * FROM Employee_Department_View;


-- SQL Question 3: Complex View
-- Task: Join Employees, Departments and Salaries.

CREATE VIEW Employee_Salary_View AS
SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    s.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
INNER JOIN Salaries AS s
    ON e.EmployeeID = s.EmployeeID;

SELECT * FROM Employee_Salary_View;
