-- add column
alter table Employee
add phonenumber varchar(20);

-- drop column
alter table Employee
drop phonenumber varchar(20);

/* Syntax for renaming column
ALTER TABLE table_name
RENAME COLUMN old_name to new_name; */

-- rename column
alter table Employee
rename phonenumber to mobilenumber;

--syntax for renaming a column is different in SQL server.
EXEC sp_rename 'table_name.old_name',  'new_name', 'COLUMN'; 

-- modify datatype

--1. SQL Server / MS Access:
ALTER TABLE table_name
ALTER COLUMN column_name datatype; 

-- 2. My SQL / Oracle (prior version 10G):
ALTER TABLE table_name
MODIFY COLUMN column_name datatype; 

-- 3. Oracle 10G and later:
ALTER TABLE table_name
MODIFY column_name datatype; 

alter table Employee
alter column mobilenumber number;