--Syntax
-- select '*/column_name/agg_fun/' from 'table_name';

-- using * to view whole table with all the columns
 select * from Employee;

 -- using column_name to view table with particular column 
 select EmpID from Employee;
 -- multiple column_name
 select EmpName,DOJ,Salary from Employee;
