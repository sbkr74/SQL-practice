-- write sql query to find 2 maximum salary
-- col: emp_id,emp_name,salary,dept

--using subquery
SELECT MAX(E1.salary) FROM employee e1 WHERE  E1.salary<(SELECT MAX(E2.salary) FROM employee E2)

--CO-RELATED SUBQUERY
SELECT W1.Salary FROM practical.worker W1 WHERE 2 = (SELECT COUNT(DISTINCT(W2.Salary)) FROM practical.worker W2 WHERE W1.Salary<=W2.Salary)