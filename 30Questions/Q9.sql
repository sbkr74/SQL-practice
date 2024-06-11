-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing `i` with `I`.
SELECT REPLACE(FIRST_NAME,'i','I') AS WORKER_NAME FROM practical.worker;