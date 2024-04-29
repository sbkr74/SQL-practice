/*
SYNTAX:
REVOKE privilege_name
ON object_name
FROM {user_name | PUBLIC | role_name};
*/


-- revoking permission to use select and insert statement  by User1 
REVOKE SELECT, INSERT ON Employees FROM User1;
