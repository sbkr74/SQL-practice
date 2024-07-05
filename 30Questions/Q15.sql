-- Write an SQL query to print details of Workers with DEPARTMENT name as 'Admin'.
SELECT * FROM WORKER WHERE DEPARTMENT IN ('Admin');
--another query
SELECT * FROM WORKER WHERE DEPARTMENT LIKE 'Admin%';