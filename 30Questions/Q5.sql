-- Write an SQL query to find the position of the alphabet ('a') in the first name column 'Amitabh' from the Worker table.
-- In sql server
SELECT CHARINDEX('a',FIRST_NAME) AS WORKER_NAME FROM practical.worker WHERE FIRST_NAME = 'Amitabh';

-- In MySQL
SELECT locate('a',FIRST_NAME) AS WORKER_NAME FROM practical.worker WHERE FIRST_NAME = 'Amitabh';