-- Write an SQL query to fetch the count of employees working in the department 'Admin'.
SELECT count(*) AS EMP_COUNT FROM WORKER WHERE department = 'Admin'