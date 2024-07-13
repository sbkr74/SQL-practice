-- Write an SQL query to print details of the Workers who are also Managers.
SELECT CONCAT(w.FIRST_NAME,' ',w.LAST_NAME) AS NAME , t.WORKER_TITLE AS TITLE FROM WORKER AS w INNER JOIN TITLE AS t 
ON w.WORKER_ID = t.WORKER_REF_ID WHERE t.WORKER_TITLE = 'Manager'; 