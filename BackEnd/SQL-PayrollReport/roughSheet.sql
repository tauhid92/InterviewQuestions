SELECT * FROM payroll;
SELECT * FROM employees;

-- #this will return true if data exists
-- select exists(select 1 from contact where id=12)
-- #the above EXISTs will go in CASE statement


-- # if employee id exists in employees return true
-- # if true add data to the payroll table
-- # else nothing and return null

CREATE PROCEDURE checkAndEnterIntoPayroll(INT, VARCHAR(100), DECIMAL(12,4), DECIMAL(12, 4))
                                                                                    
	LANGUAGE plpgsql

	AS

    $$

    BEGIN
		
    	IF NOT FOUND THEN
      		EXISTS (SELECT employeeId FROM emplployees WHERE employeeId = $1)
   		END IF;
                                                                                    
    END; 
                                                                                    
    $$

CREATE PROCEDURE
