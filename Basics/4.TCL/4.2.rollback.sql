 -- STEPS will be here
 BEGIN TRANSACTION;
 INSERT INTO sample.Employee (EmpID, EmpName, DeptID, Salary, Bonus, Gender, City, DOJ)
VALUES(11, 'John wICK', 777, 500000, 75000, 'Male', 'New York', '2014-01-15');
update sample.Employee
set Salary = 50000
where DeptID = 101;
ROLLBACK TRANSACTION;