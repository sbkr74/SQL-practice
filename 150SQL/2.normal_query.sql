-- 21. List the Enames those are starting with 'S' and with five characters.
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) = 5 AND ENAME LIKE 'S%'
-- 22. List the emps those are having four chars and third character must be 'r'.
SELECT * FROM EMP WHERE ENAME LIKE '__R_';
/*      or          */
SELECT * FROM EMP WHERE LENGTH(ENAME) = 4 AND ENAME LIKE '___R%';
-- 23. List the Five character names starting with 'S' and ending with 'H'.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S___H';
/*      or          */
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) = 5 AND ENAME LIKE 'S%H';
-- 24. List the emps who joined in January.
SELECT * FROM EMP WHERE MONTH(HIREDATE) = 01;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char (hiredate,'mon') = 'JAN';
-- 25. List the emps who joined in the month of which second character is ‘a’.
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char (hiredate,'mon') LIKE '_A_';
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char (hiredate,'mon') LIKE '_A%';
-- 26. List the emps whose Sal is four digit number ending with Zero.
SELECT * FROM EMP WHERE SAL LIKE '___0';
/*      or          */
SELECT * FROM EMP WHERE LENGTH(SAL) = 4 AND SAL LIKE '%0';
-- 27. List the emps whose names having a character set 'll' together.
SELECT * FROM EMP WHERE ENAME LIKE '%LL%';
-- 28. List the emps those who joined in 80's.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1980;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char (hiredate,'yy') LIKE '80%';
-- 29. List the emps who does not belong to Deptno 20.
SELECT * FROM EMP WHERE DEPTNO != 20;
/*      or          */
SELECT * FROM EMP WHERE DEPTNO NOT IN (20);
/*      or          */
SELECT * FROM EMP WHERE DEPTNO <> (20);
/*      or          */
SELECT * FROM EMP WHERE DEPTNO NOT LIKE '20';
-- 30. List all the emps except 'PRESIDENT' & 'MGR' in asc order of Salaries.
SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT','MANAGER');
/*      or          */
SELECT * FROM EMP WHERE JOB NOT LIKE 'PRESIDENT' AND JOB NOT LIKE 'MANAGER';


-------------------------------------------------------------------------------
-- 31. List all the emps who joined before or after 1981.

-- 32. List the emps whose Empno not starting with digit78.

-- 33. List the emps who are working under ‘MGR’.

-- 34. List the emps who joined in any year but not belongs to the month of March.

-- 35. List all the Clerks of Deptno 20.

-- 36. List the emps of Deptno 30 or 10 joined in the year 1981.

-- 37. Display the details of SMITH.

-- 38. Display the location of SMITH.

-- 39. List the total information of EMP table along with DNAME and Loc ofall the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.

-- 40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc.