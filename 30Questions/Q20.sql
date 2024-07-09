-- Write an SQL query to print details of the Workers who joined in Feb 2021.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2021 AND MONTH(JOINING_DATE) = 2;