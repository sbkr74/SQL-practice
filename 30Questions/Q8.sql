-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
-- SQL SERVER
SELECT DISTINCT(DEPARTMENT),LEN(DEPARTMENT) FROM WORKER

-- MySQL
SELECT DISTINCT(DEPARTMENT),LENGTH(DEPARTMENT) FROM WORKER