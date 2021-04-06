
-- CREATE TABLES AND INITIAL DATA
CREATE TABLE Todos([task] varchar(100), [isComplete] bit, [owner] varchar(100));
CREATE TABLE Users ([id] varchar(100), [name] varchar(100), [parent] varchar (100));
INSERT INTO Todos([task], [isComplete], [owner])
VALUES
    ('lauch test', 0, '3'),
    ('write user stories', 0, '2'),
    ('write code', 0, '2'),
    ('test app', 0, '2'),
    ('eat lunch', 0, '1'),
    ('eat dinner', 0, '1'),
    ('eat breakfast', 1, '1');

INSERT INTO Users([id], [name], [parent])
VALUES
    ('3', 0, '3'),
    ('2', 0, '3'),
    ('1', 0, '1');

	