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
/*      or          */
SELECT * FROM EMP WHERE JOB <> 'PRESIDENT' AND JOB != 'MANAGER';
-------------------------------------------------------------------------------
-- 31. List all the emps who joined before or after 1981.
SELECT * FROM EMP WHERE YEAR(HIREDATE) != 1981;
/*      or          */
SELECT * FROM EMP WHERE YEAR(HIREDATE) NOT IN(1981);
/*      or          */
SELECT * FROM EMP WHERE YEAR(HIREDATE) <> 1981;
/*      or          */
SELECT * FROM EMP WHERE YEAR(HIREDATE) NOT LIKE '1981';
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') != '1981';
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') <> '1981';
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') NOT IN ('1981');
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') NOT LIKE '1981';
-- 32. List the emps whose Empno not starting with digit 78.
SELECT * FROM EMP WHERE EMPNO NOT LIKE '78%';
-- 33. List the emps who are working under 'MGR'.
SELECT CONCAT(e1.ENAME,' WORKS FOR ',e2.ENAME) AS WORKING FROM EMP e1 INNER JOIN EMP e2 ON e1.MGR = e2.EMPNO ;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT e1.ENAME || 'WORKS FOR' || e2.ENAME FROM EMP, EMP e2  WHERE e1.MGR = e2.ENAME;
-- 34. List the emps who joined in any year but not belongs to the month of March.
SELECT * FROM EMP WHERE MONTH(HIREDATE) != 03;
/*      or          */
SELECT * FROM EMP WHERE MONTH(HIREDATE) <> 03;
/*      or          */
SELECT * FROM EMP WHERE MONTH(HIREDATE) NOT IN (03);
/*      or          */
SELECT * FROM EMP WHERE MONTH(HIREDATE) NOT LIKE '03';
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char(HIREDATE,'MON') != 'MAR';
SELECT * FROM EMP WHERE to_char(HIREDATE,'MON') <> 'MAR';
SELECT * FROM EMP WHERE to_char(HIREDATE,'MON') NOT IN('MAR');
SELECT * FROM EMP WHERE to_char(HIREDATE,'MONTH') NOT LIKE 'MAR%';
-- 35. List all the Clerks of Deptno 20.
SELECT * FROM EMP WHERE JOB = 'CLERK' AND DEPTNO = 20;
-- 36. List the emps of Deptno 30 or 10 joined in the year 1981.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981 AND (DEPTNO = 30 OR DEPTNO = 10);
/*      or          */
SELECT * FROM EMP WHERE YEAR(HIREDATE) IN(1981) AND (DEPTNO = 30 OR DEPTNO = 10);
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') = '1981' AND (DEPTNO = 30 OR DEPTNO = 10);
SELECT * FROM EMP WHERE to_char(HIREDATE,'YYYY') IN('1981') AND (DEPTNO = 30 OR DEPTNO = 10);
-- 37. Display the details of SMITH.
SELECT * FROM EMP WHERE ENAME = 'SMITH';
-- 38. Display the location of SMITH.
SELECT LOC FROM DEPT AS d INNER JOIN EMP AS e ON d.DEPTNO=e.DEPTNO WHERE ENAME = 'SMITH'; 
/*      or          */
SELECT LOC FROM DEPT AS d,EMP AS e WHERE ENAME = 'SMITH' AND d.DEPTNO=e.DEPTNO; 
-- 39. List the total information of EMP table along with DNAME and Loc ofall the emps Working Under 'ACCOUNTING' & 'RESEARCH' in the asc Deptno.
SELECT e.*,d.DNAME,d.LOC FROM EMP e INNER JOIN DEPT d ON d.DEPTNO=e.DEPTNO WHERE d.DNAME = 'ACCOUNTING' OR d.DNAME = 'RESEARCH';
/*      or          */
SELECT e.*,d.DNAME,d.LOC FROM DEPT AS d,EMP AS e WHERE (d.DNAME = 'ACCOUNTING' OR d.DNAME = 'RESEARCH') AND d.DEPTNO=e.DEPTNO;
-- 40. List the Empno, Ename, Sal, Dname of all the 'MGRS' and 'ANALYST working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc.
SELECT e.EMPNO,e.ENAME,e.SAL,d.DNAME FROM EMP e INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO WHERE e.JOB IN ('ANALYST','MANAGER') AND d.LOC IN ('RANCHI','CHAIBASA') AND (YEAR(CURRENT_DATE())-YEAR(e.HIREDATE))>7 AND e.COMM = 0 ORDER BY d.LOC;
/*      or          */
SELECT e.EMPNO,e.ENAME,e.SAL,d.DNAME FROM EMP e, DEPT d  WHERE e.JOB IN ('ANALYST','MANAGER') AND d.LOC IN ('RANCHI','CHAIBASA') AND (YEAR(CURRENT_DATE())-YEAR(e.HIREDATE))>7 AND e.COMM = 0 AND e.DEPTNO = d.DEPTNO ORDER BY d.LOC;