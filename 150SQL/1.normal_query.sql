-- 1. Display all the information of the EMP table?
SELECT * FROM EMP;
/* PRACTICALLY ALL COLUMNS NAME SHOULD BE USED */
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO FROM EMP;
-- 2. Display unique Jobs from EMP table?
SELECT DISTINCT(JOB) FROM EMP;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT UNIQUE JOB FROM EMP;
-- 3. List the emps in the asc order of their Salaries?
SELECT * FROM EMP ORDER BY SAL ASC;
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP ORDER BY DEPTNO ASC, JOB DESC;
-- 5. Display all the unique job groups in the descending order?
SELECT DISTINCT(JOB) FROM EMP ORDER BY JOB DESC;
-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM EMP WHERE JOB = 'MANAGER';
/* Subquery */
SELECT * FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- 7. List the emps who joined before 1981.
SELECT * FROM EMP WHERE HIREDATE < ('1981-01-01');
/*Using DATE functions*/
SELECT * FROM EMP WHERE YEAR(HIREDATE) < 1981;
-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT EMPNO,ENAME,SAL,(SAL/30) AS DailySal,(SAL*12) AS Annsal FROM EMP ORDER BY Annsal;
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT EMPNO, ENAME, JOB, HIREDATE, YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT EMPNO, ENAME, JOB, HIREDATE, MONTHS_BETWEEN(SYSDATE,HIREDATE) AS EXP FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT EMPNO,ENAME,SAL,YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE MGR = 7369;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT EMPNO, ENAME, SAL, MONTHS_BETWEEN(SYSDATE,HIREDATE) AS EXP FROM EMP WHERE MGR = 7369;

--------------------------------------------------------------------------------------------------------
-- 11. Display all the details of the emps whose Comm. Is more than their Sal.

-- 12. List the emps in the asc order of Designations of those joined after the second half of 1981.

-- 13. List the emps along with their Exp and Daily Sal is more than Rs.100.

-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.

-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.

-- 16. List the emp who are working for the Deptno 10 or20.

-- 17. List the emps who are joined in the year 81.

-- 18. List the emps who are joined in the month of Aug 1980.

-- 19. List the emps Who Annual sal ranging from 22000 and 45000.

-- 20. List the Enames those are having five characters in their Names.