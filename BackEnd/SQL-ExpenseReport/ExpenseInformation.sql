-- STORED PROCEDURE TO WORKING WITH TODOS
CREATE PROCEDURE ExpenseInformation
(
  @mode varchar(100) = 'All', -- All|Month|DateRange
  @TimeFrameStart DATE = NULL, -- Starting TimeFrame 
  @TimeFrameEnd DATE = NULL   -- Ending TimeFrame 
)

AS

CREATE TABLE #EmployeeExpenseInformation (ROWID INT IDENTITY, Mode VARCHAR(30), DateRangeStart DATE, DateRangeEnd DATE, Employee VARCHAR(100), OverExpenseYN BIT, OverNonReportYN BIT, HigherThanAverageYN BIT, SuspeciousYN BIT)
CREATE TABLE #Errors (ROWID INT IDENTITY, Mode VARCHAR(30), [Error Message] VARCHAR(225) )

-- UPDATE
  IF (@mode = 'All')
    BEGIN
      -- Generate the information Requested for all of the data in the table
      SELECT * FROM ExpenseTransactions
      SELECT * FROM DepartmentMetaData
    END
-- READ
  IF (@mode = 'Month')
   BEGIN
      -- Generate the information Requested for that month
        SELECT * FROM ExpenseTransactions
        SELECT * FROM DepartmentMetaData
  END
  
-- UPDATE 
  IF (@mode = 'DateRange')
   BEGIN
      -- Generate the information requested for the 5 day period   
      SELECT * FROM ExpenseTransactions
      SELECT * FROM DepartmentMetaData
   END


   GO
   

/*

Example Stored Procedure Calls

EXEC ExpenseInformation @Mode='All'
EXEC ExpenseInformation @Mode='Month', @TimeFrameStart = '02/01/2021', @TimeFrameEnd = '02/28/2021'
EXEC ExpenseInformation @Mode ='DateRange', @TimeFrameStart = '03/07/2021', @TimeFrameEnd = '03/12/2021'
EXEC ExpenseInformation @Mode ='DateRange', @TimeFrameStart = '03/07/2021', @TimeFrameEnd = '03/13/2021'

*/