/******************************************************
********Tables to pull from for this report************
*******************************************************
Payroll (EmployeeId INT, Paycode VARCHAR(100), Hours DECIMAL(12, 4), Rate DECIMAL(12, 4), FlatAmount DECIMAL(12, 4))
Employees (Employee VARCHAR(100), EmployeeId INT)
*/

CREATE OR ALTER PROCEDURE PayrollSummary
AS
BEGIN 
SELECT e.employee, p.paycode, CAST(SUM((p.hours * p.rate) + p.flatAmount) AS DECIMAL(10,2)) AS total
FROM payroll AS p LEFT JOIN employees AS e
ON e.employeeId = p.employeeId
GROUP BY p.paycode, e.employee
UNION 
SELECT 'Total' text, '', CAST(SUM((p.hours * p.rate) + p.flatAmount) AS DECIMAL(10, 2)) FROM payroll AS p
END
GO

EXEC PayrollSummary
