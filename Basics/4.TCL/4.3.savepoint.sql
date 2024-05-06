/*
In MySQL, you can use transactions, but once a transaction is started, you can only roll it back or commit it; 
you cannot set intermediate savepoints within the transaction to which you can later roll back. 
If you want to roll back to a certain point within a transaction, you'll need to structure your code accordingly, 
possibly by using conditional logic or by breaking the transaction into smaller transactions.
*/
START TRANSACTION;

-- Perform multiple operations
INSERT INTO your_table (column1, column2) VALUES ('value1', 'value2');
UPDATE another_table SET column3 = 'new_value' WHERE column4 = 'some_condition';

-- Set conditions to determine rollback or commit
SET @rollback_needed := 0; -- Set to 1 if rollback is needed
SET @commit_needed := 0; -- Set to 1 if commit is needed

-- Check conditions
IF @rollback_needed = 1 THEN
    -- Rollback the transaction
    ROLLBACK;
ELSEIF @commit_needed = 1 THEN
    -- Commit the transaction
    COMMIT;
ELSE
    -- Additional operations if no rollback or commit needed
    -- For example:
    UPDATE additional_table SET column5 = 'another_value';
    -- Then commit the transaction
    COMMIT;
END IF;
--##################################################################################################################--
START TRANSACTION;
INSERT INTO practical.Emp (EmpID, EmpName, DeptID, Salary, Bonus, Gender, City, DOJ)
VALUES
(1, 'John Doe', 101, 50000, 5000, 'Male', 'New York', '2022-01-15');
INSERT INTO practical.Emp (EmpID, EmpName, DeptID, Salary, Bonus, Gender, City, DOJ)
VALUES
(5, 'Sophia Nguyen', 101, 51000, 5800, 'Female', 'Boston', '2021-10-20');
INSERT INTO practical.Emp (EmpID, EmpName, DeptID, Salary, Bonus, Gender, City, DOJ)
VALUES
(2, 'Emily Brown', 101, 52000, 5500, 'Female', 'Houston', '2022-03-05');

SAVEPOINT checkpoint1;

DELETE FROM practical.Emp WHERE EmpID = 5;

SAVEPOINT checkpoint2;

update practical.Emp set Salary = 50000 where EmpID = 2;

ROLLBACK TO SAVEPOINT checkpoint1;

COMMIT;

