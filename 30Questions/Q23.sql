-- Write an SQL query to fetch the number of workers for each department in descending order.
SELECT department,COUNT(WORKER_ID) AS WORKER_NUMBER FROM WORKER GROUP BY department ORDER BY DESC 