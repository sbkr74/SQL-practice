-- Commit statement, changes are made permanent, and you cannot undo them.
-- syntax  
-
BEGIN;
Delete from Employee where EmpID = 7;
Commit;