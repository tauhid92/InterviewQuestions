DROP TABLE IF EXISTS payroll;
CREATE TABLE payroll (employeeId INT, paycode VARCHAR(100), hours DECIMAL(12, 4), rate DECIMAL(12, 4), flatAmount DECIMAL(12, 4));
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (employeeId INT, employee VARCHAR(100));


INSERT INTO employees
    (employeeId, employee)
VALUES
    (001, 'John Doe'),
    (002, 'Jane Schmidt'),
    (003, 'Matt Smith'),
    (004, 'Chase Jones'),
    (005, 'David Evans');
   
CREATE OR ALTER PROCEDURE checkAndEnter @p_id int, @p_code varchar(100), @p_hours decimal(12, 4), @p_rate decimal(12, 4), @p_flatAmount decimal(12, 4)
	AS
	IF EXISTS (SELECT*FROM employees e WHERE e.employeeId = @p_id)
		BEGIN
			INSERT INTO payroll (employeeId, paycode, hours, rate, flatAmount)
				VALUES(@p_id, @p_code, @p_hours, @p_rate, @p_flatAmount)
	END

GO;
    

EXEC checkAndEnter 001, 'Regular', 11.25, 15.21, 0.00;
EXEC checkAndEnter 002, 'Regular', 9.00, 15.00, 0.00;
EXEC checkAndEnter 002, 'Regular', 8.00, 15.00, 0.00;
EXEC checkAndEnter 001, 'Overtime', 3.86, 22.82, 0.00;
EXEC checkAndEnter 005, 'Salary', 0.00, 0.00, 2133.67;
EXEC checkAndEnter 002, 'Regular', 8.00, 15.00, 0.00;
EXEC checkAndEnter 003, 'Regular', 7.60, 18.50, 0.00;
EXEC checkAndEnter 002, 'Regular', 8.00, 15.00, 0.00;
EXEC checkAndEnter 004, 'Bonus', 0.00, 0.00, 500.00;
EXEC checkAndEnter 003, 'Regular', 10.76, 18.50, 0.00;
EXEC checkAndEnter 001, 'Regular', 6.50, 15.21, 0.00;
EXEC checkAndEnter 004, 'Regular', 8.67, 19.25, 0.00;
EXEC checkAndEnter 001, 'Bonus', 0.00, 0.00, 250.00;
EXEC checkAndEnter 004, 'Regular', 10.21, 19.25, 0.00;
EXEC checkAndEnter 004, 'Regular', 9.33, 19.25, 0.00;
EXEC checkAndEnter 002, 'Overtime', 5.89, 22.50, 0.00;
EXEC checkAndEnter 003, 'Regular', 8.25, 18.50, 0.00;
EXEC checkAndEnter 001, 'Regular', 12.75, 15.21, 0.00;
EXEC checkAndEnter 001, 'Regular', 9.50, 15.21, 0.00;
EXEC checkAndEnter 002, 'Regular', 7.00, 15.00, 0.00;

SELECT * FROM payroll;
SELECT * FROM employees;
