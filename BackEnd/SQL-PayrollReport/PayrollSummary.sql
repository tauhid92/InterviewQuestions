/******************************************************
********Tables to pull from for this report************
*******************************************************
Payroll (EmployeeId INT, Paycode VARCHAR(100), Hours DECIMAL(12, 4), Rate DECIMAL(12, 4), FlatAmount DECIMAL(12, 4))
Employees (Employee VARCHAR(100), EmployeeId INT)
*/

CREATE PROC PayrollSummary
AS

GO

EXEC PayrollSummary