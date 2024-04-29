-- SYNTAX
/*GRANT privilege_name
ON object_name
TO {user_name | PUBLIC | role_name}
[WITH GRANT OPTION];
*/
-- granting select and insert statement can be executed by User1 
GRANT SELECT, INSERT ON Employees TO User1;
-- Learn about execute 
-- In my opinion it let role to execute a particular procedures
GRANT EXECUTE ON Procedure1 TO Role1;

/*
Basic privileages
SELECT: Allows users to read data from a table.
INSERT: Allows users to insert new rows into a table.
UPDATE: Allows users to modify existing rows in a table.
DELETE: Allows users to remove rows from a table.
EXECUTE: Allows users to execute stored procedures or functions.
REFERENCES: Allows users to create foreign key constraints referencing columns in a table.
ALL: Grants all available privileges on a specified object.
*/


