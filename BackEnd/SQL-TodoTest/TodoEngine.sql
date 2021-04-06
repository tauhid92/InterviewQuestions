
-- STORED PROCEDURE TO WORKING WITH TODOS
CREATE PROCEDURE TodoEngine
(
  @mode varchar(100) = 'READ', -- CREATE|READ|UPDATE|DELETE
  @userId varchar(100) = NULL
)
AS
-- UPDATE
  IF (@mode = 'CREATE')
    BEGIN
      -- insert a new todo
      SELECT * FROM Todos
    END
-- READ
  IF (@mode = 'READ')
   BEGIN
      -- select all the correct todos
    SELECT * FROM Todos where owner=@userId
  END
  
-- UPDATE 
  IF (@mode = 'UPDATE')
   BEGIN
      -- update a todo
      SELECT * FROM Todos
   END
   
-- DELETE
  IF (@mode = 'DELETE')
    BEGIN
      -- delete a todo, DO NOT REMOVE IT FROM THE DATABASE
      SELECT * FROM Todos
    END
DONE:

-- Try not to change the calls unless you feel it is necessary; the front end team is building against this.
-- You can change the values being passed to the procedure but try to avoid changing the params.
-- mode = READ
-- get all todos that belong to a user and user's children
-- IE, some users have a parent, and that parent can see all the todos of the children
EXEC TodoEngine @userId='1'
EXEC TodoEngine @userId='2'
EXEC TodoEngine @userId='3'
-- mode = CREATE
-- create a new todo
-- EXEC TodoEngine @mode='CREATE', @userId='1', @task='eat second breakfast'
-- mode = UPDATE
-- mark a todo complete
-- EXEC TodoEngine @mode='UPDATE', @userId='1', @taskId='1', @compete='1'
-- mode = DELETE
-- delete a todo, it still needs to be in the db, but is is not returned in the READ mode.
-- EXEC TodoEngine @mode='DELETE', @userId='1', @taskId='1'
