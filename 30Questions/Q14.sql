-- Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from the Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ("Vipul","Satish");