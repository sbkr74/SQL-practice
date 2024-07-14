-- Write an SQL query to print the names of employees having the highest salary in each department.

/* approach
1. first highest salary from each department
    select max(salary) from worker group by department
2 . self join to print the names of employee
*/