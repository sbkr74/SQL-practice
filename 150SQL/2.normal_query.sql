-- 21. List the Enames those are starting with 'S' and with five characters.
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) = 5 AND ENAME LIKE 'S%'
-- 22. List the emps those are having four chars and third character must be 'r'.
SELECT * FROM EMP WHERE ENAME LIKE '__R_';
-- 23. List the Five character names starting with 'S' and ending with 'H'.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S___H';
-- 24. List the emps who joined in January.
SELECT * FROM EMP WHERE MONTH(HIREDATE) = 01
-- 25. List the emps who joined in the month of which second character is ‘a’.
SELECT * FROM EMP WHERE HIREDATE 
-- 26. List the emps whose Sal is four digit number ending with Zero.
SELECT * FROM EMP WHERE SAL LIKE '___0';
-- 27. List the emps whose names having a character set 'll' together.
SELECT * FROM EMP WHERE ENAME LIKE '%LL%';
-- 28. List the emps those who joined in 80's.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1980;
-- 29. List the emps who does not belong to Deptno 20.
SELECT * FROM EMP WHERE DEPTNO != 20;
-- 30. List all the emps except 'PRESIDENT' & 'MGR' in asc order of Salaries.
SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT','MANAGER');